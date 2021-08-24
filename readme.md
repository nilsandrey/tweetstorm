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
