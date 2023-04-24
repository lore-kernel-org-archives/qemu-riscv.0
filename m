Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp2o-0002kt-6T
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0G-0005wv-2a
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp05-0005HG-5C
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso3634513f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315071; x=1684907071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
 b=rVKPE3y/e4mhwCnHFohU2X/wnxZd40F4yQyJ9ssQN+TqCdTmPfdfeqt3x+JVD/OTS6
 mFiGgDyY4qshaxzKI2WzX5BBCcHidS27Hzf3yIiS1ncByqFp9/iBdU1Ya8m/BSDP4kRe
 /dXqr1VlRNCi810rY/J61yBLzDz1UO1nt5WTmP9c0iSXJMAMhUMgBQi8trIOOD10HJbB
 0uaMMexDMpMWou3PlzT8oCoMUfG0fWxNUsoC9WBxMMwoLCVFoAsHtF39DA+WT2NfTzTh
 GUMshHCe502HG1RTkV5HD+C7yF6PIRDi2tG4yb+B0lZF4KuIcdXRUz6qIaFzyGZDQsO5
 deTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315071; x=1684907071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
 b=NXkr4cUNzlcxAUuiHgJ5B/IlFdOBa39Kg0ESgfoKzHKNxKg9eMbBG2RmUYAEqUdi4K
 EZ0rrhLWRPFI1HJd+fCtYZVFXYufdyg7HJvJlRTm26WQFicSAQvdGkvryPovFPyHo/nb
 Fbbn1k1sZrJ4UHWo/RCujPv+QD3TRvZcNY2QbDfQswEc9cLWkDjqJZrB4W/VHgCfZImD
 NThQN13RHlPBoNWFXQ3ZrNWD0/siW0ZEKXSSysP3OrOdGtZiOLplBQKA7wsyMDFoKZnn
 b6rd03XdeinIfXLlxPr0AEy/kZV6/E3sPV1Iqmnaw3bmOKNhxo8ZZUkB+fnw8f9gvG1X
 5emA==
X-Gm-Message-State: AAQBX9eHmpOcHBVthY0kipzpxJVcPnm/VgdCFEjheas7fFSSnjtdjgvD
 6Wbbp7Mri/oa22q5UmLM6RID2Q==
X-Google-Smtp-Source: AKy350ZQOQ7fI5/y2ztgB0L245TKkmVwmvm4e6I03y1t+9g7w0xrbThwKZaaKkxgi0G/BuMXkyjNzw==
X-Received: by 2002:a5d:4c49:0:b0:2fb:f93f:b96 with SMTP id
 n9-20020a5d4c49000000b002fbf93f0b96mr9232857wrt.31.1682315071688; 
 Sun, 23 Apr 2023 22:44:31 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 43/57] tcg/loongarch64: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Mon, 24 Apr 2023 06:40:51 +0100
Message-Id: <20230424054105.1579315-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:44:56 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 37 ++++++++++----------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2f2c34b930..60d2c904dd 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -824,51 +824,36 @@ static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     return reloc_br_sd10k16(s->code_ptr - 1, target);
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_ld_helpers[size], false);
-
-    tcg_out_movext(s, l->type, l->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_A0);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE], false);
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
     return tcg_out_goto(s, l->raddr);
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I32 : TCG_TYPE_I32, TCG_REG_A2,
-                   l->type, size, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_st_helpers[size], false);
-
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
 #else
-- 
2.34.1


