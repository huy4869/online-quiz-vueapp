<template>
<div class="warapper-container">
            <jsp:include flush="true" page="NavigationBar.jsp"></jsp:include>
            <div class="container">
                <div class="content-container">
                    <div class="userbox" id="login">
                        <div class="title"><h1 class="hightlight-text">Login Form</h1></div>
                        <form action="" id="user_login" method="POST">                  
                            <table border="0">
                                <tr>
                                    <td>User Name:</td>
                                    <td><input required type="text" name="username" id="user_name"></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input required type="password" name="password" id="user_password"></td>

                                    <td></td>
                                </tr>
                                <tr>
                                    <td>User Type:</td>
                                    <td>
                                        <select name="type">
                                            <option value="">Teacher</option>
                                            <option value="">Student</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input required type="email" name="email" id="user_email"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input  class="action-button" type="submit" value="Register"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</template>

<script>
export default {};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
