Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOQ8-00024c-LB
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQ6-00020f-C3
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:33:46 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOPv-0004XT-Pj
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:33:46 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso59725921fa.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451213; x=1685043213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyMjuklubFgJgURYcO2GA40rDkgKk3K+6/9AFMvD4To=;
 b=lPo/xqm+e4UTfgzJc3lOAWV5hBmaFAp9HMOCX9mksG6OeVD4iNZQLys4VSDroEE2i6
 MANxGLsIlgpozKKyBzc3QArXRmhhvW0wanm5xUJdOxEftuKyxCZjAC8pC7RAJ3LPR27W
 n5VyIfA3kJQxS8X+OrfNATObgyviH+cmz3LEu+dTgpAPs+pqqHf3NSHkibcVhRnR6tIX
 mjG8Epvbt08vBSX/P8bQmVOGO8zR4cjQFsI0lyn+NAtIpiWHeCdyVKDREvZ7Gk6oLFC/
 g7XBWKD06n/HF2cEdwbX0mMqAyIc0zU9qQxx2tP0as964TfYAb0EkVtDSGGF1I+u/pPn
 XcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451213; x=1685043213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyMjuklubFgJgURYcO2GA40rDkgKk3K+6/9AFMvD4To=;
 b=V7qqatkAEKjbGxFGJT2BPtd8nzoo62rQQ4gC0Q5/o1ctR6fKTBWiuSHhym61PPkJog
 g/0xAiVJkkiH8VQ3HdXh213X02/ZMDHayqTRXrXgFoOnLKlDb1bvAwyiII68XM3a6u+g
 LvtJA5QySHHGBw5Sk7gP/I4uEDF+FahEH/2AFBDEeEZ6Mq7TjHs4eVTu2QGgJ2l/qIWT
 HkdBLDhDXzoPCbpYRnxccDjS/+EvP/n5Xr/IjvyObLtO7GieLIzSoTqG6zbsWRvfA7j3
 1G47vAjBYJLWu1GUs/u7RKipYuEjbDxMWq75qezU0bB0OHhh1h90pbzl0KFnTln81eqB
 hMtw==
X-Gm-Message-State: AAQBX9ctwvFJE7xNjgCTHBQSDF/O1GYzQjj3O0puU52akBpW7e/BG4Hb
 RWguhZy8jzdWGeJ1J7PN8pmmgw==
X-Google-Smtp-Source: AKy350bBZT7wvoBpNyHx8hKlFkL+5aubRch5kXFBccxvw0tqUTi38ozRQRv9aaAheBdoUNS0ydFRdA==
X-Received: by 2002:a2e:9c44:0:b0:2a8:e670:c3cc with SMTP id
 t4-20020a2e9c44000000b002a8e670c3ccmr3590060ljj.16.1682451212964; 
 Tue, 25 Apr 2023 12:33:32 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 10/57] accel/tcg: Implement helper_{ld,
 st}*_mmu for user-only
Date: Tue, 25 Apr 2023 20:30:59 +0100
Message-Id: <20230425193146.2106111-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:33:46 -0000

TCG backends may need to defer to a helper to implement
the atomicity required by a given operation.  Mirror the
interface used in system mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |   6 +-
 accel/tcg/user-exec.c  | 392 ++++++++++++++++++++++++++++-------------
 tcg/tcg.c              |   6 +-
 3 files changed, 278 insertions(+), 126 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 3d897ca942..57fafa14b1 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -25,8 +25,6 @@
 #ifndef TCG_LDST_H
 #define TCG_LDST_H
 
-#ifdef CONFIG_SOFTMMU
-
 /* Value zero-extended to tcg register size.  */
 tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr);
@@ -58,10 +56,10 @@ void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr);
 
-#else
+#ifdef CONFIG_USER_ONLY
 
 G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
 G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
 
-#endif /* CONFIG_SOFTMMU */
+#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8a29dfd532..b6b054890d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,21 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-/*
- * Verify that we have passed the correct MemOp to the correct function.
- *
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
 void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
 {
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
@@ -914,10 +899,9 @@ void helper_unaligned_st(CPUArchState *env, target_ulong addr)
     cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
 }
 
-static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
-                            MemOpIdx oi, uintptr_t ra, MMUAccessType type)
+static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
+                            MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-    MemOp mop = get_memop(oi);
     int a_bits = get_alignment_bits(mop);
     void *ret;
 
@@ -933,100 +917,206 @@ static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
 
 #include "ldst_atomicity.c.inc"
 
-uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
-                    MemOpIdx oi, uintptr_t ra)
+static uint8_t do_ld1_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
     uint8_t ret;
 
-    validate_memop(oi, MO_UB);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    tcg_debug_assert((mop & MO_SIZE) == MO_8);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
     ret = ldub_p(haddr);
     clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_ldub_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    return do_ld1_mmu(env, addr, get_memop(oi), ra);
+}
+
+tcg_target_ulong helper_ldsb_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    return (int8_t)do_ld1_mmu(env, addr, get_memop(oi), ra);
+}
+
+uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    uint8_t ret = do_ld1_mmu(env, addr, get_memop(oi), ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
+static uint16_t do_ld2_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint16_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_16);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_2(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_lduw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint16_t ret = do_ld2_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+tcg_target_ulong helper_ldsw_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int16_t ret = do_ld2_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
 uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint16_t ret;
 
-    validate_memop(oi, MO_BEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_2(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld2_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_be16(ret);
 }
 
-uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
-                        MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-    uint32_t ret;
-
-    validate_memop(oi, MO_BEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_4(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return cpu_to_be32(ret);
-}
-
-uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
-                        MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-    uint64_t ret;
-
-    validate_memop(oi, MO_BEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_8(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return cpu_to_be64(ret);
-}
-
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint16_t ret;
 
-    validate_memop(oi, MO_LEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_2(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld2_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le16(ret);
 }
 
+static uint32_t do_ld4_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint32_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_32);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_4(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+tcg_target_ulong helper_ldul_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint32_t ret = do_ld4_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+tcg_target_ulong helper_ldsl_mmu(CPUArchState *env, target_ulong addr,
+                                 MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int32_t ret = do_ld4_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint32_t ret;
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld4_he_mmu(env, addr, mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return cpu_to_be32(ret);
+}
+
 uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint32_t ret;
 
-    validate_memop(oi, MO_LEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_4(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld4_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le32(ret);
 }
 
+static uint64_t do_ld8_he_mmu(CPUArchState *env, abi_ptr addr,
+                              MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+    uint64_t ret;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_64);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_LOAD);
+    ret = load_atom_8(env, ra, haddr, mop);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint64_t helper_ldq_mmu(CPUArchState *env, target_ulong addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint64_t ret = do_ld8_he_mmu(env, addr, mop, ra);
+
+    if (mop & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
+                        MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    uint64_t ret;
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    ret = do_ld8_he_mmu(env, addr, mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return cpu_to_be64(ret);
+}
+
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
     uint64_t ret;
 
-    validate_memop(oi, MO_LEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = load_atom_8(env, ra, haddr, get_memop(oi));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    ret = do_ld8_he_mmu(env, addr, mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
     return cpu_to_le64(ret);
 }
@@ -1037,7 +1127,7 @@ Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     Int128 ret;
 
-    validate_memop(oi, MO_128 | MO_BE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_BE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     memcpy(&ret, haddr, 16);
     clear_helper_retaddr();
@@ -1055,7 +1145,7 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     void *haddr;
     Int128 ret;
 
-    validate_memop(oi, MO_128 | MO_LE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_LE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
     memcpy(&ret, haddr, 16);
     clear_helper_retaddr();
@@ -1067,87 +1157,153 @@ Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
     return ret;
 }
 
-void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
-                 MemOpIdx oi, uintptr_t ra)
+static void do_st1_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                       MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_UB);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    tcg_debug_assert((mop & MO_SIZE) == MO_8);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
     stb_p(haddr, val);
     clear_helper_retaddr();
+}
+
+void helper_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    do_st1_mmu(env, addr, val, get_memop(oi), ra);
+}
+
+void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
+                 MemOpIdx oi, uintptr_t ra)
+{
+    do_st1_mmu(env, addr, val, get_memop(oi), ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
+static void do_st2_he_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
+                          MemOp mop, uintptr_t ra)
+{
+    void *haddr;
+
+    tcg_debug_assert((mop & MO_SIZE) == MO_16);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_2(env, ra, haddr, mop, val);
+    clear_helper_retaddr();
+}
+
+void helper_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap16(val);
+    }
+    do_st2_he_mmu(env, addr, val, mop, ra);
+}
+
 void cpu_stw_be_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
                     MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
 
-    validate_memop(oi, MO_BEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_2(env, ra, haddr, get_memop(oi), be16_to_cpu(val));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
-                    MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-
-    validate_memop(oi, MO_BEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_4(env, ra, haddr, get_memop(oi), be32_to_cpu(val));
-    clear_helper_retaddr();
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
-}
-
-void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
-                    MemOpIdx oi, uintptr_t ra)
-{
-    void *haddr;
-
-    validate_memop(oi, MO_BEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_8(env, ra, haddr, get_memop(oi), be64_to_cpu(val));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st2_he_mmu(env, addr, be16_to_cpu(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, abi_ptr addr, uint16_t val,
                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st2_he_mmu(env, addr, le16_to_cpu(val), mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void do_st4_he_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_LEUW);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_2(env, ra, haddr, get_memop(oi), le16_to_cpu(val));
+    tcg_debug_assert((mop & MO_SIZE) == MO_32);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_4(env, ra, haddr, mop, val);
     clear_helper_retaddr();
+}
+
+void helper_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap32(val);
+    }
+    do_st4_he_mmu(env, addr, val, mop, ra);
+}
+
+void cpu_stl_be_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st4_he_mmu(env, addr, be32_to_cpu(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, abi_ptr addr, uint32_t val,
                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st4_he_mmu(env, addr, le32_to_cpu(val), mop, ra);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+static void do_st8_he_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                          MemOp mop, uintptr_t ra)
 {
     void *haddr;
 
-    validate_memop(oi, MO_LEUL);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_4(env, ra, haddr, get_memop(oi), le32_to_cpu(val));
+    tcg_debug_assert((mop & MO_SIZE) == MO_64);
+    haddr = cpu_mmu_lookup(env, addr, mop, ra, MMU_DATA_STORE);
+    store_atom_8(env, ra, haddr, mop, val);
     clear_helper_retaddr();
+}
+
+void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    if (mop & MO_BSWAP) {
+        val = bswap64(val);
+    }
+    do_st8_he_mmu(env, addr, val, mop, ra);
+}
+
+void cpu_stq_be_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
+                    MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+
+    tcg_debug_assert((mop & MO_BSWAP) == MO_BE);
+    do_st8_he_mmu(env, addr, cpu_to_be64(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
                     MemOpIdx oi, uintptr_t ra)
 {
-    void *haddr;
+    MemOp mop = get_memop(oi);
 
-    validate_memop(oi, MO_LEUQ);
-    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
-    store_atom_8(env, ra, haddr, get_memop(oi), le64_to_cpu(val));
-    clear_helper_retaddr();
+    tcg_debug_assert((mop & MO_BSWAP) == MO_LE);
+    do_st8_he_mmu(env, addr, cpu_to_le64(val), mop, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
@@ -1156,7 +1312,7 @@ void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr,
 {
     void *haddr;
 
-    validate_memop(oi, MO_128 | MO_BE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_BE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     if (!HOST_BIG_ENDIAN) {
         val = bswap128(val);
@@ -1171,7 +1327,7 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr,
 {
     void *haddr;
 
-    validate_memop(oi, MO_128 | MO_LE);
+    tcg_debug_assert((get_memop(oi) & (MO_BSWAP | MO_SIZE)) == (MO_128 | MO_LE));
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
     if (HOST_BIG_ENDIAN) {
         val = bswap128(val);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5dfab02175..d7659fdc67 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -197,8 +197,7 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
                                    const TCGLdstHelperParam *p)
     __attribute__((unused));
 
-#ifdef CONFIG_SOFTMMU
-static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
+static void * const qemu_ld_helpers[MO_SSIZE + 1] __attribute__((unused)) = {
     [MO_UB] = helper_ldub_mmu,
     [MO_SB] = helper_ldsb_mmu,
     [MO_UW] = helper_lduw_mmu,
@@ -210,13 +209,12 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
 #endif
 };
 
-static void * const qemu_st_helpers[MO_SIZE + 1] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
     [MO_8]  = helper_stb_mmu,
     [MO_16] = helper_stw_mmu,
     [MO_32] = helper_stl_mmu,
     [MO_64] = helper_stq_mmu,
 };
-#endif
 
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
-- 
2.34.1


