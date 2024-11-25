

    var app = angular.module("myApp", []);
    app.controller("myCtrl", function ($scope, $http) {
        $scope.festivals = [];
    $scope.classics = [];
            const getCurrentMonthIndex = () => new Date().getMonth() + 1;

    function getCurrentMonth() {
                const monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
    ];
    const currentMonthIndex = new Date().getMonth();
    return monthNames[currentMonthIndex];
            }

    let baseUrl = "/";
    const id = getCurrentMonthIndex();
    $scope.month = getCurrentMonth();

    // Fetch Festivals 
    $http({
        method: "POST",
    url: `${baseUrl}Template/GetFestivalByMonthID?id=12`,
    headers: {"Content-Type": "application/json" }
            }).then(
    function (response) {
                    if (response.data && response.data.success) {
        $scope.festivals = response.data.FestivalList;

                    }
                },
    function (error) {
        console.error("Error fetching festivals:", error);
                }
    );

    // Fetch Classics
    $http({
        method: "POST",
    url: `${baseUrl}Template/GetClassicByDefault`,
    headers: {"Content-Type": "application/json" }
            }).then(
    function (response) {
                    if (response.data && response.data.success) {
        $scope.classics = response.data.ClassicList;
                    }
                },
    function (error) {
        console.log("Error fetching classics:", error);
                }
    );

  

    $scope.createNow = function (val, id) {

        console.log(val);
        window.location.href = `/choicePage.html?id=${id}&val=${val}`;

            };
        const nameMap = {
            "Welcome": "Welcome",
            "AllTheBest": "All The Best",
            "Birthday": "Birthday",
            "WeddingAnniversary": "Wedding Anniversary",
            "workanniversary": "Work Anniversary",
            "Congratulations": "Congratulations",
            "WorldCancerDay": "World Cancer Day",
            "worldTuberculosisday": "World Tuberculosis Day",
            "worldNurseDay": "World Nurse Day",
            "worldBloodDonerDay": "World Blood Doner Day",
            "NationalDoctor'sDay": "National Doctor's Day",
            "worldHealthDay": "World Health Day",
            "ThankYou": "Thank You",
            "HappyNewYear": "Happy New Year",
            "MerryChristmas": "Merry Christmas"
        };

        $scope.getProperName = function (classicName) {
            return nameMap[classicName] || classicName;
        };

    });
   

    function showContent(tabName) {
            var contents = document.querySelectorAll(".tab-content");
            contents.forEach((content) => {
        content.classList.remove("active");
            });

    var tabs = document.querySelectorAll(".tab");
            tabs.forEach((tab) => {
        tab.classList.remove("active");
            });

    document.getElementById(tabName).classList.add("active");

          event.target.classList.add("active");

    }
