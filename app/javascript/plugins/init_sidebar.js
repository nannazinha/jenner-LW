const initSidebar = () => {
 $(document).ready(function () {
          $("#sidebar").mCustomScrollbar({
              theme: "minimal"
          });

          $('#sidebarCollapse').on('click', function () {
            const sidebar = document.getElementById("sidebar")
            if (sidebar.classList.contains('active')){
                sidebar.classList.remove('active')
            }else {
             sidebar.classList.add('active')
            }


          });



      });
}

export {initSidebar};
