Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChT-0003IL-KP
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChN-0003DS-T7; Sat, 23 Oct 2021 04:48:19 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChL-0007Fj-CD; Sat, 23 Oct 2021 04:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978894; x=1666514894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/m+pb6B4KK3IKZzdxau0a214vI4jr9MbdzhsMRb843U=;
 b=bQj9/NN4VLls6p0U7vLJqStn8xmc/FvZ1rpw9qXdwxlRjhAVM7sL0ER4
 VflP1Nr5xbolrtQwQ/9zPqoZTeQj3724pmklV5Vart91vW+xh5tjyiNs+
 B6kp6RuL5dlEzUP41gSSFjszwBJuO9OYYLt8iNRrFzlBSKotyS6+FobyP
 t/2jIHfWQZWzBPCm+yEXu0bs2q6Oy/KSY6D4waPmChJjEWVQYA1fB562z
 fma+CTkJOHh8JzNln+iVz5pzAWRAxnQhkJP4T6Dc5hwngfmWYTxI8jnkM
 dBJRxVyONf1yyhBM4xF/+dz3M/Uu0IuhQeF8taeekUV1F+m5KlG/yA/+u Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437381"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izIPXdFJLnfQyXf1mO1mpCe8uU5yzwZDtSMnREpn+9a6zbQGxGqsL0iPoNK01Knw1V6hPoss9Zw28fAa1crXupWN22hQ+xc2dcAtn4fWcqcEY3KXPbsmBAOF2kDh4f3JJTfAw/kCrLyx1cjQXzQSMtyv6A0kzti655ez8YhmY7QnqCDiVeGwmqPy0ER1gm6H6uXq95FtePr8U5yOKbeBKtDKriPwh2onrAJ9Saah50Xa4lAKmvZApJUz786Ww1G6evj6mIJWgclXjPmlbbyvRuT+HOR5aBvTT7hc4xVaOP/Mch08iJo8R9r+5CvI8p7+EwO8iWiaHhnwgGgV6ogNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20CN8QSGjuuUSn794mTU1Wold6bVUdDJ1zZ/1OXqtCU=;
 b=I6ern8iVV7/ofkYpvYP80W/MxyFxumffTOHK/0rQzQSoC3hXpp8uTgiM+ijh2RYZt8SQwSh0vauUMY0nzXtTZmATfqVgh4Psg7cnHnCGMjPNAcewUZqJGnL3ok8MzLmo5wJDDRaJcUtKGxStEQyRYkCpMhs5febGI90YCSs+jX9nb+QFxOZcatVIiOEumo/4xHUXFBtqbFUGg0aa/3IwcEGdaxDoI0BtxAm7MDDBiBZByXpWheTITpPAIefgrWJZRdgQ9x+EJvU2iZ0BbAXoxF/kAMwetlP/sa+NF37QgoOIRzaBA+JNMTcNjW640KoF98muzpbr5W+Z5PCSPy7nCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20CN8QSGjuuUSn794mTU1Wold6bVUdDJ1zZ/1OXqtCU=;
 b=WyOosiSCTsI5nm7hB9N+haDJx7jEBs753EG4xDb9tXPQ4nrPNzxArgpNI6FMcN1OtAGFlco0L5fMjQnnPQm6iO1oYDiLXLe4rNVzfY+81FhBjzcsQqrsM5dFndXIkSiWc9k+jbKfmc+mj/ko6hkEYp33sNejCkgY1uRADQkotAE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:05 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:05 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 14/22] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Sat, 23 Oct 2021 14:16:30 +0530
Message-Id: <20211023084638.1697057-15-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c0636d1-629b-48ca-fde5-08d99601d418
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB840914008AFECCCEF72E0A578D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0XeBfGJS3mFRuYdhAAU3XZI4+2mJRp4+q47yGkc6/Mkh/9V48ofvG462sxi2EJRkNyKeotWc1+lBe9R1B6KZpV9wWdxNHboRcNK+ohrdTE4ZBaAzF+JWA9KrqbJEZfWU6+fLB4gmBDShZIMg5bXw9qXXmIlKTlc4N34vqnxhhnWHDDD1XMBorNvn2/fA/E7dSibjbFAbR1fLIqW0s6cswLnRPP2F/K3QVeWjOpTdp1bqRoppAshhaiWN60nSmJojbI6hhWBOrGNYcsCM7rd96mh/YUH/mbvQ6w2BwGCCmyJKpMYwsFMHaIQKTuNrOyYrqC4INzVZCnBVbcGDn1JW1ZH/9tc74wbZ2NAGhiICeVYIhpUi3JRjFgcFN/s1d++LYsSQ0FY9zhjAmvSry5siUlrZmECoxFuNtU8/i2VBngzwgR0ioPSzKNj8rLCV+oAviBjbS3k4pC1ki/3lArMO+bzM6umm5/Ev4vpKcZC5Kuu04UHxkRVLQR3YE+oEV0oT99Nev8D8UpGejBKZgFl2Vgwxl3fq6WicyeFDFG4zAlKLBkOeQr9WKRPtIky7FifT/DDCo1LpAUgK4ywYwkWGTeXes3yJjEgHCNEkno8zmbLv1J684/oBvCQalz4ipYDW6p/PS80bJ3ezZrpPqYtKwUMVhfvlMagK97tZ0EOKJ2ML87iK90IcBIeMzMWCFQPu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4lAtxJGm2zBA/iE8abqHgo5SQHhbwEDtrVZTZBvXg0D1FcOz+02M2jd6yswv?=
 =?us-ascii?Q?EPZF45LWX1aK73PC+3VlKaXGAbxNJufU4wGXgkT16XZbMOheLTQMBYdnvUZb?=
 =?us-ascii?Q?6y/+4L2Nnpdl9xulIR8Y6fHQCEDlwm+Y2S3kkdIFK/8Cwv+kYrHCo3vgKWyf?=
 =?us-ascii?Q?NH9gXm2NGr2kWCv7qRi70JHPv6x9bvFCBhSONEm5FSLQyTn3aZ5deAKxRUYS?=
 =?us-ascii?Q?20mioEXhVmtCaIzqASk6mPCawzDQ0B8ljLew0J3Vvfc0naa/O3V2B9yLYxiD?=
 =?us-ascii?Q?FvCg5DVbOxDjbocJmxiDztotZO41C2ftK4p2bFcVkwm8G3cDshRxrsi6Nzir?=
 =?us-ascii?Q?nPF3nwEkrRzyuA2buapXD5X2AtYDPNmcfAoWDSRdOnHcw+arruXOr5y+BbdI?=
 =?us-ascii?Q?uOR2+JNVxsPtW+Q82pSUglQXwMte6QQX6rffuzODBPRHK6QWUR5yHU6fwHAG?=
 =?us-ascii?Q?Rj0QSFRClKD9NtMfpNN7ETtO6cJd4ttzyY3Bi0zPTnPty3uDwgogacpxM3zb?=
 =?us-ascii?Q?l6GihehZfZZVsSa0hq71GmemffwIc57sCTXLbdb4FkXNxxVhDEhtfVAijcbJ?=
 =?us-ascii?Q?zmE/1si7QgG/aqmroCVOMAwQMrXo5ra7f22LZ6+uuWN4MpnOBTyihvTTfKEk?=
 =?us-ascii?Q?qDDGtw67dPDfI/RTFKHbgvrlx/2dxqO9z0WDWOpF63iq9D0KNUx6tiRxMPh9?=
 =?us-ascii?Q?g/21iWO9DXcWh9ocCoGquIn6ZmkL9LDPyddglfPAxg8n0X/I8i4WjBcGlnZJ?=
 =?us-ascii?Q?FEjghsCm3X9SoynK2+6PN0lAg6sXUwQvR216NzJTV0uYBFZCZTRHVRwGT0lY?=
 =?us-ascii?Q?m3CUNExB2wHCJv7Kp2haUdVmPF3cbkPZDZShZZI+qPziLmouYzZI7Y9r/sjF?=
 =?us-ascii?Q?2Czu9iqOwtWPEKD22GgYGCzFOceBU1eiK3DkAgjl3wBqNerKH7XL1Y6c7Wpq?=
 =?us-ascii?Q?NHQ3tfnaUmP780CoW2kU0/++HL5sQKJ6g6s4f4hllhU8Ztk8KcB1HLNUcfXe?=
 =?us-ascii?Q?Nx1MDy7++xNgwZ4xYt6hufqM4RiR3iQxu0NP1HgXg3DKcqPX296o87BjKVRS?=
 =?us-ascii?Q?0vWIR+sD5jFGCrrK1qNFTcYvlQQySQihnUYemovMN/zAieX2/PeRo+dejFYV?=
 =?us-ascii?Q?dtI8HhiqLE6Ovmkm6Lgm6+3biEd9a4yErYzL6RvB3verC3NFAo9+x85kLqGb?=
 =?us-ascii?Q?MNvnwtsMb7BTU7aCwu8kbMu04MfU1qNIQ3Msb4T4giaDK2O2p0dsz7x4DUrg?=
 =?us-ascii?Q?4X46dfTJn7u0XxgHRbJolX8rgMy82MwDpUUOJYOubO5pQxgm4jJzxRX1Ft7+?=
 =?us-ascii?Q?iFUZ06mbEkyGjdOlLHQ5hOApVAaYQCyTd91wOK7lNABVm4eKWjYGBcAd0OOM?=
 =?us-ascii?Q?3uSATIs94TeMLk3gcixdbnx9QvqFFagaIOiJ7Zmb6yrjttb3BZhtMR+y5XDJ?=
 =?us-ascii?Q?4Gi+/++GYXfxkaUd9NatJHcwzi2i0AUSvg8PhFmUnQpDNkGLEK49cPP8yiWD?=
 =?us-ascii?Q?cyVsp3T7U70nJq+DoqX3p5d0PGd3f+Utu81qmR6DzNnh9xIxgL/ztoSrBM05?=
 =?us-ascii?Q?yw58k/3H/4eRvzQzqWu02oX1Hqwfa/eTdiAzG633BNTT5UhsI3OqbEMMdtrT?=
 =?us-ascii?Q?AY4xttk3WLG6SOZ4OJ/IpXQ=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0636d1-629b-48ca-fde5-08d99601d418
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:05.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TelNMoeerKJh9rvBcL62nza574jFWlxvJOzi52xpYuiWy99+8FmqMO/zrLaMN9vH1thV1XAyv8JCivvA08PcZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8409
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:19 -0000

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 174 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 184 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 21d9c536ef..bf688eb1ea 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -183,6 +183,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -212,6 +216,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e857d1e5..e72220fd0f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -854,6 +854,168 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
     return RISCV_EXCP_NONE;
 }
 
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong *iselect;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Find the iselect CSR based on CSR number */
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect = &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect = &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect = &env->vsiselect;
+        break;
+    default:
+         return RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val = *iselect;
+    }
+
+    wr_mask &= ISELECT_MASK;
+    if (wr_mask) {
+        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong wr_mask, int ext_irq_no)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+#if TARGET_LONG_BITS == 64
+    if (iselect & 0x1) {
+        return -EINVAL;
+    }
+#endif
+
+    nirqs = 4 * (TARGET_LONG_BITS / 32);
+    firq = ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * (nirqs);
+
+    old_val = 0;
+    for (i = 0; i < nirqs; i++) {
+        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
+    }
+
+    if (val) {
+        *val = old_val;
+    }
+
+    if (wr_mask) {
+        new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
+        for (i = 0; i < nirqs; i++) {
+            /*
+             * M-level and S-level external IRQ priority always read-only
+             * zero. This means default priority order is always preferred
+             * for M-level and S-level external IRQs.
+             */
+            if ((firq + i) == ext_irq_no) {
+                continue;
+            }
+            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio = env->miprio;
+        isel = env->miselect;
+        priv = PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio = env->siprio;
+        isel = env->siselect;
+        priv = PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio = env->hviprio;
+        isel = env->vsiselect;
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode */
+        if (!virt) {
+            ret = rmw_iprio(isel, iprio, val, new_val, wr_mask,
+                            (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
+        }
+    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->aia_ireg_rmw_fn[priv]) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && (!vgein || env->geilen < vgein)) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                    AIA_MAKE_IREG(isel, priv, virt, vgein),
+                                    val, new_val, wr_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2231,6 +2393,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
@@ -2261,6 +2427,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
@@ -2302,6 +2472,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index bc20960260..821e05d934 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -127,6 +127,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -184,6 +185,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
-- 
2.25.1


