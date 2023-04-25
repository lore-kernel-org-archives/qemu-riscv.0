Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORi-0005WZ-Sv
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR7-0004Cd-8l
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:51 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR2-00052P-UM
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:48 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8b3ecf59fso60914681fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451283; x=1685043283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=IwkSO3oQw9L8O1QXDsNgVkRCSX0gq+onqW4DPhYmvtIipyiZPI/dSH22ogL9sYgee/
 MFC8B9AFkLJ4TWb5ZRlWmXzsbOfOdYo7jhqHnOJoFDYQyi4OYzSsnxQtA4WeCxYdPg1e
 qKFbATzakM38BA4VI8qwLEVue8EhqHYNb5kev4Lc6XB9cmIrk8gtuYdP1UID5n7TSe+g
 8sv3HeqXI0mD3EjNlXWL3MnLMcMzb0SQH+KuOijOOA9M5cHw7XsLOt8Rl+E1oPfCbe3Z
 wJQys438rKFA+Wz3wmkyCxs1Fr6tLHqf5RdyEkuCVQDVAPdA/gvDwNJucTtSvcWAY0pG
 dY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451283; x=1685043283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=BFzEkwFPQo3omCcNFAKJp2SFr/WhEmD3BOv4XoVK+4WgNI6Fj+Rre3xan6qMHGRlc1
 53X+gR/NQ303sOo6o+MouygXeLbKjdrUVcNMjq1VtfnqacdzXT5I0O7iBTWmAqd9wxZf
 u6aqeSkMd22yn5UB8EyPzlSxk8Gx+G33flUMJYW15lYubFoJIvJxAOAC3Ddm+czG5oBz
 PP7G9BGC2q9aqxCeDhkAYgSjYRleTugm0Fvik6YQn0vSDPlU9dwVClf1fAGsUmpNpafZ
 s1lQu0VToUK0Fi6UYS6Sk5th5vNr5jHdpEs0Q8YW5iMq3s/RUmdHN6JJ/NGm0CYqW8fJ
 PNDw==
X-Gm-Message-State: AAQBX9cw0ixeONc8nVLYMJjyR6mO7QoEDUaIXVMPcKMyhHoeF7xg4GUb
 bgYCqUHiJ5iuwqtr0DU7kQQ3MA==
X-Google-Smtp-Source: AKy350bi57A1zTGUBPT5fub/MV3evJt6CfsWOoUPfJrcaM95cjfjM9qGPLJLljQ6J+WPgtzMeEsNug==
X-Received: by 2002:a2e:93cd:0:b0:2ab:24f:c3c1 with SMTP id
 p13-20020a2e93cd000000b002ab024fc3c1mr2713746ljh.46.1682451283114; 
 Tue, 25 Apr 2023 12:34:43 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 29/57] tcg/s390x: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:18 +0100
Message-Id: <20230425193146.2106111-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22d.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:52 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 968977be98..de8aed5f77 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1679,7 +1679,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_TMP0 }
 };
@@ -1716,34 +1715,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
-    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
-                                                 : helper_unaligned_st));
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


