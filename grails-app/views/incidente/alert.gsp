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
            title: 'Are you sure?',
            text: 'You will not be able to recover this imaginary file!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, keep it'
}).then((result) => {
            console.log(result);
            if (result.value) {
            swal(
            'Deleted!',
            'Your imaginary file has been deleted.',
            'success'
            )
            // For more information about handling dismissals please visit
            // https://sweetalert2.github.io/#handling-dismissals
            } else {
            swal(
            'Cancelled',
            'Your imaginary file is safe :)',
            'error'
            )
            }
            });
            }
        </script>
    </head>
    <body>

        <form name="formTest" id="formTest" method="post">
            <input type="button" name="txt_test" id="txt_test" onclick="confirmFunction();" value="Confirmar" />

        </form>
    </body>
</html>