<?php include 'db_connect.php' ?>
<div class="col-lg-12">
    <div class="card card-outline card-info">
        <div class="card-body">
            <table class="table table-hover table-bordered" id="list">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="20%">
                    <col width="15%">
                    <col width="25%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Staff Name</th>
                        <th>Support Count</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $i = 1;
                    $where = '';
                    if ($_SESSION['login_type'] == 2)
                        $where .= " where t.department_id = {$_SESSION['login_department_id']} ";
                    if ($_SESSION['login_type'] == 3)
                        $where .= " where t.customer_id = {$_SESSION['login_id']} ";
                    $qry = $conn->query("select * from report_support order by support_count DESC");
                    while ($row = $qry->fetch_assoc()) :
                        $trans = get_html_translation_table(HTML_ENTITIES, ENT_QUOTES);
                        unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
                    ?>
                        <tr>
                            <th class="text-center"><?php echo $i++ ?></th>
                            <td><b><?php echo ucwords($row['staff_name']) ?></b></td>
                            <td><b><?php echo $row['support_count'] ?></b></td>

                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        var table = $('#list').DataTable({
            ordering: true,
            buttons: ['excel', 'pdf', 'colvis'],
            pagingType: 'full_numbers',
            lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ]
        });


        table.columns().every(function() {
            var that = this;
            $('input', this.header()).on('keyup change', function() {
                if (that.search() !== this.value) {
                    that.search(this.value).draw();
                }
            });
        });

        table.buttons().container()
            .appendTo('#list_wrapper .col-md-6:eq(0)');
    });
</script>