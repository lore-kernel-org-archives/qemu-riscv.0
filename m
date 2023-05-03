Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6SK-0001Vl-RR
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rm-0000Cu-Bz
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R5-0001y8-Be
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso31612785e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097077; x=1685689077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THr56viFSCoeoB94R860jIkFCIZg6mn2iR9owpi8fGQ=;
 b=z8P5y9mwHfOkMgNqWUOjU8Ezx/cT5AfA0I+6ulzyRBWeQb6W+gJZPDhV9SavwQGHse
 TdU4nj7XVxoRG/CkdvH4E2ZDz4NfesgO11emgziCBKQ/PrKMCy9Fg+zB2P0rWhgEXv4/
 NXkklkvdPzpXX5w3ubLSwxf09hIWMEO8TvtJN4Kl28njbxEurCgckvm93Jkimz2lF5NL
 VhiWQ4AlpRV7shsftGS4LGAnpoyucohl/0TLz15zkSX954cOZA4IuWil6zu2ID8x9akc
 wuGm4UYi3SbyKmaLpZbiXwmTv6pWMURzASgjsXk7WUd4q1EzkBBbifY0DJI9WISlRvZs
 /UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097077; x=1685689077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THr56viFSCoeoB94R860jIkFCIZg6mn2iR9owpi8fGQ=;
 b=I2GpyosJPh/za2tEElkaxoYoJyF4kzPXQYVgXX15NcRPggY46SkAQEZz3PcANeMasl
 hw2FzMFeFRWFbLphFrU4e7LDhVnxH15owehFmAKj+hGny560lA1DBDcjvBI3N2afBtC9
 /h6cPfwe7yBNz/JcFtQBcgRW8Qk8WrJbQSXWaK67KdKGoQUICRfKDZVrcesb3L7tCO51
 O2jWs9ydWzW2+OOLCeDHQL0/Vxm3C9UHPO/g01AZKpg/WJPb8ipyuma9bf80o1c/jhco
 Z33EALm0HuWouaBuuLLYil/PrkRaSiLhN4DfK6wSwLph4OioEfTIIM+sNwC6YbSOta0+
 jYlg==
X-Gm-Message-State: AC+VfDyTExJQuaRb6KWB03/3Jz5lTPXqybgz9CpBgycq0bSNDGABLglK
 VDkl2hAunvXLwo948plwDkGvAA==
X-Google-Smtp-Source: ACHHUZ7jAsAvV4MDiwO6wJ0pYNlJFGjl7eHyZKERbejNVeSAcrryDArzd7Ye6qwK3HaM/n5yG91b2g==
X-Received: by 2002:a7b:c8c3:0:b0:3f1:6f53:7207 with SMTP id
 f3-20020a7bc8c3000000b003f16f537207mr13382881wml.17.1683097077565; 
 Tue, 02 May 2023 23:57:57 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 35/54] tcg/i386: Convert tcg_out_qemu_ld_slow_path
Date: Wed,  3 May 2023 07:57:10 +0100
Message-Id: <20230503065729.1745843-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:59:03 -0000

Use tcg_out_ld_helper_args and tcg_out_ld_helper_ret.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 71 +++++++++++++++------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 8752968af2..17ad3c5963 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1802,13 +1802,37 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
+/*
+ * Because i686 has no register parameters and because x86_64 has xchg
+ * to handle addr/data register overlap, we have placed all input arguments
+ * before we need might need a scratch reg.
+ *
+ * Even then, a scratch is only needed for l->raddr.  Rather than expose
+ * a general-purpose scratch when we don't actually know it's available,
+ * use the ra_gen hook to load into RAX if needed.
+ */
+#if TCG_TARGET_REG_BITS == 64
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_RAX;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, arg, (uintptr_t)l->raddr);
+    return arg;
+}
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen
+};
+#else
+static const TCGLdstHelperParam ldst_helper_param = { };
+#endif
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1817,49 +1841,10 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
-        tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
-                     (uintptr_t)l->raddr);
-    }
-
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
 
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        TCGMovExtend ext[2] = {
-            { .dst = l->datalo_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_EAX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = l->datahi_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_EDX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], -1);
-    } else {
-        tcg_out_movext(s, l->type, l->datalo_reg,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
-    }
-
-    /* Jump to the code corresponding to next IR of qemu_st */
     tcg_out_jmp(s, l->raddr);
     return true;
 }
-- 
2.34.1


