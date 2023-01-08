Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZ8-0004kb-Po
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ7-0004ie-B1
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYu-0004Wm-8h
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9331045pjt.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lsxB0Q3bC5RA9mVuczL9+THSacM775KBH8YOyPIxoI=;
 b=ENvIh9xN742A5aZ45VE/p5kFr/9irKWtvvspMUP5BRbgcNPHSnxkAXSyRqtP3PQZWs
 N0KZscRbZRr73VpRkTaps2vo2tCxMeuNh1a0ScOMG9WA6KzlgR7WcWRAQy6LlGXEKoaG
 flFWdtvQUqheArBdgTaQwMn9jgvdgdqmSLrlFfeFdYW//yLtcA1O6jJcZiBLEhW+eG08
 rjmr5dx3aVyMSJHF87Z3hY9oKvQ+MWjtf+g/BrTNScgMRe03zHx/HkZiDZNduq1IS34Q
 +guz8XFXGkIK2FOKPWwNw2u1ntvn1fxuF1pE0cNyErf+HM94cC3c8c1MoatQ8JvhgncM
 zLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lsxB0Q3bC5RA9mVuczL9+THSacM775KBH8YOyPIxoI=;
 b=oJd9wNCLhgqwmBeWQ8RxPN0MK1raXFwCklh9oVbQtnzmGdeRwDJ2/VmcD1JMg4ytQH
 DOF9coDB5zxYqJrzdZXgOPYSDgByEMa+GBPsrXfGw3enZhzMH3VVtR9bU8+OaGNgh4cC
 /VtSX2BZ+8mV8ZMG/VHHcol9P3UcGveeDsOfNHFY3eaAA3ejM5bdEjug869S7+7t/FkB
 hm4ZJtmXXeZHBEuics7Psydn8WjobP4B9LJib+eYBAPRKXQwWvGMibuHHu5N1MxlPEaZ
 +Jh7uYZYEDXw1d8oeMvqR9lqFtdLxvru+pWpmZ26lKxtcQwTHceg9Eqh4p+6+Q7fSWgn
 dIhA==
X-Gm-Message-State: AFqh2koZtD4JUwfNCJz24aBq597TXpmtwRx2jbsGdFs3usJzuyAyZw3+
 u4JoBz2dfEMTvjHh0HIB69EuhfxmAB9WMWxm
X-Google-Smtp-Source: AMrXdXsGgYTqXe6+VEt7fnQDeU5cG9TOVBEpCAYKbHgZmvTCWUva02CX1eeOCwjWxCgUWwuEU9SlZw==
X-Received: by 2002:a17:902:a98a:b0:189:cef2:88e3 with SMTP id
 bh10-20020a170902a98a00b00189cef288e3mr62240851plb.57.1673145446963; 
 Sat, 07 Jan 2023 18:37:26 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 05/36] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Sat,  7 Jan 2023 18:36:48 -0800
Message-Id: <20230108023719.2466341-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:41 -0000

These will be used by some hosts, both 32 and 64-bit, to pass and
return i128.  Not yet used, because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |   3 +
 tcg/tcg.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 6e50aeba3a..2ec1ea01df 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -36,6 +36,7 @@
  */
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
+    TCG_CALL_RET_BY_REF,         /* for i128, by reference */
 } TCGCallReturnKind;
 
 typedef enum {
@@ -44,6 +45,8 @@ typedef enum {
     TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
     TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
     TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+    TCG_CALL_ARG_BY_REF,         /* for i128, by reference, first */
+    TCG_CALL_ARG_BY_REF_N,       /*       ... by reference, subsequent */
 } TCGCallArgumentKind;
 
 typedef struct TCGCallArgumentLoc {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a6c2783285..93d1331f93 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,8 +103,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
-static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
-    __attribute__((unused));
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -662,6 +661,38 @@ static void layout_arg_normal_n(TCGCumulativeArgs *cum,
     cum->arg_slot += n;
 }
 
+static void layout_arg_by_ref(TCGCumulativeArgs *cum, TCGHelperInfo *info)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+    int n = 128 / TCG_TARGET_REG_BITS;
+
+    /* The first subindex carries the pointer. */
+    layout_arg_1(cum, info, TCG_CALL_ARG_BY_REF);
+
+    /*
+     * The callee is allowed to clobber memory associated with
+     * structure pass by-reference.  Therefore we must make copies.
+     * Allocate space from "ref_slot", which will be adjusted to
+     * follow the parameters on the stack.
+     */
+    loc[0].ref_slot = cum->ref_slot;
+
+    /*
+     * Subsequent words also go into the reference slot, but
+     * do not accumulate into the regular arguments.
+     */
+    for (int i = 1; i < n; ++i) {
+        loc[i] = (TCGCallArgumentLoc){
+            .kind = TCG_CALL_ARG_BY_REF_N,
+            .arg_idx = cum->arg_idx,
+            .tmp_subindex = i,
+            .ref_slot = cum->ref_slot + i,
+        };
+    }
+    cum->info_in_idx += n;
+    cum->ref_slot += n;
+}
+
 static void init_call_layout(TCGHelperInfo *info)
 {
     int max_reg_slots = ARRAY_SIZE(tcg_target_call_iarg_regs);
@@ -697,6 +728,14 @@ static void init_call_layout(TCGHelperInfo *info)
         case TCG_CALL_RET_NORMAL:
             assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
             break;
+        case TCG_CALL_RET_BY_REF:
+            /*
+             * Allocate the first argument to the output.
+             * We don't need to store this anywhere, just make it
+             * unavailable for use in the input loop below.
+             */
+            cum.arg_slot = 1;
+            break;
         default:
             qemu_build_not_reached();
         }
@@ -775,6 +814,9 @@ static void init_call_layout(TCGHelperInfo *info)
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
                 break;
+            case TCG_CALL_ARG_BY_REF:
+                layout_arg_by_ref(&cum, info);
+                break;
             default:
                 qemu_build_not_reached();
             }
@@ -790,7 +832,39 @@ static void init_call_layout(TCGHelperInfo *info)
     assert(cum.info_in_idx <= ARRAY_SIZE(info->in));
     /* Validate the backend has enough argument space. */
     assert(cum.arg_slot <= max_reg_slots + max_stk_slots);
-    assert(cum.ref_slot <= max_stk_slots);
+
+    /*
+     * Relocate the "ref_slot" area to the end of the parameters.
+     * Minimizing this stack offset helps code size for x86,
+     * which has a signed 8-bit offset encoding.
+     */
+    if (cum.ref_slot != 0) {
+        int ref_base = 0;
+
+        if (cum.arg_slot > max_reg_slots) {
+            int align = __alignof(Int128) / sizeof(tcg_target_long);
+
+            ref_base = cum.arg_slot - max_reg_slots;
+            if (align > 1) {
+                ref_base = ROUND_UP(ref_base, align);
+            }
+        }
+        assert(ref_base + cum.ref_slot <= max_stk_slots);
+
+        if (ref_base != 0) {
+            for (int i = cum.info_in_idx - 1; i >= 0; --i) {
+                TCGCallArgumentLoc *loc = &info->in[i];
+                switch (loc->kind) {
+                case TCG_CALL_ARG_BY_REF:
+                case TCG_CALL_ARG_BY_REF_N:
+                    loc->ref_slot += ref_base;
+                    break;
+                default:
+                    break;
+                }
+            }
+        }
+    }
 }
 
 static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_order)];
@@ -1716,6 +1790,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
+        case TCG_CALL_ARG_BY_REF:
+        case TCG_CALL_ARG_BY_REF_N:
             op->args[pi++] = temp_arg(ts);
             break;
 
@@ -4382,6 +4458,27 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
     }
 }
 
+static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
+                         intptr_t ref_off, TCGRegSet *allocated_regs)
+{
+    TCGReg reg;
+    int stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
+
+    if (stk_slot < 0) {
+        reg = tcg_target_call_iarg_regs[arg_slot];
+        tcg_reg_free(s, reg, *allocated_regs);
+        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
+        tcg_regset_set_reg(*allocated_regs, reg);
+    } else {
+        reg = tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_PTR],
+                            *allocated_regs, 0, false);
+        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
+        tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
+                   TCG_TARGET_CALL_STACK_OFFSET
+                   + stk_slot * sizeof(tcg_target_long));
+    }
+}
+
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
@@ -4405,6 +4502,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_EXTEND_S:
             load_arg_normal(s, loc, ts, &allocated_regs);
             break;
+        case TCG_CALL_ARG_BY_REF:
+            load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
+            load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
+                         TCG_TARGET_CALL_STACK_OFFSET
+                         + loc->ref_slot * sizeof(tcg_target_long),
+                         &allocated_regs);
+            break;
+        case TCG_CALL_ARG_BY_REF_N:
+            load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -4436,6 +4543,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         save_globals(s, allocated_regs);
     }
 
+    /*
+     * If the ABI passes a pointer to the returned struct as the first
+     * argument, load that now.  Pass a pointer to the output home slot.
+     */
+    if (info->out_kind == TCG_CALL_RET_BY_REF) {
+        TCGTemp *ts = arg_temp(op->args[0]);
+
+        if (!ts->mem_allocated) {
+            temp_allocate_frame(s, ts);
+        }
+        load_arg_ref(s, 0, ts->mem_base->reg, ts->mem_offset, &allocated_regs);
+    }
+
     tcg_out_call(s, tcg_call_func(op), info);
 
     /* Assign output registers and emit moves if needed.  */
@@ -4452,6 +4572,15 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
             ts->mem_coherent = 0;
         }
         break;
+
+    case TCG_CALL_RET_BY_REF:
+        /* The callee has performed a write through the reference. */
+        for (i = 0; i < nb_oargs; i++) {
+            TCGTemp *ts = arg_temp(op->args[i]);
+            ts->val_type = TEMP_VAL_MEM;
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


