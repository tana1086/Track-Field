import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto";


export default class extends Controller {
  static targets = [ "form", "event", "eventDetail", "chart" ];

  connect(){
    this.myChart = null;
    console.log(this.chartTarget);
  }

  changeDetail(event){
    const eventCategory = event.target.value;
    console.log("選ばれたカテゴリー:", eventCategory)

    let options = [];
    if (eventCategory === "短距離"){
        options = [ "種目を選択してください", "m_100", "m_200", "m_400", "m_100m", "m_110H", "m_400H" ];
    } else if (eventCategory === "中長距離"){
        options = [ "種目を選択してください", "m_800", "m_1500", "m_3000", "m_5000", "m_10000", "m_3000sc" ];
    } else if (eventCategory === "跳躍"){
        options = [ "種目を選択してください", "long_jump", "triple_jump", "high_jump", "pole_vault" ];
    }else if(eventCategory === "投てき"){
        options = [ "種目を選択してください", "shot_put", "discus_throw", "javelin_throw", "hammer_throw" ];
    }

    //表示を日本語化
    const eventNames = {
        m_100: "100m",
        m_200: "200m",
        m_400: "400m",
        m_100m: "100mH",
        m_110H: "110mH",
        m_400H: "400mH",
        m_800: "800m",
        m_1500: "1500m",
        m_3000: "3000m",
        m_5000: "5000m",
        m_10000: "10000m",
        m_3000sc: "3000mSC",
        long_jump: "走り幅跳び",
        triple_jump: "三段跳び",
        high_jump: "走り高跳び",
        pole_vault: "棒高跳び",
        shot_put: "砲丸投げ",
        discus_throw: "円盤投げ",
        javelin_throw: "やり投げ",
        hammer_throw: "ハンマー投げ"
      };

    this.eventDetailTarget.innerHTML = '';

    options.forEach(option => {
      const opt = document.createElement("option");
      opt.value = option;
      opt.textContent = eventNames[option] || option;
      this.eventDetailTarget.appendChild(opt);
    });
  }

  updateChart(){
    const eventCategory = this.eventTarget.value;
    const eventCategoryDetail = this.eventDetailTarget.value;
    

    fetch(`/profiles/fetch_data?eventCategory=${eventCategory}&eventCategoryDetail=${eventCategoryDetail}`)
      .then(response => response.json())
      .then(data => {
        let dates = data.results.map(item => item[0])
        let records = data.results.map(item => item[1])

        console.log("日付:", dates);
        console.log("記録:",records);

        const ctx = this.chartTarget.getContext('2d');
        if(this.myChart){
          this.myChart.destroy()
        }

        this.myChart = new Chart(ctx, {
          type: 'line',
          data:{
            labels: dates,
            datasets: [{
              label: '記録',
              data: records,
              borderColor: 'rgb(75, 192, 192)',
              fill: false
            }]
          },
          options: {
            responsive: true,
            scales: {
              x:{
                title: {
                  display: true,
                    text: '開催日',
                    font: {
                      size: 18
                    }
                }
              },
              y: {
                title:{
                  display: true,
                  text: '記録',
                  font: {
                      size: 20
                  }
                }
              }
            }
          }
        });
    })
      .catch(error => console.error("データ取得エラー:", error));
  }
}