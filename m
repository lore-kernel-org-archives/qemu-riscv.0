Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZP-0004wF-H7
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZO-0004vZ-CK
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:58 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYz-0004Ur-UC
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso5837164pjf.1
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lb1zdPDt2cXDP2uVEHjfwAEEiR/vLZlM3+YRRoy+01g=;
 b=g1ePDDqFj2G6YHcZNLvj5WFVz4qK2f8FLFqzMf7+cf3Yp4/wMbTjSh6aaVpQ+PNfgR
 V03xuAGeQ5PHxHHExiG7M4Bgj2bcKSrlkydUKs5hkMTgov3VSmoPyDcRd1+Rfis6I8WH
 2NhU/sA85MX+DAawF0m6b5cVYoEwDPIoQi2d3EybkWLzR7Mojoj+Dt3RtPtOsw8M9zBd
 ndwXLIAEMrU8tN2PMJubPsEMx0Vs5JFkPRt10KOk09HPFnFPFviUj/eYHVo8WTdtJVmd
 k+7gqNo2gC2g23LWfviAuDwughcnfJSzApTXH9888+9kfNWq5EvdKGFqCxqhg4wrqSmg
 vJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lb1zdPDt2cXDP2uVEHjfwAEEiR/vLZlM3+YRRoy+01g=;
 b=StKADlqTdu6WmurtFTiK9H5VNBhWp57tJhuPsfqGgYajvLMANkkSFgVXuxpBtKkHrR
 JTzfgO9zR3L5lMk35Yqgwtb4wms+2El2L7He0RhvhEloo7CkM54SMWRuXAEWsrjFd0/D
 bEGgdDXHYHGl7ukCn6hGPEhIiWNH/mSUOeZMVZSTT1Dgjn0YWCFQ631Kv9FdlVUUfavB
 0vHEiJkrBsYmDeMtu4irE2u+sJyZzj1J6B1MPx9Q3ZfEg9sW9lN3DzRQwVr8r4IxeWEI
 PaZ9vaO7xCr34wnuSmwKQPPz1NVRDRtr4UrKZMx311b77IIfM5bLZNQvuJATUYrnZA3v
 oe+Q==
X-Gm-Message-State: AFqh2kqzhVbe4IDGVABZnn20Rnka9CJxRCbmunpMNpZRjNnYFxc6hWj5
 +wwqr0H6Wk1KLzC2wGx8JdsDnA==
X-Google-Smtp-Source: AMrXdXtU22bKLYqtLjqmSKL8wJxOtEXKHoK2cKx6usN8OqH3mKXOdRFtxnog9XbB84W3A0UvhmW/Uw==
X-Received: by 2002:a17:902:864a:b0:193:ab5:39c7 with SMTP id
 y10-20020a170902864a00b001930ab539c7mr7840520plt.11.1673145453160; 
 Sat, 07 Jan 2023 18:37:33 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 11/36] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Sat,  7 Jan 2023 18:36:54 -0800
Message-Id: <20230108023719.2466341-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:58 -0000

Fill in the parameters for libffi for Int128.
Adjust the interpreter to allow for 16-byte return values.
Adjust tcg_out_call to record the return value length.

Call parameters are no longer all the same size, so we
cannot reuse the same call_slots array for every function.
Compute it each time now, but only fill in slots required
for the call we're about to make.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  3 +++
 tcg/tcg.c                | 19 +++++++++++++++++
 tcg/tci.c                | 44 ++++++++++++++++++++--------------------
 tcg/tci/tcg-target.c.inc | 10 ++++-----
 4 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 94ec541b4e..9d569c9e04 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -161,10 +161,13 @@ typedef enum {
 #if TCG_TARGET_REG_BITS == 32
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_EVEN
 #else
 # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #define HAVE_TCG_QEMU_TB_EXEC
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c032606b21..6f72d4157a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -549,6 +549,22 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static ffi_type *typecode_to_ffi(int argmask)
 {
+    /*
+     * libffi does not support __int128_t, so we have forced Int128
+     * to use the structure definition instead of the builtin type.
+     */
+    static ffi_type *ffi_type_i128_elements[3] = {
+        &ffi_type_uint64,
+        &ffi_type_uint64,
+        NULL
+    };
+    static ffi_type ffi_type_i128 = {
+        .size = 16,
+        .alignment = __alignof__(Int128),
+        .type = FFI_TYPE_STRUCT,
+        .elements = ffi_type_i128_elements,
+    };
+
     switch (argmask) {
     case dh_typecode_void:
         return &ffi_type_void;
@@ -562,6 +578,8 @@ static ffi_type *typecode_to_ffi(int argmask)
         return &ffi_type_sint64;
     case dh_typecode_ptr:
         return &ffi_type_pointer;
+    case dh_typecode_i128:
+        return &ffi_type_i128;
     }
     g_assert_not_reached();
 }
@@ -592,6 +610,7 @@ static void init_ffi_layouts(void)
         /* Ignoring the return type, find the last non-zero field. */
         nargs = 32 - clz32(typemask >> 3);
         nargs = DIV_ROUND_UP(nargs, 3);
+        assert(nargs <= MAX_CALL_IARGS);
 
         ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
         ca->cif.rtype = typecode_to_ffi(typemask & 7);
diff --git a/tcg/tci.c b/tcg/tci.c
index eeccdde8bc..022fe9d0f8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -470,12 +470,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
                    / sizeof(uint64_t)];
-    void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
 
     regs[TCG_AREG0] = (tcg_target_ulong)env;
     regs[TCG_REG_CALL_STACK] = (uintptr_t)stack;
-    /* Other call_slots entries initialized at first use (see below). */
-    call_slots[0] = NULL;
     tci_assert(tb_ptr);
 
     for (;;) {
@@ -498,26 +495,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            /*
-             * Set up the ffi_avalue array once, delayed until now
-             * because many TB's do not make any calls. In tcg_gen_callN,
-             * we arranged for every real argument to be "left-aligned"
-             * in each 64-bit slot.
-             */
-            if (unlikely(call_slots[0] == NULL)) {
-                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
-                    call_slots[i] = &stack[i];
-                }
-            }
-
-            tci_args_nl(insn, tb_ptr, &len, &ptr);
-
-            /* Helper functions may need to access the "return address" */
-            tci_tb_ptr = (uintptr_t)tb_ptr;
-
             {
-                void **pptr = ptr;
-                ffi_call(pptr[1], pptr[0], stack, call_slots);
+                void *call_slots[MAX_CALL_IARGS];
+                ffi_cif *cif;
+                void *func;
+                unsigned i, s, n;
+
+                tci_args_nl(insn, tb_ptr, &len, &ptr);
+                func = ((void **)ptr)[0];
+                cif = ((void **)ptr)[1];
+
+                n = cif->nargs;
+                for (i = s = 0; i < n; ++i) {
+                    ffi_type *t = cif->arg_types[i];
+                    call_slots[i] = &stack[s];
+                    s += DIV_ROUND_UP(t->size, 8);
+                }
+
+                /* Helper functions may need to access the "return address" */
+                tci_tb_ptr = (uintptr_t)tb_ptr;
+                ffi_call(cif, func, stack, call_slots);
             }
 
             switch (len) {
@@ -542,6 +539,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                  */
                 memcpy(&regs[TCG_REG_R0], stack, 8);
                 break;
+            case 3: /* Int128 */
+                memcpy(&regs[TCG_REG_R0], stack, 16);
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cd53cb6b6b..357888a532 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -203,7 +203,7 @@ static const int tcg_target_call_iarg_regs[] = { };
 static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 {
     tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
-    tcg_debug_assert(slot >= 0 && slot < 64 / TCG_TARGET_REG_BITS);
+    tcg_debug_assert(slot >= 0 && slot < 128 / TCG_TARGET_REG_BITS);
     return TCG_REG_R0 + slot;
 }
 
@@ -573,11 +573,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
 
     if (cif->rtype == &ffi_type_void) {
         which = 0;
-    } else if (cif->rtype->size == 4) {
-        which = 1;
     } else {
-        tcg_debug_assert(cif->rtype->size == 8);
-        which = 2;
+        tcg_debug_assert(cif->rtype->size == 4 ||
+                         cif->rtype->size == 8 ||
+                         cif->rtype->size == 16);
+        which = ctz32(cif->rtype->size) - 1;
     }
     new_pool_l2(s, 20, s->code_ptr, 0, (uintptr_t)func, (uintptr_t)cif);
     insn = deposit32(insn, 0, 8, INDEX_op_call);
-- 
2.34.1


