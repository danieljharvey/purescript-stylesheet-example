module Styles.Components where

import React.Stylesheet

import Data.Symbol (SProxy(..))
import Example.Types (TodoStatus(..))
import Prelude (Unit, unit, (<>))
import React as React
import React.DOM.Props as Props
import Styles.Colours as Colours
import Styles.Fonts as Fonts

-- | This creates the Stylesheet, and returns a React consumer, React provider, and some elements that use them
styleContext :: StyleContext
styleContext 
  = createStyleContext (SProxy :: SProxy "hey-nice-styles-buddy")

---

buttonStyles :: CSSRuleSet TodoStatus
buttonStyles
  =  str ("color: " <> Colours.text)
  <> str ("background-color: " <> Colours.pale)
  <> str ("""
          padding: 10px;
         """)
  <> Fonts.largeFont
  <> fun (\status -> case status of
                        TodoDone -> ("border: solid 1px" <> Colours.title)
                        _        -> "border: none;")

button 
  :: TodoStatus 
  -> Array Props.Props
  -> Array React.ReactElement 
  -> React.ReactElement
button = styleContext.elements.button buttonStyles

---

type TextProps
  = { strikeThrough :: Boolean
    }

textStyles :: CSSRuleSet TextProps
textStyles
  =  Fonts.largeFont
  <> str ("color: " <> Colours.title)
  <> str """
          margin: 10px;
         """
  <> fun (\props -> if props.strikeThrough
                    then "text-decoration: line-through;"
                    else "")

text
  :: TextProps
  -> Array Props.Props
  -> Array React.ReactElement
  -> React.ReactElement
text = styleContext.elements.p textStyles

---

-- there is no reason we can't just smash in a big lump of CSS
containerStyles :: CSSRuleSet Unit
containerStyles
  =  str ("background-color: " <> Colours.background)
  <> str """
      margin: 20px;
      padding: 20px;
      border-radius: 10px;
      display: flex;
      flex-direction: row;
      justify-content: center;
    """

container :: Array React.ReactElement -> React.ReactElement
container 
  = styleContext.elements.div containerStyles unit []

formContainer :: Array Props.Props -> Array React.ReactElement -> React.ReactElement
formContainer 
  = styleContext.elements.form containerStyles unit

---

wrapperStyles :: CSSRuleSet Unit
wrapperStyles 
  = str """
    margin: 20px;
    padding: 20px;
  
    """
  <> str ("background-color: " <> Colours.pale)

wrapper :: Array React.ReactElement -> React.ReactElement
wrapper = styleContext.elements.div wrapperStyles unit []

---

orderedListStyles :: CSSRuleSet Unit
orderedListStyles = str "margin: 0px; padding: 0px;"

orderedList :: Array React.ReactElement -> React.ReactElement
orderedList = styleContext.elements.ol orderedListStyles unit []

---

listItem :: Array React.ReactElement -> React.ReactElement
listItem = styleContext.elements.li 
              (str """
                display: flex;
                flex-direction: row;
                justify-content: stretch;
                align-items: center;
                justify-content: space-between;
                width: 100%;
                """) unit []

---

inputStyles :: CSSRuleSet Unit
inputStyles = str "width: 100%;" <> Fonts.largeFont

input :: Array Props.Props -> React.ReactElement
input = styleContext.elements.input inputStyles unit