Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1niNmx-0003WS-TH
	for mharc-qemu-riscv@gnu.org; Sat, 23 Apr 2022 17:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1niNmv-0003Uo-Ub; Sat, 23 Apr 2022 17:59:34 -0400
Received: from mta02.hs-regensburg.de ([194.95.104.12]:57166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1niNmt-0005Bi-7B; Sat, 23 Apr 2022 17:59:33 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Km4tY6CVMzxyt;
 Sat, 23 Apr 2022 23:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta02-20211122; t=1650751157;
 bh=fwL+0LSi3R14yw+D5NEr6SNX6TFNKy8AHZpYgNWJCu0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=dACR+22jM6IV74GReKBxqi9YtcqLlSSFCfYmXih+l/oQeSM3GzA375/gjYTvxzNrm
 VH/oorbBru28d1hXjplTRu1NWLJHUoiLWh5eJ03euRfGAAmLH9d1pkMym19UjBI66q
 3hWkZMnDhnvbjbYJjJmtvc38y/ORyBLdOvL+gnvNl5TVUEHzHDlRT0wDtoU05n8VbS
 VE33htekVO3SimMd+awPvVsevwk/6DzSCW39RwAPdMJSRATAuvpsYQFs0bhMd2fKdn
 +sZwW1s0oxqA6ZAg6T7vJx9r4f7CMV2JNeAhZovPxd56bXLH/kodlCSmVVT5WMeXM2
 l5x8ZcLP+dQMw==
Received: from atlantis.binary.kitchen (194.95.106.138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 23 Apr 2022 23:59:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>,
 <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, Stefan Huber
 <stefan.huber@oth-regensburg.de>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Richard Henderson
 <richard.henderson@linaro.org>, Konrad Schwarz <konrad.schwarz@siemens.com>
Subject: [PATCH v3] target/riscv: Fix incorrect PTE merge in walk_pte
Date: Sat, 23 Apr 2022 23:59:07 +0200
Message-ID: <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
References: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.12;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta02.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Apr 2022 21:59:34 -0000

Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
case, walk_pte will erroneously merge them.

Enforce the split up, by tracking the virtual base address.

Let's say we have the mapping:
0x81200000 -> 0x89623000 (4K)
0x8120f000 -> 0x89624000 (4K)

Before, walk_pte would have shown:

vaddr            paddr            size             attr
---------------- ---------------- ---------------- -------
0000000081200000 0000000089623000 0000000000002000 rwxu-ad

as it only checks for subsequent paddrs. With this patch, it becomes:

vaddr            paddr            size             attr
---------------- ---------------- ---------------- -------
0000000081200000 0000000089623000 0000000000001000 rwxu-ad
000000008120f000 0000000089624000 0000000000001000 rwxu-ad

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
[since v2: Adjust comment, rebased to latest master]

 target/riscv/monitor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7efb4b62c1..17e63fab00 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
 {
     hwaddr pte_addr;
     hwaddr paddr;
+    target_ulong last_start = -1;
     target_ulong pgsize;
     target_ulong pte;
     int ptshift;
@@ -111,12 +112,13 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
                  * A leaf PTE has been found
                  *
                  * If current PTE's permission bits differ from the last one,
-                 * or current PTE's ppn does not make a contiguous physical
-                 * address block together with the last one, print out the last
-                 * contiguous mapped block details.
+                 * or the current PTE breaks up a contiguous virtual or
+                 * physical mapping, address block together with the last one,
+                 * print out the last contiguous mapped block details.
                  */
                 if ((*last_attr != attr) ||
-                    (*last_paddr + *last_size != paddr)) {
+                    (*last_paddr + *last_size != paddr) ||
+                    (last_start + *last_size != start)) {
                     print_pte(mon, va_bits, *vbase, *pbase,
                               *last_paddr + *last_size - *pbase, *last_attr);
 
@@ -125,6 +127,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
                     *last_attr = attr;
                 }
 
+                last_start = start;
                 *last_paddr = paddr;
                 *last_size = pgsize;
             } else {
-- 
2.36.0


