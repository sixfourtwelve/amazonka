{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.Lightsail.GetInstanceMetricData
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns the data points for the specified Amazon Lightsail instance
-- metric, given an instance name.
--
-- Metrics report the utilization of your resources, and the error counts
-- generated by them. Monitor and collect metric data regularly to maintain
-- the reliability, availability, and performance of your resources.
module Amazonka.Lightsail.GetInstanceMetricData
  ( -- * Creating a Request
    GetInstanceMetricData (..),
    newGetInstanceMetricData,

    -- * Request Lenses
    getInstanceMetricData_instanceName,
    getInstanceMetricData_metricName,
    getInstanceMetricData_period,
    getInstanceMetricData_startTime,
    getInstanceMetricData_endTime,
    getInstanceMetricData_unit,
    getInstanceMetricData_statistics,

    -- * Destructuring the Response
    GetInstanceMetricDataResponse (..),
    newGetInstanceMetricDataResponse,

    -- * Response Lenses
    getInstanceMetricDataResponse_metricData,
    getInstanceMetricDataResponse_metricName,
    getInstanceMetricDataResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Data as Data
import Amazonka.Lightsail.Types
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newGetInstanceMetricData' smart constructor.
data GetInstanceMetricData = GetInstanceMetricData'
  { -- | The name of the instance for which you want to get metrics data.
    instanceName :: Prelude.Text,
    -- | The metric for which you want to return information.
    --
    -- Valid instance metric names are listed below, along with the most useful
    -- @statistics@ to include in your request, and the published @unit@ value.
    --
    -- -   __@BurstCapacityPercentage@__ - The percentage of CPU performance
    --     available for your instance to burst above its baseline. Your
    --     instance continuously accrues and consumes burst capacity. Burst
    --     capacity stops accruing when your instance\'s
    --     @BurstCapacityPercentage@ reaches 100%. For more information, see
    --     <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity Viewing instance burst capacity in Amazon Lightsail>.
    --
    --     @Statistics@: The most useful statistics are @Maximum@ and
    --     @Average@.
    --
    --     @Unit@: The published unit is @Percent@.
    --
    -- -   __@BurstCapacityTime@__ - The available amount of time for your
    --     instance to burst at 100% CPU utilization. Your instance
    --     continuously accrues and consumes burst capacity. Burst capacity
    --     time stops accruing when your instance\'s @BurstCapacityPercentage@
    --     metric reaches 100%.
    --
    --     Burst capacity time is consumed at the full rate only when your
    --     instance operates at 100% CPU utilization. For example, if your
    --     instance operates at 50% CPU utilization in the burstable zone for a
    --     5-minute period, then it consumes CPU burst capacity minutes at a
    --     50% rate in that period. Your instance consumed 2 minutes and 30
    --     seconds of CPU burst capacity minutes in the 5-minute period. For
    --     more information, see
    --     <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity Viewing instance burst capacity in Amazon Lightsail>.
    --
    --     @Statistics@: The most useful statistics are @Maximum@ and
    --     @Average@.
    --
    --     @Unit@: The published unit is @Seconds@.
    --
    -- -   __@CPUUtilization@__ - The percentage of allocated compute units
    --     that are currently in use on the instance. This metric identifies
    --     the processing power to run the applications on the instance. Tools
    --     in your operating system can show a lower percentage than Lightsail
    --     when the instance is not allocated a full processor core.
    --
    --     @Statistics@: The most useful statistics are @Maximum@ and
    --     @Average@.
    --
    --     @Unit@: The published unit is @Percent@.
    --
    -- -   __@NetworkIn@__ - The number of bytes received on all network
    --     interfaces by the instance. This metric identifies the volume of
    --     incoming network traffic to the instance. The number reported is the
    --     number of bytes received during the period. Because this metric is
    --     reported in 5-minute intervals, divide the reported number by 300 to
    --     find Bytes\/second.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @Bytes@.
    --
    -- -   __@NetworkOut@__ - The number of bytes sent out on all network
    --     interfaces by the instance. This metric identifies the volume of
    --     outgoing network traffic from the instance. The number reported is
    --     the number of bytes sent during the period. Because this metric is
    --     reported in 5-minute intervals, divide the reported number by 300 to
    --     find Bytes\/second.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @Bytes@.
    --
    -- -   __@StatusCheckFailed@__ - Reports whether the instance passed or
    --     failed both the instance status check and the system status check.
    --     This metric can be either 0 (passed) or 1 (failed). This metric data
    --     is available in 1-minute (60 seconds) granularity.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @Count@.
    --
    -- -   __@StatusCheckFailed_Instance@__ - Reports whether the instance
    --     passed or failed the instance status check. This metric can be
    --     either 0 (passed) or 1 (failed). This metric data is available in
    --     1-minute (60 seconds) granularity.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @Count@.
    --
    -- -   __@StatusCheckFailed_System@__ - Reports whether the instance passed
    --     or failed the system status check. This metric can be either 0
    --     (passed) or 1 (failed). This metric data is available in 1-minute
    --     (60 seconds) granularity.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @Count@.
    --
    -- -   __@MetadataNoToken@__ - Reports the number of times that the
    --     instance metadata service was successfully accessed without a token.
    --     This metric determines if there are any processes accessing instance
    --     metadata by using Instance Metadata Service Version 1, which
    --     doesn\'t use a token. If all requests use token-backed sessions,
    --     such as Instance Metadata Service Version 2, then the value is 0.
    --
    --     @Statistics@: The most useful statistic is @Sum@.
    --
    --     @Unit@: The published unit is @Count@.
    metricName :: InstanceMetricName,
    -- | The granularity, in seconds, of the returned data points.
    --
    -- The @StatusCheckFailed@, @StatusCheckFailed_Instance@, and
    -- @StatusCheckFailed_System@ instance metric data is available in 1-minute
    -- (60 seconds) granularity. All other instance metric data is available in
    -- 5-minute (300 seconds) granularity.
    period :: Prelude.Natural,
    -- | The start time of the time period.
    startTime :: Data.POSIX,
    -- | The end time of the time period.
    endTime :: Data.POSIX,
    -- | The unit for the metric data request. Valid units depend on the metric
    -- data being requested. For the valid units to specify with each available
    -- metric, see the @metricName@ parameter.
    unit :: MetricUnit,
    -- | The statistic for the metric.
    --
    -- The following statistics are available:
    --
    -- -   @Minimum@ - The lowest value observed during the specified period.
    --     Use this value to determine low volumes of activity for your
    --     application.
    --
    -- -   @Maximum@ - The highest value observed during the specified period.
    --     Use this value to determine high volumes of activity for your
    --     application.
    --
    -- -   @Sum@ - All values submitted for the matching metric added together.
    --     You can use this statistic to determine the total volume of a
    --     metric.
    --
    -- -   @Average@ - The value of Sum \/ SampleCount during the specified
    --     period. By comparing this statistic with the Minimum and Maximum
    --     values, you can determine the full scope of a metric and how close
    --     the average use is to the Minimum and Maximum values. This
    --     comparison helps you to know when to increase or decrease your
    --     resources.
    --
    -- -   @SampleCount@ - The count, or number, of data points used for the
    --     statistical calculation.
    statistics :: [MetricStatistic]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetInstanceMetricData' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'instanceName', 'getInstanceMetricData_instanceName' - The name of the instance for which you want to get metrics data.
--
-- 'metricName', 'getInstanceMetricData_metricName' - The metric for which you want to return information.
--
-- Valid instance metric names are listed below, along with the most useful
-- @statistics@ to include in your request, and the published @unit@ value.
--
-- -   __@BurstCapacityPercentage@__ - The percentage of CPU performance
--     available for your instance to burst above its baseline. Your
--     instance continuously accrues and consumes burst capacity. Burst
--     capacity stops accruing when your instance\'s
--     @BurstCapacityPercentage@ reaches 100%. For more information, see
--     <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity Viewing instance burst capacity in Amazon Lightsail>.
--
--     @Statistics@: The most useful statistics are @Maximum@ and
--     @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@BurstCapacityTime@__ - The available amount of time for your
--     instance to burst at 100% CPU utilization. Your instance
--     continuously accrues and consumes burst capacity. Burst capacity
--     time stops accruing when your instance\'s @BurstCapacityPercentage@
--     metric reaches 100%.
--
--     Burst capacity time is consumed at the full rate only when your
--     instance operates at 100% CPU utilization. For example, if your
--     instance operates at 50% CPU utilization in the burstable zone for a
--     5-minute period, then it consumes CPU burst capacity minutes at a
--     50% rate in that period. Your instance consumed 2 minutes and 30
--     seconds of CPU burst capacity minutes in the 5-minute period. For
--     more information, see
--     <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity Viewing instance burst capacity in Amazon Lightsail>.
--
--     @Statistics@: The most useful statistics are @Maximum@ and
--     @Average@.
--
--     @Unit@: The published unit is @Seconds@.
--
-- -   __@CPUUtilization@__ - The percentage of allocated compute units
--     that are currently in use on the instance. This metric identifies
--     the processing power to run the applications on the instance. Tools
--     in your operating system can show a lower percentage than Lightsail
--     when the instance is not allocated a full processor core.
--
--     @Statistics@: The most useful statistics are @Maximum@ and
--     @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@NetworkIn@__ - The number of bytes received on all network
--     interfaces by the instance. This metric identifies the volume of
--     incoming network traffic to the instance. The number reported is the
--     number of bytes received during the period. Because this metric is
--     reported in 5-minute intervals, divide the reported number by 300 to
--     find Bytes\/second.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Bytes@.
--
-- -   __@NetworkOut@__ - The number of bytes sent out on all network
--     interfaces by the instance. This metric identifies the volume of
--     outgoing network traffic from the instance. The number reported is
--     the number of bytes sent during the period. Because this metric is
--     reported in 5-minute intervals, divide the reported number by 300 to
--     find Bytes\/second.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Bytes@.
--
-- -   __@StatusCheckFailed@__ - Reports whether the instance passed or
--     failed both the instance status check and the system status check.
--     This metric can be either 0 (passed) or 1 (failed). This metric data
--     is available in 1-minute (60 seconds) granularity.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- -   __@StatusCheckFailed_Instance@__ - Reports whether the instance
--     passed or failed the instance status check. This metric can be
--     either 0 (passed) or 1 (failed). This metric data is available in
--     1-minute (60 seconds) granularity.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- -   __@StatusCheckFailed_System@__ - Reports whether the instance passed
--     or failed the system status check. This metric can be either 0
--     (passed) or 1 (failed). This metric data is available in 1-minute
--     (60 seconds) granularity.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- -   __@MetadataNoToken@__ - Reports the number of times that the
--     instance metadata service was successfully accessed without a token.
--     This metric determines if there are any processes accessing instance
--     metadata by using Instance Metadata Service Version 1, which
--     doesn\'t use a token. If all requests use token-backed sessions,
--     such as Instance Metadata Service Version 2, then the value is 0.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- 'period', 'getInstanceMetricData_period' - The granularity, in seconds, of the returned data points.
--
-- The @StatusCheckFailed@, @StatusCheckFailed_Instance@, and
-- @StatusCheckFailed_System@ instance metric data is available in 1-minute
-- (60 seconds) granularity. All other instance metric data is available in
-- 5-minute (300 seconds) granularity.
--
-- 'startTime', 'getInstanceMetricData_startTime' - The start time of the time period.
--
-- 'endTime', 'getInstanceMetricData_endTime' - The end time of the time period.
--
-- 'unit', 'getInstanceMetricData_unit' - The unit for the metric data request. Valid units depend on the metric
-- data being requested. For the valid units to specify with each available
-- metric, see the @metricName@ parameter.
--
-- 'statistics', 'getInstanceMetricData_statistics' - The statistic for the metric.
--
-- The following statistics are available:
--
-- -   @Minimum@ - The lowest value observed during the specified period.
--     Use this value to determine low volumes of activity for your
--     application.
--
-- -   @Maximum@ - The highest value observed during the specified period.
--     Use this value to determine high volumes of activity for your
--     application.
--
-- -   @Sum@ - All values submitted for the matching metric added together.
--     You can use this statistic to determine the total volume of a
--     metric.
--
-- -   @Average@ - The value of Sum \/ SampleCount during the specified
--     period. By comparing this statistic with the Minimum and Maximum
--     values, you can determine the full scope of a metric and how close
--     the average use is to the Minimum and Maximum values. This
--     comparison helps you to know when to increase or decrease your
--     resources.
--
-- -   @SampleCount@ - The count, or number, of data points used for the
--     statistical calculation.
newGetInstanceMetricData ::
  -- | 'instanceName'
  Prelude.Text ->
  -- | 'metricName'
  InstanceMetricName ->
  -- | 'period'
  Prelude.Natural ->
  -- | 'startTime'
  Prelude.UTCTime ->
  -- | 'endTime'
  Prelude.UTCTime ->
  -- | 'unit'
  MetricUnit ->
  GetInstanceMetricData
newGetInstanceMetricData
  pInstanceName_
  pMetricName_
  pPeriod_
  pStartTime_
  pEndTime_
  pUnit_ =
    GetInstanceMetricData'
      { instanceName =
          pInstanceName_,
        metricName = pMetricName_,
        period = pPeriod_,
        startTime = Data._Time Lens.# pStartTime_,
        endTime = Data._Time Lens.# pEndTime_,
        unit = pUnit_,
        statistics = Prelude.mempty
      }

-- | The name of the instance for which you want to get metrics data.
getInstanceMetricData_instanceName :: Lens.Lens' GetInstanceMetricData Prelude.Text
getInstanceMetricData_instanceName = Lens.lens (\GetInstanceMetricData' {instanceName} -> instanceName) (\s@GetInstanceMetricData' {} a -> s {instanceName = a} :: GetInstanceMetricData)

-- | The metric for which you want to return information.
--
-- Valid instance metric names are listed below, along with the most useful
-- @statistics@ to include in your request, and the published @unit@ value.
--
-- -   __@BurstCapacityPercentage@__ - The percentage of CPU performance
--     available for your instance to burst above its baseline. Your
--     instance continuously accrues and consumes burst capacity. Burst
--     capacity stops accruing when your instance\'s
--     @BurstCapacityPercentage@ reaches 100%. For more information, see
--     <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity Viewing instance burst capacity in Amazon Lightsail>.
--
--     @Statistics@: The most useful statistics are @Maximum@ and
--     @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@BurstCapacityTime@__ - The available amount of time for your
--     instance to burst at 100% CPU utilization. Your instance
--     continuously accrues and consumes burst capacity. Burst capacity
--     time stops accruing when your instance\'s @BurstCapacityPercentage@
--     metric reaches 100%.
--
--     Burst capacity time is consumed at the full rate only when your
--     instance operates at 100% CPU utilization. For example, if your
--     instance operates at 50% CPU utilization in the burstable zone for a
--     5-minute period, then it consumes CPU burst capacity minutes at a
--     50% rate in that period. Your instance consumed 2 minutes and 30
--     seconds of CPU burst capacity minutes in the 5-minute period. For
--     more information, see
--     <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity Viewing instance burst capacity in Amazon Lightsail>.
--
--     @Statistics@: The most useful statistics are @Maximum@ and
--     @Average@.
--
--     @Unit@: The published unit is @Seconds@.
--
-- -   __@CPUUtilization@__ - The percentage of allocated compute units
--     that are currently in use on the instance. This metric identifies
--     the processing power to run the applications on the instance. Tools
--     in your operating system can show a lower percentage than Lightsail
--     when the instance is not allocated a full processor core.
--
--     @Statistics@: The most useful statistics are @Maximum@ and
--     @Average@.
--
--     @Unit@: The published unit is @Percent@.
--
-- -   __@NetworkIn@__ - The number of bytes received on all network
--     interfaces by the instance. This metric identifies the volume of
--     incoming network traffic to the instance. The number reported is the
--     number of bytes received during the period. Because this metric is
--     reported in 5-minute intervals, divide the reported number by 300 to
--     find Bytes\/second.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Bytes@.
--
-- -   __@NetworkOut@__ - The number of bytes sent out on all network
--     interfaces by the instance. This metric identifies the volume of
--     outgoing network traffic from the instance. The number reported is
--     the number of bytes sent during the period. Because this metric is
--     reported in 5-minute intervals, divide the reported number by 300 to
--     find Bytes\/second.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Bytes@.
--
-- -   __@StatusCheckFailed@__ - Reports whether the instance passed or
--     failed both the instance status check and the system status check.
--     This metric can be either 0 (passed) or 1 (failed). This metric data
--     is available in 1-minute (60 seconds) granularity.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- -   __@StatusCheckFailed_Instance@__ - Reports whether the instance
--     passed or failed the instance status check. This metric can be
--     either 0 (passed) or 1 (failed). This metric data is available in
--     1-minute (60 seconds) granularity.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- -   __@StatusCheckFailed_System@__ - Reports whether the instance passed
--     or failed the system status check. This metric can be either 0
--     (passed) or 1 (failed). This metric data is available in 1-minute
--     (60 seconds) granularity.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
--
-- -   __@MetadataNoToken@__ - Reports the number of times that the
--     instance metadata service was successfully accessed without a token.
--     This metric determines if there are any processes accessing instance
--     metadata by using Instance Metadata Service Version 1, which
--     doesn\'t use a token. If all requests use token-backed sessions,
--     such as Instance Metadata Service Version 2, then the value is 0.
--
--     @Statistics@: The most useful statistic is @Sum@.
--
--     @Unit@: The published unit is @Count@.
getInstanceMetricData_metricName :: Lens.Lens' GetInstanceMetricData InstanceMetricName
getInstanceMetricData_metricName = Lens.lens (\GetInstanceMetricData' {metricName} -> metricName) (\s@GetInstanceMetricData' {} a -> s {metricName = a} :: GetInstanceMetricData)

-- | The granularity, in seconds, of the returned data points.
--
-- The @StatusCheckFailed@, @StatusCheckFailed_Instance@, and
-- @StatusCheckFailed_System@ instance metric data is available in 1-minute
-- (60 seconds) granularity. All other instance metric data is available in
-- 5-minute (300 seconds) granularity.
getInstanceMetricData_period :: Lens.Lens' GetInstanceMetricData Prelude.Natural
getInstanceMetricData_period = Lens.lens (\GetInstanceMetricData' {period} -> period) (\s@GetInstanceMetricData' {} a -> s {period = a} :: GetInstanceMetricData)

-- | The start time of the time period.
getInstanceMetricData_startTime :: Lens.Lens' GetInstanceMetricData Prelude.UTCTime
getInstanceMetricData_startTime = Lens.lens (\GetInstanceMetricData' {startTime} -> startTime) (\s@GetInstanceMetricData' {} a -> s {startTime = a} :: GetInstanceMetricData) Prelude.. Data._Time

-- | The end time of the time period.
getInstanceMetricData_endTime :: Lens.Lens' GetInstanceMetricData Prelude.UTCTime
getInstanceMetricData_endTime = Lens.lens (\GetInstanceMetricData' {endTime} -> endTime) (\s@GetInstanceMetricData' {} a -> s {endTime = a} :: GetInstanceMetricData) Prelude.. Data._Time

-- | The unit for the metric data request. Valid units depend on the metric
-- data being requested. For the valid units to specify with each available
-- metric, see the @metricName@ parameter.
getInstanceMetricData_unit :: Lens.Lens' GetInstanceMetricData MetricUnit
getInstanceMetricData_unit = Lens.lens (\GetInstanceMetricData' {unit} -> unit) (\s@GetInstanceMetricData' {} a -> s {unit = a} :: GetInstanceMetricData)

-- | The statistic for the metric.
--
-- The following statistics are available:
--
-- -   @Minimum@ - The lowest value observed during the specified period.
--     Use this value to determine low volumes of activity for your
--     application.
--
-- -   @Maximum@ - The highest value observed during the specified period.
--     Use this value to determine high volumes of activity for your
--     application.
--
-- -   @Sum@ - All values submitted for the matching metric added together.
--     You can use this statistic to determine the total volume of a
--     metric.
--
-- -   @Average@ - The value of Sum \/ SampleCount during the specified
--     period. By comparing this statistic with the Minimum and Maximum
--     values, you can determine the full scope of a metric and how close
--     the average use is to the Minimum and Maximum values. This
--     comparison helps you to know when to increase or decrease your
--     resources.
--
-- -   @SampleCount@ - The count, or number, of data points used for the
--     statistical calculation.
getInstanceMetricData_statistics :: Lens.Lens' GetInstanceMetricData [MetricStatistic]
getInstanceMetricData_statistics = Lens.lens (\GetInstanceMetricData' {statistics} -> statistics) (\s@GetInstanceMetricData' {} a -> s {statistics = a} :: GetInstanceMetricData) Prelude.. Lens.coerced

instance Core.AWSRequest GetInstanceMetricData where
  type
    AWSResponse GetInstanceMetricData =
      GetInstanceMetricDataResponse
  request overrides =
    Request.postJSON (overrides defaultService)
  response =
    Response.receiveJSON
      ( \s h x ->
          GetInstanceMetricDataResponse'
            Prelude.<$> (x Data..?> "metricData" Core..!@ Prelude.mempty)
            Prelude.<*> (x Data..?> "metricName")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable GetInstanceMetricData where
  hashWithSalt _salt GetInstanceMetricData' {..} =
    _salt
      `Prelude.hashWithSalt` instanceName
      `Prelude.hashWithSalt` metricName
      `Prelude.hashWithSalt` period
      `Prelude.hashWithSalt` startTime
      `Prelude.hashWithSalt` endTime
      `Prelude.hashWithSalt` unit
      `Prelude.hashWithSalt` statistics

instance Prelude.NFData GetInstanceMetricData where
  rnf GetInstanceMetricData' {..} =
    Prelude.rnf instanceName
      `Prelude.seq` Prelude.rnf metricName
      `Prelude.seq` Prelude.rnf period
      `Prelude.seq` Prelude.rnf startTime
      `Prelude.seq` Prelude.rnf endTime
      `Prelude.seq` Prelude.rnf unit
      `Prelude.seq` Prelude.rnf statistics

instance Data.ToHeaders GetInstanceMetricData where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Data.=# ( "Lightsail_20161128.GetInstanceMetricData" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Data.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Data.ToJSON GetInstanceMetricData where
  toJSON GetInstanceMetricData' {..} =
    Data.object
      ( Prelude.catMaybes
          [ Prelude.Just ("instanceName" Data..= instanceName),
            Prelude.Just ("metricName" Data..= metricName),
            Prelude.Just ("period" Data..= period),
            Prelude.Just ("startTime" Data..= startTime),
            Prelude.Just ("endTime" Data..= endTime),
            Prelude.Just ("unit" Data..= unit),
            Prelude.Just ("statistics" Data..= statistics)
          ]
      )

instance Data.ToPath GetInstanceMetricData where
  toPath = Prelude.const "/"

instance Data.ToQuery GetInstanceMetricData where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newGetInstanceMetricDataResponse' smart constructor.
data GetInstanceMetricDataResponse = GetInstanceMetricDataResponse'
  { -- | An array of objects that describe the metric data returned.
    metricData :: Prelude.Maybe [MetricDatapoint],
    -- | The name of the metric returned.
    metricName :: Prelude.Maybe InstanceMetricName,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetInstanceMetricDataResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'metricData', 'getInstanceMetricDataResponse_metricData' - An array of objects that describe the metric data returned.
--
-- 'metricName', 'getInstanceMetricDataResponse_metricName' - The name of the metric returned.
--
-- 'httpStatus', 'getInstanceMetricDataResponse_httpStatus' - The response's http status code.
newGetInstanceMetricDataResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetInstanceMetricDataResponse
newGetInstanceMetricDataResponse pHttpStatus_ =
  GetInstanceMetricDataResponse'
    { metricData =
        Prelude.Nothing,
      metricName = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | An array of objects that describe the metric data returned.
getInstanceMetricDataResponse_metricData :: Lens.Lens' GetInstanceMetricDataResponse (Prelude.Maybe [MetricDatapoint])
getInstanceMetricDataResponse_metricData = Lens.lens (\GetInstanceMetricDataResponse' {metricData} -> metricData) (\s@GetInstanceMetricDataResponse' {} a -> s {metricData = a} :: GetInstanceMetricDataResponse) Prelude.. Lens.mapping Lens.coerced

-- | The name of the metric returned.
getInstanceMetricDataResponse_metricName :: Lens.Lens' GetInstanceMetricDataResponse (Prelude.Maybe InstanceMetricName)
getInstanceMetricDataResponse_metricName = Lens.lens (\GetInstanceMetricDataResponse' {metricName} -> metricName) (\s@GetInstanceMetricDataResponse' {} a -> s {metricName = a} :: GetInstanceMetricDataResponse)

-- | The response's http status code.
getInstanceMetricDataResponse_httpStatus :: Lens.Lens' GetInstanceMetricDataResponse Prelude.Int
getInstanceMetricDataResponse_httpStatus = Lens.lens (\GetInstanceMetricDataResponse' {httpStatus} -> httpStatus) (\s@GetInstanceMetricDataResponse' {} a -> s {httpStatus = a} :: GetInstanceMetricDataResponse)

instance Prelude.NFData GetInstanceMetricDataResponse where
  rnf GetInstanceMetricDataResponse' {..} =
    Prelude.rnf metricData
      `Prelude.seq` Prelude.rnf metricName
      `Prelude.seq` Prelude.rnf httpStatus
