module Example.TodoItem where

import Prelude

import React as React

import Example.Types (Todo(..), TodoStatus(..))

import Styles.Components as Stylesheet

type TodoItemProps = { todo :: Todo }

todoItemClass :: React.ReactClass TodoItemProps
todoItemClass = React.component "TodoItem" component
  where
  component this =
    pure { state: {}
         , render: render <$> React.getProps this
         }
    where
    render { todo: Todo { text, status } } =
      Stylesheet.text
        { strikeThrough: status == TodoDone }
        [ ]
        [ React.toElement text ]
      where
      textDecoration =
        case status of
             TodoDone -> "line-through"
             _ -> "none"
