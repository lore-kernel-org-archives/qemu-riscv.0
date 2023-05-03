Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aS-0006gV-3t
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a9-0005J3-Ld
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zu-0005dE-Bb
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so49055805e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097625; x=1685689625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ueM5QKqXSJWJZ7U2UsGFKUya4DaeCTeFA0Z/mOSCZ8=;
 b=tMQtiHlx5da3mLSM6fTjizTm8AUSyPVGEUUk2topA/BEzEhMbhrJeTmsPs28PxRwcu
 gAm6bRPeu1REAmY0qLlw+X0kDi7YAQyGsxQ/zk7jIXqGLFHResHDwnvgtfzAFj9qKbLN
 JqltGjm3sXcmC1dmGI7DatmP6nEegEgqpM9urlj29BFmZJnKZQQAPdL2Y06Dek3bb8da
 UGtuqMUCezE+OHpiQ7X//f12LtOpvKFIU8Coa9QAh/AiC/hxKRqsfEB0QM3eO+iYjFpY
 X5W+0KBwZmgBlru5vgsYtLweXjrEFJTkjIXi1g4w15swPlUGeleb8DHiXlrt6XTx03OE
 sveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097625; x=1685689625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ueM5QKqXSJWJZ7U2UsGFKUya4DaeCTeFA0Z/mOSCZ8=;
 b=DlYNCgQ1OdOQ2WfdF09Uzpd9cm1Qc6MRNyjKzyQ365iXYHdb4Crb5zxHr1gDmZITPA
 BzOJJSEqFxKcjkTCKJKoMI2b/Jz9p3LEXuUJf7Wt/hhkQJUlEV3mZA7NtIPPiKk9thZw
 w616SEWAIFJcWJaDuEZ19A7uRba+L7sTts8JQELwiAxVaWjqRDOWDVn+qgHfzKJfNomP
 OwHwJaLSWF/FDdOoIoOTInrRl0i/qy/56PWNUnXGToq/GJU5FkTINlv3jIlZHw7fjhVj
 PqvT59B0+YhRLJbqNsDmQrVd3jreWcpfvkcnGBM/mPCbk4WoGSjB9v8fqzFskvz5Khvj
 0vAA==
X-Gm-Message-State: AC+VfDycjjoHqE4DO/sVgnVL9V8YOYB1ATXbXSHBGeDBuJPW3VJ7TAq7
 QOAGveoP7ZCZAlD6kf69XyRzKPgIAKJP4gEDfMYnDw==
X-Google-Smtp-Source: ACHHUZ4xVW5X74pmA2sQ6Az2MtBYJjilv8esMDFVZZuhjBFqkfUYq+uHLO/cqCD2fFI6szJq9xFbaA==
X-Received: by 2002:a1c:ed0e:0:b0:3f1:7372:66d1 with SMTP id
 l14-20020a1ced0e000000b003f1737266d1mr13914017wmh.0.1683097624618; 
 Wed, 03 May 2023 00:07:04 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 09/57] tcg: Unify helper_{be,le}_{ld,st}*
Date: Wed,  3 May 2023 08:06:08 +0100
Message-Id: <20230503070656.1746170-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:07:23 -0000

With the current structure of cputlb.c, there is no difference
between the little-endian and big-endian entry points, aside
from the assert.  Unify the pairs of functions.

Hoist the qemu_{ld,st}_helpers arrays to tcg.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h           |  60 ++++------
 accel/tcg/cputlb.c               | 190 ++++++++++---------------------
 tcg/tcg.c                        |  21 ++++
 tcg/tci.c                        |  61 ++++------
 docs/devel/loads-stores.rst      |  36 ++----
 tcg/aarch64/tcg-target.c.inc     |  33 ------
 tcg/arm/tcg-target.c.inc         |  37 ------
 tcg/i386/tcg-target.c.inc        |  30 +----
 tcg/loongarch64/tcg-target.c.inc |  23 ----
 tcg/mips/tcg-target.c.inc        |  31 -----
 tcg/ppc/tcg-target.c.inc         |  30 +----
 tcg/riscv/tcg-target.c.inc       |  42 -------
 tcg/s390x/tcg-target.c.inc       |  31 +----
 tcg/sparc64/tcg-target.c.inc     |  32 +-----
 14 files changed, 146 insertions(+), 511 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 684e394b06..3d897ca942 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -28,51 +28,35 @@
 #ifdef CONFIG_SOFTMMU
 
 /* Value zero-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t retaddr);
 
 /* Value sign-extended to tcg register size.  */
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr);
 
 /*
  * Value extended to at least uint32_t, so that some ABIs do not require
  * zero-extension from uint8_t or uint16_t.
  */
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                        MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr);
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t retaddr);
 
 #else
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6b8b472a11..566cf8311b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2011,25 +2011,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     cpu_loop_exit_atomic(env_cpu(env), retaddr);
 }
 
-/*
- * Verify that we have passed the correct MemOp to the correct function.
- *
- * In the case of the helper_*_mmu functions, we will have done this by
- * using the MemOp to look up the helper during code generation.
- *
- * In the case of the cpu_*_mmu functions, this is up to the caller.
- * We could present one function to target code, and dispatch based on
- * the MemOp, but so far we have worked hard to avoid an indirect function
- * call along the memory path.
- */
-static void validate_memop(MemOpIdx oi, MemOp expected)
-{
-#ifdef CONFIG_DEBUG_TCG
-    MemOp have = get_memop(oi) & (MO_SIZE | MO_BSWAP);
-    assert(have == expected);
-#endif
-}
-
 /*
  * Load Helpers
  *
@@ -2297,10 +2278,10 @@ static uint8_t do_ld1_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return do_ld_1(env, &l.page[0], l.mmu_idx, access_type, ra);
 }
 
-tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_UB);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_8);
     return do_ld1_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2328,17 +2309,10 @@ static uint16_t do_ld2_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return ret;
 }
 
-tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUW);
-    return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
-}
-
-tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_16);
     return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2362,17 +2336,10 @@ static uint32_t do_ld4_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return ret;
 }
 
-tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUL);
-    return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
-}
-
-tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_32);
     return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2396,17 +2363,10 @@ static uint64_t do_ld8_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
     return ret;
 }
 
-uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr)
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUQ);
-    return do_ld8_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
-}
-
-uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
-                           MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUQ);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_64);
     return do_ld8_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
@@ -2415,35 +2375,22 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
  * avoid this for 64-bit data, or for 32-bit data on 32-bit host.
  */
 
-
-tcg_target_ulong helper_ret_ldsb_mmu(CPUArchState *env, target_ulong addr,
-                                     MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    return (int8_t)helper_ret_ldub_mmu(env, addr, oi, retaddr);
+    return (int8_t)helper_ldub_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_le_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    return (int16_t)helper_le_lduw_mmu(env, addr, oi, retaddr);
+    return (int16_t)helper_lduw_mmu(env, addr, oi, retaddr);
 }
 
-tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t retaddr)
 {
-    return (int16_t)helper_be_lduw_mmu(env, addr, oi, retaddr);
-}
-
-tcg_target_ulong helper_le_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    return (int32_t)helper_le_ldul_mmu(env, addr, oi, retaddr);
-}
-
-tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
-                                    MemOpIdx oi, uintptr_t retaddr)
-{
-    return (int32_t)helper_be_ldul_mmu(env, addr, oi, retaddr);
+    return (int32_t)helper_ldul_mmu(env, addr, oi, retaddr);
 }
 
 /*
@@ -2459,7 +2406,7 @@ uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
 {
     uint8_t ret;
 
-    validate_memop(oi, MO_UB);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_UB);
     ret = do_ld1_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2470,7 +2417,7 @@ uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint16_t ret;
 
-    validate_memop(oi, MO_BEUW);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUW);
     ret = do_ld2_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2481,7 +2428,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint32_t ret;
 
-    validate_memop(oi, MO_BEUL);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUL);
     ret = do_ld4_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2492,7 +2439,7 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint64_t ret;
 
-    validate_memop(oi, MO_BEUQ);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUQ);
     ret = do_ld8_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2503,7 +2450,7 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint16_t ret;
 
-    validate_memop(oi, MO_LEUW);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUW);
     ret = do_ld2_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2514,7 +2461,7 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint32_t ret;
 
-    validate_memop(oi, MO_LEUL);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUL);
     ret = do_ld4_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2525,7 +2472,7 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     uint64_t ret;
 
-    validate_memop(oi, MO_LEUQ);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUQ);
     ret = do_ld8_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
     plugin_load_cb(env, addr, oi);
     return ret;
@@ -2553,8 +2500,8 @@ Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    h = helper_be_ldq_mmu(env, addr, new_oi, ra);
-    l = helper_be_ldq_mmu(env, addr + 8, new_oi, ra);
+    h = helper_ldq_mmu(env, addr, new_oi, ra);
+    l = helper_ldq_mmu(env, addr + 8, new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return int128_make128(l, h);
@@ -2582,8 +2529,8 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    l = helper_le_ldq_mmu(env, addr, new_oi, ra);
-    h = helper_le_ldq_mmu(env, addr + 8, new_oi, ra);
+    l = helper_ldq_mmu(env, addr, new_oi, ra);
+    h = helper_ldq_mmu(env, addr + 8, new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return int128_make128(l, h);
@@ -2727,13 +2674,13 @@ static void do_st_8(CPUArchState *env, MMULookupPageData *p, uint64_t val,
     }
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                        MemOpIdx oi, uintptr_t ra)
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
 {
     MMULookupLocals l;
     bool crosspage;
 
-    validate_memop(oi, MO_UB);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_8);
     crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
     tcg_debug_assert(!crosspage);
 
@@ -2762,17 +2709,10 @@ static void do_st2_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
     do_st_1(env, &l.page[1], b, l.mmu_idx, ra);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUW);
-    do_st2_mmu(env, addr, val, oi, retaddr);
-}
-
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_16);
     do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
@@ -2796,17 +2736,10 @@ static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
     (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, l.memop, ra);
 }
 
-void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUL);
-    do_st4_mmu(env, addr, val, oi, retaddr);
-}
-
-void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_32);
     do_st4_mmu(env, addr, val, oi, retaddr);
 }
 
@@ -2830,17 +2763,10 @@ static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, l.memop, ra);
 }
 
-void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t retaddr)
 {
-    validate_memop(oi, MO_LEUQ);
-    do_st8_mmu(env, addr, val, oi, retaddr);
-}
-
-void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                       MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUQ);
+    tcg_debug_assert((get_memop(oi) & MO_SIZE) == MO_64);
     do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
@@ -2856,49 +2782,55 @@ static void plugin_store_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 void cpu_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                  MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_ret_stb_mmu(env, addr, val, oi, retaddr);
+    helper_stb_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_be_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_be_stw_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_be_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_be_stl_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_be_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_be_stq_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_BEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_le_stw_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_le_stl_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    helper_le_stq_mmu(env, addr, val, oi, retaddr);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == MO_LEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
     plugin_store_cb(env, addr, oi);
 }
 
@@ -2923,8 +2855,8 @@ void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    helper_be_stq_mmu(env, addr, int128_gethi(val), new_oi, ra);
-    helper_be_stq_mmu(env, addr + 8, int128_getlo(val), new_oi, ra);
+    helper_stq_mmu(env, addr, int128_gethi(val), new_oi, ra);
+    helper_stq_mmu(env, addr + 8, int128_getlo(val), new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -2950,8 +2882,8 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
     mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
     new_oi = make_memop_idx(mop, mmu_idx);
 
-    helper_le_stq_mmu(env, addr, int128_getlo(val), new_oi, ra);
-    helper_le_stq_mmu(env, addr + 8, int128_gethi(val), new_oi, ra);
+    helper_stq_mmu(env, addr, int128_getlo(val), new_oi, ra);
+    helper_stq_mmu(env, addr + 8, int128_gethi(val), new_oi, ra);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 748be8426a..12510c78c6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -197,6 +197,27 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
                                    const TCGLdstHelperParam *p)
     __attribute__((unused));
 
+#ifdef CONFIG_SOFTMMU
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
+    [MO_UB] = helper_ldub_mmu,
+    [MO_SB] = helper_ldsb_mmu,
+    [MO_UW] = helper_lduw_mmu,
+    [MO_SW] = helper_ldsw_mmu,
+    [MO_UL] = helper_ldul_mmu,
+    [MO_UQ] = helper_ldq_mmu,
+#if TCG_TARGET_REG_BITS == 64
+    [MO_SL] = helper_ldsl_mmu,
+#endif
+};
+
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
+    [MO_8]  = helper_stb_mmu,
+    [MO_16] = helper_stw_mmu,
+    [MO_32] = helper_stl_mmu,
+    [MO_64] = helper_stq_mmu,
+};
+#endif
+
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 
diff --git a/tcg/tci.c b/tcg/tci.c
index fc67e7e767..5bde2e1f2e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -293,31 +293,21 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop & (MO_BSWAP | MO_SSIZE)) {
+    switch (mop & MO_SSIZE) {
     case MO_UB:
-        return helper_ret_ldub_mmu(env, taddr, oi, ra);
+        return helper_ldub_mmu(env, taddr, oi, ra);
     case MO_SB:
-        return helper_ret_ldsb_mmu(env, taddr, oi, ra);
-    case MO_LEUW:
-        return helper_le_lduw_mmu(env, taddr, oi, ra);
-    case MO_LESW:
-        return helper_le_ldsw_mmu(env, taddr, oi, ra);
-    case MO_LEUL:
-        return helper_le_ldul_mmu(env, taddr, oi, ra);
-    case MO_LESL:
-        return helper_le_ldsl_mmu(env, taddr, oi, ra);
-    case MO_LEUQ:
-        return helper_le_ldq_mmu(env, taddr, oi, ra);
-    case MO_BEUW:
-        return helper_be_lduw_mmu(env, taddr, oi, ra);
-    case MO_BESW:
-        return helper_be_ldsw_mmu(env, taddr, oi, ra);
-    case MO_BEUL:
-        return helper_be_ldul_mmu(env, taddr, oi, ra);
-    case MO_BESL:
-        return helper_be_ldsl_mmu(env, taddr, oi, ra);
-    case MO_BEUQ:
-        return helper_be_ldq_mmu(env, taddr, oi, ra);
+        return helper_ldsb_mmu(env, taddr, oi, ra);
+    case MO_UW:
+        return helper_lduw_mmu(env, taddr, oi, ra);
+    case MO_SW:
+        return helper_ldsw_mmu(env, taddr, oi, ra);
+    case MO_UL:
+        return helper_ldul_mmu(env, taddr, oi, ra);
+    case MO_SL:
+        return helper_ldsl_mmu(env, taddr, oi, ra);
+    case MO_UQ:
+        return helper_ldq_mmu(env, taddr, oi, ra);
     default:
         g_assert_not_reached();
     }
@@ -382,27 +372,18 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop & (MO_BSWAP | MO_SIZE)) {
+    switch (mop & MO_SIZE) {
     case MO_UB:
-        helper_ret_stb_mmu(env, taddr, val, oi, ra);
+        helper_stb_mmu(env, taddr, val, oi, ra);
         break;
-    case MO_LEUW:
-        helper_le_stw_mmu(env, taddr, val, oi, ra);
+    case MO_UW:
+        helper_stw_mmu(env, taddr, val, oi, ra);
         break;
-    case MO_LEUL:
-        helper_le_stl_mmu(env, taddr, val, oi, ra);
+    case MO_UL:
+        helper_stl_mmu(env, taddr, val, oi, ra);
         break;
-    case MO_LEUQ:
-        helper_le_stq_mmu(env, taddr, val, oi, ra);
-        break;
-    case MO_BEUW:
-        helper_be_stw_mmu(env, taddr, val, oi, ra);
-        break;
-    case MO_BEUL:
-        helper_be_stl_mmu(env, taddr, val, oi, ra);
-        break;
-    case MO_BEUQ:
-        helper_be_stq_mmu(env, taddr, val, oi, ra);
+    case MO_UQ:
+        helper_stq_mmu(env, taddr, val, oi, ra);
         break;
     default:
         g_assert_not_reached();
diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index ad5dfe133e..d2cefc77a2 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -297,31 +297,20 @@ swap: ``translator_ld{sign}{size}_swap(env, ptr, swap)``
 Regexes for git grep
  - ``\<translator_ld[us]\?[bwlq]\(_swap\)\?\>``
 
-``helper_*_{ld,st}*_mmu``
+``helper_{ld,st}*_mmu``
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These functions are intended primarily to be called by the code
-generated by the TCG backend. They may also be called by target
-CPU helper function code. Like the ``cpu_{ld,st}_mmuidx_ra`` functions
-they perform accesses by guest virtual address, with a given ``mmuidx``.
+generated by the TCG backend.  Like the ``cpu_{ld,st}_mmu`` functions
+they perform accesses by guest virtual address, with a given ``MemOpIdx``.
 
-These functions specify an ``opindex`` parameter which encodes
-(among other things) the mmu index to use for the access.  This parameter
-should be created by calling ``make_memop_idx()``.
+They differ from ``cpu_{ld,st}_mmu`` in that they take the endianness
+of the operation only from the MemOpIdx, and loads extend the return
+value to the size of a host general register (``tcg_target_ulong``).
 
-The ``retaddr`` parameter should be the result of GETPC() called directly
-from the top level HELPER(foo) function (or 0 if no guest CPU state
-unwinding is required).
+load: ``helper_ld{sign}{size}_mmu(env, addr, opindex, retaddr)``
 
-**TODO** The names of these functions are a bit odd for historical
-reasons because they were originally expected to be called only from
-within generated code. We should rename them to bring them more in
-line with the other memory access functions. The explicit endianness
-is the only feature they have beyond ``*_mmuidx_ra``.
-
-load: ``helper_{endian}_ld{sign}{size}_mmu(env, addr, opindex, retaddr)``
-
-store: ``helper_{endian}_st{size}_mmu(env, addr, val, opindex, retaddr)``
+store: ``helper_{size}_mmu(env, addr, val, opindex, retaddr)``
 
 ``sign``
  - (empty) : for 32 or 64 bit sizes
@@ -334,14 +323,9 @@ store: ``helper_{endian}_st{size}_mmu(env, addr, val, opindex, retaddr)``
  - ``l`` : 32 bits
  - ``q`` : 64 bits
 
-``endian``
- - ``le`` : little endian
- - ``be`` : big endian
- - ``ret`` : target endianness
-
 Regexes for git grep
- - ``\<helper_\(le\|be\|ret\)_ld[us]\?[bwlq]_mmu\>``
- - ``\<helper_\(le\|be\|ret\)_st[bwlq]_mmu\>``
+ - ``\<helper_ld[us]\?[bwlq]_mmu\>``
+ - ``\<helper_st[bwlq]_mmu\>``
 
 ``address_space_*``
 ~~~~~~~~~~~~~~~~~~~
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 62dd22d73c..e6636c1f8b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1587,39 +1587,6 @@ typedef struct {
 } HostAddress;
 
 #ifdef CONFIG_SOFTMMU
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     MemOpIdx oi, uintptr_t ra)
- */
-static void * const qemu_ld_helpers[MO_SIZE + 1] = {
-    [MO_8]  = helper_ret_ldub_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_lduw_mmu,
-    [MO_32] = helper_be_ldul_mmu,
-    [MO_64] = helper_be_ldq_mmu,
-#else
-    [MO_16] = helper_le_lduw_mmu,
-    [MO_32] = helper_le_ldul_mmu,
-    [MO_64] = helper_le_ldq_mmu,
-#endif
-};
-
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, MemOpIdx oi,
- *                                     uintptr_t ra)
- */
-static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_8]  = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_stw_mmu,
-    [MO_32] = helper_be_stl_mmu,
-    [MO_64] = helper_be_stq_mmu,
-#else
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-#endif
-};
-
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index df514e56fc..8b0d526659 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1333,43 +1333,6 @@ typedef struct {
 } HostAddress;
 
 #ifdef CONFIG_SOFTMMU
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     int mmu_idx, uintptr_t ra)
- */
-static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_UW] = helper_be_lduw_mmu,
-    [MO_UL] = helper_be_ldul_mmu,
-    [MO_UQ] = helper_be_ldq_mmu,
-    [MO_SW] = helper_be_ldsw_mmu,
-    [MO_SL] = helper_be_ldul_mmu,
-#else
-    [MO_UW] = helper_le_lduw_mmu,
-    [MO_UL] = helper_le_ldul_mmu,
-    [MO_UQ] = helper_le_ldq_mmu,
-    [MO_SW] = helper_le_ldsw_mmu,
-    [MO_SL] = helper_le_ldul_mmu,
-#endif
-};
-
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
- */
-static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_8]   = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_stw_mmu,
-    [MO_32] = helper_be_stl_mmu,
-    [MO_64] = helper_be_stq_mmu,
-#else
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-#endif
-};
-
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7dbfcbd20f..bb603e7968 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1776,32 +1776,6 @@ typedef struct {
 } HostAddress;
 
 #if defined(CONFIG_SOFTMMU)
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     int mmu_idx, uintptr_t ra)
- */
-static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
-};
-
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
- */
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
-};
-
 /*
  * Because i686 has no register parameters and because x86_64 has xchg
  * to handle addr/data register overlap, we have placed all input arguments
@@ -1842,7 +1816,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     tcg_out_ld_helper_args(s, l, &ldst_helper_param);
-    tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_branch(s, 1, qemu_ld_helpers[opc & MO_SIZE]);
     tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
 
     tcg_out_jmp(s, l->raddr);
@@ -1864,7 +1838,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     tcg_out_st_helper_args(s, l, &ldst_helper_param);
-    tcg_out_branch(s, 1, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_branch(s, 1, qemu_st_helpers[opc & MO_SIZE]);
 
     tcg_out_jmp(s, l->raddr);
     return true;
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 83fa45c802..d1bc29826f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -784,29 +784,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  */
 
 #if defined(CONFIG_SOFTMMU)
-/*
- * helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     MemOpIdx oi, uintptr_t ra)
- */
-static void * const qemu_ld_helpers[4] = {
-    [MO_8]  = helper_ret_ldub_mmu,
-    [MO_16] = helper_le_lduw_mmu,
-    [MO_32] = helper_le_ldul_mmu,
-    [MO_64] = helper_le_ldq_mmu,
-};
-
-/*
- * helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, MemOpIdx oi,
- *                                     uintptr_t ra)
- */
-static void * const qemu_st_helpers[4] = {
-    [MO_8]  = helper_ret_stb_mmu,
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-};
-
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5ad9867882..7770ef46bd 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1076,37 +1076,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
 }
 
 #if defined(CONFIG_SOFTMMU)
-static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_UW] = helper_be_lduw_mmu,
-    [MO_SW] = helper_be_ldsw_mmu,
-    [MO_UL] = helper_be_ldul_mmu,
-    [MO_SL] = helper_be_ldsl_mmu,
-    [MO_UQ] = helper_be_ldq_mmu,
-#else
-    [MO_UW] = helper_le_lduw_mmu,
-    [MO_SW] = helper_le_ldsw_mmu,
-    [MO_UL] = helper_le_ldul_mmu,
-    [MO_UQ] = helper_le_ldq_mmu,
-    [MO_SL] = helper_le_ldsl_mmu,
-#endif
-};
-
-static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_UW] = helper_be_stw_mmu,
-    [MO_UL] = helper_be_stl_mmu,
-    [MO_UQ] = helper_be_stq_mmu,
-#else
-    [MO_UW] = helper_le_stw_mmu,
-    [MO_UL] = helper_le_stl_mmu,
-    [MO_UQ] = helper_le_stq_mmu,
-#endif
-};
-
 /* We have four temps, we might as well expose three of them. */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 0a14c3e997..0963156a78 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1963,32 +1963,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
 };
 
 #if defined (CONFIG_SOFTMMU)
-/* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
- *                                 int mmu_idx, uintptr_t ra)
- */
-static void * const qemu_ld_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
-};
-
-/* helper signature: helper_st_mmu(CPUState *env, target_ulong addr,
- *                                 uintxx_t val, int mmu_idx, uintptr_t ra)
- */
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
-};
-
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     if (arg < 0) {
@@ -2017,7 +1991,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
 
     tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
-    tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_ld_helpers[opc & MO_SIZE]);
     tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_b(s, 0, lb->raddr);
@@ -2033,7 +2007,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
 
     tcg_out_st_helper_args(s, lb, &ldst_helper_param);
-    tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_st_helpers[opc & MO_SIZE]);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d12b824d8c..8ed0e2f210 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -847,48 +847,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  */
 
 #if defined(CONFIG_SOFTMMU)
-/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
- *                                     MemOpIdx oi, uintptr_t ra)
- */
-static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
-    [MO_UB] = helper_ret_ldub_mmu,
-    [MO_SB] = helper_ret_ldsb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_UW] = helper_be_lduw_mmu,
-    [MO_SW] = helper_be_ldsw_mmu,
-    [MO_UL] = helper_be_ldul_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_SL] = helper_be_ldsl_mmu,
-#endif
-    [MO_UQ] = helper_be_ldq_mmu,
-#else
-    [MO_UW] = helper_le_lduw_mmu,
-    [MO_SW] = helper_le_ldsw_mmu,
-    [MO_UL] = helper_le_ldul_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_SL] = helper_le_ldsl_mmu,
-#endif
-    [MO_UQ] = helper_le_ldq_mmu,
-#endif
-};
-
-/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
- *                                     uintxx_t val, MemOpIdx oi,
- *                                     uintptr_t ra)
- */
-static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_8]   = helper_ret_stb_mmu,
-#if HOST_BIG_ENDIAN
-    [MO_16] = helper_be_stw_mmu,
-    [MO_32] = helper_be_stl_mmu,
-    [MO_64] = helper_be_stq_mmu,
-#else
-    [MO_16] = helper_le_stw_mmu,
-    [MO_32] = helper_le_stl_mmu,
-    [MO_64] = helper_le_stq_mmu,
-#endif
-};
-
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index aacbaf21d5..968977be98 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -438,33 +438,6 @@ static const uint8_t tcg_cond_to_ltr_cond[] = {
     [TCG_COND_GEU] = S390_CC_ALWAYS,
 };
 
-#ifdef CONFIG_SOFTMMU
-static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LESL] = helper_le_ldsl_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BESL] = helper_be_ldsl_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
-};
-
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
-};
-#endif
-
 static const tcg_insn_unit *tb_ret_addr;
 uint64_t s390_facilities[3];
 
@@ -1721,7 +1694,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
 
     tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
     tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
@@ -1738,7 +1711,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
 
     tcg_out_st_helper_args(s, lb, &ldst_helper_param);
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 7e6466d3b6..e997db2645 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -919,33 +919,11 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 }
 
 #ifdef CONFIG_SOFTMMU
-static const tcg_insn_unit *qemu_ld_trampoline[(MO_SSIZE | MO_BSWAP) + 1];
-static const tcg_insn_unit *qemu_st_trampoline[(MO_SIZE | MO_BSWAP) + 1];
+static const tcg_insn_unit *qemu_ld_trampoline[MO_SSIZE + 1];
+static const tcg_insn_unit *qemu_st_trampoline[MO_SIZE + 1];
 
 static void build_trampolines(TCGContext *s)
 {
-    static void * const qemu_ld_helpers[] = {
-        [MO_UB]   = helper_ret_ldub_mmu,
-        [MO_SB]   = helper_ret_ldsb_mmu,
-        [MO_LEUW] = helper_le_lduw_mmu,
-        [MO_LESW] = helper_le_ldsw_mmu,
-        [MO_LEUL] = helper_le_ldul_mmu,
-        [MO_LEUQ] = helper_le_ldq_mmu,
-        [MO_BEUW] = helper_be_lduw_mmu,
-        [MO_BESW] = helper_be_ldsw_mmu,
-        [MO_BEUL] = helper_be_ldul_mmu,
-        [MO_BEUQ] = helper_be_ldq_mmu,
-    };
-    static void * const qemu_st_helpers[] = {
-        [MO_UB]   = helper_ret_stb_mmu,
-        [MO_LEUW] = helper_le_stw_mmu,
-        [MO_LEUL] = helper_le_stl_mmu,
-        [MO_LEUQ] = helper_le_stq_mmu,
-        [MO_BEUW] = helper_be_stw_mmu,
-        [MO_BEUL] = helper_be_stl_mmu,
-        [MO_BEUQ] = helper_be_stq_mmu,
-    };
-
     int i;
 
     for (i = 0; i < ARRAY_SIZE(qemu_ld_helpers); ++i) {
@@ -1210,9 +1188,9 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     /* We use the helpers to extend SB and SW data, leaving the case
        of SL needing explicit extending below.  */
     if ((memop & MO_SSIZE) == MO_SL) {
-        func = qemu_ld_trampoline[memop & (MO_BSWAP | MO_SIZE)];
+        func = qemu_ld_trampoline[MO_UL];
     } else {
-        func = qemu_ld_trampoline[memop & (MO_BSWAP | MO_SSIZE)];
+        func = qemu_ld_trampoline[memop & MO_SSIZE];
     }
     tcg_debug_assert(func != NULL);
     tcg_out_call_nodelay(s, func, false);
@@ -1353,7 +1331,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
                    TCG_REG_O2, data_type, memop & MO_SIZE, data);
 
-    func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
+    func = qemu_st_trampoline[memop & MO_SIZE];
     tcg_debug_assert(func != NULL);
     tcg_out_call_nodelay(s, func, false);
     /* delay slot */
-- 
2.34.1


