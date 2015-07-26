# Wander

**Wander** is an app to help people discover new music by allowing users to
create music playlists and make recommendations or comments to other users playlists.
Technologies include:

- Ruby on Rails
- Javascript, jQuery
- Bootstrap
- Devise
- Soundcloud API
- Youtube Embedded Players


## Table of Contents

1. [Download](#download)
1. [Usage](#usage)
1. [Demo](#demo)
1. [Contributing](#contributing)
1. [License](#license)

## Download

- git clone [Latest Version](https://github.com/brea9482/wander)


### Rails

You'll need to register your app with [Soundcloud](http://soundcloud.com/you/apps/new) in order to use their API. Once you have your keys, create a `.env` file in the root directory, and add your secret keys:

```
CLIENT_ID=<YOUR_ACCESS_KEY>
CLIENT_SECRET=<YOUR_SECRET_KEY>
```

In your terminal, run:

```
rake db:create
rake db:migrate
```

### Usage

In your terminal, run:

```
rails server
```

In your browser, visit:

```
localhost:3000
```

Guests can view beaches and reviews whereas registered users can add new beaches, submit reviews, and upvote / downvote reviews.

**[Back to top](#table-of-contents)**

## View Live Website

- [Wander](http://wander1.herokuapp.com)

**[Back to top](#table-of-contents)**

## Contributing

Open an issue first to discuss potential changes/additions.

**[Back to top](#table-of-contents)**

## License

#### (The MIT License)

Copyright (c) 2015 Bill Gooch

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
        distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

        The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
        IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
        TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

**[Back to top](#table-of-contents)**
