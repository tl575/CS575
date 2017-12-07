<%--
  Created by IntelliJ IDEA.
  User: tristanleung
  Date: 12/3/17
  Time: 2:32 AM
  To change this template use File | Settings | File Templates.
  Project style was derived from https://anders.com/blockchain/

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-ng-app="myApp">

<head>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  <script src="js/main.js"></script>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<h1 align="Center">3 Blockchain Simulator</h1>
<div data-ng-controller="MyController" class="row row-horizontal" >



  <div class="col-xs-4" >
    <div id="block1chain1well" class="well " ng-style="state1" >
      <form class="form-horizontal">
        <div class="form-group">
          <label for="block1chain1number" class="col-sm-2 control-label">Block:</label>
          <div class="col-sm-10">
            <div class="input-group">
              <span class="input-group-addon">#</span>
              <input id="block1chain1number" ng-model="blockchain1" ng-value='1' type="integer" name="blockchain1" ng-init="blockchain1='1'" ng-keyup="sendPost('1')" class="form-control">
            </div>
          </div>
        </div> <!--block number-->
        <div class="form-group">
          <label for="block1chain1nonce" class="col-sm-2 control-label">
            Nonce:
          </label>
          <div class="col-sm-10">
            <input id="block1chain1nonce" class="form-control" ng-model="blockchain1nonce" name="blockchain1nonce" ng-init="blockchain1nonce='5274'" ng-keyup="sendPost('1')">
          </div>
        </div> <!--block nonce-->
        <div class="form-group">
          <label for="block1chain1data" class="col-sm-2 control-label">Data:</label>
          <div class="col-sm-10">
            <textarea id="block1chain1data" class="form-control" ng-model="blockchain1data" name="blockchain1data" ng-init="blockchain1data=''" ng-keyup="sendPost('1')"></textarea>
          </div>
        </div> <!--block data-->
        <div id="state" class="form-group">
          <label for="block1chain1previous" class="col-sm-2 control-label">
            Parent:
          </label>
          <div class="col-sm-10">
            <input id="block1chain1previous" type="text" value="0000000000000000000000000000000000000000000000000000000000000000" disabled class="form-control">
          </div>
        </div> <!--block parent-->
        <div id="state" class="form-group">
          <label for="block1chain1hash" class="col-sm-2 control-label">Hash:</label>
          <div class="col-sm-10">
            <input id="block1chain1hash" type="text" ng-model="hashvalue1" disabled class="form-control"  >
          </div>
        </div> <!--block hash-->
        <div class="form-group">
          <div class="col-sm-2">
            <i class="icon-spinner icon-spin icon-large"></i>
          </div>
          <div class="col-sm-10">
            <button id="block1chain1mineButton" ng-value="1" ng-click="Mine('1')" data-style="expand-right" class="btn btn-primary ladda-button">
              <span class="ladda-label">Mine</span>
            </button>
          </div>
        </div> <!--block button-->
      </form>
    </div>
  </div>



  <div class="col-xs-4" display="inline-block">
    <div id="block1chain1well" class="well" ng-style="state2">
      <form class="form-horizontal">
        <div class="form-group">
          <label for="block2chain2number" class="col-sm-2 control-label">Block:</label>
          <div class="col-sm-10">
            <div class="input-group">
              <span class="input-group-addon">#</span>
              <input id="block2chain2number" ng-model="blockchain2" type="integer" name="blockchain2" ng-init="blockchain2='2'" ng-keyup="sendPost('2')" class="form-control">
            </div>
          </div>
        </div> <!--block number-->
        <div class="form-group">
          <label for="block2chain2nonce" class="col-sm-2 control-label">
            Nonce:
          </label>
          <div class="col-sm-10">
            <input id="block2chain2nonce" class="form-control" ng-model="blockchain2nonce" name="blockchain2nonce" ng-init="blockchain2nonce='11316'" ng-keyup="sendPost('2')">
          </div>
        </div> <!--block nonce-->
        <div class="form-group">
          <label for="block2chain2data" class="col-sm-2 control-label">Data:</label>
          <div class="col-sm-10">
            <textarea id="block2chain2data" class="form-control" ng-model="blockchain2data" name="blockchain2data" ng-init="blockchain2data=''" ng-keyup="sendPost('2')"></textarea>
          </div>
        </div> <!--block data-->
        <div id="state" class="form-group">
          <label for="block2chain2previous" class="col-sm-2 control-label">
            Parent:
          </label>
          <div class="col-sm-10">
            <input id="block2chain2previous" ng-model="parenthash2" type="text" value="0000000000000000000000000000000000000000000000000000000000000000" disabled class="form-control">
          </div>
        </div> <!--block parent-->
        <div id="state" class="form-group">
          <label for="block1chain2hash" class="col-sm-2 control-label">Hash:</label>
          <div class="col-sm-10">
            <input id="block1chain2hash" type="text" ng-model="hashvalue2" disabled class="form-control" >
          </div>
        </div> <!--block hash-->
        <div class="form-group">
          <div class="col-sm-2">
            <i class="icon-spinner icon-spin icon-large"></i>
          </div>
          <div class="col-sm-10">
            <button id="block1chain1mineButton" ng-click="Mine('2')" data-style="expand-right" class="btn btn-primary ladda-button">
              <span class="ladda-label">Mine</span>
            </button>
          </div>
        </div> <!--block button-->
      </form>
    </div>
  </div>





  <div class="col-xs-4" display="inline-block" ng-init="loadchain()">
    <div id="block1chain1well" class="well" ng-style="state3">
      <form class="form-horizontal">
        <div class="form-group">
          <label for="block3chain3number" class="col-sm-2 control-label">Block:</label>
          <div class="col-sm-10">
            <div class="input-group">
              <span class="input-group-addon">#</span>
              <input id="block3chain3number" ng-model="blockchain3" type="integer" name="blockchain1" ng-init="blockchain3='3'" ng-keyup="sendPost('3')" class="form-control">
            </div>
          </div>
        </div> <!--block number-->
        <div class="form-group">
          <label for="block1chain1nonce" class="col-sm-2 control-label">
            Nonce:
          </label>
          <div class="col-sm-10">
            <input id="block1chain1nonce" class="form-control" ng-model="blockchain3nonce" name="blockchain1nonce" ng-init="blockchain1nonce='11316'" ng-keyup="sendPost('3')">
          </div>
        </div> <!--block nonce-->
        <div class="form-group">
          <label for="block1chain1data" class="col-sm-2 control-label">Data:</label>
          <div class="col-sm-10">
            <textarea id="block1chain1data" class="form-control" ng-model="blockchain3data" name="blockchain1data" ng-init="blockchain3data=''" ng-keyup="sendPost('3')"></textarea>
          </div>
        </div> <!--block data-->
        <div id="state" class="form-group">
          <label for="block1chain1previous" class="col-sm-2 control-label">
            Parent:
          </label>
          <div class="col-sm-10">
            <input id="block1chain1previous" ng-model="parenthash3" type="text" value="0000000000000000000000000000000000000000000000000000000000000000" disabled class="form-control">
          </div>
        </div> <!--block parent-->
        <div id="state" class="form-group">
          <label for="block3chain3hash" class="col-sm-2 control-label">Hash:</label>
          <div class="col-sm-10">
            <input id="block3chain3hash" type="text" ng-model="hashvalue3" disabled class="form-control" >
          </div>
        </div> <!--block hash-->
        <div class="form-group">
          <div class="col-sm-2">
            <i class="icon-spinner icon-spin icon-large"></i>
          </div>
          <div class="col-sm-10">
            <button id="block1chain1mineButton" ng-click="Mine('3')" data-style="expand-right" class="btn btn-primary ladda-button">
              <span class="ladda-label">Mine</span>
            </button>
          </div>
        </div> <!--block button-->
      </form>
    </div>
  </div>

</div>


</html>