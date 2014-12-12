(function(){
  'use strict';

  angular.module('hapiest', ['ui.router'])
  .config(['$stateProvider', '$urlRouterProvider', '$httpProvider', function($stateProvider, $urlRouterProvider, $httpProvider){
    $urlRouterProvider.otherwise('/');

    $stateProvider
    .state('home',     {url:'/',         templateUrl:'/views/home/home.html'})
    .state('register', {url:'/register', templateUrl:'/views/users/users.html', controller:'UsersCtrl'})
    .state('login',    {url:'/login',    templateUrl:'/views/users/users.html', controller:'UsersCtrl'})
    .state('logout',   {url:'/logout',   template:'',                           controller:'UsersCtrl'});

    $httpProvider.interceptors.push('HttpInterceptor');
  }])
  .run(['User', function(User){}]);
})();

