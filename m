Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bQ-0002YH-4a
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ag-0007wO-2k
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a8-0005nQ-Uf
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so30035745e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=xEoYu6rgIF7QNrJmJ6vMWfNALnwaHb784XkbcKgFVKWar4VcaTkyqJO7HDyqCp704+
 +1F0oSztq27LXj7ABPJe0yI5iyWbCuWU8Xj5RpO3wlNf8PJYEx0CakmSFxzKqJlo/aSL
 Uxl73qkemxXGHMK92BUu0J4Z7vXmH0Z3t1jCW6DlUvYdLHN33k7/LKoowx5dBZbXls+Y
 1Gi1+ziQVU6YVFOVwrU58MOoMAVSaZS1lRtKNkusbPHTatWlATqRBPci1nb1uyhntYml
 K1SGwBeohpbaezcj5HOFgKohSQnNmPgp/1LV/Gl3NXpWSGrrDS9Y0iLQQj/KcfQy99Kq
 Dd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=CL46eJXxQrT8ny6l1keVzBWspe2N4JgHqVwd2CPmvTc11Re1qYQwC6k+B3kL3IAiT5
 SHdppMNQ95Lmnu3fBeXFhKzCrfPKgY+zMgS66QWhBxFiVP2T++pEUOBErKmcSqNkm9CS
 cxmWF4jnkT/3ciikIN/+PwlgUat7pTjoHZsaOzas36s5zNx0BrUKJRYlak5IdW2hViRr
 fBP0E0y5u8MleM/kfe3QsOFBwhwfFfEAisBdGyXjxFZcgdxgArUAtntR4qRce5P375A/
 ne7euNhh0xWM+jKxmbcnlfnJX8f+SXVxo52QQ1wOxNOOyJXsEQkhdGISyKPba42BFojs
 +dfA==
X-Gm-Message-State: AC+VfDxjRMOJ6tijzqBwzkGgXlrqr+XqAEY+ztRNW17p48pQP89csmcf
 r7CKsF3f73yrFxVTUbroknwgkG7TiZkmsCj9zsGgRg==
X-Google-Smtp-Source: ACHHUZ76K7TpO8C2GgUPzU5B9miuhkVTan5RyjIw68EhaC5yFxW30EYGv+OwfkLnlPWiINrmZlTdyw==
X-Received: by 2002:a1c:4b1a:0:b0:3f3:195b:d17c with SMTP id
 y26-20020a1c4b1a000000b003f3195bd17cmr13898157wma.24.1683097639427; 
 Wed, 03 May 2023 00:07:19 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 29/57] tcg/s390x: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:28 +0100
Message-Id: <20230503070656.1746170-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:54 -0000

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


