% lists defined for testing
list1([1,2,3]).
list2([2,5,10,8,6,15,13]).
list3([1]).
list4([]).
list5([2,5]).
list6([3,5,7,8]).
list7([5,2,3]).
list8([4,8,2]).
list9([4,8,9,9,7]).

% get left child info
% supply Array and ParentIndex and receive LeftIndex and LeftValue
leftchild(Array, ParentIndex, LeftIndex, LeftVal) :-
  % do the math to calculate index of left child
  LeftIndex is ParentIndex * 2 + 1,
  (
    % try to grab left child value treating list as 0-based
    nth0(LeftIndex, Array, LeftVal),
    
    % if grabbing child value was successful, don't backtrack
    ! 
    
    % OR used in case LeftIndex was outside bounds of list
    ;
    
    % if that is the case, set LeftVal to maximum integer value
    % this is so it will pass any checks against parent value.
    current_prolog_flag(max_tagged_integer, LeftVal)
  ).

% get left child info
% supply Array and ParentIndex and receive RightIndex and RightValue
rightchild(Array, ParentIndex, RightIndex, RightVal) :-
  % do the math to calculate index of left child
  RightIndex is ParentIndex * 2 + 2,
  (
    % try to grab right child value treating list as 0-based
    nth0(RightIndex, Array, RightVal),
    
    % if grabbing child value was successful, don't backtrack
    ! 
    
    % OR used in case RightIndex was outside bounds of list
    ;
    
    % if that is the case, set RightVal to maximum integer value
    % this is so it will pass any checks against parent value.
    current_prolog_flag(max_tagged_integer, RightVal)
  ).
