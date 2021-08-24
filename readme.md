# Tweetstorm

Sample CLI app for splitting large texts for twitter storm.

## Getting Started

### Installing

After cloning this repository, change into the newly created directory and run

```ruby
bundle install
```

This will install all dependencies needed for the project.

## Running the Tests

All tests can be run by executing

```ruby
ruby test.rb
```

## Running the Application

To run the application execute `bin/tweetstormgenerator`.
You should see the simulated twitter thread being printed.

```bash
$ bin/tweetstormgenerator "Magna eros augue tellus leo. Nisl massa auctor sollicitudin dolor placerat aptent consectetur aliquet massa pulvinar. Accumsan, ultrices penatibus dictumst accumsan habitasse tortor suspendisse! Lacinia habitant imperdiet augue lacinia taciti netus. Ante arcu ridiculus mi vehicula massa nibh nisl dis. Orci mi tempus pharetra molestie aenean magna venenatis aenean turpis. Convallis vehicula rhoncus."

Magna eros augue tellus leo. Nisl massa auctor sollicitudin dolor placerat aptent consectetur aliquet massa pulvinar. Accumsan, ultrices 1/3  
│
├  penatibus dictumst accumsan habitasse tortor suspendisse! Lacinia habitant imperdiet augue lacinia taciti netus. Ante arcu ridiculus mi 2/3
│
└  vehicula massa nibh nisl dis. Orci mi tempus pharetra molestie aenean magna venenatis aenean turpis. Convallis vehicula rhoncus. 3/3
```

## Built With

- Ruby
- Bundler
- Minitest

## License

This project is licensed under the MIT License - see the [license.md](license.md) file for details.

## Roadmap 

Possible improvements:

- We simplify the current implementation by considering the pager size as constant to the size of the biggest pager (2/100 is shorter than 150/200, but assumed the larger for all tweets in the thread), also I didn't take into account yet other possible restrictions users could use like don't cut words or URLs and counting URLs with the shorted-URL size like Twitter when the content have URLs. In such cases, the model probably should change to have a Tweet entity pointing internally to more diverse char positions in the main string. Until now, there's no need to cut the text itself and reproduce new strings saving the overhead that could cause.
- The obvious integration with the Twitter API.
- For CLI applications, we could use the [Thor](https://github.com/rails/thor) gem. It's widely used, including Rails for the classic Rails CLI. That could simplify the CLI implementation providing more features if you think on more commands an options. Posible options: Position of the pager, export tweets content to different formats, etc. 

