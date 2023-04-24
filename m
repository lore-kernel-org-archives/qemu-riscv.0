Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoxZ-0005db-Ri
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox9-0005Nf-Kr
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowt-0004Hj-2N
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso25505645e9.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314872; x=1684906872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fc0ICmGFK3BYN6uzzR7T3sWoQR2opuLU6c9oEemqdsw=;
 b=dSe09u4ZbZoILZ3YuZJiMrE7CuZ9n5o5k9ddPwTGPA3cD8i7ZN8Jw6mEjqV0Ka0FSH
 MXppi3m8bKj/uDb4Wnq0WcmLI+DkxPs2GUZLrI4i1wORvrXjwxHu0tj9FYhKsK8+71X5
 J0LEktkiYRwFYMkhVvOvuZBQrmMLptLgRv+2Hf5O9dY4dDii6M8/+zLGIjX3k3xmytL4
 VcCfj4xMWdhNzvmDQduOqDzo1VUPup8UWOcInqdGEF0Ytb4+1FIzIRYLp+YBX/DG5oCr
 4u6xpr9Zg0psiD4WLQtyOTeUbYWZdxJ1STtTg8zRHOk5ppxLoFT++H34C3LY23JVwF5f
 z6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314872; x=1684906872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fc0ICmGFK3BYN6uzzR7T3sWoQR2opuLU6c9oEemqdsw=;
 b=M+4ID1SHmSlymyjAzfHsIUkIjz5/5albd2YlyTBiXaIFSWbwWFGGr4G5BqEtF73TAz
 p3qevW8eYdPoPuHeogkAS/T91GWoxO3sabTPjqWs9Y+AEznO36tmFBVfmvMOPrUP6nNp
 1I9IbXBvV5QTRxIksRYVf2XsEzF/uTDxoLVAiaXcHPqPgXHJGQmOxygw8PgEI8T2k2w9
 UCaeoYyKxfwTh9qqVNNiuW1OtrkL2eTPYYIVMTlKrnzg4wt2jtai5uY2oiJCK3FYpzfD
 HO+ogUon/86lFnV3Pn9oT10oK9naciQNM1tDZk8gRHl+FIPeTZxJdCnbJAHlMttIkIo0
 fhMQ==
X-Gm-Message-State: AC+VfDzf2+OY8dxAkwMsSjuZMsq7PJBc/UH7EbNMnxUu0id4tzSM1lMS
 GxYxmAaNF1dxAH2fcDX+6aS+HA==
X-Google-Smtp-Source: ACHHUZ78uHnvVXAGOvD+zdAvQRi2L8nK+UyFGXzqjBGh9P9FUTqK77JZ/ocMAEOnidMK9HABxgetNQ==
X-Received: by 2002:a5d:6610:0:b0:304:7bbe:87f7 with SMTP id
 n16-20020a5d6610000000b003047bbe87f7mr727866wru.58.1682314872656; 
 Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 11/57] tcg/i386: Use indexed addressing for softmmu fast
 path
Date: Mon, 24 Apr 2023 06:40:19 +0100
Message-Id: <20230424054105.1579315-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:32 -0000

Since tcg_out_{ld,st}_helper_args, the slow path no longer requires
the address argument to be set up by the tlb load sequence.  Use a
plain load for the addend and indexed addressing with the original
input address register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 2da6d87c7d..fabb03cd74 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1839,7 +1839,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
     } else {
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
         tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
                      (uintptr_t)l->raddr);
@@ -1912,7 +1913,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
     } else {
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                     tcg_target_call_iarg_regs[2], l->datalo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
@@ -2085,16 +2087,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
                          TCG_REG_L1, TCG_REG_L0, cmp_ofs);
 
-    /*
-     * Prepare for both the fast path add of the tlb addend, and the slow
-     * path function argument setup.
-     */
-    *h = (HostAddress) {
-        .base = TCG_REG_L1,
-        .index = -1
-    };
-    tcg_out_mov(s, ttype, h->base, addrlo);
-
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
     ldst->label_ptr[0] = s->code_ptr;
@@ -2111,10 +2103,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     /* TLB Hit.  */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
+               offsetof(CPUTLBEntry, addend));
 
-    /* add addend(TCG_REG_L0), TCG_REG_L1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, h->base, TCG_REG_L0,
-                         offsetof(CPUTLBEntry, addend));
+    *h = (HostAddress) {
+        .base = addrlo,
+        .index = TCG_REG_L0,
+    };
 #else
     if (a_bits) {
         ldst = new_ldst_label(s);
-- 
2.34.1


