Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp2U-0000k4-Go
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0X-0006Ec-3x
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0F-0005Ma-Sz
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso2305220f8f.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315079; x=1684907079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=loIzhHVZ8cgAyCUje2Ol0tC5Qt51NjEgcT4ZD9Zb1mlwqhk0tOlMugfWrtEQagx2wY
 qlw1gWu0L20Oe1mD+X/Cu1PUaIJPx5hT0Nc3AYOxMWStRTDn0GmixILlCWyE1l4BnG2K
 JyFl6h3Zj/bPkuiXJq1fZdiMW166ZnvVkh4AvFu0uVQLQXFdvbjYk2qrJDJwj/DGh0nR
 ViyYKW+q5Srv1AqV36Eaz0AcUSfD1Q6ZyCNlpSYyVwELChJUh1YCJQcsLQBqmgS6EpAu
 j6HqXMqv0n+Dp9qbp2SDhNprGk1g7cfhJemzPLI/j4IhSTVqzmFoU5x96cYcbQbNE53X
 xnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315079; x=1684907079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=gN7AqEfwwAGDQiXpj/R61gIXGf9PaC+veslpb/DT3qD80BSgHxffZlybp3G+gjvQyc
 0KI1B4ESLUAwqzwnYTYeePn5SbwSdd2FiIM8HNJkuO/mY/KES0I5Nd9RbgfG0Mzb9OIl
 vFLHcpNm5zFGuypK3X2Zn/cecDqzILAta6HrbNrkAmRKrL8gLFMu/zwU8wgitMyyD7Xu
 +STA9Kru1M4sebV3Y6+1HOhupw5SZsYhFKOZxdWe0/hlNSZ9x1rZei0iq3JFRX56HsjA
 fTpH/ACKEGcqao4qGRCy2A+REc94Ray9SVz3MrrHpIVi8NwcIopMl12ZlIG4pqJrnTRj
 t8dg==
X-Gm-Message-State: AAQBX9ecceQfFbquCRZPqskKlCkD2E09Kgx+EQj0U8M80FKyRB1F2Dsz
 iimopxk1dCM4C4DRFzL+/n1+0g==
X-Google-Smtp-Source: AKy350YLuLGV8ZheQEDDsp8qyRoZQukAvkXyZKEyz/r7xn8sYqfCboOZzm2FV6WC52pWumUTwABB3A==
X-Received: by 2002:a5d:428e:0:b0:2f9:b08a:a3af with SMTP id
 k14-20020a5d428e000000b002f9b08aa3afmr7404891wrq.49.1682315079542; 
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 56/57] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Mon, 24 Apr 2023 06:41:04 +0100
Message-Id: <20230424054105.1579315-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:45:20 -0000

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1


