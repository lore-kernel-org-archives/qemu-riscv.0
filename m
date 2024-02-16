Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF43C48260
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 13:57:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rayiy-0006P9-PZ; Fri, 16 Feb 2024 08:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayif-0006Fi-On
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:57:37 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rayid-0003eE-4x
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 08:57:37 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d7232dcb3eso5300225ad.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 05:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708091851; x=1708696651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pILAc4QGfEWQVoqeGm6TwPW8gXNmDL3KNUvGgdYo3Y=;
 b=D8t+XLv1MjkVJ81CFq343dAtMU3B6LNhYMm+RfGrVl7FeWtfukd2mGDmEM6z2gVrPo
 IOO9KkJsbiFTdN4CkOiG6aEL/V1MAP0wvIQBVNp5IOo3N5jB5tE+luuUlWhjFCEaMFRX
 OiuOdfO+XDg1OguL3zKnDxiPVeK8DWZIuNCLOWGdGvwF3EbnLuBKsxMBNcWfMthDxOaj
 jkgdUpC2QNE9LHX1hr8jQ1PXMPwZ/wJ4xd/Y53sxOdC35zUVtTtuExZUrrgNtyJq4q1E
 NIUh9zq2+Y97I5UL0YHFMu7nElXDPb1GIKa98YEfQtBKFBbXYngnhW30UEiPHyVRBUQH
 t/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708091851; x=1708696651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pILAc4QGfEWQVoqeGm6TwPW8gXNmDL3KNUvGgdYo3Y=;
 b=IXjftAZUCtlBUKLqN3rJGzmJja19T6XjUZwXBzepMTkFGaMUa4A+iuiOp0cuFKpdo1
 3rCfl+aJIImCxouDRUyOg1lkyjpWxQE07L4tK/euh5gOhIIxUFlgn+4XvvNfYew4cERQ
 IsHabsy6wX25bvLPtVBmZR4WIf50WLji5njyfwhJyJU3ZBwukPfw0F6tAbPJOH1lt63R
 KQhQ7N+fbKRTC2Ef3rnOlU8xBjzb8bxT9x0lMlj4bYFW3ynif7Cv7n7hDUE9sZNSQEpZ
 hIXEgHnVuKaD/PxiKBNPT1li5HZ5NdXXlfx+SRwBQFVfh7d0imV5pYCiks85/l45WhCW
 Dvkg==
X-Gm-Message-State: AOJu0YwQTSSxtmVhdGSVMxm53cFp/3ouY2DctE5HMfkzuo87oepm+8GD
 /oyS9R+nl8qZzlgRYgaYGcpCJyAMKU/vgoyjOUQIlz6UdHp14ldJhJjsY+6NC0E=
X-Google-Smtp-Source: AGHT+IFp9m72nD3whodcQWSNQXB1YZ6oZB0wyflG0dNdFBFA/5lFZkTT+/5Qy1oYjVIBYg78blyo4w==
X-Received: by 2002:a17:903:244e:b0:1da:20c4:5110 with SMTP id
 l14-20020a170903244e00b001da20c45110mr6161282pls.16.1708091851596; 
 Fri, 16 Feb 2024 05:57:31 -0800 (PST)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 j18-20020a170902c3d200b001dbb06b6138sm889606plj.252.2024.02.16.05.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 05:57:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/3] trans_rvv.c.inc: write CSRs must call mark_vs_dirty()
 too
Date: Fri, 16 Feb 2024 10:57:17 -0300
Message-ID: <20240216135719.1034289-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216135719.1034289-1-dbarboza@ventanamicro.com>
References: <20240216135719.1034289-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

In the Vector spec section 3.2 [1]:

"When mstatus.VS is set to Initial or Clean, executing any instruction
 that changes vector state, including the vector CSRs, will change
 mstatus.VS to Dirty."

ldst_us_trans(), ldst_stride_trans(), ldst_index_trans() and
ldst_whole_trans() will change vector state regardless of being a store
op or not. Stores will set env->vstart to zero after execution (see
vext_ldst_us() in vector_helper.c), and this is vector CSR state change.

[1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#vector-start-index-csr-vstart

Fixes: 8e1ee1fb57 ("target/riscv: rvv-1.0: add translation-time vector context status")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9e101ab434..044c9c903e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -638,10 +638,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     fn(dest, mask, base, tcg_env, desc);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
-
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -799,10 +796,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
 
     fn(dest, mask, base, stride, tcg_env, desc);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
-
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -906,10 +900,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 
     fn(dest, mask, base, index, tcg_env, desc);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
-
+    mark_vs_dirty(s);
     gen_set_label(over);
     return true;
 }
@@ -1104,9 +1095,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
 
     fn(dest, base, tcg_env, desc);
 
-    if (!is_store) {
-        mark_vs_dirty(s);
-    }
+    mark_vs_dirty(s);
     gen_set_label(over);
 
     return true;
-- 
2.43.0


