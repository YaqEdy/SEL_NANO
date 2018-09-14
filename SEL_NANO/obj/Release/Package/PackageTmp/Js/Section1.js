var iTglKehadiran = null;
var iTglMeeting = null;
var iTglNotulen = null;
var iTglVIP = null;
var wndSetUser;
var iHide = false;
var iEditable = true;
var wnd_Upload;
var iStrSesUpload;

$(document).ready(function () {
    $("#Tabs").kendoTabStrip({
        animation: {
            open: {
                duration: 100,
                effects: "expand:vertical"
            }
        }
    });

    $("#txtTglKehadiran").kendoDatePicker({
        format: "dd-MM-yyyy",
    });
    $("#txtTglKehadiran").attr("readonly", true);

    $("#txtTglMeeting").kendoDatePicker({
        format: "dd-MM-yyyy",
    });
    $("#txtTglMeeting").attr("readonly", true);

    $("#txtTglNotulen").kendoDatePicker({
        format: "dd-MM-yyyy",
    });
    $("#txtTglNotulen").attr("readonly", true);

    $("#txtTglVIP").kendoDatePicker({
        format: "dd-MM-yyyy",
    });
    $("#txtTglVIP").attr("readonly", true);

    if ($("#NAMAId").val() == null || $("#NAMAId").val() == "") {
        iHide = true;
        iEditable = false;
        $("#groupChallenge").hide();
        $("#btnSave").hide();
        $("#idUpload").hide();
        $("#idTmpl").hide();

        $("#idBtnDropbox1").hide();
        $("#idBtnDropbox2").hide();

        $("#addAnggota").hide();
        $("#idScore").hide();

        $("#uploadFoto").hide();
    } else {
        $("#groupChallenge").show();
        $("#btnSave").show();
        $("#idUpload").show();
        $("#idTmpl").show();

        $("#idBtnDropbox1").show();
        $("#idBtnDropbox2").show();

        $("#addAnggota").show();
        $("#idScore").show();

        $("#uploadFoto").show();
    }

    Persentase();
    loadgridKehadiran();
    loadgridMeeting();
    loadgridNotulen();
    loadgridVIP();
    loadgridMicroShearing();
    loadgridDetailPIC();
    loadgridScore2();
});

$("#idBtnChoose1").click(function () {
    $(".dropin-btn-status").click();
    alert("s")
});
//$("#inputNRP").kendoDropDownList({
//    optionLabel: "Pilih",
//    dataTextField: "NAMA",
//    dataValueField: "NRP",
//    dataSource: {
//        type: "json",
//        transport: {
//            read: {
//                url: $("#urlPath").val() + "/Home/ReadDD_Employee",
//                contentType: "application/json",
//                type: "POST",
//                cache: false
//            }
//        },
//    },
//    //filter: "contains",
//});
function Persentase() {
    $.ajax({
        url: $("#urlPath").val() + "/Home/ReadPersentaseKehadiran",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        success: function (e) {
            if (e.status == true) {
                var itgl = kendo.toString(kendo.parseDate(e.tgl, 'yyyy-MM-dd'), 'dd-MM-yyyy')
                $("#idPersen").empty();
                $("#idPersen").append("<b style='color: blue;'>Persentase Kehadiran Tanggal " + itgl + " : " + e.persen + "%</b>");
            }
        }
    });
}
function ClickUser() {
    wndSetUser = $("#wndUser").kendoWindow({
        title: "Setting User Account",
        width: "30%",
        height: "8%",
        modal: true,
        visible: false,
        draggable: true,
        actions: ["close"]

    }).data("kendoWindow");

    $("#inputNRP").val("");
    wndSetUser.center().open();
    $("#wndUser").show();
}
function ClickSetUser() {
    $.ajax({
        url: $("#urlPath").val() + "/Home/SetNRP",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify({ sStrNrp: $("#inputNRP").val() }),
        success: function (e) {
            if (e.status == true) {
                wndSetUser.close();
                window.location.reload(true);
            }
        }
    });
}


function ClickViewKehadiran() {
    iTglKehadiran = $("#txtTglKehadiran").data("kendoDatePicker").value();
    loadgridKehadiran();
}
function ClickViewMeeting() {
    iTglMeeting = $("#txtTglMeeting").data("kendoDatePicker").value();
    loadgridMeeting();
}
function ClickViewNotulen() {
    iTglNotulen = $("#txtTglNotulen").data("kendoDatePicker").value();
    loadgridNotulen();
}
function ClickViewVIP() {
    iTglVIP = $("#txtTglVIP").data("kendoDatePicker").value();
    loadgridVIP();
}

function Tanggal(container, options) {
    $('<input data-format="dd-MM-yyyy" data-bind="value:' + options.field + '"/>')
        .appendTo(container)
        .kendoDatePicker({
            format: "dd-MM-yyyy",
            change: function (e) {
                options.model.TGL_ACT = e.sender._value;
            }
        });
}

function DD_Kehadiran(container, options) {
    $('<input required data-bind="value:' + options.field + '"/>')
     .appendTo(container)
        .kendoDropDownList({
            optionLabel: "Pilih",
            dataTextField: "KEHADIRAN_DESC",
            dataValueField: "ID_KEHADIRAN",
            dataSource: {
                type: "json",
                transport: {
                    read: {
                        url: $("#urlPath").val() + "/Home/ReadDD_R_Kehadiran",
                        contentType: "application/json",
                        type: "POST",
                        cache: false
                    }
                },

            },
            //filter: "contains",
            select: function (e) {
                var dataItem = this.dataItem(e.item.index());
                options.model.KEHADIRAN_DESC = dataItem.KEHADIRAN_DESC;
            },
            change: function (e) {
                console.log(e);
                options.model.KEHADIRAN = e.sender._selectedValue;
            }
        });
}

function DD_SHEARING_ACT(container, options) {
    $('<input required data-bind="value:' + options.field + '"/>')
     .appendTo(container)
        .kendoDropDownList({
            optionLabel: "Pilih",
            dataTextField: "NAMA",
            dataValueField: "NRP",
            dataSource: {
                type: "json",
                transport: {
                    read: {
                        url: $("#urlPath").val() + "/Home/ReadDD_Employee",
                        contentType: "application/json",
                        type: "POST",
                        cache: false
                    }
                },

            },
            filter: "contains",
            change: function (e) {
                options.model.SHEARING_ACT = e.sender._selectedValue;
            }
        });
}

function DD_Penulis(container, options) {
    $('<input required data-bind="value:' + options.field + '"/>')
     .appendTo(container)
        .kendoDropDownList({
            optionLabel: "Pilih",
            dataTextField: "NAMA",
            dataValueField: "NRP",
            dataSource: {
                type: "json",
                transport: {
                    read: {
                        url: $("#urlPath").val() + "/Home/ReadDD_Employee",
                        contentType: "application/json",
                        type: "POST",
                        cache: false
                    }
                },

            },
            filter: "contains",
            change: function (e) {
                options.model.PENULIS = e.sender._selectedValue;
            }
        });
}
//function DD_NOTULEN_ACT(container, options) {
//    $('<input required data-bind="value:' + options.field + '"/>')
//     .appendTo(container)
//        .kendoDropDownList({
//            optionLabel: "Pilih",
//            dataTextField: "NAMA",
//            dataValueField: "NRP",
//            dataSource: {
//                type: "json",
//                transport: {
//                    read: {
//                        url: $("#urlPath").val() + "/Home/ReadDD_Employee",
//                        contentType: "application/json",
//                        type: "POST",
//                        cache: false
//                    }
//                },

//            },
//            filter: "contains",
//            change: function (e) {
//                options.model.NOTULEN_ACT = e.sender._selectedValue;
//            }
//        });
//}

function DD_ACTUAL(container, options) {
    $('<input data-bind="value:' + options.field + '"/>')
     .appendTo(container)
        .kendoDropDownList({
            optionLabel: "Pilih",
            dataTextField: "NAMA",
            dataValueField: "NRP",
            dataSource: {
                type: "json",
                transport: {
                    read: {
                        url: $("#urlPath").val() + "/Home/ReadDD_Employee",
                        contentType: "application/json",
                        type: "POST",
                        cache: false
                    }
                },

            },
            filter: "contains",
            change: function (e) {
                options.model.ACTUAL = e.sender._selectedValue;
            }
        });
}

function TA_Uraian(container, options) {
    //$('<textarea required style="width:100%;height:100%" data-bind="value:' + options.field + '"/>')
    $('<textarea required style="width:100%; height:170px;border:0px" data-bind="value:' + options.field + '"/>')
        .appendTo(container);
}

//function Nama_Readonly(container, options) {
//    var input = $("<input name='" + options.field + "' readonly data-bind='value:" + options.field + "' class='k-input k-textbox'/>");
//    input.appendTo(container);
//}

function loadgridKehadiran() {
    var rowNo = 0;
    if ($("#Grid_Kehadiran").data().kendoGrid != null) {
        $('#Grid_Kehadiran').data().kendoGrid.destroy(); // to destory instance
        $('#Grid_Kehadiran').empty(); // to destroy component
    }

    $("#Grid_Kehadiran").kendoGrid({
        //toolbar: [{ template: '<button class="k-button" onclick="ClickExcelExport()"><span class="k-icon k-i-excel"></span>Export to Excel</button>' }],
        //excel: {
        //    fileName: "Kurs Fuel Plan.xlsx"
        //},
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#Grid_Kehadiran").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#Grid_Kehadiran").data('kendoGrid').dataSource.read();
                    $("#Grid_VIP").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadKehadiran",
                    contentType: "application/json",
                    data: { sTgl: iTglKehadiran },
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                update: {
                    url: $("#urlPath").val() + "/Home/UpdateKehadiran",
                    type: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    cache: false
                },
                destroy: {
                    url: $("#urlPath").val() + "/Home/DeleteKehadiran",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    complete: function (e) {
                        $("#Grid_Kehadiran").data('kendoGrid').dataSource.read();
                        if (e.responseJSON.status == true) {
                            alert(e.responseJSON.Remarks);
                        }
                    }
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 7,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "PID_KEHADIRAN",
                    fields: {
                        PID_KEHADIRAN: { type: "string" },
                        TGL_PLAN: { type: "date", filterable: true, editable: false },
                        TGL_ACT: { type: "date", filterable: true, editable: iEditable },
                        NRP: { type: "string", filterable: true, editable: false },
                        NAMA: { type: "string", filterable: true },
                        KEHADIRAN: { type: "string", filterable: true, editable: iEditable },
                        KEHADIRAN_DESC: { type: "string", filterable: true },
                        PERSENTASE: { type: "string", filterable: true, editable: false },
                        KET: { type: "string", filterable: true, editable: iEditable },
                    }
                }
            },
            //group: { field: "TGL_PLAN" },
        },
        //height: 500,
        editable: true,
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 7,
            input: true,
            pageSizes: [7, 700, 7000],
            info: true
        },
        //toolbar: ["create"],
        columns: [
                { title: "No", width: "15px", template: "#= ++rowNo #", filterable: false, editable: false },
                //{ 'template': "<a href='javascript:void(0)' onClick='showQR(\"#= PID_KEHADIRAN # \")'>Show QR</a>", 'title': 'Action', 'width': 25, hidden: iHide }, //  
                { 'field': 'TGL_PLAN', 'title': 'Tgl Plan', 'width': 50, template: "#= kendo.toString(kendo.parseDate(TGL_PLAN, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'TGL_ACT', 'title': 'Tgl Aktual', 'width': 50, editor: Tanggal, template: "#= kendo.toString(kendo.parseDate(TGL_ACT, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'NRP', 'title': 'Nama', 'width': 90, template: "#=NAMA#" },
                { 'field': 'KEHADIRAN', 'title': 'Status', 'width': 80, template: '#=KEHADIRAN_DESC#', editor: DD_Kehadiran },
                { 'field': 'KEHADIRAN_DESC', 'title': 'Status', hidden: true },
                {
                    'field': 'PERSENTASE', 'title': 'Kehadiran (%)', 'width': 80,
                    template: '<div class="progress"><div class="progress-bar progress-bar-striped #=PERSENTASE<=40?"progress-bar-danger":PERSENTASE<=60?"progress-bar-warning":"progress-bar-success"# active" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:#=PERSENTASE#%">#=PERSENTASE#%</div></div>'
                },
                { 'field': 'KET', 'title': 'Keterangan', 'width': 100 },

        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
            //e.sender.hideColumn("CONVERTION_DESC");
            //e.sender.showColumn("CONVERTION_ID");

            //if ($("#NAMAId").val() == null || $("#NAMAId").val() == "") {
            //    var grid = $("#Grid_Kehadiran").data("kendoGrid");
            //    grid.hideColumn(1);
            //    //$("#Grid_Kehadiran .k-grid-toolbar").hide();
            //}
        },
        cancel: function (e) {
            $("#Grid_Kehadiran").data('kendoGrid').dataSource.read();
        }
    });
}

function showQR(e) {
    //alert(e);
    $("#QRcode").empty();
    var qrcode = new QRCode("QRcode");
    qrcode.makeCode(e);

    wnd_QR = $("#wndQR").kendoWindow({
        title: "Scan QR Code",
        //width: "400px",
        //        height: "400px",
        modal: true,
        visible: false,
        draggable: true,
        close: function (e) {
        },
        //actions: ["close"]
    }).data("kendoWindow");
    wnd_QR.open().center();
}

function ClickSaveAll() {
    var grid = $("#Grid_Kehadiran").data("kendoGrid");
    //console.log(grid._data);
    $.ajax({
        url: $("#urlPath").val() + "/Home/UpdateAllKehadiran",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify({ sTBL: grid._data }),
        success: function (e) {
            $("#Grid_Kehadiran").data('kendoGrid').dataSource.read();
            $("#Grid_VIP").data('kendoGrid').dataSource.read();
            alert(e.Remarks);
            Persentase();
        },
    });
}

function loadgridMeeting() {
    var rowNo = 0;
    if ($("#Grid_Meeting").data().kendoGrid != null) {
        $('#Grid_Meeting').data().kendoGrid.destroy(); // to destory instance
        $('#Grid_Meeting').empty(); // to destroy component
    }

    $("#Grid_Meeting").kendoGrid({
        //toolbar: [{ template: '<button class="k-button" onclick="ClickExcelExport()"><span class="k-icon k-i-excel"></span>Export to Excel</button>' }],
        //excel: {
        //    fileName: "Kurs Fuel Plan.xlsx"
        //},
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#Grid_Meeting").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#Grid_Meeting").data('kendoGrid').dataSource.read();
                    $("#Grid_VIP").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);

                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadKegiatanMeeting",
                    contentType: "application/json",
                    data: { sTgl: iTglMeeting },
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                update: {
                    url: $("#urlPath").val() + "/Home/UpdateKegiatanMeeting",
                    type: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    cache: false,
                },
                destroy: {
                    url: $("#urlPath").val() + "/Home/DeleteKegiatanMeeting",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    complete: function (e) {
                        $("#Grid_Meeting").data('kendoGrid').dataSource.read();
                        if (e.responseJSON.status == true) {
                            alert(e.responseJSON.Remarks);
                        }
                    }
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 5,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "PID_K_MEETING",
                    fields: {
                        PID_K_MEETING: { type: "string" },
                        TGL_PLAN: { type: "date", filterable: true, editable: false },
                        SHEARING_PLAN: { type: "string", filterable: true, editable: false },
                        SHEARING_PLAN_NAMA: { type: "string", filterable: true },
                        SHEARING_ACT: { type: "string", filterable: true },
                        SHEARING_ACT_NAMA: { type: "string", filterable: true },
                        TGL_ACT: { type: "string", filterable: true, editable: false },
                        SHEARING_TOPIC: { type: "string", filterable: true, editable: false },
                        NOTULEN_PLAN: { type: "string", filterable: true, editable: false },
                        NOTULEN_PLAN_NAMA: { type: "string", filterable: true },
                        NOTULEN_ACT: { type: "string", filterable: true, editable: false },
                        NOTULEN_ACT_NAMA: { type: "string", filterable: true },
                        KET: { type: "string", filterable: true },
                    }
                }
            },
        },
        //height: 500,
        editable: "inline",
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        //toolbar: ["create"],
        columns: [
                { title: "No", width: "30px", template: "#= ++rowNo #", filterable: false,editable:false },
                { 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 90, hidden: iHide },
                { 'field': 'TGL_PLAN', 'title': 'Tgl Plan', 'width': 80, template: "#= kendo.toString(kendo.parseDate(TGL_PLAN, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'TGL_ACT', 'title': 'Tgl Act', 'width': 94, editor: Tanggal, template: "#= kendo.toString(kendo.parseDate(TGL_ACT, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'SHEARING_PLAN', 'title': 'MC Plan', 'width': 130, template: "#=SHEARING_PLAN_NAMA#" },
                { 'field': 'SHEARING_ACT', 'title': 'MC Aktual', 'width': 130, editor: DD_SHEARING_ACT, template: "#=SHEARING_ACT_NAMA#" },
                //{ 'field': 'SHEARING_TOPIC', 'title': 'Sharing Topic', 'width': 150 },
                { 'field': 'NOTULEN_PLAN', 'title': 'Notulen Plan', 'width': 130, template: "#=NOTULEN_PLAN_NAMA#" },
                { 'field': 'NOTULEN_ACT', 'title': 'Notulen Aktual', 'width': 130, template: "#=NOTULEN_ACT_NAMA#" },// editor: DD_NOTULEN_ACT,
                { 'field': 'KET', 'title': 'Keterangan', 'width': 130 },

        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
        },
        cancel: function (e) {
            $("#Grid_Meeting").data('kendoGrid').dataSource.read();
        },
        edit: function (e) {
            //e.container.find("label[for=TGL_PLAN]").hide();
            //e.container.find("div[data-container-for=TGL_PLAN]").hide();
            //e.container.find("label[for=TGL_ACT]").hide();
            //e.container.find("div[data-container-for=TGL_ACT]").hide();
            //e.container.find("label[for=SHEARING_PLAN]").hide();
            //e.container.find("input[name=SHEARING_PLAN]").hide();
            //e.container.find("label[for=NOTULEN_PLAN]").hide();
            //e.container.find("input[name=NOTULEN_PLAN]").hide();
            //e.container.find("label[for=NOTULEN_ACT]").hide();
            //e.container.find("input[name=NOTULEN_ACT]").hide();
        }
    });
}

function loadgridNotulen() {
    var rowNo = 0;
    if ($("#Grid_Notulen").data().kendoGrid != null) {
        $('#Grid_Notulen').data().kendoGrid.destroy(); // to destory instance
        $('#Grid_Notulen').empty(); // to destroy component
    }

    $("#Grid_Notulen").kendoGrid({
        //toolbar: [{ template: '<button class="k-button" onclick="ClickExcelExport()"><span class="k-icon k-i-excel"></span>Export to Excel</button>' }],
        //excel: {
        //    fileName: "Kurs Fuel Plan.xlsx"
        //},
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#Grid_Notulen").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#Grid_Notulen").data('kendoGrid').dataSource.read();
                    $("#Grid_VIP").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadNotulen",
                    contentType: "application/json",
                    data: { sTgl: iTglNotulen },
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                update: {
                    url: $("#urlPath").val() + "/Home/UpdateNotulen",
                    type: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    cache: false
                },
                destroy: {
                    url: $("#urlPath").val() + "/Home/DeleteNotulen",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    complete: function (e) {
                        $("#Grid_Notulen").data('kendoGrid').dataSource.read();
                        if (e.responseJSON.status == true) {
                            alert(e.responseJSON.Remarks);
                        }
                    }
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 2,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "PID_NOTULEN",
                    fields: {
                        PID_NOTULEN: { type: "string" },
                        TGL_PLAN: { type: "date", filterable: true, editable: false },
                        TGL_ACT: { type: "string", filterable: true },
                        URAIAN: { type: "string", filterable: true },
                        KET: { type: "string", filterable: true },
                    }
                }
            },
        },
        //height: 500,
        editable: "inline",
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        //toolbar: ["create"],
        columns: [
                { title: "No", width: "20px", template: "#= ++rowNo #", filterable: false, editable: false },
                { 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 120, hidden: iHide },
                { 'field': 'TGL_PLAN', 'title': 'Tgl Plan', 'width': 100, template: "#= kendo.toString(kendo.parseDate(TGL_PLAN, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'TGL_ACT', 'title': 'Tgl Aktual', 'width': 100, editor: Tanggal, template: "#= kendo.toString(kendo.parseDate(TGL_ACT, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'URAIAN', 'title': 'Uraian', editor: TA_Uraian, template: "<textarea readonly style='width:100%;height:170px;border:0px'>#=URAIAN#</textarea>" },
                { 'field': 'KET', 'title': 'Keterangan', 'width': 200 },

        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
        },
        cancel: function (e) {
            $("#Grid_Notulen").data('kendoGrid').dataSource.read();
        }
    });
}

function loadgridVIP() {
    var rowNo = 0;
    if ($("#Grid_VIP").data().kendoGrid != null) {
        $('#Grid_VIP').data().kendoGrid.destroy(); // to destory instance
        $('#Grid_VIP').empty(); // to destroy component
    }

    $("#Grid_VIP").kendoGrid({
        //toolbar: [{ template: '<button class="k-button" onclick="ClickExcelExport()"><span class="k-icon k-i-excel"></span>Export to Excel</button>' }],
        //excel: {
        //    fileName: "Kurs Fuel Plan.xlsx"
        //},
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#Grid_VIP").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#Grid_VIP").data('kendoGrid').dataSource.read();
                    $("#Grid_Detail_PIC").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadPelaporVIP",
                    contentType: "application/json",
                    data: { sTgl: iTglVIP },
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                update: {
                    url: $("#urlPath").val() + "/Home/UpdatePelaporVIP",
                    type: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    cache: false
                },
                destroy: {
                    url: $("#urlPath").val() + "/Home/DeletePelaporVIP",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    complete: function (e) {
                        $("#Grid_VIP").data('kendoGrid').dataSource.read();
                        $("#Grid_Detail_PIC").data('kendoGrid').dataSource.read();
                        if (e.responseJSON.status == true) {
                            alert(e.responseJSON.Remarks);
                        }
                    }
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "PID_PELAPOR_VIP",
                    fields: {
                        PID_PELAPOR_VIP: { type: "string" },
                        TANGGAL: { type: "date", filterable: true, editable: false },
                        UTAMA: { type: "string", filterable: true, editable: false },
                        UTAMA_DESC: { type: "string", filterable: true, editable: false },
                        CADANGAN: { type: "string", filterable: true, editable: false },
                        CADANGAN_DESC: { type: "string", filterable: true, editable: false },
                        ACTUAL: { type: "string", filterable: true },
                        ACTUAL_DESC: { type: "string", filterable: true },
                        KET: { type: "string", filterable: true },
                    }
                }
            },
        },
        //height: 500,
        editable: "inline",
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        //toolbar: ["create"],
        detailInit: detailVIP,
        columns: [
                { title: "No", width: "30px", template: "#= ++rowNo #", filterable: false, editable: false },
                { 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 170, hidden: iHide },
                { 'field': 'TANGGAL', 'title': 'Tanggal', 'width': 90, template: "#= kendo.toString(kendo.parseDate(TANGGAL, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'UTAMA', 'title': 'Utama', 'width': 200, template: "#=UTAMA_DESC#" },
                { 'field': 'CADANGAN', 'title': 'Cadangan', 'width': 200, template: "#=CADANGAN_DESC#" },
                { 'field': 'ACTUAL', 'title': 'Aktual', 'width': 200, editor: DD_ACTUAL, template: "#=ACTUAL_DESC#" },
                { 'field': 'KET', 'title': 'Keterangan', 'width': 200 },

        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
            e.sender.expandRow(e.sender.tbody.find("tr.k-master-row").first());
        },
        cancel: function (e) {
            $("#Grid_VIP").data('kendoGrid').dataSource.read();
        }
    });
}

function detailVIP(e) {
    $("<div id='gridProductionGroupDetail' style='margin-left:22px'/>").appendTo(e.detailCell).kendoGrid({
        dataSource: {
            type: "json",
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadDetailVIP",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    complete: function (e) {
                        //if (e.responseJSON.status == false) {
                        //    alert(e.responseJSON.remarks);
                        //}
                    }
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },
            serverPaging: true,
            serverSorting: true,
            serverFiltering: true,
            schema: {

                data: "Data",
                total: "Total",
                model: {
                    id: "PID_PELAPOR_VIP",
                    fields: {
                        PID_PELAPOR_VIP: { type: "string" },
                        KEHADIRAN: { type: "string", filterable: false, editable: false },
                        SHEARING: { type: "string", filterable: false, editable: false },
                        SHEARING_TOPIC: { type: "string", filterable: false, editable: false },
                        URAIAN: { type: "string", filterable: false, editable: false },
                        CHALLANGE: { type: "string", filterable: false, editable: false },
                    }
                }
            },
            pageSize: 10,
            filter: { field: "PID_PELAPOR_VIP", operator: "eq", value: e.data.PID_PELAPOR_VIP }

        },
        editable: false,
        scrollable: false,
        sortable: false,
        pageable: false,
        filterable: false,
        //toolbar: ["create"],
        columns: [
                  //{ 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 170 },
                  {
                      'field': 'KEHADIRAN', 'title': 'Kehadiran(%)', 'width': 40,
                      template: '<div class="progress"><div class="progress-bar progress-bar-striped #=KEHADIRAN<=40?"progress-bar-danger":KEHADIRAN<=60?"progress-bar-warning":"progress-bar-success"# active" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:#=KEHADIRAN#%">#=KEHADIRAN#%</div></div>'
                  },
                  { 'field': 'CHALLANGE', 'title': 'Challenge', 'width': 150, template: "<textarea readonly style='width:100%;height:200px;border:0px'>#=CHALLANGE#</textarea>" },
                  //{ 'field': 'SHEARING', 'title': 'Sharing Name', 'width': 65 },
                  //{ 'field': 'SHEARING_TOPIC', 'title': 'Sharing Topic', 'width': 90 },
                  { 'field': 'URAIAN', 'title': 'Notulen', 'width': 150, template: "<textarea readonly style='width:100%;height:200px;border:0px'>#=URAIAN#</textarea>" },
        ]
    });
}

function loadgridMicroShearing() {
    var rowNo = 0;
    if ($("#Grid_MicroShearing").data().kendoGrid != null) {
        $('#Grid_MicroShearing').data().kendoGrid.destroy(); // to destory instance
        $('#Grid_MicroShearing').empty(); // to destroy component
    }

    $("#Grid_MicroShearing").kendoGrid({
        //toolbar: [{ template: '<button class="k-button" onclick="ClickExcelExport()"><span class="k-icon k-i-excel"></span>Export to Excel</button>' }],
        //excel: {
        //    fileName: "Kurs Fuel Plan.xlsx"
        //},
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#Grid_MicroShearing").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#Grid_MicroShearing").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadMicroShearing",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                create: {
                    url: $("#urlPath").val() + "/Home/InsertMicroShearing",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                },
                update: {
                    url: $("#urlPath").val() + "/Home/UpdateMicroShearing",
                    type: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    cache: false
                },
                destroy: {
                    url: $("#urlPath").val() + "/Home/DeleteMicroShearing",
                    contentType: "application/json",
                    type: "POST",
                    cache: false,
                    complete: function (e) {
                        $("#Grid_MicroShearing").data('kendoGrid').dataSource.read();
                        if (e.responseJSON.status == true) {
                            alert(e.responseJSON.Remarks);
                        }
                    }
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "PID_MICRO_SHEARING",
                    fields: {
                        PID_MICRO_SHEARING: { type: "string" },
                        TANGGAL: { type: "date", filterable: true },
                        PENULIS: { type: "string", filterable: true },
                        NAMA: { type: "string", filterable: true },
                        TEMA: { type: "string", filterable: true },
                        ISI: { type: "string", filterable: true },
                    }
                }
            },
        },
        //height: 500,
        editable: "inline",
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        toolbar: ["create"],
        columns: [
                { title: "No", width: "20px", template: "#= ++rowNo #", filterable: false, editable: false },
                { 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 60, hidden: iHide },
                { 'field': 'TANGGAL', 'title': 'Tanggal', 'width': 50, template: "#= kendo.toString(kendo.parseDate(TANGGAL, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'PENULIS', 'title': 'Penulis', 'width': 100, template: "#=NAMA#", editor: DD_Penulis },
                { 'field': 'TEMA', 'title': 'Tema', 'width': 200 },
                //{ 'field': 'ISI', 'title': 'Isi', 'width': 200, template: "#if(TEMA.substring(0,5)=='Video'){#<video width='400' controls><source src='#=ISI#' type='video/mp4'></video>#}else if(TEMA.substring(0,4)=='Foto'){#<img src='#=ISI#' alt='' width='auto' height='200'>#}else{#<textarea readonly style='width:100%;height:170px;border:0px'>#=ISI#</textarea>#}#" },

        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
            if ($("#NAMAId").val() == null || $("#NAMAId").val() == "") {
                $("#Grid_MicroShearing .k-grid-toolbar").hide();
            }
        },
        cancel: function (e) {
            $("#Grid_MicroShearing").data('kendoGrid').dataSource.read();
        }
    });
}

function loadgridDetailPIC() {
    var rowNo = 0;
    if ($("#Grid_Detail_PIC").data().kendoGrid != null) {
        $('#Grid_Detail_PIC').data().kendoGrid.destroy(); // to destory instance
        $('#Grid_Detail_PIC').empty(); // to destroy component
    }

    $("#Grid_Detail_PIC").kendoGrid({
        //toolbar: [{ template: '<button class="k-button" onclick="ClickExcelExport()"><span class="k-icon k-i-excel"></span>Export to Excel</button>' }],
        //excel: {
        //    fileName: "Kurs Fuel Plan.xlsx"
        //},
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#Grid_Detail_PIC").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#Grid_Detail_PIC").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadDetailPIC",
                    contentType: "application/json",
                    data: { sTgl: iTglKehadiran },
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "NRP",
                    fields: {
                        NRP: { type: "string", filterable: true },
                        NAMA: { type: "string", filterable: true },
                        JML_SH_ACT: { type: "string", filterable: true },
                        JML_NOT_ACT: { type: "string", filterable: true },
                        JML_VIP_ACT: { type: "string", filterable: true },
                        JML_MCRO_SH: { type: "string", filterable: true },
                        JML_CHALLENGE: { type: "string", filterable: true },
                    }
                }
            },
        },
        //height: 500,
        editable: false,
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        //toolbar: ["create"],
        columns: [
                { title: "No", width: "15px", template: "#= ++rowNo #", filterable: false, editable: false },
                //{ 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 60, hidden: iHide }, //  
                { 'field': 'NRP', 'title': 'Nama', 'width': 90, template: "#=NAMA#" },
                { 'field': 'JML_SH_ACT', 'title': 'MC', 'width': 80 },
                { 'field': 'JML_NOT_ACT', 'title': 'Notulen', 'width': 80 },
                { 'field': 'JML_VIP_ACT', 'title': 'Pelapor VIP', 'width': 80 },
                { 'field': 'JML_MCRO_SH', 'title': 'Micro Sharing', 'width': 80 },
                { 'field': 'JML_CHALLENGE', 'title': 'Challenge', 'width': 80 },
        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
        },
        cancel: function (e) {
            $("#Grid_Detail_PIC").data('kendoGrid').dataSource.read();
        }
    });
}


function loadgridScore2() {
    var rowNo = 0;
    if ($("#grid_Score2").data().kendoGrid != null) {
        $('#grid_Score2').data().kendoGrid.destroy(); // to destory instance
        $('#grid_Score2').empty(); // to destroy component
    }

    $("#grid_Score2").kendoGrid({
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#grid_Score2").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#grid_Score2").data('kendoGrid').dataSource.read();
                    alert(e.response.Remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadScore",
                    contentType: "application/json",
                    //data: { sPid: sPid },
                    type: "POST",
                    cache: false,
                    //success: function (e) {
                    //    alert(e);
                    //}
                },
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 7,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {
                data: "Data",
                total: "Total",
                model: {
                    id: "PID_SCORE",
                    fields: {
                        PID_SCORE: { type: "string" },
                        PID_T_CH: { type: "string", filterable: true ,editable:false},
                        SCORE: { type: "string", filterable: true},
                        SCORE_DESC: { type: "string", filterable: true },
                        NRP: { type: "string", filterable: true, editable: false },
                        //CREATE_SCORE: { type: "string", filterable: true, editable: false },
                        NAMA: { type: "string", filterable: true, editable: false },
                        CHALLENGE: { type: "string", filterable: true, editable: false },
                    }
                }
            },
        },
        //height: 500,
        editable: true,
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        //toolbar: ["create"],
        columns: [
                { title: "No", width: "30px", template: "#= ++rowNo #", filterable: false, editable: false },
                //{ 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 90, hidden: iHide },
                //{ 'field': 'NRP', 'title': 'Create Score', 'width': 110, template: "#=CREATE_SCORE#" },
                { 'field': 'NAMA', 'title': 'Nama', 'width': 110 },
                { 'field': 'CHALLENGE', 'title': 'Challenge', 'width': 180 },
                { 'field': 'SCORE', 'title': 'Score', 'width': 100, editor: DD_SCORE, template: "#=SCORE_DESC#", attributes: { "style": "background-color: yellow;border-bottom: 1px solid gray;" } },

        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
        },
        cancel: function (e) {
            $("#grid_Score2").data('kendoGrid').dataSource.read();
        }
    });
}


function clickUpload() {
    $("#file_UploadMicroShearing").click();
}

$("#file_UploadMicroShearing").kendoUpload({
    multiple: true,
    async: {
        saveUrl: "save",
        removeUrl: "remove",
        autoUpload: false
    },
    validation: {
        allowedExtensions: [".csv"]
    },
    ShowFileList: false,
    select: function (e) {
        wnd_Upload = $("#wndUpload").kendoWindow({
            title: "Upload Micro Sharing",
            width: "100%",
            height: "80%",
            modal: true,
            visible: false,
            draggable: true,
            close: function (e) {
                //Remove select files (success)
                $(".k-widget.k-upload").find("ul").remove();
                $("#gridUploadMicroShearing").hide();
            },
            //actions: ["close"]
        }).data("kendoWindow");
        wnd_Upload.open().center();
        $("#btn_Save").hide();
    },
    upload: function (e) {
        var files = e.files;
        $.each(files, function () {
            $("#file_UploadMicroShearing").data("kendoUpload").options.async.saveUrl = $("#urlPath").val() + '/Home/UploadCSVMicroShearing';
        });
    },
    success: function (e) {
        alert(e.response.remarks);
        iStrSesUpload = e.response.iStrSesUpload;
    },
    complete: function (e) {
        loadgridUploadMicroShearing();
        $("#gridUploadMicroShearing").show();
        $("#btn_Save").show();
    }

});


function loadgridUploadMicroShearing() {
    var rowNo = 0;
    if ($("#gridUploadMicroShearing").data().kendoGrid != null) {
        $('#gridUploadMicroShearing').data().kendoGrid.destroy(); // to destory instance
        $('#gridUploadMicroShearing').empty(); // to destroy component
    }

    $("#gridUploadMicroShearing").kendoGrid({
        dataSource: {
            type: "json",
            error: function (e) {
                if (e.errors == true) {
                    var grid_error = $("#gridUploadMicroShearing").data('kendoGrid');
                    grid_error.one("dataBinding", function (e) {
                        e.preventDefault();
                    });
                }
            }
            , requestEnd: function (e) {
                if (e.type == "destroy" && e.response.status == false) {
                    this.cancelChanges();
                }
                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
                    $("#gridUploadMicroShearing").data('kendoGrid').dataSource.read();
                    alert(e.response.remarks);
                }
            },
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadUploadMicroShearing",
                    contentType: "application/json",
                    data: { sStrSesUpload: iStrSesUpload },
                    type: "POST",
                    cache: false,
                    //complete: function (e) {
                    //    iStrSesUpload(iSesionPeserta);
                    //}
                },
                //create: {
                //    url: $("#urlPath").val() + "/ConvertionDistance/CreateUploadConvertionDistance",
                //    contentType: "application/json",
                //    data: { sSesionUpload: iStrSesUpload },
                //    type: "POST",
                //    cache: false,
                //},
                //update: {
                //    url: $("#urlPath").val() + "/ConvertionDistance/UpdateUploadConvertionDistance",
                //    type: "POST",
                //    contentType: "application/json",
                //    cache: false,
                //},
                //destroy: {
                //    url: $("#urlPath").val() + "/ConvertionDistance/DeleteUploadConvertionDistance",
                //    contentType: "application/json",
                //    type: "POST",
                //    cache: false,
                //},
                parameterMap: function (data, operation) {
                    return kendo.stringify(data);
                }
            },

            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true,
            schema: {

                data: "Data",
                total: "Total",
                model: {
                    id: "PID_MICRO_SHEARING",
                    fields: {
                        PID_MICRO_SHEARING: { type: "string" },
                        TANGGAL: { type: "string", filterable: true },
                        PENULIS: { type: "string", filterable: true },
                        NAMA: { type: "string", filterable: true },
                        TEMA: { type: "string", filterable: true },
                        ISI: { type: "string", filterable: true },
                        REMARKS: { TYPE: "string", filterable: true, editable: false }
                    }
                }
            },
        },
        //height: 500,
        editable: false,
        resizable: true,
        sortable: true,
        filterable: true,
        groupable: false,
        pageable: {
            refresh: true,
            buttonCount: 10,
            input: true,
            pageSizes: [10, 100, 1000],
            info: true
        },
        //toolbar: ["create"],
        columns: [
                 { title: "No", width: "20px", template: "#= ++rowNo #", filterable: false, editable: false },
                //{ 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 120, hidden: iHide },
                { 'field': 'TANGGAL', 'title': 'Tanggal', 'width': 100 },// template: "#= kendo.toString(kendo.parseDate(TANGGAL, 'yyyy-MM-dd'), 'dd-MM-yyyy')=null ?TANGGAL:kendo.toString(kendo.parseDate(TANGGAL, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
                { 'field': 'PENULIS', 'title': 'Penulis', 'width': 100 },
                { 'field': 'TEMA', 'title': 'Tema', 'width': 150 },
                //{ 'field': 'ISI', 'title': 'Isi', 'width': 200 },
                { 'field': 'REMARKS', 'title': 'Remarks', 'width': 180 },
        ],

        dataBinding: function () {
            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
        },
        dataBound: function (e) {
            if ($("#GpId").val() == 2 || $("#GpId").val() == 4) {
                var grid = $("#gridUploadMicroShearing").data("kendoGrid");
                grid.hideColumn(1);
                $("#gridUploadMicroShearing .k-grid-toolbar").hide();
            }
        },
        cancel: function (e) {
            $("#gridUploadMicroShearing").data('kendoGrid').dataSource.read();
        }
    });
}

function btn_TemplateMicroShearing() {
    var path_download = $("#urlPath").val() + "/UploadFile/Template/NANO.csv";
    window.open(path_download, '_blank');
}
function clickSave() {
    $.ajax({
        url: $("#urlPath").val() + "/Home/saveUploadMicroShearing",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify({ sStrSession: iStrSesUpload }),
        success: function (e) {
            alert(e.remarks);
            if (e.status == true) {
                //Remove select files (success)
                $(".k-widget.k-upload").find("ul").remove();
                $("#Grid_MicroShearing").data('kendoGrid').dataSource.read();
                //$("#gridUploadKursFuelActual").data('kendoGrid').dataSource.read();

                wnd_Upload.close();
            }
        },
        complete: function (e) {
        }
    });
}