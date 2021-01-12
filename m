Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCD-0004s1-Of
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGC1-0004oR-VB
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:27 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBy-0007pU-Cl
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:25 -0500
Received: by mail-pg1-x534.google.com with SMTP id n25so1098121pgb.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e6dlFcp33DwFBVxERRo8mYpWfc5qvwrvCDbVS3qqk6E=;
 b=QEXMfa2c4eZBybZAdvHSQhMXlks57uzdQIh8mI3hcGNBZxoqV4cnz+VHQGTrLDzj/7
 7Jxp7iifK8cl4Fs2pZhg+Hhb4z7G3PJblSk6ZdlGSyvlbrZIeZPui1G1qKTdF3gDYgsE
 93k3Mh5gnzdNj3Aw1o/JmaMkTogGQw/cyj4s3614rYVEJQ1vMp8t5+Nhdk1Ie+ALmO4V
 lBBSLoNwROJn4nC2CCtG61oMV4p9jVLpeATgTZFnIB03GeUvOPBYkzcaIdy4p5pNVDY9
 3jpe4NQBtNRti4shAmin9xttKv0/cTyLQCrr1FTXf1dH1ZI0zYu9Mx027TeMo/Z0ngJb
 AUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e6dlFcp33DwFBVxERRo8mYpWfc5qvwrvCDbVS3qqk6E=;
 b=t9A7ZeidN1mmAFKqafKHzlXl8m/zbliWR4UKPA094yWfhmyY9e86hhycE5seCtDdOd
 KEiKnBzOxHNfdyLDiWN82/j9TaABGBAptoA6CPMAfYMl4qKT19fVW1Uo9Ps/5aqJBTTY
 aNE2RvH+Xb3iQSOB2E2N8B7xS6b+EXhRkjYbyWlK/J6s1+X9vUa5laiHBNgvudIKvgXW
 0VH+dIQksf3YhRoXyxCXy3RkO9nrJTOChdMXbAM4sd2OAmIwqC+Xb0hjKrpyap7dDsni
 08kMiyjmQy4A6w/mV7lQOPfpuseAP4vPitUGM7K+oDBt99v0DEh79MAj77EXPyM8i+Ki
 HXFA==
X-Gm-Message-State: AOAM533FuJ4Tu6AeiX07lcSZ4p0VSfShATcP96ZSFqlpnaJCxfD7T1E3
 SXYB+C53v+SMDmBTiexP+lHtGA==
X-Google-Smtp-Source: ABdhPJzKlfHG1/Ao7TQkB/kXhiVKxMQlYg0i64N0Qu6G58Hp/svn/TsgdObTKPe7b3VCCn0T1ate4Q==
X-Received: by 2002:a63:e101:: with SMTP id z1mr4015608pgh.190.1610444541163; 
 Tue, 12 Jan 2021 01:42:21 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:20 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 34/72] target/riscv: rvv-1.0: register gather instructions
Date: Tue, 12 Jan 2021 17:39:08 +0800
Message-Id: <20210112093950.17530-35-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:27 -0000

From: Frank Chang <frank.chang@sifive.com>

* Add vrgatherei16.vv instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  4 ++++
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvv.c.inc | 27 ++++++++++++++++++++++---
 target/riscv/vector_helper.c            | 23 ++++++++++++---------
 4 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index abf08dbc710..ea6c39b49a8 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1100,6 +1100,10 @@ DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrgatherei16_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrgather_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a593938e5c8..85cb3c81be0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -620,6 +620,7 @@ vslidedown_vx   001111 . ..... ..... 100 ..... 1010111 @r_vm
 vslidedown_vi   001111 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1down_vx  001111 . ..... ..... 110 ..... 1010111 @r_vm
 vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
+vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 72222d73e0e..bc780912b2b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3323,7 +3323,25 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
            require_vm(a->vm, a->rd);
 }
 
+static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    int8_t emul = MO_16 - s->sew + s->lmul;
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (emul >= -3 && emul <= 3) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs1, emul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd != a->rs2 && a->rd != a->rs1) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
+                          a->rs1, 1 << MAX(emul, 0)) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
+                          a->rs2, 1 << MAX(s->lmul, 0)) &&
+           require_vm(a->vm, a->rd);
+}
+
 GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
+GEN_OPIVV_TRANS(vrgatherei16_vv, vrgatherei16_vv_check)
 
 static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 {
@@ -3343,7 +3361,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        int vlmax = s->vlen;
+        int scale = s->lmul - (s->sew + 3);
+        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -3374,8 +3393,10 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        if (a->rs1 >= s->vlen) {
-            tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd),
+        int scale = s->lmul - (s->sew + 3);
+        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+        if (a->rs1 >= vlmax) {
+            tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
         } else {
             tcg_gen_gvec_dup_mem(s->sew, vreg_ofs(s, a->rd),
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8ccf538141c..782fe086f3e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4666,11 +4666,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
 
 /* Vector Register Gather Instruction */
-#define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H)                              \
+#define GEN_VEXT_VRGATHER_VV(NAME, TS1, TS2, HS1, HS2)                    \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS1)));             \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t index, i;                                                    \
@@ -4679,20 +4679,25 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
-        index = *((ETYPE *)vs1 + H(i));                                   \
+        index = *((TS1 *)vs1 + HS1(i));                                   \
         if (index >= vlmax) {                                             \
-            *((ETYPE *)vd + H(i)) = 0;                                    \
+            *((TS2 *)vd + HS2(i)) = 0;                                    \
         } else {                                                          \
-            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(index));           \
+            *((TS2 *)vd + HS2(i)) = *((TS2 *)vs2 + HS2(index));           \
         }                                                                 \
     }                                                                     \
 }
 
 /* vd[i] = (vs1[i] >= VLMAX) ? 0 : vs2[vs1[i]]; */
-GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  H1)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, H2)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, H4)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  uint8_t,  H1, H1)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, uint16_t, H2, H2)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, uint32_t, H4, H4)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, uint64_t, H8, H8)
+
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_b, uint16_t, uint8_t,  H2, H1)
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_h, uint16_t, uint16_t, H2, H2)
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_w, uint16_t, uint32_t, H2, H4)
+GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_d, uint16_t, uint64_t, H2, H8)
 
 #define GEN_VEXT_VRGATHER_VX(NAME, ETYPE, H)                              \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
-- 
2.17.1


