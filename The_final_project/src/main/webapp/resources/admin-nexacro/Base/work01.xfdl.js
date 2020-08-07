(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("work01");
            this.set_titletext("New Form");
            if (Form == this.constructor)
            {
                this._setFormPosition(1090,650);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("certificate", this);
            obj._setContents("<ColumnInfo><Column id=\"NO\" type=\"INT\" size=\"256\"/><Column id=\"ID\" type=\"STRING\" size=\"256\"/><Column id=\"이름\" type=\"STRING\" size=\"256\"/><Column id=\"연락처\" type=\"STRING\" size=\"256\"/><Column id=\"스마트팜_장비ID\" type=\"STRING\" size=\"256\"/><Column id=\"신청일\" type=\"DATE\" size=\"256\"/><Column id=\"시작일\" type=\"DATE\" size=\"256\"/><Column id=\"종료일\" type=\"DATE\" size=\"256\"/><Column id=\"승인일\" type=\"DATE\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"신청일\"/><Col id=\"시작일\"/></Row></Rows>");
            this.addChild(obj.name, obj);


            obj = new Dataset("pagingData", this);
            obj._setContents("<ColumnInfo><Column id=\"startpage\" type=\"INT\" size=\"256\"/><Column id=\"nowpage\" type=\"INT\" size=\"256\"/><Column id=\"endpage\" type=\"INT\" size=\"256\"/><Column id=\"total\" type=\"INT\" size=\"256\"/><Column id=\"cntPerPage\" type=\"INT\" size=\"256\"/><Column id=\"lastPage\" type=\"INT\" size=\"256\"/><Column id=\"start\" type=\"INT\" size=\"256\"/><Column id=\"end\" type=\"INT\" size=\"256\"/><Column id=\"cntPage\" type=\"INT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            obj = new Dataset("deviceID", this);
            obj._setContents("<ColumnInfo><Column id=\"deviceId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);
            
            // UI Components Initialize
            obj = new Static("Static00","0","0",null,"34","10",null,null,null,null,null,this);
            obj.set_taborder("0");
            obj.set_text("스마트팜 권한 신청 리스트");
            obj.set_cssclass("sta_WF_title01");
            this.addChild(obj.name, obj);

            obj = new Tab("Tab00","0","44","1080","308","51",null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_tabindex("0");
            this.addChild(obj.name, obj);

            obj = new Tabpage("Tabpage1",this.Tab00);
            obj.set_text("Tabpage1");
            this.Tab00.addChild(obj.name, obj);

            obj = new Grid("Grid00","10","13",null,"228","10",null,null,null,null,null,this.Tab00.Tabpage1.form);
            obj.set_taborder("0");
            obj.set_binddataset("certificate");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"119\"/><Column size=\"125\"/><Column size=\"163\"/><Column size=\"126\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"신청번호\"/><Cell col=\"1\" text=\"ID\"/><Cell col=\"2\" text=\"이름\"/><Cell col=\"3\" text=\"연락처\"/><Cell col=\"4\" text=\"스마트팜_장비ID\"/><Cell col=\"5\" text=\"신청일\"/><Cell col=\"6\" text=\"시작일\"/><Cell col=\"7\" text=\"종료일\"/><Cell col=\"8\" text=\"승인일\"/></Band><Band id=\"body\"><Cell text=\"bind:NO\"/><Cell col=\"1\" text=\"bind:ID\"/><Cell col=\"2\" text=\"bind:이름\"/><Cell col=\"3\" text=\"bind:연락처\"/><Cell col=\"4\" text=\"bind:스마트팜_장비ID\"/><Cell col=\"5\" text=\"bind:신청일\"/><Cell col=\"6\" text=\"bind:시작일\"/><Cell col=\"7\" text=\"bind:종료일\"/><Cell col=\"8\" text=\"bind:승인일\"/></Band></Format></Formats>");
            this.Tab00.Tabpage1.addChild(obj.name, obj);

            obj = new Static("Static00","10","240",null,"30","10",null,null,null,null,null,this.Tab00.Tabpage1.form);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_pagingBox");
            obj.set_text("");
            this.Tab00.Tabpage1.addChild(obj.name, obj);

            obj = new Button("Button01",null,"240","30","30","10",null,null,null,null,null,this.Tab00.Tabpage1.form);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_pagingNext");
            this.Tab00.Tabpage1.addChild(obj.name, obj);

            obj = new Button("Button03","10","240","30","30",null,null,null,null,null,null,this.Tab00.Tabpage1.form);
            obj.set_taborder("3");
            obj.set_cssclass("btn_WF_pagingPrev");
            this.Tab00.Tabpage1.addChild(obj.name, obj);

            obj = new Div("Div00","69","241","943","30",null,null,null,null,null,null,this.Tab00.Tabpage1.form);
            obj.set_taborder("4");
            obj.set_text("");
            this.Tab00.Tabpage1.addChild(obj.name, obj);

            obj = new Static("Static00","448","-1","46","30",null,null,null,null,null,null,this.Tab00.Tabpage1.form.Div00.form);
            obj.set_taborder("0");
            obj.set_text("Static00");
            this.Tab00.Tabpage1.form.Div00.addChild(obj.name, obj);

            obj = new Static("Static01","425","-1","30","30",null,null,null,null,null,null,this.Tab00.Tabpage1.form.Div00.form);
            obj.set_taborder("1");
            obj.set_text("/");
            this.Tab00.Tabpage1.form.Div00.addChild(obj.name, obj);

            obj = new Edit("Edit00","367","-1","46","30",null,null,null,null,null,null,this.Tab00.Tabpage1.form.Div00.form);
            obj.set_taborder("2");
            this.Tab00.Tabpage1.form.Div00.addChild(obj.name, obj);

            obj = new Static("Static20",null,"0","263","34","10",null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_text("· Home > Middle title > navi");
            obj.set_cssclass("sta_WF_navi");
            this.addChild(obj.name, obj);

            obj = new Static("Static01","0","396","110","32",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            obj.set_text("이름");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static08","109","396","271","32",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            obj.set_cssclass("sta_cm_box02L");
            this.addChild(obj.name, obj);

            obj = new Static("Static02","0","362",null,"34","10",null,null,null,null,null,this);
            obj.set_taborder("5");
            obj.set_text("신청 정보");
            obj.set_cssclass("sta_WF_title02");
            this.addChild(obj.name, obj);

            obj = new Static("Static03","379","396","110","32",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            obj.set_text("시작일");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static04","488","396","592","32",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            obj.set_cssclass("sta_cm_box02L");
            this.addChild(obj.name, obj);

            obj = new Static("Static05","738","396","90","32",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            obj.set_text("종료일");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static07","0","427","110","32",null,null,null,null,null,null,this);
            obj.set_taborder("9");
            obj.set_text("아이디");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static09","109","427","271","32",null,null,null,null,null,null,this);
            obj.set_taborder("10");
            obj.set_cssclass("sta_cm_box02L");
            this.addChild(obj.name, obj);

            obj = new Static("Static10","379","427","110","32",null,null,null,null,null,null,this);
            obj.set_taborder("11");
            obj.set_text("신청일");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static14","0","458","110","32",null,null,null,null,null,null,this);
            obj.set_taborder("12");
            obj.set_text("연락처");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static15","109","458","271","32",null,null,null,null,null,null,this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_cm_box02L");
            this.addChild(obj.name, obj);

            obj = new Static("Static16","379","458","110","32",null,null,null,null,null,null,this);
            obj.set_taborder("14");
            obj.set_text("스마트 팜ID");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Static("Static17","488","458","592","32",null,null,null,null,null,null,this);
            obj.set_taborder("15");
            obj.set_cssclass("sta_cm_box02L");
            this.addChild(obj.name, obj);

            obj = new Static("Edit01","119","400","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("16");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00","498","400","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("17");
            this.addChild(obj.name, obj);

            obj = new Static("Edit06","119","462","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("18");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00","498","462","200","24",null,null,null,null,null,null,this);
            obj.set_taborder("19");
            obj.set_innerdataset("deviceID");
            obj.set_codecolumn("deviceId");
            obj.set_datacolumn("deviceId");
            obj.set_text("Combo00");
            this.addChild(obj.name, obj);

            obj = new Button("Button03","330","540","120","50",null,null,null,null,null,null,this);
            obj.set_taborder("20");
            obj.set_text("수정");
            this.addChild(obj.name, obj);

            obj = new Button("Button04","514","540","120","50",null,null,null,null,null,null,this);
            obj.set_taborder("21");
            obj.set_text("취소");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar01","835","400","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("22");
            this.addChild(obj.name, obj);

            obj = new Static("Edit01_00","119","431","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("23");
            this.addChild(obj.name, obj);

            obj = new Static("Static04_00","488","427","592","32",null,null,null,null,null,null,this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_cm_box02L");
            this.addChild(obj.name, obj);

            obj = new Static("Static05_00_00_00","738","427","90","32",null,null,null,null,null,null,this);
            obj.set_taborder("25");
            obj.set_text("승인일");
            obj.set_cssclass("sta_cm_box01R");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00_01_00","835","431","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("26");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00_00_00","498","431","140","24",null,null,null,null,null,null,this);
            obj.set_taborder("27");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo01","530","54","150","20",null,null,null,null,null,null,this);
            obj.set_taborder("28");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            var Combo01_innerdataset = new nexacro.NormalDataset("Combo01_innerdataset", obj);
            Combo01_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">id</Col><Col id=\"datacolumn\">아이디</Col></Row><Row><Col id=\"codecolumn\">approveDate</Col><Col id=\"datacolumn\">미승인</Col></Row></Rows>");
            obj.set_innerdataset(Combo01_innerdataset);
            obj.set_text("Combo01");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00","680","54","140","20",null,null,null,null,null,null,this);
            obj.set_taborder("29");
            this.addChild(obj.name, obj);

            obj = new Button("Button00","820","54","120","19",null,null,null,null,null,null,this);
            obj.set_taborder("30");
            obj.set_text("검색");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","",1090,650,this,function(p){});
            obj.set_mobileorientation("landscape");
            this.addLayout(obj.name, obj);
            
            // BindItem Information
            obj = new BindItem("item0","Tab00.Tabpage1.form.Div00.form.Edit00","value","pagingData","nowpage");
            this.addChild(obj.name, obj);
            obj.bind();

            obj = new BindItem("item1","Tab00.Tabpage1.form.Div00.form.Static00","text","pagingData","lastPage");
            this.addChild(obj.name, obj);
            obj.bind();
        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("work01.xfdl", function() {
        this.work01_onload = function(obj,e)
        {
        	this.transaction(
        		"farm",	//strSvcID,
        		"farm::getStartData.do",	//strURL("http://localhost:8080/step01/all" 직접 링크는 됨)
        		"",	        //strInDatasets,
        		" pagingData=pagingData, certificate=certificate, deviceID=deviceID",  //strOutDatasets 데이터셋에 바인딩 될 부분,
        		"",		//"deptno=10dname=총무부", //strArgument  이부분은 파라미터 ,
        		"fn_callback"     //strCallbackFunc[,bAsync[,nDataType[,bCompress]]]
        	);
        	this.fn_callback = function(svcID, errCD, errMSG){
        		let ret = (errMSG=="FAILED" || svcID != "farm") ? "error" : "success";
        		if(ret=="error")
        			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	};
        };


        this.Tab00_Tabpage1_Grid00_oncelldblclick = function(obj,e)
        {
        	if(this.confirm("기존의 작성정보가 저장되지 않을 수 있습니다.","알림") == true)
        	{
        		this.Edit01.set_text(this.certificate.getColumn(this.certificate.rowposition,2));//이름

        		this.Edit01_00.set_text(this.certificate.getColumn(this.certificate.rowposition,1));//아이디
        		this.Edit06.set_text(this.certificate.getColumn(this.certificate.rowposition,3));//연락처
        		this.Calendar00.set_value(this.certificate.getColumn(this.certificate.rowposition,6));//시작일
        		this.Calendar01.set_value(this.certificate.getColumn(this.certificate.rowposition,7));//종료일
        		this.Calendar00_00_00.set_value(this.certificate.getColumn(this.certificate.rowposition,5));//신청일
        		this.Calendar00_01_00.set_value(this.certificate.getColumn(this.certificate.rowposition,8));//승인일
        	}
        };

        this.Button04_onclick = function(obj,e)
        {
        	if(this.confirm("취소하시겠습니까?","알림") == true)
        	{
        		this.Edit01.set_value();//이름
        		this.Edit01_00.set_value();//아이디
        		this.Edit06.set_value();//연락처
        		this.Calendar00.set_value();//시작일
        		this.Calendar01.set_value();//종료일
        		this.Calendar00_00_00.set_value();//신청일
        		this.Calendar00_01_00.set_value();//승인일
        	}
        };

        this.Calendar00_00_00_onchanged = function(obj,e)
        {

        };

        this.Button00_onclick = function(obj,e)
        {
        	if(this.Combo01.value != undefined){
        		this.transaction(
        			"farm",	//strSvcID,
        			"farm::getSearchList.do?"+this.Combo01.value+"="+encodeURI(this.Edit00.value,"UTF-8"),	//strURL("http://localhost:8080/step01/all" 직접 링크는 됨)
        			"",	        //strInDatasets,
        			" pagingData=pagingData, certificate=certificate",  //strOutDatasets 데이터셋에 바인딩 될 부분,
        			"",		//"deptno=10dname=총무부", //strArgument  이부분은 파라미터 ,
        			"fn_callback"     //strCallbackFunc[,bAsync[,nDataType[,bCompress]]]
        		);
        		this.fn_callback = function(svcID, errCD, errMSG){
        			let ret = (errMSG=="FAILED" || svcID != "farm") ? "error" : "success";
        			if(ret=="error")
        				this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);

        		};
        	}

        };





        this.Edit00_onkeydown = function(obj,e)
        {
        	if(e.keycode ===13)
        	{
        		if(this.Combo01.value != undefined){
        			this.transaction(
        				"farm",	//strSvcID,
        				"farm::getSearchList.do?"+this.Combo01.value+"="+encodeURI(this.Edit00.value,"UTF-8"),	//strURL("http://localhost:8080/step01/all" 직접 링크는 됨)
        				"",	        //strInDatasets,
        				" pagingData=pagingData, certificate=certificate",  //strOutDatasets 데이터셋에 바인딩 될 부분,
        				"",		//"deptno=10dname=총무부", //strArgument  이부분은 파라미터 ,
        				"fn_callback"     //strCallbackFunc[,bAsync[,nDataType[,bCompress]]]
        			);
        			this.fn_callback = function(svcID, errCD, errMSG){
        				let ret = (errMSG=="FAILED" || svcID != "farm") ? "error" : "success";
        				if(ret=="error")
        					this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);

        			};
        		}
        	}
        };

        this.Button03_onclick = function(obj,e)
        {
        	if(this.Combo00 != undefined){
        		this.transaction(
        					"farm",	//strSvcID,
        					"farm::smartApprove.do?id="+this.Edit01_00.text+"&devicekey="+this.Combo00.value+"&startDate="+this.Calendar00.value+"&dueDate="+this.Calendar01.value+"&applyDate="+this.Calendar00_00_00.value+"&approveDate="+this.Calendar00_01_00.value,	//strURL("http://localhost:8080/step01/all" 직접 링크는 됨)
        					"",	        //strInDatasets,
        					"pagingData=pagingData, certificate=certificate",  //strOutDatasets 데이터셋에 바인딩 될 부분,
        					"",		//"deptno=10dname=총무부", //strArgument  이부분은 파라미터 ,
        					"fn_callback"     //strCallbackFunc[,bAsync[,nDataType[,bCompress]]]
        				);
        				this.fn_callback = function(svcID, errCD, errMSG){
        					let ret = (errMSG=="FAILED" || svcID != "farm") ? "error" : "success";
        					if(ret=="error")
        						this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);

        				};
        		this.work01_onload();
        	}
        };

        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload",this.work01_onload,this);
            this.addEventHandler("oninit",this.work01_oninit,this);
            this.addEventHandler("onactivate",this.work01_onactivate,this);
            this.Static00.addEventHandler("onclick",this.Static00_onclick,this);
            this.Tab00.Tabpage1.form.Grid00.addEventHandler("oncelldblclick",this.Tab00_Tabpage1_Grid00_oncelldblclick,this);
            this.Tab00.Tabpage1.form.Static00.addEventHandler("onclick",this.Tab00_Tabpage1_Static00_onclick,this);
            this.Tab00.Tabpage1.form.Div00.addEventHandler("onsize",this.Tab00_Tabpage1_Div00_onsize,this);
            this.Tab00.Tabpage1.form.Div00.form.Static00.addEventHandler("onclick",this.Tab00_Tabpage1_Div00_Static00_onclick,this);
            this.Tab00.Tabpage1.form.Div00.form.Edit00.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.Static01.addEventHandler("onclick",this.Static01_onclick,this);
            this.Static05.addEventHandler("onclick",this.Static05_onclick,this);
            this.Combo00.addEventHandler("onitemchanged",this.Combo00_onitemchanged,this);
            this.Button03.addEventHandler("onclick",this.Button03_onclick,this);
            this.Button04.addEventHandler("onclick",this.Button04_onclick,this);
            this.Static05_00_00_00.addEventHandler("onclick",this.Static05_00_onclick,this);
            this.Calendar00_00_00.addEventHandler("onchanged",this.Calendar00_00_00_onchanged,this);
            this.Combo01.addEventHandler("onitemchanged",this.Combo01_onitemchanged,this);
            this.Edit00.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.Edit00.addEventHandler("onkeydown",this.Edit00_onkeydown,this);
            this.Button00.addEventHandler("onclick",this.Button00_onclick,this);
        };

        this.loadIncludeScript("work01.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
