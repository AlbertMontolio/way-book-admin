class SessionsController < Devise::SessionsController
	def create
		super
		user_info = sign_user_into_api
		session['authentication_token'] = user_info["authentication_token"]
	end

	private

	def sign_user_into_api
		# after devise sign in, we have a params with [:user][:email], [:user][:password]
		email = user_params[:email]
		password = encrypt_password(user_params[:password])

		api_url = 'http://localhost:3000/users/sign_in.json'
		# .json this is to force devise to send us a json response, instead of the normal redirect 
		response = HTTParty.post(
			api_url, body: {
				user: {email: email, password: password}
			}
		)
		JSON.parse(response.body)
	end

	def encrypt_password(str)
	  cipher_salt1 = 'some-random-salt-'
	  cipher_salt2 = 'another-random-salt-'
	  cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
	  cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
	  encrypted = cipher.update(str) + cipher.final
	  encrypted.unpack('H*')[0].upcase
	end

	def user_params
		params.require(:user).permit(:email, :password)
	end 

end