Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGDq-0007DW-KQ
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDo-0007BJ-TH
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:17 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDe-0008Qe-Pn
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id cq1so1071200pjb.4
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xXYVy1mnO5U21nNc8SzNySaperQs62Nw4KDPbCHRJQ0=;
 b=akzVYjVCQUGWu7ibNKUTRZMOBzMtG2IjaC2b99ysm6vXjmolNRTkJ4qKAz7WWLCCYx
 z2yCUrPF3awF3EFw7GEdhS6WA1sZMiy9wRUkcoQOdZTwt607uVfeQBl41AKVdHs3VCwr
 m7QH30PL9A/7m4xqy5thy++2ipowscqYPKT5i9AAtwbCauYXLF/W4ylnvtZbQ8N8fFmv
 9sVYofczUZiSqyAoGYjHawEo1Xn2p9uVelagbIwckSEtHBh1Ftok0SyGiY3gfP38nd3I
 9kX/P4Z/RTEa47VRERtsXnilCdas3/HaqwO2AzGiWc2oYh3k2FTFaNSaLtZbTPEOm2+y
 iY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xXYVy1mnO5U21nNc8SzNySaperQs62Nw4KDPbCHRJQ0=;
 b=rgCHxvd2QhXgMDf7Mybiva//IhiDpRcfPjfqA2TR74ZRQhzL0YLlczzM5yX1ShWUTp
 H1VI6Ay0RYYP2i5Qn0VQ5bAkGzzoqD/T45JPVb8eMoTzqmXlKYNL8GHQIO+bZlDvT8rN
 Yauza6scUM8ftz7EbRRma2V0ZwuZpVCK4jIMK5NsiC1CKitz5uEu8MTheyz5tlkFex/r
 WtGWpmGFTIaX3S0z+eckKqbBvqqBRSDtP3BDkkBE01RzOMuo1sZtgYUWa8jKbEnadbwA
 /pq8H6zWf8XvlUHIO21iPnAgMbqLmh41FwrDsT9752MSMxWTAWP2pxvVQMAXk4a7vBaM
 BnuQ==
X-Gm-Message-State: AOAM531MOsj33pjkUerQ5JbZhFSBjWEYfDqmHpZajQw88esLXNGV3asz
 hUL1updRSKQpKhauFTOkYv998A==
X-Google-Smtp-Source: ABdhPJx4OEfpvAcIvMH++LYlzAJdpp/s0loNlQKkRcKuz+/gmjDM0Z32ZVmvqRheXpCyfnWooJcCFQ==
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr4376640plo.29.1610444642390; 
 Tue, 12 Jan 2021 01:44:02 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 59/72] target/riscv: introduce floating-point rounding mode
 enum
Date: Tue, 12 Jan 2021 17:39:33 +0800
Message-Id: <20210112093950.17530-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c               | 12 ++++++------
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++++++---------
 target/riscv/internals.h                |  9 +++++++++
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 7c4ab92ecbe..ad84aeebc1c 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -55,23 +55,23 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
 {
     int softrm;
 
-    if (rm == 7) {
+    if (rm == RISCV_FRM_DYN) {
         rm = env->frm;
     }
     switch (rm) {
-    case 0:
+    case RISCV_FRM_RNE:
         softrm = float_round_nearest_even;
         break;
-    case 1:
+    case RISCV_FRM_RTZ:
         softrm = float_round_to_zero;
         break;
-    case 2:
+    case RISCV_FRM_RDN:
         softrm = float_round_down;
         break;
-    case 3:
+    case RISCV_FRM_RUP:
         softrm = float_round_up;
         break;
-    case 4:
+    case RISCV_FRM_RMM:
         softrm = float_round_ties_away;
         break;
     default:
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index de7152dc323..3f453ed457a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2321,7 +2321,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2400,7 +2400,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
             gen_helper_##NAME##_w,                                \
             gen_helper_##NAME##_d,                                \
         };                                                        \
-        gen_set_rm(s, 7);                                         \
+        gen_set_rm(s, RISCV_FRM_DYN);                             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -2432,7 +2432,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         TCGLabel *over = gen_new_label();                        \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2468,7 +2468,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2498,7 +2498,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2534,7 +2534,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2611,7 +2611,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2757,7 +2757,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2804,7 +2804,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 959b81b3016..469cc418c4e 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -36,6 +36,15 @@ target_ulong fclass_d(uint64_t frs1);
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
 
+enum {
+    RISCV_FRM_RNE = 0,  /* Round to Nearest, ties to Even */
+    RISCV_FRM_RTZ = 1,  /* Round towards Zero */
+    RISCV_FRM_RDN = 2,  /* Round Down */
+    RISCV_FRM_RUP = 3,  /* Round Up */
+    RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
+    RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
+};
+
 static inline uint64_t nanbox_s(float32 f)
 {
     return f | MAKE_64BIT_MASK(32, 32);
-- 
2.17.1


