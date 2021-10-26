Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGCB-0003nt-42
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBz-0003kr-NO; Tue, 26 Oct 2021 02:44:17 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:57198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBq-0002ui-VJ; Tue, 26 Oct 2021 02:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230646; x=1666766646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4ohb9pLFrIaui7DcAR7ePvhMEq/w3F/txExAAUA5uWQ=;
 b=k+9bddKAh+5CvZAuZnarcUgRwx7d4LtPkjVvxL9HKKbSMQV2TM58treU
 MCtQAMel7GyRQe1XX2L8DDZZUdnGhZpmxoocn1K8q7foGx8HK5EzsxmDG
 kMByGUOs2vHZ67O+c3g8t5S+dgDex9wUX69vF11FXeLJM0r9mpCort753
 oxPz3eZvoOn+BqHvhYSwoE52IybyHdxW2YLoeHMjrnLMZwS6Gtn+iLukt
 SIf3ej8vEo2uD0TyLeRzzryTM8ITtAr6eOpZEwImjjzLogiDU5jwB19uo
 SVJsImwfSs8WojLQnGn8I3WoU0ybUuJ02NYjDsnqok/iBh0Qb37lMWjkq g==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="295585017"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:44:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgfJNQ8TnY1s6q5KmvIe5h0i7x+/F2AjXo4ww6mAkrGxbV0pwVWvrpNwpzZ0TdlQHR63XPJARcd4PYeqrfBJFBp4DQfIMjreC0dx3/HXWh3KGJGBfPF/xkN4dwt2vUYwzJ3ZQKPoOToR3hmYZmXjtELZ0BQrckts+31LkC+aIAnCYYNAOjSEGWpP6IlcHc07dRI9T4+sPGft1Jg4SYTmnOSx3v59SCUF+R1GNNW2K9hfpYQfqtX/jKwm9sdJE0GU3HGb1b+wP2avQmhpwq34/ull9i2AqKiMGAFr2U327gzPCgbfGRl9pul2LE/xH9OrdZbJGrFDt8jRPeJoV/fkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu8Ll/zwhdSR96pXgwDH10frWRXFpgZqYSGof5UZFhg=;
 b=RRRAyaJn0ov6qDZIF3pa3FJHOs8wSQBnpCJYNNpF60xLRYD+ptWc9EnLy3k3jikTOB/vPQp0aje+52fCJQtaPwQYZhnviAQnZaX/NwiEGgjL7Pr901sQ4azpgCoqszWRDoiCxuNBLjSoj+6L/BLoJO5dxQSuqEMQCZDTTWn6QwXxALUb14ydf2IT84261qcvCjm917uHkOftB3ZhdzT7By7lTPuk1hgSl1fBTX4nOChriKOVh8x8613gKQrHOh16AouU4qfuak+g5UmkYza1j7mHyWoNttygMOnHSXu6MR+yZCQHqfftdUH60GFAksIA+/SNt8zwqLHKqfvlaelGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu8Ll/zwhdSR96pXgwDH10frWRXFpgZqYSGof5UZFhg=;
 b=WfSMkJj1fV/+KbPTPNHiec4M11xPRyE39rSMd/wiRbM4sKBLGeb3emqmH98PQMJV3mw778bXeK3FZ83o3HrqpUIWbyLzOpl87quBW/GQKEfyR1c92zlVgRblDNHjPQR++p8jtdMKD1aROgPxwfmBl584V6G3hLIAKwgVOD+UO8Y=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7825.namprd04.prod.outlook.com (2603:10b6:303:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 06:44:02 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:44:01 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 21/22] hw/riscv: virt: Add optional AIA IMSIC support to
 virt machine
Date: Tue, 26 Oct 2021 12:12:26 +0530
Message-Id: <20211026064227.2014502-22-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fefbbf0e-7bf3-443e-b2e5-08d9984bfef8
X-MS-TrafficTypeDiagnostic: CO6PR04MB7825:
X-Microsoft-Antispam-PRVS: <CO6PR04MB7825EDE6AF8D4B0D1A8CC7C78D849@CO6PR04MB7825.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pH3CuqZ/tMhytsMe0smlbI4HK9WFzfH7xFG4Caj4pQjOlbl4i4tVtfmH/cFO6PwaD8JnmrBjiIy5LsjPKm2PmNIqUbFMxlj55cmbwWWLJFbXcOHyzjEiBqeobGn2N5zbuODhVrD/zrIzj/gdvNfql6TByi3cfmcCglI1+FLCXGsD4L7pa0VIPX7/jG3U54IORmosJsJNHZZ9NtrRjSukNWxQXphuRl+tfIyqowGtU2Jp3BJZAHyJDXc1kSC8G5ueoMhveHpDqoXttyF441BeH9JGLpQbKnQUohhOlYj6BJzcDBFYbqnaXrqEVxTsbIE0zcosO5g1BoEPejW8+3wTCbZlB3cIRC5/vMW/w1m2pSA4AEJ3F4FBQaDN0X9UVdnUhz+m/lyu3Q62v9n/dhON8XIb2Igx8VrFqLgNxvpEXAFxIlzXfxIidyJ2ufLdYpLiFf6i60ApNkG4xtYbE5Nu33YlZ6PfX0iao8BqO0XlfVTkvrGOj4L0t0Lg8OE9+8RqmhB/0qBVwT8PO9sm5S5XRrFa/gpl5SupfL18nh2Ah5ByvIRgyB0F9An6Zlcr9MhWsbGB12vw33r3KEG8+/l4QPqzqzz+Ddt3RwZ67YmMVM4OaGhn9qRUMpE8z1oe/i3GhCbxW5AugBl4TEs7KJ0HUEEqUzWbB+EoWiV4/6kKEwheiMZFS9ASbmuHvXnFalsMucBa+DxGqEjuV47v1xyp4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2906002)(66476007)(8936002)(66556008)(55016002)(82960400001)(52116002)(5660300002)(508600001)(186003)(66946007)(8676002)(36756003)(54906003)(38350700002)(38100700002)(6666004)(4326008)(30864003)(110136005)(1076003)(86362001)(26005)(2616005)(44832011)(956004)(8886007)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O6NsfYXwJQtApgDjRgOb+ZJ2DsuY2a7UiL3KuWIbH9Qh+7FSd/4PTqSqFQ5o?=
 =?us-ascii?Q?9hi+EWSjwoxiHVG2Fy5sSgX294H7j7/rFgZu1Xg7fiPzQl/4sWeCPcCDB1UN?=
 =?us-ascii?Q?fFTKKw3hI3OcZCUgWO4KfPR8zydozNe+ocG4AQ3IkG9JnQyDai41J5EEw7Qj?=
 =?us-ascii?Q?bneEDNIFnStW+ya9EuFDSqx+Tb7rUC6cqnWm6tMPa4REQLmKP+psnBLDnVb/?=
 =?us-ascii?Q?aPvWlfxElPv2lg+p1VIxZNNCBNOoP6FZ2rfQGuQ0VZcWdlYfYSp/BsATOcDN?=
 =?us-ascii?Q?9hW/vlu2giyAEMDDDnaUxnaLvpyK3O+yS/aNSgfrUbusA5KQKZDQRyD0YC6u?=
 =?us-ascii?Q?kUmnA1/bfrH0uTFxJ//QUB7LIImmxF9Si8vfujVwZ8Xo0u0fAYVNGVjUnNUR?=
 =?us-ascii?Q?uFpU4xvRquu/AgIQsIeq/irkzk6gtCF+s87YsW4zoZ5Y3CCEtozBVS+xji6w?=
 =?us-ascii?Q?AA6/plz5zVrYHONgD0CZWhRhNvPAGPqxQqS61HD8w71DkKYmKikSop8cwdth?=
 =?us-ascii?Q?8yBLo6ispEGt4XdnALN7tLrPdnEgPgChcGPANHiAFJd1FO59Y7+SbtkLlCS3?=
 =?us-ascii?Q?cBxmR/py/Dgf1/wUiWU3A5kxeKg0bN87NZsV/8DAM5Bij6/S+uA3bv0ZP06F?=
 =?us-ascii?Q?TXVm/0OIsyqqnwFm9tt+bTYQEcs92FMizk7wYLeT5Nz0Ry0OMdeiV+b/Yko+?=
 =?us-ascii?Q?ui0rUJcq3Z1Q34t+zuE8FM1wAv1n0qclQRTuCcu7GnDQIczXJf64Tq51rVae?=
 =?us-ascii?Q?M6cmYKlYg0zGyluW5pYmRAq3j6zYMNAYnjCDuyiXfmMB3W4WHDIZzm+Ph3Hp?=
 =?us-ascii?Q?dawVwqMHIXh5DQNwL7qWQAyyy5zJp1jH9VTmRtvY6PlAd/TiPrpHQy4ykajH?=
 =?us-ascii?Q?vb739WRcs5k6IOB4uwaPyRcoFbFnyjWa1HZDo8wV8n3AQ45y4GRhtt/SHBwm?=
 =?us-ascii?Q?pv/NL8crPnijOtWI+zO4XwiiWYbL0vPhT9MvM6OiEQq9/Wx1K9WR4podVOze?=
 =?us-ascii?Q?ILSpj/GMwAaYWvNHrBerP3PRcwF5f2P0t0i1ex6ebpg0b1I4EWhCu+HtZ4cA?=
 =?us-ascii?Q?IJS472gDwo8Rccf3PjPznHbIcwtPtAEyRWSDoLPfiSUY6hiRv9K5jC+jLJ3+?=
 =?us-ascii?Q?00l2x0ceS3j4PMhFEqJCVrnc7f2+rT4tELPhyu4pNeAixy7bV4OVN39byJPF?=
 =?us-ascii?Q?eK9bBPVB2dfEv1b0LgFN1NpMRG7oINkSMqS5vVe+0QshQcWiSnH2BlaMcw2n?=
 =?us-ascii?Q?J4gpQzTAN7/8Y57tj4h8euIdNKGPtB7ZfA2jjWryM2+lX2BYQ5NyJjayVBrm?=
 =?us-ascii?Q?UUxLtPucszqtvQJNQqmSmAK37oU8MJTjcSyBwhBlaXatjowacORxbwbEi7Al?=
 =?us-ascii?Q?6NSGJk4CgyAalK6hef4igevtB+qZLRGGnQZNpyNFyDR/J0sT2wr1iDiV11RJ?=
 =?us-ascii?Q?6XyX8io5cCshCegKJCyLTIY47rponpqKo74OukPH/OzGXNpQFIa0L7dPPcTz?=
 =?us-ascii?Q?ZZXMlyYaH1lJkNxmcS0fLy6cB2719KWEBTYm6ANagXomWaF4F/GpVsygyj2e?=
 =?us-ascii?Q?9JyxA167W7fmLFbs6RnAdZQ68XpdqXjF18lYzFEWYMMTLfT23+btph1kj6Ma?=
 =?us-ascii?Q?2dj6T2jO6RGzDBOBTACc04w=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefbbf0e-7bf3-443e-b2e5-08d9984bfef8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:44:01.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNPjbt3agsrcZshxLnAv35K13O9BBj4QNx8evT3B/ddBC5ByWwxwdb6ngoGsRnmwMYkCeRAEwJ0uAmdktgc1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7825
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:44:17 -0000

We extend virt machine to emulate both AIA IMSIC and AIA APLIC
devices only when "aia=aplic-imsic" parameter is passed along
with machine name in the QEMU command-line. The AIA IMSIC is
only a per-HART MSI controller so we use AIA APLIC in MSI-mode
to forward all wired interrupts as MSIs to the AIA IMSIC.

We also provide "aia-guests=<xyz>" parameter which can be used
to specify number of VS-level AIA IMSIC Guests MMIO pages for
each HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 430 ++++++++++++++++++++++++++++++++--------
 include/hw/riscv/virt.h |  16 +-
 3 files changed, 363 insertions(+), 84 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index c30bb7cb6c..91bb9d21c4 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV_VIRT
     select SERIAL
     select RISCV_ACLINT
     select RISCV_APLIC
+    select RISCV_IMSIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e21b485aa..4dcabcc8ef 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -34,6 +34,7 @@
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
+#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -43,6 +44,13 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate IMSIC in address space"
+#endif
+
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,        0xf000 },
@@ -58,6 +66,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =     { 0x24000000,     0x4000000 },
+    [VIRT_IMSIC_S] =     { 0x28000000,     0x4000000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
@@ -309,7 +319,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
 {
     int cpu;
     char *name;
-    unsigned long addr;
+    unsigned long addr, size;
     uint32_t aclint_cells_size;
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
@@ -330,29 +340,38 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     }
     aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
 
-    addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
-    name = g_strdup_printf("/soc/mswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-mswi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_mswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+        name = g_strdup_printf("/soc/mswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-mswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_mswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
 
-    addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-        (memmap[VIRT_CLINT].size * socket);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_CLINT].base +
+               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
+        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
+    } else {
+        addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+            (memmap[VIRT_CLINT].size * socket);
+        size = memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
+    }
     name = g_strdup_printf("/soc/mtimer@%lx", addr);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible",
         "riscv,aclint-mtimer");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
-        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
-             RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, size - RISCV_ACLINT_DEFAULT_MTIME,
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
@@ -360,19 +379,22 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
     g_free(name);
 
-    addr = memmap[VIRT_ACLINT_SSWI].base +
-        (memmap[VIRT_ACLINT_SSWI].size * socket);
-    name = g_strdup_printf("/soc/sswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-sswi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_sswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_ACLINT_SSWI].base +
+            (memmap[VIRT_ACLINT_SSWI].size * socket);
+        name = g_strdup_printf("/soc/sswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-sswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_sswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
 
     g_free(aclint_mswi_cells);
     g_free(aclint_mtimer_cells);
@@ -425,10 +447,145 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static void create_fdt_socket_aia(RISCVVirtState *s,
-                                  const MemMapEntry *memmap, int socket,
-                                  uint32_t *phandle, uint32_t *intc_phandles,
-                                  uint32_t *aplic_phandles)
+static uint32_t imsic_num_bits(uint32_t count)
+{
+    uint32_t ret = 0;
+
+    while (BIT(ret) < count) {
+        ret++;
+    }
+
+    return ret;
+}
+
+static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
+                             uint32_t *phandle, uint32_t *intc_phandles,
+                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+{
+    int cpu, socket;
+    char *imsic_name;
+    MachineState *mc = MACHINE(s);
+    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
+
+    *msi_m_phandle = (*phandle)++;
+    *msi_s_phandle = (*phandle)++;
+    imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
+    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
+
+    /* M-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+    }
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = memmap[VIRT_IMSIC_M].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_M].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
+    g_free(imsic_name);
+
+    /* S-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+    }
+    imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = memmap[VIRT_IMSIC_S].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
+                     s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_S].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
+            imsic_guest_bits);
+    }
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle);
+    g_free(imsic_name);
+
+    g_free(imsic_regs);
+    g_free(imsic_cells);
+}
+
+static void create_fdt_socket_aplic(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socket,
+                                    uint32_t msi_m_phandle,
+                                    uint32_t msi_s_phandle,
+                                    uint32_t *phandle,
+                                    uint32_t *intc_phandles,
+                                    uint32_t *aplic_phandles)
 {
     int cpu;
     char *aplic_name;
@@ -454,8 +611,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_m_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -481,8 +643,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_s_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -499,13 +666,14 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
-                               uint32_t *irq_virtio_phandle)
+                               uint32_t *irq_virtio_phandle,
+                               uint32_t *msi_pcie_phandle)
 {
-    int socket;
     char *clust_name;
-    uint32_t *intc_phandles;
+    int socket, phandle_pos;
     MachineState *mc = MACHINE(s);
-    uint32_t xplic_phandles[MAX_NODES];
+    uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
+    uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -514,35 +682,53 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
 
+    intc_phandles = g_new0(uint32_t, mc->smp.cpus);
+
+    phandle_pos = mc->smp.cpus;
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
+
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(mc->fdt, clust_name);
 
-        intc_phandles = g_new0(uint32_t, s->soc[socket].num_harts);
-
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
-            is_32_bit, intc_phandles);
+            is_32_bit, &intc_phandles[phandle_pos]);
 
         create_fdt_socket_memory(s, memmap, socket);
 
+        g_free(clust_name);
+
         if (s->have_aclint) {
-            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+            create_fdt_socket_aclint(s, memmap, socket,
+                &intc_phandles[phandle_pos]);
         } else {
-            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+            create_fdt_socket_clint(s, memmap, socket,
+                &intc_phandles[phandle_pos]);
         }
+    }
+
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        create_fdt_imsic(s, memmap, phandle, intc_phandles,
+            &msi_m_phandle, &msi_s_phandle);
+        *msi_pcie_phandle = msi_s_phandle;
+    }
+
+    phandle_pos = mc->smp.cpus;
+    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
 
         if (s->aia_type == VIRT_AIA_TYPE_NONE) {
             create_fdt_socket_plic(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+                &intc_phandles[phandle_pos], xplic_phandles);
         } else {
-            create_fdt_socket_aia(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+            create_fdt_socket_aplic(s, memmap, socket,
+                msi_m_phandle, msi_s_phandle, phandle,
+                &intc_phandles[phandle_pos], xplic_phandles);
         }
-
-        g_free(intc_phandles);
-        g_free(clust_name);
     }
 
+    g_free(intc_phandles);
+
     for (socket = 0; socket < riscv_socket_count(mc); socket++) {
         if (socket == 0) {
             *irq_mmio_phandle = xplic_phandles[socket];
@@ -590,7 +776,8 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
 }
 
 static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
-                            uint32_t irq_pcie_phandle)
+                            uint32_t irq_pcie_phandle,
+                            uint32_t msi_pcie_phandle)
 {
     char *name;
     MachineState *mc = MACHINE(s);
@@ -610,6 +797,9 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
@@ -735,7 +925,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
-    uint32_t phandle = 1, irq_mmio_phandle = 1;
+    uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
 
     if (mc->dtb) {
@@ -765,11 +955,12 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
 
     create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
+        &msi_pcie_phandle);
 
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
 
-    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
 
     create_fdt_reset(s, memmap, &phandle);
 
@@ -902,30 +1093,55 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
     return ret;
 }
 
-static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
                                     const MemMapEntry *memmap, int socket,
                                     int base_hartid, int hart_count)
 {
+    int i;
+    hwaddr addr;
+    uint32_t guest_bits;
     DeviceState *aplic_m;
+    bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
+
+    if (msimode) {
+        /* Per-socket M-level IMSICs */
+        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                               base_hartid + i, true, 1,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+
+        /* Per-socket S-level IMSICs */
+        guest_bits = imsic_num_bits(aia_guests + 1);
+        addr = memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+                               base_hartid + i, false, 1 + aia_guests,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+    }
 
     /* Per-socket M-level APLIC */
     aplic_m = riscv_aplic_create(
         memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
         memmap[VIRT_APLIC_M].size,
-        base_hartid, hart_count,
+        (msimode) ? 0 : base_hartid,
+        (msimode) ? 0 : hart_count,
         VIRT_IRQCHIP_NUM_SOURCES,
         VIRT_IRQCHIP_NUM_PRIO_BITS,
-        false, true, NULL);
+        msimode, true, NULL);
 
     if (aplic_m) {
         /* Per-socket S-level APLIC */
         riscv_aplic_create(
             memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
             memmap[VIRT_APLIC_S].size,
-            base_hartid, hart_count,
+            (msimode) ? 0 : base_hartid,
+            (msimode) ? 0 : hart_count,
             VIRT_IRQCHIP_NUM_SOURCES,
             VIRT_IRQCHIP_NUM_PRIO_BITS,
-            false, false, aplic_m);
+            msimode, false, aplic_m);
     }
 
     return aplic_m;
@@ -984,23 +1200,38 @@ static void virt_machine_init(MachineState *machine)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
 
-        /* Per-socket CLINT */
-        riscv_aclint_swi_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-            base_hartid, hart_count, false);
-        riscv_aclint_mtimer_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
-                RISCV_ACLINT_SWI_SIZE,
-            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
-            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
-            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
-
-        /* Per-socket ACLINT SSWI */
         if (s->have_aclint) {
+            if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+                /* Per-socket ACLINT MTIMER */
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+            } else {
+                /* Per-socket ACLINT MSWI, MTIMER, and SSWI */
+                riscv_aclint_swi_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size,
+                    base_hartid, hart_count, false);
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+                riscv_aclint_swi_create(memmap[VIRT_ACLINT_SSWI].base +
+                        i * memmap[VIRT_ACLINT_SSWI].size,
+                    base_hartid, hart_count, true);
+            }
+        } else {
+            /* Per-socket SiFive CLINT */
             riscv_aclint_swi_create(
-                memmap[VIRT_ACLINT_SSWI].base +
-                    i * memmap[VIRT_ACLINT_SSWI].size,
-                base_hartid, hart_count, true);
+                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
+                base_hartid, hart_count, false);
+            riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                    i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
         }
 
         /* Per-socket interrupt controller */
@@ -1008,8 +1239,9 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(memmap, i,
                                              base_hartid, hart_count);
         } else {
-            s->irqchip[i] = virt_create_aia(s->aia_type, memmap, i,
-                                            base_hartid, hart_count);
+            s->irqchip[i] = virt_create_aia(s->aia_type, s->aia_guests,
+                                            memmap, i, base_hartid,
+                                            hart_count);
         }
 
         /* Try to use different IRQCHIP instance based device type */
@@ -1156,6 +1388,27 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
 
+static char *virt_get_aia_guests(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    char val[32];
+
+    sprintf(val, "%d", s->aia_guests);
+    return g_strdup(val);
+}
+
+static void virt_set_aia_guests(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->aia_guests = atoi(val);
+    if (s->aia_guests < 0 || s->aia_guests > IRQ_LOCAL_GUEST_MAX) {
+        error_setg(errp, "Invalid number of AIA IMSIC guests");
+        error_append_hint(errp, "Valid values be between 0 and 31 (for RV32) "
+                         "or between 0 and 63 (for RV64).\n");
+    }
+}
+
 static char *virt_get_aia(Object *obj, Error **errp)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
@@ -1165,6 +1418,9 @@ static char *virt_get_aia(Object *obj, Error **errp)
     case VIRT_AIA_TYPE_APLIC:
         val = "aplic";
         break;
+    case VIRT_AIA_TYPE_APLIC_IMSIC:
+        val = "aplic-imsic";
+        break;
     default:
         val = "none";
         break;
@@ -1181,9 +1437,12 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
         s->aia_type = VIRT_AIA_TYPE_NONE;
     } else if (!strcmp(val, "aplic")) {
         s->aia_type = VIRT_AIA_TYPE_APLIC;
+    } else if (!strcmp(val, "aplic-imsic")) {
+        s->aia_type = VIRT_AIA_TYPE_APLIC_IMSIC;
     } else {
         error_setg(errp, "Invalid AIA interrupt controller type");
-        error_append_hint(errp, "Valid values are none, and aplic.\n");
+        error_append_hint(errp, "Valid values are none, aplic, and "
+                          "aplic-imsic.\n");
     }
 }
 
@@ -1231,7 +1490,16 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
                                           "conttoller. Valid values are "
-                                          "none, and aplic.");
+                                          "none, aplic, and aplic-imsic.");
+
+    object_class_property_add_str(oc, "aia-guests",
+                                  virt_get_aia_guests,
+                                  virt_set_aia_guests);
+    object_class_property_set_description(oc, "aia-guests",
+                                          "Set number of guest MMIO pages "
+                                          "for AIA IMSIC. Valid value should "
+                                          "be between 0 and 31 (for RV32) or "
+                                          "between 0 and 63 (for RV64).");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index a26ef4a295..a20b80dd1d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,8 +24,10 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX 8
-#define VIRT_SOCKETS_MAX 8
+#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
+#define VIRT_SOCKETS_MAX_BITS          2
+#define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
 
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
 typedef struct RISCVVirtState RISCVVirtState;
@@ -35,6 +37,7 @@ DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
 typedef enum RISCVVirtAIAType {
     VIRT_AIA_TYPE_NONE=0,
     VIRT_AIA_TYPE_APLIC,
+    VIRT_AIA_TYPE_APLIC_IMSIC,
 } RISCVVirtAIAType;
 
 struct RISCVVirtState {
@@ -50,6 +53,7 @@ struct RISCVVirtState {
     int fdt_size;
     bool have_aclint;
     RISCVVirtAIAType aia_type;
+    int aia_guests;
 };
 
 enum {
@@ -65,6 +69,8 @@ enum {
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
+    VIRT_IMSIC_M,
+    VIRT_IMSIC_S,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
@@ -81,7 +87,10 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_BASE_IPI 1
+#define VIRT_IRQCHIP_NUM_IPIS 7
+#define VIRT_IRQCHIP_NUM_MSIS 255
+#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
 
 #define VIRT_PLIC_HART_CONFIG "MS"
@@ -98,6 +107,7 @@ enum {
 #define FDT_PCI_INT_CELLS     1
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
+#define FDT_IMSIC_INT_CELLS   0
 #define FDT_MAX_INT_CELLS     2
 #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_MAX_INT_CELLS)
-- 
2.25.1


