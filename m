Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jytgw-0003Ca-WD
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 05:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgv-00038w-Cn
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:33 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgt-0003sh-3K
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:33 -0400
Received: by mail-pf1-x444.google.com with SMTP id a24so4731074pfc.10
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2020 02:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pc71QwKUTxcdbbb2mF5Hfr3ZbnXpr9ERBcMcGfZrI00=;
 b=MX87ge4yURs1x2t1f/TigdUPhHB7zTe3UYnWD/41nbnxwjYposVkmVN/kHLKDXbW2P
 ZC0H5oNIj0DxeWIsytaoyrPe9k8/J0FfVJUgjDZa+NOdO5KwgNU32BsODRfowBIw3ogJ
 Hs0lfcAU7rlCYy9c3Slw9rldES32TdCHZ/mQ46IzKu4Tss3k91WWwt1kH75TmRo/+FHC
 bK16Ixc+AHt4YageiaWueQSVf2WsRne0gzISSkacCQuCvxMe5u1i3ZxxtnVEdc51PkSC
 txhKUW78+0Q54WGP8lkA1MOmj3GdkxDkqUMraaaetUGwIPeb+uIyH0wh9gKREmlC8OWj
 AISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pc71QwKUTxcdbbb2mF5Hfr3ZbnXpr9ERBcMcGfZrI00=;
 b=g+Ro8elrl+y6AIXQ8gwUwutYMK0tTtW2KDFRfadUJeJ1TNCZmfaNr6hLV9pOEm6G0Y
 t2TFuzVPBqALv7iSMdJ+NQIk+Jr/PQf+CkB2+/vN7Zdlb8Pp4nMsMc+CH/8RB/qXOLtz
 TPel4r16XBWkRZoMfZbceC+F99ohXGJPd3nu9XyUR4RijfMDJjx+3/gIi8SFRmwmvhEj
 d5CyyH1TgTZmYpI53QtY2N1oI2J2fQqvFd0CxWojmskwEWKMAJzLqjfb348dbelojxGa
 SjUpBY3LYVz/nV+s6XAk0kjpJWCrbBchwHhldBDV+ifX0xC+eGcLHSBeKeJPLDhJjYVL
 s+9w==
X-Gm-Message-State: AOAM533J30KiWtBwg0CmNkpUDjIDemM6bId1b81g8BA9AMPGxcTR5BQx
 6A3YP666T5kBlwPxmfqz0tNAWg==
X-Google-Smtp-Source: ABdhPJzE76Ie2N+kBXXB4nvSEW7/ZTwW4Gl7KZgvf5uDi1tJV5dVrc/8mhYPbyDH+tb8ze/eCZNzaQ==
X-Received: by 2002:a62:b409:: with SMTP id h9mr7806369pfn.305.1595581709859; 
 Fri, 24 Jul 2020 02:08:29 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id z10sm5751282pfr.90.2020.07.24.02.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:08:29 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 4/4] target/riscv: Change the TLB page size depends on PMP
 entries.
Date: Fri, 24 Jul 2020 17:08:17 +0800
Message-Id: <f9d7936d8d1903b67a91a1dadf12a6ddf61fa108.1595581140.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595581140.git.zong.li@sifive.com>
References: <cover.1595581140.git.zong.li@sifive.com>
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
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jul 2020 09:08:33 -0000

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
index e0161d6aab..a040cdd285 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -392,3 +392,55 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
 
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


