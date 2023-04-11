Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2TE-0006ce-Bs
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TA-0006CE-CR
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:48 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T8-0000Vk-KF
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:47 -0400
Received: by mail-pj1-x1029.google.com with SMTP id j8so4771472pjy.4
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AN2+J7y7AxmNmsOMYHKyYOp9ao/8XF2uCunQYCIFC7g=;
 b=geTPEJL/CqqJwweR7DWtZ3K6wx20fayJsMnmwlJWS6hj6BeU0B3vNEO17KPzNw/cQx
 tLhYLGWAFsdzc5xm+UgdB9gbgdA9ZVlgrO4awMnX2bmmkP4Vh+6tWKUcvLqi96sE9V05
 oC5BcVqUfV8A1kSjIPeTuTSyx5K3RYBIV3GzSQiB5PR5+fmmGG48ek1Nm44+z8YdTN8g
 6Ol1cZoaFnVko5OAEcvjcxErN7pkZCZQ9BM5PpcQC51VzzFUT5WEmw7odJ/Ey8gcFBzC
 8MyokTJq2G0NSVIBrMW1RCdoitW096/MhREYjCMTYYPAon1GJnkP1sN/ZukBfz8TcLTb
 ah7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AN2+J7y7AxmNmsOMYHKyYOp9ao/8XF2uCunQYCIFC7g=;
 b=zPTwDtL4fYjsriGJw/w4MeAIodFzimhpyCD1AKuckRNBObdTCgqHm5PFjfACalk2MJ
 2Iu3XwbYAnz/QDvwEAz7ykdTqeYr8yv7gIKZkNX/40iEfBd0SQKwjJecyDZaH7FFbSbc
 MUOr5O+eJeUCv1tJ7711JBUzbV2cpfBn+Hr5EKrZWXMSYda8F4FKb/JzmEQ1SpXTqQN/
 KReYeptH2K17O1h/7p7/nrs9lgP3Bm/9fLfOz6l4HaMJDYHvYcBBHLwmnT0r1o2Jtb5X
 nSxBXMAh4jGdNd/U6Ol2FW7wchAp59Y9OiN2jcZo1F3oXiYWPaw1sLfpe7tcg7A/xhXG
 lqkw==
X-Gm-Message-State: AAQBX9c9KKr8c+8Wiyuy/RpXNWl5yOZp25ZtvYCoR5ZMfn+9P+pXNOvy
 2yqcEwPP7LjKsLRnAk7tis6pj7q5xXGLhVFCsGcmfA==
X-Google-Smtp-Source: AKy350aOPU3zreWqBNIY4uMbiien7G+zEi8HHepA6RMwvY3x5oJhCm1C4se0056suX6KKu+xN3U/0g==
X-Received: by 2002:a05:6a20:af9e:b0:e0:316a:d62c with SMTP id
 ds30-20020a056a20af9e00b000e0316ad62cmr11861126pzb.60.1681175205827; 
 Mon, 10 Apr 2023 18:06:45 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 33/54] tcg: Introduce arg_slot_stk_ofs
Date: Mon, 10 Apr 2023 18:04:51 -0700
Message-Id: <20230411010512.5375-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:48 -0000

Unify all computation of argument stack offset in one function.
This requires that we adjust ref_slot to be in the same units,
by adding max_reg_slots during init_call_layout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fa28db0188..057423c121 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -816,6 +816,15 @@ static inline bool arg_slot_reg_p(unsigned arg_slot)
     return arg_slot < nreg;
 }
 
+static inline int arg_slot_stk_ofs(unsigned arg_slot)
+{
+    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
+    unsigned stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
+
+    tcg_debug_assert(stk_slot < max);
+    return TCG_TARGET_CALL_STACK_OFFSET + stk_slot * sizeof(tcg_target_long);
+}
+
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
     int info_in_idx;            /* TCGHelperInfo in[] */
@@ -1055,6 +1064,7 @@ static void init_call_layout(TCGHelperInfo *info)
             }
         }
         assert(ref_base + cum.ref_slot <= max_stk_slots);
+        ref_base += max_reg_slots;
 
         if (ref_base != 0) {
             for (int i = cum.info_in_idx - 1; i >= 0; --i) {
@@ -4826,7 +4836,7 @@ static void load_arg_reg(TCGContext *s, TCGReg reg, TCGTemp *ts,
     }
 }
 
-static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
+static void load_arg_stk(TCGContext *s, unsigned arg_slot, TCGTemp *ts,
                          TCGRegSet allocated_regs)
 {
     /*
@@ -4836,8 +4846,7 @@ static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
      */
     temp_load(s, ts, tcg_target_available_regs[ts->type], allocated_regs, 0);
     tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK,
-               TCG_TARGET_CALL_STACK_OFFSET +
-               stk_slot * sizeof(tcg_target_long));
+               arg_slot_stk_ofs(arg_slot));
 }
 
 static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
@@ -4848,18 +4857,16 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
         load_arg_reg(s, reg, ts, *allocated_regs);
         tcg_regset_set_reg(*allocated_regs, reg);
     } else {
-        load_arg_stk(s, l->arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs),
-                     ts, *allocated_regs);
+        load_arg_stk(s, l->arg_slot, ts, *allocated_regs);
     }
 }
 
-static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
+static void load_arg_ref(TCGContext *s, unsigned arg_slot, TCGReg ref_base,
                          intptr_t ref_off, TCGRegSet *allocated_regs)
 {
     TCGReg reg;
-    int stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
 
-    if (stk_slot < 0) {
+    if (arg_slot_reg_p(arg_slot)) {
         reg = tcg_target_call_iarg_regs[arg_slot];
         tcg_reg_free(s, reg, *allocated_regs);
         tcg_out_addi_ptr(s, reg, ref_base, ref_off);
@@ -4869,8 +4876,7 @@ static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
                             *allocated_regs, 0, false);
         tcg_out_addi_ptr(s, reg, ref_base, ref_off);
         tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
-                   TCG_TARGET_CALL_STACK_OFFSET
-                   + stk_slot * sizeof(tcg_target_long));
+                   arg_slot_stk_ofs(arg_slot));
     }
 }
 
@@ -4900,8 +4906,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_BY_REF:
             load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
             load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
-                         TCG_TARGET_CALL_STACK_OFFSET
-                         + loc->ref_slot * sizeof(tcg_target_long),
+                         arg_slot_stk_ofs(loc->ref_slot),
                          &allocated_regs);
             break;
         case TCG_CALL_ARG_BY_REF_N:
-- 
2.34.1


