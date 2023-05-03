Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aL-00061E-F6
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a3-00056o-0L
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zs-0005bP-3C
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso31678395e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097622; x=1685689622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwkXuUi47qVfBu99/RAr50vJCMSTIZ6BKHmogLuf/B8=;
 b=tLVqna7IvW8ErYi3Nv76yAK3NtvdcyzTpy7HU5OhImKrf1oGrsflX3rQPR7GDM3/It
 J3bl4mzqRksQx431PFiIZHQq7uOymtvsOM4Tz6eZZXTrJvnemZvs8gyka7HS5jZmKljx
 O2d6EzhNuQP0drqUhTnT+RFithrkFVOrQTth9a3mDMIpHflftBvwx/rLU0sfCF4JfON0
 qyLcRIBhFbz7XEhIx2YfpfL8ytDMh4W0xmamsIbRIc7vd879VtU+v1+aiizNhi9WO9U2
 kQnNmhMQi+8ud1+ApK3fy4lZ/wWv1+41FdN8P7TpZ6evl46s8K6dKNsLZVdNESlx8sn7
 o4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097622; x=1685689622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwkXuUi47qVfBu99/RAr50vJCMSTIZ6BKHmogLuf/B8=;
 b=NNoXPvpH8oocBHwN4Cj9A/7XYYMMz8aRabDaRXaSfYcxN6njtd7sqvqwxZWzcf0L/9
 NmrjurWEvSw+vYR6Szh/VK2nmUT+7w63QNXJDGj40GdtEkdkk9Mrnb3RLPOHj2gusRyk
 mB5jb+mJaOnl9DAzydfdacr58BO2lC3/vCOPwQLNtNo+tS6fjxQ3/NYRu61+4oVdSNhM
 fETrny2Nxwfi3/PBjNhKWOpvGHt6OmyOHA7c36bkstIyNwyGhpH6EKPyizK32uoejKp3
 jkglgz46pq+tN69GAHHt5sI0JjYPpQj+CJhB1psItNj5iDSmee3Wt9PwpruqAXTpU5JO
 fQcA==
X-Gm-Message-State: AC+VfDywTtrmtXgXJfNFA+q2LqXADPMkWgOcrpA46t2c1kB8le57YuD/
 +GnVVfIPXjvv59Q0eU0ed3SmHQ==
X-Google-Smtp-Source: ACHHUZ4+Dmih4DZi3/bWTGQgp2S2uZenqjrlFDsfNaaWSdRIuMKObAmVZJ7UmRVfyfZ1VXVbE4tauA==
X-Received: by 2002:a7b:c8c3:0:b0:3f1:6f53:7207 with SMTP id
 f3-20020a7bc8c3000000b003f16f537207mr13401800wml.17.1683097622372; 
 Wed, 03 May 2023 00:07:02 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
Date: Wed,  3 May 2023 08:06:05 +0100
Message-Id: <20230503070656.1746170-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:19 -0000

Create ldst_atomicity.c.inc.

Not required for user-only code loads, because we've ensured that
the page is read-only before beginning to translate code.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c             | 170 +++++++---
 accel/tcg/user-exec.c          |  26 +-
 accel/tcg/ldst_atomicity.c.inc | 550 +++++++++++++++++++++++++++++++++
 3 files changed, 695 insertions(+), 51 deletions(-)
 create mode 100644 accel/tcg/ldst_atomicity.c.inc

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f52c7e6da0..6f3a419fe8 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1668,6 +1668,9 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     return qemu_ram_addr_from_host_nofail(p);
 }
 
+/* Load/store with atomicity primitives. */
+#include "ldst_atomicity.c.inc"
+
 #ifdef CONFIG_PLUGIN
 /*
  * Perform a TLB lookup and populate the qemu_plugin_hwaddr structure.
@@ -2034,35 +2037,7 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
  * specifically for reading instructions from system memory. It is
  * called by the translation loop and in some helpers where the code
  * is disassembled. It shouldn't be called directly by guest code.
- */
-
-typedef uint64_t FullLoadHelper(CPUArchState *env, target_ulong addr,
-                                MemOpIdx oi, uintptr_t retaddr);
-
-static inline uint64_t QEMU_ALWAYS_INLINE
-load_memop(const void *haddr, MemOp op)
-{
-    switch (op) {
-    case MO_UB:
-        return ldub_p(haddr);
-    case MO_BEUW:
-        return lduw_be_p(haddr);
-    case MO_LEUW:
-        return lduw_le_p(haddr);
-    case MO_BEUL:
-        return (uint32_t)ldl_be_p(haddr);
-    case MO_LEUL:
-        return (uint32_t)ldl_le_p(haddr);
-    case MO_BEUQ:
-        return ldq_be_p(haddr);
-    case MO_LEUQ:
-        return ldq_le_p(haddr);
-    default:
-        qemu_build_not_reached();
-    }
-}
-
-/*
+ *
  * For the benefit of TCG generated code, we want to avoid the
  * complication of ABI-specific return type promotion and always
  * return a value extended to the register size of the host. This is
@@ -2118,17 +2093,134 @@ static uint64_t do_ld_bytes_beN(MMULookupPageData *p, uint64_t ret_be)
     return ret_be;
 }
 
+/**
+ * do_ld_parts_beN
+ * @p: translation parameters
+ * @ret_be: accumulated data
+ *
+ * As do_ld_bytes_beN, but atomically on each aligned part.
+ */
+static uint64_t do_ld_parts_beN(MMULookupPageData *p, uint64_t ret_be)
+{
+    void *haddr = p->haddr;
+    int size = p->size;
+
+    do {
+        uint64_t x;
+        int n;
+
+        /*
+         * Find minimum of alignment and size.
+         * This is slightly stronger than required by MO_ATOM_SUBALIGN, which
+         * would have only checked the low bits of addr|size once at the start,
+         * but is just as easy.
+         */
+        switch (((uintptr_t)haddr | size) & 7) {
+        case 4:
+            x = cpu_to_be32(load_atomic4(haddr));
+            ret_be = (ret_be << 32) | x;
+            n = 4;
+            break;
+        case 2:
+        case 6:
+            x = cpu_to_be16(load_atomic2(haddr));
+            ret_be = (ret_be << 16) | x;
+            n = 2;
+            break;
+        default:
+            x = *(uint8_t *)haddr;
+            ret_be = (ret_be << 8) | x;
+            n = 1;
+            break;
+        case 0:
+            g_assert_not_reached();
+        }
+        haddr += n;
+        size -= n;
+    } while (size != 0);
+    return ret_be;
+}
+
+/**
+ * do_ld_parts_be4
+ * @p: translation parameters
+ * @ret_be: accumulated data
+ *
+ * As do_ld_bytes_beN, but with one atomic load.
+ * Four aligned bytes are guaranteed to cover the load.
+ */
+static uint64_t do_ld_whole_be4(MMULookupPageData *p, uint64_t ret_be)
+{
+    int o = p->addr & 3;
+    uint32_t x = load_atomic4(p->haddr - o);
+
+    x = cpu_to_be32(x);
+    x <<= o * 8;
+    x >>= (4 - p->size) * 8;
+    return (ret_be << (p->size * 8)) | x;
+}
+
+/**
+ * do_ld_parts_be8
+ * @p: translation parameters
+ * @ret_be: accumulated data
+ *
+ * As do_ld_bytes_beN, but with one atomic load.
+ * Eight aligned bytes are guaranteed to cover the load.
+ */
+static uint64_t do_ld_whole_be8(CPUArchState *env, uintptr_t ra,
+                                MMULookupPageData *p, uint64_t ret_be)
+{
+    int o = p->addr & 7;
+    uint64_t x = load_atomic8_or_exit(env, ra, p->haddr - o);
+
+    x = cpu_to_be64(x);
+    x <<= o * 8;
+    x >>= (8 - p->size) * 8;
+    return (ret_be << (p->size * 8)) | x;
+}
+
 /*
  * Wrapper for the above.
  */
 static uint64_t do_ld_beN(CPUArchState *env, MMULookupPageData *p,
-                          uint64_t ret_be, int mmu_idx,
-                          MMUAccessType type, uintptr_t ra)
+                          uint64_t ret_be, int mmu_idx, MMUAccessType type,
+                          MemOp mop, uintptr_t ra)
 {
+    MemOp atmax;
+
     if (unlikely(p->flags & TLB_MMIO)) {
         return do_ld_mmio_beN(env, p, ret_be, mmu_idx, type, ra);
-    } else {
+    }
+
+    switch (mop & MO_ATOM_MASK) {
+    case MO_ATOM_WITHIN16:
+        /*
+         * It is a given that we cross a page and therefore there is no
+         * atomicity for the load as a whole, but there may be a subobject
+         * as defined by ATMAX which does not cross a 16-byte boundary.
+         */
+        atmax = mop & MO_ATMAX_MASK;
+        if (atmax == MO_ATMAX_SIZE) {
+            atmax = mop & MO_SIZE;
+        } else {
+            atmax >>= MO_ATMAX_SHIFT;
+        }
+        if (unlikely(p->size >= (1 << atmax))) {
+            if (!HAVE_al8_fast && p->size < 4) {
+                return do_ld_whole_be4(p, ret_be);
+            } else {
+                return do_ld_whole_be8(env, ra, p, ret_be);
+            }
+        }
+        /* fall through */
+    case MO_ATOM_IFALIGN:
+    case MO_ATOM_NONE:
         return do_ld_bytes_beN(p, ret_be);
+    case MO_ATOM_SUBALIGN:
+        return do_ld_parts_beN(p, ret_be);
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -2152,7 +2244,7 @@ static uint16_t do_ld_2(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
     }
 
     /* Perform the load host endian, then swap if necessary. */
-    ret = load_memop(p->haddr, MO_UW);
+    ret = load_atom_2(env, ra, p->haddr, memop);
     if (memop & MO_BSWAP) {
         ret = bswap16(ret);
     }
@@ -2169,7 +2261,7 @@ static uint32_t do_ld_4(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
     }
 
     /* Perform the load host endian. */
-    ret = load_memop(p->haddr, MO_UL);
+    ret = load_atom_4(env, ra, p->haddr, memop);
     if (memop & MO_BSWAP) {
         ret = bswap32(ret);
     }
@@ -2186,7 +2278,7 @@ static uint64_t do_ld_8(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
     }
 
     /* Perform the load host endian. */
-    ret = load_memop(p->haddr, MO_UQ);
+    ret = load_atom_8(env, ra, p->haddr, memop);
     if (memop & MO_BSWAP) {
         ret = bswap64(ret);
     }
@@ -2262,8 +2354,8 @@ static uint32_t do_ld4_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
         return do_ld_4(env, &l.page[0], l.mmu_idx, access_type, l.memop, ra);
     }
 
-    ret = do_ld_beN(env, &l.page[0], 0, l.mmu_idx, access_type, ra);
-    ret = do_ld_beN(env, &l.page[1], ret, l.mmu_idx, access_type, ra);
+    ret = do_ld_beN(env, &l.page[0], 0, l.mmu_idx, access_type, l.memop, ra);
+    ret = do_ld_beN(env, &l.page[1], ret, l.mmu_idx, access_type, l.memop, ra);
     if ((l.memop & MO_BSWAP) == MO_LE) {
         ret = bswap32(ret);
     }
@@ -2296,8 +2388,8 @@ static uint64_t do_ld8_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
         return do_ld_8(env, &l.page[0], l.mmu_idx, access_type, l.memop, ra);
     }
 
-    ret = do_ld_beN(env, &l.page[0], 0, l.mmu_idx, access_type, ra);
-    ret = do_ld_beN(env, &l.page[1], ret, l.mmu_idx, access_type, ra);
+    ret = do_ld_beN(env, &l.page[0], 0, l.mmu_idx, access_type, l.memop, ra);
+    ret = do_ld_beN(env, &l.page[1], ret, l.mmu_idx, access_type, l.memop, ra);
     if ((l.memop & MO_BSWAP) == MO_LE) {
         ret = bswap64(ret);
     }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fc597a010d..fefc83cc8c 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -931,6 +931,8 @@ static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
     return ret;
 }
 
+#include "ldst_atomicity.c.inc"
+
 uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr,
                     MemOpIdx oi, uintptr_t ra)
 {
@@ -953,10 +955,10 @@ uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_BEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = lduw_be_p(haddr);
+    ret = load_atom_2(env, ra, haddr, get_memop(oi));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
+    return cpu_to_be16(ret);
 }
 
 uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
@@ -967,10 +969,10 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_BEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = ldl_be_p(haddr);
+    ret = load_atom_4(env, ra, haddr, get_memop(oi));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
+    return cpu_to_be32(ret);
 }
 
 uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
@@ -981,10 +983,10 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_BEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = ldq_be_p(haddr);
+    ret = load_atom_8(env, ra, haddr, get_memop(oi));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
+    return cpu_to_be64(ret);
 }
 
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
@@ -995,10 +997,10 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_LEUW);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = lduw_le_p(haddr);
+    ret = load_atom_2(env, ra, haddr, get_memop(oi));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
+    return cpu_to_le16(ret);
 }
 
 uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
@@ -1009,10 +1011,10 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_LEUL);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = ldl_le_p(haddr);
+    ret = load_atom_4(env, ra, haddr, get_memop(oi));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
+    return cpu_to_le32(ret);
 }
 
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
@@ -1023,10 +1025,10 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
 
     validate_memop(oi, MO_LEUQ);
     haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
-    ret = ldq_le_p(haddr);
+    ret = load_atom_8(env, ra, haddr, get_memop(oi));
     clear_helper_retaddr();
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
+    return cpu_to_le64(ret);
 }
 
 Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
new file mode 100644
index 0000000000..5169073431
--- /dev/null
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -0,0 +1,550 @@
+/*
+ * Routines common to user and system emulation of load/store.
+ *
+ *  Copyright (c) 2022 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifdef CONFIG_ATOMIC64
+# define HAVE_al8          true
+#else
+# define HAVE_al8          false
+#endif
+#define HAVE_al8_fast      (ATOMIC_REG_SIZE >= 8)
+
+#if defined(CONFIG_ATOMIC128)
+# define HAVE_al16_fast    true
+#else
+# define HAVE_al16_fast    false
+#endif
+
+/**
+ * required_atomicity:
+ *
+ * Return the lg2 bytes of atomicity required by @memop for @p.
+ * If the operation must be split into two operations to be
+ * examined separately for atomicity, return -lg2.
+ */
+static int required_atomicity(CPUArchState *env, uintptr_t p, MemOp memop)
+{
+    int atmax = memop & MO_ATMAX_MASK;
+    int size = memop & MO_SIZE;
+    unsigned tmp;
+
+    if (atmax == MO_ATMAX_SIZE) {
+        atmax = size;
+    } else {
+        atmax >>= MO_ATMAX_SHIFT;
+    }
+
+    switch (memop & MO_ATOM_MASK) {
+    case MO_ATOM_IFALIGN:
+        tmp = (1 << atmax) - 1;
+        if (p & tmp) {
+            return MO_8;
+        }
+        break;
+    case MO_ATOM_NONE:
+        return MO_8;
+    case MO_ATOM_SUBALIGN:
+        tmp = p & -p;
+        if (tmp != 0 && tmp < atmax) {
+            atmax = tmp;
+        }
+        break;
+    case MO_ATOM_WITHIN16:
+        tmp = p & 15;
+        if (tmp + (1 << size) <= 16) {
+            atmax = size;
+        } else if (atmax == size) {
+            return MO_8;
+        } else if (tmp + (1 << atmax) != 16) {
+            /*
+             * Paired load/store, where the pairs aren't aligned.
+             * One of the two must still be handled atomically.
+             */
+            atmax = -atmax;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * Here we have the architectural atomicity of the operation.
+     * However, when executing in a serial context, we need no extra
+     * host atomicity in order to avoid racing.  This reduction
+     * avoids looping with cpu_loop_exit_atomic.
+     */
+    if (cpu_in_serial_context(env_cpu(env))) {
+        return MO_8;
+    }
+    return atmax;
+}
+
+/**
+ * load_atomic2:
+ * @pv: host address
+ *
+ * Atomically load 2 aligned bytes from @pv.
+ */
+static inline uint16_t load_atomic2(void *pv)
+{
+    uint16_t *p = __builtin_assume_aligned(pv, 2);
+    return qatomic_read(p);
+}
+
+/**
+ * load_atomic4:
+ * @pv: host address
+ *
+ * Atomically load 4 aligned bytes from @pv.
+ */
+static inline uint32_t load_atomic4(void *pv)
+{
+    uint32_t *p = __builtin_assume_aligned(pv, 4);
+    return qatomic_read(p);
+}
+
+/**
+ * load_atomic8:
+ * @pv: host address
+ *
+ * Atomically load 8 aligned bytes from @pv.
+ */
+static inline uint64_t load_atomic8(void *pv)
+{
+    uint64_t *p = __builtin_assume_aligned(pv, 8);
+
+    qemu_build_assert(HAVE_al8);
+    return qatomic_read__nocheck(p);
+}
+
+/**
+ * load_atomic16:
+ * @pv: host address
+ *
+ * Atomically load 16 aligned bytes from @pv.
+ */
+static inline Int128 load_atomic16(void *pv)
+{
+#ifdef CONFIG_ATOMIC128
+    __uint128_t *p = __builtin_assume_aligned(pv, 16);
+    Int128Alias r;
+
+    r.u = qatomic_read__nocheck(p);
+    return r.s;
+#else
+    qemu_build_not_reached();
+#endif
+}
+
+/**
+ * load_atomic8_or_exit:
+ * @env: cpu context
+ * @ra: host unwind address
+ * @pv: host address
+ *
+ * Atomically load 8 aligned bytes from @pv.
+ * If this is not possible, longjmp out to restart serially.
+ */
+static uint64_t load_atomic8_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
+{
+    if (HAVE_al8) {
+        return load_atomic8(pv);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * If the page is not writable, then assume the value is immutable
+     * and requires no locking.  This ignores the case of MAP_SHARED with
+     * another process, because the fallback start_exclusive solution
+     * provides no protection across processes.
+     */
+    if (!page_check_range(h2g(pv), 8, PAGE_WRITE)) {
+        uint64_t *p = __builtin_assume_aligned(pv, 8);
+        return *p;
+    }
+#endif
+
+    /* Ultimate fallback: re-execute in serial context. */
+    cpu_loop_exit_atomic(env_cpu(env), ra);
+}
+
+/**
+ * load_atomic16_or_exit:
+ * @env: cpu context
+ * @ra: host unwind address
+ * @pv: host address
+ *
+ * Atomically load 16 aligned bytes from @pv.
+ * If this is not possible, longjmp out to restart serially.
+ */
+static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
+{
+    Int128 *p = __builtin_assume_aligned(pv, 16);
+
+    if (HAVE_al16_fast) {
+        return load_atomic16(p);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * We can only use cmpxchg to emulate a load if the page is writable.
+     * If the page is not writable, then assume the value is immutable
+     * and requires no locking.  This ignores the case of MAP_SHARED with
+     * another process, because the fallback start_exclusive solution
+     * provides no protection across processes.
+     */
+    if (!page_check_range(h2g(p), 16, PAGE_WRITE)) {
+        return *p;
+    }
+#endif
+
+    /*
+     * In system mode all guest pages are writable, and for user-only
+     * we have just checked writability.  Try cmpxchg.
+     */
+#if defined(CONFIG_CMPXCHG128)
+    /* Swap 0 with 0, with the side-effect of returning the old value. */
+    {
+        Int128Alias r;
+        r.u = __sync_val_compare_and_swap_16((__uint128_t *)p, 0, 0);
+        return r.s;
+    }
+#endif
+
+    /* Ultimate fallback: re-execute in serial context. */
+    cpu_loop_exit_atomic(env_cpu(env), ra);
+}
+
+/**
+ * load_atom_extract_al4x2:
+ * @pv: host address
+ *
+ * Load 4 bytes from @p, from two sequential atomic 4-byte loads.
+ */
+static uint32_t load_atom_extract_al4x2(void *pv)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int sh = (pi & 3) * 8;
+    uint32_t a, b;
+
+    pv = (void *)(pi & ~3);
+    a = load_atomic4(pv);
+    b = load_atomic4(pv + 4);
+
+    if (HOST_BIG_ENDIAN) {
+        return (a << sh) | (b >> (-sh & 31));
+    } else {
+        return (a >> sh) | (b << (-sh & 31));
+    }
+}
+
+/**
+ * load_atom_extract_al8x2:
+ * @pv: host address
+ *
+ * Load 8 bytes from @p, from two sequential atomic 8-byte loads.
+ */
+static uint64_t load_atom_extract_al8x2(void *pv)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int sh = (pi & 7) * 8;
+    uint64_t a, b;
+
+    pv = (void *)(pi & ~7);
+    a = load_atomic8(pv);
+    b = load_atomic8(pv + 8);
+
+    if (HOST_BIG_ENDIAN) {
+        return (a << sh) | (b >> (-sh & 63));
+    } else {
+        return (a >> sh) | (b << (-sh & 63));
+    }
+}
+
+/**
+ * load_atom_extract_al8_or_exit:
+ * @env: cpu context
+ * @ra: host unwind address
+ * @pv: host address
+ * @s: object size in bytes, @s <= 4.
+ *
+ * Atomically load @s bytes from @p, when p % s != 0, and [p, p+s-1] does
+ * not cross an 8-byte boundary.  This means that we can perform an atomic
+ * 8-byte load and extract.
+ * The value is returned in the low bits of a uint32_t.
+ */
+static uint32_t load_atom_extract_al8_or_exit(CPUArchState *env, uintptr_t ra,
+                                              void *pv, int s)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int o = pi & 7;
+    int shr = (HOST_BIG_ENDIAN ? 8 - s - o : o) * 8;
+
+    pv = (void *)(pi & ~7);
+    return load_atomic8_or_exit(env, ra, pv) >> shr;
+}
+
+/**
+ * load_atom_extract_al16_or_exit:
+ * @env: cpu context
+ * @ra: host unwind address
+ * @p: host address
+ * @s: object size in bytes, @s <= 8.
+ *
+ * Atomically load @s bytes from @p, when p % 16 < 8
+ * and p % 16 + s > 8.  I.e. does not cross a 16-byte
+ * boundary, but *does* cross an 8-byte boundary.
+ * This is the slow version, so we must have eliminated
+ * any faster load_atom_extract_al8_or_exit case.
+ *
+ * If this is not possible, longjmp out to restart serially.
+ */
+static uint64_t load_atom_extract_al16_or_exit(CPUArchState *env, uintptr_t ra,
+                                               void *pv, int s)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int o = pi & 7;
+    int shr = (HOST_BIG_ENDIAN ? 16 - s - o : o) * 8;
+    Int128 r;
+
+    /*
+     * Note constraints above: p & 8 must be clear.
+     * Provoke SIGBUS if possible otherwise.
+     */
+    pv = (void *)(pi & ~7);
+    r = load_atomic16_or_exit(env, ra, pv);
+
+    r = int128_urshift(r, shr);
+    return int128_getlo(r);
+}
+
+/**
+ * load_atom_extract_al16_or_al8:
+ * @p: host address
+ * @s: object size in bytes, @s <= 8.
+ *
+ * Load @s bytes from @p, when p % s != 0.  If [p, p+s-1] does not
+ * cross an 16-byte boundary then the access must be 16-byte atomic,
+ * otherwise the access must be 8-byte atomic.
+ */
+static inline uint64_t load_atom_extract_al16_or_al8(void *pv, int s)
+{
+#if defined(CONFIG_ATOMIC128)
+    uintptr_t pi = (uintptr_t)pv;
+    int o = pi & 7;
+    int shr = (HOST_BIG_ENDIAN ? 16 - s - o : o) * 8;
+    __uint128_t r;
+
+    pv = (void *)(pi & ~7);
+    if (pi & 8) {
+        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
+        uint64_t a = qatomic_read__nocheck(p8);
+        uint64_t b = qatomic_read__nocheck(p8 + 1);
+
+        if (HOST_BIG_ENDIAN) {
+            r = ((__uint128_t)a << 64) | b;
+        } else {
+            r = ((__uint128_t)b << 64) | a;
+        }
+    } else {
+        __uint128_t *p16 = __builtin_assume_aligned(pv, 16, 0);
+        r = qatomic_read__nocheck(p16);
+    }
+    return r >> shr;
+#else
+    qemu_build_not_reached();
+#endif
+}
+
+/**
+ * load_atom_4_by_2:
+ * @pv: host address
+ *
+ * Load 4 bytes from @pv, with two 2-byte atomic loads.
+ */
+static inline uint32_t load_atom_4_by_2(void *pv)
+{
+    uint32_t a = load_atomic2(pv);
+    uint32_t b = load_atomic2(pv + 2);
+
+    if (HOST_BIG_ENDIAN) {
+        return (a << 16) | b;
+    } else {
+        return (b << 16) | a;
+    }
+}
+
+/**
+ * load_atom_8_by_2:
+ * @pv: host address
+ *
+ * Load 8 bytes from @pv, with four 2-byte atomic loads.
+ */
+static inline uint64_t load_atom_8_by_2(void *pv)
+{
+    uint32_t a = load_atom_4_by_2(pv);
+    uint32_t b = load_atom_4_by_2(pv + 4);
+
+    if (HOST_BIG_ENDIAN) {
+        return ((uint64_t)a << 32) | b;
+    } else {
+        return ((uint64_t)b << 32) | a;
+    }
+}
+
+/**
+ * load_atom_8_by_4:
+ * @pv: host address
+ *
+ * Load 8 bytes from @pv, with two 4-byte atomic loads.
+ */
+static inline uint64_t load_atom_8_by_4(void *pv)
+{
+    uint32_t a = load_atomic4(pv);
+    uint32_t b = load_atomic4(pv + 4);
+
+    if (HOST_BIG_ENDIAN) {
+        return ((uint64_t)a << 32) | b;
+    } else {
+        return ((uint64_t)b << 32) | a;
+    }
+}
+
+/**
+ * load_atom_2:
+ * @p: host address
+ * @memop: the full memory op
+ *
+ * Load 2 bytes from @p, honoring the atomicity of @memop.
+ */
+static uint16_t load_atom_2(CPUArchState *env, uintptr_t ra,
+                            void *pv, MemOp memop)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int atmax;
+
+    if (likely((pi & 1) == 0)) {
+        return load_atomic2(pv);
+    }
+    if (HAVE_al16_fast) {
+        return load_atom_extract_al16_or_al8(pv, 2);
+    }
+
+    atmax = required_atomicity(env, pi, memop);
+    switch (atmax) {
+    case MO_8:
+        return lduw_he_p(pv);
+    case MO_16:
+        /* The only case remaining is MO_ATOM_WITHIN16. */
+        if (!HAVE_al8_fast && (pi & 3) == 1) {
+            /* Big or little endian, we want the middle two bytes. */
+            return load_atomic4(pv - 1) >> 8;
+        }
+        if (unlikely((pi & 15) != 7)) {
+            return load_atom_extract_al8_or_exit(env, ra, pv, 2);
+        }
+        return load_atom_extract_al16_or_exit(env, ra, pv, 2);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/**
+ * load_atom_4:
+ * @p: host address
+ * @memop: the full memory op
+ *
+ * Load 4 bytes from @p, honoring the atomicity of @memop.
+ */
+static uint32_t load_atom_4(CPUArchState *env, uintptr_t ra,
+                            void *pv, MemOp memop)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int atmax;
+
+    if (likely((pi & 3) == 0)) {
+        return load_atomic4(pv);
+    }
+    if (HAVE_al16_fast) {
+        return load_atom_extract_al16_or_al8(pv, 4);
+    }
+
+    atmax = required_atomicity(env, pi, memop);
+    switch (atmax) {
+    case MO_8:
+    case MO_16:
+    case -MO_16:
+        /*
+         * For MO_ATOM_IFALIGN, this is more atomicity than required,
+         * but it's trivially supported on all hosts, better than 4
+         * individual byte loads (when the host requires alignment),
+         * and overlaps with the MO_ATOM_SUBALIGN case of p % 2 == 0.
+         */
+        return load_atom_extract_al4x2(pv);
+    case MO_32:
+        if (!(pi & 4)) {
+            return load_atom_extract_al8_or_exit(env, ra, pv, 4);
+        }
+        return load_atom_extract_al16_or_exit(env, ra, pv, 4);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/**
+ * load_atom_8:
+ * @p: host address
+ * @memop: the full memory op
+ *
+ * Load 8 bytes from @p, honoring the atomicity of @memop.
+ */
+static uint64_t load_atom_8(CPUArchState *env, uintptr_t ra,
+                            void *pv, MemOp memop)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    int atmax;
+
+    /*
+     * If the host does not support 8-byte atomics, wait until we have
+     * examined the atomicity parameters below.
+     */
+    if (HAVE_al8 && likely((pi & 7) == 0)) {
+        return load_atomic8(pv);
+    }
+    if (HAVE_al16_fast) {
+        return load_atom_extract_al16_or_al8(pv, 8);
+    }
+
+    atmax = required_atomicity(env, pi, memop);
+    if (atmax == MO_64) {
+        if (!HAVE_al8 && (pi & 7) == 0) {
+            load_atomic8_or_exit(env, ra, pv);
+        }
+        return load_atom_extract_al16_or_exit(env, ra, pv, 8);
+    }
+    if (HAVE_al8_fast) {
+        return load_atom_extract_al8x2(pv);
+    }
+    switch (atmax) {
+    case MO_8:
+        return ldq_he_p(pv);
+    case MO_16:
+        return load_atom_8_by_2(pv);
+    case MO_32:
+        return load_atom_8_by_4(pv);
+    case -MO_32:
+        if (HAVE_al8) {
+            return load_atom_extract_al8x2(pv);
+        }
+        cpu_loop_exit_atomic(env_cpu(env), ra);
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


