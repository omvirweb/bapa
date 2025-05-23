<?php $this->load->view('success_false_notify'); ?>
<style>
    .sell_net_balance_data tr th, .sell_net_balance_data tr td{
        padding: 2px 10px;
    }
</style>
<div class="content-wrapper" id="body-content">
    <form class="form-horizontal" method="post" id="save_sell_purchase" novalidate enctype="multipart/form-data">
        <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { ?>
            <input type="hidden" name="sell_id" class="sell_id" value="<?= $sell_data->sell_id ?>">
        <?php } ?>
            <input type="hidden" name="order_id" id="order_id" value=""/>
            <input type="hidden" id="total_grwt_sell" value=""/>
            <input type="hidden" id="total_grwt_metal" value=""/>
        <!-- Content Header (Page header) -->

        <section class="content-header">
            <h1>
                Add Inventory <?=$page_label?> <?=$page_shortcut?>
                <?php $isEdit = $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "edit");
                $isView = $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "view");
                $isAdd = $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "add");
                $allow_change_date = $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow_change_date"); ?>
                <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { } else { if($isAdd) { $btn_disable = null; } else { $btn_disable = 'disabled';} } ?> 
                <?php if(!isset($sell_data->account_id) || (isset($sell_data->account_id) && $sell_data->account_id != ADJUST_EXPENSE_ACCOUNT_ID)){ ?>
                    <?php if(!isset($sell_data->audit_status) || (isset($sell_data->audit_status) && $sell_data->audit_status != AUDIT_STATUS_AUDITED)){ ?>
                        <button type="submit" name="saveformwithprint" id="saveformwithprint" class="btn btn-primary pull-right module_save_btn btn-sm" ><strong><?= isset($sell_data->sell_id) ? 'Update' : 'Save' ?> & Print</strong> [ Ctrl + Shift +S ]</button>
                        <button type="submit" name="saveform" id="saveform" class="btn btn-primary pull-right module_save_btn btn-sm" ><?= isset($sell_data->sell_id) ? 'Update' : 'Save' ?> [ Ctrl +S ]</button>
                    <?php } ?>
                <?php } ?>
                <a href="<?= $list_page_url ?>" class="btn btn-primary pull-right btn-sm" style="margin: 5px;" <?php echo isset($sell_data->sell_id) ? '' : $btn_disable;?>><?=$page_label?> List</a>
                <span class="pull-right" style="margin-right: 20px;">
                    <div class="form-group">
                        <label for="send_sms" class="col-sm-12 input-sm" style="font-size: 18px; line-height: 25px;">
                            <input type="checkbox" name="send_sms" id="send_sms" class="send_sms" >  &nbsp; Send SMS
                        </label>
                    </div>
                </span>
            </h1>
        </section>
        <div class="clearfix">
            <div class="row">
                <div style="margin: 15px;">
                    <?php if($isAdd || $isEdit) { ?>
                    <!-- Horizontal Form -->
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-body">
                                <div class="row">
                                    <div class="clearfix"></div>
                                    <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { ?>
                                    <div class="col-md-1">
                                        <label for="sell_no">No.</label>
                                        <input type="text" name="sell_no" id="sell_no" class="form-control" readonly value="<?= (isset($sell_data->sell_no) && !empty($sell_data->sell_no)) ? $sell_data->sell_no : ''; ?>"><br />
                                    </div>
                                    <?php } ?>
                                    <div class="col-md-3">
                                        <label for="account_id">Account Name <span class="required-sign">&nbsp;*</span></label>
                                        <select name="account_id" id="account_id" class="form-control select2" ></select>
                                        <div class="clearfix"></div><br />
                                    </div> 
                                    <?php if($department_2 == '1') { ?>
                                        <div class="col-md-2">
                                            <label for="process_id">Department <span class="required-sign">&nbsp;*</span></label>
                                            <select name="process_id" id="process_id" class="form-control select2" ></select>
                                            <div class="clearfix"></div><br />
                                        </div>
                                    <?php } else { ?>
                                        <input type="hidden" name="process_id" id="process_id" value="<?php echo (isset($sell_data->process_id) && !empty ($sell_data->process_id)) ? $sell_data->process_id : $this->session->userdata(PACKAGE_FOLDER_NAME.'is_logged_in')['default_department_id']; ?>" >
                                    <?php } ?>
                                    <div class="col-md-1">
                                        <label for="date">Date <span class="required-sign">&nbsp;*</span></label>
                                        <input type="text" name="sell_date" id="datepicker2" class="<?= !empty($allow_change_date) ? '' : 'disable_datepicker'; ?> form-control input-datepicker" <?= !empty($allow_change_date) ? '' : 'readonly'; ?> value="<?php if (isset($sell_data->sell_date) && !empty($sell_data->sell_date)) { echo date('d-m-Y', strtotime($sell_data->sell_date)); } else { echo date('d-m-Y'); } ?>" style="padding: 5px;"><br />
                                    </div>
                                    <?php if($remark_2 == '1') { ?>
                                        <div class="col-md-3">
                                            <label for="sell_remark">Remark</label>
                                            <input type="text" name="sell_remark" id="sell_remark" class="form-control" value="<?php if (isset($sell_data->sell_remark) && !empty($sell_data->sell_remark)) { echo $sell_data->sell_remark; } else { echo '';} ?>"><br />
                                        </div>
                                    <?php } ?>
                                    <?php if($delivered_not_2 == '1') { ?>
                                    <div class="col-md-2">
                                        <label for="delivery_type">Delivered / Not</label>
                                        <select name="delivery_type" id="delivery_type" class="form-control select2" >
                                            <option value="1" <?= (isset($sell_data->delivery_type) && !empty($sell_data->delivery_type)) ? ($sell_data->delivery_type == '1') ? 'Selected' : '' : 'Selected';?> >Delivered</option>
                                            <option value="2" <?= (isset($sell_data->delivery_type) && !empty($sell_data->delivery_type)) ? ($sell_data->delivery_type == '2') ? 'Selected' : '' : '';?>>Not Delivered</option>
                                        </select>
                                        <div class="clearfix"></div><br />
                                    </div>
                                    <?php } ?>
                                    <div class="clearfix"></div>
                                    <div class="line_item_form item_fields_div" style="height: 160px;">
                                        <input type="hidden" name="line_items_index" id="line_items_index" />
                                        <input type="hidden" name="line_items_data[sell_item_delete]" id="sell_item_delete" value="allow" />
                                        <?php if (isset($sell_item) && !empty($sell_item)) { ?>
                                            <input type="hidden" name="line_items_data[sell_purchase_id]" id="sell_purchase_id" value="0"/>
                                            <input type="hidden" name="line_items_data[order_lot_item_id]" id="order_lot_item_id"/>
                                            <input type="hidden" name="line_items_data[purchase_sell_item_id]" id="purchase_sell_item_id"/>
                                            <input type="hidden" name="line_items_data[stock_type]" id="stock_type" />
                                            <input type="hidden" name="line_items_data[sell_item_id]" id="sell_item_id" />
                                        <?php } ?>
                                        <div class="col-md-3">
                                            <input type="hidden" name="line_items_data[tunch_textbox]" id="tunch_textbox" value="1">
                                        </div>
                                        
                                        <div class="clearfix"></div>
                                        <div class="col-md-1">
                                            <label for="sell_type_id">Type<span class="required-sign">&nbsp;*</span></label>
                                            <select name="line_items_data[type]" class="form-control sell_type_id select2" id="sell_type_id"></select>
                                        </div>
                                        <?php if($use_category == '1') { ?>
                                            <div class="col-md-2">
                                                <label for="category_id">Category<span class="required-sign">&nbsp;*</span></label>
                                                <select name="line_items_data[category_id]" class="form-control category_id" id="category_id"></select>
                                            </div>
                                        <?php } else { ?>
                                            <input type="hidden" name="line_items_data[category_id]" id="category_id" class="category_id">
                                        <?php } ?>
                                        <div class="col-md-2 pr0">
                                            <label for="item_id">Item<span class="required-sign">&nbsp;*</span></label>
                                            <select name="line_items_data[item_id]" class="form-control item_id select2" id="item_id">
                                                <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
                                                    <option value="">--Select--</option>
                                                    <?php foreach ($items_for_select as $item){ ?>
                                                                <option value="<?php echo $item['item_id'] ?>"><?php echo $item['item_name'] ?></option>
                                                    <?php } ?>
                                                <?php } else { ?>

                                                <?php }  ?>
                                            </select>
                                        </div>
                                        <div class="col-md-2">
                                            <label for="item_hsn">HSN/SAC<span class="required-sign">&nbsp;*</span></label>
                                            <select name="item_hsn" class="form-control" id="item_hsn"></select>
                                        </div>
                                        <div class="col-md-2">
                                            <label for="item_rate">Rate<span class="required-sign">&nbsp;*</span></label>
                                            <select name="item_rate" class="form-control" id="item_rate"></select>
                                        </div>
                                        
                                        <div class="clearfix"></div><br />
                                        <div class="col-md-12">
                                            <!--<label>&nbsp;</label>-->
                                            <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { ?>
                                                <div class="created_updated_info pull-right" style="margin-left: 10px;">
                                                   Created by : <?php echo isset($sell_data ->created_by_name) ? $sell_data ->created_by_name :'' ; ?>
                                                   @ <?php echo isset($sell_data ->created_at) ? date('d-m-Y h:i A',strtotime($sell_data ->created_at)) :'' ; ?><br/>
                                                   Updated by : <?php echo isset($sell_data ->updated_by_name) ? $sell_data ->updated_by_name :'' ;?>
                                                   @ <?php echo isset($sell_data ->updated_at) ? date('d-m-Y h:i A',strtotime($sell_data ->updated_at)) : '' ;?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-12 hidden">
                                        <table style="" class="table custom-table border item-table">
                                            <thead>
                                                <tr>
                                                    <th width="5%">Action</th>
                                                    <th width="4%">Type</th>
                                                    <?php if($use_category == '1') { ?>
                                                        <th width="10%">Category</th>
                                                    <?php } ?>
                                                    <th width="8%">Description</th>
                                                    <th width="5%" class="text-right">Gr.Wt.</th>
                                                    <?php if($less_netwt_2 == '1') { ?>
                                                        <th width="5%" class="text-right">Less</th>
                                                        <th width="5%" class="text-right">Net.Wt</th>
                                                    <?php } ?>
                                                    <th width="5%" class="text-right">Tunch</th>
                                                    <?php if($wstg_2 == '1') { ?>
                                                        <th width="4%" class="text-right">Wstg</th>
                                                    <?php } ?>
                                                    <th width="7%" class="text-right">Gold Fine</th>
                                                    <th width="7%" class="text-right">Silver Fine</th>
                                                    <th width="6%" class="text-right">Amount</th>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th width="5%" class="text-right">C Amt</th>
                                                        <th width="5%" class="text-right">R Amt</th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th width="5%">Image</th>
                                                    <?php } ?>
                                                </tr>
                                            </thead>
                                            <tbody id="lineitem_list"></tbody>
                                            <tfoot id="lineitem_foot_list">
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <?php if($use_category == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                    <th>Total</th>
                                                    <th class="text-right"><span id="total_grwt"></span></th>
                                                    <?php if($less_netwt_2 == '1') { ?>
                                                        <th class="text-right"><span id="total_less"></span></th>
                                                        <th class="text-right"><span id="total_ntwt"></span></th>
                                                    <?php } ?>
                                                    <th></th>
                                                    <?php if($wstg_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                    <th class="text-right"><span id="li_total_gold_fine"></span></th>
                                                    <th class="text-right"><span id="li_total_silver_fine"></span></th>
                                                    <th class="text-right"><span id="li_total_amount"></span></th>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th></th>
                                                        <th></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                </tr>
                                            </tfoot>
                                        </table>
                                        <table style="" class="table custom-table pay_rec_table" hidden="">
                                            <tbody id="pop_up_pay_rec_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table metal_table" hidden="">
                                            <tbody id="pop_up_metal_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table gold_table" hidden="">
                                            <tbody id="pop_up_gold_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table silver_table" hidden="">
                                            <tbody id="pop_up_silver_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table transfer_table" hidden="">
                                            <tbody id="pop_up_transfer_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table ad_charges_table" hidden="">
                                            <tbody id="pop_up_ad_charges_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table adjust_cr_table" hidden="">
                                            <tbody id="pop_up_adjust_cr_list"></tbody>
                                        </table>
                                        <table style="" class="table custom-table item-table">
                                            <tbody id="pop_up_total_list">
                                                <?php if($ask_discount_in_sell_purchase == '1') { ?>
                                                    <tr>
                                                        <th width="5%"></th>
                                                        <th width="4%"></th>
                                                        <th width="10%"></th>
                                                        <th width="8%"></th>
                                                        <th width="5%"></th>
                                                        <th width="5%"></th>
                                                        <th width="5%"></th>
                                                        <th width="9%" colspan="2" class="text-right">Discount Amount : </th>
                                                        <th width="7%" class="text-right"></th>
                                                        <th width="7%" class="text-right"></th>
                                                        <th width="6%" class="text-right"><input type="text" name="discount_amount" id="discount_amount" class="form-control input-sm" value="<?php if (isset($sell_data->discount_amount) && !empty($sell_data->discount_amount)) { echo $sell_data->discount_amount; } else { echo '0';} ?>"></th>
                                                        <?php if($c_r_amount_separate == '1') { ?>
                                                            <th width="5%"></th>
                                                            <th width="5%"></th>
                                                        <?php } ?>
                                                        <?php if($lineitem_image_2 == '1') { ?>
                                                            <th width="5%"></th>
                                                        <?php } ?>
                                                    </tr>
                                                <?php } else { ?>
                                                    <tr class="hide">
                                                        <th width="5%"><input type="hidden" name="discount_amount" id="discount_amount" class="form-control input-sm" value="0"></th>
                                                    </tr>
                                                <?php } ?>
                                                <tr>
                                                    <th width="5%"></th>
                                                    <th width="4%"></th>
                                                    <th width="10%"></th>
                                                    <th width="8%"></th>
                                                    <th width="5%"></th>
                                                    <th width="5%"></th>
                                                    <th width="5%"></th>
                                                    <th width="9%" colspan="2" class="text-right">Bill Balance : </th>
                                                    <!--<th width="4%"></th>-->
                                                    <th width="7%" class="text-right"><span id="bill_gold_fine"></span></th>
                                                    <th width="7%" class="text-right"><span id="bill_silver_fine"></span></th>
                                                    <th width="6%" class="text-right"><span id="bill_amount"></span></th>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th width="5%" class="text-right"><span id="bill_cr_c_amount"></span></th>
                                                        <th width="5%" class="text-right"><span id="bill_cr_r_amount"></span></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th width="5%"></th>
                                                    <?php } ?>
                                                </tr>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th>Bal.Date : </th>
                                                    <th><span id="balance_date"></span></th>
                                                    <th colspan="2" class="text-right">Old Balance : </th>
                                                    <!--<th></th>-->
                                                    <th class="text-right"><span id="old_gold_fine_val"></span></th>
                                                    <th class="text-right"><span id="old_silver_fine_val"></span></th>
                                                    <th class="text-right"><span id="old_amount_val"></span></th>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th class="text-right" width="5%"><span id="old_c_amount_val"></span></th>
                                                        <th class="text-right" width="5%"><span id="old_r_amount_val"></span></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                </tr>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th>RFID Pcs</th>
                                                    <th class="text-right"><span id="total_rfid_pcs"></span></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th colspan="2" class="text-right">Net Balance : </th>
                                                    <!--<th></th>-->
                                                    <th class="text-right"><span id="net_gold_fine" class="net_gold_fine label label-success" style="font-size: 14px;"></span></th>
                                                    <th class="text-right"><span id="net_silver_fine" class="net_silver_fine label label-success" style="font-size: 14px;"></span></th>
                                                    <th class="text-right"><span id="net_amount" class="net_amount label label-success" style="font-size: 14px;"></span></th>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th class="text-right" width="5%"><span id="net_c_amount" class="net_c_amount label label-success" style="font-size: 14px;"></span></th>
                                                        <th class="text-right" width="5%"><span id="net_r_amount" class="net_r_amount label label-success" style="font-size: 14px;"></span></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                </tr>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th>Loose Pcs</th>
                                                    <th class="text-right"><span id="total_loose_pcs"></span></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <?php if($approx_amount == '1') { ?>
                                                        <th colspan="2" class="text-right">Approx Amount : </th>
                                                        <!--<th></th>-->
                                                        <th class="text-right"><span id="app_gold_fine"></span></th>
                                                        <th class="text-right"><span id="app_silver_fine"></span></th>
                                                        <th class="text-right"><span id="app_amount"></span></th>
                                                    <?php } else { ?>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                    <?php } ?>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th width="5%"></th>
                                                        <th width="5%"></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                </tr>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th>RFID Wt</th>
                                                    <th class="text-right"><span id="total_rfid_wt"></span></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <?php if($approx_amount == '1') { ?>
                                                        <th colspan="2" class="text-right">Approx Net Bal. : </th>
                                                        <!--<th></th>-->
                                                        <th class="text-right"><span id="app_net_amt"></span></th>
                                                        <th></th>
                                                        <th></th>
                                                    <?php } else { ?>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                    <?php } ?>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th width="5%"></th>
                                                        <th width="5%"></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                </tr>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th>Loose Wt</th>
                                                    <th class="text-right"><span id="total_loose_wt"></span></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th colspan="2" class="text-right"><a href="<?= base_url('master/setting') ?>" target="_blanck">Rate From Setting : </a></th>
                                                    <!--<th></th>-->
                                                    <th class="text-right"><?php echo $gold_rate; ?></th>
                                                    <th class="text-right"><?php echo $silver_rate; ?></th>
                                                    <th></th>
                                                    <?php if($c_r_amount_separate == '1') { ?>
                                                        <th width="5%"></th>
                                                        <th width="5%"></th>
                                                    <?php } ?>
                                                    <?php if($lineitem_image_2 == '1') { ?>
                                                        <th></th>
                                                    <?php } ?>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    </div>
                </div>
        </div>
        <div id="payment_receipt_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Payment Receipt</h4>
                        </div>
                        <div class="col-md-6">
                            <a class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            <label><input type="radio" name="payment_receipt" class="iradio_minimal-blue" value="1"> Payment</label> &nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="payment_receipt" class="iradio_minimal-blue" value="2"> Receipt</label>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="pay_rec_form pay_rec_div">
                                <?php if (isset($pay_rec_data)) { ?>
                                    <input type="hidden" name="pay_rec_data[pay_rec_id]" id="pay_rec_id" />
                                <?php } ?>
                                <input type="hidden" name="pay_rec_index" id="pay_rec_index" />
                                <div class="col-md-4">
                                    <select name="pay_rec_data[cash_cheque]" class="form-control select2 cash_cheque" id="cash_cheque">
                                        <option value="1" selected="">Cash</option>
                                        <option value="2">Bank</option>
                                    </select>
                                </div>
                                <div class="col-md-8 banks">
                                    <label class="col-md-2">Bank<span class="required-sign">&nbsp;*</span></label>
                                    <div class="col-md-10">
                                        <select name="pay_rec_data[bank_id]" id="bank_id" class="form-control select2"></select>
                                    </div>
                                </div>
                                <div class="clearfix"></div><br />
                                <div class="col-md-4">
                                    <label>Amount<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="pay_rec_data[amount]" id="amount" class="form-control num_only" value="">
                                </div>
                                <div class="col-md-7 pull-right">
                                    <label>Narration</label>
                                    <textarea id="narration" name="pay_rec_data[narration]" class="form-control" rows="2"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <table class="pull-left table-bordered sell_net_balance_data" >
                            <tr>
                                <th>Net Gold Fine</th>
                                <th>Net Silver Fine</th>
                                <th>Net Amount</th>
                            </tr>
                            <tr>
                                <td><span class="net_gold_fine"></span></td>
                                <td><span class="net_silver_fine"></span></td>
                                <td><span class="net_amount"></span></td>
                            </tr>
                        </table>
                        <button type="button" class="btn btn-primary" id="payment_receipt_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <br/>
                        <br/>
                        <span style="text-align: left; float: left;">ALT+ 1 = Receipts, ALT+ 2 = Payment</span><br/>
                    </div>
                </div>
            </div>
        </div>
        <div id="metal_receipt_payment_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Metal Issue Receive</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <label><input type="radio" name="metal_payment_receipt" class="iradio_minimal-blue metal_payment_receipt" id="metal_payment_receipt" value="1"> Issue</label> &nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="metal_payment_receipt" class="iradio_minimal-blue metal_payment_receipt" id="metal_payment_receipt" value="2"> Receive</label>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="metal_form metal_div">
                                <input type="hidden" name="metal_index" id="metal_index" />
                                <input type="hidden" name="metal_data[metal_item_delete]" id="metal_item_delete" value="allow" />
                                <?php if (isset($metal_data) && !empty($metal_data)) { ?>
                                <input type="hidden" name="metal_data[metal_pr_id]" id="metal_pr_id" value="0" />
                                <?php } ?>
                                <div class="col-md-4">
                                    <label for="item_id">Item<span class="required-sign">&nbsp;*</span></label>
                                    <select name="metal_data[metal_item_id]" class="form-control metal_item_id select2" id="metal_item_id"></select>
                                </div>
                                <div class="col-md-3">
                                    <label for="metal_grwt">Gr.Wt.<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="metal_data[metal_grwt]" class="form-control metal_grwt num_only" id="metal_grwt" placeholder="" value="">
                                </div>
                                <div class="col-md-2">
                                    <label for="metal_tunch">Tunch</label>
                                    <input type="text" name="metal_data[metal_tunch]" class="form-control metal_tunch num_only" id="metal_tunch" placeholder="" value="100">
                                </div>
                                <div class="col-md-3">
                                    <label for="metal_fine">Fine</label>
                                    <input type="text" name="metal_data[metal_fine]" class="form-control metal_fine num_only" id="metal_fine" placeholder="" value="" readonly="">
                                </div>
                                <div class="clearfix"></div>
                                <label>&nbsp;</label><br />
                            </div>
                            <div class="clearfix"></div><br />
                            <label class="col-md-2">Narration</label>
                            <div class="col-md-8">
                                <input type="text" name="metal_data[metal_narration]" id="metal_narration" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <table class="pull-left table-bordered sell_net_balance_data" >
                            <tr>
                                <th>Net Gold Fine</th>
                                <th>Net Silver Fine</th>
                                <th>Net Amount</th>
                            </tr>
                            <tr>
                                <td><span class="net_gold_fine"></span></td>
                                <td><span class="net_silver_fine"></span></td>
                                <td><span class="net_amount"></span></td>
                            </tr>
                        </table>
                        <button type="button" class="btn btn-primary metal_button" id="metal_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <br/>
                        <br/>
                        <span style="text-align: left; float: left;">ALT+ 4 = Metal Receipts, ALT+ 5 = Metal Paid</span><br/>
                    </div>
                </div>
            </div>
        </div>
        <div id="gold_bhav_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Gold Bhav</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <label><input type="radio" name="gold_sale_purchase" class="iradio_minimal-blue" id="gold_sale_purchase" class="gold_sale_purchase" value="1"> Sell </label>&nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="gold_sale_purchase" class="iradio_minimal-blue" id="gold_sale_purchase" class="gold_sale_purchase" value="2"> Purchase </label>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="gold_form metal_div">
                                <?php if (isset($gold_data)) { ?>
                                    <input type="hidden" name="gold_data[gold_id]" id="gold_id" />
                                <?php } ?>
                                <input type="hidden" name="gold_index" id="gold_index" />
                                <div class="col-md-4">
                                    <label><a href="<?= base_url('master/setting') ?>" target="_blanck">Rate From Setting : </a></label>
                                </div>
                                <div class="col-md-4">
                                    
                                    <label>Min Gold Rate : <?php echo $gold_min; ?></label>
                                </div>
                                <div class="col-md-4">
                                    <label>Max Gold Rate : <?php echo $gold_max; ?></label>
                                </div>
                                <div class="col-md-4">
                                    <label>Weight<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="gold_data[gold_weight]" id="gold_weight" class="form-control num_only" value="">
                                </div>
                                <div class="col-md-4">
                                    <label>Rate<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="gold_data[gold_rate]" id="gold_rate" class="form-control num_only" value="">
                                </div>
                                <div class="col-md-4">
                                    <label>Value</label>
                                    <input type="text" name="gold_data[gold_value]" id="gold_value" class="form-control num_only" value="" readonly="">
                                </div>
                                <div class="clearfix"></div><br />
                                <?php if($c_r_amount_separate == '1') { ?>
                                    <div class="col-md-4">
                                        <label>Amount Effect</label>
                                        <select name="gold_data[gold_cr_effect]" class="form-control gold_cr_effect" id="gold_cr_effect">
                                            <option value="1" selected="">C Amt</option>
                                            <option value="2">R Amt</option>
                                        </select>
                                    </div>
                                <?php } ?>
                                <div class="col-md-8">
                                    <label>Narration</label>
                                    <input type="text" name="gold_data[gold_narration]" id="gold_narration" class="form-control" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <table class="pull-left table-bordered sell_net_balance_data" >
                            <tr>
                                <th>Net Gold Fine</th>
                                <th>Net Silver Fine</th>
                                <th>Net Amount</th>
                            </tr>
                            <tr>
                                <td><span class="net_gold_fine"></span></td>
                                <td><span class="net_silver_fine"></span></td>
                                <td><span class="net_amount"></span></td>
                            </tr>
                        </table>
                        <button type="button" class="btn btn-primary gold_button" id="gold_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <br/>
                        <br/>
                        <span style="text-align: left; float: left;">ALT + 6 = Gold Bhaav popup</span><br/>
                        <span style="text-align: left; float: left;">Inside popup ALT + S = Sell, ALT + P = Purchase</span><br/>
                    </div>
                </div>
            </div>
        </div>
        <div id="silver_bhav_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Silver Bhav</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <label><input type="radio" name="silver_sale_purchase" class="iradio_minimal-blue" id="silver_sale_purchase" value="1"> Sell </label>&nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="silver_sale_purchase" class="iradio_minimal-blue" id="silver_sale_purchase" value="2"> Purchase </label>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="silver_form metal_div">
                                <input type="hidden" name="silver_index" id="silver_index" />
                                <?php if (isset($silver_data)) { ?>
                                    <input type="hidden" name="silver_data[silver_id]" id="silver_id" />
                                <?php } ?>
                                <div class="col-md-4">
                                    <label><a href="<?= base_url('master/setting') ?>" target="_blanck">Rate From Setting : </a></label>
                                </div>
                                <div class="col-md-4">
                                    <label>Min Silver Rate : <?php echo $silver_min; ?></label>
                                </div>
                                <div class="col-md-4">
                                    <label>Max Silver Rate : <?php echo $silver_max; ?></label>
                                </div>
                                <div class="col-md-4">
                                    <label>Weight<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="silver_data[silver_weight]" id="silver_weight" class="form-control num_only" value="">
                                </div>
                                <div class="col-md-4">
                                    <label>Rate<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="silver_data[silver_rate]" id="silver_rate" class="form-control num_only" value="">
                                </div>
                                <div class="col-md-4">
                                    <label>Value</label>
                                    <input type="text" name="silver_data[silver_value]" id="silver_value" class="form-control num_only" value="" readonly="">
                                </div>
                                <div class="clearfix"></div><br />
                                <?php if($c_r_amount_separate == '1') { ?>
                                    <div class="col-md-4">
                                        <label>Amount Effect</label>
                                        <select name="silver_data[silver_cr_effect]" class="form-control silver_cr_effect" id="silver_cr_effect">
                                            <option value="1" selected="">C Amt</option>
                                            <option value="2">R Amt</option>
                                        </select>
                                    </div>
                                <?php } ?>
                                <div class="col-md-8">
                                    <label>Narration</label>
                                    <input type="text" name="silver_data[silver_narration]" id="silver_narration" class="form-control" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <table class="pull-left table-bordered sell_net_balance_data" >
                            <tr>
                                <th>Net Gold Fine</th>
                                <th>Net Silver Fine</th>
                                <th>Net Amount</th>
                            </tr>
                            <tr>
                                <td><span class="net_gold_fine"></span></td>
                                <td><span class="net_silver_fine"></span></td>
                                <td><span class="net_amount"></span></td>
                            </tr>
                        </table>
                        <button type="button" class="btn btn-primary silver_button" id="silver_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <br/>
                        <br/>
                        <span style="text-align: left; float: left;">ALT + 7 = Silver Bhaav popup</span><br/>
                        <span style="text-align: left; float: left;">Inside popup ALT + S = Sell, ALT + P = Purchase</span><br/>
                    </div>
                </div>
            </div>
        </div>
        <div id="transfer_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Transfer</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="transfer_form transfer_div">
                                <input type="hidden" name="transfer_index" id="transfer_index" />
                                <?php if (isset($transfer_data) && !empty($transfer_data)) { ?>
                                    <input type="hidden" name="transfer_data[transfer_entry_id]" id="transfer_entry_id" />
                                <?php } ?>
                                <div class="col-md-5">
                                    <label><input type="radio" name="naam_jama" class="iradio_minimal-blue" id="naam_jama" value="1">&nbsp;Naam(Dr)</label>&nbsp;
                                    <label><input type="radio" name="naam_jama" class="iradio_minimal-blue" id="naam_jama" value="2">&nbsp;Jama(Cr)</label>&nbsp;
                                </div>
                                <div class="col-md-7">
                                    <select name="transfer_data[transfer_account_id]" id="transfer_account_id" class="form-control select2" ></select>
                                </div><div class="clearfix"></div>
                                <div class="col-md-5">
                                    <label>Gold</label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="transfer_data[transfer_gold]" id="transfer_gold" class="form-control num_only" value=""> 
                                </div><div class="clearfix"></div>
                                <div class="col-md-5">
                                    <label>Silver</label>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="transfer_data[transfer_silver]" id="transfer_silver" class="form-control num_only" value=""> 
                                </div><div class="clearfix"></div>
                                <div class="col-md-5">
                                    <label>Amount</label>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" name="transfer_data[transfer_amount]" id="transfer_amount" class="form-control num_only" value=""> 
                                </div><div class="clearfix"></div>
                                <label class="col-md-5">Narration</label>
                                <div class="col-md-7">
                                    <input type="text" name="transfer_data[transfer_narration]" id="transfer_narration" class="form-control" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <table class="pull-left table-bordered sell_net_balance_data" >
                            <tr>
                                <th>Sel. Acc. Gold Fine</th>
                                <th>Sel. Acc. Silver Fine</th>
                                <th>Sel. Acc. Amount</th>
                            </tr>
                            <tr>
                                <td><span class="selected_account_gold_fine"></span></td>
                                <td><span class="selected_account_silver_fine"></span></td>
                                <td><span class="selected_account_amount"></span></td>
                            </tr>
                        </table>
                        <button type="button" class="btn btn-primary transfer_button" id="transfer_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                        <br/>
                        <br/>
                        <span style="text-align: left; float: left;"> ALT +  8 = Transfer</span><br/>
                    </div>
                </div>
            </div>
        </div>
        <div id="ad_charges_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Charges</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="ad_lineitem_form">
                                <input type="hidden" name="ad_lineitem_index" id="ad_lineitem_index" />
                                <?php if(isset($ad_charges_data) && !empty($ad_charges_data)){ ?>
                                    <input type="hidden" name="ad_lineitem_data[sell_ad_charges_id]" id="sell_ad_charges_id" />
                                <?php } ?>
                                <div class="col-md-6">
                                    <label for="ad_id">Ad<span class="required-sign">&nbsp;*</span></label>
                                    <select name="ad_lineitem_data[ad_id]" class="form-control ad_id" id="ad_id"></select>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-md-4">
                                    <label for="ad_pcs">Pcs<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="ad_lineitem_data[ad_pcs]" class="form-control num_only ad_pcs" id="ad_pcs" >
                                </div>
                                <div class="col-md-4">
                                    <label for="ad_rate">Rate<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="ad_lineitem_data[ad_rate]" class="form-control num_only ad_rate" id="ad_rate" >
                                </div>
                                <div class="col-md-4">
                                    <label for="ad_amount">Amount<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="ad_lineitem_data[ad_amount]" class="form-control num_only ad_amount" id="ad_amount" readonly="" ><br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary ad_charges_button" id="ad_charges_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="adjust_cr_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Adjust CR</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="adjust_cr_lineitem_form">
                                <input type="hidden" name="adjust_cr_lineitem_index" id="adjust_cr_lineitem_index" />
                                <?php if(isset($adjust_cr_data) && !empty($adjust_cr_data)){ ?>
                                    <input type="hidden" name="adjust_cr_data[sell_adjust_cr_id]" id="sell_adjust_cr_id" />
                                <?php } ?>
                                <div class="col-md-4">
                                    <label>Adjust to<span class="required-sign">&nbsp;*</span></label>
                                    <select name="adjust_cr_data[adjust_to]" class="form-control select2 adjust_to" id="adjust_to">
                                        <option value="1" selected="">R Amt To C Amt</option>
                                        <option value="2">C Amt To R Amt</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label>Amount<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="adjust_cr_data[adjust_cr_amount]" id="adjust_cr_amount" class="form-control num_only" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary adjust_cr_button" id="adjust_cr_button">Save</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="less_ad_details_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Less Ad Details</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="less_ad_details_form">
                                <input type="hidden" name="less_ad_details_index" id="less_ad_details_index" />
                                <input type="hidden" name="less_ad_details_data[less_ad_details_delete]" id="less_ad_details_delete" value="allow" />
                                <?php if(isset($less_ad_details_data) && !empty($less_ad_details_data)){ ?>
                                    <input type="hidden" name="less_ad_details_data[sell_less_ad_details_id]" id="sell_less_ad_details_id" />
                                <?php } ?>
                                <div class="col-md-4">
                                    <label for="less_ad_details_ad_id">Ad<span class="required-sign">&nbsp;*</span></label>
                                    <select name="less_ad_details_data[less_ad_details_ad_id]" class="form-control less_ad_details_ad_id" id="less_ad_details_ad_id"></select>
                                </div>
                                <div class="col-md-3">
                                    <label for="less_ad_details_ad_pcs">Pcs</label>
                                    <input type="text" name="less_ad_details_data[less_ad_details_ad_pcs]" class="form-control num_only less_ad_details_ad_pcs" id="less_ad_details_ad_pcs" >
                                </div>
                                <div class="col-md-3">
                                    <label for="less_ad_details_ad_weight">Weight<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="less_ad_details_data[less_ad_details_ad_weight]" class="form-control num_only less_ad_details_ad_weight" id="less_ad_details_ad_weight" >
                                </div>
                                <div class="col-md-2">
                                    <input type="button" id="add_less_ad_details" class="btn btn-info btn-sm add_less_ad_details" value="Add Ad Line" style="margin-top: 21px;"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="" style="overflow-x: scroll;">
                                <table style="" class="table custom-table item-table">
                                    <thead>
                                        <tr>
                                            <th width="80px">Action</th>
                                            <th>Ad</th>
                                            <th class="text-right">Pcs</th>
                                            <th class="text-right">Weight</th>
                                        </tr>
                                    </thead>
                                    <tbody id="less_ad_details_list"></tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Total:</th>
                                            <th id="auto_count_chhijat"></th>
                                            <th class="text-right" id="total_less_ad_details_pcs"></th>
                                            <th class="text-right" id="total_less_ad_details_weight"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="sell_item_charges_details_model" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="background-color:#f1e8e1;">
                    <div class="modal-header">
                        <div class="col-md-6">
                            <h4 class="modal-title" id="myModalLabel">Sell Item Charges</h4>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                    </div>
                    <div class="modal-body edit-content">
                        <div class="col-md-12">
                            <div class="sell_item_charges_details_form">
                                <input type="hidden" name="sell_item_charges_details_index" id="sell_item_charges_details_index" />
                                <?php if(isset($sell_item_charges_details_data) && !empty($sell_item_charges_details_data)){ ?>
                                    <input type="hidden" name="sell_item_charges_details_data[sell_item_charges_details_id]" id="sell_item_charges_details_id" />
                                <?php } ?>
                                <div class="col-md-4">
                                    <label for="sell_item_charges_details_ad_id">Ad<span class="required-sign">&nbsp;*</span></label>
                                    <select name="sell_item_charges_details_data[sell_item_charges_details_ad_id]" class="form-control sell_item_charges_details_ad_id" id="sell_item_charges_details_ad_id"></select>
                                </div>
                                <div class="col-md-2">
                                    <label for="sell_item_charges_details_net_wt">Net Weight</label>
                                    <input type="text" name="sell_item_charges_details_data[sell_item_charges_details_net_wt]" class="form-control num_only" id="sell_item_charges_details_net_wt" readonly="" >
                                </div>
                                <div class="col-md-2">
                                    <label for="sell_item_charges_details_per_gram">Per 1 Gram</label>
                                    <input type="text" name="sell_item_charges_details_data[sell_item_charges_details_per_gram]" class="form-control num_only" id="sell_item_charges_details_per_gram" >
                                </div>
                                <div class="col-md-2">
                                    <label for="sell_item_charges_details_ad_amount">Labour Amount<span class="required-sign">&nbsp;*</span></label>
                                    <input type="text" name="sell_item_charges_details_data[sell_item_charges_details_ad_amount]" class="form-control num_only" id="sell_item_charges_details_ad_amount" >
                                </div>
                                <div class="col-md-2">
                                    <input type="button" id="add_sell_item_charges_details" class="btn btn-info btn-sm" value="Add Ad Line" style="margin-top: 21px;"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="" style="overflow-x: scroll;">
                                <table style="" class="table custom-table item-table">
                                    <thead>
                                        <tr>
                                            <th width="80px">Action</th>
                                            <th>Ad</th>
                                            <th class="text-right">Net.Wt</th>
                                            <th class="text-right">Per 1 Gram</th>
                                            <th class="text-right">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody id="sell_item_charges_details_list"></tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Total:</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th class="text-right" id="total_sell_item_charges_details_amount"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div><br />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div id="edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 99999;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Image</h4>
                </div>
                <div class="modal-body edit-content">
                    <img id="doc_img_src" alt="No Image Found" class="img-responsive" height='300px' width='600px'>
                    </div>
            </div>
        </div>
    </div>
</div>
<div id="item_selection_popup" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:#f1e8e1;">
            <div class="modal-header">
                <div class="col-md-8">
                    <h4 class="modal-title" id="myModalLabel">Item Details</h4>
                </div>
            </div>
            <div class="modal-body edit-content">
                <div class="col-md-12">
                    <div class="popup_div">
                        <table style="" class="table custom-table border item-table">
                            <thead>
                                <tr>
                                    <th><label><input type="checkbox" id="select_all_order_to_sell" /> Select All</label></th>
                                    <th>Item</th>
                                    <th class="text-right">Gr.Wt.</th>
                                    <th class="text-right">Less</th>
                                    <th>Image</th>
                                </tr>
                            </thead>
                            <tbody id="item_selection_list"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div><br />
            <div class="modal-footer">
                <button type="button" class="btn btn-primary order_to_sell_button" id="order_to_sell_button">Save</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div id="purchase_item_selection_popup" class="modal fade myModelClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content" style="background-color:#f1e8e1;">
            <div class="modal-header">
                <div class="col-md-8">
                    <h4 class="modal-title" id="myModalLabel">Purchase/Exchange Item Details</h4>
                </div>
            </div>
            <div class="modal-body edit-content">
                <div class="col-md-12">
                    <div class="popup_div">
                        <div class="col-md-2">
                            <label for="search_huid">Search HUID</label>
                            <input type="text" name="search_huid" class="form-control num_only" id="search_huid">
                        </div>
                        <table style="" class="table custom-table border item-table">
                            <thead>
                                <tr>
                                    <th class="text-center"><label><input type="checkbox" id="select_all_purchase_to_sell" /> Select All</label></th>
                                    <th>Particulars</th>
                                    <th>Item</th>
                                    <th class="text-right">Shipped</th>
                                    <th class="text-right">Billed</th>
                                    <!--<th class="text-right">Less</th>-->
                                    <!--<th class="text-right">Net.Wt.</th>-->
                                    <!--<th class="text-right">Tunch</th>-->
                                    <!--<th class="text-right">Wstg</th>-->
                                    <!--<th class="text-right">Fine</th>-->
                                </tr>
                            </thead>
                            <tbody id="purchase_item_selection_list"></tbody>
                            <tfoot>
                                <tr>
                                    <th class="text-center">Checked Total</th>
                                    <th></th>
                                    <th></th>
                                    <th class="text-right" id="pts_checked_total_grwt">0</th>
                                    <th class="text-right" id="pts_checked_total_grwt">0</th>
                                    <!--<th class="text-right" id="pts_checked_total_less">0</th>-->
                                    <!--<th class="text-right" id="pts_checked_total_ntwt">0</th>-->
                                    <!--<th class="text-center" id="pts_checked_total_average" colspan="2">0</th>-->
                                    <!--<th class="text-right" id="pts_checked_total_fine">0</th>-->
                                </tr>
                                <tr>
                                    <th class="text-center">Total</th>
                                    <th></th>
                                    <th></th>
                                    <th class="text-right" id="pts_total_grwt"></th>
                                    <th class="text-right" id="pts_total_grwt"></th>
                                    <!--<th class="text-right" id="pts_total_less"></th>-->
                                    <!--<th class="text-right" id="pts_total_ntwt"></th>-->
                                    <!--<th class="text-center" id="pts_total_average" colspan="2"></th>-->
                                    <!--<th class="text-right" id="pts_total_fine"></th>-->
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div><br />
            <div class="modal-footer">
                <button type="button" class="btn btn-primary purchase_to_sell_button" id="purchase_to_sell_button">Save</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#body-content').on('change keyup keydown click', 'input, textarea, select', function (e) {
        $(this).addClass('changed-input');
    });
    $(window).on('beforeunload', function () {
        if ($('.changed-input').length) {
            return 'Are you sure you want to leave?';
        }
    });
    var sell_purchase = "<?php echo $sell_purchase; ?>";
    var save_sell_purchase_submit_flag = 0;
    var saveform_clickbtn = '';
    var on_save_add_edit_item = 0;
    var zero_value = 0;
    var old_gold_fine_val = 0;
    var old_silver_fine_val = 0;
    var old_amount_val = 0;
    var old_c_amount_val = 0;
    var old_r_amount_val = 0;
    var credit_limit = 0;
    var app_net_amt = 0;
    var discount_amount = 0;

    var li_total_gold_fine = 0;
    var li_total_silver_fine = 0;
    var li_total_amount = 0;
    var payment_receipt_amount = 0;
    var metal_gold_total = 0;
    var metal_silver_total = 0;
    var gold_count = 0;
    var gold_amount_count = 0;
    var silver_count = 0;
    var silver_amount_count = 0;
    var transfer_gold_total = 0;
    var transfer_silver_total = 0;
    var transfer_amount_total = 0;
    var ad_amount_total = 0;
    var adjust_cr_amount_total = 0;

    var bill_gold_fine = 0;
    var bill_silver_fine = 0;
    var bill_amount = 0;
    var net_gold_fine = 0;
    var net_silver_fine = 0;
    var net_amount = 0;
    var net_c_amount = 0;
    var net_r_amount = 0;

    var bill_cr_c_amount = 0;
    var bill_cr_r_amount = 0;
    var li_cr_c_amount = 0;
    var li_cr_r_amount = 0;
    var pr_cr_c_amount = 0;
    var pr_cr_r_amount = 0;
    var gold_cr_c_amount = 0;
    var gold_cr_r_amount = 0;
    var silver_cr_c_amount = 0;
    var silver_cr_r_amount = 0;
    var transfer_cr_c_amount = 0;
    var transfer_cr_r_amount = 0;
    var ad_cr_c_amount = 0;
    var ad_cr_r_amount = 0;
    var adjust_cr_c_amount = 0;
    var adjust_cr_r_amount = 0;

    var edit_less_ad_details_inc = 0;
    var edit_sell_item_charges_details_inc = 0;
    var sell_lineitem_charges_details = 0;
    var sell_lineitem_charges_details_for_index = '';
    var sell_index = '';
    var metal_index = '';

    var depart_gold_fine = 0;
    var depart_silver_fine = 0;

    var lineitem_objectdata = [];
    var metal_objectdata = [];
    var gold_objectdata = [];
    var silver_objectdata = [];
    var pay_rec_objectdata = [];
    var transfer_objectdata = [];
    var ad_charges_objectdata = [];
    var adjust_cr_objectdata = [];
    var less_ad_details_objectdata = [];
    var sell_item_charges_details_objectdata = [];
    var gold_array_for_edit = [];
    var silver_array_for_edit = [];
    var items = [];
<?php if (isset($sell_item)) { ?>
    var li_lineitem_objectdata = [<?php echo $sell_item; ?>];
    if (li_lineitem_objectdata != '') {
        $.each(li_lineitem_objectdata, function (index, value) {
            lineitem_objectdata.push(value);
        });
    }
<?php } 
if (isset($pay_rec_data) && !empty($pay_rec_data)) { ?>
    var pay_lineitem_objectdata = [<?php echo $pay_rec_data; ?>];
    if (pay_lineitem_objectdata != '') {
        $.each(pay_lineitem_objectdata, function (index, value) {
            pay_rec_objectdata.push(value);
        });
    }
    $('.pay_rec_table').show();
<?php } 
if (isset($metal_data)) { ?>
    var metal_lineitem_objectdata = [<?php echo $metal_data; ?>];
    if (metal_lineitem_objectdata != '') {
        $.each(metal_lineitem_objectdata, function (index, value) {
            metal_objectdata.push(value);
        });
    }
    $('.metal_table').show();
<?php } 
if (isset($gold_data)) { ?>
    var gold_lineitem_objectdata = [<?php echo $gold_data; ?>];
    if (gold_lineitem_objectdata != '') {
        $.each(gold_lineitem_objectdata, function (index, value) {
            gold_objectdata.push(value);
        });
    }
    $('.gold_table').show();
<?php } 
if (isset($silver_data)) { ?>
    var silver_lineitem_objectdata = [<?php echo $silver_data; ?>];
    if (silver_lineitem_objectdata != '') {
        $.each(silver_lineitem_objectdata, function (index, value) {
            silver_objectdata.push(value);
        });
    }
    $('.silver_table').show();
<?php } 
if (isset($transfer_data)) { ?>
    var transfer_lineitem_objectdata = [<?php echo $transfer_data; ?>];
    if (transfer_lineitem_objectdata != '') {
        $.each(transfer_lineitem_objectdata, function (index, value) {
            transfer_objectdata.push(value);
        });
    }
    $('.transfer_table').show();
<?php } 
if (isset($ad_charges_data)) { ?>
    var ad_charges_lineitem_objectdata = [<?php echo $ad_charges_data; ?>];
    if (ad_charges_lineitem_objectdata != '') {
        $.each(ad_charges_lineitem_objectdata, function (index, value) {
            ad_charges_objectdata.push(value);
        });
    }
    $('.ad_charges_table').show();
<?php } 
if (isset($adjust_cr_data)) { ?>
    var adjust_cr_lineitem_objectdata = [<?php echo $adjust_cr_data; ?>];
    if (adjust_cr_lineitem_objectdata != '') {
        $.each(adjust_cr_lineitem_objectdata, function (index, value) {
            adjust_cr_objectdata.push(value);
        });
    }
    $('.adjust_cr_table').show();
<?php }
if (isset($order_lot_item)) { ?>
    var ots_li_lineitem_objectdata = [<?php echo $order_lot_item; ?>];
    var ots_lineitem_objectdata = [];
    if (ots_li_lineitem_objectdata != '') {
        $.each(ots_li_lineitem_objectdata, function (index, value) {
            ots_lineitem_objectdata.push(value);
        });
    }
<?php } ?>
    
    var pts_lineitem_objectdata = [];
    display_metal_html(metal_objectdata);
    display_gold_html(gold_objectdata);
    display_silver_html(silver_objectdata);
    display_pay_rec_html(pay_rec_objectdata);
    display_transfer_html(transfer_objectdata);
    display_ad_charges_html(ad_charges_objectdata);
    display_adjust_cr_html(adjust_cr_objectdata);
    
    $(document).ready(function () {
        $('.select2').select2();
        <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
            $.fn.select2.amd.require(['select2/compat/matcher'], function (oldMatcherSelect2) {
                $("#item_id").select2({
                    matcher: oldMatcherSelect2(matchStartSelect2)
                })
            });
        <?php } ?>
        
        $('#save_sell_purchase').on('keyup keypress', function(e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode === 13) {
                var rfid_number = $('#rfid_number').val();
                if(rfid_number == ''){
                    e.preventDefault();
                    return false;
                }
            }
        });

        <?php if (isset($new_order_data->order_id)) { ?>
            $('#order_id').val(<?php echo $new_order_data->order_id; ?>);
        <?php } ?>
        initAjaxSelect2($("#account_id"), "<?= base_url('app/party_name_with_number_select2_source/1') ?>");
        <?php if (isset($new_order_data->party_id)) { ?>
            get_bill_balance(<?php echo $new_order_data->party_id; ?>);
            setSelect2Value($("#account_id"), "<?= base_url('app/set_account_name_with_number_val_by_id/' . $new_order_data->party_id) ?>");
        <?php } elseif (isset($sell_data->account_id) && !empty ($sell_data->account_id)) { ?>
            get_bill_balance(<?php echo $sell_data->account_id; ?>);
            setSelect2Value($("#account_id"), "<?= base_url('app/set_account_name_with_number_val_by_id/' . $sell_data->account_id) ?>");
            initAjaxSelect2($("#transfer_account_id"), "<?= base_url('app/set_account_name_with_number_val_by_id/' . $sell_data->account_id) ?>");
        <?php } else { ?>
            setSelect2Value($("#account_id"), "<?= base_url('app/set_account_name_with_number_val_by_id/' . CASE_CUSTOMER_ACCOUNT_ID) ?>");
        <?php } ?>
        <?php if (isset($sell_data->account_id) && !empty ($sell_data->account_id)) { ?>  
            initAjaxSelect2($("#transfer_account_id"), "<?= base_url('app/account_name_from_main_party_select2_source/' . $sell_data->account_id.'/1') ?>");
        <?php } else { ?>
            initAjaxSelect2($("#transfer_account_id"), "<?= base_url('app/account_name_from_main_party_select2_source/' . CASE_CUSTOMER_ACCOUNT_ID.'/1')?>");
        <?php } ?>
        <?php if($department_2 == '1') { ?>
            initAjaxSelect2($("#process_id"), "<?= base_url('app/department_select2_source') ?>");
            <?php if (isset($new_order_data->process_id)) { ?>
                setSelect2Value($("#process_id"), "<?= base_url('app/set_process_master_select2_val_by_id/' . $new_order_data->process_id) ?>");
            <?php } elseif (isset($sell_data->process_id) && !empty ($sell_data->process_id)) { ?>
                setSelect2Value($("#process_id"), "<?= base_url('app/set_process_master_select2_val_by_id/' . $sell_data->process_id) ?>");
            <?php } else { ?>
                setSelect2Value($("#process_id"), "<?= base_url('app/set_process_master_select2_val_by_id/' . $this->session->userdata(PACKAGE_FOLDER_NAME.'is_logged_in')['default_department_id']) ?>");
            <?php } ?>
        <?php } ?>
            
        <?php if(isset($order_to_sell_purchase) && !empty($order_to_sell_purchase)){ ?>
            $('#item_selection_popup').modal('show');
            var order_lineitem_html = '';
            $.each(ots_lineitem_objectdata, function (index, value) {
//                console.log(value);
                if(value.less == 1){
                    var input_less = '<input type="text" name="order_less[]" value="0">';
                } else {
                    var input_less = '<input type="text" name="order_less[]" value="0" disabled="">';
                }
                
                var row_html_order = '<tr class="lineitem_index_' + index + '">' +
                    '<td class="text-center">' +
                    '<input type="checkbox" data-item_id="' + value.item_id + '" data-selected_index="' + index + '" class="selected_index">' +
                    '</td>' +
                    '<td>' + value.item_name + '</td>' +
                    '<td class="text-right"><input type="text" name="order_grwt[]" id="order_grwt" value="'+ value.grwt + '"></td>' +
                    '<td class="text-right">' + input_less + '</td>';
                    if (value.image !== null && value.image !== '') {
                        var img_url = '<?php echo base_url(); ?>' + '/' + value.image;
                        row_html_order += '<td><a href="javascript:void(0)" class="btn btn-xs btn-primary image_model" data-img_src="' + img_url + '" ><i class="fa fa-image"></i></a></td>';
                    }
                    row_html_order += '</tr>';
                order_lineitem_html += row_html_order;
            });
        
            $('tbody#item_selection_list').html(order_lineitem_html);
        <?php } ?>
    
        $(document).on('click', '#select_all_order_to_sell', function () {
            if($("#select_all_order_to_sell").is(':checked')){
                    $('.selected_index').prop('checked', true);
            } else {
                    $('.selected_index').prop('checked', false);
            }
        });

        $(document).on('click', '#select_all_purchase_to_sell', function () {
            if($("#select_all_purchase_to_sell").is(':checked')){
                $('.pts_selected_index').prop('checked', true);
            } else {
                $('.pts_selected_index').prop('checked', false);
            }
            checked_average_value();
        });
        
        $(document).on('click', '.pts_selected_index', function () {
            checked_average_value();
        });
        
        <?php if($use_category == '1') { ?>
            initAjaxSelect2($("#category_id"), "<?= base_url('app/category_for_gold_and_silver_select2_source') ?>");
        <?php } ?>
        initAjaxSelect2($("#metal_item_id"), "<?= base_url('app/item_name_from_select_category_for_metal_select2_source') ?>");
//        initAjaxSelect2($("#sell_type_id"), "<?= base_url('app/sell_type_select2_source/') ?>" + sell_purchase );
        if(sell_purchase == 'sell'){
            $('#sell_type_id').append($("<option>--</option>").attr("value", "")); 
            $('#sell_type_id').append($("<option>S</option>").attr("value", "<?php echo SELL_TYPE_SELL_ID ?>")); 
        } else if(sell_purchase == 'purchase'){
            $('#sell_type_id').append($("<option>--</option>").attr("value", "")); 
            $('#sell_type_id').append($("<option>E</option>").attr("value", "<?php echo SELL_TYPE_EXCHANGE_ID ?>")); 
            $('#sell_type_id').append($("<option>P</option>").attr("value", "<?php echo SELL_TYPE_PURCHASE_ID ?>")); 
        } else {
            $('#sell_type_id').append($("<option>--</option>").attr("value", "")); 
            $('#sell_type_id').append($("<option>E</option>").attr("value", "<?php echo SELL_TYPE_EXCHANGE_ID ?>")); 
            $('#sell_type_id').append($("<option>P</option>").attr("value", "<?php echo SELL_TYPE_PURCHASE_ID ?>")); 
            $('#sell_type_id').append($("<option>S</option>").attr("value", "<?php echo SELL_TYPE_SELL_ID ?>")); 
        }
        
        <?php /*initAjaxSelect2($("#item_id"), "<?= base_url('app/item_name_from_select_category_select2_source') ?>"); */ ?>
        
        $('input[type="checkbox"].send_sms').iCheck({
            checkboxClass: 'icheckbox_flat-blue',
        });
        
        $(".myModelClose").on("hidden.bs.modal", function () {
            gold_array_for_edit = [];
        });
            
        $('.touch_select').show();
        $('.touch_input').hide();
        $('.banks').hide();
        $("#party_id").select2('open');
        $(".cash_cheque").select2();
        $("#delivery_type").select2();
        $('#payment_receipt_data').hide();
        $(".gold_cr_effect").select2();
        $(".silver_cr_effect").select2();

        if ($('#datepicker2').hasClass("disable_datepicker")) {
        } else {
            $('#datepicker2').datepicker({
                format: 'dd-mm-yyyy',
                todayBtn: "linked",
                autoclose: true,
                todayHighlight: true,
                endDate: "today",
                maxDate: 0,
                constrainInput: false
            });
        }
        
        $(document).on('focus',"#datepicker2",function () {
           $(this).select();
        });
        $('#datepicker2').on('show', function(e){
            if ( e.date ) {
                 $(this).data('stickyDate', e.date);
            }
            else {
                 $(this).data('stickyDate', null);
            }
        });
        $('#datepicker2').on('hide', function(e){
            var stickyDate = $(this).data('stickyDate');
            if ( !e.date && stickyDate ) {
                $(this).datepicker('setDate', stickyDate);
                $(this).data('stickyDate', null);
            }
        });
        
        var account_id = $('#account_id').val();
        get_bill_balance(account_id);
        
        $(document).on('change', '#account_id', function (){
            $('#transfer_account_id').val(null).trigger('change');
            var account_id = $('#account_id').val();
            if (account_id != '' && account_id != null) {
                initAjaxSelect2($("#transfer_account_id"), "<?= base_url('app/account_name_from_main_party_select2_source') ?>/" + account_id + "/1");
                get_bill_balance(account_id);
            } else {
                $('#transfer_account_id').val(null).trigger('change');
            }
            var sell_type_id = $('#sell_type_id').val();
            if(sell_type_id == <?php echo SELL_TYPE_SELL_ID; ?>){
                get_wstg_from_account();
            }
        });

        $(document).on('click', '.image_model', function () {
            let src = $(this).data("img_src");
            setTimeout(function () {
                $("#doc_img_src").attr('src', src);
            }, 0);
            $('#edit-modal').modal('show');
        });

        $(document).on('click', '#payment_receipt', function () {
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                return false;
            }
            $('#payment_receipt_model').modal('show');
        });

        $(document).on('click', '#metal_receipt_payment', function () {
            setSelect2Value($("#metal_item_id"), "<?= base_url('app/set_item_name_select2_val_by_id/') ?>" + <?php echo METAL_PAYMENT_RECEIPT_DEFAULT_ITEM_ID; ?>);
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                return false;
            }
            $('#metal_receipt_payment_model').modal('show');
        });

        $(document).on('click', '#gold_bhav', function () {
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                return false;
            }
            $('#gold_bhav_model').modal('show');
            if(parseFloat(net_gold_fine) < 0){
                $('input:radio[name=gold_sale_purchase]').filter('[value=2]').prop('checked', true);
                var gold_weight = Math.abs(net_gold_fine);
            } else {
                $('input:radio[name=gold_sale_purchase]').filter('[value=1]').prop('checked', true);
                var gold_weight = net_gold_fine;
            }
            $('#gold_weight').val(gold_weight);
        });

        $(document).on('click', '#silver_bhav', function () {
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                return false;
            }
            $('#silver_bhav_model').modal('show');
            if(parseFloat(net_silver_fine) < 0){
                $('input:radio[name=silver_sale_purchase]').filter('[value=2]').prop('checked', true);
                var silver_weight = Math.abs(net_silver_fine);
            } else {
                $('input:radio[name=silver_sale_purchase]').filter('[value=1]').prop('checked', true);
                var silver_weight = net_silver_fine;
            }
            $('#silver_weight').val(silver_weight);
        });

        $(document).on('click', '#transfer', function () {
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                return false;
            }
            $('#transfer_model').modal('show');
        });
        
        $(document).on('click', '#ad_charges', function () {
            $('#ad_charges_model').modal('show');
        });
        
        $(document).on('click', '#adjust_cr', function () {
            $('#adjust_cr_model').modal('show');
        });

        $(document).on('keyup change', '#ad_pcs, #ad_rate', function () {
            var ad_pcs = parseFloat($('#ad_pcs').val()) || 0;
            ad_pcs = round(ad_pcs, 2).toFixed(2);
            var ad_rate = parseFloat($('#ad_rate').val()) || 0;
            ad_rate = round(ad_rate, 2).toFixed(2);
            var ad_amount = parseFloat(ad_pcs) * parseFloat(ad_rate);
            ad_amount = round(ad_amount, 2).toFixed(2);
            $('#ad_amount').val(ad_amount);
        });
        
        $(document).on('click', '#less_ad_details', function () {
            initAjaxSelect2($("#less_ad_details_ad_id"), "<?= base_url('app/ad_name_select2_source/is_sell_purchase_less_ad_details') ?>");
            $('#less_ad_details_model').modal('show');
        });
        $('#less_ad_details_model').on('hidden.bs.modal', function () {
            var total_less_ad_details_weight = $('#total_less_ad_details_weight').html();
            $('#less').val(total_less_ad_details_weight).trigger("change");;
        });
        
        $('#add_less_ad_details').on('click', function () {
            var less_ad_details_ad_id = $("#less_ad_details_ad_id").val();
            if (less_ad_details_ad_id == '' || less_ad_details_ad_id == null) {
                $("#less_ad_details_ad_id").select2('open');
                show_notify("Please select Ad!", false);
                return false;
            }
            var less_ad_details_ad_pcs = $("#less_ad_details_ad_pcs").val();
            var less_ad_details_ad_weight = $("#less_ad_details_ad_weight").val();
            if (less_ad_details_ad_weight == '' || less_ad_details_ad_weight == null) {
                show_notify("Ad Weight is required!", false);
                $("#less_ad_details_ad_weight").focus();
                return false;
            }

            $("#add_less_ad_details").attr('disabled', 'disabled');
            var sell_less_ad_details_id = $("#sell_less_ad_details_id").val();
            var key = '';
            var value = '';
            var less_ad_details = {};
            $('input[name^="less_ad_details_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("less_ad_details_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                less_ad_details[key] = value;
            });
            less_ad_details['less_ad_details_ad_id'] = less_ad_details_ad_id;
            var ad_data = $('#less_ad_details_ad_id option:selected').html();
            less_ad_details['less_ad_details_ad_name'] = ad_data;
            less_ad_details['less_ad_details_ad_pcs'] = less_ad_details_ad_pcs;
            less_ad_details['less_ad_details_ad_weight'] = less_ad_details_ad_weight;
            
            var new_less_ad_details = JSON.parse(JSON.stringify(less_ad_details));
            less_ad_details_index = $("#less_ad_details_index").val();
            if (less_ad_details_index != '') {
                less_ad_details_objectdata.splice(less_ad_details_index, 1, new_less_ad_details);
            } else {
                less_ad_details_objectdata.push(new_less_ad_details);
            }
            display_less_ad_details_html(less_ad_details_objectdata);
            $("#less_ad_details_index").val('');
            less_ad_details_index = '';
            $('#less_ad_details_delete').val('allow');
            $('#sell_less_ad_details_id').val('');
            $("#less_ad_details_ad_id").val(null).trigger("change");
            $("#less_ad_details_ad_pcs").val('');
            $("#less_ad_details_ad_weight").val('');
            edit_less_ad_details_inc = 0;
            $("#add_less_ad_details").removeAttr('disabled', 'disabled');
        });

        $(document).on('click', '#sell_item_charges_details', function () {
            initAjaxSelect2($("#sell_item_charges_details_ad_id"), "<?= base_url('app/ad_name_select2_source/is_sell_purchase_ad_charges') ?>");
            var net_wt = $('#net_wt').val() || 0;
            net_wt = Math.abs(net_wt);
            $('#sell_item_charges_details_net_wt').val(net_wt);
            $('#sell_item_charges_details_model').modal('show');
            sell_lineitem_charges_details = 0;
            sell_lineitem_charges_details_for_index = '';
        });
        $(document).on('click', '#sell_lineitem_charges_details', function () {
            initAjaxSelect2($("#sell_item_charges_details_ad_id"), "<?= base_url('app/ad_name_select2_source/is_sell_purchase_ad_charges') ?>");
            var net_wt = $(this).attr('data-net_wt') || 0;
            net_wt = Math.abs(net_wt);
            $('#sell_item_charges_details_net_wt').val(net_wt);
            $('#sell_item_charges_details_model').modal('show');
            sell_lineitem_charges_details = 1;
            sell_lineitem_charges_details_for_index = $(this).attr('data-index');
            sell_item_charges_details_objectdata = JSON.parse(lineitem_objectdata[sell_lineitem_charges_details_for_index].sell_item_charges_details);
            display_sell_item_charges_details_html(sell_item_charges_details_objectdata);
        });
        $('#sell_item_charges_details_model').on('hidden.bs.modal', function () {
            var total_sell_item_charges_details_amount = $('#total_sell_item_charges_details_amount').html() || 0;
            if(sell_lineitem_charges_details == 1){
                lineitem_objectdata[sell_lineitem_charges_details_for_index].charges_amt = total_sell_item_charges_details_amount;
                lineitem_objectdata[sell_lineitem_charges_details_for_index].amount = total_sell_item_charges_details_amount;
                lineitem_objectdata[sell_lineitem_charges_details_for_index].sell_item_charges_details = JSON.stringify(sell_item_charges_details_objectdata);
                sell_item_charges_details_objectdata.length = 0;
                display_sell_item_charges_details_html(sell_item_charges_details_objectdata);
//                var charges_amt_per = parseFloat(total_sell_item_charges_details_amount) / parseFloat(lineitem_objectdata[sell_lineitem_charges_details_for_index].gross_amount) * 100;
                $('.sell_lineitem_charges_details_' + sell_lineitem_charges_details_for_index).html(parseFloat(total_sell_item_charges_details_amount).toFixed(2));
                display_lineitem_html(lineitem_objectdata);
            } else {
                $('#charges_amt').val(total_sell_item_charges_details_amount).trigger("change");
            }
            $('#sell_item_charges_details_net_wt').val('');
            $('#sell_item_charges_details_per_gram').val('');
            $('#sell_item_charges_details_ad_amount').val('');
        });
        $(document).on('keyup change', '#sell_item_charges_details_per_gram', function () {
            var sell_item_charges_details_net_wt = $('#sell_item_charges_details_net_wt').val() || 0;
            var sell_item_charges_details_per_gram = $('#sell_item_charges_details_per_gram').val() || 0;
            var sell_item_charges_details_ad_amount = parseFloat(sell_item_charges_details_net_wt) * parseFloat(sell_item_charges_details_per_gram);
            $('#sell_item_charges_details_ad_amount').val(sell_item_charges_details_ad_amount);
        });
        $(document).on('click', '#add_sell_item_charges_details', function () {
            var sell_item_charges_details_ad_id = $("#sell_item_charges_details_ad_id").val();
            if (sell_item_charges_details_ad_id == '' || sell_item_charges_details_ad_id == null) {
                $("#sell_item_charges_details_ad_id").select2('open');
                show_notify("Please select Ad!", false);
                return false;
            }
            var sell_item_charges_details_ad_amount = $("#sell_item_charges_details_ad_amount").val();
            if (sell_item_charges_details_ad_amount == '' || sell_item_charges_details_ad_amount == null) {
                show_notify("Amount is required!", false);
                $("#sell_item_charges_details_ad_amount").focus();
                return false;
            }

            $("#add_sell_item_charges_details").attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var sell_item_charges_details = {};
            $('input[name^="sell_item_charges_details_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("sell_item_charges_details_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                sell_item_charges_details[key] = value;
            });
            sell_item_charges_details['sell_item_charges_details_ad_id'] = sell_item_charges_details_ad_id;
            var ad_data = $('#sell_item_charges_details_ad_id option:selected').html();
            sell_item_charges_details['sell_item_charges_details_ad_name'] = ad_data;
            sell_item_charges_details['sell_item_charges_details_ad_amount'] = sell_item_charges_details_ad_amount;

            var new_sell_item_charges_details = JSON.parse(JSON.stringify(sell_item_charges_details));
            sell_item_charges_details_index = $("#sell_item_charges_details_index").val();
            if (sell_item_charges_details_index != '') {
                sell_item_charges_details_objectdata.splice(sell_item_charges_details_index, 1, new_sell_item_charges_details);
            } else {
                sell_item_charges_details_objectdata.push(new_sell_item_charges_details);
            }
            display_sell_item_charges_details_html(sell_item_charges_details_objectdata);
            $("#sell_item_charges_details_index").val('');
            sell_item_charges_details_index = '';
            $('#sell_item_charges_details_id').val('');
            $("#sell_item_charges_details_ad_id").val(null).trigger("change");
            $('#sell_item_charges_details_per_gram').val('');
            $('#sell_item_charges_details_ad_amount').val('');
            edit_sell_item_charges_details_inc = 0;
            $("#add_sell_item_charges_details").removeAttr('disabled', 'disabled');
        });

        $(document).on('change', '#process_id', function () {
            if(sell_purchase == "sell") {
                $('#sell_type_id').val("<?php echo SELL_TYPE_SELL_ID ?>").trigger("change");
            } else if(sell_purchase == "purchase") {
                $('#sell_type_id').val("<?php echo SELL_TYPE_PURCHASE_ID ?>").trigger("change");
            } else {
                $('#sell_type_id').val(null).trigger("change");    
            }
            pts_lineitem_objectdata = [];
            display_pts_lineitem_html(pts_lineitem_objectdata);
        });
        
        $(document).on('change', '#tunch_textbox', function(){
            if($('#tunch_textbox').prop("checked") == true){
                $('.touch_select').hide();
                $('.touch_input').show();
            } else {
                $('.touch_select').show();
                $('.touch_input').hide();
            }
            $("#touch_id").val(null).trigger("change");
            $("#touch_data_id").val('');
        });
        
        $("#tunch_textbox").prop("checked", true).trigger('change');
        
        $(document).on('change', '#sell_type_id', function () {
            $('#wstg').removeAttr('readonly', 'readonly');
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                if(sell_purchase == "sell") {
                    $('#sell_type_id').val("<?php echo SELL_TYPE_SELL_ID ?>").trigger("change");
                } else if(sell_purchase == "purchase") {
                    $('#sell_type_id').val("<?php echo SELL_TYPE_PURCHASE_ID ?>").trigger("change");
                } else {
                    $('#sell_type_id').val(null).trigger("change");    
                }
                return false;
            }
            var sell_type_id = $('#sell_type_id').val();
            if (sell_type_id == '1') {
                $('.field_required').removeAttr('hidden', 'hidden');
                $(".item_fields_div").css("background-color", "#c4ecc4");
                if($('#tunch_textbox').prop("checked") == true){
                    $('.touch_select').hide();
                    $('.touch_input').show();
                } else {
                    $('.touch_select').show();
                    $('.touch_input').hide();
                }
                $("#tunch_textbox").removeAttr('disabled', 'disabled');
                <?php if($this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow change wastage")){ } else { ?>
                    $('#wstg').attr('readonly', 'readonly');
                <?php } ?>
            } else if (sell_type_id == '2') {
                $('.field_required').removeAttr('hidden', 'hidden');
                $(".item_fields_div").css("background-color", "#fc949b");
                if($('#tunch_textbox').prop("checked") == true){
                    $('.touch_select').hide();
                    $('.touch_input').show();
                } else {
                    $('.touch_select').show();
                    $('.touch_input').hide();
                }
                $("#tunch_textbox").removeAttr('disabled', 'disabled');
            } else if (sell_type_id == '3') {
                $('.field_required').attr('hidden', 'hidden');
                $(".item_fields_div").css("background-color", "#efbacc");
                $('.touch_select').hide();
                $('.touch_input').show();
                $("#tunch_textbox").attr('disabled', 'disabled');
            } else {
                $(".item_fields_div").css("background-color", "#ffffff");
            }
            
            <?php if($use_category == '1') { ?>
                $('#category_id').val(null).trigger('change');
                $('#item_id').val(null).trigger('change');
            <?php } else { ?>
                $('#item_id').val(null).trigger('change');
//                initAjaxSelect2($("#item_id"), "<?= base_url('app/item_name_from_select_category_for_sell_select2_source') ?>/0/" + sell_type_id);
            <?php } ?>
            <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
                
            <?php } else { ?>
                initAjaxSelect2($("#item_id"), "<?= base_url('app/item_name_from_select_category_for_sell_select2_source') ?>/0/" + sell_type_id);
            <?php } ?>
            if (sell_type_id == '<?php echo SELL_TYPE_EXCHANGE_ID; ?>') {
                var exchange_default_category_id = '<?php echo EXCHANGE_DEFAULT_CATEGORY_ID; ?>';
                var exchange_default_item_id = '<?php echo EXCHANGE_DEFAULT_ITEM_ID; ?>';
                <?php if($use_category == '1') { ?>
                    $("#category_id").val(exchange_default_category_id).trigger("change");
                    setSelect2Value($("#category_id"), "<?= base_url('app/set_category_select2_val_by_id/') ?>" + exchange_default_category_id);
                <?php } else { ?>
                    $("#category_id").val(exchange_default_category_id);
                <?php } ?>
                $("#item_id").val(exchange_default_item_id).trigger("change");
                <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
                
                <?php } else { ?>
                    setSelect2Value($("#item_id"), "<?= base_url('app/set_item_name_select2_val_by_id/') ?>" + exchange_default_item_id);
                <?php } ?>
                
            }
            $("#grwt").val('');
            $("#less").val('');
            $("#net_wt").val('');
            $("#touch_id").val(null).trigger("change");
            $("#touch_data_id").val('');
            <?php if($wstg_2 == '1') { ?>
                $("#wstg").val('');
            <?php } else { ?>
                $("#wstg").val('0');
            <?php } ?>
            $("#fine").val('');
            if (sell_type_id == '3') {
                $("#wstg").val('0');
            }
        });

        $(document).on('change', '#category_id', function () {
            var category_id = $('#category_id').val();
            var sell_type_id = $('#sell_type_id').val();
            if (category_id != '' && category_id != null && sell_type_id != '' && sell_type_id != null) {
                <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
                
                <?php } else { ?>
                    initAjaxSelect2($("#item_id"), "<?= base_url('app/item_name_from_select_category_for_sell_select2_source') ?>/" + category_id + '/' + sell_type_id);
                <?php } ?>
            } else {
                $('#item_id').val(null).trigger('change');
                $("#grwt").val('');
                $("#less").val('');
                $("#net_wt").val('');
                $("#touch_id").val(null).trigger("change");
                $("#touch_data_id").val('');
                <?php if($wstg_2 == '1') { ?>
                    $("#wstg").val('');
                <?php } else { ?>
                    $("#wstg").val('0');
                <?php } ?>
                $("#fine").val('');
            }
            $('#item_id').val(null).trigger('change');
            $("#grwt").val('');
            $("#less").val('');
            $("#net_wt").val('');
            $("#touch_id").val(null).trigger("change");
            $("#touch_data_id").val('');
            <?php if($wstg_2 == '1') { ?>
                $("#wstg").val('');
            <?php } else { ?>
                $("#wstg").val('0');
            <?php } ?>
            $("#fine").val('');
        });

        $(document).on('change', '#item_id', function () {
            $("#grwt").val('');
            $("#less").val('');
            $("#net_wt").val('');
            $("#touch_id").val(null).trigger("change");
            $("#touch_data_id").val('');
            <?php if($wstg_2 == '1') { ?>
                $("#wstg").val('');
            <?php } else { ?>
                $("#wstg").val('0');
            <?php } ?>
            $("#fine").val('');
            var item_id = $('#item_id').val();
            var account_id = $('#account_id').val();
            if (item_id != '' && item_id != null) {
                $.ajax({
                    url: "<?php echo base_url('sell/get_item_data'); ?>/" + item_id,
                    type: "GET",
                    async: false,
                    data: "",
                    success: function (response) {
                        var json = $.parseJSON(response);
                        if (json.less == 0) {
                            $('#less').attr('readonly', 'readonly');
                            $('#less_ad_details').addClass('hide');
                            $("#grwt").focus();
                            $(document).on('change', '#grwt', function () {
                                $('.touch_id').focus();
                            });
                        } else {
                            $('#less').removeAttr('readonly', 'readonly');
                            $('#less_ad_details').removeClass('hide');
                            $("#grwt").focus();
                            $(document).on('change', '#grwt', function () {
                                $('#less').focus();
                            });
                        }
                        <?php if($use_category == '1') { ?>
                        <?php } else { ?>
                            $('#category_id').val(json.category_id);
                        <?php } ?>
                        
                        if (json.stock_method == '2') {
                            var sell_type_id = $('#sell_type_id').val();
                            if(sell_type_id == <?php echo SELL_TYPE_SELL_ID; ?>){
                                var process_id = $('#process_id').val();
                                var sell_id = '';
                                <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { ?>
                                    sell_id = '<?php echo $sell_data->sell_id; ?>';
                                <?php } ?>
                                $.ajax({
                                    url: "<?php echo base_url('inventory_sell_purchase/get_purchase_to_sell_pending_item'); ?>/",
                                    type: 'POST',
                                    async: false,
                                    data: {department_id : process_id, item_id : item_id, sell_id : sell_id, account_id : account_id},
                                    success: function (response) {
                                        var json = $.parseJSON(response);
                                        $('#purchase_item_selection_popup').modal('show');
                                        if (json['sell_lineitems'] != '') {
                                            pts_lineitem_objectdata = json['sell_lineitems'];
                                            display_pts_lineitem_html(pts_lineitem_objectdata);
                                        } else {
                                            pts_lineitem_objectdata = [];
                                            display_pts_lineitem_html(pts_lineitem_objectdata);
                                        }
                                    }
                                });
                            }
                        }
                        var sell_type_id = $('#sell_type_id').val();
                        if(sell_type_id == <?php echo SELL_TYPE_SELL_ID; ?>){
                            get_wstg_from_account();
                        }
                    }
                });
            }
        });

        $('#purchase_item_selection_popup').on('hidden.bs.modal', function () {
            $("#item_id").val(null).trigger("change");
            $(".delete_sp_item").removeClass('hide');
        });

        $(document).on('keyup change', '.pts_grwt, .pts_less, .pts_wstg', function () {
            var pts_selected_index = $(this).data('pts_selected_index');
            var pts_grwt = $('#pts_grwt_' + pts_selected_index).val();
            var pts_less = $('#pts_less_' + pts_selected_index).val();
            var pts_wstg = $('#pts_wstg_' + pts_selected_index).val();
//            pts_lineitem_objectdata[pts_selected_index].grwt = pts_grwt;
            var pe_stock_grwt = pts_lineitem_objectdata[pts_selected_index].grwt;
//            console.log(pts_grwt + ' ' + pe_stock_grwt);
            <?php // if($without_purchase_sell_allow == '1'){ ?>
            if(parseFloat(pts_grwt) > parseFloat(pe_stock_grwt)){
                show_notify('Please Enter GrWt Less than of ' + pe_stock_grwt, false);
                $(this).val(pe_stock_grwt).keyup();
                return false;
            }
            <?php // } ?>
            pts_lineitem_objectdata[pts_selected_index].net_wt = parseFloat(pts_grwt || 0) - parseFloat(pts_less || 0);
            pts_lineitem_objectdata[pts_selected_index].net_wt = round(pts_lineitem_objectdata[pts_selected_index].net_wt, 2).toFixed(3);
            pts_lineitem_objectdata[pts_selected_index].fine = parseFloat(pts_lineitem_objectdata[pts_selected_index].net_wt) * (parseFloat(pts_lineitem_objectdata[pts_selected_index].touch_id) + parseFloat(pts_wstg || 0)) / 100;
            pts_lineitem_objectdata[pts_selected_index].fine = round(pts_lineitem_objectdata[pts_selected_index].fine, 2).toFixed(3);
            $('#pts_net_wt_' + pts_selected_index).html(pts_lineitem_objectdata[pts_selected_index].net_wt);
            $('#pts_fine_' + pts_selected_index).html(pts_lineitem_objectdata[pts_selected_index].fine);
            checked_average_value();
        });
        
        $(document).on('keyup change', '#grwt, #less', function () {
            var grwt = parseFloat($('#grwt').val()) || 0;
            grwt = round(grwt, 2).toFixed(3);
            var less = parseFloat($('#less').val()) || 0;
            less = round(less, 2).toFixed(3);
            if(parseFloat(less) > parseFloat(grwt)){
                show_notify('Less Can not be > grwt.', false);
                $("#less").val('');
                $("#less").focus();
                $("#grwt").trigger('change');
                return false;
            }
            var net_wt = 0;
            net_wt = parseFloat(grwt) - parseFloat(less);
            net_wt = round(net_wt, 2).toFixed(3);
            $('#net_wt').val(net_wt).change();
        });

        $(document).bind('keyup change', '#net_wt, .touch_id, #wstg', function () {
            var net_wt = parseFloat($('#net_wt').val()) || 0;
            net_wt = round(net_wt, 2).toFixed(3);
            var wstg = parseFloat($('#wstg').val()) || 0;
            var sell_type_id = $('#sell_type_id').val();
            if (sell_type_id == '<?php echo SELL_TYPE_EXCHANGE_ID; ?>') {
                var touch = parseFloat($('#touch_data_id').val()) || 0;
            } else {
                if($('#tunch_textbox').prop("checked") == true){
                    var touch = parseFloat($('#touch_data_id').val()) || 0;
                } else {
                    var touch = parseFloat($('#touch_id').val()) || 0;
                }
            }
            var fine = 0;
            fine = parseFloat(net_wt) * (parseFloat(touch) + parseFloat(wstg)) / 100;
            fine = round(fine, 2).toFixed(3);
            $('#fine').val(fine);
        });

        <?php if (isset($sell_data->discount_amount) && !empty($sell_data->discount_amount)) { ?>
            discount_amount = $('#discount_amount').val() || 0;
            get_bill_total_amount();
        <?php } ?>
        $(document).bind('keyup change', '#discount_amount', function () {
            discount_amount = $('#discount_amount').val() || 0;
            get_bill_total_amount();
        });
        
        $(document).on('change', '.cash_cheque', function () {
            var cash_cheque = $('.cash_cheque').val();
            if(cash_cheque == 2){
                $('.banks').show();
                initAjaxSelect2($("#bank_id"), "<?= base_url('app/account_bank_select2_source') ?>");
            } else {
                $("#bank_id").val(null).trigger("change");
                $('.banks').hide();
            }
        });
        
        $(document).on('click', '#payment_receipt_button', function () {
            if (!$('input[name=payment_receipt]:checked').val()) {
                show_notify('Please Select Payment or Receipt.', false);
                $("#payment_receipt").focus();
                return false;
            }
            if ($.trim($("#cash_cheque").val()) == '') {
                show_notify('Please Select Cash or Bank.', false);
                $("#cash_cheque").focus();
                return false;
            }
            var cash_cheque = $('.cash_cheque').val();
            if(cash_cheque == 2){
                if ($.trim($("#bank_id").val()) == '') {
                    show_notify('Please Select Bank.', false);
                    $("#bank_id").focus();
                    return false;
                }
            }
            if ($.trim($("#amount").val()) == '') {
                show_notify('Please Enter Amount.', false);
                $("#amount").focus();
                return false;
            }
            
            $('#payment_receipt_button').attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var lineitem = {};
            $('select[name^="pay_rec_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("pay_rec_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="pay_rec_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("pay_rec_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('textarea[name^="pay_rec_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("pay_rec_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            
            var payment_receipt = $('input[name=payment_receipt]:checked').val();
            lineitem['payment_receipt'] = payment_receipt;
            if(cash_cheque == 2){
                var bank_data = $('#bank_id').select2('data');
                lineitem['bank_name'] = bank_data[0].text;
            } else { lineitem['bank_name'] = ''; }
            var new_lineitem = JSON.parse(JSON.stringify(lineitem));
            
            var pay_rec_index = $("#pay_rec_index").val();
            if (pay_rec_index != '') {
                pay_rec_objectdata.splice(pay_rec_index, 1, new_lineitem);
            } else {
                pay_rec_objectdata.push(new_lineitem);
            }
            
            display_pay_rec_html(pay_rec_objectdata);
            $('#payment_receipt_model').modal('hide');
            $('.pay_rec_table').show();
            $('#payment_receipt_button').removeAttr('disabled', 'disabled');
        });

        $('#payment_receipt_model').on('shown.bs.modal', function () {
            if ($.trim($("#amount").val()) == '') {
                $('#cash_cheque').select2('open');
            }
        });
        
        $('#payment_receipt_model').on('hidden.bs.modal', function () {
            $('#pay_rec_id').val('');
            $("input[name=payment_receipt]").prop("checked",false);
            $('#cash_cheque').val('1').trigger("change");
            $('#bank_id').val(null).trigger("change");
            $("#amount").val('');
            $("#narration").val('');
            $("#pay_rec_index").val('');
            $(".delete_pr_item").removeClass('hide');
            $('#cash_cheque').select2("close");
        });
        
        $(document).bind('keyup change', '#metal_grwt, #metal_tunch', function () {
            var metal_grwt = parseFloat($('#metal_grwt').val()) || 0;
            metal_grwt = round(metal_grwt, 2).toFixed(3);
            var metal_tunch = parseFloat($('#metal_tunch').val()) || 0;
            var fine = 0;
            fine = parseFloat(metal_grwt) * parseFloat(metal_tunch) / 100;
            fine = round(fine, 2).toFixed(3);
            $('#metal_fine').val(fine);
        });
        
        $(document).on('click', '#metal_button', function () {
            if (!$('input[name=metal_payment_receipt]:checked').val()) {
                show_notify('Please Select Payment or Receipt.', false);
                $("#metal_payment_receipt").focus();
                return false;
            }
            var metal_payment_receipt = $('input[name=metal_payment_receipt]:checked').val();
            var metal_item_id = $('#metal_item_id').val();
            var metal_tunch = $('#metal_tunch').val();
            var metal_grwt = $('#metal_grwt').val();
            var department_id = $('#process_id').val();
            if (metal_item_id == '' || metal_item_id == null) {
                $("#metal_item_id").select2('open');
                show_notify("Please select Item!", false);
                return false;
            }
            if (metal_grwt == '' || metal_grwt == null) {
                $("#metal_grwt").focus();
                show_notify("Please Enter Gr.Wt.!", false);
                return false;
            }else {
                var total_grwt_metal = $('#total_grwt_metal').val();
                <?php if($without_purchase_sell_allow == '1'){ ?>
                    if(total_grwt_metal != '' && total_grwt_metal != null){
                        var metal_grwt = parseFloat($('#metal_grwt').val()) || 0;
                        metal_grwt = round(metal_grwt, 2).toFixed(3);
                        if(parseFloat(metal_grwt) < parseFloat(total_grwt_metal)){
                            show_notify("Gr.Wt. Should Be Grater Than " + total_grwt_metal , false);
                            $('#metal_grwt').val(total_grwt_metal);
                            $("#metal_grwt").focus();
                            return false;
                        }
                    }
                <?php } ?>
            }
            <?php if($without_purchase_sell_allow == '1'){ ?>
                if(metal_payment_receipt == 1){
                    var metal_pr_id = $("#metal_pr_id").val();
                    var grwt_stock = get_stock_for_metal_receipt(department_id,metal_item_id,metal_tunch,metal_pr_id);
                    if(parseFloat(grwt_stock) < parseFloat(metal_grwt)){
                        show_notify('Please Enter GrWt Less than of ' + grwt_stock, false);
                        return false;
                    }
                }
            <?php } ?>
            $('#metal_button').attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var lineitem = {};
            var is_validate = '0';
            $('select[name^="metal_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("metal_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="metal_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("metal_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
//            $('select[name^="line_items_data"]').each(function (index) {
//                key = $(this).attr('name');
//                key = key.replace("line_items_data[", "");
//                key = key.replace("]", "");
////                console.log(lineitem_objectdata);
//                $.each(metal_objectdata, function (index, value) {
//                    if (value.metal_payment_receipt == metal_payment_receipt && value.metal_item_id == metal_item_id && value.metal_tunch == metal_tunch && typeof (value.id) != "undefined" && value.id !== null) {
//                        $('input[name^="line_items_data"]').each(function (index) {
//                            keys = $(this).attr('name');
//                            keys = keys.replace("line_items_data[", "");
//                            keys = keys.replace("]", "");
//                            if (keys == 'id') {
//                                if (value.id != $(this).val()) {
//                                    is_validate = '1';
//                                    
//                                }
//                            }
//                        });
//                    } else if (value.metal_payment_receipt == metal_payment_receipt && value.metal_item_id == metal_item_id && value.metal_tunch == metal_tunch) {
//                        if(metal_index !== index){
//                            is_validate = '1';
//                        }
//                    }
//                });
//                
//            });
            if (is_validate == '1') {
                show_notify("You cannot Add this Item. This Item has been used!", false);
                $('#metal_button').removeAttr('disabled', 'disabled');
                return false;
            } else {
            
            var metal_item_id = $('#metal_item_id').val();
            var item_data = $('#metal_item_id').select2('data');
            lineitem['metal_item_name'] = item_data[0].text;
            
            $.ajax({
                url: "<?php echo base_url('sell/get_category_group'); ?>/" + metal_item_id,
                type: "GET",
                async: false,
                data: "",
                success: function(response){
                    var json = $.parseJSON(response);
                    lineitem['group_name'] = json;
                    lineitem['metal_payment_receipt'] = metal_payment_receipt;
                    if(lineitem['group_name'] == '<?php echo CATEGORY_GROUP_GOLD_ID; ?>'){
                        lineitem['metal_grwt'] = round(lineitem['metal_grwt'], 2).toFixed(3);
                        var metal_fine = lineitem['metal_fine'] = round(lineitem['metal_fine'], 2).toFixed(3);
                    } else {
                        lineitem['metal_grwt'] = round(lineitem['metal_grwt'], 1).toFixed(3);
                        var metal_fine = lineitem['metal_fine'] = round(lineitem['metal_fine'], 1).toFixed(3);
                    }
                    lineitem['total_grwt_metal'] = $('#total_grwt_metal').val();
                    var new_lineitem = JSON.parse(JSON.stringify(lineitem));
                    metal_index = $("#metal_index").val();
                    if (metal_index != '') {
                        metal_objectdata.splice(metal_index, 1, new_lineitem);
                    } else {
                        metal_objectdata.push(new_lineitem);
                    }
                    
                    display_metal_html(metal_objectdata);
                    metal_index = '';
                }
            });
            }
            $('#metal_receipt_payment_model').modal('hide');
            $('.metal_table').show();
            $('#metal_button').removeAttr('disabled', 'disabled');
        });
        
        $('#metal_receipt_payment_model').on('shown.bs.modal', function () {
            if ($.trim($("#metal_grwt").val()) == '') {
                $('#metal_item_id').select2('open');
            }
        });
        
        $('#metal_receipt_payment_model').on('hidden.bs.modal', function () {
            $('#metal_pr_id').val('');
            $("input[name=metal_payment_receipt]").prop("checked",false);
            $("input[name=metal_payment_receipt]").removeAttr("disabled",false);
            $('#metal_item_id').removeAttr('disabled', true);
            $('#metal_tunch').removeAttr('readonly', true);
            $("#metal_item_id").val(null).trigger("change");
            $("#metal_grwt").val('');
            $("#metal_tunch").val(100);
            $("#metal_fine").val('');
            $("#metal_narration").val('');
            $("#metal_index").val('');
            $('#total_grwt_metal').val('');
            $(".delete_mpr_item").removeClass('hide');
            $('#metal_item_id').select2("close");
        });
        
        $(document).on('keyup change', '#gold_weight, #gold_rate', function () {
            var gold_weight = parseFloat($('#gold_weight').val()) || 0;
            gold_weight = round(gold_weight, 2).toFixed(3);
            var gold_rate = parseFloat($('#gold_rate').val()) || 0;
            gold_rate = round(gold_rate, 2).toFixed(3);
            var value = 0;
            var value = parseFloat(gold_weight) * (parseFloat(gold_rate) / 10);
            $('#gold_value').val(round10(value.toFixed(0)));
        });
        
        $(document).on('change', '#gold_rate', function() {
            var gold_rate = $('#gold_rate').val();
            var gold_min = <?php echo $gold_min; ?>;
            var gold_max = <?php echo $gold_max; ?>;
            if((gold_rate < gold_min) || (gold_rate > gold_max)){
                if (confirm('Gold Rate is Out of Range, Are You Sure?')) {
                    var allow_to_save_gs_bhav_out = <?php echo $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow to save gold / silver bhav out of range"); ?>;
                    if(allow_to_save_gs_bhav_out != 1){
                        show_notify('You have Not Allow to Save Gold / Silver Bhav Out of Range.', false);
                        return false;
                    }
                } else {
                    $('#gold_rate').val('');
                    $('#gold_rate').focus();
                }
            }
        });
        
        $(document).on('click', '#gold_button', function ()  {
            if (!$('input[name=gold_sale_purchase]:checked').val()) {
                show_notify('Please Select Sale or Purchase.', false);
                $("#gold_sale_purchase").focus();
                return false;
            }
            
            if ($.trim($("#gold_weight").val()) == '') {
                show_notify('Please Enter Weight.', false);
                $("#gold_weight").focus();
                return false;
            }
            
            if ($.trim($("#gold_rate").val()) == '') {
                show_notify('Please Enter Rate.', false);
                $("#gold_rate").focus();
                return false;
            }
            
            var gold_rate = $('#gold_rate').val();
            var gold_min = <?php echo $gold_min; ?>;
            var gold_max = <?php echo $gold_max; ?>;
            if((gold_rate < gold_min) || (gold_rate > gold_max)){
                var allow_to_save_gs_bhav_out = <?php echo $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow to save gold / silver bhav out of range"); ?>;
                if(allow_to_save_gs_bhav_out != 1){
                    show_notify('You have Not Allow to Save Gold / Silver Bhav Out of Range.', false);
                    return false;
                }
            }
            
            $('#gold_button').attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var lineitem = {};
            $('select[name^="gold_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("gold_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="gold_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("gold_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            var gold_sale_purchase = $('input[name=gold_sale_purchase]:checked').val();
            lineitem['gold_sale_purchase'] = gold_sale_purchase;
            var new_lineitem = JSON.parse(JSON.stringify(lineitem));

            var gold_index = $("#gold_index").val();
            if (gold_index != '') {
                gold_objectdata.splice(gold_index, 1, new_lineitem);
            } else {
                gold_objectdata.push(new_lineitem);
            }
            display_gold_html(gold_objectdata);
            $('#gold_bhav_model').modal('hide');
            $('.gold_table').show();
            $('#gold_button').removeAttr('disabled', 'disabled');
        });
        
        $('#gold_bhav_model').on('shown.bs.modal', function () {
            $('#gold_weight').focus();
        });
        
        $('#gold_bhav_model').on('hidden.bs.modal', function () {
            $("#gold_id").val('');
            $("input[name=gold_sale_purchase]").prop("checked",false);
            $("#gold_weight").val('');
            $("#gold_rate").val('');
            $("#gold_value").val('');
            $('#gold_cr_effect').val('1').trigger("change");
            $("#gold_narration").val('');
            $("#gold_index").val('');
            $(".delete_g_item").removeClass('hide');
        });
        
        $(document).on('keyup change', '#silver_weight, #silver_rate', function () {
            var silver_weight = parseFloat($('#silver_weight').val()) || 0;
            silver_weight = round(silver_weight, 1).toFixed(3);
            var silver_rate = parseFloat($('#silver_rate').val()) || 0;
            silver_rate = round(silver_rate, 1).toFixed(3);
            var value = 0;
            var value = parseFloat(silver_weight) * (parseFloat(silver_rate) / 10);
            $('#silver_value').val(round10(value.toFixed(0)));
        });
        
        $(document).on('change', '#silver_rate', function() {
            var silver_rate = $('#silver_rate').val();
            var silver_min = <?php echo $silver_min; ?>;
            var silver_max = <?php echo $silver_max; ?>;
            if((silver_rate < silver_min) || (silver_rate > silver_max)){
                if (confirm('Silver Rate is Out of Range, Are You Sure?')) {
                    var allow_to_save_gs_bhav_out = <?php echo $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow to save gold / silver bhav out of range"); ?>;
                    if(allow_to_save_gs_bhav_out != 1){
                        show_notify('You have Not Allow to Save Gold / Silver Bhav Out of Range.', false);
                        return false;
                    }
                } else {
                    $('#silver_rate').val('');
                    $('#silver_rate').focus();
                }
            }
        });
        
        $(document).on('click', '#silver_button', function () {
            if (!$('input[name=silver_sale_purchase]:checked').val()) {
                show_notify('Please Select Sale or Purchase.', false);
                $(".silver_sale_purchase").focus();
                return false;
            }
            if ($.trim($("#silver_weight").val()) == '') {
                show_notify('Please Enter Weight.', false);
                $("#silver_weight").focus();
                return false;
            }
            if ($.trim($("#silver_rate").val()) == '') {
                show_notify('Please Enter Rate.', false);
                $("#silver_rate").focus();
                return false;
            }
            
            var silver_rate = $('#silver_rate').val();
            var silver_min = <?php echo $silver_min; ?>;
            var silver_max = <?php echo $silver_max; ?>;
            if((silver_rate < silver_min) || (silver_rate > silver_max)){
                var allow_to_save_gs_bhav_out = <?php echo $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow to save gold / silver bhav out of range"); ?>;
                if(allow_to_save_gs_bhav_out != 1){
                    show_notify('You have Not Allow to Save Gold / Silver Bhav Out of Range.', false);
                    return false;
                }
            }
            
            $('#silver_button').attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var lineitem = {};
            $('select[name^="silver_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("silver_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="silver_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("silver_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            var silver_sale_purchase = $('input[name=silver_sale_purchase]:checked').val();
            lineitem['silver_sale_purchase'] = silver_sale_purchase;
            var new_lineitem = JSON.parse(JSON.stringify(lineitem));
            
            var silver_index = $("#silver_index").val();
            if (silver_index != '') {
                silver_objectdata.splice(silver_index, 1, new_lineitem);
            } else {
                silver_objectdata.push(new_lineitem);
            }
            display_silver_html(silver_objectdata);
            $('#silver_bhav_model').modal('hide');
            $('.silver_table').show();
            $('#silver_button').removeAttr('disabled', 'disabled');
        });
        
        $('#silver_bhav_model').on('shown.bs.modal', function () {
            $('#silver_weight').focus();
        });
        
        $('#silver_bhav_model').on('hidden.bs.modal', function () {
            $('#silver_id').val('');
            $("input[name=silver_sale_purchase]").prop("checked",false);
            $("#silver_weight").val('');
            $("#silver_rate").val('');
            $("#silver_value").val('');
            $('#silver_cr_effect').val('1').trigger("change");
            $("#silver_narration").val('');
            $("#silver_index").val('');
            $(".delete_s_item").removeClass('hide');
        });
        
        $(document).on('change', '#transfer_account_id', function (){
            var transfer_account_id = $('#transfer_account_id').val();
            if(transfer_account_id != '' && transfer_account_id != null){
                $.ajax({
                    url: "<?= base_url('sell/get_account_old_balance') ?>/" + transfer_account_id,
                    type: 'GET',
                    data: '',
                    success: function (response) {
                        var json = $.parseJSON(response);
                        var gold_fine = parseFloat(json.gold_fine);
                        var silver_fine = parseFloat(json.silver_fine);
                        var amount = parseFloat(json.amount);
                        $('.selected_account_gold_fine').html(gold_fine);
                        $('.selected_account_silver_fine').html(silver_fine);
                        $('.selected_account_amount').html(amount);
                    }
                });
            } else {
                $('.selected_account_gold_fine').html('');
                $('.selected_account_silver_fine').html('');
                $('.selected_account_amount').html('');
            }
        });
        
        $(document).on('click', '#transfer_button', function () {
            if (!$('input[name=naam_jama]:checked').val()) {
                show_notify('Please Select Naam or Jama.', false);
                $("#naam_jama").focus();
                return false;
            }
            if (!$('#transfer_account_id').val()) {
                show_notify('Please Select Party Name.', false);
                $("#transfer_account_id").focus();
                return false;
            }
            var transfer_gold = $('#transfer_gold').val() || 0;
            var transfer_silver = $('#transfer_silver').val() || 0;
            var transfer_amount = $('#transfer_amount').val() || 0;
            if (transfer_gold <= 0 && transfer_silver <= 0 && transfer_amount <= 0) {
                show_notify('Please Enter Gold, Silver or Amount.', false);
                return false;
            }
            
            $('#transfer_button').attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var lineitem = {};
            $('select[name^="transfer_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("transfer_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="transfer_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("transfer_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            var naam_jama = $('input[name=naam_jama]:checked').val();
            lineitem['naam_jama'] = naam_jama;
            var party_name = $('#transfer_account_id').select2('data');
            lineitem['party_name'] = party_name[0].text;
            var transfer_gold = lineitem['transfer_gold'] = round(lineitem['transfer_gold'], 2).toFixed(3);
            var transfer_silver = lineitem['transfer_silver'] = round(lineitem['transfer_silver'], 2).toFixed(3);
            var transfer_amount = lineitem['transfer_amount'] = parseFloat($('#transfer_amount').val()) || 0;
            var new_lineitem = JSON.parse(JSON.stringify(lineitem));

            var transfer_index = $("#transfer_index").val();
            if (transfer_index != '') {
                transfer_objectdata.splice(transfer_index, 1, new_lineitem);
            } else {
                transfer_objectdata.push(new_lineitem);
            }
            
            display_transfer_html(transfer_objectdata);
            $('#transfer_model').modal('hide');
            $('.transfer_table').show();
            $('#transfer_button').removeAttr('disabled', 'disabled');
        });
        
        $('#transfer_model').on('shown.bs.modal', function () {
            if ($.trim($("#transfer_account_id").val()) == '') {
                $('#transfer_account_id').select2('open');
            }
        });
        
        $('#transfer_model').on('hidden.bs.modal', function () {
            $('#transfer_entry_id').val('');
            $("input[name=naam_jama]").prop("checked",false);
            $('#transfer_account_id').val(null).trigger("change");
            $("#transfer_gold").val('');
            $("#transfer_silver").val('');
            $("#transfer_amount").val('');
            $("#transfer_narration").val('');
            $("#transfer_index").val('');
            $('.selected_account_gold_fine').html('');
            $('.selected_account_silver_fine').html('');
            $('.selected_account_amount').html('');
            $(".delete_t_item").removeClass('hide');
            $('#transfer_account_id').select2("close");
        });
        
        $(document).on('click', '#ad_charges_button', function () {
            var ad_id = $("#ad_id").val();
            if (ad_id == '' || ad_id == null) {
                $("#ad_id").select2('open');
                show_notify("Please select Ad!", false);
                return false;
            }
            var ad_pcs = $("#ad_pcs").val();
            if (ad_pcs == '' || ad_pcs == null) {
                show_notify("Ad Pcs is required!", false);
                $("#ad_pcs").focus();
                return false;
            }
            var ad_rate = $("#ad_rate").val();
            if (ad_rate == '' || ad_rate == null) {
                show_notify("Ad Rate is required!", false);
                $("#ad_rate").focus();
                return false;
            }
            $('#ad_charges_button').attr('disabled', 'disabled');
            var key = '';
            var value = '';
            var lineitem = {};
            $('select[name^="ad_lineitem_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("ad_lineitem_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="ad_lineitem_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("ad_lineitem_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            var ad_name = $('#ad_id').select2('data');
            lineitem['ad_name'] = ad_name[0].text;
            var ad_amount = lineitem['ad_amount'] = parseFloat($('#ad_amount').val()) || 0;
            var new_lineitem = JSON.parse(JSON.stringify(lineitem));
            
            var ad_lineitem_index = $("#ad_lineitem_index").val();
            if (ad_lineitem_index != '') {
                ad_charges_objectdata.splice(ad_lineitem_index, 1, new_lineitem);
            } else {
                ad_charges_objectdata.push(new_lineitem);
            }
            
            display_ad_charges_html(ad_charges_objectdata);
            $('#ad_charges_model').modal('hide');
            $('.ad_charges_table').show();
            $('#ad_charges_button').removeAttr('disabled', 'disabled');
        });
        
        $('#ad_charges_model').on('shown.bs.modal', function () {
            initAjaxSelect2($("#ad_id"), "<?= base_url('app/ad_name_select2_source/is_sell_purchase_ad_charges') ?>");
            if ($.trim($("#ad_id").val()) == '') {
                $('#ad_id').select2('open');
            }
        });
        
        $('#ad_charges_model').on('hidden.bs.modal', function () {
            $('#sell_ad_charges_id').val('');
            $('#ad_id').val(null).trigger("change");
            $("#ad_pcs").val('');
            $("#ad_rate").val('');
            $("#ad_amount").val('');
            $("#ad_lineitem_index").val('');
            $('#ad_charges_model').modal('hide');
            $(".delete_ad_item").removeClass('hide');
            $('#ad_id').select2("close");
        });

        $(document).on('click', '#adjust_cr_button', function () {
            var adjust_cr_amount = $("#adjust_cr_amount").val();
            if (adjust_cr_amount == '' || adjust_cr_amount == null) {
                show_notify("Amount is required!", false);
                $("#adjust_cr_amount").focus();
                return false;
            }
            $('#adjust_cr_button').attr('disabled', 'disabled');
            var lineitem = {};
            lineitem['sell_adjust_cr_id'] = $('#sell_adjust_cr_id').val();
            lineitem['adjust_to'] = $('#adjust_to').val();
            if(lineitem['adjust_to'] == '1'){
                var adjust_to_name = 'R Amt to C Amt';
            } else {
                var adjust_to_name = 'C Amt to R Amt';
            }
            lineitem['adjust_to_name'] = adjust_to_name;
            lineitem['adjust_cr_amount'] = adjust_cr_amount || 0;
            var new_lineitem = JSON.parse(JSON.stringify(lineitem));

            var adjust_cr_lineitem_index = $("#adjust_cr_lineitem_index").val();
            if (adjust_cr_lineitem_index != '') {
                adjust_cr_objectdata.splice(adjust_cr_lineitem_index, 1, new_lineitem);
            } else {
                adjust_cr_objectdata.push(new_lineitem);
            }

            display_adjust_cr_html(adjust_cr_objectdata);
            $('#adjust_cr_model').modal('hide');
            $('.adjust_cr_table').show();
            $('#adjust_cr_button').removeAttr('disabled', 'disabled');
        });

        $('#adjust_cr_model').on('shown.bs.modal', function () {
            $('#adjust_to').focus();
        });

        $('#adjust_cr_model').on('hidden.bs.modal', function () {
            $('#sell_adjust_cr_id').val('');
            $('#adjust_to').val('1');
            $("#adjust_cr_amount").val('');
            $("#adjust_cr_lineitem_index").val('');
            $('#adjust_cr_model').modal('hide');
            $(".delete_adjust_cr_item").removeClass('hide');
        });

        $(document).on('click', '#order_to_sell_button', function () {
            var order_grwt= new Array();
            $("input[name='order_grwt[]']").each(function(){
                order_grwt.push($(this).val());
            });
            var order_less= new Array();
            $("input[name='order_less[]']").each(function(){
                order_less.push($(this).val());
            });
            if ($("input.selected_index:checked").length == 0) {
                show_notify('Please select at least one item.', false);
                return false;
            }
            
            var selected_index_lineitems = [];
            var order_gold_bhav = 0;
            var order_silver_bhav = 0;
            $.each($("input.selected_index:checked"), function() {
                var selected_index = $(this).data('selected_index');
                ots_lineitem_objectdata[selected_index].sell_item_delete = 'allow';
                ots_lineitem_objectdata[selected_index].grwt = order_grwt[selected_index];
                ots_lineitem_objectdata[selected_index].less = order_less[selected_index];
                ots_lineitem_objectdata[selected_index].net_wt = parseFloat(ots_lineitem_objectdata[selected_index].grwt) - parseFloat(ots_lineitem_objectdata[selected_index].less);
                ots_lineitem_objectdata[selected_index].net_wt = round(ots_lineitem_objectdata[selected_index].net_wt, 2).toFixed(3);
                ots_lineitem_objectdata[selected_index].fine = parseFloat(ots_lineitem_objectdata[selected_index].net_wt) * (parseFloat(ots_lineitem_objectdata[selected_index].touch_id) + parseFloat(ots_lineitem_objectdata[selected_index].wstg)) / 100;
                
                selected_index_lineitems.push(ots_lineitem_objectdata[selected_index]);
                
                if(ots_lineitem_objectdata[selected_index].group_name == '<?php echo CATEGORY_GROUP_GOLD_ID; ?>'){
                    order_gold_bhav = order_gold_bhav + parseFloat(ots_lineitem_objectdata[selected_index].fine);
                }
                if(ots_lineitem_objectdata[selected_index].group_name == '<?php echo CATEGORY_GROUP_SILVER_ID; ?>'){
                    order_silver_bhav = order_silver_bhav + parseFloat(ots_lineitem_objectdata[selected_index].fine);
                }
			});
            <?php if (isset($new_order_data->gold_price) && !empty($new_order_data->gold_price)) { ?>
                if(order_gold_bhav != 0){
                    $('input:radio[name=gold_sale_purchase]').filter('[value=1]').prop('checked', true);
                    var gold_weight = order_gold_bhav;
                    var gold_rate = <?php echo $new_order_data->gold_price; ?>;
                    $('#gold_weight').val(gold_weight);
                    $('#gold_rate').val(gold_rate);
                    var value = gold_weight * (gold_rate / 10);
                    $('#gold_value').val(value.toFixed(0));
                    $('#gold_button').click();
                }
            <?php } ?>
            <?php if (isset($new_order_data->silver_price) && !empty($new_order_data->silver_price)) { ?>
                if(order_silver_bhav != 0){
                    $('input:radio[name=silver_sale_purchase]').filter('[value=1]').prop('checked', true);
                    var silver_weight = order_silver_bhav;
                    var silver_rate = <?php echo $new_order_data->silver_price; ?>;
                    $('#silver_weight').val(silver_weight);
                    $('#silver_rate').val(silver_rate);
                    var value = silver_weight * (silver_rate / 10);
                    $('#silver_value').val(value.toFixed(0));
                    $('#silver_button').click();
                }
            <?php } ?>
            $('#item_selection_popup').modal('hide');
            lineitem_objectdata = selected_index_lineitems;
            display_lineitem_html(lineitem_objectdata);
        });
        
        $(document).on('click', '#purchase_to_sell_button', function () {
//            console.log(lineitem_objectdata);
            var pts_grwt= new Array();
            $("input[name='pts_grwt[]']").each(function(){
                pts_grwt.push($(this).val());
            });
            var pts_less= new Array();
            $("input[name='pts_less[]']").each(function(){
                pts_less.push($(this).val());
            });
            var pts_wstg= new Array();
            $("input[name='pts_wstg[]']").each(function(){
                pts_wstg.push($(this).val());
            });
            if ($("input.pts_selected_index:checked").length == 0) {
                show_notify('Please select at least one item.', false);
                return false;
            }
            var pts_selected_index_lineitems = [];
            var pts_item_id = '';
            var sell_allow = 1;
            $.each($("input.pts_selected_index:checked"), function() {
                pts_item_id = $(this).data('item_id');
                var pts_selected_index = $(this).data('pts_selected_index');
                pts_lineitem_objectdata[pts_selected_index].sell_item_delete = 'allow';
                pts_lineitem_objectdata[pts_selected_index].grwt = pts_grwt[pts_selected_index] || 0;
                pts_lineitem_objectdata[pts_selected_index].less = pts_less[pts_selected_index] || 0;
                pts_lineitem_objectdata[pts_selected_index].wstg = pts_wstg[pts_selected_index];
                pts_lineitem_objectdata[pts_selected_index].net_wt = parseFloat(pts_lineitem_objectdata[pts_selected_index].grwt || 0) - parseFloat(pts_lineitem_objectdata[pts_selected_index].less || 0);
                pts_lineitem_objectdata[pts_selected_index].net_wt = round(pts_lineitem_objectdata[pts_selected_index].net_wt, 2).toFixed(3);
                pts_lineitem_objectdata[pts_selected_index].fine = parseFloat(pts_lineitem_objectdata[pts_selected_index].net_wt) * (parseFloat(pts_lineitem_objectdata[pts_selected_index].touch_id) + parseFloat(pts_lineitem_objectdata[pts_selected_index].wstg || 0)) / 100;
                pts_lineitem_objectdata[pts_selected_index].fine = round(pts_lineitem_objectdata[pts_selected_index].fine, 2).toFixed(3);
                
                /******* You not allow to Sell, The Parchse of same Entry! Start *******/
                $.each(lineitem_objectdata, function(index, value) {
                    if(typeof(pts_lineitem_objectdata[pts_selected_index].purchase_sell_item_id) !== "undefined" && 
                            pts_lineitem_objectdata[pts_selected_index].purchase_sell_item_id !== null && 
                            typeof(value.sell_item_id) !== "undefined" && value.sell_item_id !== null && 
                            pts_lineitem_objectdata[pts_selected_index].purchase_sell_item_id == value.sell_item_id && 
                            (pts_lineitem_objectdata[pts_selected_index].stock_type == '1' ||  pts_lineitem_objectdata[pts_selected_index].stock_type == '2')) {
                        show_notify('You not allow to Sell, The Purchase of same Entry!', false);
                        sell_allow = 0;
                        return false;
                    }
                });
                if(sell_allow == 1){
                    pts_selected_index_lineitems.push(pts_lineitem_objectdata[pts_selected_index]);
                }
                /******* You not allow to Sell, The Parchse of same Entry! End *******/
            });
            $('#purchase_item_selection_popup').modal('hide');
            
            /******* Remove Same Item Sell Entry! Start *******/
            var remove_arr = [];
            $.each(lineitem_objectdata, function(index, value) {
                if(typeof(value.item_id) !== "undefined" && value.item_id !== null && value.item_id == pts_item_id && value.type == '1') {
                    remove_arr.push(index);
                }
            });
            if (remove_arr.length != 0) {
               var remove_arr_inc = 0;
               $.each(remove_arr, function (index, value) {
                   var remove_index = value - remove_arr_inc;
                   lineitem_objectdata.splice(remove_index, 1);
                   remove_arr_inc++;
               });
            }
            /******* Remove Same Item Sell Entry! End *******/
            
//            lineitem_objectdata = pts_selected_index_lineitems;
            lineitem_objectdata = $.merge(pts_selected_index_lineitems, lineitem_objectdata);
            display_lineitem_html(lineitem_objectdata);
            $('#select_all_purchase_to_sell').prop('checked', false);
            if(sell_purchase == "sell") {
                $('#sell_type_id').val("<?php echo SELL_TYPE_SELL_ID ?>").trigger("change");
            } else if(sell_purchase == "purchase") {
                $('#sell_type_id').val("<?php echo SELL_TYPE_PURCHASE_ID ?>").trigger("change");
            } else {
                $('#sell_type_id').val(null).trigger("change");    
            }
            $("#category_id").val(null).trigger("change");
            $("#item_id").val(null).trigger("change");
            $("#grwt").val('');
            $("#less").val('');
            $('#less').removeAttr('readonly', 'readonly');
            $('#less_ad_details').removeClass('hide');
            $("#net_wt").val('');
            $("#touch_id").val(null).trigger("change");
            $("#touch_data_id").val('');
            <?php if($wstg_2 == '1') { ?>
                $("#wstg").val('');
            <?php } else { ?>
                $("#wstg").val('0');
            <?php } ?>
            $("#fine").val('');
            $("#image").val('');
            $("#file_upload").val('');
            $("#line_items_index").val('');
        });
        
        <?php if(!isset($sell_data->audit_status) || (isset($sell_data->audit_status) && $sell_data->audit_status != AUDIT_STATUS_AUDITED)){ ?>
            <?php if(!isset($sell_data->account_id) || (isset($sell_data->account_id) && $sell_data->account_id != ADJUST_EXPENSE_ACCOUNT_ID)){ ?>
            $(document).bind("keydown", function(e){
                if(e.ctrlKey && e.which == 83){
                    if($('#payment_receipt_model').hasClass('in')){
                        $("#payment_receipt_button").click();
                        return false;
                    }
                    if($('#metal_receipt_payment_model').hasClass('in')){
                        $("#metal_button").click();
                        return false;
                    }
                    if($('#gold_bhav_model').hasClass('in')){
                        $("#gold_button").click();
                        return false;
                    }
                    if($('#silver_bhav_model').hasClass('in')){
                        $("#silver_button").click();
                        return false;
                    }
                    if($('#transfer_model').hasClass('in')){
                        $("#transfer_button").click();
                        return false;
                    }
                    if(save_sell_purchase_submit_flag == 0 ){
                        if(e.shiftKey){
                            $("#saveformwithprint").click();
                        } else {
                            $("#saveform").click();
                        }
                        return false;
                    }
                }
            });
            <?php } ?>
        <?php } ?>
        
        $(document).on('submit', '#save_sell_purchase', function (event) {
            var clickbtn = $(event.originalEvent.submitter.id);
            event.preventDefault();
//            console.log(clickbtn['selector']); return false;
            saveform_clickbtn = clickbtn['selector'];
            $(window).unbind('beforeunload');
            if ($.trim($("#account_id").val()) == '') {
                show_notify('Please Select Account Name.', false);
                $("#account_id").select2('open');
                return false;
            }
            if ($.trim($("#process_id").val()) == '') {
                show_notify('Please Select Department.', false);
                $("#process_id").select2('open');
                return false;
            }
            var datepicker2 = $("#datepicker2").val();
            if(datepicker2 == '' ){
                show_notify('Please Select Date.', false);
                $("#datepicker2").focus();
                return false;
            }

            if($.trim($("#item_id").val()) != ''){
                on_save_add_edit_item = 1;
                console.log('<?php echo date('Y-m-d H:i:s'); ?>');
                $('#add_lineitem').click();
                return false;
            }

            if (lineitem_objectdata == '' && pay_rec_objectdata == '' && metal_objectdata == '' && gold_objectdata == '' && silver_objectdata == '' && transfer_objectdata == '' && ad_charges_objectdata == '' && adjust_cr_objectdata == '') {
                show_notify("Please Add Sell Item.", false);
                return false;
            }
            var account_id = $('#account_id').val();
            if(account_id == <?php echo CASE_CUSTOMER_ACCOUNT_ID; ?>){
                if(bill_gold_fine != 0 || bill_silver_fine != 0 || bill_amount != 0){
                    show_notify('Total Must Be 0.', false);
                    return false;
                } 
            }
            var is_grater = 0;
            
            if(app_net_amt > credit_limit){
                is_grater = 1;
            }
            var postData = new FormData(this);
            var href_url = '<?= base_url('sell/save_sell') ?>';
            if(is_grater == 1){
                if (confirm('Credit Limit : ' + credit_limit)) {
                    var allow_to_save_cl_out = <?php echo $this->app_model->have_access_role(SELL_PURCHASE_MODULE_ID, "allow to save out of credit limit"); ?>;
                    if(allow_to_save_cl_out != 1){
                        show_notify('You have Not Allow to Save Out of Credit Limit.', false);
                        return false;
                    }
                    <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { ?>
                        if (($("#deleted_sell_item_id").length > 0)){
                            var sell_id = '<?php echo $sell_data->sell_id;?>';
                            $.ajax({
                                url: "<?php echo site_url('sell/check_rfid_in_lineitems_or_not') ?>" + '/' + sell_id,
                                type: "POST",
                                data: '',
                                async: false,
                                success: function (response) {
                                    var json = $.parseJSON(response);
                                    if (json['have_rfid'] == '1') {
                                        if (confirm('If you have RFID, Then Click on Ok Button to open RIFD, Otherwise Click on Cancel Button to Inc. Loose Stock.')) {
                                            href_url = href_url + '/1';
                                            save_form(postData, href_url);
                                        } else {
                                            save_form(postData, href_url);
                                        }
                                    } else {
                                        save_form(postData, href_url);
                                    }
                                }
                            });
                        } else {
                            save_form(postData, href_url);
                        }
                    <?php } else { ?>
                        save_form(postData, href_url);
                    <?php } ?>
                }
            } else {
                <?php if (isset($sell_data->sell_id) && !empty($sell_data->sell_id)) { ?>
                    if (($("#deleted_sell_item_id").length > 0)){
                        var sell_id = '<?php echo $sell_data->sell_id;?>';
                        $.ajax({
                            url: "<?php echo site_url('sell/check_rfid_in_lineitems_or_not') ?>" + '/' + sell_id,
                            type: "POST",
                            data: '',
                            async: false,
                            success: function (response) {
                                var json = $.parseJSON(response);
                                if (json['have_rfid'] == '1') {
                                    if (confirm('If you have RFID, Then Click on Ok Button to open RIFD, Otherwise Click on Cancel Button to Inc. Loose Stock.')) {
                                        href_url = href_url + '/1';
                                        save_form(postData, href_url);
                                    } else {
                                        save_form(postData, href_url);
                                    }
                                } else {
                                    save_form(postData, href_url);
                                }
                            }
                        });
                    } else {
                        save_form(postData, href_url);
                    }
                <?php } else { ?>
                    save_form(postData, href_url);
                <?php } ?>
            }
            save_sell_purchase_submit_flag = 1;
            return false;
        });

        $('#add_lineitem').on('click', function () {
            var sell_type_id = $("#sell_type_id").val();
            
            if (sell_type_id == '' || sell_type_id == null) {
                $("#sell_type_id").focus();
                show_notify("Please select Type!", false);
                return false;
            }
            var category_id = $("#category_id").val();
            if (category_id == '' || category_id == null) {
                $("#category_id").select2('open');
                show_notify("Please select Category!", false);
                return false;
            }
            var item_id = $("#item_id").val();
            if (item_id == '' || item_id == null) {
                $("#item_id").focus();
                show_notify("Please select Item!", false);
                return false;
            }
            var grwt = $("#grwt").val();
            if (grwt == '' || grwt == null) {
                $("#grwt").focus();
                show_notify("Please Enter Gr.Wt.!", false);
                return false;
            } else {
                var total_grwt_sell = $('#total_grwt_sell').val();
                <?php if($without_purchase_sell_allow == '1'){ ?>
                if(total_grwt_sell != '' && total_grwt_sell != null){
                    var grwt = parseFloat($('#grwt').val()) || 0;
                    grwt = round(grwt, 2).toFixed(3);
                    if(parseFloat(grwt) < parseFloat(total_grwt_sell)){
                        show_notify("GrWt Should Be Grater Than " + total_grwt_sell , false);
                        $('#grwt').val('');
                        $("#grwt").focus();
                        return false;
                    }
                }
                <?php } ?>
            }
            var less = $("#less").val();
            if(parseFloat(less) > parseFloat(grwt)){
                show_notify('Less Can not be > grwt.', false);
                $("#less").focus();
                return false;
            }
            
            if (sell_type_id == '<?php SELL_TYPE_EXCHANGE_ID ?>') {
                if ($.trim($("#touch_data_id").val()) == '') {
                    $("#touch_data_id").focus();
                    show_notify("Please Enter Touch!", false);
                    return false;
                }
            } else {
                if($('#tunch_textbox').prop("checked") == true){
                    if ($.trim($("#touch_data_id").val()) == '') {
                        $("#touch_data_id").focus();
                        show_notify("Please Enter Touch!", false);
                        return false;
                    }  
                } else {
                    if ($.trim($("#touch_id").val()) == '') {
                        $("#touch_id").focus();
                        show_notify("Please select Tunch!", false);
                        return false;
                    }
                }
                var wstg = $("#wstg").val();
                if (wstg == '' || wstg == null) {
                    $("#wstg").focus();
                    show_notify("Please Enter Wstg.!", false);
                    return false;
                }
            }
            if (sell_type_id == '<?php SELL_TYPE_EXCHANGE_ID ?>') {
                var tunch = $("#touch_data_id").val();
                var wstg = $("#wstg").val();
                var tunch_wstg = parseFloat(tunch) + parseFloat(wstg);
                if (tunch_wstg > 100) {
                    $("#wstg").focus();
                    show_notify("Please Enter Tunch + wstg less than 100!", false);
                    return false;
                }
            } else {
                var tunch = $("#touch_data_id").val();
                if (tunch > 100) {
                    show_notify("Please Enter Tunch less than 100!", false);
                    return false;
                }
            }
            
            var hasMatch =false;
            var line_items_index = $("#line_items_index").val();
            var rfid_number = $("#rfid_number").val();
            for (var line_i = 0; line_i < lineitem_objectdata.length; ++line_i) {
                var itemrow = lineitem_objectdata[line_i];
                if(rfid_number != '' && rfid_number != null && itemrow.rfid_number == rfid_number && line_items_index == ''){
                    show_notify("RFID Used in this Entry!", false);
                    $("#sell_type_id").val(null).trigger("change");
                    $("#category_id").val(null).trigger("change");
                    $("#item_id").val(null).trigger("change");
                    $("#grwt").val('');
                    $("#less").val('');
                    $("#net_wt").val('');
                    $(".touch_id").val(null).trigger("change");
                    $(".wstg").val('');
                    $("#fine").val('');
                    $("#charges_amt").val(0);
                    $("#item_stock_rfid_id").val('');
                    $("#rfid_number").val('');
                    $('#rfid_number').focus();
                    return false;
                }
            }

            $("#add_lineitem").attr('disabled', 'disabled');
            var sell_item_id = $("#sell_item_id").val();
            var key = '';
            var value = '';
            var lineitem = {};
            var is_validate = '0';
            $('select[name^="line_items_data"]').each(function (e) {
                key = $(this).attr('name');
                key = key.replace("line_items_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            $('input[name^="line_items_data"]').each(function () {
                key = $(this).attr('name');
                key = key.replace("line_items_data[", "");
                key = key.replace("]", "");
                value = $(this).val();
                lineitem[key] = value;
            });
            lineitem['sell_less_ad_details'] = JSON.stringify(less_ad_details_objectdata);
            less_ad_details_objectdata.length = 0;
            display_less_ad_details_html(less_ad_details_objectdata);
            
            lineitem['charges_amt'] = parseFloat($('#charges_amt').val()) || 0;
            lineitem['amount'] = lineitem['charges_amt'];
            lineitem['sell_item_charges_details'] = JSON.stringify(sell_item_charges_details_objectdata);
            sell_item_charges_details_objectdata.length = 0;
            display_sell_item_charges_details_html(sell_item_charges_details_objectdata);

            var item_id = $('#item_id').val();
            var category_id = $('#category_id').val();
            if($('#tunch_textbox').prop("checked") == true){
                var touch_id = $('#touch_data_id').val();
            } else {
                var touch_id = $('#touch_id').val();
            }
//            $('select[name^="line_items_data"]').each(function (index) {
//                key = $(this).attr('name');
//                key = key.replace("line_items_data[", "");
//                key = key.replace("]", "");
////                console.log(lineitem_objectdata);
//                $.each(lineitem_objectdata, function (index, value) {
//                    if (value.category_id == category_id && value.item_id == item_id && value.touch_id == touch_id && typeof (value.id) != "undefined" && value.id !== null) {
//                        $('input[name^="line_items_data"]').each(function (index) {
//                            keys = $(this).attr('name');
//                            keys = keys.replace("line_items_data[", "");
//                            keys = keys.replace("]", "");
//                            if (keys == 'id') {
//                                if (value.id != $(this).val()) {
//                                    is_validate = '1';
//                                    show_notify("You cannot Add this Item. This Item has been used!", false);
//                                    $("#add_lineitem").removeAttr('disabled', 'disabled');
//                                    return false;
//                                }
//                            }
//                        });
//                    } else if (value.category_id == category_id && value.item_id == item_id && value.touch_id == touch_id) {
//                        if(sell_index !== index){
//                            is_validate = '1';
//                            show_notify("You cannot Add this Item. This Item has been used!", false);
//                            $("#add_lineitem").removeAttr('disabled', 'disabled');
//                            return false;
//                        }
//                    }
//                });
//                if (is_validate == '1') {
//                    return false;
//                }
//            });
            if($('#tunch_textbox').prop("checked") == true){
                lineitem['tunch_textbox'] = '1';
            } else {
                lineitem['tunch_textbox'] = '0';
            }
            if (is_validate != '1') {
                var type_data = $('#sell_type_id').select2('data');
                lineitem['type_name'] = type_data[0].text;
                <?php if($use_category == '1') { ?>
                    var item_data = $('#category_id').select2('data');
                    lineitem['category_name'] = item_data[0].text;
                <?php } ?>
                var item_data = $('#item_id').select2('data');
                lineitem['item_name'] = item_data[0].text;
                lineitem['total_grwt_sell'] = $('#total_grwt_sell').val();
                if (sell_type_id != '<?php SELL_TYPE_EXCHANGE_ID ?>') {
                    if($('#tunch_textbox').prop("checked") == true){
                        lineitem['touch_id'] = $('#touch_data_id').val();
                    } else {
        //                var touch_data = $('#touch_id').val();
                        lineitem['touch_id'] = $('#touch_id').val();
                    }
                }
                $.ajax({
                    url: "<?php echo base_url('sell/get_category_group'); ?>/" + item_id,
                    type: "GET",
                    contentType: "application/json",
                    data: "",
                    success: function(response){
                        var json = $.parseJSON(response);
    //                    console.log(json);

                        lineitem['group_name'] = json;
                        if(lineitem['group_name'] == 1){
                            lineitem['grwt'] = round(lineitem['grwt'], 2).toFixed(3);
                            lineitem['less'] = round(lineitem['less'], 2).toFixed(3);
                            lineitem['net_wt'] = round(lineitem['net_wt'], 2).toFixed(3);
                            lineitem['fine'] = round(lineitem['fine'], 2).toFixed(3);
                        } else {
                            lineitem['grwt'] = round(lineitem['grwt'], 1).toFixed(3);
                            lineitem['less'] = round(lineitem['less'], 1).toFixed(3);
                            lineitem['net_wt'] = round(lineitem['net_wt'], 1).toFixed(3);
                            lineitem['fine'] = round(lineitem['fine'], 1).toFixed(3);
                        }

                        if (sell_type_id == '1') {
                            var sell_item_id = $("#sell_item_id").val();
                            var process_id = $("#process_id").val();
                            if($('#tunch_textbox').prop("checked") == true){
                                var touch_id = $("#touch_data_id").val();
                            } else {
                                var touch_id = $("#touch_id").val();
                            }
                            $.ajax({
                                url: "<?php echo base_url('sell/get_item_stock'); ?>/",
                                type: 'POST',
                                async: false,
                                data: {process_id : process_id, category_id : category_id, item_id : item_id, touch_id : touch_id, sell_item_id : sell_item_id},
                                success: function (response) {
                                    var json = $.parseJSON(response);
                                    <?php if($without_purchase_sell_allow == '1'){ ?>
                                        if(parseFloat(grwt) > parseFloat(json.grwt)){
                                            show_notify('Please Enter GrWt Less than of ' + json.grwt, false);
                                            $("#grwt").focus();
                                            $("#add_lineitem").removeAttr('disabled', 'disabled');
                                            return false;
                                        }
                                    <?php }  ?>
                                    var new_lineitem = JSON.parse(JSON.stringify(lineitem));
                                    line_items_index = $("#line_items_index").val();
                                    if (line_items_index != '') {
                                        lineitem_objectdata.splice(line_items_index, 1, new_lineitem);
                                    } else {
                                        lineitem_objectdata.push(new_lineitem);
                                    }
                                    display_lineitem_html(lineitem_objectdata);
                                    $('#sell_item_id').val('');
                                    $("#tunch_textbox").prop("checked", true).trigger('change');
                                    if(sell_purchase == "sell") {
                                        $('#sell_type_id').val("<?php echo SELL_TYPE_SELL_ID ?>").trigger("change");
                                    } else if(sell_purchase == "purchase") {
                                        $('#sell_type_id').val("<?php echo SELL_TYPE_PURCHASE_ID ?>").trigger("change");
                                    } else {
                                        $('#sell_type_id').val(null).trigger("change");    
                                    }
                                    $("#category_id").val(null).trigger("change");
                                    $("#item_id").val(null).trigger("change");
                                    $("#li_narration").val('');
                                    $("#grwt").val('');
                                    $("#less").val('');
                                    $('#less').removeAttr('readonly', 'readonly');
                                    $('#less_ad_details').removeClass('hide');
                                    $("#net_wt").val('');
                                    $("#touch_id").val(null).trigger("change");
                                    $("#touch_data_id").val('');
                                    $("#gold_silver_rate").val('');
                                    <?php if($wstg_2 == '1') { ?>
                                        $("#wstg").val('');
                                    <?php } else { ?>
                                        $("#wstg").val('0');
                                    <?php } ?>
                                    $("#defult_wstg").val('');
                                    $("#fine").val('');
                                    $("#charges_amt").val('');
                                    $("#image").val('');
                                    $("#file_upload").val('');
                                    $("#line_items_index").val('');
                                    $('#sell_type_id').removeAttr('disabled','disabled');
                                    $('#category_id').removeAttr('disabled','disabled');
                                    $('#item_id').removeAttr('disabled','disabled');
                                    $('.touch_id').removeAttr('disabled','disabled');
                                    $("#tunch_textbox").removeAttr('disabled', 'disabled');
                                    sell_index = '';
                                    if(on_save_add_edit_item == 1){
                                        on_save_add_edit_item == 0;
                                        $("#save_sell_purchase").submit();
                                    }
                                }
                            });
                        } else {

                            var new_lineitem = JSON.parse(JSON.stringify(lineitem));
                            line_items_index = $("#line_items_index").val();
                            if (line_items_index != '') {
                                lineitem_objectdata.splice(line_items_index, 1, new_lineitem);
                            } else {
                                lineitem_objectdata.push(new_lineitem);
                            }
                            display_lineitem_html(lineitem_objectdata);
                            $('#sell_item_id').val('');
                            sell_index = '';
                            $("#tunch_textbox").prop("checked", true).trigger('change');
                            if(sell_purchase == "sell") {
                                $('#sell_type_id').val("<?php echo SELL_TYPE_SELL_ID ?>").trigger("change");
                            } else if(sell_purchase == "purchase") {
                                $('#sell_type_id').val("<?php echo SELL_TYPE_PURCHASE_ID ?>").trigger("change");
                            } else {
                                $('#sell_type_id').val(null).trigger("change");    
                            }
                            
                            $("#category_id").val(null).trigger("change");
                            $("#item_id").val(null).trigger("change");
                            $("#li_narration").val('');
                            $("#grwt").val('');
                            $("#less").val('');
                            $('#less').removeAttr('readonly', 'readonly');
                            $('#less_ad_details').removeClass('hide');
                            $("#net_wt").val('');
                            $("#touch_id").val(null).trigger("change");
                            $("#touch_data_id").val('');
                            $("#gold_silver_rate").val('');
                            <?php if($wstg_2 == '1') { ?>
                                $("#wstg").val('');
                            <?php } else { ?>
                                $("#wstg").val('0');
                            <?php } ?>
                            $("#fine").val('');
                            $("#charges_amt").val('');
                            $("#image").val('');
                            $("#file_upload").val('');
                            $("#line_items_index").val('');
                            $('#sell_type_id').removeAttr('disabled','disabled');
                            $("#tunch_textbox").removeAttr('disabled', 'disabled');
                            $('#category_id').removeAttr('disabled','disabled');
                            $('#item_id').removeAttr('disabled','disabled');
                            $('.touch_id').removeAttr('disabled','disabled');
                            if(on_save_add_edit_item == 1){
                                on_save_add_edit_item == 0;
                                $("#save_sell_purchase").submit();
                            }
                        }
                        $('#total_grwt_sell').val('');
                    }
                });
            }
            $(".item_fields_div").css("background-color", "#ffffff");
            $("#add_lineitem").removeAttr('disabled', 'disabled');
            if($.trim($('#rfid_number').val()) == ''){
                if(sell_purchase == "sell_purchase") {
                    $('#sell_type_id').select2('open');
                }
            }
            $("#item_stock_rfid_id").val('');
            $("#rfid_number").val('');
            $('#grwt').removeAttr('disabled','disabled');
            $('#rfid_number').removeAttr('disabled','disabled');
        });
    
        if(sell_purchase == "sell") {
            $('#sell_type_id').val("<?php echo SELL_TYPE_SELL_ID ?>").trigger("change");
        } else if(sell_purchase == "purchase") {
            $('#sell_type_id').val("<?php echo SELL_TYPE_PURCHASE_ID ?>").trigger("change");
        }
        
        $("input.pts_selected_index:checked").click(function(){
            $("input.pts_selected_index").prop("checked", false);
        });

        $(document).on('keypress', '#rfid_number', function (e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode === 13) {
                var process_id = $.trim($("#process_id").val());
                if ( process_id == '') {
                    show_notify('Please Select Department.', false);
                    $("#process_id").select2('open');
                    return false;
                }
                $('#ajax-loader').show();
                var item_stock_rfid_id = $('#item_stock_rfid_id').val();
                var rfid_number = $('#rfid_number').val();
                var account_id = $('#account_id').val();
                $.ajax({
                    url: "<?php echo base_url('sell/get_lineitem_based_on_rfid'); ?>/",
                    type: 'POST',
                    async: false,
                    data: {department_id: process_id, item_stock_rfid_id : item_stock_rfid_id, rfid_number : rfid_number, account_id : account_id},
                    success: function (response) {
                        $('#ajax-loader').hide();
                        var json = $.parseJSON(response);
                        $('#rfid_number').val('');
                        if(json.rfid_used == '1'){
                            show_notify(json.rfid_used_msg, false);
                            return false;
                        }
                        if(json.type){
                            $("#sell_type_id").val(json.type).trigger("change");
                            <?php if($use_category == '1') { ?>
                                $("#category_id").val(json.category_id).trigger("change");
                                setSelect2Value($("#category_id"), "<?= base_url('app/set_category_select2_val_by_id/') ?>" + json.category_id);
                            <?php } else { ?>
                                $("#category_id").val(json.category_id);
                            <?php } ?>
                            $("#item_id").val(json.item_id).trigger("change");
                            <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
                
                            <?php } else { ?>
                                setSelect2Value($("#item_id"), "<?= base_url('app/set_item_name_select2_val_by_id/') ?>" + json.item_id);
                            <?php } ?>
                            
                            $("#grwt").val(json.grwt);
                            $("#less").val(json.less);
                            $("#net_wt").val(json.net_wt);
                            $(".touch_id").val(json.touch_id).trigger("change");
                            $(".wstg").val(json.wstg);
                            $("#fine").val(json.fine);
                            $("#charges_amt").val(json.charges_amt);
                            $("#item_stock_rfid_id").val(json.item_stock_rfid_id);
                            $("#rfid_number").val(json.rfid_number);
                            $("#image").val('');
                            $("#file_upload").val('');
                            $('#add_lineitem').click();
                            $('#item_stock_rfid_id').val('');
                        } else {
                            var process_data = 'Default';
                            <?php if($department_2 == '1') { ?>
                                var process_data = $('#process_id').select2('data');
                            <?php } ?>
                            show_notify('RFID Not Found In '+ process_data[0].text +' Department!', false);
                        }
                        $('#rfid_number').focus();
                    }
                });
                e.preventDefault();
                return false;
            }
        });

        shortcut.add("f1",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#payment_receipt').click();
            }, 500);
        });
        shortcut.add("alt+1",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#payment_receipt').click();
                $('input:radio[name=payment_receipt]').filter('[value=2]').prop('checked', true);
            }, 500);
        });
        shortcut.add("alt+2",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#payment_receipt').click();
                $('input:radio[name=payment_receipt]').filter('[value=1]').prop('checked', true);
            }, 500);
        });
        shortcut.add("f2",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#metal_receipt_payment').click();
            }, 500);
        });
        shortcut.add("alt+4",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#metal_receipt_payment').click();
                $('input:radio[name=metal_payment_receipt]').filter('[value=2]').prop('checked', true);
            }, 500);
        });
        shortcut.add("alt+5",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#metal_receipt_payment').click();
                $('input:radio[name=metal_payment_receipt]').filter('[value=1]').prop('checked', true);
            }, 500);
        });
        shortcut.add("f3",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#gold_bhav').click();
            }, 500);
        });
        shortcut.add("alt+6",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#gold_bhav').click();
            }, 500);
        });
        shortcut.add("alt+s",function(event) {
            event.preventDefault();
            setTimeout(function () {
                if($('#gold_bhav_model').is(':visible')){
                    $('input:radio[name=gold_sale_purchase]').filter('[value=1]').prop('checked', true);
                }
                if($('#silver_bhav_model').is(':visible')){
                    $('input:radio[name=silver_sale_purchase]').filter('[value=1]').prop('checked', true);
                }
            }, 500);
        });
        shortcut.add("alt+p",function(event) {
            event.preventDefault();
            setTimeout(function () {
                if($('#gold_bhav_model').is(':visible')){
                    $('input:radio[name=gold_sale_purchase]').filter('[value=2]').prop('checked', true);
                }
                if($('#silver_bhav_model').is(':visible')){
                    $('input:radio[name=silver_sale_purchase]').filter('[value=2]').prop('checked', true);
                }
            }, 500);
        });
        shortcut.add("f4",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#silver_bhav').click();
            }, 500);
        });
        shortcut.add("alt+7",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
                setTimeout(function () {
            $('#silver_bhav').click();
            }, 500);
        });
        shortcut.add("f5",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#transfer').click();
            }, 500);
        });
        shortcut.add("alt+8",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $('#transfer').click();
            }, 500);
        });
        shortcut.add("f6",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $("#sell_type_id").focus();
            }, 500);
        });
        shortcut.add("f7",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $("#ad_charges").click();
            }, 500);
        });
        shortcut.add("f8",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $("#less_ad_details").click();
            }, 500);
        });
        shortcut.add("f9",function(event) {
            event.preventDefault();
            $('.modal').modal('hide');
            setTimeout(function () {
                $("#sell_item_charges_details").click();
            }, 500);
        });
    });
    
    function display_pts_lineitem_html(pts_lineitem_objectdata){
        var pts_lineitem_html = '';
        var pts_item_delete = 'allow';
        var pts_total_grwt = 0;
        var pts_total_less = 0;
        var pts_total_ntwt = 0;
        var pts_total_average = 0;
        var pts_total_fine = 0;
        //console.log(lineitem_objectdata);
        $.each(pts_lineitem_objectdata, function (index, value) {
            var row_html_order = '<tr class="lineitem_index_' + index + ' _' + index + '">';
                if(lineitem_objectdata.length !== 0){
                    var row_added = 0;
                    $.each(lineitem_objectdata, function (li_index, li_value) {
                        if(li_value.purchase_sell_item_id == value.purchase_sell_item_id && li_value.stock_type == value.stock_type){
                            if(row_added == 0){ 
                                row_added = 1;
                                pts_lineitem_objectdata[index].sell_item_id = li_value.sell_item_id;
                                if(value.less_allow == 1){
                                    var input_less = '<input type="text" name="pts_less[]" id="pts_less_' + index + '" data-pts_selected_index="' + index + '" class="pts_less num_only" value="'+ li_value.less + '" style="width:100px;"> ' + value.less;
                                } else {
                                    var input_less = '<input type="text" name="pts_less[]" id="pts_less_' + index + '" data-pts_selected_index="' + index + '" class="pts_less num_only" value="'+ li_value.less + '" disabled="" style="width:100px;"> ' + value.less;
                                }
                                row_html_order += '<td class="text-center">' +
                                '<input type="checkbox" data-item_id="' + value.item_id + '" data-pts_selected_index="' + index + '" class="pts_selected_index" checked disabled>' +
                                '</td>' +
                                '<td>' + value.account_name + ' ['+ value.sell_date +']</td>' +
                                '<td>' + value.item_name + ' : ' + value.huid + '</td>' +
                                '<td class="text-right">' + value.grwt + '</td>' +
                                '<td class="text-right"><input type="text" name="pts_grwt[]" id="pts_grwt_' + index + '" data-pts_selected_index="' + index + '" class="pts_grwt num_only" value="'+ li_value.grwt + '" style="width:100px;"> ' + value.grwt + ' </td>';
//                                '<td class="text-right">' + input_less + '</td>' +
//                                '<td class="text-right" id="pts_net_wt_' + index + '">' + li_value.net_wt + '</td>' +
//                                '<td class="text-right">' + value.touch_id + '</td>' +
//                                '<td class="text-right"><input type="text" name="pts_wstg[]" id="pts_wstg_' + index + '" data-pts_selected_index="' + index + '" class="pts_wstg num_only" value="'+ li_value.wstg + '" style="width:100px;"> ' + value.wstg + ' </td>' +
//                                '<td class="text-right" id="pts_fine_' + index + '">' + li_value.fine + '</td>';
                                pts_item_delete = pts_item_delete + parseFloat(li_value.pts_item_delete);
                                pts_total_grwt = pts_total_grwt + parseFloat(li_value.grwt);
                                pts_total_less = pts_total_less + parseFloat(li_value.less);
                                pts_total_ntwt = pts_total_ntwt + parseFloat(li_value.net_wt);
                                pts_total_fine = pts_total_fine + parseFloat(li_value.fine);
                            }
                        }
                    });
                    if(row_added == 0){
                        if(value.less_allow == 1){
                            var input_less = '<input type="text" name="pts_less[]" id="pts_less_' + index + '" data-pts_selected_index="' + index + '" class="pts_less num_only" value="'+ value.less + '" style="width:100px;">';
                        } else {
                            var input_less = '<input type="text" name="pts_less[]" id="pts_less_' + index + '" data-pts_selected_index="' + index + '" class="pts_less num_only" value="'+ value.less + '" disabled="" style="width:100px;">';
                        }
                        row_html_order += '<td class="text-center">' +
                        '<input type="checkbox" data-item_id="' + value.item_id + '" data-pts_selected_index="' + index + '" class="pts_selected_index">' +
                        '</td>' +
                        '<td>' + value.account_name + ' ['+ value.sell_date +']</td>' +
                        '<td>' + value.item_name + ' : ' + value.huid + '</td>' +
                        '<td class="text-right">' + value.grwt + '</td>' +
                        '<td class="text-right"><input type="text" name="pts_grwt[]" id="pts_grwt_' + index + '" data-pts_selected_index="' + index + '" class="pts_grwt num_only" value="'+ value.grwt + '" style="width:100px;"></td>';
//                        '<td class="text-right">' + input_less + '</td>' +
//                        '<td class="text-right" id="pts_net_wt_' + index + '">' + value.net_wt + '</td>' +
//                        '<td class="text-right">' + value.touch_id + '</td>' +
//                        '<td class="text-right"><input type="text" name="pts_wstg[]" id="pts_wstg_' + index + '" data-pts_selected_index="' + index + '" class="pts_wstg num_only" value="'+ value.wstg + '" style="width:100px;"></td>' +
//                        '<td class="text-right" id="pts_fine_' + index + '">' + value.fine + '</td>';
                        pts_item_delete = pts_item_delete + parseFloat(value.pts_item_delete);
                        pts_total_grwt = pts_total_grwt + parseFloat(value.grwt);
                        pts_total_less = pts_total_less + parseFloat(value.less);
                        pts_total_ntwt = pts_total_ntwt + parseFloat(value.net_wt);
                        pts_total_fine = pts_total_fine + parseFloat(value.fine);
                    }
                    
                } else {
                    if(value.less_allow == 1){
                        var input_less = '<input type="text" name="pts_less[]" id="pts_less_' + index + '" data-pts_selected_index="' + index + '" class="pts_less num_only" value="'+ value.less + '" style="width:100px;">';
                    } else {
                        var input_less = '<input type="text" name="pts_less[]" id="pts_less_' + index + '" data-pts_selected_index="' + index + '" class="pts_less num_only" value="'+ value.less + '" disabled="" style="width:100px;">';
                    }
                    row_html_order += '<td class="text-center">' +
                    '<input type="checkbox" data-item_id="' + value.item_id + '" data-pts_selected_index="' + index + '" class="pts_selected_index">' +
                    '</td>' +
                    '<td>' + value.account_name + ' ['+ value.sell_date +']</td>' +
                    '<td>' + value.item_name + ' : ' + value.huid + '</td>' +
                    '<td class="text-right">' + value.grwt + '</td>' +
                    '<td class="text-right"><input type="text" name="pts_grwt[]" id="pts_grwt_' + index + '" data-pts_selected_index="' + index + '" class="pts_grwt num_only" value="'+ value.grwt + '" style="width:100px;"></td>';
//                    '<td class="text-right">' + input_less + '</td>' +
//                    '<td class="text-right" id="pts_net_wt_' + index + '">' + value.net_wt + '</td>' +
//                    '<td class="text-right">' + value.touch_id + '</td>' +
//                    '<td class="text-right"><input type="text" name="pts_wstg[]" id="pts_wstg_' + index + '" data-pts_selected_index="' + index + '" class="pts_wstg num_only" value="'+ value.wstg + '" style="width:100px;"></td>' +
//                    '<td class="text-right" id="pts_fine_' + index + '">' + value.fine + '</td>';
                    pts_item_delete = pts_item_delete + parseFloat(value.pts_item_delete);
                    pts_total_grwt = pts_total_grwt + parseFloat(value.grwt);
                    pts_total_less = pts_total_less + parseFloat(value.less);
                    pts_total_ntwt = pts_total_ntwt + parseFloat(value.net_wt);
                    pts_total_fine = pts_total_fine + parseFloat(value.fine);
                }
                row_html_order += '</tr>';
            pts_lineitem_html += row_html_order;
        });
        $('tbody#purchase_item_selection_list').html(pts_lineitem_html);
        $('#pts_total_grwt').html(pts_total_grwt.toFixed(3));
        $('#pts_total_less').html(pts_total_less.toFixed(3));
        $('#pts_total_ntwt').html(pts_total_ntwt.toFixed(3));
        if(pts_total_ntwt != 0 && pts_total_fine != 0){
            pts_total_average = pts_total_fine / pts_total_ntwt * 100;
        }
        $('#pts_total_average').html(pts_total_average.toFixed(3));
        $('#pts_total_fine').html(round(pts_total_fine, 2).toFixed(3));
        checked_average_value();
    }
    
    function get_bill_balance(account_id){
        if(account_id != '' && account_id != null){
            $.ajax({
                url: "<?= base_url('sell/get_account_old_balance') ?>/" + account_id,
                type: 'GET',
                data: '',
                success: function (response) {
                    var json = $.parseJSON(response);
                    <?php if(isset($sell_data) && !empty($sell_data)){ ?>
                        var sell_data_total_gold_fine = <?php echo $sell_data->total_gold_fine; ?>;
                        var sell_data_total_silver_fine = <?php echo $sell_data->total_silver_fine; ?>;
                        var sell_data_total_amount = <?php echo $sell_data->total_amount; ?>;
                        var sell_data_total_c_amount = <?php echo $sell_data->total_c_amount; ?>;
                        var sell_data_total_r_amount = <?php echo $sell_data->total_r_amount; ?>;
                        var gold_fine = parseFloat(json.gold_fine) - parseFloat(sell_data_total_gold_fine);
                        var silver_fine = parseFloat(json.silver_fine) - parseFloat(sell_data_total_silver_fine);
                        var amount = parseFloat(json.amount) - parseFloat(sell_data_total_amount);
                        var c_amount = parseFloat(json.c_amount) - parseFloat(sell_data_total_c_amount);
                        var r_amount = parseFloat(json.r_amount) - parseFloat(sell_data_total_r_amount);
                    <?php } else { ?>
                        var gold_fine = json.gold_fine;
                        var silver_fine = json.silver_fine;
                        var amount = json.amount;
                        var c_amount = json.c_amount;
                        var r_amount = json.r_amount;
                    <?php } ?>
                    old_gold_fine_val = gold_fine = round(gold_fine, 2).toFixed(3);
                    old_silver_fine_val = silver_fine = round(silver_fine, 1).toFixed(3);
                    old_amount_val = amount = parseFloat(amount).toFixed(0);
                    old_c_amount_val = parseFloat(c_amount).toFixed(0);
                    old_r_amount_val = parseFloat(r_amount).toFixed(0);
                    $('#old_gold_fine_val').html(old_gold_fine_val);
                    $('#old_silver_fine_val').html(old_silver_fine_val);
                    $('#old_amount_val').html(old_amount_val);
                    $('#old_c_amount_val').html(old_c_amount_val);
                    $('#old_r_amount_val').html(old_r_amount_val);
                    $('#balance_date').html('<a href="<?php echo base_url(); ?>reports/customer_ledger?account_id=' + account_id + '" target="_blank">' + json.balance_date + '</a>');
                    credit_limit = json.credit_limit;
                    display_lineitem_html(lineitem_objectdata);
                }
            });
        }
    }

    function get_bill_total_amount(){
        bill_gold_fine = parseFloat(li_total_gold_fine) + parseFloat(metal_gold_total) + parseFloat(gold_count) + parseFloat(transfer_gold_total);
        bill_gold_fine = parseFloat(bill_gold_fine).toFixed(3);
        $('#bill_gold_fine').html(bill_gold_fine);
        bill_silver_fine = parseFloat(li_total_silver_fine) + parseFloat(metal_silver_total) + parseFloat(silver_count) + parseFloat(transfer_silver_total);
        bill_silver_fine = parseFloat(bill_silver_fine).toFixed(3);
        $('#bill_silver_fine').html(bill_silver_fine);
        bill_amount = parseFloat(li_total_amount) + parseFloat(payment_receipt_amount) + parseFloat(gold_amount_count) + parseFloat(silver_amount_count) + parseFloat(transfer_amount_total) + parseFloat(ad_amount_total) + parseFloat(adjust_cr_amount_total) - parseFloat(discount_amount);
        bill_amount = parseFloat(bill_amount).toFixed(2);
        $('#bill_amount').html(bill_amount);

        bill_cr_c_amount = parseFloat(li_cr_c_amount) + parseFloat(pr_cr_c_amount) + parseFloat(gold_cr_c_amount) + parseFloat(silver_cr_c_amount) + parseFloat(transfer_cr_c_amount) + parseFloat(ad_cr_c_amount) + parseFloat(adjust_cr_c_amount) - parseFloat(discount_amount);
        bill_cr_c_amount = parseFloat(bill_cr_c_amount).toFixed(2);
        $('#bill_cr_c_amount').html(bill_cr_c_amount);
        bill_cr_r_amount = parseFloat(li_cr_r_amount) + parseFloat(pr_cr_r_amount) + parseFloat(gold_cr_r_amount) + parseFloat(silver_cr_r_amount) + parseFloat(transfer_cr_r_amount) + parseFloat(ad_cr_r_amount) + parseFloat(adjust_cr_r_amount);
        bill_cr_r_amount = parseFloat(bill_cr_r_amount).toFixed(2);
        $('#bill_cr_r_amount').html(bill_cr_r_amount);

        depart_gold_fine = parseFloat(li_total_gold_fine) + parseFloat(metal_gold_total);
        depart_silver_fine = parseFloat(li_total_silver_fine) + parseFloat(metal_silver_total);

        net_gold_fine = parseFloat(old_gold_fine_val) + parseFloat(bill_gold_fine);
        net_gold_fine = parseFloat(net_gold_fine).toFixed(3);
        $('#net_gold_fine').html(net_gold_fine);
        net_silver_fine = parseFloat(old_silver_fine_val) + parseFloat(bill_silver_fine);
        net_silver_fine = parseFloat(net_silver_fine).toFixed(3);
        $('#net_silver_fine').html(net_silver_fine);
        net_amount = parseFloat(old_amount_val) + parseFloat(bill_amount);
        net_amount = parseFloat(net_amount).toFixed(2);
        $('#net_amount').html(net_amount);
        net_c_amount = parseFloat(old_c_amount_val) + parseFloat(bill_cr_c_amount);
        net_c_amount = parseFloat(net_c_amount).toFixed(2);
        $('#net_c_amount').html(net_c_amount);
        net_r_amount = parseFloat(old_r_amount_val) + parseFloat(bill_cr_r_amount);
        net_r_amount = parseFloat(net_r_amount).toFixed(2);
        $('#net_r_amount').html(net_r_amount);
        $('.net_gold_fine').html(net_gold_fine);
        $('.net_silver_fine').html(net_silver_fine);
        $('.net_amount').html(net_amount);

        var app_gold_fine = (<?php echo $gold_rate; ?> / 10 ) * (parseFloat(net_gold_fine) || 0);
        var app_silver_fine = (<?php echo $silver_rate; ?> / 10 ) * (parseFloat(net_silver_fine) || 0);
        app_net_amt = parseFloat(app_gold_fine) + parseFloat(app_silver_fine) + (parseFloat(net_amount) || 0);
        $('#app_gold_fine').html(parseFloat(app_gold_fine).toFixed(0));
        $('#app_silver_fine').html(parseFloat(app_silver_fine).toFixed(0));
        $('#app_amount').html(parseFloat(net_amount).toFixed(0));
        $('#app_net_amt').html(parseFloat(app_net_amt).toFixed(0));
        if(app_net_amt > credit_limit){
            $("#app_net_amt").css("color", "#fa0812");
        } else {
            $("#app_net_amt").css("color", "#000000");
        }

        // If any one Lineitem is added then Department not allow to change
        if($.isEmptyObject(lineitem_objectdata) && $.isEmptyObject(pay_rec_objectdata)
            && $.isEmptyObject(metal_objectdata) && $.isEmptyObject(gold_objectdata)
            && $.isEmptyObject(silver_objectdata) && $.isEmptyObject(transfer_objectdata) 
            && $.isEmptyObject(ad_charges_objectdata) && $.isEmptyObject(adjust_cr_objectdata)){
                $('#process_id').removeAttr('disabled','disabled');
                $('#after_disabled_process_id').remove();
        } else {
            var process_id = $('#process_id').val();
            $('#process_id').attr('disabled','disabled');
            $('#process_id').closest('div').append('<input type="hidden" name="process_id" id="after_disabled_process_id" value="' + process_id + '" />');
        }
    }

    function display_lineitem_html(lineitem_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
        var total_grwt = 0;
        var total_less = 0;
        var total_ntwt = 0;
        li_total_gold_fine = 0;
        li_total_silver_fine = 0;
        li_total_amount = 0;
        li_cr_c_amount = 0;
        li_cr_r_amount = 0;

        var total_rfid_pcs = 0;
        var total_loose_pcs = 0;
        var total_rfid_wt = 0;
        var total_loose_wt = 0;
        $.each(lineitem_objectdata, function (index, value) {
            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';

            var grwt = value.grwt || 0;
            var less = value.less || 0;
            var net_wt = value.net_wt || 0;
            var touch_id = value.touch_id;
            var wstg = value.wstg || 0;
            var fine = value.fine || 0;
            var spi_pcs = value.spi_pcs || 0;
            var spi_rate = value.spi_rate || 0;
            var charges_amt = value.charges_amt || 0;
            var amount = value.amount || 0;

            if(value.type_name == 'S'){
            } else {
                grwt = zero_value - parseFloat(grwt);
                less = (less != '') ? 0 - parseFloat(less) : less;
                net_wt = zero_value - parseFloat(net_wt);
                touch_id = zero_value - parseFloat(touch_id);
                wstg = zero_value - parseFloat(wstg);
                fine = zero_value - parseFloat(fine);
                spi_pcs = zero_value - parseFloat(spi_pcs);
                spi_rate = zero_value - parseFloat(spi_rate);
                charges_amt = zero_value - parseFloat(charges_amt);
//                amount = zero_value - parseFloat(amount);
            }

            total_grwt = total_grwt + parseFloat(grwt);
            total_less = total_less + parseFloat(less);
            total_ntwt = total_ntwt + parseFloat(net_wt);
            if(value.group_name == '<?php echo CATEGORY_GROUP_GOLD_ID; ?>'){
                li_total_gold_fine = li_total_gold_fine + parseFloat(fine);
                var gold_value = parseFloat(fine);
                var silver_value = '';
            } else {
                li_total_silver_fine = li_total_silver_fine + parseFloat(fine);
                var gold_value = '';
                var silver_value = parseFloat(fine);
            }
            li_total_amount = li_total_amount + parseFloat(amount);
            li_cr_c_amount = li_cr_c_amount + parseFloat(amount);
            lineitem_objectdata[index].c_amt = parseFloat(amount);
            lineitem_objectdata[index].r_amt = 0;
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_lineitem_' + index + '" href="javascript:void(0);" onclick="edit_lineitem(' + index + ')"><i class="fa fa-edit"></i></a> ';
            if(value.sell_item_delete == 'allow'){
                lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_sp_item" href="javascript:void(0);" onclick="remove_lineitem(' + index + ')"><i class="fa fa-remove"></i></a>';
            }
            var row_html = '<tr class="lineitem_index_' + index + '"><td class="">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td>' + value.type_name + '</td>';
            <?php if($use_category == '1') { ?>
                row_html += '<td>' + value.category_name + '</td>';
            <?php } ?>
            var value_li_narration = '';
            if(value.li_narration && value.li_narration != null){
                value_li_narration = value.li_narration;
            }
            row_html += '<td>' + value.item_name + '<br><small>' + value_li_narration + '</small></td>' +
                    '<td class="text-right">' + parseFloat(grwt).toFixed(3) + '</td>';
            <?php if($less_netwt_2 == '1') { ?>
                <?php if (isset($order_lot_item)) { ?>
                    row_html += '<td class="text-right">' + parseFloat(value.less).toFixed(3) + '</td>';
                <?php } else { ?>
                    row_html += '<td class="text-right">' + parseFloat(less).toFixed(3) + '</td>';
                <?php } ?>
                row_html += '<td class="text-right">' + parseFloat(net_wt).toFixed(3) + '</td>';
            <?php } ?>
            row_html += '<td class="text-right">' + touch_id + '</td>';
            <?php if($wstg_2 == '1') { ?>
                row_html += '<td class="text-right">' + wstg + '</td>';
            <?php } ?>
            row_html += '<td class="text-right">' + parseFloat(gold_value || 0).toFixed(3) + '</td>'+
                    '<td class="text-right">' + parseFloat(silver_value || 0).toFixed(3) + '</td>';
            row_html += '<td class="text-right"><a href="javascript:void(0)" id="sell_lineitem_charges_details" data-index="' + index + '" data-net_wt="' + parseFloat(net_wt).toFixed(3) + '" class="module_save_btn sell_lineitem_charges_details_' + index + '" style="margin: 0;">' + parseFloat(amount).toFixed(2) + '</a></td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td class="text-right">' + parseFloat(amount).toFixed(2) + '</td>';
                row_html += '<td class="text-right"></td>';
            <?php } ?>
            <?php if($lineitem_image_2 == '1') { ?>
                if (value.image !== null && value.image !== '') {
                    var value_image = value.image;
                    if (value.order_lot_item_id && value_image.indexOf('uploads/order_item_photo') != -1) {
                        var img_url = '<?php echo base_url(); ?>' + '/' + value.image;
                    } else {
                        var img_url = '<?php echo base_url(); ?>' + 'uploads/sell_item_photo/' + value.image;
                    }
                    row_html += '<td><a href="javascript:void(0)" class="btn btn-xs btn-primary image_model" data-img_src="' + img_url + '" ><i class="fa fa-image"></i></a></td>';
                }
            <?php } ?>
            new_lineitem_html += row_html;
            
            if(value.rfid_number != '' && value.rfid_number != null){
                total_rfid_pcs++;
                total_rfid_wt = parseFloat(total_rfid_wt) + parseFloat(grwt);
            } else {
                total_loose_pcs++;
                total_loose_wt = parseFloat(total_loose_wt) + parseFloat(grwt);
            }
            
        });
        $('tbody#lineitem_list').html(new_lineitem_html);

        $('#total_grwt').html(round(total_grwt, 2).toFixed(3));
        $('#total_less').html(round(total_less, 2).toFixed(3));
        $('#total_ntwt').html(round(total_ntwt, 2).toFixed(3));
        $('#li_total_gold_fine').html(parseFloat(li_total_gold_fine).toFixed(3));
        $('#li_total_silver_fine').html(parseFloat(li_total_silver_fine).toFixed(2));
        $('#li_total_amount').html(parseFloat(li_total_amount).toFixed(2));
        get_bill_total_amount();
        
        $('#total_rfid_pcs').html(total_rfid_pcs);
        $('#total_rfid_wt').html(round(total_rfid_wt, 2).toFixed(3));
        $('#total_loose_pcs').html(total_loose_pcs);
        $('#total_loose_wt').html(round(total_loose_wt, 2).toFixed(3));
        $('#ajax-loader').hide();
    }

    function edit_lineitem(index) {
        $("html, body").animate({scrollTop: 0}, "slow");
        $('#ajax-loader').show();
        $(".delete_sp_item").addClass('hide');
        sell_index = index;
        var value = lineitem_objectdata[index];
//        console.log(value);
        if(value.tunch_textbox == 1){
            $("#tunch_textbox").prop("checked", true);
        } else {
            $("#tunch_textbox").prop("checked", false);
        }
        $("#sell_type_id").val(value.type).trigger("change");
//        setSelect2Value($("#sell_type_id"), "<?= base_url('app/set_sell_type_select2_val_by_id/') ?>" + value.type);
        <?php if($use_category == '1') { ?>
            $("#category_id").val(value.category_id).trigger("change");
            setSelect2Value($("#category_id"), "<?= base_url('app/set_category_select2_val_by_id/') ?>" + value.category_id);
        <?php } else { ?>
            $("#category_id").val(value.category_id);
        <?php } ?>
        $("#item_id").val(value.item_id).trigger("change");
        <?php if(GET_ALL_DATA_IN_ITEM_SELECTION_IN_SELL_PURCHASE == '1' && empty($use_category)) { ?>
                
        <?php } else { ?>
            setSelect2Value($("#item_id"), "<?= base_url('app/set_item_name_select2_val_by_id/') ?>" + value.item_id);
        <?php } ?>
        
        $("#li_narration").val(value.li_narration);
        if(value.purchase_sell_item_id == '' || value.purchase_sell_item_id == null){
            $("#line_items_index").val(index);
            if (typeof (value.sell_item_id) != "undefined" && value.sell_item_id !== null) {
                $("#sell_item_id").val(value.sell_item_id);
            }
            $("#sell_purchase_id").val(value.sell_item_id);
            $("#order_lot_item_id").val(value.order_lot_item_id);
            $("#purchase_sell_item_id").val(value.purchase_sell_item_id);
            $("#stock_type").val(value.stock_type);
            $("#grwt").val(value.grwt);
            $("#less").val(value.less);
            $("#net_wt").val(value.net_wt);
            $(".touch_id").val(value.touch_id).trigger("change");
            $("#gold_silver_rate").val(value.gold_silver_rate);
            $(".wstg").val(value.wstg);
            $("#fine").val(value.fine);
            $("#item_stock_rfid_id").val(value.item_stock_rfid_id);
            $("#rfid_number").val(value.rfid_number);
            $("#charges_amt").val(value.charges_amt);
            $("#image").val(value.image);
            $("#file_upload").val('');
            $('#total_grwt_sell').val(value.total_grwt_sell);
        } else {
            $("#item_id").val(null).trigger("change");
        }
        if(value.sell_item_delete == 'not_allow'){
            $('#sell_type_id').attr('disabled','disabled');
            $('#category_id').attr('disabled','disabled');
            $('#item_id').attr('disabled','disabled');
            $('.touch_id').attr('disabled','disabled');
            $('#tunch_textbox').attr('disabled','disabled');
        }
        
        if(value.rfid_number != '' && value.rfid_number != null){
            $('#sell_type_id').attr('disabled','disabled');
            $('#category_id').attr('disabled','disabled');
            $('#item_id').attr('disabled','disabled');
            $('#grwt').attr('disabled','disabled');
            $('.touch_id').attr('disabled','disabled');
            $('#tunch_textbox').attr('disabled','disabled');
            $('#rfid_number').attr('disabled','disabled');
        }
        
        $("#sell_item_delete").val(value.sell_item_delete);
        
        if (typeof (value.sell_less_ad_details) != "undefined" && value.sell_less_ad_details !== null) {
            value_sell_less_ad_details = value.sell_less_ad_details;
            if(value_sell_less_ad_details != ''){
                less_ad_details_objectdata = JSON.parse(value_sell_less_ad_details);
            }
            display_less_ad_details_html(less_ad_details_objectdata);
        }

        if (typeof (value.sell_item_charges_details) != "undefined" && value.sell_item_charges_details !== null) {
            value_sell_item_charges_details = value.sell_item_charges_details;
            if(value_sell_item_charges_details != ''){
                sell_item_charges_details_objectdata = JSON.parse(value_sell_item_charges_details);
            }
            display_sell_item_charges_details_html(sell_item_charges_details_objectdata);
        }
        $('#ajax-loader').hide();
    }

    function remove_lineitem(index) {
        if (confirm('Are you sure ?')) {
            lineitem_objectdata.splice(index, 1);
            display_lineitem_html(lineitem_objectdata);
        }
    }
    
    function display_pay_rec_html(pay_rec_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
//        console.log(pay_rec_objectdata);
        payment_receipt_amount = 0;
        pr_cr_c_amount = 0;
        pr_cr_r_amount = 0;
        $.each(pay_rec_objectdata, function (index, value) {
            if(value.payment_receipt == '1'){
                var payment_receipt = 'Payment';
                var value_amount = value.amount;
            } else { 
                var payment_receipt = 'Receipt';
                var value_amount = zero_value - value.amount;
            }
            value_amount = parseFloat(value_amount).toFixed(2);
            payment_receipt_amount = parseFloat(payment_receipt_amount) + parseFloat(value_amount);
            var c_amount = 0;
            var r_amount = 0;
            if(value.cash_cheque == '1'){
                var cash_cheque = 'Cash';
                var c_amount = parseFloat(value_amount);
                pr_cr_c_amount = parseFloat(pr_cr_c_amount) + parseFloat(value_amount);
            } else {
                var cash_cheque = 'Bank';
                var r_amount = parseFloat(value_amount);
                pr_cr_r_amount = parseFloat(pr_cr_r_amount) + parseFloat(value_amount);
            }
            pay_rec_objectdata[index].c_amt = c_amount;
            pay_rec_objectdata[index].r_amt = r_amount;
            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_pay_rec' + index + '" href="javascript:void(0);" onclick="edit_pay_rec(' + index + ')"><i class="fa fa-edit"></i></a> ';
            lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_pr_item" href="javascript:void(0);" onclick="remove_pay_rec(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="pay_rec_index_' + index + '"><td class=""  width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Payment Receipt </td>' +
                    '<td width="8%">' + payment_receipt + ' @ '+ cash_cheque +'</td>' +
                    '<td width="5%">' + value.bank_name + '</td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%"></td>' +
                    '<td width="7%" class="text-right"></td>' +
                    '<td width="6%" class="text-right">' + value_amount + '</td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td width="5%" class="text-right">' + parseFloat(c_amount).toFixed(2) + '</td>';
                row_html += '<td width="5%" class="text-right">' + parseFloat(r_amount).toFixed(2) + '</td>';
            <?php } ?>
            row_html += '<td width="5%"></td></tr>';
            new_lineitem_html += row_html;
//            console.log(new_lineitem_html);
        });
        $('tbody#pop_up_pay_rec_list').html(new_lineitem_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_pay_rec(index) {
        $('#payment_receipt_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_pr_item").addClass('hide');
        var value = pay_rec_objectdata[index];
        
        $("#pay_rec_index").val(index);
        if (typeof (value.pay_rec_id) != "undefined" && value.pay_rec_id !== null) {
            $("#pay_rec_id").val(value.pay_rec_id);
        }
        $("input[name=payment_receipt][value='" + value.payment_receipt + "']").prop("checked",true);
        $("#cash_cheque").val(value.cash_cheque).trigger("change");
        $("#bank_id").val(value.bank_id).trigger("change");
        setSelect2Value($("#bank_id"), "<?= base_url('app/set_account_bank_select2_val_by_id/') ?>" + value.bank_id);
        $("#amount").val(value.amount);
        $("#narration").val(value.narration);
        $('#ajax-loader').hide();
    }

    function remove_pay_rec(index) {
        if (confirm('Are you sure ?')) {
            pay_rec_objectdata.splice(index, 1);
            display_pay_rec_html(pay_rec_objectdata);
        }
    }
    
    function display_metal_html(metal_objectdata) {
        $('#ajax-loader').show();
        var new_metal_html = '';
        metal_gold_total = 0;
        metal_silver_total = 0;
//        console.log(metal_objectdata);
        $.each(metal_objectdata, function (index, value) {
            if(value.metal_payment_receipt == '1'){
                var metal_pay_type = 'Issue';
                var metal_grwt = value.metal_grwt;
                var metal_tunch = value.metal_tunch;
                var metal_fine = value.metal_fine;
            } else if(value.metal_payment_receipt == '2'){
                var metal_pay_type = 'Receive';
                var metal_grwt = zero_value - parseFloat(value.metal_grwt);
                var metal_tunch = zero_value - parseFloat(value.metal_tunch);
                var metal_fine =  zero_value - parseFloat(value.metal_fine);
            }
            if(value.group_name == '<?php echo CATEGORY_GROUP_GOLD_ID; ?>'){
                metal_gold_total = metal_gold_total + parseFloat(metal_fine);
                var gold_value = round(parseFloat(metal_fine), 2).toFixed(3);
                var silver_value = '';
            } else {
                metal_silver_total = metal_silver_total + parseFloat(metal_fine);
                var gold_value = '';
                var silver_value = round(parseFloat(metal_fine), 1).toFixed(3);
            }

            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
//            var metal_grwt = parseFloat(value.metal_grwt);
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_metal' + index + '" href="javascript:void(0);" onclick="edit_metal(' + index + ')"><i class="fa fa-edit"></i></a> ';
            if(value.metal_item_delete == 'allow'){
                lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_mpr_item" href="javascript:void(0);" onclick="remove_metal(' + index + ')"><i class="fa fa-remove"></i></a>';
            }
            var metal_html = '<tr class="metal_index_' + index + '"><td class=""  width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Metal Issue Receive </td>' +
                    '<td width="8%">' + metal_pay_type + ' @ ' + value.metal_item_name + '</td>' +
                    '<td width="5%" class="text-right">' + parseFloat(metal_grwt).toFixed(3) + '</td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%" class="text-right">' + metal_tunch + '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%" class="text-right">' + parseFloat(gold_value || 0).toFixed(3) + '</td>' +  
                    '<td width="7%" class="text-right">' + parseFloat(silver_value || 0).toFixed(3) + '</td>' + 
                    '<td width="6%"></td>';
            <?php if($c_r_amount_separate == '1') { ?>
                metal_html += '<td width="5%" class="text-right"></td>';
                metal_html += '<td width="5%" class="text-right"></td>';
            <?php } ?>
            metal_html += '<td width="5%"></td></tr>';
            new_metal_html += metal_html;
        });
        $('tbody#pop_up_metal_list').html(new_metal_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_metal(index) {
        $('#metal_receipt_payment_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_mpr_item").addClass('hide');
        var value = metal_objectdata[index];
        metal_index = index;
        $("#metal_index").val(index);
        if (typeof (value.id) != "undefined" && value.id !== null) {
            $("#metal_pr_id").val(value.id);
        }
        $("input[name=metal_payment_receipt][value='" + value.metal_payment_receipt + "']").prop("checked",true);
        if(value.metal_item_delete != 'allow'){
            $('input[name=metal_payment_receipt]').attr('disabled', true);
            $('#metal_item_id').attr('disabled', true);
            $('#metal_tunch').attr('readonly', true);
        }
//        $(".metal_payment_receipt").val(value.metal_payment_receipt).attr('checked', 'checked');
        $("#metal_item_id").val(value.metal_item_id).trigger("change");
        setSelect2Value($("#metal_item_id"), "<?= base_url('app/set_item_name_select2_val_by_id/') ?>" + value.metal_item_id);
        $("#metal_grwt").val(value.metal_grwt);
        $("#metal_tunch").val(value.metal_tunch);
        $("#metal_fine").val(value.metal_fine);
        $('#metal_pr_id').val(value.metal_pr_id);
        $('#metal_narration').val(value.metal_narration);
        $('#total_grwt_metal').val(value.total_grwt_metal);    
        $('#metal_item_delete').val(value.metal_item_delete);    
        $('#ajax-loader').hide();
    }

    function remove_metal(index) {
        if (confirm('Are you sure ?')) {
            metal_objectdata.splice(index, 1);
            display_metal_html(metal_objectdata);
        }
    }
    
    function display_gold_html(gold_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
        gold_count = 0;
        gold_amount_count = 0;
        gold_cr_c_amount = 0;
        gold_cr_r_amount = 0;
        $.each(gold_objectdata, function (index, value) {
            var gold_weight = parseFloat(value.gold_weight);
            var gold_value = parseFloat(value.gold_value);

            if(value.gold_sale_purchase == '1') {
                var gold_sale_purchase = 'Sell';
                var value_gold_weight = zero_value - parseFloat(gold_weight);
                var value_gold_value = gold_value;
            } else { 
                var gold_sale_purchase = 'Purchase';
                var value_gold_weight = gold_weight;
                var value_gold_value = zero_value - parseFloat(gold_value);
            }
            gold_count = gold_count + parseFloat(value_gold_weight);
            gold_amount_count = gold_amount_count + parseFloat(value_gold_value);
            var c_amount = 0;
            var r_amount = 0;
            if(value.gold_cr_effect == '2') {
                gold_cr_r_amount = gold_cr_r_amount + parseFloat(value_gold_value);
                r_amount = value_gold_value;
            } else {
                gold_cr_c_amount = gold_cr_c_amount + parseFloat(value_gold_value);
                c_amount = value_gold_value;
            }
            gold_objectdata[index].c_amt = c_amount;
            gold_objectdata[index].r_amt = r_amount;

            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_gold' + index + '" class="gold_open_popup" href="javascript:void(0);" onclick="edit_gold(' + index + ')"><i class="fa fa-edit"></i></a> ';
            lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_g_item" href="javascript:void(0);" onclick="remove_gold(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="gold_index_' + index + '"><td class="" width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +   
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Gold Bhav </td>' +
                    '<td width="8%">' + gold_sale_purchase + ' @ '+ value.gold_rate +'</td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%" class="text-right">' + parseFloat(value_gold_weight).toFixed(3) + '</td>' +
                    '<td width="7%"></td>' +
                    '<td width="6%" class="text-right">' + value_gold_value + '</td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td width="5%" class="text-right">' + parseFloat(c_amount).toFixed(2) + '</td>';
                row_html += '<td width="5%" class="text-right">' + parseFloat(r_amount).toFixed(2) + '</td>';
            <?php } ?>
            row_html += '<td width="5%"></td></tr>';
            new_lineitem_html += row_html;
//            console.log(new_lineitem_html);
        });
        $('tbody#pop_up_gold_list').html(new_lineitem_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_gold(index) {
        $('#gold_bhav_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_g_item").addClass('hide');
        gold_array_for_edit = [];
        var value = gold_objectdata[index];
//        console.log(gold_array_for_edit);
        gold_array_for_edit.push(value);

        $("#gold_index").val(index);
        if (typeof (value.gold_id) != "undefined" && value.gold_id !== null) {
            $("#gold_id").val(value.gold_id);
        }
        $("input[name=gold_sale_purchase][value='" + value.gold_sale_purchase + "']").prop("checked",true);
        $("#gold_weight").val(value.gold_weight);
        $("#gold_rate").val(value.gold_rate);
        $("#gold_value").val(value.gold_value);
        $("#gold_cr_effect").val(value.gold_cr_effect).trigger("change");
        $("#gold_narration").val(value.gold_narration);
        $('#ajax-loader').hide();
    }
    
    function remove_gold(index) {
        if (confirm('Are you sure ?')) {
            gold_objectdata.splice(index, 1);
            display_gold_html(gold_objectdata);
        }
    }
    
    function display_silver_html(silver_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
        silver_count = 0;
        silver_amount_count = 0;
        silver_cr_c_amount = 0;
        silver_cr_r_amount = 0;
        $.each(silver_objectdata, function (index, value) {
            var silver_weight = parseFloat(value.silver_weight);
            var silver_value = parseFloat(value.silver_value);

            if(value.silver_sale_purchase == '1') {
                var silver_sale_purchase = 'Sell';
                var value_silver_weight = zero_value - parseFloat(silver_weight);
                var value_silver_value = silver_value;
            } else { 
                var silver_sale_purchase = 'Purchase';
                var value_silver_weight = silver_weight;
                var value_silver_value = zero_value - parseFloat(silver_value);
            }
            silver_count = silver_count + parseFloat(value_silver_weight);
            silver_amount_count = silver_amount_count + parseFloat(value_silver_value);
            var c_amount = 0;
            var r_amount = 0;
            if(value.silver_cr_effect == '2') {
                silver_cr_r_amount = silver_cr_r_amount + parseFloat(value_silver_value);
                r_amount = value_silver_value;
            } else {
                silver_cr_c_amount = silver_cr_c_amount + parseFloat(value_silver_value);
                c_amount = value_silver_value;
            }
            silver_objectdata[index].c_amt = c_amount;
            silver_objectdata[index].r_amt = r_amount;

            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_silver' + index + '" href="javascript:void(0);" onclick="edit_silver(' + index + ')"><i class="fa fa-edit"></i></a> ';
            lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_s_item" href="javascript:void(0);" onclick="remove_silver(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="silver_index_' + index + '"><td class="" width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Silver Bhav </td>' +
                    '<td width="8%">' + silver_sale_purchase + ' @ '+ value.silver_rate +'</td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%"></td>' +
                    '<td width="7%" class="text-right">' + parseFloat(value_silver_weight).toFixed(3) + '</td>' +
                    '<td width="6%" class="text-right">' + value_silver_value + '</td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td width="5%" class="text-right">' + parseFloat(c_amount).toFixed(2) + '</td>';
                row_html += '<td width="5%" class="text-right">' + parseFloat(r_amount).toFixed(2) + '</td>';
            <?php } ?>
            row_html += '<td width="5%"></td></tr>';
            new_lineitem_html += row_html;
//            console.log(new_lineitem_html);
        });
        $('tbody#pop_up_silver_list').html(new_lineitem_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_silver(index) {
        $('#silver_bhav_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_s_item").addClass('hide');
        var value = silver_objectdata[index];
        silver_array_for_edit.push(value);
        
        $("#silver_index").val(index);
        if (typeof (value.silver_id) != "undefined" && value.silver_id !== null) {
            $("#silver_id").val(value.silver_id);
        }
        $("input[name=silver_sale_purchase][value='" + value.silver_sale_purchase + "']").prop("checked",true);
        $("#silver_weight").val(value.silver_weight);
        $("#silver_rate").val(value.silver_rate);
        $("#silver_value").val(value.silver_value);
        $("#silver_cr_effect").val(value.silver_cr_effect).trigger("change");
        $("#silver_narration").val(value.silver_narration);
        $('#ajax-loader').hide();
    }

    function remove_silver(index) {
        if (confirm('Are you sure ?')) {
            silver_objectdata.splice(index, 1);
            display_silver_html(silver_objectdata);
        }
    }
    
    function display_transfer_html(transfer_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
        transfer_gold_total = 0;
        transfer_silver_total = 0;
        transfer_amount_total = 0;
        transfer_cr_c_amount = 0;
        transfer_cr_r_amount = 0;
        $.each(transfer_objectdata, function (index, value) {
            var transfer_gold = parseFloat(value.transfer_gold || 0);
            var transfer_silver = parseFloat(value.transfer_silver  || 0);
            var transfer_amount = parseFloat(value.transfer_amount  || 0);
            if(value.naam_jama == '1'){
                var naam_jama = 'Naam (Dr)';
                var value_transfer_gold = zero_value - transfer_gold;
                var value_transfer_silver = zero_value - transfer_silver;
                var value_transfer_amount = zero_value - transfer_amount;
            } else { 
                var naam_jama = 'Jama (Cr)';
                var value_transfer_gold = transfer_gold;
                var value_transfer_silver = transfer_silver;
                var value_transfer_amount = transfer_amount;
            }
            transfer_gold_total = transfer_gold_total + parseFloat(value_transfer_gold);
            transfer_silver_total = transfer_silver_total + parseFloat(value_transfer_silver);
            transfer_amount_total = transfer_amount_total + parseFloat(value_transfer_amount);
            transfer_cr_c_amount = transfer_cr_c_amount + parseFloat(value_transfer_amount);
            transfer_objectdata[index].c_amt = parseFloat(value_transfer_amount);
            transfer_objectdata[index].r_amt = 0;

            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_transfer' + index + '" href="javascript:void(0);" onclick="edit_transfer(' + index + ')"><i class="fa fa-edit"></i></a> ';
            lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_t_item" href="javascript:void(0);" onclick="remove_transfer(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="transfer_index_' + index + '"><td class="" width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Transfer </td>' +
                    '<td width="8%">' + naam_jama + ' @ '+ value.party_name +'</td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%" class="text-right"> ' + parseFloat(value_transfer_gold || 0).toFixed(3) + '</td>' +
                    '<td width="7%" class="text-right">' + parseFloat(value_transfer_silver || 0).toFixed(3) + '</td>' +
                    '<td width="6%" class="text-right">' + parseFloat(value_transfer_amount || 0).toFixed(2) + '</td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td width="5%" class="text-right">' + parseFloat(value_transfer_amount).toFixed(2) + '</td>';
                row_html += '<td width="5%" class="text-right"></td>';
            <?php } ?>
            row_html += '<td width="5%"></td></tr>';
            new_lineitem_html += row_html;
//            console.log(new_lineitem_html);
        });
        $('tbody#pop_up_transfer_list').html(new_lineitem_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_transfer(index) {
        $('#transfer_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_t_item").addClass('hide');
        var value = transfer_objectdata[index];
        
        $("#transfer_index").val(index);
        if (typeof (value.transfer_entry_id) != "undefined" && value.transfer_entry_id !== null) {
            $("#transfer_entry_id").val(value.transfer_entry_id);
        }
        $("input[name=naam_jama][value='" + value.naam_jama + "']").prop("checked",true);
        $("#transfer_account_id").val(value.transfer_account_id).trigger("change");
        setSelect2Value($("#transfer_account_id"), "<?= base_url('app/set_account_name_with_number_val_by_id/') ?>" + value.transfer_account_id);
        $("#transfer_gold").val(value.transfer_gold);
        $("#transfer_silver").val(value.transfer_silver);
        $("#transfer_amount").val(value.transfer_amount);
        $("#transfer_narration").val(value.transfer_narration);
        $('#ajax-loader').hide();
    }

    function remove_transfer(index) {
        if (confirm('Are you sure ?')) {
            transfer_objectdata.splice(index, 1);
            display_transfer_html(transfer_objectdata);
        }
    }
    
    function display_ad_charges_html(ad_charges_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
        ad_amount_total = 0;
        ad_cr_c_amount = 0;
        ad_cr_r_amount = 0;
        $.each(ad_charges_objectdata, function (index, value) {
            var value_ad_charges_amount = value.ad_amount;
            ad_amount_total = ad_amount_total + parseFloat(value_ad_charges_amount);
            ad_cr_c_amount = ad_cr_c_amount + parseFloat(value_ad_charges_amount);
            ad_charges_objectdata[index].c_amt = parseFloat(value_ad_charges_amount);
            ad_charges_objectdata[index].r_amt = 0;
            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_ad_charges' + index + '" href="javascript:void(0);" onclick="edit_ad_charges(' + index + ')"><i class="fa fa-edit"></i></a> ';
            lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_ad_item" href="javascript:void(0);" onclick="remove_ad_charges(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="ad_charges_index_' + index + '"><td class="" width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Charges : ' + value.ad_name + '</td>' +
                    '<td width="8%">' + value.ad_pcs + ' @ '+ value.ad_rate +'</td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%" class="text-right"></td>' +
                    '<td width="7%" class="text-right"></td>' +
                    '<td width="6%" class="text-right">' + value_ad_charges_amount + '</td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td width="5%" class="text-right">' + parseFloat(value_ad_charges_amount).toFixed(2) + '</td>';
                row_html += '<td width="5%" class="text-right"></td>';
            <?php } ?>
            row_html += '<td width="5%"></td></tr>';
            new_lineitem_html += row_html;
//            console.log(new_lineitem_html);
        });
        $('tbody#pop_up_ad_charges_list').html(new_lineitem_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_ad_charges(index) {
        $('#ad_charges_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_ad_item").addClass('hide');
        var value = ad_charges_objectdata[index];
        
        $("#ad_lineitem_index").val(index);
//        console.log(value.ad_charges_id);
        if (typeof (value.sell_ad_charges_id) != "undefined" && value.sell_ad_charges_id !== null) {
            $("#sell_ad_charges_id").val(value.sell_ad_charges_id);
        }
        $("input[name=naam_jama][value='" + value.naam_jama + "']").prop("checked",true);
        $("#ad_charges_account_id").val(value.ad_charges_account_id).trigger("change");
        setSelect2Value($("#ad_id"), "<?= base_url('app/set_ad_name_select2_val_by_id/') ?>" + value.ad_id);
        $("#ad_pcs").val(value.ad_pcs);
        $("#ad_rate").val(value.ad_rate);
        $("#ad_amount").val(value.ad_amount);
        $('#ajax-loader').hide();
    }

    function remove_ad_charges(index) {
        if (confirm('Are you sure ?')) {
            ad_charges_objectdata.splice(index, 1);
            display_ad_charges_html(ad_charges_objectdata);
        }
    }

    function display_adjust_cr_html(adjust_cr_objectdata) {
        $('#ajax-loader').show();
        var new_lineitem_html = '';
        adjust_cr_amount_total = 0;
        adjust_cr_c_amount = 0;
        adjust_cr_r_amount = 0;
        $.each(adjust_cr_objectdata, function (index, value) {
            var adjust_cr_amount = value.adjust_cr_amount;
            adjust_cr_amount_total = adjust_cr_amount_total + parseFloat(0);
            var c_amount = 0;
            var r_amount = 0;
            if(value.adjust_to == '2') {
                c_amount = zero_value - parseFloat(adjust_cr_amount);
                r_amount = zero_value + parseFloat(adjust_cr_amount);
            } else {
                r_amount = zero_value - parseFloat(adjust_cr_amount);
                c_amount = zero_value + parseFloat(adjust_cr_amount);
            }
            adjust_cr_c_amount = adjust_cr_c_amount + parseFloat(c_amount);
            adjust_cr_r_amount = adjust_cr_r_amount + parseFloat(r_amount);
            adjust_cr_objectdata[index].c_amt = parseFloat(c_amount);
            adjust_cr_objectdata[index].r_amt = parseFloat(r_amount);
            var lineitem_edit_btn = '';
            var lineitem_delete_btn = '';
            lineitem_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_adjust_cr' + index + '" href="javascript:void(0);" onclick="edit_adjust_cr(' + index + ')"><i class="fa fa-edit"></i></a> ';
            lineitem_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_adjust_cr_item" href="javascript:void(0);" onclick="remove_adjust_cr(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="adjust_cr_index_' + index + '"><td class="" width="5%">' +
                    lineitem_edit_btn +
                    lineitem_delete_btn +
                    '</td>' +
                    '<td width="4%"></td>' +
                    '<td width="10%"> Adjust : ' + value.adjust_to_name + '</td>' +
                    '<td width="8%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="5%"></td>' +
                    '<td width="4%"></td>' +
                    '<td width="7%" class="text-right"></td>' +
                    '<td width="7%" class="text-right"></td>' +
                    '<td width="6%" class="text-right">' + parseFloat(0).toFixed(2) + '</td>';
            <?php if($c_r_amount_separate == '1') { ?>
                row_html += '<td width="5%" class="text-right">' + parseFloat(c_amount).toFixed(2) + '</td>';
                row_html += '<td width="5%" class="text-right">' + parseFloat(r_amount).toFixed(2) + '</td>';
            <?php } ?>
            row_html += '<td width="5%"></td></tr>';
            new_lineitem_html += row_html;
//            console.log(new_lineitem_html);
        });
        $('tbody#pop_up_adjust_cr_list').html(new_lineitem_html);
        $('#ajax-loader').hide();
        get_bill_total_amount();
    }

    function edit_adjust_cr(index) {
        $('#adjust_cr_model').modal('show');
        $('#ajax-loader').show();
        $(".delete_adjust_cr_item").addClass('hide');
        var value = adjust_cr_objectdata[index];

        $("#adjust_cr_lineitem_index").val(index);
//        console.log(value.adjust_cr_id);
        if (typeof (value.sell_adjust_cr_id) != "undefined" && value.sell_adjust_cr_id !== null) {
            $("#sell_adjust_cr_id").val(value.sell_adjust_cr_id);
        }
        $("#adjust_to").val(value.adjust_to).trigger("change");
        $("#adjust_cr_amount").val(value.adjust_cr_amount);
        $('#ajax-loader').hide();
    }

    function remove_adjust_cr(index) {
        if (confirm('Are you sure ?')) {
            adjust_cr_objectdata.splice(index, 1);
            display_adjust_cr_html(adjust_cr_objectdata);
        }
    }
    
    function display_less_ad_details_html(less_ad_details_objectdata) {
        $('#ajax-loader').show();
        var less_ad_details_html = '';
        var total_less_ad_details_pcs = 0;
        var total_less_ad_details_weight = 0;
        
        $.each(less_ad_details_objectdata, function (index, value) {

            var less_ad_details_edit_btn = '';
            var less_ad_details_delete_btn = '';
            var less_ad_details_ad_pcs = parseFloat(value.less_ad_details_ad_pcs) || 0;
            var less_ad_details_ad_weight = parseFloat(value.less_ad_details_ad_weight) || 0;
            less_ad_details_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_mhm_ad_item edit_less_ad_details_' + index + '" href="javascript:void(0);" onclick="edit_less_ad_details(' + index + ')"><i class="fa fa-edit"></i></a> ';
            if(value.less_ad_details_delete == 'allow'){
                less_ad_details_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_mhm_ad_item" href="javascript:void(0);" onclick="remove_less_ad_details(' + index + ')"><i class="fa fa-remove"></i></a>';
            }
            var row_html = '<tr class="lineitem_index_' + index + '"><td class="">' +
                    less_ad_details_edit_btn +
                    less_ad_details_delete_btn +
                    '</td>' +
                    '<td>' + value.less_ad_details_ad_name + '</td>' +
                    '<td class="text-right">' + less_ad_details_ad_pcs + '</td>'+
                    '<td class="text-right">' + less_ad_details_ad_weight.toFixed(2) + '</td>';
            total_less_ad_details_pcs = parseFloat(total_less_ad_details_pcs) + parseFloat(less_ad_details_ad_pcs);
            total_less_ad_details_weight = parseFloat(total_less_ad_details_weight) + parseFloat(less_ad_details_ad_weight);
            less_ad_details_html += row_html;
        });
        $('#less_ad_details_list').html(less_ad_details_html);
        $('#total_less_ad_details_pcs').html(total_less_ad_details_pcs);
        $('#total_less_ad_details_weight').html(total_less_ad_details_weight.toFixed(2));
        $('#ajax-loader').hide();
    }
    
    function edit_less_ad_details(index) {
        $("html, body").animate({scrollTop: 0}, "slow");
        $('#ajax-loader').show();
        $(".delete_mhm_ad_item").addClass('hide');
        less_ad_details_index = index;
        if (edit_less_ad_details_inc == 0) {
            edit_less_ad_details_inc = 1;
            $(".add_less_ad_details").removeAttr("disabled");
        }
        var value = less_ad_details_objectdata[index];
        $("#less_ad_details_index").val(index);
        $("#less_ad_details_delete").val(value.less_ad_details_delete);
        if(typeof(value.sell_less_ad_details_id) !== "undefined" && value.sell_less_ad_details_id !== null) {
            $("#sell_less_ad_details_id").val(value.sell_less_ad_details_id);
        }
        $("#less_ad_details_ad_id").val(null).trigger("change");
        setSelect2Value($("#less_ad_details_ad_id"), "<?= base_url('app/set_ad_name_select2_val_by_id/') ?>" + value.less_ad_details_ad_id);
        $("#less_ad_details_ad_pcs").val(value.less_ad_details_ad_pcs);
        $("#less_ad_details_ad_weight").val(value.less_ad_details_ad_weight);
        $('#ajax-loader').hide();
    }

    function remove_less_ad_details(index) {
        value = less_ad_details_objectdata[index];
        if (confirm('Are you sure ?')) {
            less_ad_details_objectdata.splice(index, 1);
            display_less_ad_details_html(less_ad_details_objectdata);
        }
    }
    
    function display_sell_item_charges_details_html(sell_item_charges_details_objectdata) {
        $('#ajax-loader').show();
        var sell_item_charges_details_html = '';
        var total_sell_item_charges_details_amount = 0;

        $.each(sell_item_charges_details_objectdata, function (index, value) {

            var sell_item_charges_details_edit_btn = '';
            var sell_item_charges_details_delete_btn = '';
            var sell_item_charges_details_net_wt = parseFloat(value.sell_item_charges_details_net_wt) || 0;
            var sell_item_charges_details_per_gram = parseFloat(value.sell_item_charges_details_per_gram) || 0;
            var sell_item_charges_details_ad_amount = parseFloat(value.sell_item_charges_details_ad_amount) || 0;
            sell_item_charges_details_edit_btn = '<a class="btn btn-xs btn-primary btn-edit-item edit_mhm_ad_item edit_sell_item_charges_details_' + index + '" href="javascript:void(0);" onclick="edit_sell_item_charges_details(' + index + ')"><i class="fa fa-edit"></i></a> ';
            sell_item_charges_details_delete_btn = '<a class="btn btn-xs btn-danger btn-delete-item delete_mhm_ad_item" href="javascript:void(0);" onclick="remove_sell_item_charges_details(' + index + ')"><i class="fa fa-remove"></i></a>';
            var row_html = '<tr class="lineitem_index_' + index + '"><td class="">' +
                    sell_item_charges_details_edit_btn +
                    sell_item_charges_details_delete_btn +
                    '</td>' +
                    '<td>' + value.sell_item_charges_details_ad_name + '</td>' +
                    '<td class="text-right">' + sell_item_charges_details_net_wt.toFixed(3) + '</td>' +
                    '<td class="text-right">' + sell_item_charges_details_per_gram.toFixed(2) + '</td>' +
                    '<td class="text-right">' + sell_item_charges_details_ad_amount.toFixed(2) + '</td>';
            total_sell_item_charges_details_amount = parseFloat(total_sell_item_charges_details_amount) + parseFloat(sell_item_charges_details_ad_amount);
            sell_item_charges_details_html += row_html;
        });
        $('#sell_item_charges_details_list').html(sell_item_charges_details_html);
        $('#total_sell_item_charges_details_amount').html(total_sell_item_charges_details_amount.toFixed(2));
        $('#ajax-loader').hide();
    }

    function edit_sell_item_charges_details(index) {
        $("html, body").animate({scrollTop: 0}, "slow");
        $('#ajax-loader').show();
        $(".delete_mhm_ad_item").addClass('hide');
        sell_item_charges_details_index = index;
        if (edit_sell_item_charges_details_inc == 0) {
            edit_sell_item_charges_details_inc = 1;
            $(".add_sell_item_charges_details").removeAttr("disabled");
        }
        var value = sell_item_charges_details_objectdata[index];
        $("#sell_item_charges_details_index").val(index);
        $("#sell_item_charges_details_delete").val(value.sell_item_charges_details_delete);
        if(typeof(value.sell_item_charges_details_id) !== "undefined" && value.sell_item_charges_details_id !== null) {
            $("#sell_item_charges_details_id").val(value.sell_item_charges_details_id);
        }
        $("#sell_item_charges_details_ad_id").val(null).trigger("change");
        setSelect2Value($("#sell_item_charges_details_ad_id"), "<?= base_url('app/set_ad_name_select2_val_by_id/') ?>" + value.sell_item_charges_details_ad_id);
        $("#sell_item_charges_details_net_wt").val(value.sell_item_charges_details_net_wt);
        $("#sell_item_charges_details_per_gram").val(value.sell_item_charges_details_per_gram);
        $("#sell_item_charges_details_ad_amount").val(value.sell_item_charges_details_ad_amount);
        $('#ajax-loader').hide();
    }

    function remove_sell_item_charges_details(index) {
        value = sell_item_charges_details_objectdata[index];
        if (confirm('Are you sure ?')) {
            sell_item_charges_details_objectdata.splice(index, 1);
            display_sell_item_charges_details_html(sell_item_charges_details_objectdata);
        }
    }

    function checked_average_value() {
        var total_grwt = 0;
        var total_fine = 0;
        var average_value = 0;
        var pts_checked_total_grwt = 0;
        var pts_checked_total_less = 0;
        var pts_checked_total_ntwt = 0;
        var pts_checked_total_average = 0;
        var pts_checked_total_fine = 0;
        
        $.each($(".pts_selected_index:checked"), function(){
            var pts_selected_index = $(this).data('pts_selected_index');
            pts_checked_total_grwt = pts_checked_total_grwt + parseFloat($('#pts_grwt_' +pts_selected_index).val() || 0);
            pts_checked_total_less = pts_checked_total_less + parseFloat($('#pts_less_' +pts_selected_index).val() || 0);
            pts_checked_total_ntwt = pts_checked_total_ntwt + parseFloat($('#pts_net_wt_' +pts_selected_index).text());
            pts_checked_total_fine = pts_checked_total_fine + parseFloat($('#pts_fine_' +pts_selected_index).text() || 0);
        });
         
        $('#pts_checked_total_grwt').html(pts_checked_total_grwt.toFixed(3));
        $('#pts_checked_total_less').html(pts_checked_total_less.toFixed(3));
        $('#pts_checked_total_ntwt').html(pts_checked_total_ntwt.toFixed(3));
        if(pts_checked_total_ntwt != 0 && pts_checked_total_fine != 0){
            pts_checked_total_average = pts_checked_total_fine / pts_checked_total_ntwt * 100;
        }
        $('#pts_checked_total_average').html(pts_checked_total_average.toFixed(3));
        $('#pts_checked_total_fine').html(round(pts_checked_total_fine, 2).toFixed(3));
    }
    
    function get_wstg_from_account(){
        <?php //if (isset($order_lot_item) || isset($sell_item)){ } else { ?>
        <?php if($wstg_2 == '1') { ?>
            var account_id = $('#account_id').val();
            var item_id = $('#item_id').val();
            if (account_id != '' && account_id != null && item_id != '' && item_id != null) {
                $.ajax({
                    url: "<?= base_url('sell/get_wstg_from_account') ?>/" + account_id + '/' + item_id,
                    type: 'GET',
                    async: false,
                    data: '',
                    success: function (response) {
                        var json = $.parseJSON(response);
                        $('#wstg').val(json.account_data).change();
                        $('#default_wstg').val(json.account_data).change();
                    }
                });
            }
        <?php } else { ?>
            $('#wstg').val('0');
            $('#default_wstg').val('0');
        <?php } ?>
        <?php //} ?>
    }
    
    function readURL(input) {
        if (input.files && input.files[0]) {
//            console.log(input.files);
            $("#ajax-loader").show();
            var form = new FormData();
            var myFormData = document.getElementById('file_upload').files[0];
            form.append('file_upload', myFormData);
            form.append('action', 'get_temp_path');
            $.ajax({
                type: 'POST',
                processData: false,
                contentType: false,
                data: form,
                url: "<?= base_url('sell/get_temp_path_image') ?>",
                success: function (html) {
                    $('#image').val(html);
                    $("#ajax-loader").hide();
                }
            });
        }
    }
    
    function round(value, exp) {
        if (typeof exp === 'undefined' || +exp === 0)
          return Math.round(value);

        value = +value;
        exp = +exp;

        if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0))
          return NaN;

        // Shift
        value = value.toString().split('e');
        value = Math.round(+(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp)));

        // Shift back
        value = value.toString().split('e');
        return +(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp));
    }
    
    function get_stock_for_metal_receipt(department_id,metal_item_id,metal_tunch,metal_pr_id){
        var json_grwt = 0;
        $.ajax({
            url: "<?php echo base_url('sell/get_stock_for_metal_receipt'); ?>/" + department_id +"/"+ metal_item_id +"/"+ metal_tunch +"/"+metal_pr_id,
            type: "GET",
            async: false,
            data: "",
            success: function(response_grwt){
                json_grwt = $.parseJSON(response_grwt);
                
            }
        });
        return json_grwt;
    }
    
    function round10(x){
        return Math.round(x / 10) * 10;
    }
    
    function save_form(postData, href_url){
        alert('Work in progress...'); return false;
        $("#ajax-loader").show();
        $('.module_save_btn').attr('disabled', 'disabled');
        var lineitem_objectdata_stringify = JSON.stringify(lineitem_objectdata);
        postData.append('line_items_data', lineitem_objectdata_stringify);
        var pay_rec_objectdata_stringify = JSON.stringify(pay_rec_objectdata);
        postData.append('pay_rec_data', pay_rec_objectdata_stringify);
        var metal_objectdata_stringify = JSON.stringify(metal_objectdata);
        postData.append('metal_data', metal_objectdata_stringify);
        var gold_objectdata_stringify = JSON.stringify(gold_objectdata);
        postData.append('gold_data', gold_objectdata_stringify);
        var silver_objectdata_stringify = JSON.stringify(silver_objectdata);
        postData.append('silver_data', silver_objectdata_stringify);
        var transfer_objectdata_stringify = JSON.stringify(transfer_objectdata);
        postData.append('transfer_data', transfer_objectdata_stringify);
        var ad_charges_objectdata_stringify = JSON.stringify(ad_charges_objectdata);
        postData.append('ad_lineitem_data', ad_charges_objectdata_stringify);
        var adjust_cr_objectdata_stringify = JSON.stringify(adjust_cr_objectdata);
        postData.append('adjust_cr_lineitem_data', adjust_cr_objectdata_stringify);

        postData.append('sell_gold_fine', bill_gold_fine);
        postData.append('sell_silver_fine', bill_silver_fine);
        postData.append('sell_amount', bill_amount);
        postData.append('bill_cr_c_amount', bill_cr_c_amount);
        postData.append('bill_cr_r_amount', bill_cr_r_amount);
        postData.append('depart_gold_fine', depart_gold_fine);
        postData.append('depart_silver_fine', depart_silver_fine);
        postData.append('metal_gold_total_fine', metal_gold_total);
        postData.append('metal_silver_total_fine', metal_silver_total);
        postData.append('metal_other_total_fine', 0);
        postData.append('gold_fine_total', net_gold_fine);
        postData.append('silver_fine_total', net_silver_fine);
        postData.append('amount_total', net_amount);
        postData.append('saveform_clickbtn', saveform_clickbtn);
        $.ajax({
            url: href_url,
            type: "POST",
            processData: false,
            contentType: false,
            cache: false,
            data: postData,
            datatype: 'json',
            async: false,
            success: function (response) {
                $('.module_save_btn').removeAttr('disabled', 'disabled');
                var json = $.parseJSON(response);
                if (json['error'] == 'Exist') {
                    $("#ajax-loader").hide();
                    show_notify(json['error_exist'], false);
                } else if (json['error'] == 'Something went Wrong') {
                    $("#ajax-loader").hide();
                    show_notify('Something went Wrong! Please Refresh page and Go ahead.', false);
                } else if (json['success'] == 'Added') {
                    window.location.href = "<?php echo $list_page_url; ?>";
                } else if (json['success'] == 'Updated') {
                    window.location.href = "<?php echo $list_page_url; ?>";
                }
                return false;
            },
        });
    }
</script>
<?php 
$enter_key_to_next = $this->crud->get_column_value_by_id('settings', 'settings_value', array('settings_key' => 'enter_key_to_next'));
if($enter_key_to_next == 1 ) {
    ?>
<script type="text/javascript">
    $(document).ready(function(){
        $("#account_id").select2('open');

        $('body').on('keydown', '#wstg', function(e) {
            if (e.keyCode == 13) {
                $('#add_lineitem').click();
            }
        });

//        $(document).on('shown.bs.modal', function(e) {
//            $('input:visible:enabled:first', e.target).focus();
//        });

        $('body').on('keydown', 'input,select,.select2-search__field, textarea', function(e) {
            var self = $(this)
              , form = self.parents('form:eq(0)')
              , focusable
              , next
              , prev
              ;

            if($('.modal.in').length > 0) { 
                form = $('.modal.in');
            }
            
            var id = $(this).attr('id');
            if(id == 'add_lineitem'){
                $('#add_lineitem').click();
            } else if (e.shiftKey) {
                if (e.keyCode == 13 && $(this).is("textarea") == false) {
                    focusable =   form.find('input,a,select,.select2-search__field,button,textarea').filter(':visible:not([readonly])');
                    prev = focusable.eq(focusable.index(this)-1); 
                    if($(prev['0']).attr('id') == 'sell_item_charges_details'){
                        prev = focusable.eq(focusable.index(this)-2);
                    }
                    if($(prev['0']).attr('id') == 'tunch_textbox'){
                        prev = focusable.eq(focusable.index(this)-3);
                    }
                    if (prev.length) {
                       prev.focus();
                    } else {
                        form.submit();
                    }
                }
            } else if (e.keyCode == 13 && $(this).is("textarea") == false) {
                focusable = form.find('input,a,select,.select2-search__field,button,textarea').filter(':visible:not([readonly])');
                next = focusable.eq(focusable.index(this)+1);
                if($(next['0']).attr('id') == 'tunch_textbox'){
                    next = focusable.eq(focusable.index(this)+2);
                }
                if($(next['0']).attr('id') == 'sell_item_charges_details'){
                    next = focusable.eq(focusable.index(this)+3);
                }
                if (next.length) {
                    next.focus();
                } else {
                    form.submit();
                }
                return false;

            } else if (e.ctrlKey) {
                if (e.keyCode == 13) {
                    focusable =   form.find('input,a,select,.select2-search__field,button,textarea').filter(':visible:not([readonly])');
                    prev = focusable.eq(focusable.index(this)+1); 

                    if (prev.length) {
                       prev.focus();
                    } else {
                        form.submit();
                    }
                }
            }
        });

        /**
            * WARNING: untested using Select2's option ['selectOnClose'=>true]
            *
            * This code was written because the Select2 widget does not handle
            * tabbing from one form field to another.  The desired behavior is that
            * the user can use [Enter] to select a value from Select2 and [Tab] to move
            * to the next field on the form.
            *
            * The following code moves focus to the next form field when a Select2 'close'
            * event is triggered.  If the next form field is a Select2 widget, the widget
            * is opened automatically.
            *
            * Users that click elsewhere on the document will cause the active Select2
            * widget to close.  To prevent the code from overriding the user's focus choice
            * a flag is added to each element that the users clicks on.  If the flag is
            * active, then the automatic focus script does not happen.
            *
            * To prevent conflicts with multiple Select2 widgets opening at once, a second
            * flag is used to indicate the open status of a Select2 widget.  It was
            * necessary to use a flag instead of reading the class '--open' because using the
            * class '--open' as an indicator flag caused timing/bubbling issues.
            *
            * To simulate a Shift+Tab event, a flag is recorded every time the shift key
            * is pressed.
            */
        var docBody = $(document.body);
        var shiftPressed = false;
        var clickedOutside = false;
        //var keyPressed = 0;

        docBody.on('keydown', function(e) {
            var keyCaptured = (e.keyCode ? e.keyCode : e.which);
            //shiftPressed = keyCaptured == 16 ? true : false;
            if (keyCaptured == 16) { shiftPressed = true; }
        });
        docBody.on('keyup', function(e) {
            var keyCaptured = (e.keyCode ? e.keyCode : e.which);
            //shiftPressed = keyCaptured == 16 ? true : false;
            if (keyCaptured == 16) { shiftPressed = false; }
        });

        docBody.on('mousedown', function(e){
            // remove other focused references
            clickedOutside = false;
            // record focus
            if ($(e.target).is('[class*="select2"]')!=true) {
                clickedOutside = true;
            }
        });

        docBody.on('select2:opening', function(e) {
            // this element has focus, remove other flags
            clickedOutside = false;
            // flag this Select2 as open
            $(e.target).attr('data-s2open', 1);
        });
        docBody.on('select2:closing', function(e) {
            // remove flag as Select2 is now closed
            $(e.target).removeAttr('data-s2open');
        });

        docBody.on('select2:close', function(e) {
            var elSelect = $(e.target);
            elSelect.removeAttr('data-s2open');
            var currentForm = elSelect.closest('form');
            var othersOpen = currentForm.has('[data-s2open]').length;
            if (othersOpen == 0 && clickedOutside==false) {
                /* Find all inputs on the current form that would normally not be focus`able:
                 *  - includes hidden <select> elements whose parents are visible (Select2)
                 *  - EXCLUDES hidden <input>, hidden <button>, and hidden <textarea> elements
                 *  - EXCLUDES disabled inputs
                 *  - EXCLUDES read-only inputs
                 */
                var inputs = currentForm.find(':input:enabled:not([readonly], input:hidden, button:hidden, textarea:hidden)')
                    .not(function () {   // do not include inputs with hidden parents
                        return $(this).parent().is(':hidden');
                    });
                var elFocus = null;
                $.each(inputs, function (index) {
                    var elInput = $(this);
                    if (elInput.attr('id') == elSelect.attr('id')) {
                        if ( shiftPressed) { // Shift+Tab
                            elFocus = inputs.eq(index - 1);
                            if($(elFocus['0']).attr('id') == 'sell_item_charges_details'){
                                elFocus = inputs.eq(index - 2);
                            }
                            if($(elFocus['0']).attr('id') == 'tunch_textbox'){
                                elFocus = inputs.eq(index - 3);
                            }
                        } else {
                            elFocus = inputs.eq(index + 1);
                            if($(elFocus['0']).attr('id') == 'tunch_textbox'){
                                elFocus = inputs.eq(index + 2);
                            }
                            if($(elFocus['0']).attr('id') == 'sell_item_charges_details'){
                                elFocus = inputs.eq(index + 3);
                            }
                        }
                        
                        return false;
                    }
                });
                if (elFocus !== null) {
                    // automatically move focus to the next field on the form
                    var isSelect2 = elFocus.siblings('.select2').length > 0;
                    if (isSelect2) {
                        elFocus.select2('open');
                    } else {
                        elFocus.focus();
                    }
                }
            }
        });

        /**
         * Capture event where the user entered a Select2 control using the keyboard.
         * http://stackoverflow.com/questions/20989458
         * http://stackoverflow.com/questions/1318076
         */
        docBody.on('focus', '.select2', function(e) {
            var elSelect = $(this).siblings('select');
            var test1 = elSelect.is('[disabled]');
            var test2 = elSelect.is('[data-s2open]');
            var test3 = $(this).has('.select2-selection--single').length;
            if (elSelect.is('[disabled]')==false && elSelect.is('[data-s2open]')==false
                && $(this).has('.select2-selection--single').length>0) {
                elSelect.attr('data-s2open', 1);
                elSelect.select2('open');
            }
        });
    });        
</script>
<?php
}
?>