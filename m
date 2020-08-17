Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asg-0002GK-0t
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ase-0002D8-Th
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asc-0005Ft-Rx
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:36 -0400
Received: by mail-pj1-x1030.google.com with SMTP id i92so7665013pje.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gb74zUXCzGbJAPO8cWQtPiCfBiCFP81WJan2PZb94Bs=;
 b=kRPMAVmRTtidF/r3G8dVkeZui+AUzto2Gk5Und3u2+dH1GW4Qvn0dN0hbXRGpCQN4I
 tcA5NBNhbSBvo2ehuWsl3nTZ8+mPoIrJ+zM6NqYlBneJkuS2rU2Kalgq8QWyZsZctna/
 QGPn+A62Q7qInv4+jZepjU4CTzhS0f9m3eil8xp3aJhzuTOeUPZXYUAACr6rd5SfsHnM
 cACdBKmKKPXMFiJ9OPp2FFmeO3ZxadP9PTDzZWnTH6dUjb0aO1mA4N9C1JUy0eCO3zBV
 fIg4AhkmgPAtjDjJPErcLwHg0P6EGg/ZEEqsnR6x6XwKpv9GuruQSLl/Qw/rOm/Tqb5j
 UXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gb74zUXCzGbJAPO8cWQtPiCfBiCFP81WJan2PZb94Bs=;
 b=grDE1jFvi5K3QfTizPC56412urhfeDVmahZ2ZB1RFuJMU2CMRizlDreNTOLw1g79pB
 irXClHUWaLhN7dKrikWMIga2yC9Qy2357SiMSCMa8LJmqcvb3oObqC48PSPvNMBJ9Q+W
 d77j/C60hg0CO4lOZHYlCBc2ysC/+l37hZ+eHFv+o1mITeVKx9teyVjS2x6sN/tKiM82
 EWszHYfox1ZCAAWWYJ/hxKoM3koUgkOKHWyH90Oyvu9cwkMU7NCWHHiy0wCNqBzoWprv
 tLVHUK/mSRU7gmGuuW+sVogaN5j0Ze3UUFVoXt8kfb1r1KNgf0Y9AiQCTJYej/2gfK/a
 BmTw==
X-Gm-Message-State: AOAM532Ue1yffhsOVNY5rolC1LeZp1D5qb4kIszxc09s3S9MKogoZa8P
 htLTCnBMLaUo2J+Q0Jq65jR8RQ==
X-Google-Smtp-Source: ABdhPJwUCJKPD2fSQWlNdFL+YF3+ZuLsyY/HZp228M2MHP7ImBUnnabu0m7Wp5MHV+jYDVW+VuE8gA==
X-Received: by 2002:a17:90a:34c4:: with SMTP id
 m4mr11448421pjf.222.1597654353554; 
 Mon, 17 Aug 2020 01:52:33 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 53/70] target/riscv: rvv-1.0: floating-point slide
 instructions
Date: Mon, 17 Aug 2020 16:49:38 +0800
Message-Id: <20200817084955.28793-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:37 -0000

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
index 41789a2ba6f..c452292652c 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3460,6 +3460,10 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
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
index 2f1460b624d..09f0b03e2c5 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4714,57 +4714,108 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
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
 #define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                    \
-- 
2.17.1


