sap.ui.define([
    "sap/ui/core/UIComponent",
    "sap/ui/Device",
    "com/qperior/workflowsample/ui/model/models"
], function (UIComponent, Device, models) {
    "use strict";

    return UIComponent.extend("com.qperior.workflowsample.ui.Component", {

        metadata: {
            manifest: "json"
        },

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
        init: function () {
            // call the base component's init function
            UIComponent.prototype.init.apply(this, arguments);

            // enable routing
            this.getRouter().initialize();

            // look for task context and navigate to task ui automaticly
            var startupParameters = this.getComponentData().startupParameters;
            // check if the UI is loaded as a workflow task UI
            if (startupParameters && startupParameters.taskModel) {
                var taskModel = startupParameters.taskModel;
                // get task header data
                var taskData = taskModel.getData();

                if (taskData.Priority === "HIGH") {
                    taskData.PriorityState = "Warning";
                } else if (taskData.Priority === "VERY HIGH") {
                    taskData.PriorityState = "Error";
                } else {
                    taskData.PriorityState = "Success";
                }
                taskData.CreatedOnStr = taskData.CreatedOn.toDateString();
                
                // read description
                startupParameters.inboxAPI.getDescription("NA", taskData.InstanceID).done(function (dataDescr) {
                    taskData.Description = dataDescr.Description;
                }).fail(function (errorText) { });
                
                // set data for task header model
                this.getModel("taskHeaderData").setData(taskData);

                var that = this;

                var taskId = taskData.InstanceID;
                var taskType = taskData.TaskDefinitionID;

                // add task actions and navigate to task view according to task definition
                if (taskData.TaskDefinitionName === "FirstTask") {
                    var oNegativeAction = {
                        sBtnTxt: "Reject",
                        onBtnPressed: function (e) {
                            that._completeTask(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, {FirstTaskResult: "no"})
                        }
                    };

                    var oPositiveAction = {
                        sBtnTxt: "Approve",
                        onBtnPressed: function (e) {
                            that._completeTask(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, {FirstTaskResult: "yes"})
                        }
                    };

                    // add task action buttons
                    startupParameters.inboxAPI.addAction({
                        action: oNegativeAction.sBtnTxt,
                        label: oNegativeAction.sBtnTxt,
                        type: "Reject"
                    }, oNegativeAction.onBtnPressed);

                    startupParameters.inboxAPI.addAction({
                        action: oPositiveAction.sBtnTxt,
                        label: oPositiveAction.sBtnTxt,
                        type: "Accept"
                    }, oPositiveAction.onBtnPressed);
                    this.getRouter().navTo("FirstTaskRoute", { taskId: taskId, taskType: taskType });
                } else if (taskData.TaskDefinitionName === "SecondTask") {
                    var oFinishAction = {
                        sBtnTxt: "Finish process",
                        onBtnPressed: function (e) {
                            that._completeTask(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, {SecondTaskResult: "completed"})
                        }
                    };

                    var oJumpToServiceTaskAction = {
                        sBtnTxt: "Call Service Task",
                        onBtnPressed: function (e) {
                            that._completeTask(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, {SecondTaskResult: "gotoservicetask"})
                        }
                    };

                    // add task action buttons
                    startupParameters.inboxAPI.addAction({
                        action: oFinishAction.sBtnTxt,
                        label: oFinishAction.sBtnTxt,
                        type: "Approve"
                    }, oFinishAction.onBtnPressed);
                    this.getRouter().navTo("SecondTaskRoute", { taskId: taskId, taskType: taskType });

                    startupParameters.inboxAPI.addAction({
                        action: oJumpToServiceTaskAction.sBtnTxt,
                        label: oJumpToServiceTaskAction.sBtnTxt,
                        type: "Approve"
                    }, oJumpToServiceTaskAction.onBtnPressed);
                    this.getRouter().navTo("SecondTaskRoute", { taskId: taskId, taskType: taskType });
                }

            }

            // set the device model
            this.setModel(models.createDeviceModel(), "device");
        },

        _completeTask: function (taskId, taskCompletionContext) {
            var token = this._fetchToken();
            $.ajax({
                url: "/comqperiorworkflowsampleui/bpmworkflowruntime/v1/task-instances/" + taskId,
                method: "PATCH",
                contentType: "application/json",
                async: false,
                data: JSON.stringify({ status: "COMPLETED", context: taskCompletionContext }),
                headers: {
                    "X-CSRF-Token": token
                }
            });
            this._refreshTask(taskId);
        },

        _fetchToken: function () {
            var token;
            $.ajax({
                url: "/comqperiorworkflowsampleui/bpmworkflowruntime/v1/xsrf-token",
                method: "GET",
                async: false,
                headers: {
                    "X-CSRF-Token": "Fetch"
                },
                success: function (result, xhr, data) {
                    token = data.getResponseHeader("X-CSRF-Token");
                }
            });
            return token;
        },

        _refreshTask: function (taskId) {
            this.getComponentData().startupParameters.inboxAPI.updateTask("NA", taskId);
        }
    });
});