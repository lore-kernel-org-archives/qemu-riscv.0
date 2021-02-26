Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTkK-0002o1-Hp
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkH-0002mB-Vy
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:50 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkC-0002gq-0w
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:49 -0500
Received: by mail-pg1-x52e.google.com with SMTP id o10so5405129pgg.4
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xXYVy1mnO5U21nNc8SzNySaperQs62Nw4KDPbCHRJQ0=;
 b=Z9nSTd1AzUmhiPSdUifzGAu1x3tzYz87qIIYWQqv0pB+42L5SAziDabrMNFMbIaLpc
 FTxPuYwvrE9RLQtgwQIjI4FA7lZUHRI9Xpi2jxkD/7raEIc0/kOu4diCKC8zHFgPqbej
 9QrDMb11lzBzha9KLknmi1HAPQFmhYoxxYwzCuJUbkh6bJzuAQV+sat3isemYlG4ij5n
 GonwfWCtcikmMzPyWzBe5Xhi589mMbqoXhXI6H3wzez8THa6ow0bVuXQcPcUUcXZRIfm
 9XSIr/r34LGjSo1ijjSLU0+luB4wYnMCEcl0RMdjMS/f/hFyItewr1PExzApIrhRQz4l
 oAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xXYVy1mnO5U21nNc8SzNySaperQs62Nw4KDPbCHRJQ0=;
 b=og0nE9vKoeRg1EUe1bCSG9pUh6mfUEeKBjghLXkhLn4Vs6U8ZsehFQCrsc1/iXEpE6
 i8mI/lDoQyLNHsPWxiD5s1e/2IEQcJi7e+Dajy/tGm+YfdcnAVQwuoWgNYfJFQr6o9b7
 /clrHr9wYVCmcb+P8nkz9ljANbje6fanqQ5cSOOdp3ksYROWAUpyGaBnvI3vFzKnckYJ
 geX/6bT3uhdW/Mmeio5L/gEIjODaMI+/PZlpPm11pP/3kTs4IBGvhVbsyd79V8XyFciZ
 PfmpGGenvck6FN0b3F2H0wKbIsrNItSOsoY8fX5FhFwW3ezHDt19aNaa2asxp5PKAFJW
 lfLg==
X-Gm-Message-State: AOAM533HZxMxL2xI00QsFto/H69a+JRiKCl8s8V8Gu2Dad7FqDx4pzjx
 ujMiZEzvbrlPdSIUCUgs5u3kJg==
X-Google-Smtp-Source: ABdhPJwVSxAMp8ne474ggAI2PhNpa9vINSP9qVS72OuJfjdwfvMvb9ub9rN4WsnfnpaO/uPH/oo6Mw==
X-Received: by 2002:aa7:8c0f:0:b029:1ed:4d05:218c with SMTP id
 c15-20020aa78c0f0000b02901ed4d05218cmr997106pfd.21.1614309882834; 
 Thu, 25 Feb 2021 19:24:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 59/75] target/riscv: introduce floating-point rounding mode
 enum
Date: Fri, 26 Feb 2021 11:18:43 +0800
Message-Id: <20210226031902.23656-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:24:50 -0000

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


