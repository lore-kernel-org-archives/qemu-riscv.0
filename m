Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsH-0006o1-G1
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsC-0006fK-27
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbs9-0006dH-PE
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbs9-0006cS-Jh
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so206140pfe.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=JV+2iyNmIC6wXTObKInUhRvyMlQRjpkdCPLpU8QWIjg=;
 b=aJnZzhjuARGznFViKS6npfMC3xcnicOlEP3IP1tkrmjUwSCG1vk2/Qg72EW4huPtbd
 puRmfgG/qml1HA7xuHzMNzU/rHRDnnYPKnh2kI/FWpq8PmC5zeTeqEus5O2+8tVEKazL
 b8aKJR+NZ1WgN7iYTLZj4XvU2dyN1KnZ3P0Hd/Qy/XjCIbviDnPlZh7rABAza/dFCWOb
 piWQGQVC+d2lQnrbmsHNmpFgbezQVfz80YCW0Xnyi7KI570uOUgNVdBZ1UvUfrre1uVE
 ylP6JoMcQXtzIX8xoK0pMT1gc/3Q6zzwOZpqoO4iu9afhtCHqxgyWD0/tnlig7d39IPO
 Ezhg==
X-Gm-Message-State: APjAAAVPLzPHBpYd9jLf1zOAXhTi2zIuIvhzCaR2Z18CfSrqkBFjYcBa
 iMwiSuYdhjeOAAolv6CVANrPbglxs6I=
X-Google-Smtp-Source: APXvYqzo95Llspg4/0K9EjN21okjyv/5uQXAxnyFqooFsOIMYSjYt7f0dp1e4j09snJMo+238TWLsA==
X-Received: by 2002:a65:5888:: with SMTP id d8mr4415542pgu.394.1568820480187; 
 Wed, 18 Sep 2019 08:28:00 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m13sm5578307pgn.57.2019.09.18.08.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:59 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:04 -0700
Message-Id: <20190918145640.17349-13-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 12/48] riscv: hmp: Add a command to show virtual
 memory mappings
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:08 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This adds 'info mem' command for RISC-V, to show virtual memory
mappings that aids debugging.

Rather than showing every valid PTE, the command compacts the
output by merging all contiguous physical address mappings into
one block and only shows the merged block mapping details.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hmp-commands-info.hx       |   2 +-
 target/riscv/Makefile.objs |   4 +
 target/riscv/monitor.c     | 229 +++++++++++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/monitor.c

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index c59444c461..257ee7d7a3 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -249,7 +249,7 @@ STEXI
 Show virtual to physical memory mappings.
 ETEXI
 
-#if defined(TARGET_I386)
+#if defined(TARGET_I386) || defined(TARGET_RISCV)
     {
         .name       = "mem",
         .args_type  = "",
diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index b754e4bf32..ff651f69f6 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -1,6 +1,10 @@
 obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o
 obj-$(CONFIG_SOFTMMU) += pmp.o
 
+ifeq ($(CONFIG_SOFTMMU),y)
+obj-y += monitor.o
+endif
+
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
 decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
new file mode 100644
index 0000000000..d725a7a36e
--- /dev/null
+++ b/target/riscv/monitor.c
@@ -0,0 +1,229 @@
+/*
+ * QEMU monitor for RISC-V
+ *
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * RISC-V specific monitor commands implementation
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
+#include "cpu.h"
+#include "cpu_bits.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp-target.h"
+
+#ifdef TARGET_RISCV64
+#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
+                                "size             attr\n"
+#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
+                                "---------------- -------\n"
+#else
+#define PTE_HEADER_FIELDS       "vaddr    paddr            size     attr\n"
+#define PTE_HEADER_DELIMITER    "-------- ---------------- -------- -------\n"
+#endif
+
+/* Perform linear address sign extension */
+static target_ulong addr_canonical(int va_bits, target_ulong addr)
+{
+#ifdef TARGET_RISCV64
+    if (addr & (1UL << (va_bits - 1))) {
+        addr |= (hwaddr)-(1L << va_bits);
+    }
+#endif
+
+    return addr;
+}
+
+static void print_pte_header(Monitor *mon)
+{
+    monitor_printf(mon, PTE_HEADER_FIELDS);
+    monitor_printf(mon, PTE_HEADER_DELIMITER);
+}
+
+static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
+                      hwaddr paddr, target_ulong size, int attr)
+{
+    /* santity check on vaddr */
+    if (vaddr >= (1UL << va_bits)) {
+        return;
+    }
+
+    if (!size) {
+        return;
+    }
+
+    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
+                   " %c%c%c%c%c%c%c\n",
+                   addr_canonical(va_bits, vaddr),
+                   paddr, size,
+                   attr & PTE_R ? 'r' : '-',
+                   attr & PTE_W ? 'w' : '-',
+                   attr & PTE_X ? 'x' : '-',
+                   attr & PTE_U ? 'u' : '-',
+                   attr & PTE_G ? 'g' : '-',
+                   attr & PTE_A ? 'a' : '-',
+                   attr & PTE_D ? 'd' : '-');
+}
+
+static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
+                     int level, int ptidxbits, int ptesize, int va_bits,
+                     target_ulong *vbase, hwaddr *pbase, hwaddr *last_paddr,
+                     target_ulong *last_size, int *last_attr)
+{
+    hwaddr pte_addr;
+    hwaddr paddr;
+    target_ulong pgsize;
+    target_ulong pte;
+    int ptshift;
+    int attr;
+    int idx;
+
+    if (level < 0) {
+        return;
+    }
+
+    ptshift = level * ptidxbits;
+    pgsize = 1UL << (PGSHIFT + ptshift);
+
+    for (idx = 0; idx < (1UL << ptidxbits); idx++) {
+        pte_addr = base + idx * ptesize;
+        cpu_physical_memory_read(pte_addr, &pte, ptesize);
+
+        paddr = (hwaddr)(pte >> PTE_PPN_SHIFT) << PGSHIFT;
+        attr = pte & 0xff;
+
+        /* PTE has to be valid */
+        if (attr & PTE_V) {
+            if (attr & (PTE_R | PTE_W | PTE_X)) {
+                /*
+                 * A leaf PTE has been found
+                 *
+                 * If current PTE's permission bits differ from the last one,
+                 * or current PTE's ppn does not make a contiguous physical
+                 * address block together with the last one, print out the last
+                 * contiguous mapped block details.
+                 */
+                if ((*last_attr != attr) ||
+                    (*last_paddr + *last_size != paddr)) {
+                    print_pte(mon, va_bits, *vbase, *pbase,
+                              *last_paddr + *last_size - *pbase, *last_attr);
+
+                    *vbase = start;
+                    *pbase = paddr;
+                    *last_attr = attr;
+                }
+
+                *last_paddr = paddr;
+                *last_size = pgsize;
+            } else {
+                /* pointer to the next level of the page table */
+                walk_pte(mon, paddr, start, level - 1, ptidxbits, ptesize,
+                         va_bits, vbase, pbase, last_paddr,
+                         last_size, last_attr);
+            }
+        }
+
+        start += pgsize;
+    }
+
+}
+
+static void mem_info_svxx(Monitor *mon, CPUArchState *env)
+{
+    int levels, ptidxbits, ptesize, vm, va_bits;
+    hwaddr base;
+    target_ulong vbase;
+    hwaddr pbase;
+    hwaddr last_paddr;
+    target_ulong last_size;
+    int last_attr;
+
+    base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
+
+    vm = get_field(env->satp, SATP_MODE);
+    switch (vm) {
+    case VM_1_10_SV32:
+        levels = 2;
+        ptidxbits = 10;
+        ptesize = 4;
+        break;
+    case VM_1_10_SV39:
+        levels = 3;
+        ptidxbits = 9;
+        ptesize = 8;
+        break;
+    case VM_1_10_SV48:
+        levels = 4;
+        ptidxbits = 9;
+        ptesize = 8;
+        break;
+    case VM_1_10_SV57:
+        levels = 5;
+        ptidxbits = 9;
+        ptesize = 8;
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+
+    /* calculate virtual address bits */
+    va_bits = PGSHIFT + levels * ptidxbits;
+
+    /* print header */
+    print_pte_header(mon);
+
+    vbase = -1;
+    pbase = -1;
+    last_paddr = -1;
+    last_size = 0;
+    last_attr = 0;
+
+    /* walk page tables, starting from address 0 */
+    walk_pte(mon, base, 0, levels - 1, ptidxbits, ptesize, va_bits,
+             &vbase, &pbase, &last_paddr, &last_size, &last_attr);
+
+    /* don't forget the last one */
+    print_pte(mon, va_bits, vbase, pbase,
+              last_paddr + last_size - pbase, last_attr);
+}
+
+void hmp_info_mem(Monitor *mon, const QDict *qdict)
+{
+    CPUArchState *env;
+
+    env = mon_get_cpu_env();
+    if (!env) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        monitor_printf(mon, "S-mode MMU unavailable\n");
+        return;
+    }
+
+    if (env->priv_ver < PRIV_VERSION_1_10_0) {
+        monitor_printf(mon, "Privileged mode < 1.10 unsupported\n");
+        return;
+    }
+
+    if (!(env->satp & SATP_MODE)) {
+        monitor_printf(mon, "No translation or protection\n");
+        return;
+    }
+
+    mem_info_svxx(mon, env);
+}
-- 
2.21.0


