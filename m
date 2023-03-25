Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2dF-0001KH-0w
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2dB-0001JG-J9
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:04:21 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2d8-0005Sb-UN
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:04:21 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5416698e889so82893967b3.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onbesb8ouykkYe8UFD25WNQYOxkMjhDNVi3Wh3XpRP0=;
 b=pSH70tyx9IAVkzz5aqpzlbpBsKmc8zDlohOrHFASUUDp84U0ncBFV3F2sPrOju4DdJ
 GaNcAvQrFPUu6Dehk3yFlPh1bjpHKNZnU26Q80gcg6bXsfGaEbZlyALI37XBo3RYCA0B
 hJtvX9nFi6xnkkPkVFbwUH75Su3mDjybrgE/cJq0K7ry7kowuTBIAJ37GsMsYhdAh7uQ
 xC8HNwTevuEE2sH/Ju8GnOWy5mvlm5sW/JXBZEfaDHPvRfGlfaE48EeIANofYcXKAqGH
 zghbwHtQFczyIMcYZ4bHgUlzaJ0276CmkDslwYb6WhMJFkaqQUx4obxvVrrAsV2frIx0
 jr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onbesb8ouykkYe8UFD25WNQYOxkMjhDNVi3Wh3XpRP0=;
 b=UQbXyp5SxtIJBLFY0+npbST5gUm9EuzOSh3/lOdm3M2ThM2GyjuDiDKmMt87H7p6ok
 9gRHTOKbMo+T0kmvFqUBFL/qtJSBbUOFZo1lNIbK712uCkokXxMmAfEialA9Q+LtOAlD
 H1MereToruNmWTKJ/kdcf6EpOFCvDgMa4nceaeOwkXdtDi1UiF/eDIBGyIvb9i1PNvuQ
 2dph/CHJh+Q2WC3D/5Fvp2DtMgEoQ2i3hXmiwQEfJPpcuGC8Am0ZK2v0sPQicp+oaooS
 fD7OGXvuyY4HxrYGLMe19Wowoe7cFVpIpBxfydjrwH2F4gjal/jqbytnIfVHfWmQ4cEQ
 LzdA==
X-Gm-Message-State: AAQBX9ct2I3cW+G1vlKDSVHoDNKIP/9znEpqX138kOD6WIJO9Bf5TnbY
 G/jNFlPW/VOL7XwjHp03q56wJRE4VP62GipISco=
X-Google-Smtp-Source: AKy350YtDbkm9in6FCTcq6re+oZ8x9NGvS0V+tOwfXD+gZ3qqP0eLmVcEB3Vur3E1qVF5UThaoaHqg==
X-Received: by 2002:a17:90a:4c:b0:23b:3b26:c612 with SMTP id
 12-20020a17090a004c00b0023b3b26c612mr5457198pjb.20.1679741677863; 
 Sat, 25 Mar 2023 03:54:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 08/25] accel/tcg: Add cpu_ld*_code_mmu
Date: Sat, 25 Mar 2023 03:54:12 -0700
Message-Id: <20230325105429.1142530-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1136.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 12:04:21 -0000

At least RISC-V has the need to be able to perform a read
using execute permissions, outside of translation.
Add helpers to facilitate this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  9 +++++++
 accel/tcg/cputlb.c      | 48 ++++++++++++++++++++++++++++++++++
 accel/tcg/user-exec.c   | 58 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 09b55cc0ee..c141f0394f 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -445,6 +445,15 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
 # define cpu_stq_mmu          cpu_stq_le_mmu
 #endif
 
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t ra);
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra);
+
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr);
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..e62c8f3c3f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2768,3 +2768,51 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
     MemOpIdx oi = make_memop_idx(MO_TEUQ, cpu_mmu_index(env, true));
     return full_ldq_code(env, addr, oi, 0);
 }
+
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t retaddr)
+{
+    return full_ldub_code(env, addr, oi, retaddr);
+}
+
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint16_t ret;
+
+    ret = full_lduw_code(env, addr, make_memop_idx(MO_TEUW, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint32_t ret;
+
+    ret = full_ldl_code(env, addr, make_memop_idx(MO_TEUL, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t retaddr)
+{
+    MemOp mop = get_memop(oi);
+    int idx = get_mmuidx(oi);
+    uint64_t ret;
+
+    ret = full_ldq_code(env, addr, make_memop_idx(MO_TEUQ, idx), retaddr);
+    if ((mop & MO_BSWAP) != MO_TE) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7b37fd229e..44e0ea55ba 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1222,6 +1222,64 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
     return ret;
 }
 
+uint8_t cpu_ldb_code_mmu(CPUArchState *env, abi_ptr addr,
+                         MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint8_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = ldub_p(haddr);
+    clear_helper_retaddr();
+    return ret;
+}
+
+uint16_t cpu_ldw_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint16_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = lduw_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+uint32_t cpu_ldl_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint32_t ret;
+
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_INST_FETCH);
+    ret = ldl_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+uint64_t cpu_ldq_code_mmu(CPUArchState *env, abi_ptr addr,
+                          MemOpIdx oi, uintptr_t ra)
+{
+    void *haddr;
+    uint64_t ret;
+
+    validate_memop(oi, MO_BEUQ);
+    haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
+    ret = ldq_p(haddr);
+    clear_helper_retaddr();
+    if (get_memop(oi) & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
 #include "ldst_common.c.inc"
 
 /*
-- 
2.34.1


