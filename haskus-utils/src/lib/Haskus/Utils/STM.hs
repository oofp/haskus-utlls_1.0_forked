-- | STM helpers
module Haskus.Utils.STM
   ( S.STM
   , S.retry
   , atomically
   -- ** TVar
   , S.TVar
   , newTVarIO
   , readTVarIO
   , S.writeTVar
   , S.readTVar
   , S.newTVar
   , S.swapTVar
   , S.modifyTVar
   , S.modifyTVar'
   -- ** TMVar
   , S.TMVar
   , newTMVarIO
   , S.isEmptyTMVar
   , S.newEmptyTMVar
   , S.newEmptyTMVarIO
   , S.readTMVar
   , S.takeTMVar
   , S.putTMVar
   , S.swapTMVar
   , S.tryReadTMVar
   , S.tryPutTMVar
   , S.tryTakeTMVar
   -- ** TChan
   , S.TChan
   , newBroadcastTChanIO
   , S.newBroadcastTChan
   , S.writeTChan
   , S.dupTChan
   , S.readTChan
   )
where

import Control.Concurrent.STM (STM, TVar, TMVar, TChan)
import qualified Control.Concurrent.STM as S
import Haskus.Utils.Monad

-- | Execute an STM transaction atomically
atomically :: MonadIO m => STM a -> m a
atomically = liftIO . S.atomically

-- | Read a TVar in an IO monad
readTVarIO :: MonadIO m => TVar a -> m a
readTVarIO = liftIO . S.readTVarIO

-- | Create a broadcast channel
newBroadcastTChanIO :: MonadIO m => m (TChan a)
newBroadcastTChanIO = liftIO S.newBroadcastTChanIO

-- | Create a TVar
newTVarIO :: MonadIO m => a -> m (TVar a)
newTVarIO = liftIO . S.newTVarIO

-- | Create a TMVar
newTMVarIO :: MonadIO m => a -> m (TMVar a)
newTMVarIO = liftIO . S.newTMVarIO
