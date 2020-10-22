sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/m/MessageToast"
], function (Controller, MessageToast) {
	"use strict";

	return Controller.extend("com.qperior.workflowsample.ui.controller.FirstTaskView", {

		/**
		 * Called when a controller is instantiated and its View controls (if available) are already created.
		 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
		 * @memberOf com.qperior.workflowsample.ui.view.TaskView
		 */
		onInit: function () {
			var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
			oRouter.getRoute("FirstTaskRoute").attachPatternMatched(this._onObjectMatched, this);
		},
		_onObjectMatched: function (oEvent) {
			var taskId = oEvent.getParameter("arguments").taskId;
			var taskType = oEvent.getParameter("arguments").taskType;
			//MessageToast.show("taskId: " + taskId + " taskType: " + taskType);
			
			$.ajax({
				url: "/comqperiorworkflowsampleui/bpmworkflowruntime/v1/task-instances/" + taskId + "/context",
				method: "GET",
				contentType: "application/json",
				dataType: "json",
				success: function (result, xhr, data) {
					var context = data.responseJSON;
					this.getView().getModel("taskContextData").setData(context);
				}.bind(this)
			});
        },
        onCallODataCC: function(evt){
            $.ajax({
				url: "/comqperiorworkflowsampleui/gateway/sap/opu/odata/...?$format=json",
				method: "GET",
				success: function (result, xhr, data) {
					var test = data;
				}
			});
        }		
	});
});