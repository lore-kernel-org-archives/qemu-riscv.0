Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D489C3DA79
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 01:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPXy2-0007Sp-Uv; Mon, 15 Jan 2024 20:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rPXxs-0007Pb-2p; Mon, 15 Jan 2024 20:10:04 -0500
Received: from mail-sh0chn02on2062c.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::62c]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rPXxk-0005hs-G3; Mon, 15 Jan 2024 20:10:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik+qEhPUteo3ZYc1v6l7aLf796yD4DF+akQXK2J1OW125d75ZQNbZgufrJh4+78Sr7KTXHEPGsjSmnELKI3WaCCAHPUGq0BCNGF0PN2yYsIwfUvtkzXAYZY7RJ2k/tENuruA8wan0jrtTVQeYeF/8YN3hwbZmNd/0yYCCmeB52g/BI8kWB8fKGPK0M3616NSIKjW/wX1Ogze/r1MrJcs4Cz6x7xSUbr5MsVwilETw1xbpLyGtuWtPEHBd6YWH+CwxvaLAVUVU7oJqSqwFebVS+CbWoucIkp2tRNZdFClTQelfHHniLZMGpr7bv7WydAV3JCImGEcjbL4ZgrNFoOFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=493pUU49l9KD7HnBf5Ra222ZudvCFsIrdMRpjyeBkRs=;
 b=e1/DLVwBV06xw+IRS6KQuI8IzPTDdXE+x125cu0UxpQ2Xq8Wz8SSGzq1LyzYyxhroISDTpTyv8Dp1en5ixrbCmSvkngTIFOYpLElnq8NJzacsPBkgOrFDfJSg1ewTI/ucFRKhe2Ba+mEhUaMEa2ZmeLGP7xeB3pmKWmWRzZepmv7v8KuLy0ExLz9x63nf9iKvnfnvndgJSVDdH/9NOlzyvzYkaA7aGyCnTnR6vnM7WzEftMGwgEBEk1MaxUSCsa3D0XZ8bP+WxDbKt/fTVQli7TSd4ZJywhzaGpPagCp7Yh60qnDjCkFH9qgq51ii5GiMj0SsiujBGlqlTNOcjJ2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14) by SHXPR01MB0527.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.33; Tue, 16 Jan
 2024 01:09:43 +0000
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f]) by SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f%3]) with mapi id 15.20.7135.033; Tue, 16 Jan 2024
 01:09:43 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [PATCH v2 0/2] RISC-V: ACPI: Enable SPCR
Date: Mon, 15 Jan 2024 17:09:28 -0800
Message-Id: <20240116010930.43433-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0574:EE_|SHXPR01MB0527:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2328b6-9f03-4b27-f4fb-08dc162fd294
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJ6fRK6OWWqYCSBnoIFyapLVrytCyHQUGbDeMHoX0iOyfSgR6ZoDqeeRtPJnhbxf/Qaf6K9NurDo1qKQEtsOQcwql58Ig4WNe7vEwfa2Bid0/Ek5eaVLaQLNLdLZu9swJthtAunE31uugenjVVIfhRh895WeC5abrg9143oagJrwl5eAFBuvdLSn8k64EegYDg8bwhdybFREyxhd34LVsfYGUEi2PNu9vNDFsDNg5p80s7Vns4LjrrjA5Yj4W4sNR/D305R/wnVSnzqQOyqiKe6I/d4L7gjcXGDKvW+kQV3P8RK34RC0WItuVNUozvwrxypwogdxikjMRqDz747etWpW90cBIekk3OHxFrwM5WAGhWxtfQh1lSRIxX3foZJOT7TGPBMi+3Guxoxdfh4BWiNnHhE3Fb9OqlnM2Y1oDdc4gWWv6a1McS1s4QYCOHqdDdifstUsYjPUUzHIPnRjAUKlZUvLGK654oCc4OuzBIQ+qQSumy8EO06cWd+xe+OHiR2byeGKdKIJ2//ndgTZ0Kploo/Ak4TGSqtFgL5UJ1SJpelZwOY/YbuHiFjS1BVR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39830400003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(1076003)(26005)(41320700001)(8936002)(83380400001)(41300700001)(66556008)(66476007)(8676002)(66946007)(508600001)(966005)(86362001)(6666004)(2616005)(36756003)(2906002)(38100700002)(38350700005)(5660300002)(40160700002)(52116002)(7416002)(4326008)(40180700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z2OPIZjdfcNijtSW/JMTq5PBKXhsOmPUld2OcjfJh56I4Bxh2BScZOmg9iL2?=
 =?us-ascii?Q?cyJDRmk+31H1JGuEC81H7hEUkRPl4u7CnNteLG5dsXGogHo7m0h3+MRqVHFv?=
 =?us-ascii?Q?7GY6hTHv0jiBXoO8WIJrAYQVlzofFooisCh0KSYoR0jLNtDr0XpnGKPSJZom?=
 =?us-ascii?Q?e7A5MldqvvFCRNDv8ZpjvdX9MyGydLAgFB8mpjsjH2zsv/AsQ5lU3fFzFASx?=
 =?us-ascii?Q?tkSzW0gucltABrc8FFTJ/QR/1QLWXGHHr6PlM6huz5SjmUyAOVCXC1wp+K0w?=
 =?us-ascii?Q?OZ0Blaj2SUfOwiGtmGytILN/Wcn3IVl7rPPylaU9+SJD/lryIP4IuRaFzqeS?=
 =?us-ascii?Q?s83vM3a0/8uugBRZczy3OZ01EzxMyCE7b5PWKtjcNtOwuK7zNzH7fNKnaWEe?=
 =?us-ascii?Q?mZ9rYja7wDw/JWaOIfdbd9HgcMJox20hOzNitO4wdhl7X5ro9/yg3m2vIV6P?=
 =?us-ascii?Q?q3ev0QIXcH8+5lo6rCeS36RQCdXA4hj3Qhfp51I7gz8+8dwKYugZmqOlV3OD?=
 =?us-ascii?Q?HrqLUQz+gDryDGFXpabzdZMIilwIsGiijwbJSgsQYTBwzgLVWdrTaGpEGmz4?=
 =?us-ascii?Q?V8fVAxw38LBrpWEOJvbqESinxZivgJnQGNcCT1JKjyvcVeOkfdGcYBU7hz3U?=
 =?us-ascii?Q?5Kp+mNastPaEMtjmAy2xeiZjnvPd3jeXHCkltYqxKj8/28EA7vmhlsFG16PZ?=
 =?us-ascii?Q?5lJxASndU3tjoCeweTMuBlOUf04tUfoOuVuRgO6oJTwWeK/00iNtJ8O43J0a?=
 =?us-ascii?Q?kzxaQMC9cwocY6BUkrHbHgTMsYvwz5rztO+JaMoXJ0boeAFSM64Z2R0ASXfT?=
 =?us-ascii?Q?vvVBlUXONIIQ3hfX2ZGeGM2e8oc429lh9DCaadQyCvxAJuw8FfjLwwbRuffp?=
 =?us-ascii?Q?bSnUfo4kf7S9Vi+LpfdzsIaGo4ItTvKp+px78xmFPaYd9b4KLbW4QvDG1p3Y?=
 =?us-ascii?Q?PZrPmFkCPFFs+FAslNQA9XMDgBoTVI86c97mHGw0Iw7VeuCzBTS400dQPbto?=
 =?us-ascii?Q?sFx54Pmr+voVQpdbhOROAYu7eethTjwqEle+16O2lLdCy8h40Rb2cov6LOJL?=
 =?us-ascii?Q?rTlT2FPoBN31QKe4p/AE+/tyb+7laA5xnS8iK1PLNTvZ4sIB7LiRTvqtYqwY?=
 =?us-ascii?Q?05bqtFWiJCvmp9IJwvf356b7NnUUqc3NqbAuwtuP+VF20bINBMrsFQPyT53U?=
 =?us-ascii?Q?ueXZcfIXbBB8sWz4aF/H2e1UMhCqRopyvnR7gCQhOyvhrkCGS5b/rzMjObOd?=
 =?us-ascii?Q?eGWBUPeqFDOBguW5heTLYiGesIPAOB2zWjiJ5GDBz3T4X7m8eS0CkIO5REL0?=
 =?us-ascii?Q?3ctDo/XolmW3wUS+Q6lfLnKN++70d+Uop+9RYCSMDlPw4VklE4bOECaGFVdN?=
 =?us-ascii?Q?PzI0zCXSn+yzE+8cUnuRXAAL2dRU8PGglaf+OxZ+y+aKkUyrZVOUESKhEOsl?=
 =?us-ascii?Q?5MSlbRMj65KxJHFhm747LC/Gj3Dp/z9Km/IzMshPdMCxu6h4UdKq4nEzHD/1?=
 =?us-ascii?Q?Juvo80OkCu2HJjdznzJuuceQ4kAC37vE2HHDw/hyhYBU9omIWfkeNuS+DcnL?=
 =?us-ascii?Q?IFYaFG5yQUQVmUavK5rvd6H/8PQbmXusNuOn7w1mgr1tlHj+JnxqCzjB8Fi1?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2328b6-9f03-4b27-f4fb-08dc162fd294
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 01:09:43.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdnHhMcMtYzcvw5mIp87MZFF5waBAiF9PAB12VUXsHQlMnVGS9f1cencT98os+Zd7c5W1kKKSkZWLWc1vhk1SW++xrwUJOX+h/wdWuAA0ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0527
Received-SPF: pass client-ip=2406:e500:4420:2::62c;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This series focuses on enabling the Serial Port Console Redirection (SPCR)
table for the RISC-V virt platform. Considering that ARM utilizes the same
function, the initial patch involves migrating the build_spcr function to
common code. This consolidation ensures that RISC-V avoids duplicating the
function.

The patch set is built upon Alistair's riscv-to-apply.next branch

Changes in v2:
- Renamed the build_spcr_rev2() function to spcr_setup().
- SPCR table version is passed from spcr_setup() to the common
  build_spcr() function.
- Added "Reviewed-by" from Daniel for patch 2.
- The term 'RFC' has been removed from this series, as the dependency code
  from [1] has been merged into Alistair's riscv-to-apply.next branch. The
  first series of this patch can be found at [2].

[1] https://lore.kernel.org/qemu-devel/20231218150247.466427-1-sunilvl@ventanamicro.com/
[2] https://lore.kernel.org/qemu-devel/20240105090608.5745-1-jeeheng.sia@starfivetech.com/

Sia Jee Heng (2):
  hw/arm/virt-acpi-build.c: Migrate SPCR creation to common location
  hw/riscv/virt-acpi-build.c: Generate SPCR table

 hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
 hw/riscv/virt-acpi-build.c  | 39 +++++++++++++++++++++
 include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
 include/hw/acpi/aml-build.h |  4 +++
 5 files changed, 154 insertions(+), 41 deletions(-)

-- 
2.34.1


