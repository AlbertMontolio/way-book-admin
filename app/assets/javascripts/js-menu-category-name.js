const menuCategoryNames = document.querySelectorAll(".js-menu-category-name");

console.log(menuCategoryNames);

menuCategoryNames.forEach((menuCategoryName) => {
	menuCategoryName.addEventListener("click", (event) => {
		let categoryId = event.target.id;
		let categoryName = document.getElementById(`division-category-name-id-${categoryId}`);
		console.log(categoryName);
		let companySkillsBlock = document.querySelector(".company_skills-block");
		categoryName.scrollIntoView();
		scrollTop = categoryName.scrollTop;
		scrollHeight = categoryName.scrollHeight;
		console.log(scrollTop);
		console.log(scrollHeight);
		// window.scrollY(100);
		window.scrollBy(0, -100);
		// window.scrollTo(scrollHeight, scrollHeight + 100);

		// console.log(companySkillsBlock.offsetTop);
		// console.log(categoryName.offsetTop);
		// console.log(companySkillsBlock.offsetTop);
		// console.log(categoryName.offsetTop);

		// topPos = element.offsetTop;
		// categoryName.offsetTop = 100;
		// categoryName.scrollTop = 60;
		// console.log(categoryName.scrollTop);
		// console.log(companySkillsBlock);
		// companySkillsBlock.scrollTop;
		// let division = findDivision(divisionId);
		// addHideClassToAll();
		// removeHideClass(division);
		// removeAllBtnActiveGreen();
		// addBtnActiveGreen(event.target);
	});
});