module Example.TodoList where

import Prelude

import Effect (Effect)

import Data.Array (filter)
import Data.Maybe (Maybe)

import React as React
import React.DOM as DOM
import React.DOM.Props as Props

import Example.TodoForm (todoFormClass)
import Example.TodoItem (todoItemClass)
import Example.Types (Todo(..), TodoStatus(..))

import Styles.Components as Stylesheet

type TodoListProps
  = { todos :: Array Todo
    , todo :: Maybe Todo
    , onAdd :: Todo -> Effect Unit
    , onEdit :: Todo -> Effect Unit
    , onDone :: Todo -> Effect Unit
    , onClear :: Todo -> Effect Unit
    }

todoListClass :: React.ReactClass TodoListProps
todoListClass = React.component "TodoList" component
  where
  component this =
    pure { state: {}
         , render: render <$> React.getProps this
         }
    where
    render
      { todos
      , todo
      , onAdd
      , onEdit
      , onDone
      , onClear
      } =
      Stylesheet.wrapper
        [ React.createLeafElement todoFormClass
            { todo
            , onEdit
            , onAdd
            }
        , Stylesheet.orderedList
            (renderItem <$> todos')
        ]
      where
      todos' = filter (\(Todo { status }) -> TodoCleared /= status) todos

      renderItem todo'@(Todo { status }) =
        Stylesheet.container [
          Stylesheet.listItem
          [ React.createLeafElement todoItemClass { todo: todo' }
          , Stylesheet.button
              status
              [ Props.onClick onClick ]
              [ DOM.text text ]
          ]
        ]
        where
        text =
          case status of
               TodoPending -> "Done"
               TodoDone -> "Clear"
               _ -> ""

        onClick event =
          case status of
               TodoPending -> onDone todo'
               TodoDone -> onClear todo'
               _ -> pure unit
