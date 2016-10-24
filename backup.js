app.controller('main', function ($scope, $ionicModal, localStorageService) { //store the entities name in a variable 
  var taskData = 'task';

  //initialize the tasks scope with empty array
  $scope.tasks = [];

  //initialize the task scope with empty object
  $scope.task = {};

  //configure the ionic modal before use
  $ionicModal.fromTemplateUrl('new-task-modal.html', {
      scope: $scope,
      animation: 'slide-in-up'
  }).then(function (modal) {
      $scope.newTaskModal = modal;
  });

  $scope.getTasks = function () {
    //fetches task from local storage
    if (typeof taskData !== "undefined" && taskData !== undefined && localStorageService.get(taskData)) {
        $scope.tasks = localStorageService.get(taskData);
    } else {
        $scope.tasks = [];
    }
  };
  $scope.createTask = function () {
    //creates a new task
    $scope.tasks.push($scope.task);
    localStorageService.set(taskData, $scope.tasks);
    $scope.task = {};
    //close new task modal
    $scope.newTaskModal.hide();
  };
  $scope.removeTask = function (index) {
    $scope.tasks.splice(index, 1);
    localStorageService.set(taskData, $scope.tasks);
  };
  $scope.completeTask = function (index) {
    if (index !== -1) {
      $scope.tasks[index].completed = true; 
    }   

    localStorageService.set(taskData, $scope.tasks);
  };

  $scope.openTaskModal = function () {
    $scope.newTaskModal.show();
  };

  $scope.closeTaskModal = function () {
    $scope.newTaskModal.hide();
  };
});

app.controller('LoginCtrl', function($scope){
  $scope.data = {};
 
  $scope.data = {};
 
  $scope.login = function() {
      LoginService.loginUser($scope.data.username, $scope.data.password).success(function(data) {
          $state.go('tab.dash');
      }).error(function(data) {
          var alertPopup = $ionicPopup.alert({
              title: 'Login failed!',
              template: 'Please check your credentials!'
          });
      });
  };
});

app.state('login', {
    url: '/login',
    templateUrl: 'templates/login.html'
});

$urlRouterProvider.otherwise('/login');