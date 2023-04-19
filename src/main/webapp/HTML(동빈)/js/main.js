var current = 0;
// var prev = document.getElementById("prev");
// var next = document.getElementById("next");

slideitem(current);
// prev.onclick = prevSlide;
// next.onclick = nextSlide;

// prev.onclick = prevSlide;
// next.onclick = nextSlide;


function slideitem(){
    var slides = document.querySelectorAll(".slide_item > a > img");
    for(let i=0; i<slides.length; i++){
        slides[i].style.display = "none";
    }
    current++;
    if(current > slides.length)
        current = 1;
        slides[current - 1 ].style.display = "block";
        setTimeout(slideitem, 5000);
}

// function prevSlide(){
//     if(current > 0){
//         current = current -1;
//     }else{
//         current = slides1.length -1;
//     }
//     slideitem(current);
// }
// function nextSlide(){
//     if(current < slides1.length - 1){
//         current = current + 1;
//     }else{
//         current = 0;
//     }
//     slideitem(current);
// }
