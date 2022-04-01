Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1naI5D-0001I4-Qm
	for mharc-qemu-riscv@gnu.org; Fri, 01 Apr 2022 10:16:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1naGIz-00052x-Te
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:23:05 -0400
Received: from mta01.hs-regensburg.de ([194.95.104.11]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1naGIy-0004qC-Cd
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:23:05 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KVK7l23sFzxvK;
 Fri,  1 Apr 2022 14:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1648815779;
 bh=L9OOR+LsgELV0+rnmajakzDm+GoENflL7WtxnPHV/Go=;
 h=From:To:CC:Subject:Date:From;
 b=Higyc0ci9bkG4QKlTGdNITlUbPoI8nYxYQGKRG0LphRcn6VVHOqIau6ABWUxmo/MD
 AySl0lw9e2ytNEUvUMBzgFgu5mygNrOuG1AUq7PEJsX/0m3BnvLNbHm4nw2dKzUc76
 vFZg+Ant/Enj203IyVVfpWWiXdvsbGUczFO1ntVUKgjQh9Xw7H4SaDTh1fZ4g8tqnb
 6YK6gXH4ZpZjn05F7e13a7NeAoe1l+UTQaeyTdPPgopl8J1cgXcWE2BZwxsl0AsX+7
 rrgDx+2hunhqbxU76nuGoP1l8JluXrAkadaS4UwDm3Gvzxa+ODFWrYbKtmEVBiMwOh
 pkVFjelYPPY1g==
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Apr 2022 14:22:58 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, 
 Stefan Huber <stefan.huber@oth-regensburg.de>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Bin Meng
 <bin.meng@windriver.com>, Konrad Schwarz <konrad.schwarz@siemens.com>
Subject: [PATCH] target/riscv: Fix incorrect PTE merge in walk_pte
Date: Fri, 1 Apr 2022 14:22:48 +0200
Message-ID: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Apr 2022 10:16:55 -0400
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
X-List-Received-Date: Fri, 01 Apr 2022 12:23:08 -0000

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
index 7efb4b62c1..60e3edd0ad 100644
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
@@ -116,13 +117,15 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
                  * contiguous mapped block details.
                  */
                 if ((*last_attr != attr) ||
-                    (*last_paddr + *last_size != paddr)) {
+                    (*last_paddr + *last_size != paddr) ||
+                    (last_start + *last_size != start)) {
                     print_pte(mon, va_bits, *vbase, *pbase,
                               *last_paddr + *last_size - *pbase, *last_attr);
 
                     *vbase = start;
                     *pbase = paddr;
                     *last_attr = attr;
+                    last_start = start;
                 }
 
                 *last_paddr = paddr;
-- 
2.35.1


