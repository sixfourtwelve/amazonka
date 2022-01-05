{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.ComputeOptimizer.Types.InstanceRecommendationOption
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.ComputeOptimizer.Types.InstanceRecommendationOption where

import Amazonka.ComputeOptimizer.Types.PlatformDifference
import Amazonka.ComputeOptimizer.Types.UtilizationMetric
import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | Describes a recommendation option for an Amazon EC2 instance.
--
-- /See:/ 'newInstanceRecommendationOption' smart constructor.
data InstanceRecommendationOption = InstanceRecommendationOption'
  { -- | Describes the configuration differences between the current instance and
    -- the recommended instance type. You should consider the configuration
    -- differences before migrating your workloads from the current instance to
    -- the recommended instance type. The
    -- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html Change the instance type guide for Linux>
    -- and
    -- <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-resize.html Change the instance type guide for Windows>
    -- provide general guidance for getting started with an instance migration.
    --
    -- Platform differences include:
    --
    -- -   __@Hypervisor@__ — The hypervisor of the recommended instance type
    --     is different than that of the current instance. For example, the
    --     recommended instance type uses a Nitro hypervisor and the current
    --     instance uses a Xen hypervisor. The differences that you should
    --     consider between these hypervisors are covered in the
    --     <http://aws.amazon.com/ec2/faqs/#Nitro_Hypervisor Nitro Hypervisor>
    --     section of the Amazon EC2 frequently asked questions. For more
    --     information, see
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances Instances built on the Nitro System>
    --     in the /Amazon EC2 User Guide for Linux/, or
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#ec2-nitro-instances Instances built on the Nitro System>
    --     in the /Amazon EC2 User Guide for Windows/.
    --
    -- -   __@NetworkInterface@__ — The network interface of the recommended
    --     instance type is different than that of the current instance. For
    --     example, the recommended instance type supports enhanced networking
    --     and the current instance might not. To enable enhanced networking
    --     for the recommended instance type, you must install the Elastic
    --     Network Adapter (ENA) driver or the Intel 82599 Virtual Function
    --     driver. For more information, see
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
    --     and
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html Enhanced networking on Linux>
    --     in the /Amazon EC2 User Guide for Linux/, or
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
    --     and
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html Enhanced networking on Windows>
    --     in the /Amazon EC2 User Guide for Windows/.
    --
    -- -   __@StorageInterface@__ — The storage interface of the recommended
    --     instance type is different than that of the current instance. For
    --     example, the recommended instance type uses an NVMe storage
    --     interface and the current instance does not. To access NVMe volumes
    --     for the recommended instance type, you will need to install or
    --     upgrade the NVMe driver. For more information, see
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
    --     and
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nvme-ebs-volumes.html Amazon EBS and NVMe on Linux instances>
    --     in the /Amazon EC2 User Guide for Linux/, or
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
    --     and
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/nvme-ebs-volumes.html Amazon EBS and NVMe on Windows instances>
    --     in the /Amazon EC2 User Guide for Windows/.
    --
    -- -   __@InstanceStoreAvailability@__ — The recommended instance type does
    --     not support instance store volumes and the current instance does.
    --     Before migrating, you might need to back up the data on your
    --     instance store volumes if you want to preserve them. For more
    --     information, see
    --     <https://aws.amazon.com/premiumsupport/knowledge-center/back-up-instance-store-ebs/ How do I back up an instance store volume on my Amazon EC2 instance to Amazon EBS?>
    --     in the /Amazon Web Services Premium Support Knowledge Base/. For
    --     more information, see
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
    --     and
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html Amazon EC2 instance store>
    --     in the /Amazon EC2 User Guide for Linux/, or see
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
    --     and
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/InstanceStorage.html Amazon EC2 instance store>
    --     in the /Amazon EC2 User Guide for Windows/.
    --
    -- -   __@VirtualizationType@__ — The recommended instance type uses the
    --     hardware virtual machine (HVM) virtualization type and the current
    --     instance uses the paravirtual (PV) virtualization type. For more
    --     information about the differences between these virtualization
    --     types, see
    --     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html Linux AMI virtualization types>
    --     in the /Amazon EC2 User Guide for Linux/, or
    --     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#virtualization-types Windows AMI virtualization types>
    --     in the /Amazon EC2 User Guide for Windows/.
    --
    -- -   __@Architecture@__ — The CPU architecture between the recommended
    --     instance type and the current instance is different. For example,
    --     the recommended instance type might use an Arm CPU architecture and
    --     the current instance type might use a different one, such as x86.
    --     Before migrating, you should consider recompiling the software on
    --     your instance for the new architecture. Alternatively, you might
    --     switch to an Amazon Machine Image (AMI) that supports the new
    --     architecture. For more information about the CPU architecture for
    --     each instance type, see
    --     <http://aws.amazon.com/ec2/instance-types/ Amazon EC2 Instance Types>.
    platformDifferences :: Prelude.Maybe [PlatformDifference],
    -- | The performance risk of the instance recommendation option.
    --
    -- Performance risk indicates the likelihood of the recommended instance
    -- type not meeting the resource needs of your workload. Compute Optimizer
    -- calculates an individual performance risk score for each specification
    -- of the recommended instance, including CPU, memory, EBS throughput, EBS
    -- IOPS, disk throughput, disk IOPS, network throughput, and network PPS.
    -- The performance risk of the recommended instance is calculated as the
    -- maximum performance risk score across the analyzed resource
    -- specifications.
    --
    -- The value ranges from @0@ - @4@, with @0@ meaning that the recommended
    -- resource is predicted to always provide enough hardware capability. The
    -- higher the performance risk is, the more likely you should validate
    -- whether the recommendation will meet the performance requirements of
    -- your workload before migrating your resource.
    performanceRisk :: Prelude.Maybe Prelude.Double,
    -- | An array of objects that describe the projected utilization metrics of
    -- the instance recommendation option.
    --
    -- The @Cpu@ and @Memory@ metrics are the only projected utilization
    -- metrics returned. Additionally, the @Memory@ metric is returned only for
    -- resources that have the unified CloudWatch agent installed on them. For
    -- more information, see
    -- <https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent Enabling Memory Utilization with the CloudWatch Agent>.
    projectedUtilizationMetrics :: Prelude.Maybe [UtilizationMetric],
    -- | The instance type of the instance recommendation.
    instanceType :: Prelude.Maybe Prelude.Text,
    -- | The rank of the instance recommendation option.
    --
    -- The top recommendation option is ranked as @1@.
    rank :: Prelude.Maybe Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'InstanceRecommendationOption' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'platformDifferences', 'instanceRecommendationOption_platformDifferences' - Describes the configuration differences between the current instance and
-- the recommended instance type. You should consider the configuration
-- differences before migrating your workloads from the current instance to
-- the recommended instance type. The
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html Change the instance type guide for Linux>
-- and
-- <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-resize.html Change the instance type guide for Windows>
-- provide general guidance for getting started with an instance migration.
--
-- Platform differences include:
--
-- -   __@Hypervisor@__ — The hypervisor of the recommended instance type
--     is different than that of the current instance. For example, the
--     recommended instance type uses a Nitro hypervisor and the current
--     instance uses a Xen hypervisor. The differences that you should
--     consider between these hypervisors are covered in the
--     <http://aws.amazon.com/ec2/faqs/#Nitro_Hypervisor Nitro Hypervisor>
--     section of the Amazon EC2 frequently asked questions. For more
--     information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances Instances built on the Nitro System>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#ec2-nitro-instances Instances built on the Nitro System>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@NetworkInterface@__ — The network interface of the recommended
--     instance type is different than that of the current instance. For
--     example, the recommended instance type supports enhanced networking
--     and the current instance might not. To enable enhanced networking
--     for the recommended instance type, you must install the Elastic
--     Network Adapter (ENA) driver or the Intel 82599 Virtual Function
--     driver. For more information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html Enhanced networking on Linux>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html Enhanced networking on Windows>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@StorageInterface@__ — The storage interface of the recommended
--     instance type is different than that of the current instance. For
--     example, the recommended instance type uses an NVMe storage
--     interface and the current instance does not. To access NVMe volumes
--     for the recommended instance type, you will need to install or
--     upgrade the NVMe driver. For more information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nvme-ebs-volumes.html Amazon EBS and NVMe on Linux instances>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/nvme-ebs-volumes.html Amazon EBS and NVMe on Windows instances>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@InstanceStoreAvailability@__ — The recommended instance type does
--     not support instance store volumes and the current instance does.
--     Before migrating, you might need to back up the data on your
--     instance store volumes if you want to preserve them. For more
--     information, see
--     <https://aws.amazon.com/premiumsupport/knowledge-center/back-up-instance-store-ebs/ How do I back up an instance store volume on my Amazon EC2 instance to Amazon EBS?>
--     in the /Amazon Web Services Premium Support Knowledge Base/. For
--     more information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html Amazon EC2 instance store>
--     in the /Amazon EC2 User Guide for Linux/, or see
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/InstanceStorage.html Amazon EC2 instance store>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@VirtualizationType@__ — The recommended instance type uses the
--     hardware virtual machine (HVM) virtualization type and the current
--     instance uses the paravirtual (PV) virtualization type. For more
--     information about the differences between these virtualization
--     types, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html Linux AMI virtualization types>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#virtualization-types Windows AMI virtualization types>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@Architecture@__ — The CPU architecture between the recommended
--     instance type and the current instance is different. For example,
--     the recommended instance type might use an Arm CPU architecture and
--     the current instance type might use a different one, such as x86.
--     Before migrating, you should consider recompiling the software on
--     your instance for the new architecture. Alternatively, you might
--     switch to an Amazon Machine Image (AMI) that supports the new
--     architecture. For more information about the CPU architecture for
--     each instance type, see
--     <http://aws.amazon.com/ec2/instance-types/ Amazon EC2 Instance Types>.
--
-- 'performanceRisk', 'instanceRecommendationOption_performanceRisk' - The performance risk of the instance recommendation option.
--
-- Performance risk indicates the likelihood of the recommended instance
-- type not meeting the resource needs of your workload. Compute Optimizer
-- calculates an individual performance risk score for each specification
-- of the recommended instance, including CPU, memory, EBS throughput, EBS
-- IOPS, disk throughput, disk IOPS, network throughput, and network PPS.
-- The performance risk of the recommended instance is calculated as the
-- maximum performance risk score across the analyzed resource
-- specifications.
--
-- The value ranges from @0@ - @4@, with @0@ meaning that the recommended
-- resource is predicted to always provide enough hardware capability. The
-- higher the performance risk is, the more likely you should validate
-- whether the recommendation will meet the performance requirements of
-- your workload before migrating your resource.
--
-- 'projectedUtilizationMetrics', 'instanceRecommendationOption_projectedUtilizationMetrics' - An array of objects that describe the projected utilization metrics of
-- the instance recommendation option.
--
-- The @Cpu@ and @Memory@ metrics are the only projected utilization
-- metrics returned. Additionally, the @Memory@ metric is returned only for
-- resources that have the unified CloudWatch agent installed on them. For
-- more information, see
-- <https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent Enabling Memory Utilization with the CloudWatch Agent>.
--
-- 'instanceType', 'instanceRecommendationOption_instanceType' - The instance type of the instance recommendation.
--
-- 'rank', 'instanceRecommendationOption_rank' - The rank of the instance recommendation option.
--
-- The top recommendation option is ranked as @1@.
newInstanceRecommendationOption ::
  InstanceRecommendationOption
newInstanceRecommendationOption =
  InstanceRecommendationOption'
    { platformDifferences =
        Prelude.Nothing,
      performanceRisk = Prelude.Nothing,
      projectedUtilizationMetrics = Prelude.Nothing,
      instanceType = Prelude.Nothing,
      rank = Prelude.Nothing
    }

-- | Describes the configuration differences between the current instance and
-- the recommended instance type. You should consider the configuration
-- differences before migrating your workloads from the current instance to
-- the recommended instance type. The
-- <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html Change the instance type guide for Linux>
-- and
-- <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-resize.html Change the instance type guide for Windows>
-- provide general guidance for getting started with an instance migration.
--
-- Platform differences include:
--
-- -   __@Hypervisor@__ — The hypervisor of the recommended instance type
--     is different than that of the current instance. For example, the
--     recommended instance type uses a Nitro hypervisor and the current
--     instance uses a Xen hypervisor. The differences that you should
--     consider between these hypervisors are covered in the
--     <http://aws.amazon.com/ec2/faqs/#Nitro_Hypervisor Nitro Hypervisor>
--     section of the Amazon EC2 frequently asked questions. For more
--     information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances Instances built on the Nitro System>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#ec2-nitro-instances Instances built on the Nitro System>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@NetworkInterface@__ — The network interface of the recommended
--     instance type is different than that of the current instance. For
--     example, the recommended instance type supports enhanced networking
--     and the current instance might not. To enable enhanced networking
--     for the recommended instance type, you must install the Elastic
--     Network Adapter (ENA) driver or the Intel 82599 Virtual Function
--     driver. For more information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html Enhanced networking on Linux>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html Enhanced networking on Windows>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@StorageInterface@__ — The storage interface of the recommended
--     instance type is different than that of the current instance. For
--     example, the recommended instance type uses an NVMe storage
--     interface and the current instance does not. To access NVMe volumes
--     for the recommended instance type, you will need to install or
--     upgrade the NVMe driver. For more information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nvme-ebs-volumes.html Amazon EBS and NVMe on Linux instances>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/nvme-ebs-volumes.html Amazon EBS and NVMe on Windows instances>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@InstanceStoreAvailability@__ — The recommended instance type does
--     not support instance store volumes and the current instance does.
--     Before migrating, you might need to back up the data on your
--     instance store volumes if you want to preserve them. For more
--     information, see
--     <https://aws.amazon.com/premiumsupport/knowledge-center/back-up-instance-store-ebs/ How do I back up an instance store volume on my Amazon EC2 instance to Amazon EBS?>
--     in the /Amazon Web Services Premium Support Knowledge Base/. For
--     more information, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html Amazon EC2 instance store>
--     in the /Amazon EC2 User Guide for Linux/, or see
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage Networking and storage features>
--     and
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/InstanceStorage.html Amazon EC2 instance store>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@VirtualizationType@__ — The recommended instance type uses the
--     hardware virtual machine (HVM) virtualization type and the current
--     instance uses the paravirtual (PV) virtualization type. For more
--     information about the differences between these virtualization
--     types, see
--     <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html Linux AMI virtualization types>
--     in the /Amazon EC2 User Guide for Linux/, or
--     <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#virtualization-types Windows AMI virtualization types>
--     in the /Amazon EC2 User Guide for Windows/.
--
-- -   __@Architecture@__ — The CPU architecture between the recommended
--     instance type and the current instance is different. For example,
--     the recommended instance type might use an Arm CPU architecture and
--     the current instance type might use a different one, such as x86.
--     Before migrating, you should consider recompiling the software on
--     your instance for the new architecture. Alternatively, you might
--     switch to an Amazon Machine Image (AMI) that supports the new
--     architecture. For more information about the CPU architecture for
--     each instance type, see
--     <http://aws.amazon.com/ec2/instance-types/ Amazon EC2 Instance Types>.
instanceRecommendationOption_platformDifferences :: Lens.Lens' InstanceRecommendationOption (Prelude.Maybe [PlatformDifference])
instanceRecommendationOption_platformDifferences = Lens.lens (\InstanceRecommendationOption' {platformDifferences} -> platformDifferences) (\s@InstanceRecommendationOption' {} a -> s {platformDifferences = a} :: InstanceRecommendationOption) Prelude.. Lens.mapping Lens.coerced

-- | The performance risk of the instance recommendation option.
--
-- Performance risk indicates the likelihood of the recommended instance
-- type not meeting the resource needs of your workload. Compute Optimizer
-- calculates an individual performance risk score for each specification
-- of the recommended instance, including CPU, memory, EBS throughput, EBS
-- IOPS, disk throughput, disk IOPS, network throughput, and network PPS.
-- The performance risk of the recommended instance is calculated as the
-- maximum performance risk score across the analyzed resource
-- specifications.
--
-- The value ranges from @0@ - @4@, with @0@ meaning that the recommended
-- resource is predicted to always provide enough hardware capability. The
-- higher the performance risk is, the more likely you should validate
-- whether the recommendation will meet the performance requirements of
-- your workload before migrating your resource.
instanceRecommendationOption_performanceRisk :: Lens.Lens' InstanceRecommendationOption (Prelude.Maybe Prelude.Double)
instanceRecommendationOption_performanceRisk = Lens.lens (\InstanceRecommendationOption' {performanceRisk} -> performanceRisk) (\s@InstanceRecommendationOption' {} a -> s {performanceRisk = a} :: InstanceRecommendationOption)

-- | An array of objects that describe the projected utilization metrics of
-- the instance recommendation option.
--
-- The @Cpu@ and @Memory@ metrics are the only projected utilization
-- metrics returned. Additionally, the @Memory@ metric is returned only for
-- resources that have the unified CloudWatch agent installed on them. For
-- more information, see
-- <https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent Enabling Memory Utilization with the CloudWatch Agent>.
instanceRecommendationOption_projectedUtilizationMetrics :: Lens.Lens' InstanceRecommendationOption (Prelude.Maybe [UtilizationMetric])
instanceRecommendationOption_projectedUtilizationMetrics = Lens.lens (\InstanceRecommendationOption' {projectedUtilizationMetrics} -> projectedUtilizationMetrics) (\s@InstanceRecommendationOption' {} a -> s {projectedUtilizationMetrics = a} :: InstanceRecommendationOption) Prelude.. Lens.mapping Lens.coerced

-- | The instance type of the instance recommendation.
instanceRecommendationOption_instanceType :: Lens.Lens' InstanceRecommendationOption (Prelude.Maybe Prelude.Text)
instanceRecommendationOption_instanceType = Lens.lens (\InstanceRecommendationOption' {instanceType} -> instanceType) (\s@InstanceRecommendationOption' {} a -> s {instanceType = a} :: InstanceRecommendationOption)

-- | The rank of the instance recommendation option.
--
-- The top recommendation option is ranked as @1@.
instanceRecommendationOption_rank :: Lens.Lens' InstanceRecommendationOption (Prelude.Maybe Prelude.Int)
instanceRecommendationOption_rank = Lens.lens (\InstanceRecommendationOption' {rank} -> rank) (\s@InstanceRecommendationOption' {} a -> s {rank = a} :: InstanceRecommendationOption)

instance Core.FromJSON InstanceRecommendationOption where
  parseJSON =
    Core.withObject
      "InstanceRecommendationOption"
      ( \x ->
          InstanceRecommendationOption'
            Prelude.<$> ( x Core..:? "platformDifferences"
                            Core..!= Prelude.mempty
                        )
            Prelude.<*> (x Core..:? "performanceRisk")
            Prelude.<*> ( x Core..:? "projectedUtilizationMetrics"
                            Core..!= Prelude.mempty
                        )
            Prelude.<*> (x Core..:? "instanceType")
            Prelude.<*> (x Core..:? "rank")
      )

instance
  Prelude.Hashable
    InstanceRecommendationOption
  where
  hashWithSalt _salt InstanceRecommendationOption' {..} =
    _salt `Prelude.hashWithSalt` platformDifferences
      `Prelude.hashWithSalt` performanceRisk
      `Prelude.hashWithSalt` projectedUtilizationMetrics
      `Prelude.hashWithSalt` instanceType
      `Prelude.hashWithSalt` rank

instance Prelude.NFData InstanceRecommendationOption where
  rnf InstanceRecommendationOption' {..} =
    Prelude.rnf platformDifferences
      `Prelude.seq` Prelude.rnf performanceRisk
      `Prelude.seq` Prelude.rnf projectedUtilizationMetrics
      `Prelude.seq` Prelude.rnf instanceType
      `Prelude.seq` Prelude.rnf rank
