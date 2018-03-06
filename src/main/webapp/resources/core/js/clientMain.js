function addNewPet(client_id) {
    location = "./pet/edit?client_id=" + client_id;
}


function editClicked(id, client_id) {
    location = "./pet/edit?client_id=" + client_id + "&pet_id=" + id;
}

function makeAnAppointment(client_id, pet_id) {
    // location ='../appointment/edit?pet_id=' + pet_id;

    location = "./appointment/edit?client_id=" + client_id + "&pet_id=" + pet_id;
}

function deleteClicked(id) {

    var result = confirm("Do you really want to delete this pet?");
    if (result) {

        $.ajax({
            url: "./pet?id="+id,
            type: 'DELETE',
            success: function (result) {
                location.reload();
            }
        });
    }
    return false;
}
