Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nbQb4-0008GM-1a
	for mharc-qemu-riscv@gnu.org; Mon, 04 Apr 2022 13:34:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nbQb2-0008G6-Ip; Mon, 04 Apr 2022 13:34:32 -0400
Received: from [2001:638:a01:1096::11] (port=35524 helo=mta01.hs-regensburg.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nbQb0-00006W-5v; Mon, 04 Apr 2022 13:34:31 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KXHvk6TGyzxvY;
 Mon,  4 Apr 2022 19:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1649093666;
 bh=R3IL596ZtbFJ4AvvtJ1IiJnmf8wi0Lw/CuNypTGUNgM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=lqipmPh4WOBme/uE/gAKJkfcU9LDwwW4m2XWmc+JzvV6K1sjSqqZGcwzLHEXLUrkx
 25YlIVmpa4gkqyGvviIKst0Td5hqGjvkqrlN2SCuybaGavPkHkgDDivMvJQUdq5kD3
 fAAbi50QOS+lSHKrMFzfKJxyHxpHHuM4nBk8B3BwGdBMsUP+f572TM385xvrZsh5an
 bExIOdidkmFDttD6zo80jcyWKB45rQJM+N6MbvsUYLJm5qe92Yf0nt6SiWRKPGeVye
 V6yBCqmpDgooMDQZBSoLJ4hRSKS3J8GOxlY3VzXT8BRYIb5L/GWpnmpX0ueTuZ583Q
 XiA4sl7l4Ifug==
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 19:34:26 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, 
 Stefan Huber <stefan.huber@oth-regensburg.de>, Richard Henderson
 <richard.henderson@linaro.org>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Bin Meng
 <bin.meng@windriver.com>, Konrad Schwarz <konrad.schwarz@siemens.com>
Subject: [PATCH v2] target/riscv: Fix incorrect PTE merge in walk_pte
Date: Mon, 4 Apr 2022 19:34:17 +0200
Message-ID: <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:638:a01:1096::11
 (failed)
Received-SPF: pass client-ip=2001:638:a01:1096::11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 04 Apr 2022 17:34:32 -0000

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
 target/riscv/monitor.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7efb4b62c1..9dc4cb1156 100644
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
@@ -116,7 +117,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
                  * contiguous mapped block details.
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
2.35.1


