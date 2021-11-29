Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX00-0005xt-BN
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzy-0005sd-VM
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:34 -0500
Received: from [2607:f8b0:4864:20::430] (port=44673
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzw-0000XN-1K
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:34 -0500
Received: by mail-pf1-x430.google.com with SMTP id b68so15289886pfg.11
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKZXL7AzAOnezv5PszIImbNhzdKFZyp2DQm4gUFlRWg=;
 b=HH+1JJcM1BWZxHO1rWxYN4WNyzepzew93VVAbIpYoYd5MroRi6AUsdRppbw+kctALr
 cSlKsmBy2Slt/o73GKNsfPVhtnVRKIf8dHE4HAmdvcsfigD6tso3FmkZxUEe6t/Ho9Ww
 O9ZFddv85RK4zxh5O4iywQbkAZYH8BSgf39rnb2Qvh9c08cpeWdHU16biwDztluOG/NE
 9EvkfJv4nTyBw5mQ3HXVb+sQak5A4gUs3FsBmaZWkAywCgmHK+xHreXM2o1MmO+2az4A
 h69gr03gR/GoeFXtUO1anykPQRp71JE3AAMlpdjXYJKiWpVzucYWfWs26WL6Wv4qcJBY
 sirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKZXL7AzAOnezv5PszIImbNhzdKFZyp2DQm4gUFlRWg=;
 b=yRuN5V7kDQNTRPx5keW0hihHMVK404bS2nsV8fE6N2ByvA4nYld6GqlGnKGBoOB7dQ
 2YFCJij45fcWy9ONL3Q8QBpuLc5yK3UG3QWcXX05kjfPIAVrzAWV0F+QsPZq1KAP2+VV
 BgUGXZpu1c6vvXrdpJ6SRmGc2k6NsvY8NzyPcQ/OZsTw2HQF32I+NZxKN52+NOvM/sce
 qGszHnLWjtjyt8VkL5sPYSVPSeHQ1N7UE1V51gLOAOMln73DafDWQQ32DrRllr3dj08i
 TYAgtdWHXFeWHmlCu1k4VdCMweBg1jgZwWo29CGp//s7iqFCZk5ee8lfIb/keniRMUnH
 TaHg==
X-Gm-Message-State: AOAM533s5PBLALAkeRF7BEDV7NHYSqK98hTNPh0t000vDdnUHGVzCe71
 rlZP3zcPX6LbpRB6/I0CzPeORA==
X-Google-Smtp-Source: ABdhPJwJztk8tySeBh0eBNPqqsUEoprzaV6UkIBx8LpBdbpgHQG8x5m6/voQguxS4Vq9oVy/49luMQ==
X-Received: by 2002:a63:4643:: with SMTP id v3mr19776554pgk.532.1638155190797; 
 Sun, 28 Nov 2021 19:06:30 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:30 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 35/77] target/riscv: rvv-1.0: register gather instructions
Date: Mon, 29 Nov 2021 11:02:55 +0800
Message-Id: <20211129030340.429689-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:06:35 -0000

From: Frank Chang <frank.chang@sifive.com>

* Add vrgatherei16.vv instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  4 ++++
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvv.c.inc | 27 ++++++++++++++++++++++---
 target/riscv/vector_helper.c            | 23 ++++++++++++---------
 4 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7646567eb27..bd0768d048f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1059,6 +1059,10 @@ DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
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
index ab274dcde12..4653a9679ef 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -645,6 +645,7 @@ vslidedown_vx   001111 . ..... ..... 100 ..... 1010111 @r_vm
 vslidedown_vi   001111 . ..... ..... 011 ..... 1010111 @r_vm
 vslide1down_vx  001111 . ..... ..... 110 ..... 1010111 @r_vm
 vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
+vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4207cc4e6b8..322fc5c4aae 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3090,7 +3090,25 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
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
@@ -3110,7 +3128,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        int vlmax = s->vlen;
+        int scale = s->lmul - (s->sew + 3);
+        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -3141,8 +3160,10 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
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
index b0dc971a860..86d03d8e395 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4460,11 +4460,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
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
     uint64_t index;                                                       \
@@ -4474,20 +4474,25 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
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
2.25.1


