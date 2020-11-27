# OOP

Learning Outcomes

Look through these now and then use them to test yourself after doing the assignment:

## Classes and Methods:

    1. What is an implicit return?

    2. What is a class?
    A Ruby class is used to organize and model objects with similar attributes and methods.

    3. When should you use a class?
    when it gets messy

4.  How do you create a class in your script file?
    class X
    ...
    end

5.  What is an instance of a class?

6.  What is the difference between the Pascal Case and snake_case styles of naming?
7.  How do you instantiate a class?
    class.new
8.  How do you set the state of your new instance?
    through settors
9.  What should be done in the #initialize method?
    define instance variables (ONE `@`).

10. What is a class method?
    `self.method`
    Class methods are methods we can call directly on the class itself, without having to instantiate any objects.

11. How is a class method different from an instance method?
    doesn't have to instantiate any objects

12. How are methods you already know like #count or #sort etc instance methods?
    it operates directly without you instantiating anything

13. What’s the difference between how you declare a class method vs an instance method?
    `def self.class_method`
    vs
    `def instance_method`

14. What’s the difference between how you call a class method vs an instance method?
    You must call `x = class.new` before `class.instance_method`. you can directly call `class.class_method`.

15. What is an instance variable?
    a variable that exists as long as the object instance exists. syntax: `@var`
16. What’s the difference between an instance variable and a ‘regular’ variable?
    it exists with the instance. regular variables are not attached to an instance.

17. What are “getter” and “setter” methods used for?
    used to manipulate instance variables

18. What is the difference between a “getter” and a “setter” method?
    getter: reads a variable
    setter: assigns a new value to a variable

19. How do you make instance variables readable outside your class? Writeable? Both at the same time?
    Read: `attr_reader`
    write: `attr_writer`
    both: `attr_accessor`

20. Can a class call its own class methods?
    yes

21. What’s the difference between when you would use a class variable and when you would use a constant?

    - constants are defined outside `init`
    - constants: variables that you never want to change

22. What’s the difference between a class and a module?

- a class can be instantiated but a module cannot

- A module is a collection of methods

- a class has state

23. When would you use a class but not a module?

- need to instantiate something
- need to have it exist over time

24. How does inheritance work?

- `class B < A`
- B has access to all methods in A

25. Why is inheritance really useful?

- Build on classes
- DRY (don't repeat)

26. How do you extend a class? What does that mean?

- Inherit a class

27. What does `#super` do? Why use it?

- `#super` lets you call the superclass's version of your current method.

## Scope:

1.  What is scope?

Scope is the formal term that represents when you can access a variable or method and when you can't.

2.  When can you start using a variable?

after it's defined

3. When is a new scope defined?

A new scope is created when you first define a variable.

4. When are methods in scope?
5. What is a private method?
6. What is a protected method?
7. How are private and protected methods different?
8. What does “encapsulation” mean?

## `self``

1. good practice to reference gettor

```
def ssn
  # converts '123-45-6789' to 'xxx-xx-6789'
  'xxx-xx-' + @ssn.split('-').last
end

```
