Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCgg-0001wn-5k
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgc-0001u0-J9; Sat, 23 Oct 2021 04:47:30 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:3734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgZ-0006qt-F8; Sat, 23 Oct 2021 04:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978847; x=1666514847;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=CwTtXSuO8dYS2RyVfTRLoeQ0BRrmUFINlx3sqmc9TY0=;
 b=h1OPscxZhLhDcupsYNY06amNK0bd67SnuGA3Gw1+ezsXNn/0Mt/DZj02
 nhvamZSCE2ul24yPfbbjlPo6h6gbCCyRC+PsP6AT4HNLNlNL1cyeaq57t
 1KccU6snuldSEdpj+EEdu/1sNULpZ92thbM73zjJsQriQIudJ3MZoBWJM
 KAG9m73re3mzZTIlh+b8Y0Jbd7DSpMoRn3dkGfHf4N2QcLGTzLNJk11NA
 IuXVw9hFPJhHkqeOo2agSzcEFD0SuEhg4hNkPD5xVNZfTY3pyp7nekxc1
 3sQm6yoNt97tJ502TAkdowmW5XA2hq/fXmZUn6ojVlLNRbOcK3P9Y/nFY Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="287539669"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/RwyzmqWT5zTDXcqLr4ThZlzqubIyQCwMWSBjCWQ9eTwgTKslPIjbxV23bbLk/GgjLu0rXI+oh/rR2CBKG2CyKd6TCwlDqpTd89Et2XE5+9l5xJX0k8yHu0+qblLkMV8OqIZ+k6Mpw+TStfjlTTUeJQygkNr/YsOw4VIaXnsH9p5QGxYzlkCENsvUnbCBRPJAEMO/CCINI4PEW1TMiZ8Z0TdTLK1FZIbXV3v1qR9MTrvMU9b3+V/VrOTrpOcJ6uQurM9lOAOZ8VzohfiQCZ2BiPWmorZS99MAU9sLH6/TWPpoKWCSVOMM0Ypizb7n9FsN13U3TFG8EN87PsAoxaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyeD5jethn2WNtpFtrHabgoqTnT/tQEaf+zOiK7HjPI=;
 b=LIBeGju9KP5hKaXEZag1cHh/O8xr/OGtGqSmB3XCoTau9J1RQF32inI22kOZaT4KA61haSr3LW1Ic8tEfy+rJk6aDTAkxQFPOFXnTAguRQ9UGnhi1qoxsvzHlYqfdZ2F5E7FE/ZsaBvqs4ctBNXwKRN/JihbGq8ZIFJS7m3pnWM4P0geRR9olOHn2nYJCshO+wS+UjT5f5kwHZYi9tCTe9ikmKGGocp6lcmhGuMlI/ELhgRNWaCmWc7m0TFtilAvi9p6VTP5dDkgV01p6s6JIZeksvndEXUIqPINHhofyRe/h2vkisLFMpwio5pMUFYaEHo4vZ/VotA03OV/7MD/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyeD5jethn2WNtpFtrHabgoqTnT/tQEaf+zOiK7HjPI=;
 b=ovRDUv8C/+/15mCrVVRSEsgkRNI264wHNtsv3+wWOPHJYn/3rhkr84GT8o+Kyf7cMUmWWzkGb5eqdanHPFuvr022VhIeWSTyDLKd753fAthcW0UcWqOtsKkDcqYKty49R+kn8P2pXasAM5PNs21DJuGyxFNXqFve3sYAnqwR4p0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7793.namprd04.prod.outlook.com (2603:10b6:303:13c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:47:20 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:20 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 00/22] QEMU RISC-V AIA support
Date: Sat, 23 Oct 2021 14:16:16 +0530
Message-Id: <20211023084638.1697057-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3722aafb-9864-4ed5-8787-08d99601b94b
X-MS-TrafficTypeDiagnostic: CO6PR04MB7793:
X-Microsoft-Antispam-PRVS: <CO6PR04MB77937DEFE377E18122C953548D819@CO6PR04MB7793.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjKRXHW3pXL+/xy6hb2z2BdZjYcN/vGuDy+YsRYV5d83Z5sK/xQxK7I+JsglSVWaZd3vXgRU0fkjnVs/toUxYmrXxyBiripeJK59splj23SZwydUI/dOvynb4X+QCrVwXZ+jjnrS2LfFfkA8ASmvgMCTqXUhiBrEd1N0UeiLhDZ2oSBOwNrmgIBVXF+vdosFpSBEdw2oGTAaD5NMBQst/xLG29T44cCboTwl61rzI3s5FPHeVmLHlngKiJNLSCrmFCP4sGRFtHlCmS+Ior3n7BzijljykFVHVWU8ZcxyikdEQD/GIoZ6+g7y6mM0JPC6Y1OPQUtw/iNf4VNg8ezwjc7/LLGv5YS6AxA/tRhAaOs6936e/f4apxjh47PTOk6Kwoeo/4aKoloDoVdlwy3qQcozz5PoqmXxkoalMiWp3Xi/H8W4Z0HD2ZpGQyR2bg2z8htqecfNDlInlDZ3ELp4FeolEOiC+kqGg4o06Ymvxq1OERTc/c6+mSA+NVLEb//5Cr1xDj2zEFF41dTOvfOZSab6IlPO7Fn3BqvAEpZgqtjZVPHMngxkWHQEcgczqTpd/zDWvrQJMKDzoPK+gblcMbWBXhmbaDLK+uOPjt0t1AjfH5pDn5gAFQLqjkHLuaSseInpgSrMjhf1o5hnU+Gw6an1NQRp+BhMzEEPCEOvFsO4Hy4Y6mTTK/KRaCyVKP8GvlqWBj502bF8cMhJZqXXLR98Yhq3NYp8SEkpE5dePD/fAKh6tOmD5pslvXUz0kVR99CmjLTJWUYB9boqJyjFk9gNqKy6jnKrIRcRwCT7+y36dl8BuMHiqxD6Xs5uedKgd2z73bBWTc2xz9gETkiPGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(82960400001)(66476007)(966005)(66946007)(52116002)(186003)(956004)(83380400001)(316002)(38350700002)(38100700002)(2616005)(86362001)(4326008)(36756003)(54906003)(508600001)(2906002)(26005)(44832011)(7696005)(55016002)(110136005)(8886007)(8936002)(5660300002)(8676002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hkXfxsyHGoeLXTLXGSfyOHmDIWPxw95pSI7tK5OvGMRoXDn3TqXIRrry1NuJ?=
 =?us-ascii?Q?wGIsoj+1nT1B1Vzx/ZO9tMQ3e8CDCXv7heCzS/I8CXpuDT9JDVLRLDFbzifz?=
 =?us-ascii?Q?in5TmQI7RzlGwZD0uSIkzFFrOMnGL/jt0TkH4N3/HDK4DKuTAMirFtTq0Z/3?=
 =?us-ascii?Q?MwTVexNu1znE4ucMh1UoviQSIbdQ5gfi3RTsjxGBLdX0zTVu7qtbHEkQWBZG?=
 =?us-ascii?Q?+FFuEzlJ0h3yLbnOAz1pZMRSGFcl7DVWSk4ewoam5f6058HKruh3HwKf8lox?=
 =?us-ascii?Q?J+pxFn2oirdPQqD79hfASJY8r/cPWA0pBTWCyUx66lQGFfcog3RxFnjgA2KN?=
 =?us-ascii?Q?KgXX+06q8H/HIqrHzL30jcYkPZZv+dvtWMQsY1i5CqeWRyYcLd9d+8uJvxj8?=
 =?us-ascii?Q?wzT0vGe7psX2FPum4Qz6a7HA3Qx9RkM45jrlFzJWhYM5cE6zypalPhWfwYMY?=
 =?us-ascii?Q?+lYoM+3Ibw9HcACoO7wgkboHnoMj7k4kXMxu1j2NmJh/ZV8+jkZauUDU5733?=
 =?us-ascii?Q?ROeMVHLD7yeVNx5AiYc+svaSpWBS+y8LrWkjorBWAWwBFRF5tY2ypxK4MDLo?=
 =?us-ascii?Q?PHdlVi4KC9NJVEV8kQlSJm8Z7mBMNuAJ8OCzERzf0/Nv+8yrpFWHSZX+Nm1u?=
 =?us-ascii?Q?ZU99onK38q6aHXe8OqAFyVO8ICbZlv5ZvbVGKO9D8wwME8Ydrhn4JuTRoG8D?=
 =?us-ascii?Q?Z+TOrYsX9sBd5X+IPcrk5nvr+KNmBH1QUB6WCrmzLn2G2veKYYJ8R1Q8cL4B?=
 =?us-ascii?Q?s2hFnHJZ2kAnhh84BGx5WXQtZDYv8PmuF+jomDFAg/upNcPx3knbQYLk1tad?=
 =?us-ascii?Q?viNvu6ZVPz9IO1Dumb2ZEfwVwQ5ObSN6COuQQ1Dik7fAKE5IMgDtY9OZe2Op?=
 =?us-ascii?Q?iYK44zVuH8q1cE5SL4yRXQ/Z7PievQTJ6yyvxl7XFKKDOqphNnVGtN1emLLj?=
 =?us-ascii?Q?m0lJyAmijSazo1J3HeK1pZFhwjnijhLpGOsASogz5LyH/j0UxXCiM6zG3o3Q?=
 =?us-ascii?Q?D84+1aKfKBmbNLALXBZmy/MJfdw2Qv6a6Pd9n0qOizPesoJoVsxa6p4BFA4o?=
 =?us-ascii?Q?wmRYWXkk3f4p1fMM4YguxSU5n9RvHGOgbw7sv9avB6I63gm1WTmYPPu++nBd?=
 =?us-ascii?Q?AIWdy+mQkzjYC3qfMfEbnG8qT6IbQM2PFiEDr7sbHcpGW/eJ9s4Ck4BB0CBg?=
 =?us-ascii?Q?GXqKNSLRT07T7xQrOPWON37usrNmehLxdTTyYJAWoZrh7nv63uiOEhAHpmUQ?=
 =?us-ascii?Q?YDprfjelHoqYp7n7gGT76Afvdpes9xqRTpRWxVEDmCtZ8tOIhiyDZblkfmuE?=
 =?us-ascii?Q?0rLrRsV7tTeStcaOc1Bu5VKmKRazTH/t3y8h4Lxb+H6VYY1rumo9pPZc/dfd?=
 =?us-ascii?Q?2Vbq78ls8IDyR015AH2jCr5lH+txgys4dSfCKSyD2L/pXGLUBhOVXVfzF8P+?=
 =?us-ascii?Q?/WIZfH+4aS+rd6czTo64Y3zyKNkTuxlmCZ9qxzfk1sSCiE8avWV4V2CR6JOh?=
 =?us-ascii?Q?/nfkXr2GKz88qPv0PltpvFixKGa+HAXyRRTj55nVQc2GnQite60Tfl43ez6Q?=
 =?us-ascii?Q?Y7IeyW7tJEha//Y9nIFdh2F1eDEVQhCTbU1YrMCS/wxAfL33uGcIE34ov4D5?=
 =?us-ascii?Q?JtqHGgNGutrlsFF0kB50JF4=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3722aafb-9864-4ed5-8787-08d99601b94b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:19.9425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cVPMdNAxcslguqWKcxxDDJkT2QEhgU0A+pxdh5mS8rjHwMKx/mGlfZrnAD0IsYfN8S5CRa9UFN9Y2VdDDjsZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7793
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:31 -0000

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

This series can be found riscv_aia_v3 branch at:
https://github.com/avpatel/qemu.git

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


