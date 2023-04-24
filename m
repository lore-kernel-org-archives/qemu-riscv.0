Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp0H-0005zd-Uj
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp05-0005oa-W9
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:34 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp03-0005GF-V9
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so2315634f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315070; x=1684907070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DyXO1yYcoTiYsNUxk6ECTx6lZnwHVIRHDFe68cV9zdA=;
 b=YZBvyGuOvS/vA+39E37lzl8UtM30hnbyl0tDA4NFVjtC5Imy4JYHSkLQW6sgwTlWWu
 t5vpH0qwQ8kgQMTaRmjvrxzNWROPtXRdDoNvRpSmOYDkwAXXIIosXCEc5zT3tapMshVE
 aafIzzWBXiePhENeOdtVjkhvw/+HukVYAThazgZzbek6OcqW/42w+oIyrQJNRUk7VFI+
 /NSo2zRcFQInRHCWZscT4QClcrsbiEaHQrTMkvpRkDYn8S6Eb/rylGUrVFcbn4UO637Q
 spcNOK7f4RCZvB1coyDPf6u8YQ+mfYXi2CKt/2xoXItJXHJOjvYG6KIID2zSLeic+0SW
 2ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315070; x=1684907070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DyXO1yYcoTiYsNUxk6ECTx6lZnwHVIRHDFe68cV9zdA=;
 b=h2VZOlmaDfECddFSoEKPGvauH+jaTt6tGG7KOdEeZcl6RmVzu81GvYprQ79xOeGZnc
 xpDzG9Tnq9vO6HtPeL3wqJmq4yt7GlVDDSYAKdqgvwOhORnHYu1gkq3UqlAAuhfELw+B
 l2S5/t8vl0C07ECR/xACdVrbhxWtTkU1n5RVUnUUq+W4OQOdjhYUNtukF+m9DrbFSVkH
 Y9v5YpCehMeeaiHGNvmg2VEoZZjnG0kLb+HFMTeOQu0IUxeyBa1cXActZl2GD7EhmTi+
 +uwK+ZIBGRhW40JwMfZYQllJ9pxzvGit3RIYz2w/hFzJIqSlPWOdlZwUB3CnST/vHqLj
 PVTw==
X-Gm-Message-State: AAQBX9eIxuL3k4vvcA/P6qfDAqZh4dfz9IXAUwz/nbwNcXSFc4pafqCn
 sNRpbvrsrUqQhcpVl5QTHqqUWA==
X-Google-Smtp-Source: AKy350aQouMkGToA8Z1zbs0X+IH7dLoh8VRABiD0FHGqnV7UCqkWvsjp02Fj5AsEvpUkRI0NKL0lyA==
X-Received: by 2002:adf:f009:0:b0:2ee:f77f:3d02 with SMTP id
 j9-20020adff009000000b002eef77f3d02mr8000129wro.0.1682315069858; 
 Sun, 23 Apr 2023 22:44:29 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 40/57] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Mon, 24 Apr 2023 06:40:48 +0100
Message-Id: <20230424054105.1579315-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:44:34 -0000

Use tcg_out_st_helper_args.  This eliminates the use of a tail call to
the store helper.  This may or may not be an improvement, depending on
the call/return branch prediction of the host microarchitecture.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 57 +++------------------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4f3a7c7a6d..b77a4c71a6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1856,11 +1856,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  */
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    TCGReg retaddr;
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1868,56 +1865,10 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_branch(s, 1, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
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
-        tcg_out_st(s, TCG_TYPE_I32, l->datalo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (s_bits == MO_64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        retaddr = TCG_REG_EAX;
-        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                    tcg_target_call_iarg_regs[2], l->datalo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
-
-        if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
-            retaddr = tcg_target_call_iarg_regs[4];
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        } else {
-            retaddr = TCG_REG_RAX;
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-            tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP,
-                       TCG_TARGET_CALL_STACK_OFFSET);
-        }
-    }
-
-    /* "Tail call" to the helper, with the return address back inline.  */
-    tcg_out_push(s, retaddr);
-    tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_jmp(s, l->raddr);
     return true;
 }
 #else
-- 
2.34.1


