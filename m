Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCFz-0004Hj-3h
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFx-0004Fa-8I
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFj-0004Ob-GR
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315712406so120557635e9.0
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357764; x=1685949764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpNKtjukrxBUClWMH96nkUvfEjdZcfT2lF+ZcStO9U4=;
 b=tueaRiN4fJieAaYGxwaFK0iePnLT0oneiZ72nu0w43c4SW4wpnZ/Z8rjDtLdGUShuQ
 jHwfn41qpUBseIntlXdYb3Sbgfm47YDHdSbX6tausltRU80SRtpjO3TFffPJXrQCUxqm
 XNpC25AEvvj2yU1GPR6ioXw6qkz9DZ/xi52EFtcCVrEdmNf+zoAryJQRWywRGrzQHJ+j
 +U6jIPjS95zkbJ6YjD+q8900L0vPqm4dus0CeaTWPUF8aPlcY0DwYIx8zAezKUa2Cb53
 zMEVWK2pdEt3/rveqfoDDw2jLKW/tZ5q0kTszdqLXNgngIJUUVDNqyWbyloTa+nA/Rm+
 31gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357764; x=1685949764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpNKtjukrxBUClWMH96nkUvfEjdZcfT2lF+ZcStO9U4=;
 b=RPI/NxwwAEhzEgzowKjIfjminK/c5TK9YJfR3p6K9bUv+pVWdFZNSw1NY3fJj8kGcL
 7Prs3m69owi4uwgcV5u7qQyPmNo2vZOnBqyb5mtyUqCiRtyzhnscEzT2AMCWR90AC6qi
 zLSSWtGe4wxuMbrd1uxX8cF7tShDoA3rk08ixjdLsxPI999DEns+pDALdrymrJc7TODB
 QzCsTVo26zc748sE1t123Hxz7KMCuCod7kqtfVxPpU5fb2PWGH+KbdrWpSbgipEBi9J2
 vZNJyePlDynSYwlXjEBtZeo/w+3NdmVhtO6Bh7dvpXtfi39vcnMh6OeTU7WarX2l+1UK
 UkSw==
X-Gm-Message-State: AC+VfDw1dB4aPxKcCdE/d28ETQA5nQnW9ro5VStMZV/nJb4Ph19uuLkR
 YRekZXEr28UljNN0KqM63K589w==
X-Google-Smtp-Source: ACHHUZ4sM3lZ/0LYYnD9au/Mb4e6vI/rPNaCnguJ8nCKmgpuxRUNG6DBqK2kZNY++oCW9aiDZDtk4w==
X-Received: by 2002:adf:e904:0:b0:306:2d81:341d with SMTP id
 f4-20020adfe904000000b003062d81341dmr6447921wrm.24.1683357764601; 
 Sat, 06 May 2023 00:22:44 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 10/30] tcg: Add routines for calling slow-path helpers
Date: Sat,  6 May 2023 08:22:15 +0100
Message-Id: <20230506072235.597467-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:23:01 -0000

Add tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  These and their subroutines
use the existing knowledge of the host function call abi
to load the function call arguments and return results.

These will be used to simplify the backends in turn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 456 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 453 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 057423c121..748be8426a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -181,6 +181,22 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
+typedef struct TCGLdstHelperParam {
+    TCGReg (*ra_gen)(TCGContext *s, const TCGLabelQemuLdst *l, int arg_reg);
+    unsigned ntmp;
+    int tmp[3];
+} TCGLdstHelperParam;
+
+static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
+                                   const TCGLdstHelperParam *p)
+    __attribute__((unused));
+static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *l,
+                                  bool load_sign, const TCGLdstHelperParam *p)
+    __attribute__((unused));
+static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *l,
+                                   const TCGLdstHelperParam *p)
+    __attribute__((unused));
+
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 
@@ -459,9 +475,8 @@ static void tcg_out_movext1(TCGContext *s, const TCGMovExtend *i)
  * between the sources and destinations.
  */
 
-static void __attribute__((unused))
-tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
-                const TCGMovExtend *i2, int scratch)
+static void tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
+                            const TCGMovExtend *i2, int scratch)
 {
     TCGReg src1 = i1->src;
     TCGReg src2 = i2->src;
@@ -715,6 +730,50 @@ static TCGHelperInfo all_helpers[] = {
 };
 static GHashTable *helper_table;
 
+#if TCG_TARGET_REG_BITS == 32
+# define dh_typecode_ttl  dh_typecode_i32
+#else
+# define dh_typecode_ttl  dh_typecode_i64
+#endif
+
+static TCGHelperInfo info_helper_ld32_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(ttl, 0)  /* return tcg_target_ulong */
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i32, 3)  /* unsigned oi */
+              | dh_typemask(ptr, 4)  /* uintptr_t ra */
+};
+
+static TCGHelperInfo info_helper_ld64_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(i64, 0)  /* return uint64_t */
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i32, 3)  /* unsigned oi */
+              | dh_typemask(ptr, 4)  /* uintptr_t ra */
+};
+
+static TCGHelperInfo info_helper_st32_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(void, 0)
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i32, 3)  /* uint32_t data */
+              | dh_typemask(i32, 4)  /* unsigned oi */
+              | dh_typemask(ptr, 5)  /* uintptr_t ra */
+};
+
+static TCGHelperInfo info_helper_st64_mmu = {
+    .flags = TCG_CALL_NO_WG,
+    .typemask = dh_typemask(void, 0)
+              | dh_typemask(env, 1)
+              | dh_typemask(tl, 2)   /* target_ulong addr */
+              | dh_typemask(i64, 3)  /* uint64_t data */
+              | dh_typemask(i32, 4)  /* unsigned oi */
+              | dh_typemask(ptr, 5)  /* uintptr_t ra */
+};
+
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
@@ -1126,6 +1185,11 @@ static void tcg_context_init(unsigned max_cpus)
                             (gpointer)&all_helpers[i]);
     }
 
+    init_call_layout(&info_helper_ld32_mmu);
+    init_call_layout(&info_helper_ld64_mmu);
+    init_call_layout(&info_helper_st32_mmu);
+    init_call_layout(&info_helper_st64_mmu);
+
 #ifdef CONFIG_TCG_INTERPRETER
     init_ffi_layouts();
 #endif
@@ -5011,6 +5075,392 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 }
 
+/*
+ * Similarly for qemu_ld/st slow path helpers.
+ * We must re-implement tcg_gen_callN and tcg_reg_alloc_call simultaneously,
+ * using only the provided backend tcg_out_* functions.
+ */
+
+static int tcg_out_helper_stk_ofs(TCGType type, unsigned slot)
+{
+    int ofs = arg_slot_stk_ofs(slot);
+
+    /*
+     * Each stack slot is TCG_TARGET_LONG_BITS.  If the host does not
+     * require extension to uint64_t, adjust the address for uint32_t.
+     */
+    if (HOST_BIG_ENDIAN &&
+        TCG_TARGET_REG_BITS == 64 &&
+        type == TCG_TYPE_I32) {
+        ofs += 4;
+    }
+    return ofs;
+}
+
+static void tcg_out_helper_load_regs(TCGContext *s,
+                                     unsigned nmov, TCGMovExtend *mov,
+                                     unsigned ntmp, const int *tmp)
+{
+    switch (nmov) {
+    default:
+        /* The backend must have provided enough temps for the worst case. */
+        tcg_debug_assert(ntmp + 1 >= nmov);
+
+        for (unsigned i = nmov - 1; i >= 2; --i) {
+            TCGReg dst = mov[i].dst;
+
+            for (unsigned j = 0; j < i; ++j) {
+                if (dst == mov[j].src) {
+                    /*
+                     * Conflict.
+                     * Copy the source to a temporary, recurse for the
+                     * remaining moves, perform the extension from our
+                     * scratch on the way out.
+                     */
+                    TCGReg scratch = tmp[--ntmp];
+                    tcg_out_mov(s, mov[i].src_type, scratch, mov[i].src);
+                    mov[i].src = scratch;
+
+                    tcg_out_helper_load_regs(s, i, mov, ntmp, tmp);
+                    tcg_out_movext1(s, &mov[i]);
+                    return;
+                }
+            }
+
+            /* No conflicts: perform this move and continue. */
+            tcg_out_movext1(s, &mov[i]);
+        }
+        /* fall through for the final two moves */
+
+    case 2:
+        tcg_out_movext2(s, mov, mov + 1, ntmp ? tmp[0] : -1);
+        return;
+    case 1:
+        tcg_out_movext1(s, mov);
+        return;
+    case 0:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_helper_load_slots(TCGContext *s,
+                                      unsigned nmov, TCGMovExtend *mov,
+                                      const TCGLdstHelperParam *parm)
+{
+    unsigned i;
+
+    /*
+     * Start from the end, storing to the stack first.
+     * This frees those registers, so we need not consider overlap.
+     */
+    for (i = nmov; i-- > 0; ) {
+        unsigned slot = mov[i].dst;
+
+        if (arg_slot_reg_p(slot)) {
+            goto found_reg;
+        }
+
+        TCGReg src = mov[i].src;
+        TCGType dst_type = mov[i].dst_type;
+        MemOp dst_mo = dst_type == TCG_TYPE_I32 ? MO_32 : MO_64;
+
+        /* The argument is going onto the stack; extend into scratch. */
+        if ((mov[i].src_ext & MO_SIZE) != dst_mo) {
+            tcg_debug_assert(parm->ntmp != 0);
+            mov[i].dst = src = parm->tmp[0];
+            tcg_out_movext1(s, &mov[i]);
+        }
+
+        tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
+                   tcg_out_helper_stk_ofs(dst_type, slot));
+    }
+    return;
+
+ found_reg:
+    /*
+     * The remaining arguments are in registers.
+     * Convert slot numbers to argument registers.
+     */
+    nmov = i + 1;
+    for (i = 0; i < nmov; ++i) {
+        mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
+    }
+    tcg_out_helper_load_regs(s, nmov, mov, parm->ntmp, parm->tmp);
+}
+
+static void tcg_out_helper_load_imm(TCGContext *s, unsigned slot,
+                                    TCGType type, tcg_target_long imm,
+                                    const TCGLdstHelperParam *parm)
+{
+    if (arg_slot_reg_p(slot)) {
+        tcg_out_movi(s, type, tcg_target_call_iarg_regs[slot], imm);
+    } else {
+        int ofs = tcg_out_helper_stk_ofs(type, slot);
+        if (!tcg_out_sti(s, type, imm, TCG_REG_CALL_STACK, ofs)) {
+            tcg_debug_assert(parm->ntmp != 0);
+            tcg_out_movi(s, type, parm->tmp[0], imm);
+            tcg_out_st(s, type, parm->tmp[0], TCG_REG_CALL_STACK, ofs);
+        }
+    }
+}
+
+static void tcg_out_helper_load_common_args(TCGContext *s,
+                                            const TCGLabelQemuLdst *ldst,
+                                            const TCGLdstHelperParam *parm,
+                                            const TCGHelperInfo *info,
+                                            unsigned next_arg)
+{
+    TCGMovExtend ptr_mov = {
+        .dst_type = TCG_TYPE_PTR,
+        .src_type = TCG_TYPE_PTR,
+        .src_ext = sizeof(void *) == 4 ? MO_32 : MO_64
+    };
+    const TCGCallArgumentLoc *loc = &info->in[0];
+    TCGType type;
+    unsigned slot;
+    tcg_target_ulong imm;
+
+    /*
+     * Handle env, which is always first.
+     */
+    ptr_mov.dst = loc->arg_slot;
+    ptr_mov.src = TCG_AREG0;
+    tcg_out_helper_load_slots(s, 1, &ptr_mov, parm);
+
+    /*
+     * Handle oi.
+     */
+    imm = ldst->oi;
+    loc = &info->in[next_arg];
+    type = TCG_TYPE_I32;
+    switch (loc->kind) {
+    case TCG_CALL_ARG_NORMAL:
+        break;
+    case TCG_CALL_ARG_EXTEND_U:
+    case TCG_CALL_ARG_EXTEND_S:
+        /* No extension required for MemOpIdx. */
+        tcg_debug_assert(imm <= INT32_MAX);
+        type = TCG_TYPE_REG;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_out_helper_load_imm(s, loc->arg_slot, type, imm, parm);
+    next_arg++;
+
+    /*
+     * Handle ra.
+     */
+    loc = &info->in[next_arg];
+    slot = loc->arg_slot;
+    if (parm->ra_gen) {
+        int arg_reg = -1;
+        TCGReg ra_reg;
+
+        if (arg_slot_reg_p(slot)) {
+            arg_reg = tcg_target_call_iarg_regs[slot];
+        }
+        ra_reg = parm->ra_gen(s, ldst, arg_reg);
+
+        ptr_mov.dst = slot;
+        ptr_mov.src = ra_reg;
+        tcg_out_helper_load_slots(s, 1, &ptr_mov, parm);
+    } else {
+        imm = (uintptr_t)ldst->raddr;
+        tcg_out_helper_load_imm(s, slot, TCG_TYPE_PTR, imm, parm);
+    }
+}
+
+static unsigned tcg_out_helper_add_mov(TCGMovExtend *mov,
+                                       const TCGCallArgumentLoc *loc,
+                                       TCGType dst_type, TCGType src_type,
+                                       TCGReg lo, TCGReg hi)
+{
+    if (dst_type <= TCG_TYPE_REG) {
+        MemOp src_ext;
+
+        switch (loc->kind) {
+        case TCG_CALL_ARG_NORMAL:
+            src_ext = src_type == TCG_TYPE_I32 ? MO_32 : MO_64;
+            break;
+        case TCG_CALL_ARG_EXTEND_U:
+            dst_type = TCG_TYPE_REG;
+            src_ext = MO_UL;
+            break;
+        case TCG_CALL_ARG_EXTEND_S:
+            dst_type = TCG_TYPE_REG;
+            src_ext = MO_SL;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        mov[0].dst = loc->arg_slot;
+        mov[0].dst_type = dst_type;
+        mov[0].src = lo;
+        mov[0].src_type = src_type;
+        mov[0].src_ext = src_ext;
+        return 1;
+    }
+
+    assert(TCG_TARGET_REG_BITS == 32);
+
+    mov[0].dst = loc[HOST_BIG_ENDIAN].arg_slot;
+    mov[0].src = lo;
+    mov[0].dst_type = TCG_TYPE_I32;
+    mov[0].src_type = TCG_TYPE_I32;
+    mov[0].src_ext = MO_32;
+
+    mov[1].dst = loc[!HOST_BIG_ENDIAN].arg_slot;
+    mov[1].src = hi;
+    mov[1].dst_type = TCG_TYPE_I32;
+    mov[1].src_type = TCG_TYPE_I32;
+    mov[1].src_ext = MO_32;
+
+    return 2;
+}
+
+static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
+                                   const TCGLdstHelperParam *parm)
+{
+    const TCGHelperInfo *info;
+    const TCGCallArgumentLoc *loc;
+    TCGMovExtend mov[2];
+    unsigned next_arg, nmov;
+    MemOp mop = get_memop(ldst->oi);
+
+    switch (mop & MO_SIZE) {
+    case MO_8:
+    case MO_16:
+    case MO_32:
+        info = &info_helper_ld32_mmu;
+        break;
+    case MO_64:
+        info = &info_helper_ld64_mmu;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /* Defer env argument. */
+    next_arg = 1;
+
+    loc = &info->in[next_arg];
+    nmov = tcg_out_helper_add_mov(mov, loc, TCG_TYPE_TL, TCG_TYPE_TL,
+                                  ldst->addrlo_reg, ldst->addrhi_reg);
+    next_arg += nmov;
+
+    tcg_out_helper_load_slots(s, nmov, mov, parm);
+
+    /* No special attention for 32 and 64-bit return values. */
+    tcg_debug_assert(info->out_kind == TCG_CALL_RET_NORMAL);
+
+    tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
+}
+
+static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
+                                  bool load_sign,
+                                  const TCGLdstHelperParam *parm)
+{
+    TCGMovExtend mov[2];
+
+    if (ldst->type <= TCG_TYPE_REG) {
+        MemOp mop = get_memop(ldst->oi);
+
+        mov[0].dst = ldst->datalo_reg;
+        mov[0].src = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, 0);
+        mov[0].dst_type = ldst->type;
+        mov[0].src_type = TCG_TYPE_REG;
+
+        /*
+         * If load_sign, then we allowed the helper to perform the
+         * appropriate sign extension to tcg_target_ulong, and all
+         * we need now is a plain move.
+         *
+         * If they do not, then we expect the relevant extension
+         * instruction to be no more expensive than a move, and
+         * we thus save the icache etc by only using one of two
+         * helper functions.
+         */
+        if (load_sign || !(mop & MO_SIGN)) {
+            if (TCG_TARGET_REG_BITS == 32 || ldst->type == TCG_TYPE_I32) {
+                mov[0].src_ext = MO_32;
+            } else {
+                mov[0].src_ext = MO_64;
+            }
+        } else {
+            mov[0].src_ext = mop & MO_SSIZE;
+        }
+        tcg_out_movext1(s, mov);
+    } else {
+        assert(TCG_TARGET_REG_BITS == 32);
+
+        mov[0].dst = ldst->datalo_reg;
+        mov[0].src =
+            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
+        mov[0].dst_type = TCG_TYPE_I32;
+        mov[0].src_type = TCG_TYPE_I32;
+        mov[0].src_ext = MO_32;
+
+        mov[1].dst = ldst->datahi_reg;
+        mov[1].src =
+            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDIAN);
+        mov[1].dst_type = TCG_TYPE_REG;
+        mov[1].src_type = TCG_TYPE_REG;
+        mov[1].src_ext = MO_32;
+
+        tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
+    }
+}
+
+static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
+                                   const TCGLdstHelperParam *parm)
+{
+    const TCGHelperInfo *info;
+    const TCGCallArgumentLoc *loc;
+    TCGMovExtend mov[4];
+    TCGType data_type;
+    unsigned next_arg, nmov, n;
+    MemOp mop = get_memop(ldst->oi);
+
+    switch (mop & MO_SIZE) {
+    case MO_8:
+    case MO_16:
+    case MO_32:
+        info = &info_helper_st32_mmu;
+        data_type = TCG_TYPE_I32;
+        break;
+    case MO_64:
+        info = &info_helper_st64_mmu;
+        data_type = TCG_TYPE_I64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /* Defer env argument. */
+    next_arg = 1;
+    nmov = 0;
+
+    /* Handle addr argument. */
+    loc = &info->in[next_arg];
+    n = tcg_out_helper_add_mov(mov, loc, TCG_TYPE_TL, TCG_TYPE_TL,
+                               ldst->addrlo_reg, ldst->addrhi_reg);
+    next_arg += n;
+    nmov += n;
+
+    /* Handle data argument. */
+    loc = &info->in[next_arg];
+    n = tcg_out_helper_add_mov(mov + nmov, loc, data_type, ldst->type,
+                               ldst->datalo_reg, ldst->datahi_reg);
+    next_arg += n;
+    nmov += n;
+    tcg_debug_assert(nmov <= ARRAY_SIZE(mov));
+
+    tcg_out_helper_load_slots(s, nmov, mov, parm);
+    tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
+}
+
 #ifdef CONFIG_PROFILER
 
 /* avoid copy/paste errors */
-- 
2.34.1


