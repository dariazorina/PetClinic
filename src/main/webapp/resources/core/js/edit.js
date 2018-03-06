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

function backToPetsList(client_id) {
    location = '../client?id='+client_id;
   // location ='../pet/list';
}

function backToAppointmentsList(pet_id) {
    location = '../appointment/edit?pet_id='+pet_id;
    //location ='../appointment/list';
}

function redirectFunc(){

    location.reload();

    // var link = document.createElement('a');
    // // set your page url
    // link.href = "./list";
    // document.body.appendChild(link);
    // link.click();
}

function makeAnAppointment(client_id, pet_id) {
   // location ='../appointment/edit?pet_id=' + pet_id;

    location = "../appointment/edit?client_id=" + client_id + "&pet_id=" + pet_id;
}

function backToPetsEdit(client_id, pet_id) {
    location = "../pet/edit?client_id=" + client_id + "&pet_id=" + pet_id;
}