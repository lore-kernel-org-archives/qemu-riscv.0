Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0KwX-00042U-Bj
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jul 2020 04:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwW-0003zm-18
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:36 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwS-0000q3-MW
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:35 -0400
Received: by mail-pl1-x644.google.com with SMTP id p1so9514001pls.4
 for <qemu-riscv@nongnu.org>; Tue, 28 Jul 2020 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UC0InaM2Av4NdGRB30AcNgGF6NmB2i/F1RQN192G0E0=;
 b=gHmUNT7Z0hYepK/a/IHgsaHkPfHTaZxEsXHq32AMZzjwvJ2IOrH0ATFeylOFqHKfXf
 t9oZqyOR8XMUsKY7DlXMMQZdyZNBWChkncRgeqy+ND71AgYtthjW6vGtt7307l29xoRR
 4c/ih7hQW+DNqJzkIA31xpO1re6Ukrocb0Zp5o2Bu8MSiclpfuh3U2gTQyWI8i62Kobk
 HRqK6VP7uchy14bjAPiQZ/W75IJejkPZJEoIJ/fwi9R6T6Lv564N4qmePGihG/5qatVv
 Q9PLEustxY945RbmoIi5XShbPU6JMpJR48m0joisdfKJPbIRZhHIia27XiZFSFOQp4vD
 NmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UC0InaM2Av4NdGRB30AcNgGF6NmB2i/F1RQN192G0E0=;
 b=WpBIhqz1LL7Qnma4wVfmgK1iYz8U98znroa60GLUc0ykoqHKNC03mGHpbiCrarq+sA
 CgrQU7HqabbkPNcgHqwNbgiNisxizrbh+mhPGAdx9F1aT+j0iVW7fUweWQzvVzY6F0Gc
 dYwCdB9W+mlU4efDwg9JkxB87mFT9/C/LxOSo9DpTVMHX7rfY5u7aKGzg6bPQHxO84K8
 2zI+SGDmrGQgz0Q6lvR9lz8/a3sZCFe6gtIE5+YTE9NutM2KUFVHsCjKi3RRR1uKPeZ+
 4Wy2ZtyIfDJqvyaAPedIetLPaFCpWenZGe5gmKKqfkI/96L0dli5gfU87Kki2LQng654
 8Oug==
X-Gm-Message-State: AOAM530UPXjFVL5gPPY+8BCCFlhhCVVcBkfXu7zCUpxk5qs3GOeMDIPP
 +8WQeTdEqycLRG200qHMh3RgAg==
X-Google-Smtp-Source: ABdhPJw7Wf/PUWOtDu/gHK+DK+I1oe0f4LPcvGnR5zBPgQ9DldM3nWupgVC7g+6FUAXx5nwd4LxPPw==
X-Received: by 2002:a17:90a:ea83:: with SMTP id
 h3mr3524636pjz.176.1595924791246; 
 Tue, 28 Jul 2020 01:26:31 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h2sm17599747pfk.93.2020.07.28.01.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 01:26:30 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v6 4/4] target/riscv: Change the TLB page size depends on PMP
 entries.
Date: Tue, 28 Jul 2020 16:26:17 +0800
Message-Id: <6b0bf48662ef26ab4c15381a08e78a74ebd7ca79.1595924470.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595924470.git.zong.li@sifive.com>
References: <cover.1595924470.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=zong.li@sifive.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jul 2020 08:26:36 -0000

The minimum granularity of PMP is 4 bytes, it is small than 4KB page
size, therefore, the pmp checking would be ignored if its range doesn't
start from the alignment of one page. This patch detects the pmp entries
and sets the small page size to TLB if there is a PMP entry which cover
the page size.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 target/riscv/cpu_helper.c | 10 ++++++--
 target/riscv/pmp.c        | 52 +++++++++++++++++++++++++++++++++++++++
 target/riscv/pmp.h        |  2 ++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f337e418c..fd1d373b6f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -693,6 +693,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     bool first_stage_error = true;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
+    target_ulong tlb_size = 0;
 
     env->guest_phys_fault_addr = 0;
 
@@ -784,8 +785,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (ret == TRANSLATE_SUCCESS) {
-        tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
-                     prot, mmu_idx, TARGET_PAGE_SIZE);
+        if (pmp_is_range_in_tlb(env, pa & TARGET_PAGE_MASK, &tlb_size)) {
+            tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
+                         prot, mmu_idx, tlb_size);
+        } else {
+            tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
+                         prot, mmu_idx, TARGET_PAGE_SIZE);
+        }
         return true;
     } else if (probe) {
         return false;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index aeba796484..adadf6e9ba 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -393,3 +393,55 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
 
     return val;
 }
+
+/*
+ * Calculate the TLB size if the start address or the end address of
+ * PMP entry is presented in thie TLB page.
+ */
+static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
+    target_ulong tlb_sa, target_ulong tlb_ea)
+{
+    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
+    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
+
+    if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
+        return pmp_ea - pmp_sa + 1;
+    }
+
+    if (pmp_sa >= tlb_sa && pmp_sa <= tlb_ea && pmp_ea >= tlb_ea) {
+        return tlb_ea - pmp_sa + 1;
+    }
+
+    if (pmp_ea <= tlb_ea && pmp_ea >= tlb_sa && pmp_sa <= tlb_sa) {
+        return pmp_ea - tlb_sa + 1;
+    }
+
+    return 0;
+}
+
+/*
+ * Check is there a PMP entry whcih range covers this page. If so,
+ * try to find the minimum granularity for the TLB size.
+ */
+bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
+    target_ulong *tlb_size)
+{
+    int i;
+    target_ulong val;
+    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
+
+    for (i = 0; i < MAX_RISCV_PMPS; i++) {
+        val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
+        if (val) {
+            if (*tlb_size == 0 || *tlb_size > val) {
+                *tlb_size = val;
+            }
+        }
+    }
+
+    if (*tlb_size != 0) {
+        return true;
+    }
+
+    return false;
+}
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 8e19793132..c70f2ea4c4 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -60,5 +60,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t priv, target_ulong mode);
+bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
+    target_ulong *tlb_size);
 
 #endif
-- 
2.27.0


