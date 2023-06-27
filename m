Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8248EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECm1-0001nP-Sm; Tue, 27 Jun 2023 13:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEClw-0001hw-7y
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:36 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEClu-0004vc-8O
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:46:35 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5533c545786so70330a12.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687887993; x=1690479993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c56IXV6W+MLlXCMoQYT1qmjNlC+QQv7pCUiLZhC8k2s=;
 b=Ng5T0ooBIRh6iDAwV/NmHfEvKaG3rtIJZQrTgV2/mKNkN3PdupC94vHIHIn1W9w53I
 48MiXlxF+EFNR/oxV1g+yUSakpBe3opNguQdxs6/PAL69y5MdLvQxjq1jeTPzOOhZ8Dx
 koR48tgIUmccu9K1tl8KItYacG7NCqtGfniPEEqNf1Gyuxmo4Qp+OHOb26WHHkug7J4s
 FZorOT2ngp5NjfnhhJektUUA78A1gKrazyNRXEJcOnrWxyB+vsR5fxoZaReZVb0hcdH6
 pvmiuMB7GEK8/6O1EkhMw+9GpZqF0xoUnUS3f30fI4QuLFzHlcRZ7Q7UJJnmg2OORENY
 Qedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687887993; x=1690479993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c56IXV6W+MLlXCMoQYT1qmjNlC+QQv7pCUiLZhC8k2s=;
 b=kpNWxjVPQC/o8Ksz/o8a1PwlhJlzClPxe0AlABQjd9K5NmKhzLzCShsigHgLp0qJt5
 VmnNtYF9lEYmdigt/RkovahcbGRxrkbrqHkjZNKLovXiTF1nERZlJ67Hc8Sx3nYnFg25
 TPO+qfFRApSBdisU47JwtbrtxqC1Q4wFN1qfQbyroMXuvutPX2qvFNDtbRCa6v+YMl4j
 byp7nGfZDMmP1Aj4MCfj0b4datFYQTpg6tRo0sgIm2Kt+Jw+cEHhIgbOhGVGnyKAERGs
 XFRI3Bt6JdcDU1bcbmM47xjj2+jICkb9t1j9OSS9fluVNy/SnQh9ULAsQ+57iFbPihZY
 ipnw==
X-Gm-Message-State: AC+VfDxni/3vyc9zbtAyYdwUvoVx/v49/sIHZ5fhpCvlv8wzn8XuNBmn
 7cjm6Q6l+bXQMesI51GRjpUzVQ==
X-Google-Smtp-Source: ACHHUZ5cwf5pLBGACQeJ0Mau3kUi/GDoy5D1cZPsKa51KnCiopMW9qg9LPP+goWkFk4HNFR/Y48dsw==
X-Received: by 2002:a05:6a20:734a:b0:122:cb18:2e8c with SMTP id
 v10-20020a056a20734a00b00122cb182e8cmr29268243pzc.6.1687887992962; 
 Tue, 27 Jun 2023 10:46:32 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa78b49000000b00666e883757fsm5705144pfd.123.2023.06.27.10.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:46:32 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v6 07/15] target/riscv: Refactor some of the generic vector
 functionality
Date: Wed, 28 Jun 2023 01:45:41 +0800
Message-Id: <20230627174551.65498-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627174551.65498-1-max.chou@sifive.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

Move some macros out of `vector_helper` and into `vector_internals`.
This ensures they can be used by both vector and vector-crypto helpers
(latter implemented in proceeding commits).

Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/vector_helper.c    | 42 ------------------------------
 target/riscv/vector_internals.h | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 57be83400d..124ed22f95 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -635,9 +635,6 @@ GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
 #define OP_SUS_H int16_t, uint16_t, int16_t, uint16_t, int16_t
 #define OP_SUS_W int32_t, uint32_t, int32_t, uint32_t, int32_t
 #define OP_SUS_D int64_t, uint64_t, int64_t, uint64_t, int64_t
-#define WOP_UUU_B uint16_t, uint8_t, uint8_t, uint16_t, uint16_t
-#define WOP_UUU_H uint32_t, uint16_t, uint16_t, uint32_t, uint32_t
-#define WOP_UUU_W uint64_t, uint32_t, uint32_t, uint64_t, uint64_t
 #define WOP_SSS_B int16_t, int8_t, int8_t, int16_t, int16_t
 #define WOP_SSS_H int32_t, int16_t, int16_t, int32_t, int32_t
 #define WOP_SSS_W int64_t, int32_t, int32_t, int64_t, int64_t
@@ -3426,11 +3423,6 @@ GEN_VEXT_VF(vfwnmsac_vf_h, 4)
 GEN_VEXT_VF(vfwnmsac_vf_w, 8)
 
 /* Vector Floating-Point Square-Root Instruction */
-/* (TD, T2, TX2) */
-#define OP_UU_H uint16_t, uint16_t, uint16_t
-#define OP_UU_W uint32_t, uint32_t, uint32_t
-#define OP_UU_D uint64_t, uint64_t, uint64_t
-
 #define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
 static void do_##NAME(void *vd, void *vs2, int i,      \
                       CPURISCVState *env)              \
@@ -4127,40 +4119,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
 /* Vector Floating-Point Classify Instruction */
-#define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
-static void do_##NAME(void *vd, void *vs2, int i)      \
-{                                                      \
-    TX2 s2 = *((T2 *)vs2 + HS2(i));                    \
-    *((TD *)vd + HD(i)) = OP(s2);                      \
-}
-
-#define GEN_VEXT_V(NAME, ESZ)                          \
-void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
-                  CPURISCVState *env, uint32_t desc)   \
-{                                                      \
-    uint32_t vm = vext_vm(desc);                       \
-    uint32_t vl = env->vl;                             \
-    uint32_t total_elems =                             \
-        vext_get_total_elems(env, desc, ESZ);          \
-    uint32_t vta = vext_vta(desc);                     \
-    uint32_t vma = vext_vma(desc);                     \
-    uint32_t i;                                        \
-                                                       \
-    for (i = env->vstart; i < vl; i++) {               \
-        if (!vm && !vext_elem_mask(v0, i)) {           \
-            /* set masked-off elements to 1s */        \
-            vext_set_elems_1s(vd, vma, i * ESZ,        \
-                              (i + 1) * ESZ);          \
-            continue;                                  \
-        }                                              \
-        do_##NAME(vd, vs2, i);                         \
-    }                                                  \
-    env->vstart = 0;                                   \
-    /* set tail elements to 1s */                      \
-    vext_set_elems_1s(vd, vta, vl * ESZ,               \
-                      total_elems * ESZ);              \
-}
-
 target_ulong fclass_h(uint64_t frs1)
 {
     float16 f = frs1;
diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
index 749d138beb..8133111e5f 100644
--- a/target/riscv/vector_internals.h
+++ b/target/riscv/vector_internals.h
@@ -121,12 +121,52 @@ void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
 /* expand macro args before macro */
 #define RVVCALL(macro, ...)  macro(__VA_ARGS__)
 
+/* (TD, T2, TX2) */
+#define OP_UU_B uint8_t, uint8_t, uint8_t
+#define OP_UU_H uint16_t, uint16_t, uint16_t
+#define OP_UU_W uint32_t, uint32_t, uint32_t
+#define OP_UU_D uint64_t, uint64_t, uint64_t
+
 /* (TD, T1, T2, TX1, TX2) */
 #define OP_UUU_B uint8_t, uint8_t, uint8_t, uint8_t, uint8_t
 #define OP_UUU_H uint16_t, uint16_t, uint16_t, uint16_t, uint16_t
 #define OP_UUU_W uint32_t, uint32_t, uint32_t, uint32_t, uint32_t
 #define OP_UUU_D uint64_t, uint64_t, uint64_t, uint64_t, uint64_t
 
+#define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
+static void do_##NAME(void *vd, void *vs2, int i)      \
+{                                                      \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                    \
+    *((TD *)vd + HD(i)) = OP(s2);                      \
+}
+
+#define GEN_VEXT_V(NAME, ESZ)                          \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
+                  CPURISCVState *env, uint32_t desc)   \
+{                                                      \
+    uint32_t vm = vext_vm(desc);                       \
+    uint32_t vl = env->vl;                             \
+    uint32_t total_elems =                             \
+        vext_get_total_elems(env, desc, ESZ);          \
+    uint32_t vta = vext_vta(desc);                     \
+    uint32_t vma = vext_vma(desc);                     \
+    uint32_t i;                                        \
+                                                       \
+    for (i = env->vstart; i < vl; i++) {               \
+        if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
+            continue;                                  \
+        }                                              \
+        do_##NAME(vd, vs2, i);                         \
+    }                                                  \
+    env->vstart = 0;                                   \
+    /* set tail elements to 1s */                      \
+    vext_set_elems_1s(vd, vta, vl * ESZ,               \
+                      total_elems * ESZ);              \
+}
+
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
 
@@ -179,4 +219,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                do_##NAME, ESZ);                           \
 }
 
+/* Three of the widening shortening macros: */
+/* (TD, T1, T2, TX1, TX2) */
+#define WOP_UUU_B uint16_t, uint8_t, uint8_t, uint16_t, uint16_t
+#define WOP_UUU_H uint32_t, uint16_t, uint16_t, uint32_t, uint32_t
+#define WOP_UUU_W uint64_t, uint32_t, uint32_t, uint64_t, uint64_t
+
 #endif /* TARGET_RISCV_VECTOR_INTERNALS_H */
-- 
2.31.1


