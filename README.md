amon is a hacking tool for maintaining access to accounts using oauth tokens, instead of passwords. I described the general idea [here](https://github.com/captn3m0/ideas#user-content-hacking-via-oaauth-tokens).

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/captn3m0/amon)

![Amon](http://images1.cliqueclack.com/tv/files/2012/05/Amon_and_his_Equalists-425x239.png)

#[Live Demo](https://amon-hack.herokuapp.com/)

**NOTE**: The live demo allows you to authorize against your own account. To prevent your account from being hacked, please authorize against a test slack team. (The demo includes a live token from my test slack account, so you can browse around).

##Currently supported applications

- Slack

##Features (Slack)

- Channel List
- User List
- Private Group List
- Browse any public channel
- Browse any private group user has access to
- Search across all messages
- Linkification and conversion of @mentions

#Setup & Development
amon uses sqlite in development and pg in production. The following environment variables are expected to be present:

    SLACK_ID=Slack application ID
    SLACK_SECRET=Slack application secret

In addition, `DATABASE_URL` (postgres) is used in production. In development, you can use a `.env` file in project root, and it will be used automatically.

#Licence
Licenced under the [MIT Licence](http://nemo.mit-license.org/)