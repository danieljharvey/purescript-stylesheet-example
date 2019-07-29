module Styles.Components where

import React.Stylesheet

import Data.Symbol (SProxy(..))
import Example.Types (TodoStatus(..))
import Prelude ((<>))
import React as React
import React.DOM.Props as Props
import Styles.Colours as Colours
import Styles.Fonts as Fonts

styleContext :: StyleContext
styleContext 
  = createStyleContext (SProxy :: SProxy "hey-nice-styles-buddy")

buttonStyles :: CSSRuleSet TodoStatus
buttonStyles
  =  str ("color: " <> Colours.text)
  <> str ("background-color: " <> Colours.pale)
  <> str ("""
          padding: 20px;
         """)
  <> str Fonts.largeFont
  <> fun (\status -> case status of
                        TodoDone -> ("border: solid 1px" <> Colours.title)
                        _        -> "border: none;"
          )

button 
  :: TodoStatus 
  -> Array Props.Props
  -> Array React.ReactElement 
  -> React.ReactElement
button = styleContext.withChildren.button buttonStyles


type TextProps
  = { strikeThrough :: Boolean
    }

textStyles :: CSSRuleSet TextProps
textStyles
  =  str Fonts.smallFont
  <> str ("color: " <> Colours.title)
  <> fun (\props -> if props.strikeThrough
                    then "text-decoration: line-through;"
                    else "")

text
  :: TextProps
  -> Array Props.Props
  -> Array React.ReactElement
  -> React.ReactElement
text = styleContext.withChildren.p textStyles