# Ruley

Ruley is a simple rule engine that can be used with ActiveRecord. It provides DSL to define rules and corresponding actions in model level. The rules are evaluated to execute corresponding actions when instances are updated.

## Installation

You can add it to your Gemfile with:

`gem 'ruley', github: 'ashishbista/ruley`

Run the bundle command to install it.

## Usage

Now, you need to define rules and actions in your Rails application. To do so, you can create an initializer and put the code something like below:

`vim config/initializers/ruley.rb`

```

# Define stories
Ruley.config do |config|
  config.stories = ["User has not logged in for 2 days"]
end

# Define rules for your stories
Ruley::Engine.setup do
  add(/(.*) has not (.*) in for (\d) (.*)/) do |model, rule, n, days|
    story_for model do
      with_rule { |user| user.created_at < n.to_i.days.ago }
      with_action { Rails.logger.info("Please come back soon") }
    end
  end
end

```
All the stories must start with a valid model name.

When defining rules, both `with_rule` and `with_action` methods take block arguments. The action block gets executed only if the rule block evaluates `true` value.


## Running Tests

`bundle exec rspec --color -f doc`
