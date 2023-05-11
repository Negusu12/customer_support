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
                        <th>subject</th>
                        <th>description</th>
                        <th>date_created</th>
                        <th>department_name</th>
                        <th>status</th>
                        <th>IT Staff Name</th>
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
                    $qry = $conn->query("SELECT * from tickets_report order BY customer_name");
                    while ($row = $qry->fetch_assoc()) :
                        $trans = get_html_translation_table(HTML_ENTITIES, ENT_QUOTES);
                        unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
                        $desc = strtr(html_entity_decode($row['description']), $trans);
                        $desc = str_replace(array("<li>", "</li>"), array("", ", "), $desc);
                    ?>
                        <tr>
                            <th class="text-center"><?php echo $i++ ?></th>
                            <td><b><?php echo ucwords($row['customer_name']) ?></b></td>
                            <td><b><?php echo $row['subject'] ?></b></td>
                            <td><b class="truncate"><?php echo strip_tags($desc) ?></b></td>
                            <td><b><?php echo date("M d, Y", strtotime($row['date_created'])) ?></b></td>
                            <td><b><?php echo ucwords($row['department_name']) ?></b></td>
                            <td>
                                <?php if ($row['status'] == 0) : ?>
                                    <span class="badge badge-primary">Pending/Open</span>
                                <?php elseif ($row['status'] == 1) : ?>
                                    <span class="badge badge-Info">Processing</span>
                                <?php elseif ($row['status'] == 2) : ?>
                                    <span class="badge badge-success">Done</span>
                                <?php else : ?>
                                    <span class="badge badge-secondary">Closed</span>
                                <?php endif; ?>
                            </td>
                            <td><b><?php echo ucwords($row['staff_name']) ?></b></td>
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