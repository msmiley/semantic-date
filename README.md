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

Provide a Date object as the second parameter to convert to use that date as the reference:

```coffee
semanticDate.convert "last hour", 
> { start: Wed Jan 01 2014 00:00:00 GMT-0500 (EST),
    end: Thu Jan 01 2015 00:00:00 GMT-0500 (EST) }
```

### Supported Semantics

The following are the semantic dates which are currently understood. More and more permutations of the current ones will be added over time. Feel free to send me a PR with your favorite form.

- last minute (up to current time)
- last hour (up to current time)
- last/past 24h/hours (up to current time)
- yesterday
- last week (week before the current)
- past week (7 days)
- last month (month before the current)
- past month (30 days)
- last year (year before the current)
- past year (365 days)
- today (up to current time)
- this week (up to current time)
- this month (up to current time)
- this year (up to current time)
- since 1970 (up to current time)

Hypens and underscores are supported in place of spaces.

## Testing

```bash
$ npm test
```

## License

  [MIT](LICENSE)
