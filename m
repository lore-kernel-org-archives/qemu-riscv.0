Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE4C3DA42
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:40:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU4tB-0001Vx-PQ; Wed, 17 Jul 2024 09:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sU4t9-0001Lp-DI
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 09:40:11 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sU4sz-0007Tr-B5
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 09:40:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-71871d5e087so4923361a12.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721223600; x=1721828400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YXRnQrR7vltoXSYXHi7IhAgNjpxq9maTne8vi5kmaO0=;
 b=TobRxArKJEkOB3Lwmfv4UXNmkO92uBIZqpXywTZcjWz0iscPFK2liWi0jQpPy3IEiD
 n5eJVwsMYreTdVi9RVHfq2llzTkAHfT9TIYeADWV+VEAXZFhtpYakBh4cwsEFoXCF8HR
 vMcsJLfeJi+IjlGmWJtGhMLQ4rdT69iVknW6HPUNuEKuS8uzV9q7zo0DjC1He5CE5FwM
 2IifLDb3qyL/ORGcK5QjsbhdfGQdrCj/SvqRl0RIkr5P83pONRphsA/JIMAJd6J1tJBD
 ed9glj/W189Ipu/OPVwsGcY6liXvELIofNTscHYufyHp6ipqpkPLlgmqXwQ/DcjMp4+J
 eooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721223600; x=1721828400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YXRnQrR7vltoXSYXHi7IhAgNjpxq9maTne8vi5kmaO0=;
 b=pPB0gJsmMwre8MO3EUc1qPSJqlnQESQHiIhy77UDJ7PUCysJNKeHTIcjs0cPkXo0PP
 q1zAuUigORf2neAUkcXGJGHNq2igRHGHjn6h3VrMpQKHwkEheUiZeVFR6ZEFrJ31yMn5
 s/hj2XV1+zPY/yPQlb9vdrZSVY/DRDVPj1ZS29mWDp9y9PqH0YWEDBNpz72x5hDegmhy
 lSm7jVrnhUYOPp4FMP+rOEWTywDSMLo16e7bb24qlj11PxpTGPdgrob3f2WlFwX4S+/n
 DyfLzQ01zKKfcc+GXpw+3iAhYXZrEIo4797mkgbprm55Ht1SfodtgR/9iT0T+IqOk4iQ
 i6iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY8NKoRsoEc7aHmUZR1N1T2s/QAPkKvpK7Cii3aKqe02LOsS53t1n+YY3PNUSafJqvN91nUieFZo9CUX4huQtvhA6blWw=
X-Gm-Message-State: AOJu0YwI1TEvwGlV7bDbUu0O7lkpEu1m/u3FEAly+b/fOUmbKDouSTkG
 pPicgvedU2lZtNmW5bcoaWuO0s69e+ysW9psgSea1VCA/EREX9oo6bGc5jLNWvI=
X-Google-Smtp-Source: AGHT+IEhFYiPKAJcmMHCQiAv/RxC9Qf0bgVvf4GhEV0jMHuHpRo9DU2lJ6A2ptelZafr7Wr+zeOkaA==
X-Received: by 2002:a05:6a21:6e4b:b0:1c0:dd3d:ef3a with SMTP id
 adf61e73a8af0-1c3fdcd0ac1mr1943388637.29.1721223599905; 
 Wed, 17 Jul 2024 06:39:59 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc5aa6esm74903495ad.299.2024.07.17.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 06:39:59 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v5 5/5] target/riscv: Inline unit-stride ld/st and
 corresponding functions for performance
Date: Wed, 17 Jul 2024 21:39:36 +0800
Message-Id: <20240717133936.713642-6-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240717133936.713642-1-max.chou@sifive.com>
References: <20240717133936.713642-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

In the vector unit-stride load/store helper functions. the vext_ldst_us
& vext_ldst_whole functions corresponding most of the execution time.
Inline the functions can avoid the function call overhead to improve the
helper function performance.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 56 +++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2e675b4220c..95394c425ed 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -150,18 +150,20 @@ typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
                                    uint32_t idx, void *vd, uintptr_t retaddr);
 typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
 
-#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)                         \
-static void NAME##_tlb(CPURISCVState *env, abi_ptr addr,                \
-                       uint32_t byte_off, void *vd, uintptr_t retaddr)  \
-{                                                                       \
-    ETYPE *cur = vd + byte_off;                                         \
-    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);                   \
-}                                                                       \
-                                                                        \
-static void NAME##_host(void *vd, uint32_t byte_off, void *host)        \
-{                                                                       \
-    ETYPE val = LDSUF##_p(host);                                        \
-    *(ETYPE *)(vd + byte_off) = val;                                    \
+#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)                 \
+static inline QEMU_ALWAYS_INLINE                                \
+void NAME##_tlb(CPURISCVState *env, abi_ptr addr,               \
+                uint32_t byte_off, void *vd, uintptr_t retaddr) \
+{                                                               \
+    ETYPE *cur = vd + byte_off;                                 \
+    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);           \
+}                                                               \
+                                                                \
+static inline QEMU_ALWAYS_INLINE                                \
+void NAME##_host(void *vd, uint32_t byte_off, void *host)       \
+{                                                               \
+    ETYPE val = LDSUF##_p(host);                                \
+    *(ETYPE *)(vd + byte_off) = val;                            \
 }
 
 GEN_VEXT_LD_ELEM(lde_b, uint8_t,  H1, ldub)
@@ -169,18 +171,20 @@ GEN_VEXT_LD_ELEM(lde_h, uint16_t, H2, lduw)
 GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl)
 GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq)
 
-#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)                         \
-static void NAME##_tlb(CPURISCVState *env, abi_ptr addr,                \
-                       uint32_t byte_off, void *vd, uintptr_t retaddr)  \
-{                                                                       \
-    ETYPE data = *(ETYPE *)(vd + byte_off);                             \
-    cpu_##STSUF##_data_ra(env, addr, data, retaddr);                    \
-}                                                                       \
-                                                                        \
-static void NAME##_host(void *vd, uint32_t byte_off, void *host)        \
-{                                                                       \
-    ETYPE val = *(ETYPE *)(vd + byte_off);                              \
-    STSUF##_p(host, val);                                               \
+#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)                 \
+static inline QEMU_ALWAYS_INLINE                                \
+void NAME##_tlb(CPURISCVState *env, abi_ptr addr,               \
+                uint32_t byte_off, void *vd, uintptr_t retaddr) \
+{                                                               \
+    ETYPE data = *(ETYPE *)(vd + byte_off);                     \
+    cpu_##STSUF##_data_ra(env, addr, data, retaddr);            \
+}                                                               \
+                                                                \
+static inline QEMU_ALWAYS_INLINE                                \
+void NAME##_host(void *vd, uint32_t byte_off, void *host)       \
+{                                                               \
+    ETYPE val = *(ETYPE *)(vd + byte_off);                      \
+    STSUF##_p(host, val);                                       \
 }
 
 GEN_VEXT_ST_ELEM(ste_b, uint8_t,  H1, stb)
@@ -366,7 +370,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     }
 }
 
-static void
+static inline QEMU_ALWAYS_INLINE void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn_tlb *ldst_tlb,
              vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
@@ -695,7 +699,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d_tlb)
 /*
  * load and store whole register instructions
  */
-static void
+static inline QEMU_ALWAYS_INLINE void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
                 vext_ldst_elem_fn_tlb *ldst_tlb,
                 vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
-- 
2.34.1


