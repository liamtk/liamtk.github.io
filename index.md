## Hi, my name is Liam :-)

I'm a Columbia [SIPA](https://www.sipa.columbia.edu/)-[QMSS](https://www.qmss.columbia.edu/) Dual Master's graduate and [Fulbright Scholar](https://www.fulbright.org.au/scholarships/anne-wexler-australian/) with deep interests in data science and quantitative applications to economic and public policy.

- **Email**: [liam.k@columbia.edu](mailto:liam.k@columbia.edu)
- **LinkedIn**: [https://www.linkedin.com/in/liamtaykearney](https://www.linkedin.com/in/liamtaykearney)
- **Interests**: political economy, social and economic inequality, applied statistics, data science, data visualization
- **Nationalities**: Australian-Singaporean-Irish
- **Languages**: English (native), Chinese (fluent), Spanish (basic)



### Projects

<head>
    <style>
        .tab-btn.active {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<div class="tabs">
  <button id="defaultOpen" class="tab-btn active" onclick="openTab(event, 'Data science and visualization')">Data science and visualization</button>
  <button class="tab-btn" onclick="openTab(event, 'Applied econometrics')">Applied econometrics</button>
  <button class="tab-btn" onclick="openTab(event, 'Political economy')">Political economy</button>
</div>
<div id="Data science and visualization" class="tab-content" style="min-height:175px; margin-top: 20px; background-color: #f2f8ff; margin-bottom:20px;">
  <h4><u>Data science and visualization</u></h4>
  <ol>
    <li><code>imfpy</code> - an intuitive API client for the IMF - <a href="pages/imfpy.html">python package</a></li>
    <li>Understanding COVID-19 misinformation - <a href="pages/covid_misinfo.html">NLP resources, Tableau visualizations</a></li>
    <li>Understanding far-right networks using Wikipedia data - <a href="pages/wikihate.html">paper</a></li>
    <li>Flood classification using satellite data - <a href="pages/floodai.html">presentation</a></li>
  </ol>
</div>
<div id="Applied econometrics" class="tab-content" style="min-height:175px; margin-top: 20px; background-color: #f8fbfb; margin-bottom:20px;">
    <h4><u>Applied econometrics</u></h4>
  <ol>
<li>New measurements of inequalities in public transit accessibility - <a href="https://ltk2118.shinyapps.io/nyc-transit/">Shiny app</a></li>
    <li>Time series analysis of Australian inward FDI - <a href="pages/fdi.html">paper</a></li>
    <li>Empirical analysis of municipal broadband restrictions - <a href="pages/broadband.html">policy memo</a></li>
  </ol>
</div>
<div id="Political economy" class="tab-content" style="min-height:175px; margin-top: 20px; background-color: #fffafa; margin-bottom:20px;">
    <h4><u>Political economy</u></h4>
  <ol>
    <li>Congressional FTA voting and import competition - <a href="pages/congress_trade.html">policy brief</a></li>
    <li>Analyzing partisanship in America through language - <a href="https://newsapp-for-newsroom.shinyapps.io/partisanship-in-america/">Shiny app</a></li>
    <li>Private sector participation in Europe's pivot away from Russian gas - <a href="pages/citi.html">report</a></li>
  </ol>
</div>
<script>
  function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tab-btn");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
  }
  // Get the element with id="defaultOpen" and click on it
  document.getElementById("defaultOpen").click();
</script>









### Experience

* **Research Analyst - Geospatial Data** - University of Pennsylvania (2022-present)
* **Graduate Consultant, Data Analysis** - Citi Global Wealth (2022) and KPMG Digital Lighthouse (2022)
* **Research Assistant, Data Science and Public Policy** - Columbia SIPA - Sharyn O'Halloran (2021-22)
* **Teaching Assistant, R for Policy Analysis** - Columbia SIPA (2021-22)
* **Public Affairs Assistant** - Australian Embassy, Beijing (2019)
* **Junior Analyst** - United Nations Capital Development Fund (2017)
* **Internships** - Asia Society Policy Institute (Washington, 2022), KPMG Global China Practice (Beijing, 2018), Westpac Treasury (Sydney, 2017)



### Qualifications

1. **Master of International Affairs** - Economic Policy ([Columbia SIPA](https://www.sipa.columbia.edu/))
2. **Master of Arts** - Applied Data Science ([Columbia QMSS](https://www.qmss.columbia.edu/))
3. **Bachelor of Philosophy (Hons)** - Economics, Finance ([UWA](https://www.uwa.edu.au/study/courses/bachelor-of-philosophy))
4. **Diploma of Interpreting** - Chinese-English ([AIWT](https://www.aiwt.edu.au/courses/psp50916-diploma-of-interpreting-lote-english/))



### Technical Skills

I am most comfortable/skilled in data mining with **R**, **Python**, **SQL** and **Excel**, with experience applying them across a variety of use cases. I also have solid proficiency in the following:

- **Data Visualization**: Tableau, Shiny, D3, Dash
- **Databases**: MySQL, MongoDB, Neo4j
- **Geospatial**: QGIS, Leaflet, GeoPandas, GeoDa
- **Machine Learning**: Sklearn, Tensorflow, PyTorch
- **Econometrics**: R, Stata, EViews
- **NLP**: NTLK, SpaCy, Quanteda
- **Cloud**: AWS, GCP, Snowflake
- **Workflow**: Databricks, PySpark, Airflow
- **Web Dev**: HTML, CSS, JS
- **Version control**: Git, Github, DVC



### Hobbies

* **Cooking** - from my [Peranakan](pages/peranakan.md) heritage
* **Eating** - here are some [favourite destinations](pages/food.md)
* **Travelling** - here are some [places](pages/places.md) I've visited
* **Jazz** - am an aspiring (amateur) jazz pianist
