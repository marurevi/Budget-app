![](https://img.shields.io/badge/Microverse-blueviolet)

# Budget-app

> You will create a Ruby on Rails application that allows the user to:

> - register and log in, so that the data is private to them.
> - introduce new transactions associated with a category.
> - see the money spent on each category.

## Built With

- Ruby on Rails
- Boostrap
- Postgres SQL
- Rspec
- Capybara

## Live Demo (if available)

[Live Demo Link](https://budget-app-smartes.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- You should have ruby installed in your machine, you can follow the steps given by the [official documentation](https://www.ruby-lang.org/en/documentation/installation/).

- You should have a postgres user with superuser permissions. you can refer to the official [postgres documentation](https://www.postgresql.org/docs/current/role-attributes.html#:~:text=To%20create%20a%20new%20database,that%20is%20already%20a%20superuser.&text=A%20role%20must%20be%20explicitly,use%20CREATE%20ROLE%20name%20CREATEDB%20.) to create or update a role.

### Setup

First, you must clone this repository locally running this command:

```
git clone git@github.com:marurevi/Budget-app.git
```

and navigate to the cloned directory:

```
cd budget_app
```

### Install

Once inside the project directory, you should install all project dependencies:

- Install bundler:

```
gem install bundler
```

- Install project dependencies

```
bundle install
```

### Usage

You can get the app running locally by opening a local server:

```
bin/rails server
```

### Run tests

If you're on a linux-based system, you could run the executable file to run all specs:

```
bin/rspec
```

Windows users have to specify ruby in this case:

```
ruby bin/rspec
```

## Authors

👤 **Mariana Revilla Lérida**

- GitHub: [@marurevi](https://github.com/marurevi)
- Twitter: [@MaruRevilla](https://twitter.com/MaruRevilla)
- LinkedIn: [Mariana-Revilla-Lérida](https://linkedin.com/in/mariana-revilla-l%C3%A9rida-a12aba143)
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Original design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella). Published under the [Creative Commons license](https://creativecommons.org/licenses/by-nc/4.0/).
- Linters workflow created by [@anagudelogu](https://github.com/anagudelogu)

## 📝 License

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._
