Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jzLiG-00030C-C6
	for mharc-qemu-riscv@gnu.org; Sat, 25 Jul 2020 11:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLiE-0002vw-8r
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:03:46 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLiB-00089N-4p
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:03:45 -0400
Received: by mail-pf1-x444.google.com with SMTP id t11so6794800pfq.11
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2020 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InaCMlegJaWsB2fv1wyQxNhfO4TjO2lCW/QNWh+yG2U=;
 b=LXT6QVPWEo9uD29dV7Jfx9rKLwckDM8clpnN8hphx97+ISnrES+UVOzLGCV6CzK3tK
 gT1Yw31LzH76OlXkUwyLsNnYl8b0k5zGjtb/CoT/i58lgUxSuj5I2M98MhQx1DUbl+dV
 iNmcusddOC+fm6fU9PrmU0/FpC7mysm6uKFh71h+CBixpiFPSxVGP+kQv+orWL6hmf2y
 jpVWkprbcp3gEOZxy2RYdnBWjvFtIbG9QfinEajzfxv7gFgVf41wUtFXvndonQEDcuRd
 NX3QppqD2Qc2kF1DNJVnTmiiIW4ntdo06UqDxZ3wGgtLekOCmggE0ozMJMTGRyHhfXya
 lK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InaCMlegJaWsB2fv1wyQxNhfO4TjO2lCW/QNWh+yG2U=;
 b=AGwIT/t1JOtOra4M1QefQtZZMR5XyxjDuttAmQJ5EfAa+VftJUdJAFJO6tBUsyeYhX
 V2HWBqpIPq1RcZT5HhFtQs/wHJgeQZUt7UxAWv9BNif/JbRsHB6AFet/I6GjCLtosbEk
 BsvrQrNrsE+N9ysASfqAR+mvpd0cJqL0kjICu/2UYk6vlhYY+hGtjUzJr/8pzk+AAjJK
 rMuHQR588LQkzU91zQahJXP9rvMWN4xYAjvmMPHtfFs0mAa+DEKNUxYtCSn/cmdiv8o6
 OwpcgnFtrAtUZ6YuwRQ5BVeQqrkNM/KvxXDnVWLoiUtg+wfXD3AWMZIXFf27j578wPgM
 ZSlw==
X-Gm-Message-State: AOAM530xBb8vK/s8xLEfPQo/44UgLuV2m0uSdY4kcFhZZ/ifiuUZCfrY
 q3Z5Jo4PfW9FFahNe9sz4e16RQ==
X-Google-Smtp-Source: ABdhPJz6z00QVfRK1pZ9pBxWqxCmu36sjVK0t6Qy1kFJ7mOAEhzQgw/CvYWQ9EH0t4VF/vhUko384w==
X-Received: by 2002:aa7:9a03:: with SMTP id w3mr12976992pfj.228.1595689421643; 
 Sat, 25 Jul 2020 08:03:41 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id g22sm9059783pgb.82.2020.07.25.08.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 08:03:41 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 4/4] target/riscv: Change the TLB page size depends on PMP
 entries.
Date: Sat, 25 Jul 2020 23:03:27 +0800
Message-Id: <3b5c4ba2f6ea6fe0a40edd41b02b3d22db2de639.1595689201.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595689201.git.zong.li@sifive.com>
References: <cover.1595689201.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x444.google.com
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
X-List-Received-Date: Sat, 25 Jul 2020 15:03:46 -0000

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
index 08b069f0c9..b3013bc91e 100644
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


