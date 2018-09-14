var iItemFoto;
var wnd_Foto;
var iDescFoto;
$(document).ready(function () {
    $("#file_UploadFoto").kendoUpload({
        async: {
            saveUrl: "save",
            removeUrl: "remove",
            autoUpload: true
        },
        validation: {
            allowedExtensions: [".jpg", ".jpeg", ".png", ".bmp", ".gif"]
        },
        upload: function (e) {
            iDescFoto = $("#foto_desc").val();
            var files = e.files;
            $.each(files, function () {
                $("#file_UploadFoto").data("kendoUpload").options.async.saveUrl = $("#urlPath").val() + '/Home/uploadFoto?sDescFoto=' + iDescFoto;
            });
        },
        success: onSuccess,
        complete: function () {
            $("#foto_desc").val("");
        },
        showFileList: false,
        dropZone: ".dropZoneElement"
    });

    function onSuccess(e) {
        console.log(e.response.remarks);
        if (e.operation == "upload") {
            for (var i = 0; i < e.files.length; i++) {
                var file = e.files[i].rawFile;

                if (file) {
                    var reader = new FileReader();
                    reader.onloadend = function () {
                        $("<div class='product'><img name='" + this.result + "' onclick='clickImage(name,0)' src=" + this.result + " /><div>" + iDescFoto + "</div></div>").appendTo($("#GaleryFoto"));
                    };

                    reader.readAsDataURL(file);
                }
            }
        }
    }

    readGalery();
});
function clickImage_(u) {
    alert(u);
}
function readGalery() {
    //console.log($("#" + e + "").val());
    $.ajax({
        url: $("#urlPath").val() + "/Home/ReadGaleryFoto",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        success: function (e) {
            console.log(e);
            iItemFoto = e;
            //iItemFoto = [{ name: "NANO_10012018_13.38.21.753.jpg", desc: "yaaaa" }];
            showGalery();
        },
    });
}

function showGalery() {
    var iTemplate = kendo.template($("#tmplGalery").html());
    $("#GaleryFoto").html(kendo.render(iTemplate, iItemFoto));
}

function clickImage(iFILE_PATH, iFILE_DESC) {
    if (iFILE_DESC == 0) {
        iFILE_DESC = iDescFoto
    }
    //alert(iFILE_PATH, iFILE_DESC);
    $("#isiFoto").html('<img src="' + iFILE_PATH + '" style="width:100%;height:auto;"/>')
    $("#isiFotoDesc").html('<div>' + iFILE_DESC + '</div>')
    wnd_Foto = $("#wndFoto").kendoWindow({
        title: "Galery Nano Sel",
        width: "700px",
        //        height: "400px",
        modal: true,
        visible: false,
        draggable: true,
        close: function (e) {
            ////Remove select files (success)
            //$(".k-widget.k-upload").find("ul").remove();
            //$("#gridUploadMicroShearing").hide();
        },
        //actions: ["close"]
    }).data("kendoWindow");
    wnd_Foto.open().center();
}


//function Click_Img() {
//    $("#file_UploadFoto").click();
//}

//$("#file_UploadFoto").kendoUpload({
//    multiple: true,
//    async: {
//        saveUrl: "save",
//        removeUrl: "remove",
//        autoUpload: true
//    },
//    validation: {
//        allowedExtensions: [".jpg", ".jpeg", ".png", ".bmp", ".gif"]
//    },
//    ShowFileList: false,
//    upload: function (e) {
//        var files = e.files;
//        $.each(files, function () {
//            $("#file_UploadFoto").data("kendoUpload").options.async.saveUrl = $("#urlPath").val() + '/AboutPersons/uploadFoto';
//        });
//    },
//    success: function (e) {
//        //alert(e.response.remarks);
//    },
//    complete: function (e) {
//        window.location.reload(true);
//        //loadgridUploadMicroShearing();
//        //$("#gridUploadMicroShearing").show();
//        //$("#btn_Save").show();
//    }

//});

//$("#idAddAnggota").click(function () {
//    loadgridAddAnggota();
//    wnd_addAnggota = $("#wndaddAnggota").kendoWindow({
//        title: "Anggota Nano",
//        width: "80%",
//        height: "62%",
//        modal: true,
//        visible: false,
//        draggable: true,
//        close: function (e) {
//            //Remove select files (success)
//            $(".k-widget.k-upload").find("ul").remove();
//        },
//        //actions: ["close"]
//    }).data("kendoWindow");
//    wnd_addAnggota.open().center();
//    $("#wndaddAnggota").show();
//});


//function loadgridAddAnggota() {
//    var rowNo = 0;
//    if ($("#gridAddAnggota").data().kendoGrid != null) {
//        $('#gridAddAnggota').data().kendoGrid.destroy(); // to destory instance
//        $('#gridAddAnggota').empty(); // to destroy component
//    }

//    $("#gridAddAnggota").kendoGrid({
//        dataSource: {
//            type: "json",
//            error: function (e) {
//                if (e.errors == true) {
//                    var grid_error = $("#gridAddAnggota").data('kendoGrid');
//                    grid_error.one("dataBinding", function (e) {
//                        e.preventDefault();
//                    });
//                }
//            }
//            , requestEnd: function (e) {
//                if (e.type == "destroy" && e.response.status == false) {
//                    this.cancelChanges();
//                }
//                if ((e.type == "create" || e.type == "update") && e.response.status == true) {
//                    $("#gridAddAnggota").data('kendoGrid').dataSource.read();
//                    alert(e.response.Remarks);
//                }
//            },
//            transport: {
//                read: {
//                    url: $("#urlPath").val() + "/Home/ReadEmployee",
//                    contentType: "application/json",
//                    data: { sTgl: iTglKehadiran },
//                    type: "POST",
//                    cache: false,
//                    //success: function (e) {
//                    //    alert(e);
//                    //}
//                },
//                create: {
//                    url: $("#urlPath").val() + "/Home/InsertEmployee",
//                    contentType: "application/json",
//                    type: "POST",
//                    cache: false,
//                },
//                update: {
//                    url: $("#urlPath").val() + "/Home/UpdateEmployee",
//                    type: "POST",
//                    contentType: "application/json",
//                    dataType: "json",
//                    cache: false
//                },
//                destroy: {
//                    url: $("#urlPath").val() + "/Home/DeleteEmployee",
//                    contentType: "application/json",
//                    type: "POST",
//                    cache: false,
//                    complete: function (e) {
//                        $("#gridAddAnggota").data('kendoGrid').dataSource.read();
//                        if (e.responseJSON.status == true) {
//                            alert(e.responseJSON.Remarks);
//                        }
//                    }
//                },
//                parameterMap: function (data, operation) {
//                    return kendo.stringify(data);
//                }
//            },

//            pageSize: 10,
//            serverPaging: true,
//            serverFiltering: true,
//            serverSorting: true,
//            schema: {
//                data: "Data",
//                total: "Total",
//                model: {
//                    id: "PID_EMPLOYEE",
//                    fields: {
//                        PID_EMPLOYEE: { type: "string" },
//                        NRP: { type: "string", filterable: true, editable: iEditable },
//                        NAMA: { type: "string", filterable: true, editable: iEditable },
//                        COMP_USER: { type: "string", filterable: true, editable: iEditable },
//                        TGL_JOIN: { type: "date", filterable: true, editable: iEditable },
//                        STATUS: { type: "boolean", filterable: true, editable: iEditable },
//                        JABATAN: { type: "string", filterable: true, editable: iEditable },
//                        SORT: { type: "string", filterable: true, editable: iEditable },
//                        KET: { type: "string", filterable: true, editable: iEditable },
//                    }
//                }
//            },
//            //group: { field: "TGL_PLAN" },
//        },
//        height: 600,
//        editable: "inline",
//        resizable: true,
//        sortable: true,
//        filterable: true,
//        groupable: false,
//        pageable: {
//            refresh: true,
//            buttonCount: 7,
//            input: true,
//            pageSizes: [7, 700, 7000],
//            info: true
//        },
//        toolbar: ["create"],
//        columns: [
//                { title: "No", width: "20px", template: "#= ++rowNo #", filterable: false, editable: false },
//                { 'command': ["edit"], 'title': 'Action for Actual', 'width': 100, hidden: iHide },
//                //{ 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 100, hidden: iHide },
//                { 'field': 'NRP', 'title': 'Nrp', 'width': 90},
//                { 'field': 'NAMA', 'title': 'Nama', 'width': 170},
//                { 'field': 'COMP_USER', 'title': 'Login User', 'width': 90 },
//                { 'field': 'STATUS', 'title': 'Status', 'width': 80, template: '#=STATUS?"Aktif":"Tidak Aktif"#', editor: DD_Status },
//                { 'field': 'TGL_JOIN', 'title': 'Tgl Join', 'width': 90, template: "#= kendo.toString(kendo.parseDate(TGL_JOIN, 'yyyy-MM-dd'), 'dd-MM-yyyy') #" },
//                { 'field': 'JABATAN', 'title': 'Jabatan', 'width': 100 },
//                { 'field': 'SORT', 'title': 'Urutan', 'width': 100 },
//                { 'field': 'KET', 'title': 'Keterangan', 'width': 100 },

//        ],

//        dataBinding: function () {
//            window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
//        },
//        dataBound: function (e) {
//        },
//        cancel: function (e) {
//            $("#gridAddAnggota").data('kendoGrid').dataSource.read();
//        }
//    });
//}

//function DD_Status(container, options) {
//    $('<input required data-bind="value:' + options.field + '"/>')
//        .appendTo(container)
//        .kendoDropDownList({
//            optionLabel: "Pilih",
//            dataTextField: "text",
//            dataValueField: "value",
//            dataSource: [
//                          { text: "Aktif", value: "true" },
//                          { text: "Tidak Aktif", value: "false" }
//            ],
//            change: function (e) {
//                //console.log(e);
//            },
//            autoBind: false,
//            index: 0
//        });
//}