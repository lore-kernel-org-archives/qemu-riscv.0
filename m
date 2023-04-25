Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORD-0004Nt-Jk
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQm-0003f9-C3
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:28 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQb-0004XQ-9V
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:28 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8ba5f1d6bso59716431fa.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451256; x=1685043256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFNpxX1Hv6Le1GaviCqP+AapXmbmH1XTYQpvYr8uxBQ=;
 b=YBfr66RdtnWQf+hrljta2rDzeYB9pqMHrJtK+nUBSjkI3PYUyyJfkw4OW5eazv1ez5
 lUpqRfrpElF/MqdZlyDNUkIbUikOH2niM99aEyHrzpWjPcqzlWcYMKCFxTtWcZEShwST
 EAVz9TTTmmGBHlek84hhDgtvkRknjJpZAOOZv3xOSIn/5Q61YkxMdHNSkP2h5vxC6I2l
 K2uLtm11lcDDHahT4Q/3bn6u37NdQQNPutxvaj8D4tkBjx5PDf/h/bDjUNW6eF8S3p3K
 Qk/5ypr3xXpX4QGRRXpnVNIGCAApdow6nrhfkcFa5aoYeV0qhC1BgeaePhvzz8b93oSC
 kgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451256; x=1685043256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFNpxX1Hv6Le1GaviCqP+AapXmbmH1XTYQpvYr8uxBQ=;
 b=EvbnFsr8or5U6iv4S+7/telMOde2iWmBgu+MbUgdQRPYhfSbpeqcIr1oFM2Gu9pCrb
 2866B3vM2UrMb2hhadK3KM6+/ROZdmMKHeBzoMQqn+qWSfYpB4c8QQlvZeB6aUrxHRvj
 Lp1xoy2BNgmGeFR6jhuqspQzJLcQ31+XsChGe6BnIKuneLDrAUDT2ymeNET9CQThtQdy
 614zOaHR60JqD/TpXfx4ZNbdZ9eNROg6+kwgqGEwxz17bTsjrgGbvFg80972Jp68Jbv7
 zCq6ccOkyzKNtVgZpoTqmENx8ZDkdF8pV77OEl94Kd9VXnMr6II0WGijlJpFjNytWoB9
 SjBw==
X-Gm-Message-State: AAQBX9eH9qmZJGAqMP1cjtM2vvwS6+agM096j7HE4QRy3u8fEwHLEwUW
 fAl0xe4rI7971F2zz6nVWuB9qA==
X-Google-Smtp-Source: AKy350aydods0stlkfpuPVcegEFBm5WwuKAPWsPL68srfFv/SGHp3Fl9DWxJYGCKHYkIZ1PfOizbAQ==
X-Received: by 2002:a2e:3e1a:0:b0:2a8:c42f:6913 with SMTP id
 l26-20020a2e3e1a000000b002a8c42f6913mr3418897lja.36.1682451256425; 
 Tue, 25 Apr 2023 12:34:16 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 21/57] tcg/i386: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:10 +0100
Message-Id: <20230425193146.2106111-22-richard.henderson@linaro.org>
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:28 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 48 ++-------------------------------------
 1 file changed, 2 insertions(+), 46 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 696c656f3b..32ef9ad4e4 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1778,7 +1778,6 @@ typedef struct {
     int seg;
 } HostAddress;
 
-#if defined(CONFIG_SOFTMMU)
 /*
  * Because i686 has no register parameters and because x86_64 has xchg
  * to handle addr/data register overlap, we have placed all input arguments
@@ -1846,51 +1845,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1922,7 +1878,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 #endif /* setup_guest_base_seg */
-#endif /* SOFTMMU */
+#endif /* !SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


