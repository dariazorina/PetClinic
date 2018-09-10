function editClicked(id) {
    location = "../pet/edit?id=" + id;
}

function deleteClicked(id) {

    var result = confirm("Do you really want to delete this pet?");
    if (result) {
        deletePet(id);
    }
}

function deletePet(id) {

    $.ajax({
        url: "../pet?id=" + id,
        type: 'DELETE',
        success: function (result) {
            alert("Pet was successfully deleted!!!");
            redirectFunc();
        }
    });
}

function redirectFunc(){
    var link = document.createElement('a');
    // set your page url
    link.href = "./list";
    document.body.appendChild(link);
    link.click();
}


function addNewPet() {
    location = "../pet/edit";
}
