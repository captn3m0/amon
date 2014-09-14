[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/captn3m0/amon?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
amon is a hacking tool for maintaining access to accounts using oauth tokens, instead of passwords. I described the general idea [here](https://github.com/captn3m0/ideas#user-content-hacking-via-oaauth-tokens). amon was made in a 8 hour hackathon at [SDSLabs](https://sdslabs.co/)

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/captn3m0/amon)

![Amon](https://cdn.rawgit.com/captn3m0/amon/master/app/assets/images/logo.png)

#[Live Demo](https://amon-hack.herokuapp.com/)

**NOTE**: The live demo allows you to authorize against your own account. To prevent your account from being hacked, please authorize against a test slack team. (The demo includes a live token from my test slack account, so you can browse around).

##Currently supported applications

- Slack
- GMail

##Features (Slack)

- Channel List
- User List
- Private Group List
- Browse any public channel
- Browse any private group user has access to
- Search across all messages
- Linkification and conversion of @mentions

##Features (GMail)

- Listing of all threads in Inbox
- Listing all messages in any thread
- Viewing all headers + plain text or html version of a message
- Searching all messages across gmail

#Setup & Development
amon uses sqlite in development and pg in production. The following environment variables are expected to be present:

    SLACK_ID=Slack application ID
    SLACK_SECRET=Slack application secret

In addition, `DATABASE_URL` (postgres) is used in production. In development, you can use a `.env` file in project root, and it will be used automatically.

While setting up your [application at slack](https://api.slack.com/applications/new), the redirect URI must be `https://example.com/auth/slack/callback`. You can set multiple redirect uris for develpment and production.

For setting up your [application at google](https://console.developers.google.com/project?authuser=0), set the following:

- **Enabled APIS**: Contacts API, Drive API, GMail API, Google+ API
- Setup your application in credentials tab as a web application
- Copy over CLIEND ID and CLIENT SECRET to the setup screen
- REDIRECT URI must be `https://example.com/auth/google/callback`

##DISCLAIMER
amon is a tool for pen-testing. Don't use it to attack targets without their knowledge. amon's goal is to make you smarter, not to help you to get into trouble, because we won’t be there to get you out. **If you do things illegally, you can be caught and put in jail!**.

#Licence
Licenced under the [MIT Licence](http://nemo.mit-license.org/)