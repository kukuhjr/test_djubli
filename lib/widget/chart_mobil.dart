import '/change_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class ChartMobil extends StatefulWidget {
  const ChartMobil({Key? key}) : super(key: key);

  @override
  _ChartMobilState createState() => _ChartMobilState();
}

class _ChartMobilState extends State<ChartMobil> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeState>(
      builder: (context, data, _) {
        var dataMobil = data.dataTransaksi;
        var select = data.dataIndex;

        List<dynamic> dataSeries = [];
        // Data di chart
        dataSeries.addAll(dataMobil.map((val) => [
              '"${val.convertMonthYear}"',
              val.harga,
              '"${val.warna}"',
              '"${val.convertTime}"'
            ]));

        return Echarts(
          option: '''
          {
            tooltip: {
              triggerOn: "click",
              alwaysShowContent: true,
              formatter: function(param){
                var value = param.value;
                return 'Tanggal: ' + value[3] + '<br>'
                      + 'Harga: Rp. ' + value[1] + ' Jt<br>'
                      + 'Warna: ' + value[2] + '<br>';
              },
            },
            grid: {
              left: "auto",
              right: "15%",
              top: "15%",
              bottom: "5%",
              containLabel: true,
            },
            xAxis: {
              name: 'Waktu',
              type: 'category',
              splitLine: { show: false },
              axisTick: { alignWithLabel: true },
              nameTextStyle: { 
                fontWeight: "bold"
              },
            },
            yAxis: {
              name: 'Harga',
              type: "value",
              axisLabel: {
                formatter: "{value} Jt"
              },
              splitLine: { show: false },
              nameTextStyle: { fontWeight: "bold" },
              axisLine: { show: true },
            },
            series: [
              {
                symbolSize: 20,
                type: 'scatter',
                data: $dataSeries,
                itemStyle: {
                  color: function(params){
                    if(params.dataIndex == $select){
                      return '#118c36';
                    }else{
                      return '#c7c91c';
                    }
                  },
                },
                select: {
                  itemStyle: {
                    color: '#118c36'
                  },
                },
              }
            ],
          }
        ''',
          extraScript: '''
          chart.on('click', (params) => {
            if(params.componentType === 'series') {
              var id = params.dataIndex; 
              Messager.postMessage(id);
            }
          });
        ''',
          onMessage: (message) {
            data.updateSelectIndex(message);
            data.changeSlider(int.parse(message));
          },
        );
      },
    );
  }
}
