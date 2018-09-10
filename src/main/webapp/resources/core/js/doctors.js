// $(document).ready(function () {
//
//         ajaxGet();
//
// // DO GET
//
//     }
// )



// function ajaxGet() {
//     $('#customerTable tbody').html('');
//     $.ajax({
//         type: "GET",
//         url: "../api/doctor", //window.location, // + "api/doctor",
//         success: function (result) {
//             $.each(result, function (i, customer) {
//
//                 var customerRow = '<tr>' +
//                     '<td>' + customer.id + '</td>' +
//                     '<td>' + customer.name.toUpperCase() + '</td>' +
//                     '<td>' + customer.age + '</td>' +
//                     '<td>' + customer.phone + '</td>' +
//                     '<td> <input type="button" value="EDIT" onclick="editClicked(' + customer.id + ')"/></td>' +
//                     '<td> <input type="button" value="DELETE" onclick="deleteClicked(' + customer.id + ')"></td>' +
//                     '</tr>';
//
//                 $('#customerTable tbody').append(customerRow);
//
//             });
//         },
//
//         error: function (e) {
//             alert("ERROR: ", e);
//             console.log("ERROR: ", e);
//         }
//     });
// }


function editClicked(id) {
    location = "../doctor/edit?id=" + id;
}

// function deleteClicked(id) {
//
//     var result = confirm("Do you really want to delete this doctor?");
//     if (result) {
//         deleteDoctor(id);
//     }
// }


function deleteClicked(id) {

    var result = confirm("Do you really want to delete this doctor)))?");
    if (result) {

        $.ajax({
            url: "../doctor?id="+id,
            type: 'DELETE',
            success: function (result) {
                location.reload();
            }
        });
    }
    return false;
}

// function deleteDoctor(id) {
//
//        $.ajax({
//         url: "../doctor?id=" + id, // "../api/doctor?id=" + id,
//         type: 'DELETE',
//         success: function (result) {
//            // ajaxGet();
//             alert("Hated doctor was successfully deleted!!!");
//
//             redirectFunc();
//             //window.location.reload("./list");
//            // location = "./list";
//         }
//         //data: data,
//     });
// }
//
// //TODO - redirectFunc?
//
// function redirectFunc(){
//     var link = document.createElement('a');
//     // set your page url
//     link.href = "./list";
//     document.body.appendChild(link);
//     link.click();
// }


function addNewDoctor() {
    location = "../doctor/edit";
}