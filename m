Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSV-0003Xm-Kx
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dST-0003QZ-1D
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:13 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSQ-0007xu-OV
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id t6so6295966pjr.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uyZlOwf5sY29/KWwIlC8fQBvaqUFIeMUTjg0JvPcbYY=;
 b=K4crNQEYBR3w5OazAjtg9WbfMCDR0B1OPdWLukg+tQB2u4e5uD7iNH5nYSAkL5VjIl
 txyKvDxVGXQsDt/6VqnxVYmvi4z1uAnO7hji7hWSm8V4jCQzDYiu3/BAv70MVysVRgcG
 x+RrAvIxPFUZjymW1bEnsBcAQQ3ujazNk2mq+YiJgKjwNI6+uAGxGc2o8jADjZMhoVR2
 DNngHrp7hdAVavlW3Zgtbkp423Jten3PjkG1dqzKeH/ny4U/WUP5YQTuSN/mRCGqJADj
 ps28TFloEjbFLCH7nMAgayH67lhkzhZ5QO8Zba0uix4hGLgSmGan9UKKICWn7iep+dog
 JBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uyZlOwf5sY29/KWwIlC8fQBvaqUFIeMUTjg0JvPcbYY=;
 b=d3tDPtusYQ4kq9nHiSqop2PhTgTRqMTaY8ySxiJJ7ftX9b+EOKJN0pMc1Zh7C8Ckh5
 lYN92CkfQgKGsAQBcBx4Ovmbh1UiVWOnrY3PRUnVn9EUsOoVh2LX0T2xw2bu/1GesQ6N
 tz5H4msjTRugS2hGYNVrxXVnEiEzPYhQBzXHDkV6T3haGBDg/G5lS5lj5kTrD2Tn0Wcp
 qDoORRr8bQScVefb6S4wTYjPVUvFOq8MWxs1hCUYITFiFyAWv1jIooEEnZVTGr31AOmK
 7in+nFkdPgwDPOC7RFUfDZ7/IDFkW6PuxCvsWmlbLfM09IIDHxJr4SO0WX/jNAffDaD/
 1jyA==
X-Gm-Message-State: AOAM5331QKma2j1YGnZB4wwAdnSYvmrYjeYTF3l6fKawNtV0NE1cUZdu
 wyofgPQzluP6u/chV4ve5iOVrQ==
X-Google-Smtp-Source: ABdhPJzM2q2QhUWt4zRZ8ARFdj/IN6ga81qx6+QxbvIGcmmjsGjG2GEoTbs90lGc2fZj653N+Rakew==
X-Received: by 2002:a17:90b:1093:: with SMTP id
 gj19mr7802680pjb.149.1596710949532; 
 Thu, 06 Aug 2020 03:49:09 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:09 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 44/71] target/riscv: rvv-1.0: integer
 add-with-carry/subtract-with-borrow
Date: Thu,  6 Aug 2020 18:46:41 +0800
Message-Id: <20200806104709.13235-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Clear tail elements only if VTA is agnostic.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              | 20 ++++++-------
 target/riscv/insn_trans/trans_rvv.inc.c |  2 +-
 target/riscv/vector_helper.c            | 40 +++++++++++--------------
 3 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fd00ee6fdca..e62bad906a3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -342,16 +342,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
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
index a22db5f2f13..2f5846fe4f0 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1760,7 +1760,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ * destination vector register is v0 and LMUL > 1. (Section 12.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index efc29affb06..cc501a7cb44 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1218,24 +1218,21 @@ GEN_VEXT_VADC_VXM(vsbc_vxm_d, uint64_t, H8, DO_VSBC)
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
+    uint32_t vm = vext_vm(desc);                                \
+    uint32_t i;                                                 \
+                                                                \
+    for (i = 0; i < vl; i++) {                                  \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                      \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
+        uint8_t carry = !vm ? vext_elem_mask(v0, i) : 0;        \
+                                                                \
+        vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));        \
+    }                                                           \
 }
 
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1253,19 +1250,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl = env->vl;                                      \
-    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);\
+    uint32_t vm = vext_vm(desc);                                \
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
-    }                                                           \
 }
 
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
-- 
2.17.1


