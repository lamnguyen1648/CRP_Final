<?php
include("include/header.php");
?>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Payment Management</h3>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Payment List</p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 text-nowrap">
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="text-md-end dataTables_filter" id="dataTable_filter">
                                        <label class="form-label">
                                            <input type="search" class="form-control form-control-sm" name="search" id="search" aria-controls="dataTable" placeholder="Search" />
                                        </label>
                                        <a class="btn btn-primary float-right" href="add_payment.php" role="button">Add New Payment</a>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive" id="table">
                                                
                            </div>
                        </div>
                    </div>
                </div>
                <?php 
                include("include/footer.php");
                ?>
</body>

</html>

<script>

    $(document).ready(function(){
        
        load_data();

        //Display Fetched Data
        function load_data(query) {
            $.ajax({
                url:"fetch_payment.php",
                method:"POST",
                data:{
                    query:query
                },
                success:function(data) {
                    $('#table').html(data);
                }
            });
        }

        //Delete Data
        $(document).on('click', '.delete', function() {
            var paymentID = $(this).attr('id');
            if(confirm("Are you sure you want to delete this item?")) {
                $.ajax({
                    url:"delete_payment.php",
                    method:"POST",
                    data:{paymentID:paymentID},
                    success:function(data) {
                        load_data();
                        alert("Data Removed");
                    }
                });
            }
        });

        //Search
        $('#search').keyup(function(){
            var txt = $(this).val();
            if(txt != '') {
                load_data(txt);
            }
            else {
                load_data();
            }
        });
    });

</script>