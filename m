Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkr7-00010G-86
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkqx-0000tF-KY; Thu, 02 Sep 2021 07:25:55 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkqu-0002oK-M8; Thu, 02 Sep 2021 07:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581952; x=1662117952;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Y60gUgm3HnyDL68Dq7+dcvupU2q2QESMnybXPMpGgi4=;
 b=nDPXv6Z7RbAjCMcE99MrjUrRj1suLtNViejpmKI4Yp5k+cJOP5EoYQPZ
 WjQM4ZVyxUWi3+G/J4JSkxS+wayxvjkwJ2QpasxWcbqLiLj1r08dKauHs
 O7+jOBAydDK/fNrgIWzzA9muI9yLw983W957CLjfzPDtxjDtqsVUr/x90
 oXYEIOaNCBbAJ+0iQsHn6vX3nLtm8eLpqiomTUzJRBmzxcIfP2dvVOqB5
 v1uJJhso4wYqIymCznebN5msuDS3QgTC3lmdOQ0U/RVEYypAX2aq8HZih
 GPbWcSXnoXSN/KEPJ+2zJUtHaARn83YPppR1OWL7JHtQlBd9u5GtSao5Z w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644560"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:25:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgBvFAbng/2ZwEMb67xlodJvtksKwL+Vyj9EQkowK+8IN2TR2vP+s00LFMEbGkc34+gzNX25zQfSPN3663951Zd+cZ4g5UsFOx8mh7vSkTMESczIa4qZbDncciB4po7X6OJQhVzs6EoHu9rPLTsyfmFi2AJh4wgtwMFige6Xt9DegOEYLqmMP+VhimLAccii1QbL7IXkNf8Up5nGylwC7gLKqWrbpDFAoGn3IT+YtYz7R+dPlXjnKLeJFzPVDz4cjA5IIv1aXBUCHfsPQblEXsLmhUMSGzkO67lylieodmBQax+M0mOyzHMYC2TeJ8uv1T0v/yy/QswAzx7BTbbX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7A4F+65eYxV5e7kBN7dt7TxW3kySsgGbEE9o4Ch7AtY=;
 b=WMpUBxPiWRO62vIPCegm4BAl8ddkchFUTGxrXwpAuHhv/MD4J7/ZF2UUHTHg+pOOu+CugYImONs10WmRXNtpFmJtVry83ataIGYq8dcybUdV9G459YOx6g9KRoBtLoNvPJdQAgSFPLLwAAFmD9N+SAWoiccR2fTgqpyfUXsKDrs0Oi7k3BeEiI9TPaQKfYuWGJWlW/4ZjK+6Rk6/qBJfnZL4MoEgGPgErpY6wRhC9Vn3b9Bi1wSwDP/0iwvXHv3CI0si3S3Jyzi9hlNS9iVyiJUrRow9jye4opExq56YbyBu/fFOTBaMgwntwb2//31tVtLzUuaZVBfRnqcMC+6D2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A4F+65eYxV5e7kBN7dt7TxW3kySsgGbEE9o4Ch7AtY=;
 b=G4R6wtIX9XOq1Z4csUpvoWp6OCfXMNj5uHQz3yVwzuZGjbx+cB2i4OXR5Xkse1kVCXgGMP2hA/OmVYNRIH6LbQGw1Fz9Bxx+tvofR63/bsOdcrtwsunyrhCtT3LAmu86G259iRTSjo40z8maA301GOrUHKnZDwisLRcmwGdrwgg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7796.namprd04.prod.outlook.com (2603:10b6:303:13b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:25:46 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:25:46 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 00/22] QEMU RISC-V AIA support
Date: Thu,  2 Sep 2021 16:54:58 +0530
Message-Id: <20210902112520.475901-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.220.163) by
 MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:25:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e217b16f-9e79-4b16-82ea-08d96e046864
X-MS-TrafficTypeDiagnostic: CO6PR04MB7796:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB77964816ECEE24134E847FE88DCE9@CO6PR04MB7796.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06HA/ZN0WJvftZRZIb/DFs7ungiVenhfdL80obUOyZhGLW7Hvzw4VHteXRlJDEALlyb5OyztvO9ezUswyQXUKiyKyqZ9Fqb/eaZXX1ETRE8xSmDNT6xwbF/KtVKokary6mu5RaSKe3I7wJI6yzk1f62Z2m/nNz9bvHPjAFTHCpQdWXjrZSdKLBt+azhkHIMi1SBpxUVoNSfIjWW/8vPDZOB4tj/zAtXlp/ZaTZnQ6ujrRn/g9RbWHuIgeeaA2YI9VtVdQuFFQEKID/HXWijoLgx3HSq0rosYKDmjv9K9rktAcB6FZuPiw4c+/UxeuUjSYZSCVfRpg8sNkr93RlvdWihokmqTcz5y3YL97TapCOEQeCa1wAMw3ONXgECMtPOVAs6wLxH3kVgHfSvnTc7f4QT4VCW5mQfc/ZqW4n92XEUAWVaeVDkmQWyuu0epQxkrJDK7dW32X8RQ1c3Y+Xb6quhh+x/LiPowJgAwB6NmoLz/E1VLx5yH5Hw+Gix7De7EuEfiBefbLtiLhwlokmCoIB9yuK6zJ5WksNU/Wmv2a9GSBhEPNwqQusA0bTgIic7rxy5Qqp9uzYEUNr8n017XEihJ77IS90EjOU/VoGqZg2J1KmHJZm6zOQOMwFYZxpUIuycCTpTGpvcwkpUwzoUj6drB4v6A1bYeTpypcDxUA3ZTdCVvtNeUFblcAy1P7BvtXIXnQEcoA4Lu9HUPcgZ5YoVYcJ4qJEgWXAuVf0SqgyxCqeIKMi6OZUugbcj9XrXP+na+Yt7TVV037odUD9WwzRbGvY7F6a0f27vN1cQ5PbL7MiP/8HVUK6vX+/qg4Bb2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(110136005)(55016002)(66946007)(956004)(38350700002)(26005)(36756003)(66556008)(86362001)(54906003)(2906002)(66476007)(44832011)(38100700002)(52116002)(8936002)(8676002)(1076003)(8886007)(186003)(6666004)(508600001)(7696005)(4326008)(83380400001)(5660300002)(966005)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oi/16LRTXY+u+shyeDJtdMCB5PTyeCuwop1RW73sZCjZq86iS7NwY25Vt9vW?=
 =?us-ascii?Q?HVacQdYhgZSYYsRZQG5NDa/zf6ZMIofga3Q921OpZmDSV2UZfSuLlEfUxUBa?=
 =?us-ascii?Q?jBNyBfoklspMUP3joqpOXcD44dg3GX5Zlhcpb560YnXXzBwlPlb/DQBoseJ9?=
 =?us-ascii?Q?ajJcLueXPX6o6ofKASsvfh7DzLmo85KQthqxDItlcgGQt+jcAf+3MOxIBLIU?=
 =?us-ascii?Q?1MSiAqE0Z2eQjP6OBsieXtiNBW/6kC/WnHE0DBrioBDzSyoZjdyBtk5L/HJV?=
 =?us-ascii?Q?iuxniDC3ECYeqSF3CTACc19MNMcNbjKWw8qHHJ1HZar3skJZZUcLC0s6/sgf?=
 =?us-ascii?Q?b1Kg1Ncl73+ypGgs9SdzVgk5FL90PxztCSdqxxWh+OMM7Auazb81GWWnwG17?=
 =?us-ascii?Q?LfFAV0Z8lmcTtfEsH/MCYAWSBSwOL8EYtv61fgTzFtkDI+Cv51zGv+LyEc9c?=
 =?us-ascii?Q?xyj1TEDAnJ1lTyGWT4ctW2/XNOOV6b86SDinCx0XF+lksnlPP/CSHSCrkT4l?=
 =?us-ascii?Q?1bnLS5wgEFWGig5UOTIqVmo4Yv+bX9T0z6qYVJz+yp4uIMsHzEGOUhy8U0nE?=
 =?us-ascii?Q?1xHlkZsWDJewfPdr463CnlhKRhcEXx6MRm7y+DuUjfbFaD4bHZDEESOYYGM2?=
 =?us-ascii?Q?OeSKKDIJGb8JNz5wDz/1h+oB3w7zvGUFbAlbc9yyjmwn8hwEsvxYzAi7BcYs?=
 =?us-ascii?Q?qYNJg/neVmNS/y/IwRGXJxJf2I5ADqYtbAaJDPj+/klQC67JclLeyt81exQ7?=
 =?us-ascii?Q?/mwohO0yRY87jKZGSR+OYLgcpRkY2fcORJ50/TXxh5ppO1LtG/YO3aBVHpmH?=
 =?us-ascii?Q?+MrAoiAW61CWinzrSbwfm3AbD6sRsLxKzgg2ZrYuFt98ssonrDW8OQU+wifu?=
 =?us-ascii?Q?CSIUJUl4YXMlZEuW2VZCu7qtCdD/zqLCe2KzCsJdUxwWeNdqPGgVE0PfDv9e?=
 =?us-ascii?Q?Piism3j7h+arvcmkiAqgabMXdvrV4Q26g5KmTUm0Aepztgy1qpWNCcxaRb7g?=
 =?us-ascii?Q?KZ7d0Y44l8Ufj6EQ3gxxmNxLj06GWP4UGuTumg3ulyd72QkbTe7ifcYnS27X?=
 =?us-ascii?Q?tKhMeJy9jyheYQ/SIVou9YbE48kOKx6qS9JH16ZUFn/0CaotyV9P1O/iqaDP?=
 =?us-ascii?Q?r2TjKtP+MdTXULWhbck40MoSfRESB/YuwQo/5WmJcwaUimh8KVH4GzDWQJHG?=
 =?us-ascii?Q?GjS5S5sB3S+lgeAw9DLKvbWCfl7JGV97muvkwTJ1+hJ89T5+NyUGG9u0merY?=
 =?us-ascii?Q?F/2nayIVxgbmIcaGqsRYW4HAqd1oie/ypIwrKUnTXUNiAqZXDvQAIPVk5KBK?=
 =?us-ascii?Q?j03S2lJwGM8t0TqcfyN5bhMw?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e217b16f-9e79-4b16-82ea-08d96e046864
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:25:46.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjOEa1IzSCKd3QEHBS1FgOu6zK/aBorN8vRV7mKfbCmAk+9qGnSqamoQoj03r+IEFJlU1bWMQT+/S3yEJb1+6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7796
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:25:57 -0000

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
https://github.com/riscv/riscv-aia/releases/download/0.2-draft.24/riscv-interrupts-024.pdf

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
  target/riscv: Improve fidelity of guest external interrupts
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
 target/riscv/cpu.c            |  105 ++-
 target/riscv/cpu.h            |   67 +-
 target/riscv/cpu_bits.h       |  132 ++++
 target/riscv/cpu_helper.c     |  287 +++++++-
 target/riscv/csr.c            | 1273 ++++++++++++++++++++++++++++++---
 target/riscv/machine.c        |   24 +-
 target/riscv/op_helper.c      |    9 +
 17 files changed, 3901 insertions(+), 310 deletions(-)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1


