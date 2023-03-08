const board_manage = document.querySelector('.board_manage');
const submenu = document.querySelector('.submenu');

board_manage.addEventListener('click', () => {
    submenu.classList.toggle('active');
});
