Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYto-00071g-If
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtO-00056I-AC
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:44:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtK-0002W5-Rh
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:44:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id e22so10488041wra.6
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299837; x=1683891837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8HoEQ5oqUBzgSiPkg41KaPcHxMWLCXEpmxQRlUQgmQ=;
 b=nJzOtn/+ToFW+ybfxz8jOABM1E3vPQ8vyaeAoTbeRgrWMCEhinWPmUJNMK+tdZbeWZ
 Wq2WD8dWA/QCd1r/dsSZtbKlj8b4WBBZIdaHmm+Q0C1+Ud+nwzuzjj315NCyhoWOXAtl
 QUFi6Rs/Rt6pB56atBvvG76E9LWLbRSvz4tL6ZG9rJOf4hdWaIvoiNbM5MrDRmwAYsDj
 DUhygJWmP3MPUkOYyA0FgAHGw1g6OMH/QYrlYlzRzB2pScY7IpdSN/X2ZR0NWbs4AHXp
 rJhRx+4b00O118umgVvsMOWmY25p/CLB2CD7JuYOX/saT4o5O9T+ozvKN/9zDpAXyaDv
 WqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299837; x=1683891837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8HoEQ5oqUBzgSiPkg41KaPcHxMWLCXEpmxQRlUQgmQ=;
 b=8MtlH19K6KOLz97jm1HvTKJpl7E2XvVYybYg8EVXYQHx5+10O5VA/Mpt3xn5+zxlIU
 6MmCPP8FIqz7Q0BMLriYNMrPuYCeh9TZvJlhrMX4JKQzF1e3a7mIeD8dihpm06krxxMs
 EJK34u0P4Lr8Aqj33w4/KwTpJmB6QCsdYtzXPvXti9NRC1pUFzmrQe4flbDWHWpt3/Bs
 NE+lR3ne+im4RB2eggcXv22ZQ253SC0lGELVySaflejVaUGKEs0Lq5PkE/v4XrFGD8gk
 rqx3qVuEKbXeJFLFgEQ3RJ8Q19amQOvQVfWwyLErmxRy0O4GSe3UupU2VfrJivum7I4D
 t/HA==
X-Gm-Message-State: AAQBX9dchph5U5zYC7iYG2bfneYue4ms7Qz7burYxHS2FV26S+Is8Rfq
 AfH1Zg80xgKvles/4SBq7N0dTA==
X-Google-Smtp-Source: AKy350bbCMBW/Fi2D9zPMpA9V+S5yuLYM7WhQHJn0z0NXeJ2seEudb8LZZPEVemp3Lyh099kJ/QUIQ==
X-Received: by 2002:adf:e441:0:b0:2e4:bfa0:8c30 with SMTP id
 t1-20020adfe441000000b002e4bfa08c30mr4769296wrm.47.1681299837424; 
 Wed, 12 Apr 2023 04:43:57 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 24/25] target/riscv: Reorg access check in
 get_physical_address
Date: Wed, 12 Apr 2023 13:43:32 +0200
Message-Id: <20230412114333.118895-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:44:09 -0000

We were effectively computing the protection bits twice,
once while performing access checks and once while returning
the valid bits to the caller.  Reorg so we do this once.

Move the computation of mxr close to its single use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-25-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 69 ++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c7c384bae3..7849e18554 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -747,7 +747,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
-                                int *prot, vaddr addr,
+                                int *ret_prot, vaddr addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
@@ -779,20 +779,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
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
@@ -835,7 +829,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
       levels = 5; ptidxbits = 9; ptesize = 8; break;
     case VM_1_10_MBARE:
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     default:
       g_assert_not_reached();
@@ -970,6 +964,27 @@ restart:
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
@@ -982,17 +997,9 @@ restart:
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
 
@@ -1057,20 +1064,16 @@ restart:
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


