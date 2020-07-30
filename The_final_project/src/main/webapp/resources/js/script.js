$(function () {

  class GaugeChart {
    constructor(element, params) {
      this._element = element;
      this._initialValue = params.initialValue;
      this._higherValue = params.higherValue;
      this._title = params.title;
      this._subtitle = params.subtitle;
      this._tick = params.tick;
      this._startValue = params.startValue;
    }
      
    _buildConfig() {
      let element = this._element;

      return {
        value: this._initialValue,
        valueIndicator: {
          color: '#fff' },

        geometry: {
          startAngle: 180,
          endAngle: 360 },

        scale: {
          startValue: this._startValue,
          endValue: this._higherValue,
          customTicks: this._tick,
          tick: {
            length: 9 },

          label: {
            font: {
              color: '#87959f',
              size: 9,
              family: '"Open Sans", sans-serif' } } },



        title: {
          verticalAlignment: 'bottom',
          text: this._title,
          font: {
            family: '"Open Sans", sans-serif',
            color: '#fff',
            size: 10 },

          subtitle: {
            text: this._subtitle,
            font: {
              family: '"Open Sans", sans-serif',
              color: '#fff',
              weight: 700,
              size: 28 } } },



        onInitialized: function () {
          let currentGauge = $(element);
          let circle = currentGauge.find('.dxg-spindle-hole').clone();
          let border = currentGauge.find('.dxg-spindle-border').clone();

          currentGauge.find('.dxg-title text').first().attr('y', 48);
          currentGauge.find('.dxg-title text').last().attr('y', 28);
          currentGauge.find('.dxg-value-indicator').append(border, circle);
        } };


    }
      
    init() {
      $(this._element).dxCircularGauge(this._buildConfig());
    }}


  $(document).ready(function () {

    $('#temperature').each(function (index, item) {
      let params = {
        initialValue: 10,
        higherValue: 50,
        title: '기온',
        subtitle: '10 ºC',
        tick: [-30,-20,-10,0, 10,20, 30, 40,50],
        startValue: -30
      };
      let gauge = new GaugeChart(item, params);
      gauge.init();
    });
      
    $('#humidity').each(function (index, item) {
      let params = {
        initialValue: 30,
        higherValue: 100,
        title:'습도',
        subtitle:'30 %',
        tick: [0,10,20,30,40,50,60,70,80,90,100],
        startValue: 0
      };
      let gauge = new GaugeChart(item, params);
      gauge.init();
    });
      
    $('#soil_humidity').each(function (index, item) {
      let params = {
        initialValue: 10,
        higherValue: 100,
        title: '토양 습도',
        subtitle: '10 %',
        tick: [0,10,20,30,40,50,60,70,80,90,100],
        startValue: 0
      };
      let gauge = new GaugeChart(item, params);
      gauge.init();
    });
    
    setInterval(function(){
    	$.ajax({
    		type:"GET",
    		url:"requestData.do",
    		datatype:"json",
    		contentType:'application/json;charset=UTF-8',
    		success:function(data){
    			jsonData = JSON.parse(data);
    			$('#temperature').each(function (index, item) {
			        let gauge = $(item).dxCircularGauge('instance');
			        let randomNum = parseFloat(jsonData.temperature);
			        let gaugeElement = $(gauge._$element[0]);
			
			        gaugeElement.find('.dxg-title text').last().html(`${randomNum} ºC`);
			        gauge.value(randomNum);
      			});
      			
      			$('#humidity').each(function (index, item) {
			        let gauge = $(item).dxCircularGauge('instance');
			        let randomNum = parseFloat(jsonData.humidity);
			        let gaugeElement = $(gauge._$element[0]);
			
			        gaugeElement.find('.dxg-title text').last().html(`${randomNum} %`);
			        gauge.value(randomNum);
      			});
      			
      			$('#soil_humidity').each(function (index, item) {
			        let gauge = $(item).dxCircularGauge('instance');
			        let randomNum = parseFloat(jsonData.soil_humidity);
			        let gaugeElement = $(gauge._$element[0]);
			
			        gaugeElement.find('.dxg-title text').last().html(`${randomNum} %`);
			        gauge.value(randomNum);
      			});
    		}
    	})
    },1000);
 			    		  
	$("#givewater").click(function(){
		alert('test');
		$.ajax({
    		type:"GET",
    		url:"givewater.do",
    		datatype:"json",
    		contentType:'application/json;charset=UTF-8',
    		success:function(data){
    			alert("물 주는중");
    		}
    	});
    });

    $('#random').click(function () {

      $('.gauge').each(function (index, item) {
        let gauge = $(item).dxCircularGauge('instance');
        let randomNum = Math.round(Math.random() * 1560);
        let gaugeElement = $(gauge._$element[0]);

        gaugeElement.find('.dxg-title text').last().html(`${randomNum} ºC`);
        gauge.value(randomNum);
      });
    });
  });

});