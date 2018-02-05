// $(document).ready(function () {
//
//         ajaxGet();
//
// // DO GET
//         function ajaxGet() {
//             var idParameter = getUrlParameter('id');
//             $.ajax({
//                 type: "GET",
//                 url: "../api/doctor?id=" + idParameter,
//                 success: function (result) {
//                     document.getElementById("id_id").value = result.id;
//                     document.getElementById("name_id").value = result.name;
//                     document.getElementById("age_id").value = result.age;
//                     document.getElementById("phone_id").value = result.phone;
//                 },
//
//                 error: function (e) {
//                     alert("ERROR: ", e);
//                     console.log("ERROR: ", e);
//                 }
//             });
//         }
//     }
// )

// // DO POST
// function postEditedDoctor() {
//
//     if (dataValidationForm(document.getElementById("edit_doctor_form"))) {
//
//         var serialize = $('#edit_doctor_form').serialize();
//         $.post("../doctor/edit", serialize, function (data) {//("../api/doctor", serialize, function (data) {
//
//             var arr_from_json = JSON.parse( data );
//
//             if (arr_from_json.status == "ok")
//                 location = '../doctor/list';
//             else
//                 alert(arr_from_json.status+" : "+arr_from_json.message);
//         });
//     }
//     else {
//         alert("ERROR: Incorrect Input Data");
//     }
// }

function backToDoctorsList() {
    location ='../doctor/list';
}

function backToClientsList() {
    location ='../client/list';
}

function backToPetsList() {
    location ='../pet/list';
}

function backToAppointmentsList() {
    location ='../appointment/list';
}

function redirectFunc(){
    var link = document.createElement('a');
    // set your page url
    link.href = "./list";
    document.body.appendChild(link);
    link.click();
}


// function getUrlParameter(sParam) {
//     var sPageURL = decodeURIComponent(window.location.search.substring(1)),
//         sURLVariables = sPageURL.split('&'),
//         sParameterName,
//         i;
//
//     for (i = 0; i < sURLVariables.length; i++) {
//         sParameterName = sURLVariables[i].split('=');
//
//         if (sParameterName[0] === sParam) {
//             return sParameterName[1] === undefined ? true : sParameterName[1];
//         }
//     }
// };