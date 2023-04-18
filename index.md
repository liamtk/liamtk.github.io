## Hi, my name is Liam :-)

I'm a Columbia [SIPA](https://www.sipa.columbia.edu/)-[QMSS](https://www.qmss.columbia.edu/) double Master's graduate and [Fulbright Scholar](https://www.fulbright.org.au/scholarships/anne-wexler-australian/) with deep interests in data science and quantitative applications to economic policy, international trade and financial markets.

- **Email**: [liam.k@columbia.edu](mailto:liam.k@columbia.edu)
- **LinkedIn**: [https://www.linkedin.com/in/liamtaykearney](https://www.linkedin.com/in/liamtaykearney)
- **Nationalities**: 🇦🇺 Australia - 🇮🇪 Ireland - 🇸🇬 Singapore
- **Languages**: English (native), Mandarin (fluent), Spanish (limited), Malay (basic)
- **Interests**: political economy, international finance, applied econometrics, data science, data visualization



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


### Qualifications

1. **Master of International Affairs** - International Finance & Economic Policy ([Columbia SIPA](https://www.sipa.columbia.edu/))
2. **Master of Arts** - Applied Data Science ([Columbia QMSS](https://www.qmss.columbia.edu/))
3. **Bachelor of Philosophy (Hons)** - Economics, Finance ([UWA](https://www.uwa.edu.au/study/courses/bachelor-of-philosophy))
4. **Diploma of Interpreting** - Chinese-English ([AIWT](https://www.aiwt.edu.au/courses/psp50916-diploma-of-interpreting-lote-english/))



<h3 onclick="toggleExperience()" style="cursor: pointer;">Experience ▼</h3>
<div id="experience" style="display: none;">
    <ul>
        <li><strong>University of Pennsylvania</strong> - Research Data Analyst (2022-present)</li>
        <li><strong>Citi Global Wealth</strong> - Grad. Consultant, Investment Research (Fall 2022)</li>
        <li><strong>KPMG Digital</strong> - Grad. Consultant, Data Science (Spring 2022)</li>
        <li><strong>Columbia SIPA</strong> - Research Assistant, Data Science & Public Policy (2021-22)</li>
        <li><strong>Columbia SIPA</strong> - Teaching Assistant, R for Policy Research (2021-22)</li>
        <li><strong>Australian Embassy, Beijing</strong> - Public Affairs Assistant (2018)</li>
        <li><strong>UN Capital Development Fund</strong> - Junior Research Analyst (2017)</li>
        <li><strong>Internships:</strong>
            <ul>
                <li>Asia Society Policy Institute (Washington, 2022)</li>
                <li>KPMG Global China Practice (Beijing, 2018)</li>
                <li>Westpac Institutional Bank (Sydney, 2017)</li>
            </ul>
        </li>
    </ul>
</div>

<script>
    function toggleExperience() {
        var experience = document.getElementById("experience");
        var experienceToggle = document.querySelector("h3[onclick='toggleExperience()']");
        if (experience.style.display === "none") {
            experience.style.display = "block";
            experienceToggle.innerHTML = "Experience ▼";
        } else {
            experience.style.display = "none";
            experienceToggle.innerHTML = "Experience ►";
        }
    }
</script>



### Technical Skills

I am most comfortable/skilled in data mining with **R**, **Python**, **SQL**, **Tableau** and  **Excel**, with experience applying them across a variety of use cases and subject domains. I also have proficiency in the following:

<table style="width: 100%; border-collapse: collapse;">
  <tr style="line-height: 1.4; background-color: #d0d0d0;">
    <th style="text-align: left; padding: 4px;">Skill area</th>
    <th style="text-align: left; padding: 4px;">Technologies</th>
  </tr>
  <tr style="line-height: 1.4; background-color: #ffffff;">
    <td style="padding: 4px;">Data Visualization</td>
    <td style="padding: 4px;">Tableau, Shiny, D3, Dash</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #f0f0f0;">
    <td style="padding: 4px;">Databases</td>
    <td style="padding: 4px;">MySQL, MongoDB, Neo4j, MS Access</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #ffffff;">
    <td style="padding: 4px;">Geospatial</td>
    <td style="padding: 4px;">QGIS, Leaflet, GeoPandas, GeoDa</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #f0f0f0;">
    <td style="padding: 4px;">Machine Learning</td>
    <td style="padding: 4px;">Scikit-learn, TensorFlow, PyTorch</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #ffffff;">
    <td style="padding: 4px;">Econometrics & Statistics</td>
    <td style="padding: 4px;">R, Stata, EViews</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #f0f0f0;">
    <td style="padding: 4px;">Cloud Services</td>
    <td style="padding: 4px;">AWS, GCP, Snowflake</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #ffffff;">
    <td style="padding: 4px;">Big Data & Workflow</td>
    <td style="padding: 4px;">Databricks, PySpark, Airflow</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #f0f0f0;">
    <td style="padding: 4px;">Web Development</td>
    <td style="padding: 4px;">HTML, CSS, JS, Flask</td>
  </tr>
  <tr style="line-height: 1.4; background-color: #ffffff;">
    <td style="padding: 4px;">Version Control</td>
    <td style="padding: 4px;">Git, Github</td>
  </tr>
</table>


<h3 onclick="toggleHobbies()" style="cursor: pointer;">Hobbies ▼</h3>
<div id="hobbies" style="display: none;">
    <ul>
        <li><strong>Cooking</strong> - from my <a href="pages/peranakan.md">Peranakan</a> heritage (ongoing project)</li>
        <li><strong>Eating</strong> - here are some <a href="pages/food.md">favourite destinations</a> in NY, SG and Perth</li>
        <li><strong>Travelling</strong> - here are some <a href="pages/places.md">places</a> I've visited on the journey so far</li>
        <li><strong>Jazz</strong> - am an aspiring (amateur) jazz piano player</li>
    </ul>
</div>

<script>
    function toggleHobbies() {
        var hobbies = document.getElementById("hobbies");
        var hobbiesToggle = document.querySelector("h3[onclick='toggleHobbies()']");
        if (hobbies.style.display === "none") {
            hobbies.style.display = "block";
            hobbiesToggle.innerHTML = "Hobbies ▼";
        } else {
            hobbies.style.display = "none";
            hobbiesToggle.innerHTML = "Hobbies ►";
        }
    }
</script>
