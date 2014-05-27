prefactory-example
==================

Example rails application using [Prefactory](https://github.com/socialcast/prefactory) to accelerate spec execution time

In this example, the FactoryGirl factory for creating a User has a
synthetic 1 second latency injected per creation, to highlight the
performance implications of repeat invocations of expensive factories
and setup operation in specs, and the benefits of using Prefactory to
mitigate those.

### Expected behavior without using the Prefactory gem

```
$ git checkout not-using-prefactory

$ bundle exec rspec spec/models/user_spec.rb
Sleeping during create name: Jane Doe-1
.
Sleeping during create name: Jane Doe-2
Sleeping during create name: Jane Doe-3
Sleeping during create name: Jane Doe-4
.
Sleeping during create name: Jane Doe-5
Sleeping during create name: Jane Doe-6
.
Sleeping during create name: Jane Doe-7
Sleeping during create name: Jane Doe-8
.
Sleeping during create name: Jane Doe-9
Sleeping during create name: Jane Doe-10
Sleeping during create name: Jane Doe-11
.
Sleeping during create name: Jane Doe-12
Sleeping during create name: Jane Doe-13
.
Sleeping during create name: Jane Doe-14
Sleeping during create name: Jane Doe-15
.

Finished in 15.18 seconds
7 examples, 0 failures
```

### Expected behavior with the Prefactory gem

```
$ git checkout master

$ bundle exec rspec spec/models/user_spec.rb
Sleeping during create name: Jane Doe-1
.
Sleeping during create name: Jane Doe-2
Sleeping during create name: Jane Doe-3
......

Finished in 3.1 seconds
7 examples, 0 failures
```