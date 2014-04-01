angular.module('sand').controller 'studentsCtrl', # ($scope)
  const PASSING_GRADE = 75
  let SAMPLE_STUDENTS = ['Tim','Eric','Sarah','Jennifer']

  $scope.students := []

  let initStudents()
    $scope.students := SAMPLE_STUDENTS

  $scope.delete := # (student)
    let {students} = $scope
    students.splice students.indexOf(student), 1

  initStudents()
  