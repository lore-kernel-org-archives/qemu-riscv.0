Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORU-00054R-A0
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR0-0003yr-5w
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:45 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQo-0004lG-W5
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:41 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8bbea12d7so61237841fa.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451269; x=1685043269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+P0K5bbe2wOaUg/ZSYckKIQ1gR+lhjFre48UvlDpErQ=;
 b=FSP6bOgzGR5Q2pKiUF7N7/ERmd96FPv6dCD/xt2coqsO1JgZpuYsOM04rhCDlQR5Zz
 gt1NU2t7RzCcd8Hb+7YXO+JprNCrR6E5nHPp/TJgUYFHTgTWiUvvmJr5k+G0jHXgRzjI
 XCse2YoulRFIR6/rFlttampKkt3aWDUUZNQ3AGc/6ruXD6OhBebR9cdsMnt/QOBxBf8g
 eKVKL4yLKldJiTh3vsTKGkAMmx5bzoHz2DHKpPXqh3zDdkyUKkEg7JyQg8FiQPrjrpJg
 UM4Aeddef8I5XTirfhw3lly2KJj1IV8OLnRSyIX6BxYfFzPM5Jbal1TXMlWde7qhiBuH
 Ixzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451269; x=1685043269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+P0K5bbe2wOaUg/ZSYckKIQ1gR+lhjFre48UvlDpErQ=;
 b=HQmDW9SIHv8dFuTg+dO+Dp8Tlz46OZ6gPvEQx4fSrNyOme75Yb1xoBLL8vkUjhJAVu
 L9/upq/woIPQhE3qtW457Mj+zdLOFSx+49L2u+NS/W0HtVd57BOR8HR3Fi0Z3xzNVf0e
 JkMUosMjMDBxy4LayGZHcBFpZ6ICRAntSZ1ECO8yldF4Ejy9DqFrBck6Z4HCQiIuRYsc
 KhSHC7ZwBLgjv9fWE8IR1Q01Z45+tai6IjPUlbwbfi3FlqKYt1bDMs2JdeGp8AntJtO4
 lSD053U1ZqAGMDAdfeSJVhIdr8volTxf+PMz21fQ3eD7stq43jg+jUbWjOYDRLQBbUh7
 x27A==
X-Gm-Message-State: AAQBX9c7Lq4l8IpEmzIENG2P5ZiY1eNhkphYXceqDU5Rop/tZTYS3AkM
 bO+rgxkNqk8qrkqp/Y6Zx/x46w==
X-Google-Smtp-Source: AKy350Z66EbSsN1FMUksOA1r4pJ+DjVAnpmgE+I343JZhKOoxFci9/6QnTRqd46yV3K2/PhGwm5ZHw==
X-Received: by 2002:a2e:8189:0:b0:2aa:3c81:db92 with SMTP id
 e9-20020a2e8189000000b002aa3c81db92mr3777802ljg.19.1682451269120; 
 Tue, 25 Apr 2023 12:34:29 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 25/57] tcg/riscv: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:14 +0100
Message-Id: <20230425193146.2106111-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x236.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:45 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1f101cbf35..8522561a28 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -860,7 +860,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  * Load/store and TLB
  */
 
-#if defined(CONFIG_SOFTMMU)
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -907,34 +906,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
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
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


