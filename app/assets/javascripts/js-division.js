const divisionBtns = document.querySelectorAll(".js-division-btn");
const divisionWrappers = document.querySelectorAll(".division-wrapper");

console.log(divisionWrappers);

const getDivisionId = (divisionBtn) => {
	 return divisionBtn.id;
}

const findDivision = (id) => {
	return document.getElementById(`content-division-id-${id}`);
}

const addHideClassToAll = () => {
	console.log("hiding everything");
	console.log(divisionWrappers);
	divisionWrappers.forEach((divisionWrapper) => {
		divisionWrapper.classList.add("hide");
	});
}

const removeHideClass = (division) => {
	division.classList.remove("hide");
}

divisionBtns.forEach((divisionBtn) => {
	divisionBtn.addEventListener("click", (event) => {
		let divisionId = getDivisionId(event.target);
		let division = findDivision(divisionId);
		addHideClassToAll();
		removeHideClass(division);
	});
});
