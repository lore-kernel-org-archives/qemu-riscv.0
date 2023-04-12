Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtl-0006bo-2V
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtI-0004xY-O5
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtG-0002OM-3s
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id s12so2104672wrb.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299833; x=1683891833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wya4UWrfM6HlFM9BlBmRDPTvoeLhiO0tJTDNDDUjUY=;
 b=iW8EY7N3pHi4bOxiGnuzivpg4mm4O1zwdElQMn393nM1ciyctixacvZmaBO0XdTcz0
 Ti4EG3ndAmPaQvOVOzM8ErLqm+7bsPef519uwcuXqRiWHfBdkcsW+M8/pfbOHfqYfUwj
 byZ9GUa9yt4ftR2KANRmnJWVrDObQpvOoLjns4qdZGsugll0yPCcKz/TvY6EoPUOL+RL
 LS+dxiVjqmWLxCpEQ6DbUwdd0aB6WuloZO8Nxd5f9V3Lh9obBArPHWlzcskKUn+ys4gG
 xbIq0KsgGOjgr/5znjgDfEydQEWliK4pFZCpZG+sE+lMt2d7mfhYIWivHM8bu0Jy4C/O
 sb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299833; x=1683891833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wya4UWrfM6HlFM9BlBmRDPTvoeLhiO0tJTDNDDUjUY=;
 b=SHcCHkgV9L6NXuLn9t4m1lsARZreLT0KjHeAmb/QL7WR9U94x+JOfoPBDlwe0SOMWw
 E6VCYhXiMZIBfmBDt0lNRh2DEHT29Wc9Ij1yhBH0ts8pWrc6IvebNnQF9qo8TIvCninD
 o91iLrFbWk3SP0RQp/yRU9Pf92mIjUYqydtApcJS+xTrxTOJfWBTCLwEsw28RryCWFoa
 kPYSQssJxeBo6kZNRoH59PO57JE4oMNwcZ9QGTEt2S33xAnRaGprfYAYJ4VIZtwPsp3c
 tS0fn/lRRJJc7QWiDtOxZJTdV4u6mSsADPUBiVe17HmN9fAZMhtWy4jnLENFXdL1A/vZ
 gdfw==
X-Gm-Message-State: AAQBX9eXGYNt+qtER5mJZJOXmgrMiCXprCexeoxyVvciq4dAqkFaiPDn
 09SFmjs5WzTJTmeBS4+Fbtvlmt3XkmxQDb7VytmZZdpM
X-Google-Smtp-Source: AKy350YfmfJkX+7nPPral9DpjjGMI42X10YB35PBSy8dXyeXF446du4PBWjYscmzt40YELCopVxynA==
X-Received: by 2002:adf:f20b:0:b0:2d1:e517:4992 with SMTP id
 p11-20020adff20b000000b002d1e5174992mr4008816wro.69.1681299833415; 
 Wed, 12 Apr 2023 04:43:53 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 20/25] target/riscv: Move leaf pte processing out of level
 loop
Date: Wed, 12 Apr 2023 13:43:28 +0200
Message-Id: <20230412114333.118895-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:57 -0000

Move the code that never loops outside of the loop.
Unchain the if-return-else statements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-21-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 238 ++++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 113 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7c9f89d4d3..c2d083f029 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -865,6 +865,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
+    target_ulong pte;
+    hwaddr pte_addr;
     int i;
 
 #if !TCG_OVERSIZED_GUEST
@@ -881,7 +883,6 @@ restart:
         }
 
         /* check that physical address of PTE is legal */
-        hwaddr pte_addr;
 
         if (two_stage && first_stage) {
             int vbase_prot;
@@ -913,7 +914,6 @@ restart:
             return TRANSLATE_PMP_FAIL;
         }
 
-        target_ulong pte;
         if (riscv_cpu_mxl(env) == MXL_RV32) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
@@ -938,128 +938,140 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
-        } else if (!pbmte && (pte & PTE_PBMT)) {
+        }
+        if (pte & (PTE_R | PTE_W | PTE_X)) {
+            goto leaf;
+        }
+
+        /* Inner PTE, continue walking */
+        if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
             return TRANSLATE_FAIL;
-        } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
-            /* Inner PTE, continue walking */
-            if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
-                return TRANSLATE_FAIL;
-            }
-            base = ppn << PGSHIFT;
-        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-            /* Reserved leaf PTE flags: PTE_W */
-            return TRANSLATE_FAIL;
-        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-            /* Reserved leaf PTE flags: PTE_W + PTE_X */
-            return TRANSLATE_FAIL;
-        } else if ((pte & PTE_U) && ((mode != PRV_U) &&
-                   (!sum || access_type == MMU_INST_FETCH))) {
-            /* User PTE flags when not U mode and mstatus.SUM is not set,
-               or the access type is an instruction fetch */
-            return TRANSLATE_FAIL;
-        } else if (!(pte & PTE_U) && (mode != PRV_S)) {
-            /* Supervisor PTE flags when not S mode */
-            return TRANSLATE_FAIL;
-        } else if (ppn & ((1ULL << ptshift) - 1)) {
-            /* Misaligned PPN */
-            return TRANSLATE_FAIL;
-        } else if (access_type == MMU_DATA_LOAD && !((pte & PTE_R) ||
-                   ((pte & PTE_X) && mxr))) {
-            /* Read access check failed */
-            return TRANSLATE_FAIL;
-        } else if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
-            /* Write access check failed */
-            return TRANSLATE_FAIL;
-        } else if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
-            /* Fetch access check failed */
-            return TRANSLATE_FAIL;
-        } else {
-            /* if necessary, set accessed and dirty bits. */
-            target_ulong updated_pte = pte | PTE_A |
+        }
+        base = ppn << PGSHIFT;
+    }
+
+    /* No leaf pte at any translation level. */
+    return TRANSLATE_FAIL;
+
+ leaf:
+    if (ppn & ((1ULL << ptshift) - 1)) {
+        /* Misaligned PPN */
+        return TRANSLATE_FAIL;
+    }
+    if (!pbmte && (pte & PTE_PBMT)) {
+        /* Reserved without Svpbmt. */
+        return TRANSLATE_FAIL;
+    }
+    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
+        /* Reserved leaf PTE flags: PTE_W */
+        return TRANSLATE_FAIL;
+    }
+    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
+        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+        return TRANSLATE_FAIL;
+    }
+    if ((pte & PTE_U) &&
+        ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
+        /*
+         * User PTE flags when not U mode and mstatus.SUM is not set,
+         * or the access type is an instruction fetch.
+         */
+        return TRANSLATE_FAIL;
+    }
+    if (!(pte & PTE_U) && (mode != PRV_S)) {
+        /* Supervisor PTE flags when not S mode */
+        return TRANSLATE_FAIL;
+    }
+    if (access_type == MMU_DATA_LOAD &&
+        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
+        /* Read access check failed */
+        return TRANSLATE_FAIL;
+    }
+    if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
+        /* Write access check failed */
+        return TRANSLATE_FAIL;
+    }
+    if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
+        /* Fetch access check failed */
+        return TRANSLATE_FAIL;
+    }
+
+    /* If necessary, set accessed and dirty bits. */
+    target_ulong updated_pte = pte | PTE_A |
                 (access_type == MMU_DATA_STORE ? PTE_D : 0);
 
-            /* Page table updates need to be atomic with MTTCG enabled */
-            if (updated_pte != pte) {
-                if (!hade) {
-                    return TRANSLATE_FAIL;
-                }
+    /* Page table updates need to be atomic with MTTCG enabled */
+    if (updated_pte != pte) {
+        if (!hade) {
+            return TRANSLATE_FAIL;
+        }
 
-                /*
-                 * - if accessed or dirty bits need updating, and the PTE is
-                 *   in RAM, then we do so atomically with a compare and swap.
-                 * - if the PTE is in IO space or ROM, then it can't be updated
-                 *   and we return TRANSLATE_FAIL.
-                 * - if the PTE changed by the time we went to update it, then
-                 *   it is no longer valid and we must re-walk the page table.
-                 */
-                MemoryRegion *mr;
-                hwaddr l = sizeof(target_ulong), addr1;
-                mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
-                                             false, MEMTXATTRS_UNSPECIFIED);
-                if (memory_region_is_ram(mr)) {
-                    target_ulong *pte_pa =
-                        qemu_map_ram_ptr(mr->ram_block, addr1);
+        /*
+         * - if accessed or dirty bits need updating, and the PTE is
+         *   in RAM, then we do so atomically with a compare and swap.
+         * - if the PTE is in IO space or ROM, then it can't be updated
+         *   and we return TRANSLATE_FAIL.
+         * - if the PTE changed by the time we went to update it, then
+         *   it is no longer valid and we must re-walk the page table.
+         */
+        MemoryRegion *mr;
+        hwaddr l = sizeof(target_ulong), addr1;
+        mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
+                                     false, MEMTXATTRS_UNSPECIFIED);
+        if (memory_region_is_ram(mr)) {
+            target_ulong *pte_pa = qemu_map_ram_ptr(mr->ram_block, addr1);
 #if TCG_OVERSIZED_GUEST
-                    /*
-                     * MTTCG is not enabled on oversized TCG guests so
-                     * page table updates do not need to be atomic
-                     */
-                    *pte_pa = pte = updated_pte;
+            /*
+             * MTTCG is not enabled on oversized TCG guests so
+             * page table updates do not need to be atomic
+             */
+            *pte_pa = pte = updated_pte;
 #else
-                    target_ulong old_pte =
-                        qatomic_cmpxchg(pte_pa, pte, updated_pte);
-                    if (old_pte != pte) {
-                        goto restart;
-                    } else {
-                        pte = updated_pte;
-                    }
+            target_ulong old_pte = qatomic_cmpxchg(pte_pa, pte, updated_pte);
+            if (old_pte != pte) {
+                goto restart;
+            }
+            pte = updated_pte;
 #endif
-                } else {
-                    /*
-                     * misconfigured PTE in ROM (AD bits are not preset) or
-                     * PTE is in IO space and can't be updated atomically
-                     */
-                    return TRANSLATE_FAIL;
-                }
-            }
-
+        } else {
             /*
-             * for superpage mappings, make a fake leaf PTE for the TLB's
-             * benefit.
+             * Misconfigured PTE in ROM (AD bits are not preset) or
+             * PTE is in IO space and can't be updated atomically.
              */
-            target_ulong vpn = addr >> PGSHIFT;
-
-            if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
-                napot_bits = ctzl(ppn) + 1;
-                if ((i != (levels - 1)) || (napot_bits != 4)) {
-                    return TRANSLATE_FAIL;
-                }
-            }
-
-            napot_mask = (1 << napot_bits) - 1;
-            *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
-                          (vpn & (((target_ulong)1 << ptshift) - 1))
-                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
-
-            /* set permissions on the TLB entry */
-            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-                *prot |= PAGE_READ;
-            }
-            if (pte & PTE_X) {
-                *prot |= PAGE_EXEC;
-            }
-            /*
-             * add write permission on stores or if the page is already dirty,
-             * so that we TLB miss on later writes to update the dirty bit
-             */
-            if ((pte & PTE_W) &&
-                (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
-                *prot |= PAGE_WRITE;
-            }
-            return TRANSLATE_SUCCESS;
+            return TRANSLATE_FAIL;
         }
     }
-    return TRANSLATE_FAIL;
+
+    /* For superpage mappings, make a fake leaf PTE for the TLB's benefit. */
+    target_ulong vpn = addr >> PGSHIFT;
+
+    if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
+        napot_bits = ctzl(ppn) + 1;
+        if ((i != (levels - 1)) || (napot_bits != 4)) {
+            return TRANSLATE_FAIL;
+        }
+    }
+
+    napot_mask = (1 << napot_bits) - 1;
+    *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
+                  (vpn & (((target_ulong)1 << ptshift) - 1))
+                 ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
+
+    /* set permissions on the TLB entry */
+    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
+        *prot |= PAGE_READ;
+    }
+    if (pte & PTE_X) {
+        *prot |= PAGE_EXEC;
+    }
+    /*
+     * Add write permission on stores or if the page is already dirty,
+     * so that we TLB miss on later writes to update the dirty bit.
+     */
+    if ((pte & PTE_W) && (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
+        *prot |= PAGE_WRITE;
+    }
+    return TRANSLATE_SUCCESS;
 }
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
-- 
2.34.1


