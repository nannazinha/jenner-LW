
const initSidebar = () => {
 $(document).ready(function () {
          $("#sidebar").mCustomScrollbar({
              theme: "minimal"
          });

          $('#sidebarCollapse').on('click', function () {
              $('#sidebar').addClass('active');
              $('.overlay').addClass('active');
              $('.collapse.in').toggleClass('in');
              $('a[aria-expanded=true]').attr('aria-expanded', 'false');
          });

          $('#dismiss, .overlay').on('click', function () {
              $('#sidebar').removeClass('active');
              $('.overlay').removeClass('active');
          });


      });
}

export {initSidebar};
