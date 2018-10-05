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

function backToPetsListAsAdmin(client_id) {
    location = '../client/edit?id='+client_id;
    // location ='../pet/list';
}

function backToAppointmentsList(pet_id) {
    location = '../appointment/edit?pet_id='+pet_id;
    //location ='../appointment/list';
}

function makeAnAppointment(client_id, pet_id) {
   // location ='../appointment/edit?pet_id=' + pet_id;

    location = "../appointment/edit?client_id=" + client_id + "&pet_id=" + pet_id;
}

function backToPetsEdit(client_id, pet_id) {
    location = "../pet/edit?client_id=" + client_id + "&pet_id=" + pet_id;
}

function deleteClickedAsAdmin(id) {
    var result = confirm("Do you really want to delete this pet?");
    if (result) {

        $.ajax({
            url: "../pet?id="+id,
            type: 'DELETE',
            success: function (result) {
                location.reload();
            }
        });
    }
    return false;
}
