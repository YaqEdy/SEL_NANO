var pNRP = null;
var pNAMA = null;
var pPID_CH = null;
var pCHALLENGE = null;
var wnd_score;
var pPID_T_CH;
var pPID_SCORE;

$(document).ready(function () {
    $("#btnSubmit").hide();
});

//function clickChooseme() {
//    $.ajax({
//        url: $("#urlPath").val() + "/Home/ReadclickChooseme",
//        dataType: "json",
//        contentType: "application/json",
//        type: "POST",
//        success: function (e) {
//            pNRP = e.nrp;
//            pNAMA = e.choose;
//            $("#idChooseme").empty();
//            $("#idChooseme").append("<b>" + e.choose + "</b>");
//            if (pPID_CH != null) {
//                $("#btnSubmit").show();
//            }
//        }
//    });
//}

function clickChallenge() {

    $.ajax({
        url: $("#urlPath").val() + "/Home/ReadclickChallenge",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        success: function (e) {
            pPID_CH = e.pid_ch;
            pCHALLENGE = e.challenge;
            pNRP = e.nrp;
            pNAMA = e.choose;

            if (e.status == true) {
                $("#idChallenge").empty();
                $("#idChallenge").append("<b>" + e.challenge + "</b>");

                $("#idChooseme").empty();
                $("#idChooseme").append("<b>" + e.choose + "</b>");

                $("#btnSubmit").show();
                document.getElementById("btnChallenge").disabled = true;
            } else {
                $("#btnSubmit").hide();
            }
        }
    });
}

function clickSubmit() {
    //loadScore();

    var icls = {
        NRP: pNRP,
        NAMA: pNAMA,
        PID_CH: pPID_CH,
        CHALLENGE: pCHALLENGE
    }

    $.ajax({
        url: $("#urlPath").val() + "/Home/SaveChallenge",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify({ sDATA: icls }),
        success: function (e) {
            alert(e.iRemarks);
            if (e.status == true) {
                $("#Grid_VIP").data('kendoGrid').dataSource.read();
                $("#Grid_Detail_PIC").data('kendoGrid').dataSource.read();
                $("#grid_Score2").data('kendoGrid').dataSource.read();

                document.getElementById("btnSaveScore").disabled = true;

                wnd_score = $("#wndScore").kendoWindow({
                    title: "Scoring Challenge",
                    width: "30%",
                    height: "30%",
                    modal: true,
                    visible: false,
                    draggable: true,
                    close: function (e) {
                        if ($("#ScoreDropdownlist").val() != 1 || $("#ScoreDropdownlist").val() != 2 || $("#ScoreDropdownlist").val() != 3) {
                            document.getElementById("btnChallenge").disabled = false;
                            clickReset();
                        }
                        //Remove select files (success)
                        //$(".k-widget.k-upload").find("ul").remove();
                        //$("#gridUploadMicroShearing").hide();
                    },
                    actions: ["close"]
                }).data("kendoWindow");
                //$("#wndScore").show();
                pPID_T_CH = e.iPID_T_CH;
                pPID_SCORE = e.iPID_SCORE;
                loadScore();
                wnd_score.open().center();
            }
        },
        complete: function (e) {
        }
    });


}

function clickReset() {
    $("#idChooseme").empty();
    $("#idChallenge").empty();
    $("#btnSubmit").hide();
    //$("#wndScore").hide();

    pNRP = null;
    pNAMA = null;
    pPID_CH = null;
    pCHALLENGE = null;
}


function loadScore() {

    $("#ScoreDropdownlist").kendoDropDownList({
        optionLabel: "Pilih",
        dataTextField: "SCORE_DESC",
        dataValueField: "ID_SCORE",
        dataSource: {
            type: "json",
            transport: {
                read: {
                    url: $("#urlPath").val() + "/Home/ReadDD_R_Score",
                    contentType: "application/json",
                    type: "POST",
                    cache: false
                }
            },

        },
        change: function (e) {
            document.getElementById("btnSaveScore").disabled = false;
            //console.log(e);
            //options.model.SCORE = e.sender._selectedValue;

        }
    });
}

function clickSaveScore(s) {
    var iScore = $("#ScoreDropdownlist").val();
    //console.log(iScore);
    var iClsData = {
        PID_SCORE: pPID_SCORE,
        PID_T_CH: pPID_T_CH,
        SCORE: iScore
    }
    console.log(iClsData);
    $.ajax({
        url: $("#urlPath").val() + "/Home/CreateScore",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        //data: sTBL=iClsData,
        data: JSON.stringify({ sTBL: iClsData }),
        success: function (e) {
            alert(e.Remarks);
            clickReset();
            wnd_score.close().center();
        },
    });
}

//function clickClose() {
//    wnd_score.close().center();
//}




//function clickSubmit() {
//    loadgridScore('');

//    var icls = {
//        NRP: pNRP,
//        NAMA: pNAMA,
//        PID_CH: pPID_CH,
//        CHALLENGE: pCHALLENGE
//    }

//    $.ajax({
//        //url: $("#urlPath").val() + "/Home/SaveChallenge",
//        dataType: "json",
//        contentType: "application/json",
//        type: "POST",
//        data: JSON.stringify({ sDATA: icls }),
//        success: function (e) {
//            alert(e.iRemarks);
//            if (e.status == true) {
//                $("#Grid_VIP").data('kendoGrid').dataSource.read();
//                $("#Grid_Detail_PIC").data('kendoGrid').dataSource.read();

//    wnd_score = $("#wndScore").kendoWindow({
//        title: "Scoring Challenge",
//        width: "50%",
//        height: "40%",
//        modal: true,
//        visible: false,
//        draggable: true,
//        close: function (e) {
//            //Remove select files (success)
//            $(".k-widget.k-upload").find("ul").remove();
//            $("#gridUploadMicroShearing").hide();
//        },
//        actions: ["close"]
//    }).data("kendoWindow");
//                //$("#wndScore").show();
//                loadgridScore(e.iPID_T_CH);
//    wnd_score.open().center();
//            }
//        },
//        complete: function (e) {
//        }
//    });


//}


//function loadgridScore(sPid) {  
//var rowNo = 0;
//if ($("#grid_Score").data().kendoGrid != null) {
//    $('#grid_Score').data().kendoGrid.destroy(); // to destory instance
//    $('#grid_Score').empty(); // to destroy component
//}
//var gridSore = {
//    dataSource: {
//        type: "json",
//        error: function (e) {
//            if (e.errors == true) {
//                var grid_error = $("#grid_Score").data('kendoGrid');
//                grid_error.one("dataBinding", function (e) {
//                    e.preventDefault();
//                });
//            }
//        }
//        , requestEnd: function (e) {
//            if (e.type == "destroy" && e.response.status == false) {
//                this.cancelChanges();
//            }
//            if ((e.type == "create" || e.type == "update") && e.response.status == true) {
//                $("#grid_Score").data('kendoGrid').dataSource.read();
//                alert(e.response.Remarks);
//            }
//        },
//        transport: {
//            read: {
//                url: $("#urlPath").val() + "/Home/ReadScore",
//                contentType: "application/json",
//                data: { sPid: sPid },
//                type: "POST",
//                cache: false,
//                //success: function (e) {
//                //    alert(e);
//                //}
//            },
//            parameterMap: function (data, operation) {
//                return kendo.stringify(data);
//            }
//        },

//        pageSize: 6,
//        serverPaging: true,
//        serverFiltering: true,
//        serverSorting: true,
//        schema: {
//            data: "Data",
//            total: "Total",
//            model: {
//                id: "PID_SCORE",
//                fields: {
//                    PID_SCORE: { type: "string" },
//                    PID_T_CH: { type: "string", filterable: true },
//                    SCORE: { type: "string", filterable: true },
//                    SCORE_DESC: { type: "string", filterable: true },
//                    NRP: { type: "string", filterable: true },
//                    CREATE_SCORE: { type: "string", filterable: true },
//                }
//            }
//        },
//    },
//    //height: 500,
//    editable: true,
//    resizable: true,
//    sortable: true,
//    filterable: true,
//    groupable: false,
//    pageable: {
//        refresh: true,
//        buttonCount: 10,
//        input: true,
//        pageSizes: [10, 100, 1000],
//        info: true
//    },
//    //toolbar: ["create"],
//    columns: [
//            { title: "No", width: "30px", template: "#= ++rowNo #", filterable: false, editable: false },
//            //{ 'command': ["edit", "destroy"], 'title': 'Action for Actual', 'width': 90, hidden: iHide },
//            { 'field': 'NRP', 'title': 'Create Score', 'width': 110, template: "#=CREATE_SCORE#" },
//            { 'field': 'SCORE', 'title': 'Score', 'width': 100, editor: DD_SCORE, template: "#=SCORE_DESC#" },

//    ],

//    dataBinding: function () {
//        window.rowNo = (this.dataSource.page() - 1) * this.dataSource.pageSize();
//    },
//    dataBound: function (e) {
//    },
//    cancel: function (e) {
//        $("#grid_Score").data('kendoGrid').dataSource.read();
//    }
//};

//$("#grid_Score").kendoGrid(gridSore);
//}

function DD_SCORE(container, options) {
    $('<input data-bind="value:' + options.field + '"/>')
     .appendTo(container)
        .kendoDropDownList({
            optionLabel: "Pilih",
            dataTextField: "SCORE_DESC",
            dataValueField: "ID_SCORE",
            dataSource: {
                type: "json",
                transport: {
                    read: {
                        url: $("#urlPath").val() + "/Home/ReadDD_R_Score",
                        contentType: "application/json",
                        type: "POST",
                        cache: false
                    }
                },

            },
            //filter: "contains",
            select: function (e) {
                var dataItem = this.dataItem(e.item.index());
                options.model.SCORE_DESC = dataItem.SCORE_DESC;
            },
            change: function (e) {
                console.log(e);
                options.model.SCORE = e.sender._selectedValue;
            }
        });
}

function clickSaveScore2() {
    var grid = $("#grid_Score2").data("kendoGrid");
    //console.log(grid._data);
    $.ajax({
        url: $("#urlPath").val() + "/Home/UpdateAllScore",
        dataType: "json",
        contentType: "application/json",
        type: "POST",
        data: JSON.stringify({ sTBL: grid._data }),
        success: function (e) {
            $("#grid_Score").data('kendoGrid').dataSource.read();
            alert(e.Remarks);
        },
    });
}
