let newUserHeader = document.getElementById("js-new-user-header");
let newFormWrapper = document.getElementById("js-new-form-wrapper");


newUserHeader.addEventListener("click", (event) => {
	newFormWrapper.classList.toggle("final");
});