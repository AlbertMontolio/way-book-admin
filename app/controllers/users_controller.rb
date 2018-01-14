require 'open-uri'

class UsersController < ApplicationController
	def index
		user_token = session["authentication_token"]
	    current_user_email = current_user.email

	  	url = "http://localhost:3000/api/v1/users?user_email=#{current_user_email}&user_token=#{user_token}"

	  	html_file = open(url).read
	  	json_response = JSON.parse(html_file)

	  	@emails = json_response

	  	@user = User.new
	end

	def create
		user_token = session["authentication_token"]
	    current_user_email = current_user.email

	  	api_url = "http://localhost:3000/api/v1/users?user_email=#{current_user_email}&user_token=#{user_token}"

	  	html_file = open(api_url).read
	  	json_response = JSON.parse(html_file)
	  	emails = json_response

	  	emails = emails.map { |email_hash| email_hash["email"] }

	  	email = user_params[:email]
	  	password = encrypt_password(user_params[:password])

	  	is_included = emails.include? email

	  	if is_included
	  		# render whatever
	  	else
	  		user = User.new(email: email, password: password)
	  		user.save
	  	
		  	create_url = "http://localhost:3000/api/v1/users?user_email=#{current_user_email}&user_token=#{user_token}"
		  	# make post request to the other db and save it
		  	response = HTTParty.post(create_url.to_str, 
		  	    body: { 
		  	    	email: email, 
		  	        password: password, 
		  	    }.to_json,
		  	    :headers => { 
		  	    	'Content-Type' => 'application/json',
		  	    }
		  	)
		  	# binding.pry
		  	JSON.parse(response.body)
		end
		redirect_to root_path
	end

	private

	def user_params
	  params.require(:user).permit(:email, :password)

	end

	def encrypt_password(str)
	  cipher_salt1 = 'some-random-salt-'
	  cipher_salt2 = 'another-random-salt-'
	  cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
	  cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
	  encrypted = cipher.update(str) + cipher.final
	  encrypted.unpack('H*')[0].upcase
	end
end
