[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)
![Logo of the project](https://raw.githubusercontent.com/jehna/readme-best-practices/master/sample-logo.png)

# YALA!
> Your Awesome Learning Adventure
A safe place for your community to grow and learn together

## Installing / Getting started

A quick introduction of the minimal setup you need to get a hello world up &
running.

```
  git fork
  git clone
```

### Initial Configuration

The first time you install the project locally

```
rails db:create
rails db:migrate
bundle install
yarn install
```

## Developing

Here's a brief intro about what a developer must do in order to start developing
the project further:

```shell
git clone https://github.com/your/awesome-project.git
cd awesome-project/
packagemanager install
```

And state what happens step-by-step.

## Testing
We use RSpec and Capybara.
Guard enables us to have a very tight feedback loop by watching our files as we modify them.

To launch Guard

```
bundle exec guard
```

To manually launch the test
```
bundle exec rspec spec/
```

To manually launch e2e tests
```
bundle exec rails spec/feature
```

Yala is a multi-tenant app so you must always set the tenant when writing a test.
For request specs use `ActsAsTenant.test_tenant=`
For other specs use `ActsAsTenant.current_tenant=`

### Deploying / Publishing

In case there's some step you have to take that publishes this project to a
server, this is the right time to state it.

```shell
```

And again you'd need to tell what the previous code actually does.

## Features

Create your online learning community
* Forum to ask and answer question
* LMS to Learn from already made paths
* Follow Up with a Facilitator
* Peer Learning
* Chat

## Contributing

When you publish something open source, one of the greatest motivations is that
anyone can just jump in and start contributing to your project.

These paragraphs are meant to welcome those kind souls to feel that they are
needed. You should state something like:

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

If there's anything else the developer needs to know (e.g. the code style
guide), you should link it here. If there's a lot of things to take into
consideration, it is common to separate this section to its own file called
`CONTRIBUTING.md` (or similar). If so, you should say that it exists here.

## Links

Even though this information can be found inside the project on machine-readable
format like in a .json file, it's good to include a summary of most useful
links to humans using your project. You can include links like:

- Project homepage: https://your.github.com/awesome-project/
- Repository: https://github.com/your/awesome-project/
- Issue tracker: https://github.com/your/awesome-project/issues
  - In case of sensitive bugs like security vulnerabilities, please contact
    my@email.com directly instead of using issue tracker. We value your effort
    to improve the security and privacy of this project!
- Related projects:
  - Your other project: https://github.com/your/other-project/
  - Someone else's project: https://github.com/someones/awesome-project/


## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

The code in this project is licensed under GPL license.
