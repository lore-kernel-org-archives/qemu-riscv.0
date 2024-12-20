Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD1E77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 12:21:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOc0c-0002mi-5M; Fri, 20 Dec 2024 07:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tOc0Y-0002lr-3H
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 07:21:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tOc0W-0006Nl-A7
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 07:21:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so1065676f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Dec 2024 04:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1734697287; x=1735302087; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w72ka0LDvMp+IR5mfDOsJFBeSApvq+7moVWb2aRwtAo=;
 b=TNMiWYyWQcMkaSIJ6HxZzd9qVuVtFsMIZgrfb8WFYc7tATZVb9DK0wCBrpS+GYx2e5
 vYHx148O0NPVXyFkzDuzIvHTaRkKLnazHomOJLydaUDQRbock0gQb6sPsJLg4XbuTQyy
 LSSHpkEcRjuf569xMhB/7qUTQE5Y7c70CsIyUWxHsSEM1mvTDTqQDBS9wTDgpHwhjJlW
 gOGVXsckfTRvk8nq7g8iSMSQUzAsfL9eja+0i0x/bCDZBLdspuJieEHVyI4VtomLijd7
 rahQ9lZnDWczkMhKvTroaVACjicBQ0v9O6xbuCctqOSCaJAiJpSR78vnXtOzaRT+DhKI
 f9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734697287; x=1735302087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w72ka0LDvMp+IR5mfDOsJFBeSApvq+7moVWb2aRwtAo=;
 b=bsqMJ9bN6MiCcH4gOz300E8+G6GSn9Vgd5LhvADNWFWnzjHqlaUgyZGvUdbHDGY9TC
 o/K00Z4glGwKYJ+rHohHb+F/9pFaDCpbe2jawsLBPlOv2R7ae/ZhgMP2ndPth4HllTh+
 QmdokJaHr9tVhykVAHPL5/rnWtmptVBoW8sMR8G4SHMtNJcag6J+ZT+6xKzgel7zobY1
 rUuXsrvTDvrxjVlvBagE42XBR9CibF7oHSDYWKq+RuSbBXwjlN+0RbQ1fG6Gx6Cpp0zP
 eOnn3nkRjnw+Ij024Xhz1JVdZdhOWZsru/eRXzyE/XvnzK+CgqcAAi3nHeLfniQggO7n
 h/lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv5S9Fp5SKuobUXAleAfeYQZWpb6tNavxspGUPtButkrYtYs9xhUnCkby9tVRFy4ZMb729Van/GIqo@nongnu.org
X-Gm-Message-State: AOJu0Ywk58zD6FUSXlKuUXwwW/GH+bvx6eQ0Y4EZ6u2oaT++bWNmx/dT
 oz6UUjpLxpbQWS1xdUosXCs5bfQ+hiWz/L7G1wOR4nrf1WND4gXXhZNSAw7Cx8Q=
X-Gm-Gg: ASbGncstyTBMnlbEMlqj72WQigVGrAaVVXW/BuTAQXDA7/vgWqiSTL26ZRYyJjrMqOo
 1imDxvMtCW3gejgkJyEvwlzXbFFwc/VrdXhvUE3TvmXLKsP8NJxTT0SeuIUB9Y55tI+fwzOgbaT
 wQbbkfu76g9Q9qXWUHZ3SCimyD/FjqlOHHBsuXgQ/6ZxGVWHeQ50I4EJuNu3ys4FvF9t0eabJ14
 kAjN/hWdt9mhCFz7HKRga+BrZGtb51pe+381X9aPtO4QKwQAHkB1b7JDjhE4vL5OuQjgXgNCy2Z
 roNQlW2YzvKvdLIhUY86eHRem7yqzhyjZKmiCdASPVdLzAVi
X-Google-Smtp-Source: AGHT+IElR/OwE68usWhDk+HWZV0Lct7k1tHkhSaV7EBx6KJMwBa2SQy2N2zFZ9JGF18R1i0eU/CajA==
X-Received: by 2002:a5d:584b:0:b0:386:373f:47c4 with SMTP id
 ffacd0b85a97d-38a224053d8mr2550675f8f.49.1734697285189; 
 Fri, 20 Dec 2024 04:21:25 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289e0fsm44903785e9.39.2024.12.20.04.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 04:21:24 -0800 (PST)
From: Craig Blackmore <craig.blackmore@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Craig Blackmore <craig.blackmore@embecosm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
Subject: [PATCH v7 1/1] target/riscv: rvv: Use wider accesses for unit stride
 load/store
Date: Fri, 20 Dec 2024 12:21:09 +0000
Message-ID: <20241220122109.2083215-2-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220122109.2083215-1-craig.blackmore@embecosm.com>
References: <20241220122109.2083215-1-craig.blackmore@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Use atomic load/store functions to access multiple elements from host.

Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>

Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
---
 target/riscv/vector_helper.c | 107 +++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a85dd1d200..c0179165ce 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -206,10 +206,102 @@ vext_continus_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
     }
 }
 
+#if !HOST_BIG_ENDIAN
+/* Atomic operations for load/store */
+
+/*
+ * Return true if there are enough elements for this size access and the
+ * pointer is aligned to the required atomicity.
+ */
+
+static inline QEMU_ALWAYS_INLINE bool
+ok_for_atomic(uint32_t size, void *host, uint32_t reg_start, uint32_t evl,
+              uint32_t log2_esz)
+{
+    return (reg_start + (size >> log2_esz)) <= evl
+            && ((uintptr_t) host % size) == 0;
+}
+
+#define GEN_VEXT_LDST_ATOMIC_HOST(SIZE, TYPE)                             \
+static inline QEMU_ALWAYS_INLINE void                                     \
+vext_ldst_atom_##SIZE##_host(void *vd, uint32_t byte_offset, TYPE *host,  \
+                             bool is_load)                                \
+{                                                                         \
+    TYPE *vd_ptr = (TYPE *) (vd + byte_offset);                           \
+    if (is_load) {                                                        \
+        *vd_ptr = qatomic_read__nocheck(host);                            \
+    } else {                                                              \
+        qatomic_set__nocheck(host, *vd_ptr);                              \
+    }                                                                     \
+}                                                                         \
+
+GEN_VEXT_LDST_ATOMIC_HOST(2, uint16_t)
+GEN_VEXT_LDST_ATOMIC_HOST(4, uint32_t)
+#ifdef CONFIG_ATOMIC64
+GEN_VEXT_LDST_ATOMIC_HOST(8, uint64_t)
+#endif
+
+#ifdef CONFIG_INT128_TYPE
+static inline QEMU_ALWAYS_INLINE void
+vext_ldst_atom_16_host(void *vd, uint32_t byte_offset, Int128 *host,
+                       bool is_load)
+{
+    Int128 *vd_ptr = (Int128 *) (vd + byte_offset);
+    if (is_load) {
+        *vd_ptr = atomic16_read_ro(host);
+    } else {
+        atomic16_set(host, *vd_ptr);
+    }
+}
+#endif
+#endif
+
+/* Perform the largest atomic load/store possible for the evl and alignment.  */
+
+static inline QEMU_ALWAYS_INLINE uint32_t
+vext_ldst_atomic_chunk_host(CPURISCVState *env,
+                            vext_ldst_elem_fn_host *ldst_host,
+                            void *vd, uint32_t evl, uint32_t reg_start,
+                            void *host, uint32_t esz, bool is_load,
+                            uint32_t log2_esz)
+{
+#if !HOST_BIG_ENDIAN
+    uint32_t byte_offset = reg_start * esz;
+
+#ifdef CONFIG_INT128_TYPE
+    if (((is_load && HAVE_ATOMIC128_RO) || (!is_load && HAVE_ATOMIC128_RW))
+        && ok_for_atomic(16, host, reg_start, evl, log2_esz)) {
+        vext_ldst_atom_16_host(vd, byte_offset, host, is_load);
+        return 16;
+    }
+#endif
+
+#ifdef CONFIG_ATOMIC64
+    if (ok_for_atomic(8, host, reg_start, evl, log2_esz)) {
+        vext_ldst_atom_8_host(vd, byte_offset, host, is_load);
+        return 8;
+    }
+#endif
+
+    if (ok_for_atomic(4, host, reg_start, evl, log2_esz)) {
+        vext_ldst_atom_4_host(vd, byte_offset, host, is_load);
+        return 4;
+    }
+
+    if (ok_for_atomic(2, host, reg_start, evl, log2_esz)) {
+        vext_ldst_atom_2_host(vd, byte_offset, host, is_load);
+        return 2;
+    }
+#endif
+
+    ldst_host(vd, reg_start, host);
+    return 1;
+}
+
 static inline QEMU_ALWAYS_INLINE void
 vext_continus_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
                         void *vd, uint32_t evl, uint32_t reg_start, void *host,
-                        uint32_t esz, bool is_load)
+                        uint32_t esz, bool is_load, uint32_t log2_esz)
 {
 #if HOST_BIG_ENDIAN
     for (; reg_start < evl; reg_start++, host += esz) {
@@ -225,10 +317,13 @@ vext_continus_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
         } else {
             memcpy(host, vd + byte_offset, size);
         }
-    } else {
-        for (; reg_start < evl; reg_start++, host += esz) {
-            ldst_host(vd, reg_start, host);
-        }
+        return;
+    }
+    uint32_t chunk = 0;
+    for (; reg_start < evl; reg_start += (chunk >> log2_esz),
+                            host += chunk) {
+        chunk = vext_ldst_atomic_chunk_host(env, ldst_host, vd, evl, reg_start,
+                                            host, esz, is_load, log2_esz);
     }
 #endif
 }
@@ -343,7 +438,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     if (flags == 0) {
         if (nf == 1) {
             vext_continus_ldst_host(env, ldst_host, vd, evl, env->vstart, host,
-                                    esz, is_load);
+                                    esz, is_load, log2_esz);
         } else {
             for (i = env->vstart; i < evl; ++i) {
                 k = 0;
-- 
2.43.0


