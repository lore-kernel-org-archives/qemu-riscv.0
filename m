Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSw-0004Cm-13
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSt-000460-Jf
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSq-00082i-DE
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id 2so6441234pjx.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=paGPr1mEciKdi8kjhrebK++eP3ofxuN741VuaczA+uA=;
 b=a8KxglMiwuM9Lk8Vz18OUuD639lgamQ9m7z8JJFPZjixgdic8ynXZBZ2CpDRE9sP9r
 mTEfE3G3Vw2CcdsjcEHZ/YE4OMCxDupqEdIiU96QXpUj0EKS2LUAP4IGYrRWls3yvDjw
 SLwiy8dJFvf4dAaQxwUNXdCdYC8qHGLTnvUnOT28FO+ZVb9ZzWl/VNd2VvpEqEEsdnxU
 TkdwgTx8SgQ1tUcaXDapn2/NUwe8RfGR3xbHOJLsNA+3fddG8Mhfhtmhrh6Stp0xkC4B
 Xa7pu1xvVZuQRiWvtgDFMM4o/Xa+Xy63szSRH5OLSr+wyxtqlvAdX7XWQEVMsXX0BXxV
 /ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=paGPr1mEciKdi8kjhrebK++eP3ofxuN741VuaczA+uA=;
 b=kmkmAH2aMWQ9g4xGmznPv2D6cydOJdg+3MdX2wvVUbpHywhc4Tt40Dv+xF4UXuOFY1
 HPruADS4BpJ8s5VXhoXbUEDHDgWcEK3lghJLdGGuD03fA1lkg+qSPN4rhhYjqBEPd6nG
 XvvtAk0uclMBvtMUz8Tqc0DIJNQEe8crXdwZScFXHwlwtnegG79l2ORP+QRcFFAZ7R0P
 hXHS2i2JlPaD5AmkHYOgQ+ep4KoJz5E+rNJNClHjGtAHEAm2q5YqoKFmIX5Eo0qyCQyx
 EuNaXzav8Z/Er7bDM2Lv05/gl6tJRapRQSzstApTVipyfgXRO2q4dQhsjIQRlgWO/IIi
 dOxA==
X-Gm-Message-State: AOAM530Hsv+IB23au7dWiTMzdYQounDy81TiDfE5NBgCpu65yWv83ZOo
 +Vnlzse16TWKypQWf7e/nm8kQQ==
X-Google-Smtp-Source: ABdhPJzwlr1IKkJj79KwIlQnfqoptAtRrL88otG0VxqNmx98QYp9cFGDXSGIU/1rqacm8qhS4ON7Hg==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr7720534pjt.120.1596710974959; 
 Thu, 06 Aug 2020 03:49:34 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 55/71] target/riscv: rvv-1.0: floating-point slide
 instructions
Date: Thu,  6 Aug 2020 18:46:52 +0800
Message-Id: <20200806104709.13235-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfslide1up.vf
* vfslide1down.vf

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |   7 ++
 target/riscv/insn32.decode              |   2 +
 target/riscv/insn_trans/trans_rvv.inc.c |   4 +
 target/riscv/vector_helper.c            | 141 ++++++++++++++++--------
 4 files changed, 109 insertions(+), 45 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6825c15e025..6d98de1be15 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1132,6 +1132,13 @@ DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
+DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
 DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b2ecc8dd4d1..d181db197ef 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -548,6 +548,8 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
 vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1up_vf   001110 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1down_vf 001111 . ..... ..... 101 ..... 1010111 @r_vm
 vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
 vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
 vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index aab51a94bbf..c641796a60d 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3448,6 +3448,10 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
 GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
 GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
 
+/* Vector Floating-Point Slide Instructions */
+GEN_OPFVF_TRANS(vfslide1up_vf, slideup_check)
+GEN_OPFVF_TRANS(vfslide1down_vf, slidedown_check)
+
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1e779723a0f..eeaae89e24c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4732,57 +4732,108 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
 
-#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H)                             \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
-                  CPURISCVState *env, uint32_t desc)                      \
-{                                                                         \
-    uint32_t vm = vext_vm(desc);                                          \
-    uint32_t vl = env->vl;                                                \
-    uint32_t i;                                                           \
-                                                                          \
-    for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
-        }                                                                 \
-        if (i == 0) {                                                     \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
-        } else {                                                          \
-            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
-        }                                                                 \
-    }                                                                     \
+#define GEN_VEXT_VSLIE1UP(ESZ, H)                                           \
+static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
+                     CPURISCVState *env, uint32_t desc)                     \
+{                                                                           \
+    typedef uint##ESZ##_t ETYPE;                                            \
+    uint32_t vm = vext_vm(desc);                                            \
+    uint32_t vl = env->vl;                                                  \
+    uint32_t i;                                                             \
+                                                                            \
+    for (i = 0; i < vl; i++) {                                              \
+        if (!vm && !vext_elem_mask(v0, i)) {                                \
+            continue;                                                       \
+        }                                                                   \
+        if (i == 0) {                                                       \
+            *((ETYPE *)vd + H(i)) = s1;                                     \
+        } else {                                                            \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));             \
+        }                                                                   \
+    }                                                                       \
+}
+
+GEN_VEXT_VSLIE1UP(8,  H1)
+GEN_VEXT_VSLIE1UP(16, H2)
+GEN_VEXT_VSLIE1UP(32, H4)
+GEN_VEXT_VSLIE1UP(64, H8)
+
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)              \
+{                                                                 \
+    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
 }
 
 /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=x[rs1], vd[i+1] = vs2[i] */
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t,  H1)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8)
-
-#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H)                           \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
-                  CPURISCVState *env, uint32_t desc)                      \
-{                                                                         \
-    uint32_t vm = vext_vm(desc);                                          \
-    uint32_t vl = env->vl;                                                \
-    uint32_t i;                                                           \
-                                                                          \
-    for (i = 0; i < vl; i++) {                                            \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
-        }                                                                 \
-        if (i == vl - 1) {                                                \
-            *((ETYPE *)vd + H(i)) = s1;                                   \
-        } else {                                                          \
-            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
-        }                                                                 \
-    }                                                                     \
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, 8)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
+
+#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                          \
+static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
+                       CPURISCVState *env, uint32_t desc)                     \
+{                                                                             \
+    typedef uint##ESZ##_t ETYPE;                                              \
+    uint32_t vm = vext_vm(desc);                                              \
+    uint32_t vl = env->vl;                                                    \
+    uint32_t i;                                                               \
+                                                                              \
+    for (i = 0; i < vl; i++) {                                                \
+        if (!vm && !vext_elem_mask(v0, i)) {                                  \
+            continue;                                                         \
+        }                                                                     \
+        if (i == vl - 1) {                                                    \
+            *((ETYPE *)vd + H(i)) = s1;                                       \
+        } else {                                                              \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));               \
+        }                                                                     \
+    }                                                                         \
+}
+
+GEN_VEXT_VSLIDE1DOWN(8,  H1)
+GEN_VEXT_VSLIDE1DOWN(16, H2)
+GEN_VEXT_VSLIDE1DOWN(32, H4)
+GEN_VEXT_VSLIDE1DOWN(64, H8)
+
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)              \
+{                                                                 \
+    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
 }
 
 /* vslide1down.vx vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=x[rs1] */
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t,  H1)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, 8)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, 16)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
+
+/* Vector Floating-Point Slide Instructions */
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
+}
+
+/* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=f[rs1], vd[i+1] = vs2[i] */
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
+
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
+}
+
+/* vfslide1down.vf vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=f[rs1] */
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_h, 16)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_w, 32)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
 
 /* Vector Register Gather Instruction */
 #define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)          \
-- 
2.17.1


