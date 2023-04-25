Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOVY-0000Lu-Ri
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOVP-0000FX-Hz
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:39:15 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOVM-0006MC-J5
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:39:15 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4efe9a98736so3898731e87.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451550; x=1685043550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kfy0WeuIjSTnI0OlHtJbQJVrAkVRNlYtU0wj+LFi/C0=;
 b=H+4EDKWErMOdM5pXQPiLbbmci9yL9Vw8I2Nir0rpimXos27lipYIf9lbPRaYY/bZml
 +XopbHT7lYqaHQhnabizoagy61C/Cdiwvgj+78ERk+wkrRTG4JnjMcFvoVxcwRl5Oz+A
 sxSY2+QWJ9QcGzi0Bw+oBP+gNEDljOKuGG1PC+PyDGfJ5C4lHgm4ugey+u4xXZrkJupv
 fEEyGRyAIfZWOXeE6rlH7+vSmJFb9J8+OfcMtdOpfwj2wC34dqHMMN8XTKWUqFS5hMK0
 GsjFy20Dlbew4ud2bAJ+9s+YmAQk/IE+UxaZI7tDDU9N9tFklb52+FXH75iR+Y87QTUn
 RlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451550; x=1685043550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kfy0WeuIjSTnI0OlHtJbQJVrAkVRNlYtU0wj+LFi/C0=;
 b=XR2RUleZd08OCyPEnMphIxDDqBhH563J9B+wUDwb3/WfLlYJYQICPfG8XhuqZFKQSe
 2BGXY251W8dds7pO5eYs6lOLJqq4Lj2Npv13LB6UpODEKNr4YncfcPI/jFaBAQz3rPtE
 ZOb/kzrlv098Eys4o4bsCYEAUFcmdWWWgJwXihUqLfpsJ63MugZeORc6Gkatwf3mYxKi
 VQk5FrSDimqRB/3KQuF5AuqQrb3aspQ64hNNm043xpu0MFhcJ1RLYC5SZ0AFab3UVSaj
 SFfCUfXKr6+KG7bbtcLSVY5/SJJl6Eck0SjU9asxbeFqpjYRbYFQ+9bgcgjJo9xCmKW5
 3Khw==
X-Gm-Message-State: AAQBX9fOCMydR6WjjnLsnz77uct+4QO1+IgzL+p2dbZsXQo8zPNqDz9N
 irZDTIrb2Kfh/uULYE2ycGX3fg==
X-Google-Smtp-Source: AKy350bDglBo7ys9xKIS6SpN18JQHSpmqMf7aeOl/kdqa46xWTayFP9NpSSsn6oV0Tpw3EXG9CIpjA==
X-Received: by 2002:ac2:4247:0:b0:4eb:341c:ecc5 with SMTP id
 m7-20020ac24247000000b004eb341cecc5mr4803669lfl.12.1682451550260; 
 Tue, 25 Apr 2023 12:39:10 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:39:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 41/57] tcg: Support TCG_TYPE_I128 in tcg_out_{ld,
 st}_helper_{args, ret}
Date: Tue, 25 Apr 2023 20:31:30 +0100
Message-Id: <20230425193146.2106111-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x134.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:39:17 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 148 insertions(+), 26 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 07a9489b71..c5a0cfd846 100644
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
@@ -5366,6 +5391,9 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
     case MO_64:
         info = &info_helper_ld64_mmu;
         break;
+    case MO_128:
+        info = &info_helper_ld128_mmu;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -5380,8 +5408,33 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
     tcg_out_helper_load_slots(s, nmov, mov, parm->ntmp, parm->tmp);
 
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
@@ -5390,11 +5443,18 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
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
@@ -5420,25 +5480,49 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
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
@@ -5462,6 +5546,10 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
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
@@ -5479,13 +5567,47 @@ static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 
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
+        tcg_out_helper_load_slots(s, nmov, mov, parm->ntmp, parm->tmp);
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
+        tcg_out_helper_load_slots(s, nmov, mov, parm->ntmp, parm->tmp);
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
 
-    tcg_out_helper_load_slots(s, nmov, mov, parm->ntmp, parm->tmp);
     tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
 }
 
-- 
2.34.1


