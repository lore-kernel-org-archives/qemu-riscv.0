Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZm-0005Ir-LD
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZf-0005D3-4M
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:15 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ4-0004cf-PJ
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:14 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9331238pjt.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+iMiL/8rgFPrMnNMdPuUjiub5+xvYqydBuIyCcmAyA=;
 b=CQucPtp99wrW052p96VDpp74jcLL4GmB1ZC6pQGJp+vK2smTP0KDLMPGrAnsLs/fyy
 0+wA7ya4iP+839DrMyaz2p9UWNSfOgyyfDVUZiD6PLatIOejf48X+8ber/WhS5jiQkLn
 ryB2FsuzB0CYqEtufP4ciFHfYy8UBv29wbgyJ84OZnnK/fVABvhmQKh6F12eHE/C+TjY
 RRWHBw94279T50rVpLFTgPq8WMzG+4ABOOc4NZG3GSh13ouXNG6a4jx6H1+s29HCQHOW
 wG49SEPYpj4Zj64Xh8zsxDXKmfIQ16NLM+RS95pcjEnjSSIWclUCTn611Mw3zNJu74rA
 Iscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+iMiL/8rgFPrMnNMdPuUjiub5+xvYqydBuIyCcmAyA=;
 b=JzsVwRsntk6VqkM9v+tjBdgvaorf6mHtoeYPA+/aOUQYMcrk+GBnuotKRfiCM5avZV
 InE2EreAwtLlMc/+V7nxxIf2UkzOGRj7cvU/F9xXctXddkFxiGJ692BXlSqoqE1S8b0f
 y8ZEiwWxXO5Eouo3snCSJq2ENMwElOxPQaeIG7pTLzCppetufx9Fvi2Bh+4qvZa6QyII
 UEtoLSLhvLLFHLm24wIRjGUuXzo8UNPWA77FrvDtMfUEub5GZ0kGrqfbjoeSH62wgVun
 FsWxCR4R1Dkzc3Knc1SA7A0lqdleycXs+zozfyAEgZuDeD6SyrO8FaDgNmYb4pqka6c4
 WweQ==
X-Gm-Message-State: AFqh2ko6STaFu8UEXxVZxidltnSNVT39tuWF9B6zB3bJMfjbli+TNWp7
 l71Mh+jIUNUPSFdYtODZoDjaww==
X-Google-Smtp-Source: AMrXdXsIrKReg7nYqoCfO3iRpS0vB/7XZJPXG6Rtt7BwVMGlK4qdl0rt0gB83CT22ZCddpt3k2V4KA==
X-Received: by 2002:a17:902:e846:b0:189:f990:24af with SMTP id
 t6-20020a170902e84600b00189f99024afmr88812058plg.20.1673145457430; 
 Sat, 07 Jan 2023 18:37:37 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 15/36] tcg: Add guest load/store primitives for TCGv_i128
Date: Sat,  7 Jan 2023 18:36:58 -0800
Message-Id: <20230108023719.2466341-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:15 -0000

These are not yet considering atomicity of the 16-byte value;
this is a direct replacement for the current target code which
uses a pair of 8-byte operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  10 +++
 include/tcg/tcg-op.h    |   2 +
 accel/tcg/cputlb.c      | 112 +++++++++++++++++++++++++++++++++
 accel/tcg/user-exec.c   |  66 ++++++++++++++++++++
 tcg/tcg-op.c            | 134 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 324 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index d0c7c0d5fe..09b55cc0ee 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -220,6 +220,11 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr ptr,
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr ptr,
                         MemOpIdx oi, uintptr_t ra);
 
+Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra);
+Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra);
+
 void cpu_stb_mmu(CPUArchState *env, abi_ptr ptr, uint8_t val,
                  MemOpIdx oi, uintptr_t ra);
 void cpu_stw_be_mmu(CPUArchState *env, abi_ptr ptr, uint16_t val,
@@ -235,6 +240,11 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr ptr, uint32_t val,
 void cpu_stq_le_mmu(CPUArchState *env, abi_ptr ptr, uint64_t val,
                     MemOpIdx oi, uintptr_t ra);
 
+void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra);
+void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra);
+
 uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
                                  uint32_t cmpv, uint32_t newv,
                                  MemOpIdx oi, uintptr_t retaddr);
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index c4276767d1..e5f5b63c37 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -845,6 +845,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_ld_i128(TCGv_i128, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_st_i128(TCGv_i128, TCGv, TCGArg, MemOp);
 
 static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
 {
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4948729917..79101306a3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2187,6 +2187,64 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
     return cpu_load_helper(env, addr, oi, ra, helper_le_ldq_mmu);
 }
 
+Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+    uint64_t h, l;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_BE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_LOAD,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    h = helper_be_ldq_mmu(env, addr, new_oi, ra);
+    l = helper_be_ldq_mmu(env, addr + 8, new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return int128_make128(l, h);
+}
+
+Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+    uint64_t h, l;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_LE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_LOAD,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    l = helper_le_ldq_mmu(env, addr, new_oi, ra);
+    h = helper_le_ldq_mmu(env, addr + 8, new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    return int128_make128(l, h);
+}
+
 /*
  * Store Helpers
  */
@@ -2541,6 +2599,60 @@ void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     cpu_store_helper(env, addr, val, oi, retaddr, helper_le_stq_mmu);
 }
 
+void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_BE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    helper_be_stq_mmu(env, addr, int128_gethi(val), new_oi, ra);
+    helper_be_stq_mmu(env, addr + 8, int128_getlo(val), new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
+                     MemOpIdx oi, uintptr_t ra)
+{
+    MemOp mop = get_memop(oi);
+    int mmu_idx = get_mmuidx(oi);
+    MemOpIdx new_oi;
+    unsigned a_bits;
+
+    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) == (MO_LE|MO_128));
+    a_bits = get_alignment_bits(mop);
+
+    /* Handle CPU specific unaligned behaviour */
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
+                             mmu_idx, ra);
+    }
+
+    /* Construct an unaligned 64-bit replacement MemOpIdx. */
+    mop = (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
+    new_oi = make_memop_idx(mop, mmu_idx);
+
+    helper_le_stq_mmu(env, addr, int128_getlo(val), new_oi, ra);
+    helper_le_stq_mmu(env, addr + 8, int128_gethi(val), new_oi, ra);
+
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
 #include "ldst_common.c.inc"
 
 /*
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a8eb63ab96..ae67d84638 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1031,6 +1031,42 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
     return ret;
 }
 
+Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    Int128 ret;
+
+    validate_memop(oi, MO_128 | MO_BE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    memcpy(&ret, haddr, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+
+    if (!HOST_BIG_ENDIAN) {
+        ret = bswap128(ret);
+    }
+    return ret;
+}
+
+Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    Int128 ret;
+
+    validate_memop(oi, MO_128 | MO_LE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    memcpy(&ret, haddr, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+
+    if (HOST_BIG_ENDIAN) {
+        ret = bswap128(ret);
+    }
+    return ret;
+}
+
 void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
                  MemOpIdx oi, uintptr_t ra)
 {
@@ -1115,6 +1151,36 @@ void cpu_stq_le_mmu(CPUArchState *env, abi_ptr addr, uint64_t val,
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
+void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr,
+                     Int128 val, MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+
+    validate_memop(oi, MO_128 | MO_BE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    if (!HOST_BIG_ENDIAN) {
+        val = bswap128(val);
+    }
+    memcpy(haddr, &val, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
+void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr,
+                     Int128 val, MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+
+    validate_memop(oi, MO_128 | MO_LE);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE);
+    if (HOST_BIG_ENDIAN) {
+        val = bswap128(val);
+    }
+    memcpy(haddr, &val, 16);
+    clear_helper_retaddr();
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+}
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr ptr)
 {
     uint32_t ret;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 658cee7d6c..55ecedb66f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3107,6 +3107,140 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     }
 }
 
+static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
+{
+    MemOp mop_1 = orig, mop_2;
+
+    tcg_debug_assert((orig & MO_SIZE) == MO_128);
+    tcg_debug_assert((orig & MO_SIGN) == 0);
+
+    /* Use a memory ordering implemented by the host. */
+    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (orig & MO_BSWAP)) {
+        mop_1 &= ~MO_BSWAP;
+    }
+
+    /* Reduce the size to 64-bit. */
+    mop_1 = (mop_1 & ~MO_SIZE) | MO_64;
+
+    /* Retain the alignment constraints of the original. */
+    switch (orig & MO_AMASK) {
+    case MO_UNALN:
+    case MO_ALIGN_2:
+    case MO_ALIGN_4:
+        mop_2 = mop_1;
+        break;
+    case MO_ALIGN_8:
+        /* Prefer MO_ALIGN+MO_64 to MO_ALIGN_8+MO_64. */
+        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
+        mop_2 = mop_1;
+        break;
+    case MO_ALIGN:
+        /* Second has 8-byte alignment; first has 16-byte alignment. */
+        mop_2 = mop_1;
+        mop_1 = (mop_1 & ~MO_AMASK) | MO_ALIGN_16;
+        break;
+    case MO_ALIGN_16:
+    case MO_ALIGN_32:
+    case MO_ALIGN_64:
+        /* Second has 8-byte alignment; first retains original. */
+        mop_2 = (mop_1 & ~MO_AMASK) | MO_ALIGN;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    ret[0] = mop_1;
+    ret[1] = mop_2;
+}
+
+void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    MemOp mop[2];
+    TCGv addr_p8;
+    TCGv_i64 x, y;
+
+    canonicalize_memop_i128_as_i64(mop, memop);
+
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    addr = plugin_prep_mem_callbacks(addr);
+
+    /* TODO: respect atomicity of the operation. */
+    /* TODO: allow the tcg backend to see the whole operation. */
+
+    /*
+     * Since there are no global TCGv_i128, there is no visible state
+     * changed if the second load faults.  Load directly into the two
+     * subwords.
+     */
+    if ((memop & MO_BSWAP) == MO_LE) {
+        x = TCGV128_LOW(val);
+        y = TCGV128_HIGH(val);
+    } else {
+        x = TCGV128_HIGH(val);
+        y = TCGV128_LOW(val);
+    }
+
+    gen_ldst_i64(INDEX_op_qemu_ld_i64, x, addr, mop[0], idx);
+
+    if ((mop[0] ^ memop) & MO_BSWAP) {
+        tcg_gen_bswap64_i64(x, x);
+    }
+
+    addr_p8 = tcg_temp_new();
+    tcg_gen_addi_tl(addr_p8, addr, 8);
+    gen_ldst_i64(INDEX_op_qemu_ld_i64, y, addr_p8, mop[1], idx);
+    tcg_temp_free(addr_p8);
+
+    if ((mop[0] ^ memop) & MO_BSWAP) {
+        tcg_gen_bswap64_i64(y, y);
+    }
+
+    plugin_gen_mem_callbacks(addr, make_memop_idx(memop, idx),
+                             QEMU_PLUGIN_MEM_R);
+}
+
+void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
+{
+    MemOp mop[2];
+    TCGv addr_p8;
+    TCGv_i64 x, y;
+
+    canonicalize_memop_i128_as_i64(mop, memop);
+
+    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
+    addr = plugin_prep_mem_callbacks(addr);
+
+    /* TODO: respect atomicity of the operation. */
+    /* TODO: allow the tcg backend to see the whole operation. */
+
+    if ((memop & MO_BSWAP) == MO_LE) {
+        x = TCGV128_LOW(val);
+        y = TCGV128_HIGH(val);
+    } else {
+        x = TCGV128_HIGH(val);
+        y = TCGV128_LOW(val);
+    }
+
+    addr_p8 = tcg_temp_new();
+    if ((mop[0] ^ memop) & MO_BSWAP) {
+        TCGv_i64 t = tcg_temp_new_i64();
+
+        tcg_gen_bswap64_i64(t, x);
+        gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr, mop[0], idx);
+        tcg_gen_bswap64_i64(t, y);
+        tcg_gen_addi_tl(addr_p8, addr, 8);
+        gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr_p8, mop[1], idx);
+        tcg_temp_free_i64(t);
+    } else {
+        gen_ldst_i64(INDEX_op_qemu_st_i64, x, addr, mop[0], idx);
+        tcg_gen_addi_tl(addr_p8, addr, 8);
+        gen_ldst_i64(INDEX_op_qemu_st_i64, y, addr_p8, mop[1], idx);
+    }
+    tcg_temp_free(addr_p8);
+
+    plugin_gen_mem_callbacks(addr, make_memop_idx(memop, idx),
+                             QEMU_PLUGIN_MEM_W);
+}
+
 static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
 {
     switch (opc & MO_SSIZE) {
-- 
2.34.1


