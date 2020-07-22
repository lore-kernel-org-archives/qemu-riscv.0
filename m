Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwe-0006Gh-EM
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwd-0006Dn-5W
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwb-00066F-6w
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p3so883501pgh.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wwWnFYhgiAsGU9GssgKhfj0XKT6lILK/t0ZSavv8d7E=;
 b=VcVKOF9VrFYiUuCfn5V48pm30uaOH6aIISKUoYJ2IsLVu9ON1W235TsULUOHOwjgRB
 aRMhSWgY4Rd72XZczgWH5VmIdjdKtCOPViuXP5eMC+F1J6SzOx1D0GNo1LqaZk6Pqb2f
 8csfpEc7Nt5vBdjjqfVAIHZCIz2sJyIvqtKRVZLcku6Pqr8KzsFsdi7FAclm4tbMbusU
 aOkKLQUeylwDcDB7p12GlZJ/8WJxASx03I0VL3MjbkiNKYTD7Ncb4hdjq0VVsVgbD82m
 1lfiAfy6OTTkuBFaAs35gOYr1AcxxjQpBNMK1D8glwjnjWdaCL5ebHrr9LaHbvCY82XS
 MrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wwWnFYhgiAsGU9GssgKhfj0XKT6lILK/t0ZSavv8d7E=;
 b=f1HuDNl4aDJ5xVAxQ/9cpXa7Ywt0m8Ui1cS/cqYvEd4m63+5Q0EZtPhPJ90Tr+Xfwx
 FW0ESMTCd44jb7INTJzdnEaXAyPKfhYH8h4Bm6dmCRMblhPhvACy89munG4izdo7RuLm
 PCguoGRqCeHFZ90XEP3fa2Ap6PXVivCBjMngUWJneYWHuYVDPHhgymNO+8fNqpemADul
 kToivT/QnaXdSW9Ic0JwgF4sreQehtXDVGR52FaHwhYcztytX3ezH6q3LNepIFmicTWy
 qen9o30CuV34jdnvpM3DYkNuSLT+cTnlo18B18TycLlIeX3msZV80CN0CXOIv3R3NxY9
 5mxw==
X-Gm-Message-State: AOAM531irBp3sDKvWJIS1SaDCUA8laFcSCXZ1yTa4Bs7prIoo3GAhnav
 VKY1NaYnOsBRYyF28HHFEJ5FAw==
X-Google-Smtp-Source: ABdhPJxFKAtQ7XWKMSU1UWbUMpue98RxS3lwhaubYmhsFtv8IahKoQpwxmQpXp/Y08sdjfUjemXG8A==
X-Received: by 2002:a65:5201:: with SMTP id o1mr11334281pgp.404.1595409704098; 
 Wed, 22 Jul 2020 02:21:44 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 59/76] target/riscv: rvv-0.9: floating-point slide
 instructions
Date: Wed, 22 Jul 2020 17:16:22 +0800
Message-Id: <20200722091641.8834-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfslide1up.vf
* vfslide1down.vf

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  7 ++++
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvv.inc.c |  4 ++
 target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b8a436d3aa..c6738336e8 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1114,6 +1114,13 @@ DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl, ptr, env, i32)
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
index acd65cb3a7..ed34ccd0e3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -530,6 +530,8 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
 vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1up_vf   001110 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1down_vf 001111 . ..... ..... 101 ..... 1010111 @r_vm
 vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
 vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
 vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 5004707b87..d16db7f61a 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3514,6 +3514,10 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
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
index b47ca6c406..4036be4425 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5023,6 +5023,57 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
 
+/* Vector Floating-Point Slide Instructions */
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ETYPE, H)                            \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,             \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            continue;                                                     \
+        }                                                                 \
+        if (i == 0) {                                                     \
+            *((ETYPE *)vd + H(i)) = s1;                                   \
+        } else {                                                          \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
+        }                                                                 \
+    }                                                                     \
+}
+
+/* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=f[rs1], vd[i+1] = vs2[i] */
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, uint16_t, H1)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, uint32_t, H1)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, uint64_t, H1)
+
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ETYPE, H)                          \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,             \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            continue;                                                     \
+        }                                                                 \
+        if (i == vl - 1) {                                                \
+            *((ETYPE *)vd + H(i)) = s1;                                   \
+        } else {                                                          \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
+        }                                                                 \
+    }                                                                     \
+}
+
+/* vfslide1down.vf vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=f[rs1] */
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_h, uint16_t, H1)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_w, uint32_t, H1)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, uint64_t, H1)
+
 /* Vector Register Gather Instruction */
 #define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H, CLEAR_FN)                    \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
-- 
2.17.1


