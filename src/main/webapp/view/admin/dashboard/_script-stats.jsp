<script>
	var datas;
	var labels;
	
	function displayStats(element) {
		datas = [];
		labels = [];
		
		$.ajax({
			type: 'GET',
			url: '<c:url value='/user/getStats'/>',
			
			error: function() {
				alert("error");
			},
			success: function(result) {
				for(var i = 0; i < result.length; i++) {
					datas.push(result[i].count);
					labels.push(result[i].day);
				}
				
				$(element).highcharts({
					chart: {
			            type: 'areaspline'
			        },
			        title: {
			            text: ''
			        },
			        legend: {
			            layout: 'vertical',
			            align: 'left',
			            verticalAlign: 'top',
			            x: 150,
			            y: 100,
			            floating: true,
			            borderWidth: 1,
			            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
			        },
			        xAxis: {
			            categories: labels
			        },
			        yAxis: {
			            title: {
			                text: ''
			            }
			        },
			        tooltip: {
			            shared: true,
			            valueSuffix: ''
			        },
			        credits: {
			            enabled: false
			        },
			        plotOptions: {
			            areaspline: {
			                fillOpacity: 0.5
			            }
			        },
			        series: [{
			            name: '<spring:message code='admin.view.stats.seriesName'/>',
			            data: datas
			        }]
			    });
			}
		});
	}

	displayStats('#stats');
	
</script>