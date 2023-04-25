Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORS-0004zE-M8
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQu-0003rC-Ol
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:38 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQl-0004te-NT
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:36 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2a8a59daec5so58123391fa.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451266; x=1685043266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBYlnrp5r0dnt/Qn2+Cyqv4p//zkrum+IysmcShvf5s=;
 b=uj33vHSBexalm8f5KqIJMO9XhDCjmVSkS1LQc8ThAQ4Oqp7b4eqjR6EdCeA+r6hQ0z
 W8AqmgUiWrbBPhLZPs2ZEeXrU//HQkxp8dbgs1vtXKvNCfJDqMgrqk12mbHNeZZEDNye
 U6GQXV44r6pPvtwEKBmJcZBZasMx3uYVb0cG4gTF9RGjGqHRKF6mZ4xMlPDrtVd1TQbE
 52pDb6JJAwSiuBb1E1UzARhbdxtwguD2ByTC7yBbKcfFA5ISFn+E/SA0TChS6GFQxrT0
 8sQ30MBXvo8lvD2BHK2kKCkl+hp4kfl4r2oDQoDlnMMyz3LiK0czmBztvARSsM5+626s
 hjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451266; x=1685043266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBYlnrp5r0dnt/Qn2+Cyqv4p//zkrum+IysmcShvf5s=;
 b=AuUNbyV74uFzWfNfoolOH9LcfApzxk18P4fdVkrzhtwi6wYeE/5MUcJ87D/ztVQClR
 agA9WsaeYlXpDlxwrjwroOV4zGyNelS2JFOzogddFi28EcCngVfZwkQAkEKnAbUyeJoA
 XKo5tBT9+2Td1XSbxpIIMvkQRkmt2KZK7ZNvPXCok4tLjf4lz0lp6xBBVCfPJZXkTLqe
 3g+nRCj0JsRPHGFFGU9uH5pM8AtnMK8tQyZ1z5AzRbjwveiuBWPF8Gvf0LwCLw1QSmfH
 VRETZEW9aNrZVjJHJQaCVpe7/kT+LnQ/avNyg3EjVOg2YalZHVUBBYY6aZxmJBteFYsB
 4JrQ==
X-Gm-Message-State: AAQBX9fOCynmrtNYzmxgZnp9s2RS1RvSUZMT5ReQgDcSzs5V7xIfANI9
 gIVbYdunva18mW0LR5ylVUCyiA==
X-Google-Smtp-Source: AKy350Y97NlJuakJkpPj63kA+OaGJSQXS8RqMZLK0Ba0KWu07C7D6KAZzRJkIvrWKc2toE9qT421og==
X-Received: by 2002:a2e:8ecb:0:b0:2a8:ea1e:bdf4 with SMTP id
 e11-20020a2e8ecb000000b002a8ea1ebdf4mr3905958ljl.52.1682451266012; 
 Tue, 25 Apr 2023 12:34:26 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 24/57] tcg/loongarch64: Use full load/store helpers in
 user-only mode
Date: Tue, 25 Apr 2023 20:31:13 +0100
Message-Id: <20230425193146.2106111-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:40 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d1bc29826f..e651ec5c71 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -783,7 +783,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  * Load/store helpers for SoftMMU, and qemu_ld/st implementations
  */
 
-#if defined(CONFIG_SOFTMMU)
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
@@ -822,35 +821,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-#endif /* CONFIG_SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


