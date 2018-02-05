
function editClicked(id) {
    location = "../appointment/edit?id=" + id;
}

function deleteClicked(id) {

    var result = confirm("Do you really want to delete this appointment?");
    if (result) {
        deleteAppointment(id);
    }
}

function deleteAppointment(id) {

    $.ajax({
        url: "../appointment?id=" + id,
        type: 'DELETE',
        success: function (result) {
            alert("Appointment was successfully deleted!!!");

            redirectFunc();
        }
    });
}

//TODO - redirectFunc?

function redirectFunc(){
    var link = document.createElement('a');
    // set your page url
    link.href = "./list";
    document.body.appendChild(link);
    link.click();
}


function addNewAppointment() {
    location = "../appointment/edit";
}