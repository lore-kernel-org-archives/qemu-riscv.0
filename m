Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6dh-0003tl-J3
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dO-0002tm-6l
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00071l-0l
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30939595e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097829; x=1685689829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIuPmH6ahEdkBPNFgC0JloIF81VLEbIJTekYJKef9xw=;
 b=fUHKKZ7be5qnEq91nqyhWSgouAz52BFbY184+vHS6J4hS4RU4WZaTjhKg8pgzgMP4D
 p6I6QBFp3siRsAZMbONpV2jivSNiLPgyRGdCE2SnDA5kZURdh3KcVt4Q0MzcqV5svZnE
 bVS5TzEdB8WcLFo1GBgpEedbjTOVN3HPY6NW2MCgcAdzaX6QdmcqVsmyfwtCsVCEej4z
 Bytv2/AXH2kTTxAv8QkWDBL+VGYF/LYwewMtolCalnyNMEhZJn+uzhbITN5HMSSflnBA
 EFwC+I2W76pL+H5XiVND2Alw7IF2DUKaQlqn/qen00lPRQFdwsaDagJIPq9xD4iAbYOw
 5+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097829; x=1685689829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIuPmH6ahEdkBPNFgC0JloIF81VLEbIJTekYJKef9xw=;
 b=C7nYjG2XvbhcAxmTEbViAOAO+eAsJnFr+siGpzItKzzksQnN+ZDBdSYY7s5neCdjyG
 S13gGN/ywZW7UP9OyQ9bNMvOGRL/Qxpn8t1YIXEkM0ssrk2eME/gVx1m7iyiCOfSfDTZ
 RxZKbkWt0156II2HCtrKC236PTti1SyRfXHZ6N3rHCzgpIm7xHRqSE18KTkDrbOPbxdA
 5GgChefYovf6TiKXZ9s3o1tusULcA+btSIEzrSZ+82PIs4M0ynI24O1vghMQfP92QPUh
 wnJo/EFhFDmk83FsuiwCIWXz/BiOA56qnEI0CDwdbxnsYdBSuAlGoSm72uoP8YEM9egq
 N2aQ==
X-Gm-Message-State: AC+VfDykyaxsqPM0yJ+9AAdKjeAzxgIKHAcDJ3JhMPCjAxAOAyCxt7AM
 QHV2SfuZWjr3r3TgmntSUl08reSs8NuQvRMaKB9fvA==
X-Google-Smtp-Source: ACHHUZ5nAK4gVBHMZztTmfml3dlXK91LnwWsXTQ+sG4/OcWjBpXC7/RNHidKn7BLQr4cefMal4CksQ==
X-Received: by 2002:a05:600c:21cb:b0:3f2:73a:32fc with SMTP id
 x11-20020a05600c21cb00b003f2073a32fcmr13859787wmj.32.1683097829155; 
 Wed, 03 May 2023 00:10:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 41/57] tcg: Support TCG_TYPE_I128 in tcg_out_{ld,
 st}_helper_{args, ret}
Date: Wed,  3 May 2023 08:06:40 +0100
Message-Id: <20230503070656.1746170-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:10:48 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 148 insertions(+), 26 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index b0e30a55ca..3905d3041c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -206,6 +206,7 @@ static void * const qemu_ld_helpers[MO_SSIZE + 1] __attribute__((unused)) = {
     [MO_UQ] = helper_ldq_mmu,
 #if TCG_TARGET_REG_BITS == 64
     [MO_SL] = helper_ldsl_mmu,
+    [MO_128] = helper_ld16_mmu,
 #endif
 };
 
@@ -214,6 +215,9 @@ static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
     [MO_16] = helper_stw_mmu,
     [MO_32] = helper_stl_mmu,
     [MO_64] = helper_stq_mmu,
+#if TCG_TARGET_REG_BITS == 64
+    [MO_128] = helper_st16_mmu,
+#endif
 };
 
 TCGContext tcg_init_ctx;
@@ -773,6 +777,15 @@ static TCGHelperInfo info_helper_ld64_mmu = {
               | dh_typemask(ptr, 4)  /* uintptr_t ra */
 };
 
+static TCGHelperInfo info_helper_ld128_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(i128, 0) /* return Int128 */
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i32, 3)  /* unsigned oi */
+              | dh_typemask(ptr, 4)  /* uintptr_t ra */
+};
+
 static TCGHelperInfo info_helper_st32_mmu = {
     .flags = TCG_CALL_NO_WG,
     .typemask = dh_typemask(void, 0)
@@ -793,6 +806,16 @@ static TCGHelperInfo info_helper_st64_mmu = {
               | dh_typemask(ptr, 5)  /* uintptr_t ra */
 };
 
+static TCGHelperInfo info_helper_st128_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(void, 0)
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i128, 3) /* Int128 data */
+              | dh_typemask(i32, 4)  /* unsigned oi */
+              | dh_typemask(ptr, 5)  /* uintptr_t ra */
+};
+
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
@@ -1206,8 +1229,10 @@ static void tcg_context_init(unsigned max_cpus)
 
     init_call_layout(&info_helper_ld32_mmu);
     init_call_layout(&info_helper_ld64_mmu);
+    init_call_layout(&info_helper_ld128_mmu);
     init_call_layout(&info_helper_st32_mmu);
     init_call_layout(&info_helper_st64_mmu);
+    init_call_layout(&info_helper_st128_mmu);
 
 #ifdef CONFIG_TCG_INTERPRETER
     init_ffi_layouts();
@@ -5361,6 +5386,9 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
     case MO_64:
         info = &info_helper_ld64_mmu;
         break;
+    case MO_128:
+        info = &info_helper_ld128_mmu;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -5375,8 +5403,33 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
     tcg_out_helper_load_slots(s, nmov, mov, parm);
 
-    /* No special attention for 32 and 64-bit return values. */
-    tcg_debug_assert(info->out_kind == TCG_CALL_RET_NORMAL);
+    switch (info->out_kind) {
+    case TCG_CALL_RET_NORMAL:
+    case TCG_CALL_RET_BY_VEC:
+        break;
+    case TCG_CALL_RET_BY_REF:
+        /*
+         * The return reference is in the first argument slot.
+         * We need memory in which to return: re-use the top of stack.
+         */
+        {
+            int ofs_slot0 = arg_slot_stk_ofs(0);
+
+            if (arg_slot_reg_p(0)) {
+                tcg_out_addi_ptr(s, tcg_target_call_iarg_regs[0],
+                                 TCG_REG_CALL_STACK, ofs_slot0);
+            } else {
+                tcg_debug_assert(parm->ntmp != 0);
+                tcg_out_addi_ptr(s, parm->tmp[0],
+                                 TCG_REG_CALL_STACK, ofs_slot0);
+                tcg_out_st(s, TCG_TYPE_PTR, parm->tmp[0],
+                           TCG_REG_CALL_STACK, ofs_slot0);
+            }
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
     tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
 }
@@ -5385,11 +5438,18 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
                                   bool load_sign,
                                   const TCGLdstHelperParam *parm)
 {
+    MemOp mop = get_memop(ldst->oi);
     TCGMovExtend mov[2];
+    int ofs_slot0;
 
-    if (ldst->type <= TCG_TYPE_REG) {
-        MemOp mop = get_memop(ldst->oi);
+    switch (ldst->type) {
+    case TCG_TYPE_I64:
+        if (TCG_TARGET_REG_BITS == 32) {
+            break;
+        }
+        /* fall through */
 
+    case TCG_TYPE_I32:
         mov[0].dst = ldst->datalo_reg;
         mov[0].src = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, 0);
         mov[0].dst_type = ldst->type;
@@ -5415,25 +5475,49 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
             mov[0].src_ext = mop & MO_SSIZE;
         }
         tcg_out_movext1(s, mov);
-    } else {
-        assert(TCG_TARGET_REG_BITS == 32);
+        return;
 
-        mov[0].dst = ldst->datalo_reg;
-        mov[0].src =
-            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
-        mov[0].dst_type = TCG_TYPE_I32;
-        mov[0].src_type = TCG_TYPE_I32;
-        mov[0].src_ext = MO_32;
+    case TCG_TYPE_I128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        ofs_slot0 = arg_slot_stk_ofs(0);
+        switch (TCG_TARGET_CALL_RET_I128) {
+        case TCG_CALL_RET_NORMAL:
+            break;
+        case TCG_CALL_RET_BY_VEC:
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       TCG_REG_CALL_STACK, ofs_slot0);
+            /* fall through */
+        case TCG_CALL_RET_BY_REF:
+            tcg_out_ld(s, TCG_TYPE_I64, ldst->datalo_reg,
+                       TCG_REG_CALL_STACK, ofs_slot0 + 8 * HOST_BIG_ENDIAN);
+            tcg_out_ld(s, TCG_TYPE_I64, ldst->datahi_reg,
+                       TCG_REG_CALL_STACK, ofs_slot0 + 8 * !HOST_BIG_ENDIAN);
+            return;
+        default:
+            g_assert_not_reached();
+        }
+        break;
 
-        mov[1].dst = ldst->datahi_reg;
-        mov[1].src =
-            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDIAN);
-        mov[1].dst_type = TCG_TYPE_REG;
-        mov[1].src_type = TCG_TYPE_REG;
-        mov[1].src_ext = MO_32;
-
-        tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
+    default:
+        g_assert_not_reached();
     }
+
+    mov[0].dst = ldst->datalo_reg;
+    mov[0].src =
+        tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
+    mov[0].dst_type = TCG_TYPE_I32;
+    mov[0].src_type = TCG_TYPE_I32;
+    mov[0].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
+
+    mov[1].dst = ldst->datahi_reg;
+    mov[1].src =
+        tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDIAN);
+    mov[1].dst_type = TCG_TYPE_REG;
+    mov[1].src_type = TCG_TYPE_REG;
+    mov[1].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
+
+    tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
 }
 
 static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
@@ -5457,6 +5541,10 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
         info = &info_helper_st64_mmu;
         data_type = TCG_TYPE_I64;
         break;
+    case MO_128:
+        info = &info_helper_st128_mmu;
+        data_type = TCG_TYPE_I128;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -5474,13 +5562,47 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
     /* Handle data argument. */
     loc = &info->in[next_arg];
-    n = tcg_out_helper_add_mov(mov + nmov, loc, data_type, ldst->type,
-                               ldst->datalo_reg, ldst->datahi_reg);
-    next_arg += n;
-    nmov += n;
-    tcg_debug_assert(nmov <= ARRAY_SIZE(mov));
+    switch (loc->kind) {
+    case TCG_CALL_ARG_NORMAL:
+    case TCG_CALL_ARG_EXTEND_U:
+    case TCG_CALL_ARG_EXTEND_S:
+        n = tcg_out_helper_add_mov(mov + nmov, loc, data_type, ldst->type,
+                                   ldst->datalo_reg, ldst->datahi_reg);
+        next_arg += n;
+        nmov += n;
+        tcg_out_helper_load_slots(s, nmov, mov, parm);
+        break;
+
+    case TCG_CALL_ARG_BY_REF:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_debug_assert(data_type == TCG_TYPE_I128);
+        tcg_out_st(s, TCG_TYPE_I64,
+                   HOST_BIG_ENDIAN ? ldst->datahi_reg : ldst->datalo_reg,
+                   TCG_REG_CALL_STACK, arg_slot_stk_ofs(loc[0].ref_slot));
+        tcg_out_st(s, TCG_TYPE_I64,
+                   HOST_BIG_ENDIAN ? ldst->datalo_reg : ldst->datahi_reg,
+                   TCG_REG_CALL_STACK, arg_slot_stk_ofs(loc[1].ref_slot));
+
+        tcg_out_helper_load_slots(s, nmov, mov, parm);
+
+        if (arg_slot_reg_p(loc->arg_slot)) {
+            tcg_out_addi_ptr(s, tcg_target_call_iarg_regs[loc->arg_slot],
+                             TCG_REG_CALL_STACK,
+                             arg_slot_stk_ofs(loc->ref_slot));
+        } else {
+            tcg_debug_assert(parm->ntmp != 0);
+            tcg_out_addi_ptr(s, parm->tmp[0], TCG_REG_CALL_STACK,
+                             arg_slot_stk_ofs(loc->ref_slot));
+            tcg_out_st(s, TCG_TYPE_PTR, parm->tmp[0],
+                       TCG_REG_CALL_STACK, arg_slot_stk_ofs(loc->arg_slot));
+        }
+        next_arg += 2;
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
 
-    tcg_out_helper_load_slots(s, nmov, mov, parm);
     tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
 }
 
-- 
2.34.1


