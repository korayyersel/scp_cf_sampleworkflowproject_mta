sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/m/MessageToast"
], function (Controller, MessageToast) {
	"use strict";

	return Controller.extend("com.qperior.workflowsample.ui.controller.WorkflowStartView", {
		onInit: function () {

		},
		onPressStartWorkflow: function (evt) {
			var contextData = this.getView().getModel("formData").getData();
			var workflowDefinitionId = "samplewf";
			$.ajax({
				url: "/comqperiorworkflowsampleui/bpmworkflowruntime/v1/xsrf-token",
				method: "GET",
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function (result, xhr, data) {
					var token = data.getResponseHeader("X-CSRF-Token");
					if (token === null) return;
					
					$.ajax({
						url: "/comqperiorworkflowsampleui/bpmworkflowruntime/v1/workflow-instances",
						type: "POST",
						data: JSON.stringify({
							definitionId: workflowDefinitionId,
							context: contextData
						}),
						headers: {
							"X-CSRF-Token": token,
							"Content-Type": "application/json"
						},
						async: false,
						success: function (data) {
							MessageToast.show("The workflow has started");
						},
						error: function (data) {
							MessageToast.show(data);
						}
					});
				}
			});
        },
        
        onCallODataCC: function(evt){
            $.ajax({
				url: "/comqperiorworkflowsampleui/gateway/sap/opu/odata/sap/C_SUPPLIER_FS_SRV/C_SupplierPurOrder?$format=json",
				method: "GET",
				success: function (result, xhr, data) {
					var test = data;
				}
			});
        }
	});
});