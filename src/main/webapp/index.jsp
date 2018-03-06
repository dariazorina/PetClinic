<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<br><br><br><br>
<div class="container">
    <h1>Our Pet Clinic</h1>

    <div class="row col-md-7 table-responsive">
        <table id="customerTable" class="table table-bordered table-hover" style="width:70%">
            <thead>
            <tr>
                <td width="60%">
                    Sheets Pet Clinic is a full-service veterinary clinic, from major surgeries and dental care to wellness and laboratory services. In addition, we offer a low-cost spay/neuter clinic to the public. We extend rescue rates for animal nonprofits that register via the practice manager. We stock a variety of heartworm/flea/tick prevention products. Our talented groomer has years of experience making her clients happy. We offer reduced rates for the spay/neuter of feral cats who come to the clinic in a humane trap. We also host a cat adoption program.

                    <br><br>We're a team bound by our passion to support the bond between you and your pet and to end homeless pet overpopulation.

                    <br><br>HOURS
                    <br>
                    <br>Mon- Fri.	7:30am	6:00pm
                    <br>Saturday	8:00am	12:00pm


                </td>
                <td width="40%">

                    <form id="edit_doctor_form" action="j_spring_security_check" method="post" accept-charset="UTF-8">
                        <fieldset>
                            <input type="hidden" id="id_id" name="id">

                            <legend>Enter the clinic:</legend>
                            <b>Login:</b><br>
                            <input type="text" name="j_username" id="login_id"><br><br>
                            <b>Password:</b><br>
                            <input type="password" name="j_password" id="password_id"><br><br>


                            <input type="checkbox" name="_spring_security_remember_me" value="">spring_security_remember_me<br>

                            <button type="submit" onclick="">Login</button>
                            <button type="button" onclick="">Register</button>

                        </fieldset>
                    </form>

                    <p>


                    <ul>
                        <li><a href="./doctor/list">Doctors</a></li>
                        <li><a href="./client/list">Clients</a></li>
                        <li><a href="./pet/list">Pets</a></li>
                        <li><a href="./appointment/list">Appointments</a></li>

                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <li><a href="./client?id=1">Client id=1</a></li>
                    <li><a href="./client?id=2">Client id=2</a></li>
                    <li><a href="./client?id=3">Client id=3</a></li>
                </ul>
                    </p>

                </td>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>



<%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>



<%--</sec:authorize>--%>