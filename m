Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDpJr-0005n5-6N
	for mharc-qemu-riscv@gnu.org; Sun, 21 Feb 2021 09:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDpJp-0005mQ-6I; Sun, 21 Feb 2021 09:02:41 -0500
Received: from exmail.andestech.com ([60.248.187.195]:10481
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDpJl-00058q-V1; Sun, 21 Feb 2021 09:02:40 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 11LDurVW062705;
 Sun, 21 Feb 2021 21:56:53 +0800 (GMT-8)
 (envelope-from cwshu@andestech.com)
Received: from ubuntu1604.andestech.com (10.0.12.177) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; 
 Sun, 21 Feb 2021 22:02:24 +0800
From: Jim Shu <cwshu@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
CC: Jim Shu <cwshu@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 2/3] target/riscv: add log of PMP permission checking
Date: Sun, 21 Feb 2021 22:01:21 +0800
Message-ID: <1613916082-19528-3-git-send-email-cwshu@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
References: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.177]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 11LDurVW062705
Received-SPF: pass client-ip=60.248.187.195; envelope-from=cwshu@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 21 Feb 2021 14:02:41 -0000

Like MMU translation, add qemu log of PMP permission checking for
debugging.

Signed-off-by: Jim Shu <cwshu@andestech.com>
---
 target/riscv/cpu_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f6ac63bf0e..c1ecb8a710 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -794,6 +794,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             if (ret == TRANSLATE_SUCCESS) {
                 ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
                                                size, access_type, mode);
+
+                qemu_log_mask(CPU_LOG_MMU,
+                              "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                              " %d tlb_size " TARGET_FMT_lu "\n",
+                              __func__, pa, ret, prot_pmp, tlb_size);
+
                 prot &= prot_pmp;
             }
 
@@ -821,6 +827,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         if (ret == TRANSLATE_SUCCESS) {
             ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
                                            size, access_type, mode);
+
+            qemu_log_mask(CPU_LOG_MMU,
+                          "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                          " %d tlb_size " TARGET_FMT_lu "\n",
+                          __func__, pa, ret, prot_pmp, tlb_size);
+
             prot &= prot_pmp;
         }
     }
-- 
2.30.1


