Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6SQ-00028x-NU
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rr-0000H9-Vl
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RC-0001v4-PG
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315735514so10510945e9.1
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097075; x=1685689075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=GaUrrg4DTLfI2KgfOFXIrNnVQfukbitgvE7xTkMLe6SQLHwulAxuoMZSFoO+EUKg4V
 PCXxhU1iEnoL2f1hb158zK8yuGhNISrzgcWpqwavPJKX4ghi0lbLyVS/I5Whpq+/VmHB
 IqoduTidSPD4PJcLy/pp5vjRLWVWc25pPv22sM+e/FGq+DLqf+3mQr+k/8125PyXDJe7
 76ntmFHtc0N0e7qQydTzVGvg0mxK5QDdi+wVI2UCiK67SLnVT8SlHP6uXQ+vgyt2qegx
 XKkTmhxawYzpGcABylfRPyr5WgFog9xoNIIXjSWQlg2jukz+CY3e06yRVuqXADPy5B7I
 QOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097075; x=1685689075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu6T1N8rjMDvjcqVloIbI64DCiKYMAX1Jvlpvr4G/Zc=;
 b=FJs04QszrerVEUG96JEnJmj6QD0cSg4H3+UuctweMZDkqv46Hgu85Mh9Y83Gc1lQYT
 RapgmaJuaPAVNlJ+PR2OEyPV4rYP7AvA1gDouP2+3QaKN2cq2MOzwszw/wiqQhqC6Zv4
 9jalzv21BHAFEZj8Rh7PVEXecmRiRpnJM+0bfpADKKyUaLmXPZv/KTWKvMQ97KG5NzWg
 MIJUEeRHqrCVae99CBlE0ilX0c4//DAfdfFv0indULOl5gF5eCOKs2cWCaxBWvwveBd3
 4bL+oUABVyAnhMULRtsGSarNi9T0bYVRCFgAP5oFNMoW/6j8vYA5kN7MdZbFKQDSJV+e
 sWuA==
X-Gm-Message-State: AC+VfDw9QA+5VKePdZ/Y+mxBLukQg5iRHpW9MRA2iLSYlca/WvzHG1SI
 s27CoLGEAenkDoRlDtBEPwQQJGa+uXzMK5lNDBh9ew==
X-Google-Smtp-Source: ACHHUZ6pAhsgGFTjlj5jJayU3GLNFqpvHCCHATgl1oaF0GPcUqLPcS/5JTxZjfLLK8Dm7jHL1Tr2PQ==
X-Received: by 2002:adf:fa06:0:b0:2f6:661:c03c with SMTP id
 m6-20020adffa06000000b002f60661c03cmr619489wrr.28.1683097075248; 
 Tue, 02 May 2023 23:57:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 32/54] tcg: Introduce arg_slot_stk_ofs
Date: Wed,  3 May 2023 07:57:07 +0100
Message-Id: <20230503065729.1745843-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 06:59:05 -0000

Unify all computation of argument stack offset in one function.
This requires that we adjust ref_slot to be in the same units,
by adding max_reg_slots during init_call_layout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


