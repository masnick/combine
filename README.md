<img src="https://dl.dropbox.com/u/634/permanent/combine/combine.gif" width="200" height="154">

Combine
=======

What?
-----

A quick, open source app for accepting credit card payments for invoices online.
You can easily run it on [Heroku] for free (or your own Rails-capable server).

<img src="https://dl.dropbox.com/u/634/permanent/combine/example.png" width="600" height="460">

[See a complete example invoice payment page](https://dl.dropbox.com/u/634/permanent/combine/example/index.html).

Who?
----

Made by [Max Masnick] of [Cassava Labs, LLC] for himself and other like-minded consultants.
Anyone with basic command line skills can set up `Combine` for themselves.

Why?
----

Getting paid by check is slow, unreliable, and generally annoying. PayPal might
steal your hard-earned money.

It's relative easy to set up a website to accept credit card payments with [Stripe]
(like this one), but there's no need for every contractor or freelancer reinvent the
wheel.

How?
---

1.  First, make sure you have the following on your computer:

    1. Ruby and rubygems (check with `which ruby` and `which gem`; Google for installation instructions if needed).
    2. Heroku gem (check with `which heroku`; install with `gem install heroku).

2.  Then, you'll need some (free) accounts:

    1. [Stripe]
    2. [Heroku]
    3. [Mailgun]

3.  Next, clone this repository to your computer.

4.  `cd` into your local clone and run `heroku create example`, which will create your app at `example.herokuapp.com`. If you're having trouble naming your app, I'd recommend `yourname-payments.herokuapp.com`.

5.  Set up Mailgun:

    1. Go to your mailboxes page.
    2. Click on `postmaster@you.mailgun.org`.
    3. Create a password and note it for the next step.

6.  Run the following command, replacing the values as needed. See `config/initializers/combine.rb` for more information.

        heroku config:set STRIPE_API=ETPdHzvFZ1LFbwrIskXDLrZiudilJvig STRIPE_API_PUBLIC=pk_cD9uLyh2HOG7c2OA1lQBeqrmG1nvR BUSINESS_NAME="Your Name, Inc." SUPPORT_EMAIL=you@email.com APP_URL=example.herokuapp.com MAILGUN_MAILBOX=postmaster@you.mailgun.org MAILGUN_PASSWORD=xxxxxx

    You can start out with your test API keys.

6.  Run `git push heroku master` to deploy the app to your server.

7.  Run `heroku run rake db:load:schema` to set up your database.

8.  Run `heroku run console` to enter the Heroku console and then run the following command to create an admin user (you can create as many as you'd like by running this command multiple times).

        AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

9.  Test your app:

    1. Go to `example.herokuapp.com` and make sure you see a page with your business name on it.
    2. Go to `example.herokuapp.com/admin` and log in with the credentials you set up above. You should be able to create a client and then an invoice, etc. in the admin panel.
    3. Try charging an invoice with the [Stripe test data](https://stripe.com/docs/testing).
    4. Try emailing yourself: create a client with your email address, add an invoice, and click the "email" link on the admin dashboard.

Help
----

If you have any trouble, file an [issue](https://github.com/masnick/combine/issues) and then [ping me on twitter](https://twitter.com/masnick) to make sure I see it.


Hacking
-------

This is a pretty standard Rails setup. The only differences are:

- Use [pow.cx](http://pow.cx) for your local server -- the app should be at `http://combine.dev`.
- Use [MailCatcher](http://mailcatcher.me/) for local email testing.

Improvements are welcome. Submit a pull request and then [ping me on twitter](https://twitter.com/masnick) to make sure I see it.

Things I'd like to do include:

- Integrate with [Harvest], maybe emailing Harvest's PDF invoices as attachments and/or automatically creating invoices
- Add tracking of email opens
- Less silly icon

[Cassava Labs, LLC]: http://cassavalabs.com
[Max Masnick]: http://www.maxmasnick.com
[Harvest]: http://getharvest.com
[Stripe]: http://stripe.com
[Mailgun]: http://mailgun.com
[Heroku]: http://heroku.com

License (MIT)
-------------

Copyright (c) 2012 Cassava Lab, LLC, [http://cassavalab.com](http://cassavalab.com).

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.