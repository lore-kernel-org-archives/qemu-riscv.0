Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bB-0001CE-0v
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aU-0006vz-W4
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:43 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a3-0005jU-3S
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:42 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso29994755e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097633; x=1685689633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbibCyTnr9kxedetkEeMeR0n/g84TcpVDVIMMTB9mS4=;
 b=cujk5uo0cS3wrev1l1yyS8/Z9ALAiUePLuWendhDGafxK5Pn8UE9fi737stdRe971n
 ZJ5DxBzfu5pcDmaN7YRdnfOdjtEzBZMgJ/MgfJCf86VE/wab5v30oizEvK7umMWb1y6c
 wtD93PUD3NI8usE8nZuHa7ygSiEtSQtfLIs3MN9+C5KMEacnoiiv9GZf49LqUML6diG1
 E7LImcMVQF85JPkQuGDB5iLOJUVbTYw3h6uPXcueNI7esn7fbf7cPvf9jI49igKIshUF
 U4vpykI/1T0LMDrhcU/jV6rAcss2TaRPe1SJobtMadXXtWNfYqCOpqIOc0iqE9Tdk3Np
 9LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097633; x=1685689633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbibCyTnr9kxedetkEeMeR0n/g84TcpVDVIMMTB9mS4=;
 b=Xp844BP6PadVpDC0gBz37f4Euhvasm/Q4Q7AeIMkjWfMr/Ky/y79PGDLDbg95Q9Ywr
 3pAc8aD3/dJEDfhKktB5P4QQwU50xfCvAd52YNMrRlsaw4FJZ68xiJe7ouBdV9tA19sD
 L5DN6y79/Szab1f6H3F1xl5vyUXjNGeBMRNxI75ZulD0OwZvwWzft2L5nLnZkavwpTsW
 G4Z3/NxQiTHSf1TnNqI4VjlMeX7St3dHhEToR6JHvXIID2iequeX6ekCtblfSoW+Pqsl
 A8r2/y6C7oN/3HjAMCj/wXi5imOseI9RqWjWrhlRaRZe6E6ReMQjxedH9oaH3XLTDvhe
 Afwg==
X-Gm-Message-State: AC+VfDy0YUH29jJyuK4p5d5sDRX/5cir1duz6ShHxIAHLRU0fhdejJ7K
 5OTRCfga5gCwnMh3v5yCmBojMg==
X-Google-Smtp-Source: ACHHUZ77CI9R7m2s+iyk260kgXpzENxZYp33g70YqWeQRq7A8iHKHl7NDnYlNm93BCz4KBOH71X+tQ==
X-Received: by 2002:a7b:c7d0:0:b0:3f1:75b3:60df with SMTP id
 z16-20020a7bc7d0000000b003f175b360dfmr13232821wmk.41.1683097633369; 
 Wed, 03 May 2023 00:07:13 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 21/57] tcg/i386: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:20 +0100
Message-Id: <20230503070656.1746170-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:43 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 52 +++------------------------------------
 1 file changed, 4 insertions(+), 48 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f838683fc3..e78d4d4aa7 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1776,7 +1776,6 @@ typedef struct {
     int seg;
 } HostAddress;
 
-#if defined(CONFIG_SOFTMMU)
 /*
  * Because i686 has no register parameters and because x86_64 has xchg
  * to handle addr/data register overlap, we have placed all input arguments
@@ -1812,7 +1811,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (label_ptr[1]) {
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
@@ -1834,7 +1833,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (label_ptr[1]) {
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
@@ -1844,51 +1843,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_jmp(s, l->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    tcg_patch32(l->label_ptr[0], s->code_ptr - l->label_ptr[0] - 4);
-
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_pushi(s, (uintptr_t)l->raddr);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RAX, (uintptr_t)l->raddr);
-        tcg_out_push(s, TCG_REG_RAX);
-    }
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_jmp(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                  : helper_unaligned_st));
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
 
+#ifndef CONFIG_SOFTMMU
 static HostAddress x86_guest_base = {
     .index = -1
 };
@@ -1920,7 +1876,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 #endif /* setup_guest_base_seg */
-#endif /* SOFTMMU */
+#endif /* !SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


