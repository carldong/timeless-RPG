-- |
-- Module:     FRP.Timeless.Framework.RPG.Scene.MapScene
-- Copyright:  (c) 2015 Rongcui Dong
-- License:    BSD3
-- Maintainer: Rongcui Dong <karl_1702@188.com>

module FRP.Timeless.Framework.RPG.Scene.MapScene
       where

import Prelude hiding ((.), id)
import qualified SDL as SDL
import Control.Monad

import FRP.Timeless
import FRP.Timeless.Framework.RPG.Render
import FRP.Timeless.Framework.RPG.Render.TileLayer
import FRP.Timeless.Framework.RPG.Render.Types


-- | The layer stack of Map scene
mapRenderLayerStack :: SDL.Window
                    -> SDL.Renderer
                    -> FilePath
                    -> IO [RenderLayer]
mapRenderLayerStack win ren path = do
  trd <- loadTileRenderData ren path

  -- v Background tile map
  bg <- RenderLayer `liftM` createLayerRenderer win ren 0 trd
  -- Objects go here
  -- v Foreground tile map
  fg <- RenderLayer `liftM` createLayerRenderer win ren 1 trd

  return [bg, fg]

