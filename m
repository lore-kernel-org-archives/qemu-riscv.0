Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsf-0006no-D5
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsc-0006fa-I4; Fri, 10 Dec 2021 23:21:03 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsY-0001mA-8n; Fri, 10 Dec 2021 23:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196457; x=1670732457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+36KBvgqrGfN5+wmlXT52UMAsfg9KJ/2Nw1KGvzjR60=;
 b=mL8uceAUucvBewLMzVLzz7DEGABZS7YXJ6TRestxsYmIBEeZHBrfMLvD
 b887KdD0dgd4PVZ8Ykp8Z4qGyKveYYRw5B4uy4QtWwnlI0/KPbXClcePu
 qjzYCB5+WxLZlOkBOm1Oi1Hl4xDkA7IL0Tv/VoLODf0o/eTfCQwzMreDz
 Oyc/DlJjOh5DjkLMtSeg42XJJ+nk0J0CwLkf+RT1dQSiRE/ODiKpzI17M
 b1EXuvrP1l7tGRxXs3l8/ZNRQ6aZYiqT84Irv4PU4djj7s9UsZfBh1hd5
 xfv+d0vLfHgGVeHdDFLOiMR3O9a/Y1eDxMHmcun5bJyxXoarstfJjZ8u5 Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989955"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtC3NSLH6Xo8fcFq/ptIjZQjSTmHpPdd1q1oIf+MJBm7PxqQObJMJsqAIPgzZpr5V3hfufb8EylvU0iwCsZDb3tk4FgFGeqcsq5b/fNZfu/sWXV9vGw4OJc0WqKUEFtfYPF8v7PGe19tSG19wUC6+2zzDh7RImJPjNWKZaKfRmb230f/STrf4R9TlTHR/RscWSiJWDG/cjGRrTemIOtIrN8Sla0RyXQdJ6B+SyS5ikbBNrTrscJORbcQ4z6hhcO8E/bMElkKwKoRqmt1pVUdp1CJa1PQ0DqJrYMNSJkTp08ufbNTaX5+DsCwyxkMK3my9F7Dwcph2GZIopRqR7dqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x18SoAZ7f2qiDTNXNU6Z7fMNlWWQqFgt65cR2MfEEX8=;
 b=fi7o6TIes5mTrtN7elcAt8mbDZr8hEe3//mQq++FJD/g0MRKjtb+RrsLin9SJ/7MNCG0ohgGE6TLpIzVaWI/mGNM8m7bRSrgwqHSKWtm36SILG/8B7mN7XHPRAgprtjZ0y/WhnWmv5Mq38pk0hYPvT7RZTuQo9SqEkF13gNggoxUsCqBfUu3RsthzI+zZM74L+h0VjalEZSWtz4dtpIvc8++k/fAUx97f8Pa+Nmd0GNJUiizMyoZ7wTbcJf02JERBtLAVOWZabSKPKWpBct0SJ3/2jmaNLd4NML34+uB1bFPG+V83Zcybm+BsReAJuZ4PInrdimPkmZO9m53KthiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x18SoAZ7f2qiDTNXNU6Z7fMNlWWQqFgt65cR2MfEEX8=;
 b=hOOIsQYuh9t4RuAt45f67MmOZixF6fVTFqhTV/GBYWN5FGYqFfo+B8pHR80GnxFuMyNjLXexWbg9DTdFqcOwnAD14TJRy1SstodH9n4bUqoAF7TXjByjt05dvcidEiMn0V/ykV31yGw5eYatWWZo7KXEw3SO1ZD0MGRvqchlitg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:53 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:53 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 18/23] hw/intc: Add RISC-V AIA APLIC device emulation
Date: Sat, 11 Dec 2021 09:49:12 +0530
Message-Id: <20211211041917.135345-19-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211041917.135345-1-anup.patel@wdc.com>
References: <20211211041917.135345-1-anup.patel@wdc.com>
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6e2e480-0b90-4fe0-7bdf-08d9bc5d9f06
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826821A0558478CC5999D06A8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 190vrCqHbJR66uXDZxeYpoZVFZ3B5jYJ62WBzbnvBMOQZeb6z+GM4BLDCOg8IQRK6W22PcsX1wOYpqb4As/lUv7iJ9eVWV0DAsqoC2BpPeInorTYQdBv8bm5C48tvJ0XKdw5Vpy9fwik6qBtqfk9ycd9t0mWuEaa6gJW27uf/v/g21xqSeviiGZqJjUyaXe1tEGbodr5XqiBcrKgBF0CWMTUBddNliRBD946E4Xn4IUAkLCFWKa1jCqk7xOTWG1G2ydfyyvUnNvCp0JB/SJ6BoPt5CnUaab0eWSAwGmwGN/fEHp7QQe8kwRQnEgsmYmDwdMlSpoZ19Bye2u79mfmyjw2akbvUPZ686Bi3MlekcRznCGwGjtRm+6SowQrhJR+KwwChVtQ28aVZIWhpVKZVBCqFacWbZUg77tYQgcteHKCHaySSOoXd1tZNGAoFh8GhvB8gOpbNmsgc6wb4ypBqVROZ5SycZ6s0Ott0BTLKP6WdkNI+cSMDNlZGJECWCZdlwJjouToj796zUfE0htETySRLq44Iz/v6bF9VXVF7gcaw/E/ohJ7sJzqytmzvCknQu2Cd55GNalpn7EKHA9yYtl/dNovQ+EXRV10R2+n4QAQzPh1lC6/Ix/wPUjjUVFLHV5NP0roSt4uwQkwYOvxLAYHuY84Ibp5zTN6lXoP4xO7D5L5pB3C99itJP/vN2312eM2WKlrTq0qPI6n8ORFPD09GSRMyuYwT+tP+3+puzuwKiVU4LNjLtFY1en9ZjRE2lNQA/kdzGj5GOv4magJJIUAQ6Qo+rdHZMRRTyGei4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(30864003)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eoNH1mLmFOPuBi/oNZp2ZienTdSyXtDnrVtc2V1714MXOYqyHbKBQF7f4g2K?=
 =?us-ascii?Q?eEaaA7aekIExtnuxTNshfXSeC3biPM9SxpRH3YV/mE1SN93q14j7DOWOpomw?=
 =?us-ascii?Q?NPMqyJ3QMY5w4KGctjeRhWuhMdWqvVj3PQOfGL8jRFqnmDxxliJ2TK6m0mWs?=
 =?us-ascii?Q?+DI+dhM4vu03mhQbTVzhrEqCqWm/ISRJdE01uc1S4xLgMmJRSl5Iq1JRR72W?=
 =?us-ascii?Q?TATJVHAFEUvrnAh065XmmP5tajpkewfWLO/wv1QU1Pz6c/Qp/BTxMvCCHLDh?=
 =?us-ascii?Q?L8HsPpd7e/jN2wddKVvWsfCi0AYudRAQbEP41CoWDaT9Izpamk2qqYBEH2k5?=
 =?us-ascii?Q?Soe24O1TNaWW7aLLb1W+SGCzo8Dd7wpu+iJbuWctxIVPA7I42v8MVq+seDLB?=
 =?us-ascii?Q?kQ9R/IotmNXm6UlIxmUssy0oVGvjRrUy1X23vf1WYxlL4vbsf8yeqC6Fumeh?=
 =?us-ascii?Q?dJ9U4MbyGAdyg0a6sZD1LRziFuJbpltlxhSpRtn42I73XXXjqEAu19sV9M/W?=
 =?us-ascii?Q?4ay/XQqLhmAR+xCStVTNc/BIpM411OqlpJcOVtnfznVeLRuXkYWX0B9OvoPR?=
 =?us-ascii?Q?kXvjbqgWfB/VeHeIeghKO0V4K3DkMkMYWa+1jYS1YLizLA6gwACHUfTExRhA?=
 =?us-ascii?Q?5jkO9ADOQ1utxyEpkeq3jUHIR1RbVYpHnwzySNqXVRquOOIAUYo4YXq5bN/r?=
 =?us-ascii?Q?w4lRcq+4y9ghJ9Mqd0zNypzu5p9fjqeDkocD7Pa3/gnuJr6CqYa3XVVVkFK9?=
 =?us-ascii?Q?7NbLClyHZmiIMI1BXSTP8EKiBv1EHbZiOMvY+r9DAn3ZBB9SUgj4QULL7CR1?=
 =?us-ascii?Q?3xCbjg4jWVrr3UTQzagNtifQVvBJR5xEDUWc23cARHlAM0JVcMiBN4T5rhxd?=
 =?us-ascii?Q?VYnjc8UIG4FmwkGpkjFre+VgTWsmLIEt6RNXz4L2xdQU9RQ7Lv1EJDVh2D0k?=
 =?us-ascii?Q?NmnGykhk2GR9xaM36KKtqeCKKp1jlGzWUvQNW1qwWrVJOP6mvSQFrw98apwb?=
 =?us-ascii?Q?Q5h7Be81pjNf/hHbSqjSpb6v3paLjbXAZN3+kG7yiNgcUg1IRsG97NLdIafJ?=
 =?us-ascii?Q?sepRJq3EPVvMWz0ymlUxCb6ApWfzuNQgzLFX7AJE2YecNl2fYn8Tz55nLmAD?=
 =?us-ascii?Q?6oXFTCL6kpge7+urJUS+LAWsAK3Nv+iR+euQj04S6nTwBUmIwypa9C/kyj+V?=
 =?us-ascii?Q?woOUtSN/skLPAuOa2UGwC3wxbJBYT8yc+6LV5kYwJffsQtTMP8qWEcREN/Xo?=
 =?us-ascii?Q?7SHW5YYeJzlFRIdUOz50wPA5v6X9/LvET69B15LmVgWdY+Ln+Gir0WRX+fCu?=
 =?us-ascii?Q?ECzPpKWsjF6D2p1bTvkHXqbF8lcPlv5LRRZglNMJ/haqwyftywXe9WA4ZbDk?=
 =?us-ascii?Q?GsO08bURxJW1Wxx0bR77dN51Ir4EvZ32u5iGJtVnZKJ4pe0fhpHGbjqhaqM9?=
 =?us-ascii?Q?bblmUQE8zEpk5QXj105Pz1RStCL8pxpATYPpi8v9OypUKYDgnOTNlwpiFZj/?=
 =?us-ascii?Q?kvVk0XhWRFUMegW/rfZg9S8y6o1PHIKJFFueQS9Kg3XGu9Kqnd+YvUm/6Ddi?=
 =?us-ascii?Q?yBKicB4dSP7qKrICoezhHHOhjm9oA0VySU+FUOTl+26n+n3kvK/ooR3N3o7L?=
 =?us-ascii?Q?7Ml6sot7qpSyR33c5o1vnqY=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e2e480-0b90-4fe0-7bdf-08d9bc5d9f06
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:53.7180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKMU91wG6l02asCGYOlF4WeS5cG6MG3r85+78D61MqnynwiTG69g94ehk5pI8LFops2wbTxix883+w9xSrL8WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 11 Dec 2021 04:21:03 -0000

The RISC-V AIA (Advanced Interrupt Architecture) defines a new
interrupt controller for wired interrupts called APLIC (Advanced
Platform Level Interrupt Controller). The APLIC is capabable of
forwarding wired interupts to RISC-V HARTs directly or as MSIs
(Message Signaled Interupts).

This patch adds device emulation for RISC-V AIA APLIC.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/intc/Kconfig               |   3 +
 hw/intc/meson.build           |   1 +
 hw/intc/riscv_aplic.c         | 970 ++++++++++++++++++++++++++++++++++
 include/hw/intc/riscv_aplic.h |  79 +++
 4 files changed, 1053 insertions(+)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 include/hw/intc/riscv_aplic.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 78aed93c45..1592623233 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -65,6 +65,9 @@ config LOONGSON_LIOINTC
 config RISCV_ACLINT
     bool
 
+config RISCV_APLIC
+    bool
+
 config SIFIVE_PLIC
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index c89d2ca180..77b068f673 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,6 +47,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
+specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
new file mode 100644
index 0000000000..f4b8828dac
--- /dev/null
+++ b/hw/intc/riscv_aplic.c
@@ -0,0 +1,970 @@
+/*
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/error-report.h"
+#include "qemu/bswap.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+#include "hw/pci/msi.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/riscv_aplic.h"
+#include "hw/irq.h"
+#include "target/riscv/cpu.h"
+#include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
+
+#define APLIC_MAX_IDC                  (1UL << 14)
+#define APLIC_MAX_SOURCE               1024
+#define APLIC_MIN_IPRIO_BITS           1
+#define APLIC_MAX_IPRIO_BITS           8
+#define APLIC_MAX_CHILDREN             1024
+
+#define APLIC_DOMAINCFG                0x0000
+#define APLIC_DOMAINCFG_IE             (1 << 8)
+#define APLIC_DOMAINCFG_DM             (1 << 2)
+#define APLIC_DOMAINCFG_BE             (1 << 0)
+
+#define APLIC_SOURCECFG_BASE           0x0004
+#define APLIC_SOURCECFG_D              (1 << 10)
+#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
+#define APLIC_SOURCECFG_SM_MASK        0x00000007
+#define APLIC_SOURCECFG_SM_INACTIVE    0x0
+#define APLIC_SOURCECFG_SM_DETACH      0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
+
+#define APLIC_MMSICFGADDR              0x1bc0
+#define APLIC_MMSICFGADDRH             0x1bc4
+#define APLIC_SMSICFGADDR              0x1bc8
+#define APLIC_SMSICFGADDRH             0x1bcc
+
+#define APLIC_xMSICFGADDRH_L           (1UL << 31)
+#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
+#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
+#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
+#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
+#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
+#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
+#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
+#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
+#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
+
+#define APLIC_xMSICFGADDR_PPN_SHIFT    12
+
+#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
+    ((1UL << (__lhxs)) - 1)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
+    ((1UL << (__lhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
+    ((__lhxs))
+#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
+    (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
+     APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
+    ((1UL << (__hhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
+    ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
+    (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
+     APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
+
+#define APLIC_xMSICFGADDRH_VALID_MASK   \
+    (APLIC_xMSICFGADDRH_L | \
+     (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
+     (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
+     (APLIC_xMSICFGADDRH_HHXW_MASK << APLIC_xMSICFGADDRH_HHXW_SHIFT) | \
+     (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
+     APLIC_xMSICFGADDRH_BAPPN_MASK)
+
+#define APLIC_SETIP_BASE               0x1c00
+#define APLIC_SETIPNUM                 0x1cdc
+
+#define APLIC_CLRIP_BASE               0x1d00
+#define APLIC_CLRIPNUM                 0x1ddc
+
+#define APLIC_SETIE_BASE               0x1e00
+#define APLIC_SETIENUM                 0x1edc
+
+#define APLIC_CLRIE_BASE               0x1f00
+#define APLIC_CLRIENUM                 0x1fdc
+
+#define APLIC_SETIPNUM_LE              0x2000
+#define APLIC_SETIPNUM_BE              0x2004
+
+#define APLIC_ISTATE_PENDING           (1U << 0)
+#define APLIC_ISTATE_ENABLED           (1U << 1)
+#define APLIC_ISTATE_ENPEND            (APLIC_ISTATE_ENABLED | \
+                                        APLIC_ISTATE_PENDING)
+#define APLIC_ISTATE_INPUT             (1U << 8)
+
+#define APLIC_GENMSI                   0x3000
+
+#define APLIC_TARGET_BASE              0x3004
+#define APLIC_TARGET_HART_IDX_SHIFT    18
+#define APLIC_TARGET_HART_IDX_MASK     0x3fff
+#define APLIC_TARGET_GUEST_IDX_SHIFT   12
+#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
+#define APLIC_TARGET_IPRIO_MASK        0xff
+#define APLIC_TARGET_EIID_MASK         0x7ff
+
+#define APLIC_IDC_BASE                 0x4000
+#define APLIC_IDC_SIZE                 32
+
+#define APLIC_IDC_IDELIVERY            0x00
+
+#define APLIC_IDC_IFORCE               0x04
+
+#define APLIC_IDC_ITHRESHOLD           0x08
+
+#define APLIC_IDC_TOPI                 0x18
+#define APLIC_IDC_TOPI_ID_SHIFT        16
+#define APLIC_IDC_TOPI_ID_MASK         0x3ff
+#define APLIC_IDC_TOPI_PRIO_MASK       0xff
+
+#define APLIC_IDC_CLAIMI               0x1c
+
+static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
+                                            uint32_t word)
+{
+    uint32_t i, irq, ret = 0;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        ret |= ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) << i;
+    }
+
+    return ret;
+}
+
+static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState *aplic,
+                                              uint32_t word)
+{
+    uint32_t i, irq, ret = 0;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        ret |= ((aplic->state[irq] & APLIC_ISTATE_PENDING) ? 1 : 0) << i;
+    }
+
+    return ret;
+}
+
+static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,
+                                        uint32_t irq, bool pending)
+{
+    if (pending) {
+        aplic->state[irq] |= APLIC_ISTATE_PENDING;
+    } else {
+        aplic->state[irq] &= ~APLIC_ISTATE_PENDING;
+    }
+}
+
+static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
+                                    uint32_t irq, bool pending)
+{
+    uint32_t sourcecfg, sm;
+
+    if ((irq <= 0) || (aplic->num_irqs <= irq)) {
+        return;
+    }
+
+    sourcecfg = aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        return;
+    }
+
+    sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
+    if ((sm == APLIC_SOURCECFG_SM_INACTIVE) ||
+        (!aplic->msimode && ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
+                             (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)))) {
+        return;
+    }
+
+    riscv_aplic_set_pending_raw(aplic, irq, pending);
+}
+
+static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,
+                                         uint32_t word, uint32_t value,
+                                         bool pending)
+{
+    uint32_t i, irq;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        if (value & (1U << i)) {
+            riscv_aplic_set_pending(aplic, irq, pending);
+        }
+    }
+}
+
+static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState *aplic,
+                                              int word)
+{
+    uint32_t i, irq, ret = 0;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        ret |= ((aplic->state[irq] & APLIC_ISTATE_ENABLED) ? 1 : 0) << i;
+    }
+
+    return ret;
+}
+
+static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,
+                                        uint32_t irq, bool enabled)
+{
+    if (enabled) {
+        aplic->state[irq] |= APLIC_ISTATE_ENABLED;
+    } else {
+        aplic->state[irq] &= ~APLIC_ISTATE_ENABLED;
+    }
+}
+
+static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
+                                    uint32_t irq, bool enabled)
+{
+    uint32_t sourcecfg, sm;
+
+    if ((irq <= 0) || (aplic->num_irqs <= irq)) {
+        return;
+    }
+
+    sourcecfg = aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        return;
+    }
+
+    sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
+    if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
+        return;
+    }
+
+    riscv_aplic_set_enabled_raw(aplic, irq, enabled);
+}
+
+static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,
+                                         uint32_t word, uint32_t value,
+                                         bool enabled)
+{
+    uint32_t i, irq;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        if (value & (1U << i)) {
+            riscv_aplic_set_enabled(aplic, irq, enabled);
+        }
+    }
+}
+
+static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
+                                 uint32_t hart_idx, uint32_t guest_idx,
+                                 uint32_t eiid)
+{
+    uint64_t addr;
+    MemTxResult result;
+    RISCVAPLICState *aplic_m;
+    uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msicfgaddrH;
+
+    aplic_m = aplic;
+    while (aplic_m && !aplic_m->mmode) {
+        aplic_m = aplic_m->parent;
+    }
+    if (!aplic_m) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: m-level APLIC not found\n",
+                      __func__);
+        return;
+    }
+
+    if (aplic->mmode) {
+        msicfgaddr = aplic_m->mmsicfgaddr;
+        msicfgaddrH = aplic_m->mmsicfgaddrH;
+    } else {
+        msicfgaddr = aplic_m->smsicfgaddr;
+        msicfgaddrH = aplic_m->smsicfgaddrH;
+    }
+
+    lhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
+            APLIC_xMSICFGADDRH_LHXS_MASK;
+    lhxw = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
+            APLIC_xMSICFGADDRH_LHXW_MASK;
+    hhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
+            APLIC_xMSICFGADDRH_HHXS_MASK;
+    hhxw = (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
+            APLIC_xMSICFGADDRH_HHXW_MASK;
+
+    group_idx = hart_idx >> lhxw;
+    hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
+
+    addr = msicfgaddr;
+    addr |= ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK)) << 32;
+    addr |= ((uint64_t)(group_idx & APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw))) <<
+             APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
+    addr |= ((uint64_t)(hart_idx & APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw))) <<
+             APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
+    addr |= (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
+    addr <<= APLIC_xMSICFGADDR_PPN_SHIFT;
+
+    address_space_stl_le(&address_space_memory, addr,
+                         eiid, MEMTXATTRS_UNSPECIFIED, &result);
+    if (result != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
+                      "hart_index=%d guest_index=%d eiid=%d\n",
+                      __func__, hart_idx, guest_idx, eiid);
+    }
+}
+
+static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic, uint32_t irq)
+{
+    uint32_t hart_idx, guest_idx, eiid;
+
+    if (!aplic->msimode || (aplic->num_irqs <= irq) ||
+        !(aplic->domaincfg & APLIC_DOMAINCFG_IE)) {
+        return;
+    }
+
+    if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) != APLIC_ISTATE_ENPEND) {
+        return;
+    }
+
+    riscv_aplic_set_pending_raw(aplic, irq, false);
+
+    hart_idx = aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+    hart_idx &= APLIC_TARGET_HART_IDX_MASK;
+    if (aplic->mmode) {
+        /* M-level APLIC ignores guest_index */
+        guest_idx = 0;
+    } else {
+        guest_idx = aplic->target[irq] >> APLIC_TARGET_GUEST_IDX_SHIFT;
+        guest_idx &= APLIC_TARGET_GUEST_IDX_MASK;
+    }
+    eiid = aplic->target[irq] & APLIC_TARGET_EIID_MASK;
+    riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);
+}
+
+static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t best_irq, best_iprio;
+    uint32_t irq, iprio, ihartidx, ithres;
+
+    if (aplic->num_harts <= idc) {
+        return 0;
+    }
+
+    ithres = aplic->ithreshold[idc];
+    if (!ithres) {
+        return 0;
+    }
+
+    best_irq = best_iprio = UINT32_MAX;
+    for (irq = 1; irq < aplic->num_irqs; irq++) {
+        if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=
+            APLIC_ISTATE_ENPEND) {
+            continue;
+        }
+
+        ihartidx = aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+        ihartidx &= APLIC_TARGET_HART_IDX_MASK;
+        if (ihartidx != idc) {
+            continue;
+        }
+
+        iprio = aplic->target[irq] & aplic->iprio_mask;
+        if (iprio >= ithres) {
+            continue;
+        }
+
+        if (iprio < best_iprio) {
+            best_irq = irq;
+            best_iprio = iprio;
+        }
+    }
+
+    if (best_irq < aplic->num_irqs && best_iprio <= aplic->iprio_mask) {
+        return (best_irq << APLIC_IDC_TOPI_ID_SHIFT) | best_iprio;
+    }
+
+    return 0;
+}
+
+static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t topi;
+
+    if (aplic->msimode || aplic->num_harts <= idc) {
+        return;
+    }
+
+    topi = riscv_aplic_idc_topi(aplic, idc);
+    if ((aplic->domaincfg & APLIC_DOMAINCFG_IE) &&
+        aplic->idelivery[idc] &&
+        (aplic->iforce[idc] || topi)) {
+        qemu_irq_raise(aplic->external_irqs[idc]);
+    } else {
+        qemu_irq_lower(aplic->external_irqs[idc]);
+    }
+}
+
+static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t irq, state, sm, topi = riscv_aplic_idc_topi(aplic, idc);
+
+    if (!topi) {
+        aplic->iforce[idc] = 0;
+        return 0;
+    }
+
+    irq = (topi >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MASK;
+    sm = aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
+    state = aplic->state[irq];
+    riscv_aplic_set_pending_raw(aplic, irq, false);
+    if ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) &&
+        (state & APLIC_ISTATE_INPUT)) {
+        riscv_aplic_set_pending_raw(aplic, irq, true);
+    } else if ((sm == APLIC_SOURCECFG_SM_LEVEL_LOW) &&
+               !(state & APLIC_ISTATE_INPUT)) {
+        riscv_aplic_set_pending_raw(aplic, irq, true);
+    }
+    riscv_aplic_idc_update(aplic, idc);
+
+    return topi;
+}
+
+static void riscv_aplic_request(void *opaque, int irq, int level)
+{
+    bool update = false;
+    RISCVAPLICState *aplic = opaque;
+    uint32_t sourcecfg, childidx, state, idc;
+
+    assert((0 < irq) && (irq < aplic->num_irqs));
+
+    sourcecfg = aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        childidx = sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
+        if (childidx < aplic->num_children) {
+            riscv_aplic_request(aplic->children[childidx], irq, level);
+        }
+        return;
+    }
+
+    state = aplic->state[irq];
+    switch (sourcecfg & APLIC_SOURCECFG_SM_MASK) {
+    case APLIC_SOURCECFG_SM_EDGE_RISE:
+        if ((level > 0) && !(state & APLIC_ISTATE_INPUT) &&
+            !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_EDGE_FALL:
+        if ((level <= 0) && (state & APLIC_ISTATE_INPUT) &&
+            !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
+        if ((level > 0) && !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_LEVEL_LOW:
+        if ((level <= 0) && !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (level <= 0) {
+        aplic->state[irq] &= ~APLIC_ISTATE_INPUT;
+    } else {
+        aplic->state[irq] |= APLIC_ISTATE_INPUT;
+    }
+
+    if (update) {
+        if (aplic->msimode) {
+            riscv_aplic_msi_irq_update(aplic, irq);
+        } else {
+            idc = aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+            idc &= APLIC_TARGET_HART_IDX_MASK;
+            riscv_aplic_idc_update(aplic, idc);
+        }
+    }
+}
+
+static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint32_t irq, word, idc;
+    RISCVAPLICState *aplic = opaque;
+
+    /* Reads must be 4 byte words */
+    if ((addr & 0x3) != 0) {
+        goto err;
+    }
+
+    if (addr == APLIC_DOMAINCFG) {
+        return aplic->domaincfg | (aplic->msimode ? APLIC_DOMAINCFG_DM : 0);
+    } else if ((APLIC_SOURCECFG_BASE <= addr) &&
+            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq  = ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
+        return aplic->sourcecfg[irq];
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDR)) {
+        return aplic->mmsicfgaddr;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDRH)) {
+        return aplic->mmsicfgaddrH;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDR)) {
+        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented only if:
+         * (a) the interrupt domain is at machine level
+         * (b) the domain???s harts implement supervisor mode
+         * (c) the domain has one or more child supervisor-level domains
+         *     that support MSI delivery mode (domaincfg.DM is not read-
+         *     only zero in at least one of the supervisor-level child
+         * domains).
+         */
+        return (aplic->num_children) ? aplic->smsicfgaddr : 0;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDRH)) {
+        return (aplic->num_children) ? aplic->smsicfgaddrH : 0;
+    } else if ((APLIC_SETIP_BASE <= addr) &&
+            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIP_BASE) >> 2;
+        return riscv_aplic_read_pending_word(aplic, word);
+    } else if (addr == APLIC_SETIPNUM) {
+        return 0;
+    } else if ((APLIC_CLRIP_BASE <= addr) &&
+            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_CLRIP_BASE) >> 2;
+        return riscv_aplic_read_input_word(aplic, word);
+    } else if (addr == APLIC_CLRIPNUM) {
+        return 0;
+    } else if ((APLIC_SETIE_BASE <= addr) &&
+            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIE_BASE) >> 2;
+        return riscv_aplic_read_enabled_word(aplic, word);
+    } else if (addr == APLIC_SETIENUM) {
+        return 0;
+    } else if ((APLIC_CLRIE_BASE <= addr) &&
+            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
+        return 0;
+    } else if (addr == APLIC_CLRIENUM) {
+        return 0;
+    } else if (addr == APLIC_SETIPNUM_LE) {
+        return 0;
+    } else if (addr == APLIC_SETIPNUM_BE) {
+        return 0;
+    } else if (addr == APLIC_GENMSI) {
+        return (aplic->msimode) ? aplic->genmsi : 0;
+    } else if ((APLIC_TARGET_BASE <= addr) &&
+            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
+        return aplic->target[irq];
+    } else if (!aplic->msimode && (APLIC_IDC_BASE <= addr) &&
+            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE))) {
+        idc = (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
+        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
+        case APLIC_IDC_IDELIVERY:
+            return aplic->idelivery[idc];
+        case APLIC_IDC_IFORCE:
+            return aplic->iforce[idc];
+        case APLIC_IDC_ITHRESHOLD:
+            return aplic->ithreshold[idc];
+        case APLIC_IDC_TOPI:
+            return riscv_aplic_idc_topi(aplic, idc);
+        case APLIC_IDC_CLAIMI:
+            return riscv_aplic_idc_claimi(aplic, idc);
+        default:
+            goto err;
+        };
+    }
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+    return 0;
+}
+
+static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
+        unsigned size)
+{
+    RISCVAPLICState *aplic = opaque;
+    uint32_t irq, word, idc = UINT32_MAX;
+
+    /* Writes must be 4 byte words */
+    if ((addr & 0x3) != 0) {
+        goto err;
+    }
+
+    if (addr == APLIC_DOMAINCFG) {
+        /* Only IE bit writeable at the moment */
+        value &= APLIC_DOMAINCFG_IE;
+        aplic->domaincfg = value;
+    } else if ((APLIC_SOURCECFG_BASE <= addr) &&
+            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq  = ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
+        if (!aplic->num_children && (value & APLIC_SOURCECFG_D)) {
+            value = 0;
+        }
+        if (value & APLIC_SOURCECFG_D) {
+            value &= (APLIC_SOURCECFG_D | APLIC_SOURCECFG_CHILDIDX_MASK);
+        } else {
+            value &= (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MASK);
+        }
+        aplic->sourcecfg[irq] = value;
+        if ((aplic->sourcecfg[irq] & APLIC_SOURCECFG_D) ||
+            (aplic->sourcecfg[irq] == 0)) {
+            riscv_aplic_set_pending_raw(aplic, irq, false);
+            riscv_aplic_set_enabled_raw(aplic, irq, false);
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDR)) {
+        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->mmsicfgaddr = value;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDRH)) {
+        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->mmsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDR)) {
+        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented only if:
+         * (a) the interrupt domain is at machine level
+         * (b) the domain???s harts implement supervisor mode
+         * (c) the domain has one or more child supervisor-level domains
+         *     that support MSI delivery mode (domaincfg.DM is not read-
+         *     only zero in at least one of the supervisor-level child
+         * domains).
+         */
+        if (aplic->num_children &&
+            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->smsicfgaddr = value;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDRH)) {
+        if (aplic->num_children &&
+            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->smsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
+        }
+    } else if ((APLIC_SETIP_BASE <= addr) &&
+            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIP_BASE) >> 2;
+        riscv_aplic_set_pending_word(aplic, word, value, true);
+    } else if (addr == APLIC_SETIPNUM) {
+        riscv_aplic_set_pending(aplic, value, true);
+    } else if ((APLIC_CLRIP_BASE <= addr) &&
+            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_CLRIP_BASE) >> 2;
+        riscv_aplic_set_pending_word(aplic, word, value, false);
+    } else if (addr == APLIC_CLRIPNUM) {
+        riscv_aplic_set_pending(aplic, value, false);
+    } else if ((APLIC_SETIE_BASE <= addr) &&
+            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIE_BASE) >> 2;
+        riscv_aplic_set_enabled_word(aplic, word, value, true);
+    } else if (addr == APLIC_SETIENUM) {
+        riscv_aplic_set_enabled(aplic, value, true);
+    } else if ((APLIC_CLRIE_BASE <= addr) &&
+            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_CLRIE_BASE) >> 2;
+        riscv_aplic_set_enabled_word(aplic, word, value, false);
+    } else if (addr == APLIC_CLRIENUM) {
+        riscv_aplic_set_enabled(aplic, value, false);
+    } else if (addr == APLIC_SETIPNUM_LE) {
+        riscv_aplic_set_pending(aplic, value, true);
+    } else if (addr == APLIC_SETIPNUM_BE) {
+        riscv_aplic_set_pending(aplic, bswap32(value), true);
+    } else if (addr == APLIC_GENMSI) {
+        if (aplic->msimode) {
+            aplic->genmsi = value & ~(APLIC_TARGET_GUEST_IDX_MASK <<
+                                      APLIC_TARGET_GUEST_IDX_SHIFT);
+            riscv_aplic_msi_send(aplic,
+                                 value >> APLIC_TARGET_HART_IDX_SHIFT,
+                                 0,
+                                 value & APLIC_TARGET_EIID_MASK);
+        }
+    } else if ((APLIC_TARGET_BASE <= addr) &&
+            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
+        if (aplic->msimode) {
+            aplic->target[irq] = value;
+        } else {
+            aplic->target[irq] = (value & ~APLIC_TARGET_IPRIO_MASK) |
+                                 (value & aplic->iprio_mask);
+        }
+    } else if (!aplic->msimode && (APLIC_IDC_BASE <= addr) &&
+            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE))) {
+        idc = (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
+        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
+        case APLIC_IDC_IDELIVERY:
+            aplic->idelivery[idc] = value & 0x1;
+            break;
+        case APLIC_IDC_IFORCE:
+            aplic->iforce[idc] = value & 0x1;
+            break;
+        case APLIC_IDC_ITHRESHOLD:
+            aplic->ithreshold[idc] = value & aplic->iprio_mask;
+            break;
+        default:
+            goto err;
+        };
+    } else {
+        goto err;
+    }
+
+    if (aplic->msimode) {
+        for (irq = 1; irq < aplic->num_irqs; irq++) {
+            riscv_aplic_msi_irq_update(aplic, irq);
+        }
+    } else {
+        if (idc == UINT32_MAX) {
+            for (idc = 0; idc < aplic->num_harts; idc++) {
+                riscv_aplic_idc_update(aplic, idc);
+            }
+        } else {
+            riscv_aplic_idc_update(aplic, idc);
+        }
+    }
+
+    return;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+}
+
+static const MemoryRegionOps riscv_aplic_ops = {
+    .read = riscv_aplic_read,
+    .write = riscv_aplic_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void riscv_aplic_realize(DeviceState *dev, Error **errp)
+{
+    uint32_t i;
+    RISCVAPLICState *aplic = RISCV_APLIC(dev);
+
+    aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
+    aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
+    aplic->state = g_new(uint32_t, aplic->num_irqs);
+    aplic->target = g_new0(uint32_t, aplic->num_irqs);
+    aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
+    aplic->iforce = g_new0(uint32_t, aplic->num_harts);
+    aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
+
+    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
+                          TYPE_RISCV_APLIC, aplic->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+
+    /* Only root APLICs have hardware IRQ lines. All non-root APLICs
+     * have IRQ lines delegated by their parent APLIC.
+     */
+    if (!aplic->parent) {
+        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
+    }
+
+    /* Create output IRQ lines for non-MSI mode */
+    if (!aplic->msimode) {
+        aplic->external_irqs = g_malloc(sizeof(qemu_irq) * aplic->num_harts);
+        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
+
+        /* Claim the CPU interrupt to be triggered by this APLIC */
+        for (i = 0; i < aplic->num_harts; i++) {
+            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
+            if (riscv_cpu_claim_interrupts(cpu,
+                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
+                error_report("%s already claimed",
+                             (aplic->mmode) ? "MEIP" : "SEIP");
+                exit(1);
+            }
+        }
+    }
+
+    msi_nonbroken = true;
+}
+
+static Property riscv_aplic_properties[] = {
+    DEFINE_PROP_UINT32("aperture-size", RISCVAPLICState, aperture_size, 0),
+    DEFINE_PROP_UINT32("hartid-base", RISCVAPLICState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAPLICState, num_harts, 0),
+    DEFINE_PROP_UINT32("iprio-mask", RISCVAPLICState, iprio_mask, 0),
+    DEFINE_PROP_UINT32("num-irqs", RISCVAPLICState, num_irqs, 0),
+    DEFINE_PROP_BOOL("msimode", RISCVAPLICState, msimode, 0),
+    DEFINE_PROP_BOOL("mmode", RISCVAPLICState, mmode, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_riscv_aplic = {
+    .name = "riscv_aplic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_UINT32(domaincfg, RISCVAPLICState),
+            VMSTATE_UINT32(mmsicfgaddr, RISCVAPLICState),
+            VMSTATE_UINT32(mmsicfgaddrH, RISCVAPLICState),
+            VMSTATE_UINT32(smsicfgaddr, RISCVAPLICState),
+            VMSTATE_UINT32(smsicfgaddrH, RISCVAPLICState),
+            VMSTATE_UINT32(genmsi, RISCVAPLICState),
+            VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(state, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(target, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(idelivery, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(iforce, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(ithreshold, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
+static void riscv_aplic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, riscv_aplic_properties);
+    dc->realize = riscv_aplic_realize;
+    dc->vmsd = &vmstate_riscv_aplic;
+}
+
+static const TypeInfo riscv_aplic_info = {
+    .name          = TYPE_RISCV_APLIC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RISCVAPLICState),
+    .class_init    = riscv_aplic_class_init,
+};
+
+static void riscv_aplic_register_types(void)
+{
+    type_register_static(&riscv_aplic_info);
+}
+
+type_init(riscv_aplic_register_types)
+
+/*
+ * Add a APLIC device to another APLIC device as child for
+ * interrupt delegation.
+ */
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
+{
+    RISCVAPLICState *caplic, *paplic;
+
+    assert(parent && child);
+    caplic = RISCV_APLIC(child);
+    paplic = RISCV_APLIC(parent);
+
+    assert(paplic->num_irqs == caplic->num_irqs);
+    assert(paplic->num_children <= QEMU_APLIC_MAX_CHILDREN);
+
+    caplic->parent = paplic;
+    paplic->children[paplic->num_children] = caplic;
+    paplic->num_children++;
+}
+
+/*
+ * Create APLIC device.
+ */
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
+    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
+{
+    DeviceState *dev = qdev_new(TYPE_RISCV_APLIC);
+    uint32_t i;
+
+    assert(num_harts < APLIC_MAX_IDC);
+    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <= size);
+    assert(num_sources < APLIC_MAX_SOURCE);
+    assert(APLIC_MIN_IPRIO_BITS <= iprio_bits);
+    assert(iprio_bits <= APLIC_MAX_IPRIO_BITS);
+
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) - 1));
+    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
+    qdev_prop_set_bit(dev, "msimode", msimode);
+    qdev_prop_set_bit(dev, "mmode", mmode);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (parent) {
+        riscv_aplic_add_child(parent, dev);
+    }
+
+    if (!msimode) {
+        for (i = 0; i < num_harts; i++) {
+            CPUState *cpu = qemu_get_cpu(hartid_base + i);
+
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
+        }
+    }
+
+    return dev;
+}
diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
new file mode 100644
index 0000000000..de8532fbc3
--- /dev/null
+++ b/include/hw/intc/riscv_aplic.h
@@ -0,0 +1,79 @@
+/*
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller) interface
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_APLIC_H
+#define HW_RISCV_APLIC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_APLIC "riscv.aplic"
+
+typedef struct RISCVAPLICState RISCVAPLICState;
+DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, TYPE_RISCV_APLIC)
+
+#define APLIC_MIN_SIZE            0x4000
+#define APLIC_SIZE_ALIGN(__x)     (((__x) + (APLIC_MIN_SIZE - 1)) & \
+                                   ~(APLIC_MIN_SIZE - 1))
+#define APLIC_SIZE(__num_harts)   (APLIC_MIN_SIZE + \
+                                   APLIC_SIZE_ALIGN(32 * (__num_harts)))
+
+struct RISCVAPLICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    qemu_irq *external_irqs;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t bitfield_words;
+    uint32_t domaincfg;
+    uint32_t mmsicfgaddr;
+    uint32_t mmsicfgaddrH;
+    uint32_t smsicfgaddr;
+    uint32_t smsicfgaddrH;
+    uint32_t genmsi;
+    uint32_t *sourcecfg;
+    uint32_t *state;
+    uint32_t *target;
+    uint32_t *idelivery;
+    uint32_t *iforce;
+    uint32_t *ithreshold;
+
+    /* topology */
+#define QEMU_APLIC_MAX_CHILDREN        16
+    struct RISCVAPLICState *parent;
+    struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];
+    uint16_t num_children;
+
+    /* config */
+    uint32_t aperture_size;
+    uint32_t hartid_base;
+    uint32_t num_harts;
+    uint32_t iprio_mask;
+    uint32_t num_irqs;
+    bool msimode;
+    bool mmode;
+};
+
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
+
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
+    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
+
+#endif
-- 
2.25.1


