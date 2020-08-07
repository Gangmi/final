(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("fm_top");
            this.set_titletext("New Form");
            if (Form == this.constructor)
            {
                this._setFormPosition(1260,65);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("loginId", this);
            obj._setContents("<ColumnInfo><Column id=\"name\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);
            
            // UI Components Initialize
            obj = new Static("Static00","0","0",null,"24","0",null,null,null,null,null,this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_top_bg01");
            this.addChild(obj.name, obj);

            obj = new Static("Static01","0","24",null,"41","0",null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_cssclass("sta_top_bg02");
            obj.set_text("");
            this.addChild(obj.name, obj);

            obj = new Static("Static02","0","24","160","41",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_cssclass("title");
            obj.set_text("여름지기");
            this.addChild(obj.name, obj);

            obj = new Static("Static03","10","0","210","24",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            obj.set_text("Hello! Hong Gil Dong");
            obj.set_cssclass("sta_top_textWht");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","",1260,65,this,function(p){});
            obj.set_mobileorientation("landscape");
            this.addLayout(obj.name, obj);
            
            // BindItem Information
            obj = new BindItem("item0","Static03","text","loginId","name");
            this.addChild(obj.name, obj);
            obj.bind();
        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("frmTop.xfdl", function() {
        this.fm_top_onload = function(obj,e)
        {
        	this.transaction(
        		"farm",	//strSvcID,
        		"farm::getLoginId.do",	//strURL("http://localhost:8080/step01/all" 직접 링크는 됨)
        		"",	        //strInDatasets,
        		" loginId=loginId ",  //strOutDatasets 데이터셋에 바인딩 될 부분,
        		"",		//"deptno=10dname=총무부", //strArgument  이부분은 파라미터 ,
        		"fn_callback"     //strCallbackFunc[,bAsync[,nDataType[,bCompress]]]
        	);
        	this.fn_callback = function(svcID, errCD, errMSG){
        		let ret = (errMSG=="FAILED" || svcID != "farm") ? "error" : "success";
        		if(ret=="error")
        			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	};
        };

        this.Static02_onclick = function(obj,e)
        {
        	location.href = "/index.do";
        };

        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload",this.fm_top_onload,this);
            this.Static02.addEventHandler("onclick",this.Static02_onclick,this);
            this.Static03.addEventHandler("onclick",this.Static03_onclick,this);
        };

        this.loadIncludeScript("frmTop.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
