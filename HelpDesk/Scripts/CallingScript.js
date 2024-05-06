 //Global flag indicating one ore more pause reasons are available
    var gbPauseReasons = false;
    var g_strTransferType = "NONE";
    var g_bRunningInAgentClient = false;
    var g_strType = "";

    // Forbid IE context menu
    //  (allow in EditBox only)
    //  (if the real context menu must be shown - Advance? Hosting
    //  Interfaces must be used)
    function onContextMenu()
    {
        if ( window.event.srcElement.tagName !="INPUT" )
        {
            window.event.returnValue = false;
            window.event.cancelBubble = true;
            return false;
        }
    }

    // Install Context Menu handlers on HTML loading.
    function onLoad()
    {
        // forbid cursor change (except "INPUT"
        // entry box and "A" hyperlink) for HTML text.
        var Objs = document.all;
        for (i=0; i< Objs.length; i++)
            // "INPUT" entry box and "A" hyperlink
            if (Objs(i).tagName!="INPUT" && Objs(i).tagName!="A")
            Objs(i).style.cursor = "default";

        // event handler – context menu
        document.oncontextmenu = onContextMenu;

Application_RegisterForAgenTelData();
    }

    // Executes a command, which is actually navigating to a special kind of URL
    function execCommand(strCommand)
    {
        
        if(g_bRunningInAgentClient)
        {
            window.navigate("application:" + strCommand);
        }
        else
        {
 window.navigate("application:" + strCommand);
           // alert(strCommand);
        }
    }

    // The exit command will quit the application
    function cmdExit()
    {
        var strCommand = "<Command Name='EXIT'></Command>";

        execCommand(strCommand);
    }

    // Shows the about the dialog
    function cmdAbout()
    {
        var strCommand = "<Command Name='ABOUT'></Command>";
        execCommand(strCommand);
    }

    // Shows the help file
    function cmdHelp()
    {
        var strCommand = "<Command Name='HELP'></Command>";
        execCommand(strCommand);
    }

    // The log off command will close all open windows and show a new login window
    function cmdLogOff()
    {
        var strCommand = "<Command Name='LOGOFF'></Command>";
        execCommand(strCommand);
    }

    // The pause command will put the agent in pause if the agent is currently not in
    // pause, or will unpause the agent if the agent is in pause for the moment. According
    // to the agent status the text of the button will change, the action however is
    // determined in the client code.
    function cmdPause()
    {
        var strCommand = "<Command Name='PAUSE'>";
        var strId = "";

        if(gbPauseReasons)
        {
            strId = prompt("Enter the pause reason ID");
            strCommand += "<PauseReasonID>" + strId + "</PauseReasonID>";
        }

        strCommand += "</Command>";

        if(gbPauseReasons && strId != "")
        {
            execCommand(strCommand);
        }
    }

    // Shows or hides the agent monitor
    function cmdAgentMonitor()
    {
        var strCommand = "<Command Name='AGENTMONITOR'></Command>";
        execCommand(strCommand);
    }

    // Shows or hides the waiting monitor
    function cmdWaitingMonitor()
    {
        var strCommand = "<Command Name='WAITINGMONITOR'></Command>";
        execCommand(strCommand);
    }

    // Stops the wrapup time (if possible)
    function cmdStopWrapupTime()
    {
        var strCommand = "<Command Name='STOPWRAPUP'><ContactID>" + document.all.textContactId.value + "</ContactID></Command>";
        execCommand(strCommand);
    }

    // Pauses the wrapup tile (if possible)
    function cmdPauseWrapupTime()
    {
        var strCommand = "<Command Name='PAUSEWRAPUP'><ContactID>" + document.all.textContactId.value + "</ContactID></Command>";
        execCommand(strCommand);
    }

    // Tapi connect function
    function cmdTapiAnswer()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>ANSWER</Action></Command>";
        execCommand(strCommand);
    }

    // Tapi disconnect function
    function cmdTapiHangUp()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>HANGUP</Action></Command>";
        execCommand(strCommand);
    }

    // Transfer the call
    function cmdTapiTransfer(num)
    {
        alert(num);
        alert(g_strTransferType)
        g_strTransferType = "BLIND"
        alert(g_strTransferType)
        if(g_strTransferType == "BLIND")
        {
            var strCommand = "<Command Name='PHONEDOACTION'><Action>TRANSFER</Action><ActionInfo><PhoneNumber>" + 
                             num +
                             "</PhoneNumber><FormatNumber>YES</FormatNumber></ActionInfo></Command>";
            execCommand(strCommand);
        }
        else if(g_strTransferType != "NONE")
        {
            var strCommand = "<Command Name='PHONEDOACTION'><Action>TRANSFER</Action></Command>";
            execCommand(strCommand);
        }
    }
    
	// Swap the call with the call that's on hold
    function cmdTapiSwap()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>SWAP</Action></Command>";
        execCommand(strCommand);
    }

	// Start a conference with this call and the call that's on hold
    function cmdTapiConference()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>CONFERENCE</Action></Command>";
        execCommand(strCommand);
    }
    
    // Send a digit
    function cmdTapiDialDigit()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>DIGIT</Action><ActionInfo><Digit><![CDATA[" + 
                          prompt("Please enter the digit that must be sent:", "") + "]]></Digit></ActionInfo></Command>";
        execCommand(strCommand);
    }


    // Retrieve the transfered call
    function cmdTapiRetrieve()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>RETRIEVE</Action></Command>";
        execCommand(strCommand);
    }

    // Put the caller on hold
    function cmdTapiHold()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>HOLD</Action></Command>";
        execCommand(strCommand);
    }

    // Make a new call
    function cmdTapiDial(num)
    {
       
        var strCommand = "<Command Name='PHONEDOACTION'><Action>DIAL</Action><ActionInfo><PhoneNumber>" + num +
                        
                         "</PhoneNumber><FormatNumber>YES</FormatNumber><CallType>CC</CallType><DialType>TAPI</DialType>" +
                         "<Properties>" +
                         "<Property><Name><![CDATA[Property Name 1]]></Name><Value><![CDATA[Value 1]]></Value><Hidden>NO</Hidden><Url><![CDATA[http://www.google.be]]></Url></Property>" +
                         "<Property><Name><![CDATA[Property Name 2]]></Name><Value><![CDATA[Value 2]]></Value><Hidden>YES</Hidden><Url><![CDATA[]]></Url></Property>" +
                         "</Properties>" +
                         "<Skills><Skill><Name><![CDATA[Skill 1]]></Name></Skill><Skill><Name><![CDATA[Skill 2]]></Name></Skill><Skill><Name><![CDATA[Skill 3]]></Name></Skill></Skills>" +
                         "<Groups><Group><Name><![CDATA[Group 1]]></Name></Group><Group><Name><![CDATA[Group 2]]></Name></Group><Group><Name><![CDATA[Group 3]]></Name></Group></Groups>" +
                         "<ContactCodes>" +
                         "<ContactCode><Name><![CDATA[Contact code 1]]></Name><Assigned>YES</Assigned><Hidden>NO</Hidden></ContactCode>" +
                         "<ContactCode><Name><![CDATA[Contact code 2]]></Name><Assigned>YES</Assigned><Hidden>YES</Hidden></ContactCode>" +
                         "<ContactCode><Name><![CDATA[Contact code 3]]></Name><Assigned>NO</Assigned><Hidden>YES</Hidden></ContactCode>" +
                         "</ContactCodes>" +
                         "</ActionInfo></Command>";

        execCommand(strCommand);
    }
    
    // Deflect the incoming call
    function cmdTapiDeflect()
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>DEFLECT</Action><ActionInfo><PhoneNumber>" + 
                         prompt("Please enter the number to deflect to:", "") +
                         "</PhoneNumber><FormatNumber>YES</FormatNumber></ActionInfo></Command>";
        execCommand(strCommand);
    }
    
    // Make a consultation call
    function cmdTapiConsult(num)
    {
        var strCommand = "<Command Name='PHONEDOACTION'><Action>CONSULT</Action><ActionInfo><PhoneNumber>" + num+
                         "</PhoneNumber><FormatNumber>YES</FormatNumber><CallType>CC</CallType></ActionInfo></Command>";
        execCommand(strCommand);
    }

    function cmdAcceptContact()
    {
        var strCommand = "<Command Name='ACCEPTCONTACT'><ContactID><![CDATA[" + document.all.textContactId.value + "]]></ContactID></Command>";
        execCommand(strCommand);
    }

    function cmdRejectContact()
    {
        var strCommand = "<Command Name='REJECTCONTACT'><ContactID><![CDATA[" + document.all.textContactId.value + "]]></ContactID></Command>";
        execCommand(strCommand);
    }

    function cmdRequeueContact()
    {
        var strCommand = "<Command Name='REQUEUECONTACT'><ContactID><![CDATA[" + document.all.textContactId.value + "]]></ContactID></Command>";
        execCommand(strCommand);
    }

    function cmdHandledContact()
    {
        var strCommand = "<Command Name='HANDLEDCONTACT'><ContactID><![CDATA[" + document.all.textContactId.value + "]]></ContactID></Command>";
        execCommand(strCommand);
    }

    // Called to assign the contact code to the contact
    function SetContactCode(strContactCodeId,objCheckBox)
    {
        var strCommand;
        var strCommandName;

        strCommandName = objCheckBox.checked ? "ASSIGNCONTACTCODE" : "UNASSIGNCONTACTCODE";
        strCommand = "<Command Name='" + strCommandName + "'><ContactID><![CDATA[" + document.all.textContactId.value;
        strCommand += "]]></ContactID><ContactCode><![CDATA[" + strContactCodeId + "]]></ContactCode></Command>";

        execCommand(strCommand);
    }

    function cmdSetConfiguration()
    {
        var strCommand;
        var strName, strValue;

        strName = prompt("Enter the name","");
        strValue = prompt("Enter the value","")

        strCommand = "<Command Name='SETCONFIG'><Name>" + strName + "</Name><Value>" + strValue + "</Value></Command>";
        execCommand(strCommand);
    }

    function cmdGetConfiguration()
    {
        var strCommand, strName;

        strName = prompt("Enter the name","");

        strCommand = "<Command Name='GETCONFIG'><Name>" + strName + "</Name></Command>";
        execCommand(strCommand);
    }

    function cmdSendCustomMessage(strType,strId,strName,strMessage)
    {
        var strCommand;

        strCommand = "<Command Name='CUSTOMMESSAGE'>";
        strCommand += "<TargetType>" + strType + "</TargetType><UserID>" + strId + "</UserID><UserName><![CDATA[";
        strCommand += strName + "]]></UserName><Message>" + strMessage + "</Message></Command>";

        execCommand(strCommand);
    }

    ///////////////////////////////////////////////
    // Functions called by the agent application //
    ///////////////////////////////////////////////

    // This function is called when the get confiug command is executed
    // to retrieve the value of a certain parameter
    function Application_ConfigValue(strName, strValue)
    {
        document.getElementById("EventTable").innerHTML += "The value for parameter " + strName + " is " + strValue + "<br>";
    }

    // Called whenever the wrapup time starts
    function Application_StartWrapUp(strContactID, strWrapUpTime)
    {
        document.getElementById("EventTable").innerHTML += "Wrapup time started for contact " + strContactID +
                                                           " for " + strWrapUpTime + " seconds<br>";
    }

    // Called when the wrapup time ends
    function Application_EndWrapUp(strContactID)
    {
        document.getElementById("EventTable").innerHTML += "Wrapup time ended for contact " + strContactID + "<br>";
    }

    // Called when the wrapup time ends
    function Application_PauseWrapUp(strContactID) {
        document.getElementById("EventTable").innerHTML += "Wrapup time paused for contact " + strContactID + "<br>";
    }

    // This function is called whenever the status of an agent changes.
    // The status given in the function is the same as is sent in the
    // XML message and is not the translated text used in the client
    function Application_AgentStatus(strStatus)
    {
        document.all.textAgentStatus.value = strStatus;
    }

    // This function is called whenever the status of the contact center changes.
    // The status given in the function is the same as is sent in the
    // XML message and is not the translated text used in the client
    function Application_CcStatus(strStatus, strThreshold, strMissingResources)
    {
		var strCCStatus;

		strCCStatus = strStatus;

		if(strStatus == "FREE")
		{
			if(strThreshold == "yes")
			{
				strCCStatus += " THRESHOLD";
			}

			if(strMissingResources == "yes")
			{
				strCCStatus += " MISSINGRESOURCES";
			}
		}

        document.all.textCcStatus.value = strCCStatus;
    }

    // This function is called each time the page registers itself to receive
    // data and will give us the information about the agent
    function Application_AgentInfo(strId, strUserName, strExtension, strEmailAddress, strFirstName, strLastName,
								   strAccessLevel, strLanguage, strClientType)
    {
        document.all.textAgentId.value     = strId;
        document.all.textUserName.value    = strUserName;
        document.all.textExtension.value   = strExtension;
        document.all.textEmail.value       = strEmailAddress;
        document.all.textFirstName.value   = strFirstName;
        document.all.textLastName.value    = strLastName;
        document.all.textAccessLevel.value = strAccessLevel;
        document.all.textLanguage.value    = strLanguage;
		document.all.textClientType.value  = strClientType == "CLIENTTYPE_AGENT" ? "AgentClient" : "OfficeClient";
    }
    
    // This function is called when the From or the To field of the contact is updated
    function Application_ContactInformationUpdated(strContactID, strOtherParty)
    {
        // The "From" field is updated in case the contact is an incoming contact
        if(g_strType == "CCEMAILIN" || g_strType.indexOf("INEXTERN") >= 0 || g_strType.indexOf("ININTERN") >= 0)
        {
            document.all.textFrom.value = strOtherParty;
        }
        else
        {
            document.all.textTo.value = strOtherParty;
        }
    }

    // This function is the first of four functions that are called when a new contact
    // arrives at the client. It informs our page about the basic call information
    function Application_ContactInformation(strId, strType, strFrom, strTo, strWaitingTime)
    {
        document.all.textContactId.value   = strId;
        document.all.textContactType.value = strType;
        document.all.textFrom.value        = strFrom;
        document.all.textTo.value          = strTo;
        document.all.textWaitingTime.value = strWaitingTime;
        g_strType = strType;
    }


    // This function is the second of four functions that are called when a new contact
    // arrives at the client. It informs the HTML pages about the selected properties
    // for this call. Each of the parameters is a semicolon separated list of values
    function Application_ContactInformation_Properties( strNames, strValues, strHidden, strUrls)
    {
        //Split up the information in the parameters.
        var arrNames  = strNames.split(";");
        var arrValues = strValues.split(";");
        var arrHidden = strHidden.split(";");
        var arrUrls = strUrls.split(";");
        var nItems = arrNames.length;
        var objPropertiesTable = document.getElementById("PropertiesTable");

        //clear the existing rows first (except the header row)
        var nNbrOfRows = objPropertiesTable.rows.length;
        while (nNbrOfRows > 1)
        {
            objPropertiesTable.deleteRow(nNbrOfRows - 1);
            nNbrOfRows = objPropertiesTable.rows.length;
        }

        //Iterate through the values and fill the table
        for (i = 0; i < nItems; i++)
        {
            var objNewRow = objPropertiesTable.insertRow(-1);
            var objNewCell = objNewRow.insertCell(0);
            objNewCell.innerText = arrNames[i];
            objNewCell = objNewRow.insertCell(1);
            objNewCell.innerText = arrValues[i];
            objNewCell = objNewRow.insertCell(2);
            objNewCell.innerText = arrHidden[i];
            objNewCell = objNewRow.insertCell(3);
            objNewCell.innerText = arrUrls[i];
        }
    }


    // This function is the third of four functions that arae called when a new contact
    // arrives at the client. This function informs the HTML pages about the skills
    // that are assigned to this contact
    function Application_ContactInformation_Skills(strNames,strTypes)
    {
        //Split up the information in the parameters.
        var arrNames = strNames.split(";");
        var arrTypes = strTypes.split(";");
        var nItems = arrNames.length;
        var objSkillsTable = document.getElementById("SkillsTable");

        //clear the existing rows first (except the header row)
        var nNbrOfRows = objSkillsTable.rows.length;
        while (nNbrOfRows > 1)
        {
            objSkillsTable.deleteRow(nNbrOfRows - 1);
            nNbrOfRows = objSkillsTable.rows.length;
        }

        //Iterate through the values and fill the table
        for (i = 0; i < nItems; i++)
        {
            var objNewRow = objSkillsTable.insertRow(-1);
            var objNewCell = objNewRow.insertCell(0);
            objNewCell.innerText = arrNames[i];
            objNewCell = objNewRow.insertCell(1);
            objNewCell.innerText = arrTypes[i];
        }
    }


    function Application_ContactCodes(strIds, strNames, strHidden, strAssigned)
    {
        //Split up the information in the parameters.
        var arrIds      = strIds.split(";");
        var arrNames    = strNames.split(";");
        var arrHidden   = strHidden.split(";");
        var arrAssigned = strAssigned.split(";");
        var nItems = arrNames.length;
        var objContactCodeTable = document.getElementById("ContactCodeTable");


        if(strNames == "")
        {
            nItems = 0;
        }

        //clear the existing rows first (except the header row)
        var nNbrOfRows = objContactCodeTable.rows.length;
        while (nNbrOfRows > 1)
        {
            objContactCodeTable.deleteRow(nNbrOfRows - 1);
            nNbrOfRows = objContactCodeTable.rows.length;
        }

        //Iterate through the values and fill the table
        for (i = 0; i < nItems; i++)
        {
            var objNewRow = objContactCodeTable.insertRow(-1);
            var objNewCell = objNewRow.insertCell(0);
            objNewCell.innerText = arrIds[i];
            objNewCell = objNewRow.insertCell(1);
            objNewCell.innerText = arrNames[i];
            objNewCell = objNewRow.insertCell(2);
            objNewCell.innerText = arrHidden[i];
            objNewCell = objNewRow.insertCell(3);
            if (arrAssigned[i] == "yes")
            {
                objNewCell.innerHTML = "<input type='checkbox' onClick='SetContactCode(" + arrIds[i] + ",this);' CHECKED>";
            }
            else
            {
                objNewCell.innerHTML = "<input type='checkbox' onClick='SetContactCode(" + arrIds[i] + ",this);'>";
            }
        }
    }

    // This function gives the HTML pages the list of contact codes that is
    // defined on the server. This function will only be called in agenTel 5.1 sp 1
    // and gives additional information about the tree structure of the contact codes
    function Application_ContactCodes2(strIds, strNames, strDescriptions, strHidden, strAssigned, strParents, strPositions,strAllowCollapse,strCollapseLevel)
    {
        //Split up the information in the parameters.
        var arrIds          = strIds.split(";");
        var arrNames        = strNames.split(";");
        var arrDescriptions = strDescriptions.split(";");
        var arrHidden       = strHidden.split(";");
        var arrAssigned     = strAssigned.split(";");
        var arrParentIds    = strParents.split(";");
        var arrPositions    = strPositions.split(";");
        var nItems = arrNames.length;
        var objContactCodeTable = document.getElementById("ContactCodeTable2");


        if(strNames == "")
        {
            nItems = 0;
        }

        //set general propertie
        document.all.textAllowCollapse.value = strAllowCollapse;
        document.all.textCollapseLevel.value = strCollapseLevel;

        //clear the existing rows first (except the header row)
        var nNbrOfRows = objContactCodeTable.rows.length;
        while (nNbrOfRows > 1)
        {
            objContactCodeTable.deleteRow(nNbrOfRows - 1);
            nNbrOfRows = objContactCodeTable.rows.length;
        }

        //Iterate through the values and fill the table
        for (i = 0; i < nItems; i++)
        {
            var objNewRow = objContactCodeTable.insertRow(-1);
            var objNewCell = objNewRow.insertCell(0);
            objNewCell.innerText = arrIds[i];
            objNewCell = objNewRow.insertCell(1);
            objNewCell.innerText = arrNames[i];
            objNewCell = objNewRow.insertCell(2);
            objNewCell.innerText = arrDescriptions[i];
            objNewCell = objNewRow.insertCell(3);
            objNewCell.innerText = arrHidden[i];
            objNewCell = objNewRow.insertCell(4);
            if (arrAssigned[i] == "yes")
            {
                objNewCell.innerHTML = "<input type='checkbox' onClick='SetContactCode(" + arrIds[i] + ",this);' CHECKED>";
            }
            else
            {
                objNewCell.innerHTML = "<input type='checkbox' onClick='SetContactCode(" + arrIds[i] + ",this);'>";
            }
            objNewCell = objNewRow.insertCell(5);
            objNewCell.innerText = arrParentIds[i];
            objNewCell = objNewRow.insertCell(6);
            objNewCell.innerText = arrPositions[i];
        }
    }

    // Called when the server forces the client to clear it's view.
    function Application_ClearView()
    {
    }
    
    function Application_UpdatePhoneStatus(strAnswer, strHangup, strDial, strHold, strRetrieve, strSwap, strConsult, strDigits, strDeflect, strTransfer, strConference)
    {
        var oButton;
        
        //alert("test");
        
        // Get the "Answer" button
        oButton = document.getElementById("btnTapiAnswer");
        oButton.disabled = strAnswer != "yes";
        
        // Get the "Hangup" button
        oButton = document.getElementById("btnTapiHangUp");
        oButton.disabled = strHangup != "yes";
        
        // Get the "Dial" button
        oButton = document.getElementById("btnTapiDialOut");
        oButton.disabled = strDial != "yes";
                
        // Get the "Hold" button
        oButton = document.getElementById("btnOnHold");
        oButton.disabled = strHold != "yes";
        
        // Get the "Retrieve" button
        oButton = document.getElementById("btnRetrieve");
        oButton.disabled = strRetrieve != "yes";
        
        // Get the "Swap" button
        oButton = document.getElementById("btnSwap");
        oButton.disabled = strSwap != "yes";
        
        // Get the "Consult" button
        oButton = document.getElementById("btnConsult");
        oButton.disabled = strConsult != "yes";
        
        // Get the "Digits" button
        oButton = document.getElementById("btnDialDigit");
        oButton.disabled = strDigits != "yes";
        
        // Get the "Deflect" button
        oButton = document.getElementById("btnDeflect");
        oButton.disabled = strDeflect != "yes";
        
        // Get the "Conference" button
        oButton = document.getElementById("btnConference");
        oButton.disabled = strConference != "yes";
        
        // Get the "Transfer" button
        oButton = document.getElementById("btnTransfer");
        
        if(strTransfer == "BLIND")
        {
            oButton.value = "Transfer (Blind)";
            oButton.disabled = false;
        }
        else if(strTransfer == "COMPLETE")
        {
            oButton.value = "Transfer (Complete)";
            oButton.disabled = false;
        }
        else if(strTransfer == "MERGE")
        {
            oButton.value = "Transfer (Merge)";
            oButton.disabled = false;
        }
        else
        {
            oButton.value = "Transfer";
            oButton.disabled = true;
        }
                
        // Store the transfer type
        g_strTransferType = strTransfer;
    }

    // Called when a custom message arrives for the agent
    function Application_CustomMessage(strSourceType,strSourceUserId, strMessage)
    {
        document.all.textSourceType.value = strSourceType;
        document.all.textSourceUserId.value = strSourceUserId;
        document.all.textSourceMessage.value = strMessage;
    }

    function Application_RequestScratchPadData()
    {
        var strNoteId   = "DEMO_NOTE";
        var strNoteText = prompt("Notes requested by the server! Notes:","");
        var strCommand  = "";

        // create the command
        strCommand = "<Command Name='SETSCRATCHPADDATA'><ContactID><![CDATA[" + document.all.textContactId.value;
        strCommand += "]]></ContactID><ScratchPadID><![CDATA[" + strNoteId + "]]></ScratchPadID>";
        strCommand += "<ScratchPadData><![CDATA[" + strNoteText + "]]></ScratchPadData></Command>";

        parent.window.execCommand(strCommand);
    }

    function Application_ContactNotesUpdated(strNoteId, strNoteText)
    {
        document.getElementById("EventTable").innerHTML += "Note field with id " + strNoteId + " updated, new text = " +
                                                           strNoteText + "<br>";
    }

    function Application_PauseReasons(strIds, strReasons)
    {
        //Split up the information in the parameters.
        gbPauseReasons = true;

        var arrIds      = strIds.split(";");
        var arrReasons  = strReasons.split(";");
        var nItems = arrIds.length;
        var objPauseTable = document.getElementById("PauseTable");

        //clear the existing rows first (except the header row)
        var nNbrOfRows = objPauseTable.rows.length;
        while (nNbrOfRows > 1)
        {
            objPauseTable.deleteRow(nNbrOfRows - 1);
            nNbrOfRows = objPauseTable.rows.length;
        }

        //Iterate through the values and fill the table
        for (i = 0; i < nItems; i++)
        {
            var objNewRow = objPauseTable.insertRow(-1);
            var objNewCell = objNewRow.insertCell(0);
            objNewCell.innerText = arrIds[i];
            objNewCell = objNewRow.insertCell(1);
            objNewCell.innerText = arrReasons[i];
        }
    }

    function Application_RegisterForAgenTelData()
    {
        // The page is running inside the agent client
        g_bRunningInAgentClient = true;

        // Check if page can be initialized
        execCommand("<COMMAND Name='PAGEINITIALIZED'></COMMAND>");
        execCommand("<COMMAND Name='GETAGENTDATA'></COMMAND>");
    }