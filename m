Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhYsP-0008VP-DF
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsN-0008My-4b; Fri, 14 May 2021 10:33:15 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsK-00070E-H6; Fri, 14 May 2021 10:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621002792; x=1652538792;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=CECTPKeGpOyBxUtbgIEYq10cpm++ERI9oqg8hVEXlLc=;
 b=P5U9Htv0eoKqQwfksrvBXiGIt60YC67KUNa99kXFW2zDZo94+qFxcAWd
 VVks47vRXcb7dsmip8rhIy/wgGMXJ8KbU7kenWDwtSB+iglpmOkrr2acb
 id+8E3HkUc4ZALwsRRa4T6E8Ah9+Kc4URKva00SV73unUnXBNQLFc8LJT
 s/GU9EXA0LpC1vVEKb7shu+8Vn9XnnCWQNDClxoLY63uMaeWlGu0/mCak
 IC0/c6eW4m1OF+vdt7530WnZK2rhtNlUcoSn85MAnwpl5aSTh5EfbPxIR
 qAB3hpbiytGxmcTe6Ji1CencT7jvTWrZ0DKnFimlYpHW8IRT6jdUhKANt g==;
IronPort-SDR: rolCU9H37qTifdhNlY3MOo7YiSodG3XyojBfKR++KNdJpT+Z56tYqd5rsdFahHQUbF1rGynf6w
 cnD2Y01onBi+0BcOjsWxY92anpgok45G04ikF27JznjurBUfqYCM/XOeg+ShnUSp27P48qoTN9
 pLxiSDUMzHVy9mRrYz715lxEpDv5PRYBUD6bY+Fh24Ogio+z7Lh5KFvD/J0t+qPQWj202m6jS+
 EnSFHSyEXOY5BhpWf1A7zu7p7kW9nw3SVKg4W2XIoiRnZ4yhSKry59vUMHsPLhZp8R/VAR0fB4
 cDU=
X-IronPort-AV: E=Sophos;i="5.82,300,1613404800"; d="scan'208";a="167526752"
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2021 22:33:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9INtERKRgl0EaIQmrgho4K7uShfzTvm3lF5kW512x2gjwGxOLD1QBtH+a8UTHPzJjs3lvhx5t1PPUAfeLH3HE1A/kcTRhlm2vtTEXYLj52tqOZifjfa8jmcqS3dLfWuWhZue9UBXjKSIEbGCUVzI0vHo5+aqFEnGJZJtgCr7M57YwxFiYsxe4ywVX+uOze/PwLpJfoXQ4V63lZNxnxQBcmBqhAhdgb/mfTQ8KYx2JSgHW/oXQK3wKM/ZMdEGXHCvVx3jt4p3u5whjWSzzCA43/8SPqZOHRmPFKcRFVARVa3IKv8ZpC5pJieHJ5LnT3QFj/kQBv25GBN6U7k88ycyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79RmA4jo0WjWkVYpMyLeXZ8YsuWq5GimLqbVr8jWRAU=;
 b=B+UR5uqfxpouEhl3dIeM95R+BXNF2Fw7WzHtPaxhgtu+kLyzzlJ4cw1MyEHn7U+3c6batn/WvelhjRwQFcdjo0lhh/uajV/CQhEZbUO/CB/rARra/WxmJmm0/Yyu8yqVG1Y43z1xCtH+Ngt65wD/S+XB8WUHytXfnqutxRkVa05rIbgc5q23Z4i8wTgwt23k/raxuxLMlBFXfSgwJIrhs7zMTjp9avqBpn8arW8fTsuOKisunWOof8Lx1hAKCikHFxrF6nbkHd8kGK+RpU1zItxynjE1kRUUZlqoE55l8QP+ZGMoReQcsrjlWZi5xyPmKgLLsq645spTQl6XKfwpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79RmA4jo0WjWkVYpMyLeXZ8YsuWq5GimLqbVr8jWRAU=;
 b=gKanmP6FmGPB4vYPvWEfkrJgPWD64fB6nmRaFzp08Vm37kGXg8PT43aEn23HPFjgGKlq4XZPXWY5FaKzu9dNqwt/JNIXAMTq4VOF8jRXR7aKDbAr8dG0hMjE6CzewBor5bwbRInHVegLO6PuPXDdGLnw8q2LwpfOSeJMAdI/MwM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7810.namprd04.prod.outlook.com (2603:10b6:5:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 14:33:07 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 14:33:07 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH 0/4] AIA local interrupt CSR support
Date: Fri, 14 May 2021 20:02:38 +0530
Message-Id: <20210514143242.377645-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.179.90.73]
X-ClientProxiedBy: MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::32) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.90.73) by
 MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 14:33:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bec1e6f-2167-42e2-322d-08d916e53076
X-MS-TrafficTypeDiagnostic: CO6PR04MB7810:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7810774EC798DE60074557978D509@CO6PR04MB7810.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WzJf8sZCI2OuyRnMXQNvKbTMYrqB+zJAiJvykUNW2W9KWZUk682JXjrOlcuMVXb6ql+ks3gCFQ2Iay6WTnzIMayCAX8cTN1KWVqLhigHTdg1ttjuWJurEF1SxScA8CYy2D3Puiv39e9DJvXUArATNuruHRbFzSDTQXwdoH7UORyB9RjBi2mznzanuuV2q7yozPW4M5CYnSHS89TxVH5ceFNd54JMsozTCICjZFqUvpmDEkb2R5446Aat6HS0PRwhBRZRbcIi4YvSGhYrb0ZpTL0y3fSGw7X/2Kjy7lT/cMagloU6ETyI7txEmR6FLv0UfJbIxMrhjnAVpJwTqAZsczyZT+JVcmBKCPMd4XBJRRckOWJ80TCTYXVU3THaBcLGCJvuLBCF32kgURr3GW790yHswGGbgIKk54LjbjSChLsJQpCRlFwRZldyAmPsL4XHKE3Y9Qd7jW+d2j0Rb26hZb+QEGVs7ip9W4S0KxL/ce4PX8DhRw0fR5CwdD7A7mDsjTOFjCn5ScIiioFdC7W6CkntBHkEqWyTxOr2mymr8nAQPlt+032pl9dX9NICfyY8vuDexv7c6TqsOPQI2kSsx8SppT8qUHFWdDDloZBdmpxdVn8a1QPaYLFxZ3slhw+P5kj6V6EULPvCC/l5TJWt2g8z/OuBuXC3/3l/cPunjNDzdAcroaCmZbae5xFNc4du5B7nG96/G9Q0k6t0MDGhaPK8UDFxwUGpCkAQQ9PbFH4qYEZdpfjqblMo0xLbF9vCcVgys+TscfKjU7v1OViZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(52116002)(7696005)(1076003)(26005)(5660300002)(38350700002)(83380400001)(86362001)(66556008)(478600001)(36756003)(8886007)(966005)(66476007)(66946007)(6666004)(54906003)(16526019)(110136005)(186003)(316002)(8676002)(38100700002)(55016002)(8936002)(956004)(2906002)(2616005)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8+R5gab9AeJvWDtAHkhTJ7NFpoy/OReBhGRpuLS4Vg2tVZiTsql+WOYKprP8?=
 =?us-ascii?Q?OrSw6RGkRPCJzG3o42/xdVCC+OqRYGG4kIBoKEDgG3AeanvE0mJ3bwnThPIL?=
 =?us-ascii?Q?Hdqf/QTY/T/hBYl42HuU2kz/Zz/K7Ok7S7pG6xoweOF6B6oGI3mf9SfDs/ie?=
 =?us-ascii?Q?sA/sI1dvtYWgGd4NAvx5QaKkvF2x4Qbej1kDBlY/nPCmmo2BRk7yoIW2+nRR?=
 =?us-ascii?Q?z/w1ULwVXhsqq9sHZeCLiGJHYcm0vCbQ0Ze5ijTcanrDiJRWZoEOReQJw7U1?=
 =?us-ascii?Q?6iXt8ODR1kDFpUhNrJ+lP7IUKwwXJLL0Wgm9qCjiZvpHaReLTRb0fRINfqYC?=
 =?us-ascii?Q?AkwTPpHsj+C+Jfk5cT/xWid+wSMZtItzSH9/Hokwh/R0pIwsXmInAQ1ZDVvg?=
 =?us-ascii?Q?xooNRVF3c8LfF02hJVVNrSzBggJDVkLoPBixdCWXUuWvHrXpMpU3ALbS3F87?=
 =?us-ascii?Q?SzatxDlipt/7VuSSTQil4LF4D46HxKXOWQx9W7mVDpOV6V65NCMb2U7earH/?=
 =?us-ascii?Q?wlBBrnf8Rx17FnyPnbw+Y8dmhFMhl26023/kd1B9Qo8iuv9+qv2hQCf5dIyl?=
 =?us-ascii?Q?S84F8yn7e/ggdFah4wpCjR5GcdKQ3735o7J5BW+8QxzQcA4C+dN+FdKp9+/r?=
 =?us-ascii?Q?4gdxurVTW+AjAYMYgvXpx8WruL0c9WbtRaXPoXsODky8PKh3RvPAD5yp0ZQX?=
 =?us-ascii?Q?YCJSo32xHIAQnmqOrXyENhsRB5VRKp0ygCtrohrba42940/Xm1yT1FxptQV6?=
 =?us-ascii?Q?TafghImzx/xvWzH+mWbQ/cVroeMUFagEWIIZogaBEc8/UpgT/A6lw4sTK4gQ?=
 =?us-ascii?Q?BaSOJ6cymrASULY2SDCrb7L9QXhpPEqSLkhFMADpB9jXtWRA7uRHoUOwWwgv?=
 =?us-ascii?Q?40VIu76Bm2bMLi5Mjv0kASHHlQL+XxPbrEVxCdk1bioW9kKZ8ULdnlO0YP3j?=
 =?us-ascii?Q?JgBXNQGh586gNRr9yXaCJsXcecEhNNB7SrQ9gwUtLVBdGleI8sntxx14CHBb?=
 =?us-ascii?Q?tVZaGqs4G2tNBAINiScwQQ9EQQzLYncDPDLNyYKfsASdQvzeXrGHzIRxcmqB?=
 =?us-ascii?Q?IobLF7z4YXovJBFikRYcClYzeQ6Dy+7kfBKKiqpdlrMra/jChcK4m1DXx0T8?=
 =?us-ascii?Q?A6ratkPqUQvxDiT+UNv0HDis1ONLNWXTJPgSnurySArJEVO8PuVNN4DDTtnO?=
 =?us-ascii?Q?UuaYin0L6WMDiRl449no2JoPV3Qd+WbP/JaR/PIYycSL7g6JBp7TEljO4UmS?=
 =?us-ascii?Q?McoLZEnyaS9zSa5cbwrLGigpDw6WKACrwXbhxTp5dwbayC3JQWPJe/twt1Ro?=
 =?us-ascii?Q?k6PXskBctHfhM9Ez+PARl2dj?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bec1e6f-2167-42e2-322d-08d916e53076
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:33:07.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPG48nnH7G3AHZ/4Bs6a/PlIiZQ0YrAhYZSdXOI1MrGl82fgFmc03df0/5I30nz8DEmv868evJznDFJ4u2nspw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7810
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=761afde0a=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 14 May 2021 14:33:15 -0000

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
http://jhauser.us/private/RISCV-AIA/riscv-interrupts-021.pdf

This series adds initial AIA support in QEMU which includes emulating all
AIA local CSR. To enable AIA in QEMU, we just need to pass "x-aia=true"
paramenter in "-cpu" QEMU command-line.

To test series, we require OpenSBI and Linux with AIA support which
can be found in riscv_aia_v1 branch at:
https://github.com/avpatel/opensbi.git
https://github.com/avpatel/linux.git

Anup Patel (4):
  target/riscv: Add defines for AIA local interrupt CSRs
  target/riscv: Add CPU feature for AIA CSRs
  target/riscv: Implement AIA local interrupt CSRs
  hw/riscv: virt: Use AIA INTC compatible string when available

 hw/riscv/virt.c           |   11 +-
 target/riscv/cpu.c        |   32 +-
 target/riscv/cpu.h        |   56 +-
 target/riscv/cpu_bits.h   |  128 +++++
 target/riscv/cpu_helper.c |  245 ++++++++-
 target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
 target/riscv/machine.c    |   26 +-
 7 files changed, 1454 insertions(+), 103 deletions(-)

-- 
2.25.1


