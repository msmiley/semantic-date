# Semantic-Date

Convert natural language time spans to Date objects

## Installation

```bash
$ npm install semantic-date
```

## Usage

```coffee
semanticDate = require 'semantic-date'

semanticDate.validate "last year"
> true

semanticDate.convert "last year"
> { start: Wed Jan 01 2014 00:00:00 GMT-0500 (EST),
    end: Thu Jan 01 2015 00:00:00 GMT-0500 (EST) }
```

### Supported Semantics

The following are the semantic dates which are currently understood. More and more permutations of the current ones will be added over time. Feel free to send me a PR with your favorite form.

- last minute
- last hour
- last/past 24h/hours
- yesterday
- last week
- last month
- last year
- today
- this week
- this month
- this year
- since 1970


## Testing

```bash
$ npm test
```

## License

  [MIT](LICENSE)
