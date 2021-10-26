Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGB5-000388-F8
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAy-00035T-7H; Tue, 26 Oct 2021 02:43:13 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAr-0008KZ-1O; Tue, 26 Oct 2021 02:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230584; x=1666766584;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=tH/PIoJJbIYumKYILPXlYcXfcr+dUgOQgtkUes9SrB0=;
 b=rpZKZboe2n9WtLakfL+cEcM30dJzonl23mTz55d9y00f4ygQHPVOutoc
 5gl1Gfx3WXoh/ZnHhVNniQwjdSzz1JOeQ6YsWoszb8F4UwwqoP4eav83Q
 4eFONXMXgOvVTxQ1KUrocEebfv2YxqxYeTGF8pPg2xRHdcpy5mjN81tv/
 tsCQuCVR4Fs7EMrJ6JjV2CdiIuwix9vRMwMRQ//D/kKB+6fyvs8wHk+re
 +u5mOySsrM3p+bXc4EftiHgpOHxujJZU2Iy1l1Hl6GspeVDpp3r2t47L0
 nfFM5ZLQz8xrBShXkyzlFfWzC/lHL/BA8thGiMAkZRww/uFXC1ZB9/eVF A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188620384"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:42:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNmZuzekYx8jJPrW2B36N400s+PUN/Ayex1G4bhG7UgSTJlQJAH/d7Si3yqGkRXQSfgGM9t6G6onHIuQtMFy1pMJ3BlC7Sg01i+Ici29G5fhJXDaMbzjkoAuTXi7Hr0Tzby5SFYTi8evUfgk30QbWDRpF3rF2Ninpgy2/12h8NEFh8eBtD4+PC0TsQbM3cJ0ZVk8k9pPLEl52+I1orirbPdnt+Ql4SZGQptxI6nlDwa6cf2sdba8hEGRc8vmdowtoEZXN2xMyvh11naJ7EXHMMFjX6AbkAohLUQ/4/Q3X9f5OQLvrZtKb6eGcCuqfC5/K2qVauSTVWqJrkHQvOE3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJB37MC0b7DU9/dRnT43hxGVUmVGe2TrBaT1LM1swus=;
 b=JqhJd2GtXzuD5Q8C0h3lVkc5gd9QNP6nJp5NkEPP4kyShY3mK3prTaDyRAm+oPuPILU7wA4gv/SwHBjKcfAzOsg03znUXes4lpO8pjO8PM6am55g4ewloKLCAEBmbCv/2z+z5Edz/0RDH7uxQkvfIwIPNM67XB7T0KmWWw8CIeEyCs9X2rDfkfurHH92hPFAB+tY6LYa6HnWoMfFCIC2f0YAyE4iizdmNv5Uy0iGePcDHKfx9+dFBO7wz2xqYZ6z8Afd940Erva16tiTDflInQhzCOzHjXPx4FQ6ixY7D/cQOYuTY/tpY4bFRJZ6JKBaxQJEDXoWFL4Qs5kzOffwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJB37MC0b7DU9/dRnT43hxGVUmVGe2TrBaT1LM1swus=;
 b=dretG+Tze8QHcluYo3QWX4Ew3FKLID9o73K/4qNHzW9W5i1VsGiExE87/TsGjf5/dBSF6cDBL1U2VdT10XuV1NI1HC/Co5l1M5FZvAw+ynt4/GG2iZJobiOGSJG7mE84V1ckwjxC34hUiiULU8JTEQ/6Qvv6AUhRqiao2QpTfQQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8394.namprd04.prod.outlook.com (2603:10b6:303:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 06:42:54 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:42:54 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 00/22] QEMU RISC-V AIA support
Date: Tue, 26 Oct 2021 12:12:05 +0530
Message-Id: <20211026064227.2014502-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:42:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c938a78-69df-467f-37e7-08d9984bd698
X-MS-TrafficTypeDiagnostic: CO6PR04MB8394:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8394CA6FE78DE552AF6B02438D849@CO6PR04MB8394.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQEp0AYuXdEzSZPWKw3Ta/kWC/iZoNSCpZv6KBzzDghBgmDh83oa+qgNzGV1mXTxUMhiUSFZS47kgCu3/6SsaKtxfHYdtVBSmb/XuKeA139hdGdnpCtFt7AMNBNc7NV93JxN49a0j4PW02wEizGGjqAuitTEJBEhZcHmqryG3niCKZpqNjN6oDOgqpoopqJVI4soCqiCks56YrlpKNc5tcLAkh+ltVIOkI2u6nOfBXfc2RdyLZaevSVdh0yGiEjNcR8SrxlqSVmnNMVKLAEKr5ZmafkNbKxMxn7/I38Mc6+YAeyBTu4UY9bDuIRV7rThbhxWe6xhNulSLfe/bo8sfirVHQiOilZ7u0cCucyZHX9oBY6gIvg+yOetZYPSronADiZmp5vSpLfvoXCrX44xIjFy01h4LopJgktkF5rgjW3R1bnO0tUv6XZWcF/AmonS1Mk6c+hhWPzm0Z7EThxbfk2V9weKS8xFnMnNnUoQseYY3XebFzleofzeWBCAdhldS1gqTN8QJ7KyGFmiKF+l2Wcn3yfBuOo1vBA3YcghyDxFHgkCN3K+NRMXijXZki7zEu4NTv9ZqLZZ7VTou85ZwOQorcWZgVj6vS9vzVpaTgtjcw30mTxWk8WHK0ag4IYVCMHyLIN2Cm6dHuTeKyzquH0EAEuIqMVppuwv7DEBfl0S86O4OnLKu4jseZ5Zb+5RZm3OBzO5EdJHEjrKw6vFyhL9S53EhOn7r50GXj9shdZmDdCdQ6w8FszDgdz+e/ol/IfEFsRAY0xfs7gahbQBPGioBIeULm6w1yWd5eHQyDGRIhfiAJIWqV8X0Vfbawdh2Hjm2wk4yrAvZA0j36XUPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(83380400001)(8886007)(966005)(508600001)(6666004)(8936002)(44832011)(82960400001)(8676002)(5660300002)(55016002)(186003)(26005)(36756003)(1076003)(38350700002)(66556008)(38100700002)(66476007)(66946007)(316002)(52116002)(7696005)(4326008)(86362001)(54906003)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rueAFnmjuHlctUHTQPQhmQ5mZT7kOJk165clgDm9oc/LzDxW8f/D+heE6LFO?=
 =?us-ascii?Q?FCNVpV8Mmj8IloRA2fb8rRGWarPvmKuLfXvbDMCmCL6LVSXoMF+4ELt1CLs0?=
 =?us-ascii?Q?74wlb2Z9zTtQOViLzP5WfAUCZ5WzV4mmtxOdeSz/ACaZoub+dAj7fgmo5L9T?=
 =?us-ascii?Q?HUpS4a7MzBfp3S84NTrkTUyLO6s0ujaVBr0KnGV3M4OFL6b+4/YR5nwyeNUS?=
 =?us-ascii?Q?apC5UVxzVUJcSMHhdeIzF/ndh/jDHuxOM9peDBHirN8bz7ntCqmD2GePZ0h0?=
 =?us-ascii?Q?H5vXcqpYjMqhQtlBdffdIWaBd4h19G6DX/9ZreeMf627A4f7trg0HYwZdkZD?=
 =?us-ascii?Q?ZvQnlOGS9vjuF0/hzyFovx2Hm4hhHggKQyTZo1d7D9fWdGr/YBAWucFYHNi6?=
 =?us-ascii?Q?RnpQ0cD0lxEu6z3yP64Umgr+oT89juiSMxq2Lp9qvCRWKbO9d5/MZOnvhp0J?=
 =?us-ascii?Q?TKg46NB9eaD2zHQW8dBmNIKsxt7EntfGJWX7LOAyh7bQPioHoWqLbiOYqZlm?=
 =?us-ascii?Q?ADDlPdwGgXhxYNLw7B6gev3uAJ4OPSwApClLQ722yTeuO697AKbGsnPXBwuX?=
 =?us-ascii?Q?CQLEQjOP7j8UAumvwb9odeMmIBvO3ytkyM5I+0gEY229lpfiZV5Ykpx8vsS7?=
 =?us-ascii?Q?FXNPAM6t0htWz942SDVL3l2Xd27/8jgejdM1Ba6rEG76XsSa3zxqcmnExNXP?=
 =?us-ascii?Q?MzD6GVvBhPu6rkw12HFlEGqWss1ym5No/JzopQjMQHH2ku6L0Z/rUhbETpa7?=
 =?us-ascii?Q?VFOJqonaWPxuCFd1gypXp77X9OvSdy9AHkJ/oqR//6N0dYpAp6pnmVnLdkos?=
 =?us-ascii?Q?qRVRQDHRg5Lo7zLA71TrZF8H1jm4ofgpzJUVSO9IlHlGOOnbE8QOuW7zUYN0?=
 =?us-ascii?Q?cZaRdIEu/dbIwBCd4WOiXyqMMsVw3wwED7bvXSNXd2MmGB5ghUgFAFKVRNKQ?=
 =?us-ascii?Q?nu+qpBPBQvSpRBPU7dJQCBtQCaEVAvzKw1PZOjcCoe8L1WmJ8Z/yxNlAzddb?=
 =?us-ascii?Q?Yxr00ugD/YY8q3g8XY+QVLiJIr2D4ayGkTkjp53QRNfiR3D2W+aEtFz+ST3z?=
 =?us-ascii?Q?73/Ky0PzzyM0uJm6s1WmVwfrEcDITRJVyAxeyXvnlViI3orMqW/NPGF5WJti?=
 =?us-ascii?Q?vWp7/qrxiBbyEC8jEbK749+bj272Zn7d9icHU4QSEpkP/YSYmZ8MEENY4V1C?=
 =?us-ascii?Q?mPrlLFaMpauwSkmX+pHgc3wAqG0zji/mvhQe4HfRIQ474ItQZ95nSKsGiqi6?=
 =?us-ascii?Q?skmt7fsYEVevwbtWfxIaGayCS73Aq5jVJaIT5u6hR/9tJM9J9cJme7vvIJS2?=
 =?us-ascii?Q?e0avCS3iIeNGGPlX1C/hCtGP0s8VqakQ9wF4wAecmTL7W06YaV4wlfjmPuxY?=
 =?us-ascii?Q?AL8Z2UKjDgdl8JJjgKKEjbBFIf090ApNq0xHDyRKlq1hV5Zhsh2IDthHvK9r?=
 =?us-ascii?Q?pFxi0Kt85p0xiloe/S07bd6EMp4muYC5ZFQC9K+B5k88+95l78nNVgAjVXA5?=
 =?us-ascii?Q?XOf/EX3DRe9QvepYIErPzVT2A+P3ChwxumsNDMNMHqLGVnK+wQaGwDtwNmt/?=
 =?us-ascii?Q?OyuvFGRdCgGrST3PoDbiG1wdvLTtcpnwbrpOds/0pPgLliXGH1lWiY49jxCE?=
 =?us-ascii?Q?eeLIvrqrklw65nne1RUEA0c=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c938a78-69df-467f-37e7-08d9984bd698
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:42:54.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKAP5JbYMSipqgejO7To3w7oXmsNWCwicD0EJsvJJDnRoY06qoWbhudu7oHHiKd0CZbC/N/uPvpf3hZ9bUk5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8394
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Oct 2021 06:43:13 -0000

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
https://github.com/riscv/riscv-aia/releases/download/0.2-draft.27/riscv-interrupts-027.pdf

This series adds RISC-V AIA support in QEMU which includes emulating all
AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
not implemented because we don't have any local interrupt greater than 12.

To enable AIA in QEMU, use one of the following:
1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
   in the QEMU command-line
2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
   in the QEMU command-line
3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
   machine parameter in the QEMU command-line
4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
   "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
   command-line

To test series, we require OpenSBI and Linux with AIA support which can
be found in riscv_aia_v1 branch at:
https://github.com/avpatel/opensbi.git
https://github.com/avpatel/linux.git

This series can be found riscv_aia_v4 branch at:
https://github.com/avpatel/qemu.git

Changes since v3:
 - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,xyz"
   DT properties because "aplic" and "imsic" are not valid vendor names
   required by Linux DT schema checker.

Changes since v2:
 - Update PATCH4 to check and inject interrupt after V=1 when
   transitioning from V=0 to V=1

Changes since v1:
 - Revamped whole series and created more granular patches
 - Added HGEIE and HGEIP CSR emulation for H-extension
 - Added APLIC emulation
 - Added IMSIC emulation

Anup Patel (22):
  target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64
    HS-mode
  target/riscv: Implement SGEIP bit in hip and hie CSRs
  target/riscv: Implement hgeie and hgeip CSRs
  target/riscv: Improve delivery of guest external interrupts
  target/riscv: Allow setting CPU feature from machine/device emulation
  target/riscv: Add AIA cpu feature
  target/riscv: Add defines for AIA CSRs
  target/riscv: Allow AIA device emulation to set ireg rmw callback
  target/riscv: Implement AIA local interrupt priorities
  target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
  target/riscv: Implement AIA hvictl and hviprioX CSRs
  target/riscv: Implement AIA interrupt filtering CSRs
  target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
  target/riscv: Implement AIA xiselect and xireg CSRs
  target/riscv: Implement AIA IMSIC interface CSRs
  hw/riscv: virt: Use AIA INTC compatible string when available
  target/riscv: Allow users to force enable AIA CSRs in HART
  hw/intc: Add RISC-V AIA APLIC device emulation
  hw/riscv: virt: Add optional AIA APLIC support to virt machine
  hw/intc: Add RISC-V AIA IMSIC device emulation
  hw/riscv: virt: Add optional AIA IMSIC support to virt machine
  docs/system: riscv: Document AIA options for virt machine

 docs/system/riscv/virt.rst    |   16 +
 hw/intc/Kconfig               |    6 +
 hw/intc/meson.build           |    2 +
 hw/intc/riscv_aplic.c         |  970 +++++++++++++++++++++++++
 hw/intc/riscv_imsic.c         |  443 ++++++++++++
 hw/riscv/Kconfig              |    2 +
 hw/riscv/virt.c               |  694 +++++++++++++++---
 include/hw/intc/riscv_aplic.h |   73 ++
 include/hw/intc/riscv_imsic.h |   68 ++
 include/hw/riscv/virt.h       |   40 +-
 target/riscv/cpu.c            |   97 ++-
 target/riscv/cpu.h            |   67 +-
 target/riscv/cpu_bits.h       |  132 ++++
 target/riscv/cpu_helper.c     |  300 +++++++-
 target/riscv/csr.c            | 1273 ++++++++++++++++++++++++++++++---
 target/riscv/machine.c        |   24 +-
 16 files changed, 3901 insertions(+), 306 deletions(-)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1


