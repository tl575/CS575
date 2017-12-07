var helloAjaxApp = angular.module("myApp", []);

helloAjaxApp.controller("MyController", [ '$scope', '$http', function($scope, $http) {


    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8";


    $scope.sendPost = function(chain) {
        var bc = "blockchain" + chain;
        var bcn = "blockchain" + chain+"nonce";
        var bcd = "blockchain" + chain + "data";
        var hashnum = "hashvalue"+chain;
        var parenthash = "parenthash" + chain;
        var nextParent = "parenthash" + String.fromCharCode(chain.charCodeAt(0) + 1);


        $http({
            url : 'getHash',
            method : "POST",
            params : {
                'blockchain1' : $scope.$eval(bc),
                'blockchain1nonce' : $scope.$eval(bcn),
                'blockchain1data' : $scope.$eval(bcd),
                'parenthash' : $scope.$eval(parenthash)
            }
        }).then(function(response) {
            $scope[hashnum] = response.data;
            $scope[nextParent] = response.data;


        }, function(response) {
            //fail case
            $scope.message = response;


        });

    };

    $scope.$watch('parenthash2', function() {
        $scope.sendPost('2');
        $scope.sendPost('3');

    });
    $scope.$watch('parenthash3', function() {
        $scope.sendPost('3');

    });

    try{
        $scope.$watch('hashvalue1',function(){
            if ($scope.hashvalue1[0] == '0' && $scope.hashvalue1[1] == '0' && $scope.hashvalue1[2] == '0'
                && $scope.hashvalue1[3] == '0'){
                $scope.state1 = {"background" : "rgb(223, 240, 216)"};
            }
            else{
                $scope.state1 = {"background" : "rgb(250, 220, 220)"};
            }
        });} catch(err){}

    try{
        $scope.$watch('hashvalue2',function(){
            if ($scope.hashvalue2[0] == '0' && $scope.hashvalue2[1] == '0' && $scope.hashvalue2[2] == '0'
                && $scope.hashvalue2[3] == '0'){
                $scope.state2 = {"background" : "rgb(223, 240, 216)"};
            }
            else{
                $scope.state2 = {"background" : "rgb(250, 220, 220)"};
            }
        });}catch(err){}
    try{
        $scope.$watch('hashvalue3',function(){
            if ($scope.hashvalue3[0] == '0' && $scope.hashvalue3[1] == '0' && $scope.hashvalue3[2] == '0'
                && $scope.hashvalue3[3] == '0'){
                $scope.state3 = {"background" : "rgb(223, 240, 216)"};
            }
            else{
                $scope.state3 = {"background" : "rgb(250, 220, 220)"};
            }
        });}catch(err){}




    $scope.Mine = function(chain) {
        var bc = "blockchain" + chain;
        var bcn = "blockchain" + chain+"nonce";
        var bcd = "blockchain" + chain + "data";
        var hashnum = "hashvalue"+chain;
        var parenthash = "hashvalue" + chain;
        var nextParent = "parenthash" + String.fromCharCode(chain.charCodeAt(0) + 1);
        console.log("mine " + chain);
        $http({
            url : 'javaminer',
            method : "POST",
            params : {
                'blockchain1' : $scope.$eval(bc),
                'blockchain1nonce' : $scope.$eval(bcn),
                'blockchain1data' : $scope.$eval(bcd),
                'hashvalue' : $scope.$eval(hashnum),
                'parenthash' : $scope.$eval(parenthash)
            },
        }).then(function(response) {

            var split_repose = response.data.split(" ");

            $scope[bcn] = split_repose[1].slice(0, -1);
            $scope[hashnum] = split_repose[0];
            $scope[nextParent] = split_repose[0];




        }, function(response) {
            //fail case
            $scope.message = response;

        });

    };


} ]);