{
	"contents": {
		"9d5ca7d8-82d2-403f-b096-756c50af3ca8": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "samplewf",
			"subject": "samplewf",
			"name": "samplewf",
			"lastIds": "24053167-beb7-4cdc-b5b2-26e2a4f1bce5",
			"events": {
				"8d2e73a9-4fcd-4fea-9ecf-e6afb7f68cb9": {
					"name": "StartEvent1"
				},
				"1753f448-f6f7-4ae9-b3cf-ff6ce1197ba9": {
					"name": "Terminate"
				}
			},
			"activities": {
				"2119779f-e4ef-463f-afb6-1c919bcaa098": {
					"name": "FirstTask"
				},
				"f1d8e2fd-663b-4b83-9798-0c8283688000": {
					"name": "SecondTask"
				},
				"de8ee0d5-e3cd-44c3-853d-65c150ec91ea": {
					"name": "decision"
				},
				"bff5105b-ac83-4f49-acfb-319d720d31b7": {
					"name": "decision"
				},
				"9905caa8-533b-487f-aa55-84bc32bd0886": {
					"name": "Call Backend OData"
				}
			},
			"sequenceFlows": {
				"b6303f1d-5cb0-486f-95cd-a693103d03d8": {
					"name": "SequenceFlow1"
				},
				"9ea39617-54b2-4f15-8f6f-2ffd67d8435f": {
					"name": "SequenceFlow2"
				},
				"eb662de7-66ef-4ea5-ab06-d0f55e550d03": {
					"name": "SequenceFlow3"
				},
				"bba26d0e-1539-4fbe-a661-730296b815f5": {
					"name": "create second task"
				},
				"3cf099ef-17e3-4e88-ad19-d6645a359bea": {
					"name": "finish process"
				},
				"3d50f58d-5425-4ab6-be94-beb6faa5adbf": {
					"name": "finish"
				},
				"a7c77c2a-971a-4f53-a700-1288883e58d6": {
					"name": "SequenceFlow7"
				},
				"d8c88ad2-6f4b-4fef-87e1-1a400665611e": {
					"name": "SequenceFlow8"
				}
			},
			"diagrams": {
				"4e4564a6-2db7-4207-9e7d-3d00ac5fd727": {}
			}
		},
		"8d2e73a9-4fcd-4fea-9ecf-e6afb7f68cb9": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"1753f448-f6f7-4ae9-b3cf-ff6ce1197ba9": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "Terminate",
			"eventDefinitions": {
				"283c7b03-1655-4966-8d2d-be0d89d6ce05": {}
			}
		},
		"2119779f-e4ef-463f-afb6-1c919bcaa098": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "First task in sample workflow",
			"description": "First task description..",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://comqperiorworkflowsampleui/com.qperior.workflowsample.ui",
			"recipientUsers": "${info.startedBy}",
			"id": "usertask1",
			"name": "FirstTask",
			"documentation": "Documentation: First task in sample workflow"
		},
		"f1d8e2fd-663b-4b83-9798-0c8283688000": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Second task in sample workflow",
			"description": "Second task description..",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://comqperiorworkflowsampleui/com.qperior.workflowsample.ui",
			"recipientUsers": "${info.startedBy}",
			"id": "usertask2",
			"name": "SecondTask",
			"documentation": "Documentation: Second task in sample workflow"
		},
		"de8ee0d5-e3cd-44c3-853d-65c150ec91ea": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "decision",
			"default": "3cf099ef-17e3-4e88-ad19-d6645a359bea"
		},
		"bff5105b-ac83-4f49-acfb-319d720d31b7": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "decision",
			"default": "3d50f58d-5425-4ab6-be94-beb6faa5adbf"
		},
		"9905caa8-533b-487f-aa55-84bc32bd0886": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Q_PERIOR_GW1",
			"path": " /sap/opu/odata/sap/C_SUPPLIER_FS_SRV/C_SupplierPurOrder?$format=json",
			"httpMethod": "GET",
			"responseVariable": "${context.serviceresponse}",
			"id": "servicetask1",
			"name": "Call Backend OData"
		},
		"b6303f1d-5cb0-486f-95cd-a693103d03d8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "8d2e73a9-4fcd-4fea-9ecf-e6afb7f68cb9",
			"targetRef": "2119779f-e4ef-463f-afb6-1c919bcaa098"
		},
		"9ea39617-54b2-4f15-8f6f-2ffd67d8435f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "2119779f-e4ef-463f-afb6-1c919bcaa098",
			"targetRef": "de8ee0d5-e3cd-44c3-853d-65c150ec91ea"
		},
		"eb662de7-66ef-4ea5-ab06-d0f55e550d03": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "f1d8e2fd-663b-4b83-9798-0c8283688000",
			"targetRef": "bff5105b-ac83-4f49-acfb-319d720d31b7"
		},
		"bba26d0e-1539-4fbe-a661-730296b815f5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.FirstTaskResult == 'yes'}",
			"id": "sequenceflow4",
			"name": "create second task",
			"sourceRef": "de8ee0d5-e3cd-44c3-853d-65c150ec91ea",
			"targetRef": "f1d8e2fd-663b-4b83-9798-0c8283688000"
		},
		"3cf099ef-17e3-4e88-ad19-d6645a359bea": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "finish process",
			"sourceRef": "de8ee0d5-e3cd-44c3-853d-65c150ec91ea",
			"targetRef": "1753f448-f6f7-4ae9-b3cf-ff6ce1197ba9"
		},
		"3d50f58d-5425-4ab6-be94-beb6faa5adbf": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "finish",
			"sourceRef": "bff5105b-ac83-4f49-acfb-319d720d31b7",
			"targetRef": "1753f448-f6f7-4ae9-b3cf-ff6ce1197ba9"
		},
		"a7c77c2a-971a-4f53-a700-1288883e58d6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.SecondTaskResult == 'gotoservicetask'}",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "bff5105b-ac83-4f49-acfb-319d720d31b7",
			"targetRef": "9905caa8-533b-487f-aa55-84bc32bd0886"
		},
		"d8c88ad2-6f4b-4fef-87e1-1a400665611e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "9905caa8-533b-487f-aa55-84bc32bd0886",
			"targetRef": "1753f448-f6f7-4ae9-b3cf-ff6ce1197ba9"
		},
		"4e4564a6-2db7-4207-9e7d-3d00ac5fd727": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"142b6a69-8708-4904-82c1-f4bf9244af4d": {},
				"cb6f2d03-83d0-4226-9051-b3c481feeb02": {},
				"5c6b8a91-17de-407f-bf4b-62477dad1860": {},
				"f953fbc9-8a50-4e75-9091-cf5117a9dd7a": {},
				"f2ca562b-da73-4e78-b9e5-432809d3a059": {},
				"5e82f995-971b-4a5b-b4d2-0aa4f726f2c1": {},
				"c88d07c2-d4b7-41ed-93c0-4d653bc3fb2b": {},
				"49df3c0f-30a7-4f19-a8fe-052cdd037972": {},
				"a90f00d2-9ff4-4cb2-8c97-c546fdf0d66e": {},
				"6dbf51b4-b88a-42b2-a706-3bd75b9af50d": {},
				"83460663-ed7e-4228-bd73-5ad4fb9fa015": {},
				"f03bb45c-5628-4f38-a23c-fd75b8fb16a9": {},
				"e95a21b0-701a-4619-a6d4-faf4589d5f70": {},
				"3b986051-06c0-4436-a0c4-d6c924981244": {},
				"b8db8477-28c2-4104-a1ee-8facb6d6fba0": {}
			}
		},
		"283c7b03-1655-4966-8d2d-be0d89d6ce05": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition1"
		},
		"142b6a69-8708-4904-82c1-f4bf9244af4d": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "8d2e73a9-4fcd-4fea-9ecf-e6afb7f68cb9"
		},
		"cb6f2d03-83d0-4226-9051-b3c481feeb02": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 832,
			"y": 107,
			"width": 35,
			"height": 35,
			"object": "1753f448-f6f7-4ae9-b3cf-ff6ce1197ba9"
		},
		"5c6b8a91-17de-407f-bf4b-62477dad1860": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116 240,116",
			"sourceSymbol": "142b6a69-8708-4904-82c1-f4bf9244af4d",
			"targetSymbol": "f953fbc9-8a50-4e75-9091-cf5117a9dd7a",
			"object": "b6303f1d-5cb0-486f-95cd-a693103d03d8"
		},
		"f953fbc9-8a50-4e75-9091-cf5117a9dd7a": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 190,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "2119779f-e4ef-463f-afb6-1c919bcaa098"
		},
		"f2ca562b-da73-4e78-b9e5-432809d3a059": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "240,116 341.625,116 341.625,86 413.75,86",
			"sourceSymbol": "f953fbc9-8a50-4e75-9091-cf5117a9dd7a",
			"targetSymbol": "49df3c0f-30a7-4f19-a8fe-052cdd037972",
			"object": "9ea39617-54b2-4f15-8f6f-2ffd67d8435f"
		},
		"5e82f995-971b-4a5b-b4d2-0aa4f726f2c1": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 534,
			"y": -11,
			"width": 100,
			"height": 60,
			"object": "f1d8e2fd-663b-4b83-9798-0c8283688000"
		},
		"c88d07c2-d4b7-41ed-93c0-4d653bc3fb2b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "584,19 682,19",
			"sourceSymbol": "5e82f995-971b-4a5b-b4d2-0aa4f726f2c1",
			"targetSymbol": "83460663-ed7e-4228-bd73-5ad4fb9fa015",
			"object": "eb662de7-66ef-4ea5-ab06-d0f55e550d03"
		},
		"49df3c0f-30a7-4f19-a8fe-052cdd037972": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 392.75,
			"y": 65,
			"object": "de8ee0d5-e3cd-44c3-853d-65c150ec91ea"
		},
		"a90f00d2-9ff4-4cb2-8c97-c546fdf0d66e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "413.75,86 413.75,10 582,10",
			"sourceSymbol": "49df3c0f-30a7-4f19-a8fe-052cdd037972",
			"targetSymbol": "5e82f995-971b-4a5b-b4d2-0aa4f726f2c1",
			"object": "bba26d0e-1539-4fbe-a661-730296b815f5"
		},
		"6dbf51b4-b88a-42b2-a706-3bd75b9af50d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "413.75,86 413.75,235 839,235 839,120",
			"sourceSymbol": "49df3c0f-30a7-4f19-a8fe-052cdd037972",
			"targetSymbol": "cb6f2d03-83d0-4226-9051-b3c481feeb02",
			"object": "3cf099ef-17e3-4e88-ad19-d6645a359bea"
		},
		"83460663-ed7e-4228-bd73-5ad4fb9fa015": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 661,
			"y": -2,
			"object": "bff5105b-ac83-4f49-acfb-319d720d31b7"
		},
		"f03bb45c-5628-4f38-a23c-fd75b8fb16a9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "682,19 767.5,19 767.5,124.5 849.5,124.5",
			"sourceSymbol": "83460663-ed7e-4228-bd73-5ad4fb9fa015",
			"targetSymbol": "cb6f2d03-83d0-4226-9051-b3c481feeb02",
			"object": "3d50f58d-5425-4ab6-be94-beb6faa5adbf"
		},
		"e95a21b0-701a-4619-a6d4-faf4589d5f70": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 812,
			"y": -62,
			"width": 100,
			"height": 60,
			"object": "9905caa8-533b-487f-aa55-84bc32bd0886"
		},
		"3b986051-06c0-4436-a0c4-d6c924981244": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "682,19 757.5,19 757.5,-43 841,-43",
			"sourceSymbol": "83460663-ed7e-4228-bd73-5ad4fb9fa015",
			"targetSymbol": "e95a21b0-701a-4619-a6d4-faf4589d5f70",
			"object": "a7c77c2a-971a-4f53-a700-1288883e58d6"
		},
		"b8db8477-28c2-4104-a1ee-8facb6d6fba0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "862,-32 862,52.75 849.5,52.75 849.5,124.5",
			"sourceSymbol": "e95a21b0-701a-4619-a6d4-faf4589d5f70",
			"targetSymbol": "cb6f2d03-83d0-4226-9051-b3c481feeb02",
			"object": "d8c88ad2-6f4b-4fef-87e1-1a400665611e"
		},
		"24053167-beb7-4cdc-b5b2-26e2a4f1bce5": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"sequenceflow": 8,
			"startevent": 1,
			"endevent": 1,
			"usertask": 2,
			"servicetask": 1,
			"exclusivegateway": 2
		}
	}
}