
function editClicked(id) {
    location = "../client/edit?id=" + id;
}

function deleteClicked(id) {

    var result = confirm("Do you really want to delete this client?");
    if (result) {
        deleteClient(id);
    }
}

function deleteClient(id) {

    $.ajax({
        url: "../client?id=" + id,
        type: 'DELETE',
        success: function (result) {
            alert("Client was successfully deleted!!!");
            redirectFunc();
        }
    });
}

// function redirectFunc(){
//     var link = document.createElement('a');
//     // set your page url
//     link.href = "./list";
//     document.body.appendChild(link);
//     link.click();
// }


function addNewClient() {
    location = "../client/edit";
}