<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Modal confirmation</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js"></script>
  <script>

            function confirmFunction() {
            swal({
            title: "Confirmar Accion",
            text: "Se realizara la accion correspondiente",
            showCancelButton: true,
            confirmButtonColor: '#f7505a',
            cancelButtonColor: '#f7505a',
            confirmButtonText: "SI",
            cancelButtonText: "NO"

            }).then(function() {
            $('#txt_test').val("NO");
            $('#formTest').submit();
            })
            }
  </script>
</head>
<body>
 
<form name="formTest" id="formTest" method="post">
  <input type="button" name="txt_test" id="txt_test" onclick="confirmFunction();" value="Confirmar" />

</form>
</body>
</html>