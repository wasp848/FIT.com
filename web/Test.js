


var newaddr = document.getElementById("newaddr");
var newaddr1 = document.getElementById("newaddr1");
var newaddr2 = document.getElementById("newaddr2");
var newaddr3 = document.getElementById("newaddr3");
var exaddr1 = document.getElementById("exaddr1");
var exaddr2 = document.getElementById("exaddr2");
var newcrd1 = document.getElementById("newcrd1");
var newcrd2 = document.getElementById("newcrd2");
var newcrd3 = document.getElementById("newcrd3");
var excrd1 = document.getElementById("excrd1");
var excrd2 = document.getElementById("excrd2");
var newcrd = document.getElementById("newcrd");


var checkExAddr = document.getElementById("checkExAddr");
var checkOtherAddr = document.getElementById("checkOtherAddr");
var checkExCrd = document.getElementById("checkExCrd");
var checkOtherCrd = document.getElementById("checkOtherCrd");
var checkCOD = document.getElementById("checkCOD");


checkCOD.addEventListener('click', function(){
    myFunction4();
});
checkOtherCrd.addEventListener('click', function(){
    myFunction3();
});
checkExCrd.addEventListener('click', function(){
    myFunction2();
});
checkOtherAddr.addEventListener('click', function(){
    myFunction1();
});
checkExAddr.addEventListener('click', function(){
    myFunction();
});


function checkOtherAddr(){
    newaddr.disabled = false;
    newaddr1.disabled = false;
    newaddr2.disabled = false;
    newaddr3.disabled = false;
    exaddr1.disabled = true;
    exaddr2.disabled = true;
 }
 function checkExCrd(){
    newcrd.disabled = true;
    newcrd1.disabled = true;
    newcrd2.disabled = true;
    newcrd3.disabled = true;
    excrd1.disabled = false;
    excrd2.disabled = false;
 }
 function checkOtherCrd(){
    newcrd.disabled = false;
    newcrd1.disabled = false;
    newcrd2.disabled = false;
    newcrd3.disabled = false;
    excrd1.disabled = true;
    excrd2.disabled = true;
 }
 function checkCOD(){
    newcrd.disabled = true;
    newcrd1.disabled = true;
    newcrd2.disabled = true;
    newcrd3.disabled = true;
    excrd1.disabled = true;
    excrd2.disabled = true;
 }
 


 function myFunction(){
    newaddr.disabled = true;
    newaddr1.disabled = true;
    newaddr2.disabled = true;
    newaddr3.disabled = true;
    exaddr1.disabled = false;
    exaddr2.disabled = false;
 }
 function myFunction1(){
    newaddr.disabled = false;
    newaddr1.disabled = false;
    newaddr2.disabled = false;
    newaddr3.disabled = false;
    exaddr1.disabled = true;
    exaddr2.disabled = true;
 }
 function myFunction2(){
    newcrd.disabled = true;
    newcrd1.disabled = true;
    newcrd2.disabled = true;
    newcrd3.disabled = true;
    excrd1.disabled = false;
    excrd2.disabled = false;
 }
 function myFunction3(){
    newcrd.disabled = false;
    newcrd1.disabled = false;
    newcrd2.disabled = false;
    newcrd3.disabled = false;
    excrd1.disabled = true;
    excrd2.disabled = true;
 }
 function myFunction4(){
    newcrd.disabled = true;
    newcrd1.disabled = true;
    newcrd2.disabled = true;
    newcrd3.disabled = true;
    excrd1.disabled = true;
    excrd2.disabled = true;
 }
