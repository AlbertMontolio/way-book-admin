// ### code is repeated, please DRY

const userDivisionBtns = document.querySelectorAll(".users-index-page .js-division-btn-users");
let allBtn = document.querySelector(".js-all-division-btn-users");
let allUsers = document.querySelectorAll(".user-wrapper");

userDivisionBtns.forEach((divisionBtn) => {
	divisionBtn.addEventListener("click", (event) => {
		let divisionId = event.target.dataset.divisionBtnId;

		let divisionUsers = document.querySelectorAll(`.js-user-wrapper-${divisionId}`);

		allUsers.forEach((user) => {
			user.classList.add("hide");
		});

		divisionUsers.forEach((user) => {
			user.classList.remove("hide");
		});

		userDivisionBtns.forEach((divisionBtn) => {
			divisionBtn.classList.remove("division-green");
		});
		userDivisionBtns.forEach((divisionBtn) => {
			divisionBtn.classList.add("division-black");
		});

		allBtn.classList.remove("division-green");
		allBtn.classList.add("division-black");

		event.target.classList.remove("division-black");
		event.target.classList.add("division-green");
	});
});

allBtn.addEventListener("click", (event) => {
	userDivisionBtns.forEach((divisionBtn) => {
		divisionBtn.classList.remove("division-green");
	});
	userDivisionBtns.forEach((divisionBtn) => {
		divisionBtn.classList.add("division-black");
	});
	event.target.classList.remove("division-black");
	event.target.classList.add("division-green");

	allUsers.forEach((user) => {
		user.classList.remove("hide");
	});

});
