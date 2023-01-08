Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZJ-0004sB-2T
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZH-0004rI-Qs
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:51 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYy-0004Yy-8e
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:51 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c4so5880970plc.5
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWtD/TEe250UHjk6klCm4KJGVjq9QANqtB38KitJ/cg=;
 b=H71P5HjcjjY9BV2F+Dlma7KDkuHyDeXp3KNRbW/tziJni06kJBEC5OW13d4PNcyNcV
 6DfelLA5jmSd0gkKdRuW9acjj8HoYxZnRCgZwh4qTMo6XPS7BIGM1sE1bSkA5iigGglx
 KKL0FeGLhC5wBlex2xT3W43GUuffxP/NWZ4xJQDsMjXFkPhW48xDRN2ddQDQ67+Imj5r
 hA2iKzH3dnt6j7MtlnE/OGBK9twOqR9WAkVB+dvBxcWnsmjC3kK+ZKxcO0a9qR438lqC
 BwhEcnNswVahg8IqHvxsysfI0MRc8ociGYFLGKpeZ/ExHnUaQCj3qsFNRtnI502tVJg4
 ApKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWtD/TEe250UHjk6klCm4KJGVjq9QANqtB38KitJ/cg=;
 b=7Rx9Z8r1KiJ9lWo+PAoWdFNq3kCVgEy9WXYr1Arf/TSG6+24eQBkh77g2xEoZyOXca
 qHvHD40oo4paf4NENyAEZ5otpjYk0gLEUmwXr1usXAa7Gy7a6V5E2KgNay+cFVAEz+r3
 tokNn6cPutMYy1iweCz6zYjNHCFj2X7n7BU6ZgwupNgdmlp3EsWyE/DFrxGNqpMcGi4n
 WwZdpwCihbT1XIh9ooniKIecHfbv5tC/O2gmv6AEPqMbh5UnvnqK+BdaMgytXT1sxNY0
 VxEEbldwvPr4IJ1tlPfDKxXlcmgpUsD0qcWhMqKET9iL4OuieILQOJ973eGTPqvEHAe3
 zTZA==
X-Gm-Message-State: AFqh2krdBTpQWqBOwJbso4AP598+cfzFQ4cnTJyCZTmsQgipZjg95BsA
 0cDqYm+9PWTuzUoc7dWP8kbMLXzpUMpy8dWr
X-Google-Smtp-Source: AMrXdXuteIDC/nhFnd3xhoSK4LQbIhQOSs2gg8voRi2TXc1aqi+nJ2V5NkckHMhOzCVGDQhDw/Jc9w==
X-Received: by 2002:a17:903:230c:b0:192:64a9:62f5 with SMTP id
 d12-20020a170903230c00b0019264a962f5mr76931754plh.29.1673145450991; 
 Sat, 07 Jan 2023 18:37:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 09/36] tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Sat,  7 Jan 2023 18:36:52 -0800
Message-Id: <20230108023719.2466341-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:52 -0000

Fill in the parameters for the host ABI for Int128.
Adjust tcg_target_call_oarg_reg for _WIN64, and
tcg_out_call for i386 sysv.  Allow TCG_TYPE_V128
stores without AVX enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     | 10 ++++++++++
 tcg/i386/tcg-target.c.inc | 30 +++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7edb7f1d9a..9e0e82d80a 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -100,6 +100,16 @@ typedef enum {
 #endif
 #define TCG_TARGET_CALL_ARG_I32      TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
+#if defined(_WIN64)
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_BY_REF
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_VEC
+#elif TCG_TARGET_REG_BITS == 64
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_NORMAL
+#else
+# define TCG_TARGET_CALL_ARG_I128    TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128    TCG_CALL_RET_BY_REF
+#endif
 
 extern bool have_bmi1;
 extern bool have_popcnt;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index ab6881a4f3..c96b5a6f43 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -115,6 +115,11 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     case TCG_CALL_RET_NORMAL:
         tcg_debug_assert(slot >= 0 && slot <= 1);
         return slot ? TCG_REG_EDX : TCG_REG_EAX;
+#ifdef _WIN64
+    case TCG_CALL_RET_BY_VEC:
+        tcg_debug_assert(slot == 0);
+        return TCG_REG_XMM0;
+#endif
     default:
         g_assert_not_reached();
     }
@@ -1188,9 +1193,16 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
          * The gvec infrastructure is asserts that v128 vector loads
          * and stores use a 16-byte aligned offset.  Validate that the
          * final pointer is aligned by using an insn that will SIGSEGV.
+         *
+         * This specific instance is also used by TCG_CALL_RET_BY_VEC,
+         * for _WIN64, which must have SSE2 but may not have AVX.
          */
         tcg_debug_assert(arg >= 16);
-        tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
+        if (have_avx1) {
+            tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
+        } else {
+            tcg_out_modrm_offset(s, OPC_MOVDQA_WxVx, arg, arg1, arg2);
+        }
         break;
     case TCG_TYPE_V256:
         /*
@@ -1677,6 +1689,22 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
                          const TCGHelperInfo *info)
 {
     tcg_out_branch(s, 1, dest);
+
+#ifndef _WIN32
+    if (TCG_TARGET_REG_BITS == 32 && info->out_kind == TCG_CALL_RET_BY_REF) {
+        /*
+         * The sysv i386 abi for struct return places a reference as the
+         * first argument of the stack, and pops that argument with the
+         * return statement.  Since we want to retain the aligned stack
+         * pointer for the callee, we do not want to actually push that
+         * argument before the call but rely on the normal store to the
+         * stack slot.  But we do need to compensate for the pop in order
+         * to reset our correct stack pointer value.
+         * Pushing a garbage value back onto the stack is quickest.
+         */
+        tcg_out_push(s, TCG_REG_EAX);
+    }
+#endif
 }
 
 static void tcg_out_jmp(TCGContext *s, const tcg_insn_unit *dest)
-- 
2.34.1


