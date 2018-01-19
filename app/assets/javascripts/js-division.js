const divisionBtns = document.querySelectorAll(".js-division-btn");
const divisionWrappers = document.querySelectorAll(".division-wrapper");
const divisionNames = document.querySelectorAll(".divisions-menu .division-name");

const findDivision = (id) => {
	return document.getElementById(`content-division-id-${id}`);
}

const addHideClassToAll = () => {
	divisionWrappers.forEach((divisionWrapper) => {
		divisionWrapper.classList.add("hide");
	});
}

const removeHideClass = (division) => {
	division.classList.remove("hide");
}

const removeAllBtnActiveGreen = () => {
	divisionNames.forEach((divisionName) => {
		divisionName.classList.remove("btn-active-green");
	});
}

const addBtnActiveGreen = (clickedDivisionName) => {
	clickedDivisionName.classList.add("btn-active-green");
}

divisionBtns.forEach((divisionBtn) => {
	divisionBtn.addEventListener("click", (event) => {
		let divisionId = event.target.id;
		let division = document.getElementById(`content-division-id-${divisionId}`);
		addHideClassToAll();
		removeHideClass(division);
		removeAllBtnActiveGreen();
		addBtnActiveGreen(event.target);
	});
});
