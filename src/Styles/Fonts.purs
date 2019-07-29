module Styles.Fonts where

import Stylesheet

smallFont :: forall a. CSSRuleSet a
smallFont = str """
  font-size: 14px;
  font-family: Helvetica, Arial, Sans-serif;
  line-height: 1.5;
"""

largeFont :: forall a. CSSRuleSet a
largeFont = str """
  font-size: 21px;
  line-height: 1.5;
  font-family: Helvetica, Arial, Sans-serif;
"""