Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47563C77B73
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:20:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q3zGA-0002E9-3v; Tue, 30 May 2023 09:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFf-000217-JH
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:19:04 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFb-0006t5-UH
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:19:02 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-96fbc74fbf1so827913066b.1
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 06:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1685452736; x=1688044736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kKhfZuUHvptmbGv0BOJ1F+/oC8QuzwjZAu+Iu7mwvY=;
 b=XHVnTBh+GAagI1yXqCYh2TUH59DiYf9qIt5dpWKvkBL29q1CIPbyK6XqSVYzDQSXCK
 6SO/z61l7PpGOEJobtshKxZ0yVxFkcQzGIN12xGW5KHmLSAAdGl424/dP/Xb2zLR+kH7
 xjJraK4FdoBiW0n2v3T4niNmJHwomQ+qkneokFExpr+WNOx7vZqgAOgRsOLtg5D00Ik0
 DLMA8Y4fZX7zaNj+a3eN1utz18bLIzXJz9PGBo2AEETHXHCk4AyeiqGTerN9ljYn2biP
 aoWXYm5Geox81Xeun/sKA0nanaZ+80kFubuDsd/ugroSYJbM5qkhR+wi4yJBrq6/jf3g
 pwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452736; x=1688044736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kKhfZuUHvptmbGv0BOJ1F+/oC8QuzwjZAu+Iu7mwvY=;
 b=R2JvlHul/Q05Tda6q9/U4jg6rIJwpjlLLj7zd4qzMhIpAG90fqdWaBpcFKUxk9c/6O
 Nsc126jJDep4+QaLe+sDCZJAZUURWRoECPU3AGNPlo7O7TIB7vnfd5KoodlamPJFK1OR
 F4A0u8V+EVNoAY/5wuPclH9ztCZBl4/vvXg4Oeg6DSAyz7liRjiuxvmlFj8l9zY+j9bp
 zZlXuNAFq+z+GgZ3j7cbUZt7nCK3kTlM2zswkAoC6pdMquxwjrjexED1ARJs+IGH1OJV
 +nt4T4AIJ0n8PX6OYeI3dMsZcXu8oqGryJCNFLawI9VH/3ApFnBSkVMoSchSMF//14AQ
 hQLA==
X-Gm-Message-State: AC+VfDyAvLRDVEWJPXSNITGnpoa/IF30yAs35F1Vl9VZ60SAXD5o/8v9
 kqiFWIUpVwS+j6EoegcZBcn+Cy7pD9wXEX3WgN4=
X-Google-Smtp-Source: ACHHUZ78d8OpCqwYjRhQvjRwtAijmane9j2qJKMcEjYHs5T+I4Ul2vkLMDwNKgVVrSVylK9//4AseA==
X-Received: by 2002:a17:906:6a02:b0:96a:3f29:40d9 with SMTP id
 qw2-20020a1709066a0200b0096a3f2940d9mr2550517ejc.25.1685452735990; 
 Tue, 30 May 2023 06:18:55 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm7376156ejc.66.2023.05.30.06.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:18:55 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 7/9] disas/riscv: Provide infrastructure for vendor extensions
Date: Tue, 30 May 2023 15:18:41 +0200
Message-Id: <20230530131843.1186637-8-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x633.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

A previous patch provides a pointer to the RISCVCPUConfig data.
Let's use this to add the necessary code for vendor extensions.
This patch does not change the current behaviour, but clearly
defines how vendor extension support can be added to the disassembler.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 disas/riscv.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 086edee6a2..db98e3ea6a 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "disas/riscv.h"
+#include "target/riscv/cpu-config.h"
 
 typedef enum {
     /* 0 is reserved for rv_op_illegal. */
@@ -4599,13 +4600,38 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
 /* disassemble instruction */
 
 static void
-disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
+disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
+            struct disassemble_info *info)
 {
+    RISCVCPUConfig *cfg = info->private_data;
     rv_decode dec = { 0 };
     dec.pc = pc;
     dec.inst = inst;
-    dec.opcode_data = rvi_opcode_data;
-    decode_inst_opcode(&dec, isa);
+
+    static const struct {
+        bool (*guard_func)(const RISCVCPUConfig *);
+        const rv_opcode_data *opcode_data;
+        void (*decode_func)(rv_decode *, rv_isa);
+    } decoders[] = {
+        { always_true_p, rvi_opcode_data, decode_inst_opcode },
+    };
+
+    for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
+        bool (*guard_func)(const RISCVCPUConfig *) = decoders[i].guard_func;
+        const rv_opcode_data *opcode_data = decoders[i].opcode_data;
+        void (*decode_func)(rv_decode *, rv_isa) = decoders[i].decode_func;
+
+        if (guard_func(cfg)) {
+            dec.opcode_data = opcode_data;
+            decode_func(&dec, isa);
+            if (dec.op != rv_op_illegal)
+                break;
+        }
+    }
+
+    if (dec.op == rv_op_illegal)
+        dec.opcode_data = rvi_opcode_data;
+
     decode_inst_operands(&dec, isa);
     decode_inst_decompress(&dec, isa);
     decode_inst_lift_pseudo(&dec);
@@ -4659,7 +4685,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
         break;
     }
 
-    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
+    disasm_inst(buf, sizeof(buf), isa, memaddr, inst, info);
     (*info->fprintf_func)(info->stream, "%s", buf);
 
     return len;
-- 
2.40.1


