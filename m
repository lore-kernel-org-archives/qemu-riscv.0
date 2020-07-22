Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvq-0004ER-Lt
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvo-00048u-Ps
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:56 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvm-0005uD-Ld
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so892488pgf.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1G8zWKyeVAzloRYKwSZXE73uroL9SBK5gG0F+v5JF8U=;
 b=i9/CwI4dnj+LmS2HEZ4hqYgKJIm2skkYUFYEMTHswNFapBfDCAHWhyl2UkVzOI2Kpb
 WqS62HFdt+hUH1DYlcd+HWT3Ka3HS4C5UF9wqemsZP0xD6+uKFfBfO4IpA34kdtw+2+A
 nnyzQUEUhMCK/QhiTOFrdTppmPxrEge1qPtdUtCUKNUxnKVLVyZ/8XKymleyZ8/RxHPM
 JcxX9oD/iImGE4rLjs+iFxpApXhqP7Z38cQMyb6c/f9vi0v9Vf3w11t6yQDVB/s7TyNO
 BrMuzS38p3p6knlYc62Nic8QjeIXxZAaec5kUACUIGWuWHMKrFBIAWGFpxKqSTlYw41e
 NQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1G8zWKyeVAzloRYKwSZXE73uroL9SBK5gG0F+v5JF8U=;
 b=Zp7S5x5Pjo/K8JRyNjQ5VQKI+pgOThi/i8YatDWezgJiiM+tB2JsMXnOZUWTiK69yx
 7OXtyEju3SPkcRqHdPyCAg9Sbwf0wd0sJYZrw6ZnH/I7u8g1S0PsDEJRoJCT/yi2uTRb
 3dncGSFmzF7pTEo2Ed2bNw+L+/dIILyTUaCvksKzUP6BAoEauG/0ziTVMNdA53VnjDTy
 BuaaiHyDDI/p5cszyhCndGmfHiLR05EqaHtC9fy6QuQW6OByhhzFgXoPHH+MTdE+WSWV
 LAmo6RTjS/LVyHR6enGuGQphpqNk/NZo79qH5E6QZpZJhZptcZ0kPW0VYJU7hwUN078V
 3fgw==
X-Gm-Message-State: AOAM531Wxtuoeyq9huFw9PE7kWyZZIDeT0JO1nvBZCceovbGt8aw6QIv
 HEm2iIVG1GVrwShpwbNEnUxNmQ==
X-Google-Smtp-Source: ABdhPJxrldAW5G52ywd68BYsVLHUQ6vg6pMeJ5XYaZWKoXDEIS1kcvydPT/a1FCMzRSDj1/5+5rv7A==
X-Received: by 2002:aa7:92d7:: with SMTP id k23mr29329762pfa.189.1595409653330; 
 Wed, 22 Jul 2020 02:20:53 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 46/76] target/riscv: rvv-0.9: integer
 add-with-carry/subtract-with-borrow
Date: Wed, 22 Jul 2020 17:16:09 +0800
Message-Id: <20200722091641.8834-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 09:20:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              | 20 +++++-----
 target/riscv/insn_trans/trans_rvv.inc.c |  2 +-
 target/riscv/vector_helper.c            | 50 ++++++++++++++-----------
 3 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0521ca4ab4..481f909d47 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -324,16 +324,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
-vadc_vvm        010000 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vadc_vxm        010000 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vadc_vim        010000 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vmadc_vvm       010001 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmadc_vxm       010001 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmadc_vim       010001 1 ..... ..... 011 ..... 1010111 @r_vm_1
-vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
-vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
-vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
+vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
+vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
+vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
+vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
+vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
+vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
 vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 3998011ef7..45853812f7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1806,7 +1806,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ * destination vector register is v0 and LMUL > 1. (Section 12.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index aa940080a7..95248238df 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1316,24 +1316,28 @@ GEN_VEXT_VADC_VXM(vsbc_vxm_d, uint64_t, H8, DO_VSBC, clearq)
                           (__typeof(N))(N + M) < N)
 #define DO_MSBC(N, M, C) (C ? N <= M : N < M)
 
-#define GEN_VEXT_VMADC_VVM(NAME, ETYPE, H, DO_OP)             \
-void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
-                  CPURISCVState *env, uint32_t desc)          \
-{                                                             \
-    uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
-    uint32_t i;                                               \
-                                                              \
-    for (i = 0; i < vl; i++) {                                \
-        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
-        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        uint8_t carry = vext_elem_mask(v0, i);                \
-                                                              \
-        vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
-    }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
+#define GEN_VEXT_VMADC_VVM(NAME, ETYPE, H, DO_OP)               \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
+                  CPURISCVState *env, uint32_t desc)            \
+{                                                               \
+    uint32_t vl = env->vl;                                      \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);\
+    uint32_t vm = vext_vm(desc);                                \
+    uint32_t vta = vext_vta(desc);                              \
+    uint32_t i;                                                 \
+                                                                \
+    for (i = 0; i < vl; i++) {                                  \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                      \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
+        uint8_t carry = !vm ? vext_elem_mask(v0, i) : 0;        \
+                                                                \
+        vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));        \
+    }                                                           \
+    if (vta == 1) {                                             \
+        for (; i < vlmax; i++) {                                \
+            vext_set_elem_mask(vd, i, 1);                       \
+        }                                                       \
+    }                                                           \
 }
 
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1352,17 +1356,21 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
 {                                                               \
     uint32_t vl = env->vl;                                      \
     uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);\
+    uint32_t vm = vext_vm(desc);                                \
+    uint32_t vta = vext_vta(desc);                              \
     uint32_t i;                                                 \
                                                                 \
     for (i = 0; i < vl; i++) {                                  \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
-        uint8_t carry = vext_elem_mask(v0, i);                  \
+        uint8_t carry = !vm ? vext_elem_mask(v0, i) : 0;         \
                                                                 \
         vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
-    for (; i < vlmax; i++) {                                    \
-        vext_set_elem_mask(vd, i, 0);                           \
+    if (vta == 1) {                                             \
+        for (; i < vlmax; i++) {                                \
+            vext_set_elem_mask(vd, i, 1);                       \
+        }                                                       \
     }                                                           \
 }
 
-- 
2.17.1


