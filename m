Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNm5-0006Tg-4x
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNll-0006EJ-2N
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:54 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNli-00064V-6y
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:48 -0400
Received: by mail-pg1-x533.google.com with SMTP id s136so9304082pgs.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKZXL7AzAOnezv5PszIImbNhzdKFZyp2DQm4gUFlRWg=;
 b=Hfc1q2c8qjfwlq0RMLBVQBcbLImM+Upb635RDqDWTlFWhzyg2TklOqicHnQ5BMAH6j
 nEdhDVpcyopSTaEn63G3TD1/ymKYWCz7TSssLPCMTClgvKH9OoC/lB3RWVsgtEZJZ88b
 n1YFO+d8a/tSzP4nrJ2ZHDPoLGKD+hguJ5/onVQzFOmne6uSUU7H2Ug7SYRH5BxL5oWS
 CN98zcxXIDwnIu3GoIKz/QcEfwLKlahP1WKMkBFt4WJHz59Azd6zAy38b5pINJQJ1KbH
 +bWaUU9NbUtasPcd5E7bBZSpIWea4gDAeqZVwU7iflBziDONjC/TTzk263Vg/y2F/RMQ
 RIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKZXL7AzAOnezv5PszIImbNhzdKFZyp2DQm4gUFlRWg=;
 b=fQqL+mbLRrBTG4N9ouYw7DSPO2RX56NUGj53O9SsnvKbpHywQNTvEUetrjc/Qmwsy+
 dD6dIFftWuYEMGh4sdSFmHVh4lw10+/TdIW3Iks2wpTPuYVORnksw3SHa98fbtvJ29Lm
 yCvNO3Rk0k42Loh5igSQG/A7j/cNuoMltk3hijVSqeXaGmrAK9ZAuYpieQ/NfO5wyl1F
 06zBwYCbMXuu/WdSZFekBxcXhXp9VH+SDAo82ETOpzdG6TTjIQMuAUoc/LLQyGV2hzoi
 /NjPsusMW9rrE4qsgeuSwsB+xrAazX1EWF4FqsKUHFyHY7wRZCrw3b7Ja1MI5KJ2PjF5
 CawQ==
X-Gm-Message-State: AOAM5320Dl2TNV4/D77DJpBZlCV25G0A3QY7Ni/+JLYxaJDelXQitcUQ
 lcxZ7PcQan0a3P+p5CqYhNISEwBawI8KhBD9
X-Google-Smtp-Source: ABdhPJxf6r48VNihuYyUvFmc+OWclVMlL7sgARPAwv2haBTiFpCCLvdWAiWQTYt16JfMqGvL4DL3wg==
X-Received: by 2002:a05:6a00:1c46:b0:47b:e953:cf03 with SMTP id
 s6-20020a056a001c4600b0047be953cf03mr9893489pfw.2.1635498104896; 
 Fri, 29 Oct 2021 02:01:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:44 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 35/76] target/riscv: rvv-1.0: register gather instructions
Date: Fri, 29 Oct 2021 16:58:40 +0800
Message-Id: <20211029085922.255197-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:58 -0000

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


