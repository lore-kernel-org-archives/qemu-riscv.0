Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg3ET-0007LP-J3
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3EN-00075E-F5
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:42:48 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3EI-0000I4-E8
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:42:45 -0400
Received: by mail-il1-x12c.google.com with SMTP id u8so2274278ilb.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679748161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWmme+fxH4a6wPZVVNKR2HtNDEn7qkz5eBGWEW59Xpg=;
 b=fni6JszZk1kurOP/G+N6QXNeqkqoo9neRKes9jcpJVkWSPo9qq/8GUOGRIcoiL7Ity
 ieA8YJ/VzrvXegrWZycuTxkthMhOQXWYMpXE3wJfpKKyGuE0iRUms/JeWBf+VtJLQSob
 9GggmAF8sndHJBbx59kjWtbyn9a2py84yhJhBAeVeuW4trvCZ2+PLBuk1QTG+ey8asjC
 bQmIJQB5s0tbqfK2HrzOmtLLoPktBFz0mmv0w2liM4iznn8B3BaTDqVQtCF9fZPsUiqj
 ZNAiJXPL3Bv40Ug5iwnFlYCB5kNnXeKy7PPBdWMkV+ZhmoQJIaUIPrK+JeR01yLAyQR3
 FBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679748161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWmme+fxH4a6wPZVVNKR2HtNDEn7qkz5eBGWEW59Xpg=;
 b=JlSyOmFNmYxuNTRZrziA9OIPkObAfmE4S5QuC1vQF/4/jE8oU8xSfAuvHqz8WjtupR
 TQqU4fBw92IVmOspQirXzmxdEhJQj580SmnbFRDk/gzKDoeG1vQNN4pBjaFylpxN/iPZ
 9ub38aRdgw8f3CGSol6/pvaP1G8p+0noHSG+iEOl2+bGcUljzu9BewitTVw7wHQYCi4r
 9bRmo2D24XW0Xf2Iwhx8jVoFB2QK/L8tVbuYTbFwbE79zbSflvQDMtoI3Em8qHs5Qojr
 Ft9CTlrh7L97HZICo+dLWxgJ5/+4blCFieSJSUmCQlJm6ylIYPmnhTuZLQbEOe+Ojgw1
 3vIg==
X-Gm-Message-State: AAQBX9dVD2E1rrnMwiYrYc3cdJfRAmt2sgfu0atBi0atp/9/WXG4QCo4
 KbcISksa9TrVZ88lKbo2HxcIJvCHvYcC0LsSM3s=
X-Google-Smtp-Source: AKy350ac3anxrKNQa2xHTKiWK/XRj+qje8wZgYkl1j47bz+LLKvQ3z3yNVkNTU8p0q43d1jp+oHWhA==
X-Received: by 2002:a17:90a:2d6:b0:234:5d3c:b02b with SMTP id
 d22-20020a17090a02d600b002345d3cb02bmr5666391pjd.42.1679741691917; 
 Sat, 25 Mar 2023 03:54:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 24/25] target/riscv: Reorg access check in
 get_physical_address
Date: Sat, 25 Mar 2023 03:54:28 -0700
Message-Id: <20230325105429.1142530-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 12:42:51 -0000

We were effectively computing the protection bits twice,
once while performing access checks and once while returning
the valid bits to the caller.  Reorg so we do this once.

Move the computation of mxr close to its single use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 69 ++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 82a7c5f9dd..725ca45106 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -762,7 +762,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
-                                int *prot, target_ulong addr,
+                                int *ret_prot, target_ulong addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
@@ -793,20 +793,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
 
-    *prot = 0;
+    *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
-
-    if (first_stage == true) {
-        mxr = get_field(env->mstatus, MSTATUS_MXR);
-    } else {
-        mxr = get_field(env->vsstatus, MSTATUS_MXR);
-    }
+    int levels, ptidxbits, ptesize, vm, sum, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -849,7 +843,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
       levels = 5; ptidxbits = 9; ptesize = 8; break;
     case VM_1_10_MBARE:
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     default:
       g_assert_not_reached();
@@ -984,6 +978,27 @@ restart:
         return TRANSLATE_FAIL;
     }
 
+    int prot = 0;
+    if (pte & PTE_R) {
+        prot |= PAGE_READ;
+    }
+    if (pte & PTE_W) {
+        prot |= PAGE_WRITE;
+    }
+    if (pte & PTE_X) {
+        bool mxr;
+
+        if (first_stage == true) {
+            mxr = get_field(env->mstatus, MSTATUS_MXR);
+        } else {
+            mxr = get_field(env->vsstatus, MSTATUS_MXR);
+        }
+        if (mxr) {
+            prot |= PAGE_READ;
+        }
+        prot |= PAGE_EXEC;
+    }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
@@ -996,17 +1011,9 @@ restart:
         /* Supervisor PTE flags when not S mode */
         return TRANSLATE_FAIL;
     }
-    if (access_type == MMU_DATA_LOAD &&
-        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
-        /* Read access check failed */
-        return TRANSLATE_FAIL;
-    }
-    if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
-        /* Write access check failed */
-        return TRANSLATE_FAIL;
-    }
-    if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
-        /* Fetch access check failed */
+
+    if (!((prot >> access_type) & 1)) {
+        /* Access check failed */
         return TRANSLATE_FAIL;
     }
 
@@ -1071,20 +1078,16 @@ restart:
                   (vpn & (((target_ulong)1 << ptshift) - 1))
                  ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
-    /* set permissions on the TLB entry */
-    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-        *prot |= PAGE_READ;
-    }
-    if (pte & PTE_X) {
-        *prot |= PAGE_EXEC;
-    }
     /*
-     * Add write permission on stores or if the page is already dirty,
-     * so that we TLB miss on later writes to update the dirty bit.
+     * Remove write permission unless this is a store, or the page is
+     * already dirty, so that we TLB miss on later writes to update
+     * the dirty bit.
      */
-    if ((pte & PTE_W) && (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
-        *prot |= PAGE_WRITE;
+    if (access_type != MMU_DATA_STORE && !(pte & PTE_D)) {
+        prot &= ~PAGE_WRITE;
     }
+    *ret_prot = prot;
+
     return TRANSLATE_SUCCESS;
 }
 
-- 
2.34.1


