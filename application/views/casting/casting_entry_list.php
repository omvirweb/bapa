<?php $this->load->view('success_false_notify'); ?>
<?php $this->user_type = $this->session->userdata(PACKAGE_FOLDER_NAME.'is_logged_in')['user_type']; ?>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Casting List
            <?php
            $isView = $this->app_model->have_access_role(CASTING_MODULE_ID, "view");
            $isAdd = $this->app_model->have_access_role(CASTING_MODULE_ID, "add"); 
            ?>
            <?php if($isAdd){ ?>
                <a href="<?=base_url('casting/casting_entry') ?>" class="btn btn-primary btn-sm pull-right" style="margin: 5px;">Add Casting Entry</a>
            <?php } ?>
        </h1>
    </section>
    <div class="clearfix">
        <div class="row">
            <div style="margin: 15px;">
                <div class="col-md-12">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-body">
                            <?php if($isView) { ?>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box-body table-responsive">
                                        <input type="hidden" name="department_id" id="department_id" value="<?=CASTING_DEPARTMENT_ACCOUNT_ID?>">
                                        <div class="col-md-2">
                                            <label>Worker</label>
                                            <select name="worker_id" id="worker_id" class="form-control select2" ></select>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Lott Complete?</label>
                                            <select name="lott_complete" id="lott_complete" class="form-control select2" >
                                                <option value="all">All</option>
                                                <option value="0" selected="selected">Lott Pending</option>
                                                <option value="1">Complete</option>
                                                <?php if($this->applib->have_access_role(CASTING_MODULE_ID,"worker_hisab_casting")) { ?>
                                                    <option value="2">Hisab Done</option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                        <label for="to_casting_status_id">To Casting Status</label>
                                        <select name="to_casting_status_id" id="to_casting_status_id" class="form-control select2" >
                                        </select>
                                    </div>
                                        <div class="col-md-1">
                                            <br /><button name="search" id="search" class="btn btn-primary btn-sm"><span class="fa fa-search-plus"></span> Search</button>
                                        </div>
                                        <?php if($this->applib->have_access_role(CASTING_MODULE_ID,"worker_hisab_casting")) { ?>
                                            <div class="checked_data" hidden="">
                                                <input type="hidden" name="checked_or_not" id="checked_or_not" value="0">
                                                <div class="col-md-2">
                                                    <label for="date">Hisab Date <span class="required-sign">&nbsp;*</span></label>
                                                    <input type="text" name="hisab_date" id="datepicker1" class="form-control input-datepicker" value="<?= date('d-m-Y'); ?>">
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="fine">Hisab Fine <span class="required-sign">&nbsp;*</span></label>
                                                    <input type="text" name="fine" id="fine" class="form-control num_only" value="0">
                                                </div>
                                                <div class="col-md-1">
                                                    <br /><button name="search" id="save_worker_details" class="btn btn-primary btn-sm"> Save</button>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <div class="clearfix"></div><br />
                                        Toggle column: 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="1">From Casting Status</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="2">To Casting Status</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="3">Worker</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="4">Date</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="5">Ref.</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="6">Issue Avg Tunch</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="7">Issue Net.Wt Total</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="8">Issue Fine Total</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="9">Receive Avg Tunch</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="10">Receive Net.Wt Total</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="11">Receive Fine Total</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="12">Balance Net.Wt</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="13">Balance fine</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="14">Complete?</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="15">Hisab Done?</a> -- 
                                        <a href="javascript:void(0)" class="toggle-vis" data-column="16">Remark</a>
				
                                        <table id="casting_table" class="table row-border table-bordered table-striped" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 80px;">Action <input type="checkbox" id="chk_all" class="icheckbox_flat-blue"></th>
                                                    <th>From Casting Status</th>
                                                    <th>To Casting Status</th>
                                                    <th nowrap>Worker</th>
                                                    <th>Date</th>
                                                    <th>Ref.</th>
                                                    <th>Issue Avg Tunch</th>
                                                    <th>Issue Net.Wt Total</th>
                                                    <th>Issue Fine Total</th>
                                                    <th>Receive Avg Tunch</th>
                                                    <th>Receive Net.Wt Total</th>
                                                    <th>Receive Fine Total</th>
                                                    <th>Balance Net.Wt</th>
                                                    <th>Balance fine</th>
                                                    <th>Complete?</th>
                                                    <th>Hisab Done?</th>
                                                    <th>Remark</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                            <tfoot>
                                                <tr id="all_row_total">
                                                    <th>All Row Total</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                                <tr id="checked_row_total">
                                                    <th>Checked Row Total</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th id="checked_row_total_6" class="dt-right">0.00</th>
                                                    <th id="checked_row_total_7" class="dt-right">0.000</th>
                                                    <th id="checked_row_total_8" class="dt-right">0.000</th>
                                                    <th id="checked_row_total_9" class="dt-right">0.00</th>
                                                    <th id="checked_row_total_10" class="dt-right">0.000</th>
                                                    <th id="checked_row_total_11" class="dt-right">0.000</th>
                                                    <th id="checked_row_total_12" class="dt-right">0.000</th>
                                                    <th id="checked_row_total_13" class="dt-right">0.000</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            <div class="checked_checkbox_ids"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="clicked_item_id" value="-1" >
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-xl">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Casting Detail Table</h4>
            </div>
            <div class="modal-body">
                <table id="item_table" class="table row-border table-bordered table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Item Name</th>
                            <th>Weight</th>
                            <th>Less</th>
                            <th>Net.Wt</th>
                            <th>Tunch</th>
                            <th>Actual Tunch</th>
                            <th>Fine</th>
                            <th>Pcs</th>
                            <th>Date</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Remark</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    var table;
    var total_issue_net_wt = 0;
    var total_issue_fine = 0;
    var total_receive_net_wt = 0;
    var total_receive_fine = 0;
    $(document).ready(function () {
        $('#ajax-loader').show();
        $('#lott_complete').select2();
        $('#to_casting_status_id').select2();
        initAjaxSelect2($("#worker_id"), "<?= base_url('app/worker_select2_source') ?>");
        initAjaxSelect2($("#to_casting_status_id"), "<?= base_url('app/manufacture_status_select2_source') ?>");
        setSelect2Value($("#to_casting_status_id"), "<?= base_url('app/set_manufacture_status_select2_val_by_id/' . MANUFACTURE_STATUS_IN_CAD) ?>");
        table = $('#casting_table').DataTable({
            "serverSide": true,
            "scrollY": "480px",
            "scrollX": true,
            "search": true,
            "paging": false,
            "ordering":[1, "desc"],
            "order": [],
            "ajax": {
                "url": "<?php echo site_url('casting/casting_entry_datatable') ?>",
                "type": "POST",
                "data": function (d) {
                    d.department_id = $('#department_id').val();
                    d.worker_id = $('#worker_id').val();
                    d.lott_complete = $('#lott_complete').val();
                    d.checked_or_not = $('#checked_or_not').val();
                    d.to_casting_status_id = $('#to_casting_status_id').val();
                },
                "complete": function () {
                    $('#ajax-loader').hide();
                },
            },
            "columnDefs": [
                {
                   "className": "text-nowrap",
                   "targets": [0,1,2,3,4],
                },
                {
                    "className": "dt-right",
                    "targets": [5,6,7,8,9,10,11,12,13],
                },
                {
                    "targets": 0,
                    "orderable": false
                }
            ],
            "footerCallback": function ( row, data, start, end, display ) {
                var api = this.api(), data;

                // Remove the formatting to get integer data for summation
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '')*1 :
                        typeof i === 'number' ?
                            i : 0;
                };

                pageTotal6 = api
                    .column( 7, { page: 'all'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                $(api.column( 7 ).footer()).html(pageTotal6.toFixed(3));

                pageTotal7 = api
                    .column( 8, { page: 'all'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                $(api.column( 8 ).footer()).html(pageTotal7.toFixed(3));
                pageTotal5 = pageTotal7 * 100 / pageTotal6;
                $(api.column( 6 ).footer()).html(pageTotal5.toFixed(2));
                
                pageTotal9 = api
                    .column( 10, { page: 'all'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                $(api.column( 10 ).footer()).html(pageTotal9.toFixed(3));
                
                pageTotal10 = api
                    .column( 11, { page: 'all'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                $(api.column( 11 ).footer()).html(pageTotal10.toFixed(3));
                
                pageTotal8 = pageTotal10 * 100 / pageTotal9;
                $(api.column( 9 ).footer()).html(pageTotal8.toFixed(2));

                pageTotal11 = api
                    .column( 12, { page: 'all'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                $(api.column( 12 ).footer()).html(pageTotal11.toFixed(3));

                pageTotal12 = api
                    .column( 13, { page: 'all'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                $(api.column( 13 ).footer()).html(pageTotal12.toFixed(3));
            }
        });
        
        <?php if($this->applib->have_access_role(CASTING_MODULE_ID,"worker_hisab_casting")) { } else { ?>
            table.columns(16).visible(false);
        <?php } ?>
            
        $('a.toggle-vis').on( 'click', function (e) {
            e.preventDefault();

            // Get the column API object
            var column = table.column( $(this).attr('data-column') );

            // Toggle the visibility
            column.visible( ! column.visible() );
        } );
        
        item_table = $('#item_table').DataTable({
            "serverSide": true,
            "paging": false,
            "ajax": {
                "url": "<?php echo site_url('casting/casting_entry_detail_datatable') ?>",
                "type": "POST",
                "data": function (d) {
                    d.ce_id = $('#clicked_item_id').val()
                },
            },
            "columnDefs": [
                { "className": "dt-right", "targets": [2,3,4,5,6,7,8]},
                { "className": "text-nowrap", "targets": [9]}
            ]
        });
        
        jQuery('#item_table').wrap('<div class="dataTables_scroll" />');

        $(document).on('click', '.item_row', function () {
            $('#clicked_item_id').val($(this).attr('data-ce_id'));
            item_table.draw();
            $('#myModal').modal('show');
        });

        $(document).on("click", ".delete_ce", function () {
            if (confirm('Are you sure delete this records?')) {
                $.ajax({
                    url: $(this).data('href'),
                    type: "POST",
                    data: 'id_name=ce_id&table_name=casting_entry',
                    success: function (response) {
                        var json = $.parseJSON(response);
                        if (json['error'] == 'Error') {
                            show_notify('You cannot delete this Casting. This Casting has been used.', false);
                        } else if (json['success'] == 'Deleted') {
                            table.draw();
                            show_notify('Casting Entry Deleted Successfully!', true);
                        }
                    }
                });
            }
        });
        
        $(document).on('click', '#search', function (){
            if($('#worker_id').val() != '' && $('#worker_id').val() != null 
                    && $('#department_id').val() != '' && $('#department_id').val() != null 
                    && $('#lott_complete').val() != '' && $('#lott_complete').val() == '1'){
                $('.checked_data').show();
                $('#checked_or_not').val('1');
            } else {
                $('.checked_data').hide();
                $('#checked_or_not').val('0');
            }
            $('#ajax-loader').show();
            table.draw();
            var worker_id = $('#worker_id').val();
            if(worker_id != null){
                var column = table.column(3);
                column.visible( !column.visible() );
            }
            total_issue_net_wt = 0;
            total_issue_fine = 0;
            total_receive_net_wt = 0;
            total_receive_fine = 0;
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_6').html('0.00');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_7').html('0.000');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_8').html('0.000');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_9').html('0.00');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_10').html('0.000');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_11').html('0.000');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_12').html('0.000');
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_13').html('0.000');
        });
        
        $(document).on('click', '#save_worker_details', function() {
            var worker_id = $("#worker_id").val();
            if (worker_id == '' || worker_id == null) {
                $("#worker_id").select2('open');
                show_notify("Please Select Worker!", false);
                return false;
            }

            var lott_complete = $("#lott_complete").val();
            if (lott_complete != '1') {
                $("#lott_complete").select2('open');
                show_notify("Please Select Lott Complete!", false);
                return false;
            }

            var datepicker1 = $("#datepicker1").val();
            if (datepicker1 == '' || datepicker1 == null) {
                $("#datepicker1").focus();
                show_notify("Please select Date!", false);
                return false;
            }
            var fine = $("#fine").val();
            if (fine == '' || fine == null) {
                $("#fine").focus();
                show_notify("Please Enter Fine!", false);
                return false;
            }
            if (fine < 0) {
                $("#fine").focus();
                show_notify("Please Enter Fine >= 0.", false);
                return false;
            }
            if ($('input.check_ce:checked').length == 0) {
                show_notify("Please Select Atleast One Item", false);
                return false;
            }
            if ($('input.check_ce').is(':checked')) {
                $('#ajax-loader').show();
                var checked_items = new Array();
                $.each($("input[name='check_ce[]']:checked"), function () {
                    checked_items.push($(this).val());
                });
                var worker_id = $('#worker_id').val();
                var department_id = $('#department_id').val();
                var is_module = '<?php echo HISAB_DONE_IS_MODULE_CASTING; ?>';
                $.ajax({
                    url: "<?php echo base_url('manufacture/save_worker_hisab_details') ?>/",
                    type: "POST",
                    data: {is_module: is_module, checked_items: checked_items, hisab_date: datepicker1, fine: fine, worker_id: worker_id, department_id: department_id},
                    success: function (response) {
                        $('#ajax-loader').hide();
                        var json = $.parseJSON(response);
                        if (json['success'] == 'Added') {
                            window.location.href = "<?php echo base_url('casting/casting_entry_list') ?>";
                        } 
                        return false;
                    }
                });
                return false;
            }
        });
        
        $(document).on('change', 'input[name="check_ce[]"]', function() {
            var checked_val = $(this).val();
            var issue_net_wt = $('#checkbox_id_' + checked_val).data('total_issue_net_wt');
            var issue_fine = $('#checkbox_id_' + checked_val).data('total_issue_fine');
            var receive_net_wt = $('#checkbox_id_' + checked_val).data('total_receive_net_wt');
            var receive_fine = $('#checkbox_id_' + checked_val).data('total_receive_fine');
            if(this.checked) {
                total_issue_net_wt = parseFloat(total_issue_net_wt) + parseFloat(issue_net_wt);
                total_issue_fine = parseFloat(total_issue_fine) + parseFloat(issue_fine);
                total_receive_net_wt = parseFloat(total_receive_net_wt) + parseFloat(receive_net_wt);
                total_receive_fine = parseFloat(total_receive_fine) + parseFloat(receive_fine);
            } else {
                total_issue_net_wt = parseFloat(total_issue_net_wt) - parseFloat(issue_net_wt);
                total_issue_fine = parseFloat(total_issue_fine) - parseFloat(issue_fine);
                total_receive_net_wt = parseFloat(total_receive_net_wt) - parseFloat(receive_net_wt);
                total_receive_fine = parseFloat(total_receive_fine) - parseFloat(receive_fine);
            }
            var issue_avg_tunch = 0;
            if(total_issue_net_wt != '' && total_issue_fine != ''){
                var issue_avg_tunch = total_issue_fine * 100 / total_issue_net_wt;
            }
            var receive_avg_tunch = 0;
            if(total_receive_net_wt != '' && total_receive_fine != ''){
                var receive_avg_tunch = total_receive_fine * 100 / total_receive_net_wt;
            }
            var balance_net_wt = total_issue_net_wt - total_receive_net_wt;
            var balance_fine = total_issue_fine - total_receive_fine;
            issue_avg_tunch = issue_avg_tunch.toFixed(2);
            total_issue_net_wt = total_issue_net_wt.toFixed(3);
            total_issue_fine = total_issue_fine.toFixed(3);
            receive_avg_tunch = receive_avg_tunch.toFixed(2);
            total_receive_net_wt = total_receive_net_wt.toFixed(3);
            total_receive_fine = total_receive_fine.toFixed(3);
            balance_net_wt = balance_net_wt.toFixed(3);
            balance_fine = balance_fine.toFixed(3);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_6').html(issue_avg_tunch);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_7').html(total_issue_net_wt);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_8').html(total_issue_fine);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_9').html(receive_avg_tunch);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_10').html(total_receive_net_wt);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_11').html(total_receive_fine);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_12').html(balance_net_wt);
            $('.dataTables_scrollFoot #checked_row_total #checked_row_total_13').html(balance_fine);
        });
        
        $(document).on("click", ".set_lott_complete_yes_no", function () {
            var lott_complete = $(this).data('lott_complete');
            if(lott_complete == '1'){
                var msg = 'Are you sure you want to Set Lott Complete to Yes?';
            }
            if(lott_complete == '0') {
                var msg = 'Are you sure you want to Set Lott Complete to No?';
            }
            if (confirm(msg)) {
                $('#ajax-loader').show();
                $.ajax({
                    url: $(this).data('href'),
                    type: "POST",
                    data: {lott_complete : lott_complete},
                    success: function (response) {
                        var json = $.parseJSON(response);
                        $('#ajax-loader').hide();
                        if (json['error'] == 'Error') {
                            show_notify('Something Went Wrong!!.', false);
                        } else if (json['success'] == 'Updated') {
                            table.draw();
                            show_notify('Record Updated Successfully!', true);
                        }
                    }
                });
            } else {
                if(lott_complete == '1'){
                    $(this).prop('checked', false);
                } else {
                    $(this).prop('checked', true);
                }
            }
        });
        
        $(document).on('change',"#chk_all",function(){
            total_issue_net_wt = 0;
            total_issue_fine = 0;
            total_receive_net_wt = 0;
            total_receive_fine = 0;
            if(this.checked) {
                $('input[name="check_ce[]"]').prop('checked', true);
                $('input[name="check_ce[]"]:checked').change();
            } else {
                $('input[name="check_ce[]"]').prop('checked', false);
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_6').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_7').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_8').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_9').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_10').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_11').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_12').html('0.00');
                $('.dataTables_scrollFoot #checked_row_total #checked_row_total_13').html('0.00');
            }
        });
        
    });
</script>
