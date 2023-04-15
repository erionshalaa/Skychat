
 const links = document.querySelectorAll('.scroll');

     links.forEach(link => {
       link.addEventListener('click', (e) => {
         e.preventDefault();

         const href = link.getAttribute('href');
         const target = document.querySelector(href);

         target.scrollIntoView({
           behavior: 'smooth'
      });
   });
});


setTimeout(function(){
	$('.loader_bg').fadeToggle();},1500);
	
	
	
	
