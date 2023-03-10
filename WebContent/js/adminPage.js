const board_manage = document.querySelector('.board_manage');
const submenu = document.querySelector('.submenu');

board_manage.addEventListener('click', () => {
    submenu.classList.toggle('active');
});

function memPopup() {
	let url = "/TeamProject/nbAdmin/memUpdatePopup.jsp";
	let	name = "popup test";
	var option = "width=500, height=500, top=100, left=200, location=yes"
		window.open(url,name,option);
}