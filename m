Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5BEC77B7F
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 13:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uV9AF-0007yA-03; Fri, 27 Jun 2025 09:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uV9AD-0007xv-4a
 for qemu-riscv@nongnu.org; Fri, 27 Jun 2025 09:30:45 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uV9A5-0006JY-Q7
 for qemu-riscv@nongnu.org; Fri, 27 Jun 2025 09:30:44 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-3138e64b42aso2578992a91.0
 for <qemu-riscv@nongnu.org>; Fri, 27 Jun 2025 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1751031034; x=1751635834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQ/ELmtpaVFDvL8MnrTDwR7mnKt6S4FAnUnxosIKkao=;
 b=PEyYXoo4XYaVbXH7xGSyp4WMMlsj8A+t1fDXmTMbDBSSu6VBxUYUcSszQKkNsbEYs0
 t0XkWf5/GBzKsOayXdCM898yuweAXQjAY01wr16WEAhve5wgOkFhwrLqkXJiIj31N8yx
 dqQwXD4aAOHZuOuVetaS3oV1gkcw+ixtI/XhDwacCiC45hEgAOJreDoH08903rxeHP7N
 8qLw5/1zp7F27P1GnfZ13t7ZWlzRmaO6SXah5FdTeXN2v9ECQ1JeCuSRh2+CPiV9lW/H
 EfAJf0kyJaLq0Nq0Hl8l0cEMtI6yUA5ybxL9ndHarc/ZGY2sVFV9aPZUIgQVlVDZ8Aqy
 1eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751031034; x=1751635834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQ/ELmtpaVFDvL8MnrTDwR7mnKt6S4FAnUnxosIKkao=;
 b=JO7G+qCHC0kU215yjlfYssob1zeKN5y5i3pzz1wK0RtuZg9Bi69zWla+zVkVGjnJY8
 itYRqwHfV7MbkFWCvPHDopDnvEOaHjVv+mAJOcke8JyqCqJwHITJ+BfltCq/Psyj+ZD1
 9EH2zz21XO8U88G4MWqty/tLO1345+fU3Cnvdx0uO8N5fYWGH8OvLoTip4xFOVGJ6MlZ
 b/BrfEh0FGVUI3ROv7cCY4IK9NheffHyqpXKEW8rQEQ8MCpuawJY3LiOKSFp3ThWArNd
 nbTELXUCm6EEGXH+qTmlfLjsSi9dpIWhVKLfiLRT5JmyPlGcA1ux9A5ZvnzjdzD8k75J
 UxPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKcRyl4Tp+sJlgi+rdW76urdiipvfn13N85df6M4fbT1pbkCz6ZUs3XGx5Uz+UK1hj4SPU3l75uApv@nongnu.org
X-Gm-Message-State: AOJu0Yx8z7ltUmfRd+q6iM+g1VMdG1D829Q56lSqw0i3Fmy7RJqbVUll
 4XMNrC6W6ifvs6WJHkpqll31lv1SmVapPWhMgeKsmf2H5bjmkSmGMXk67KD8RfHEDK4=
X-Gm-Gg: ASbGnctlWWY1qx3c75byrV0Id2in9x8HokffcbkGf3KDHC4dNdi4kVFX70Elbb5F276
 EDG4Xk69iGsFw4fFt5ZD0WTFpawFuWZFOnWeFy0cUoAFjJJy4uaLS0J2F1s2qcH5yOVo2YoQ//O
 JlNI+glA49ZJjg5l+52OGM4/S0Ib9rBKMy5i6t5u6D7D+voWp5zWDDRdNAR+et0HbiXyNTMxtas
 kLVFVyHqnwAmxO34p1c85Q1nd35/NM5tnYhKUktP4tV6mmTJB9K60ESbUJsnAk/P/48/0Gr2ZAA
 CRUQpIQ1CY3OPdFUYwOUAgFjt6I7fByIsWP9qHOzpdTzqs+nFtzZvOv1i5l8kr2mR+F+UUwHVcB
 XjMaMOy1w8jpdMKZubZsCL3yJRShuvDw=
X-Google-Smtp-Source: AGHT+IHo/1pkGyRXMTpDt1BUaqnsvjB72HFzpFQPqFL24ak8/5CwEHR0kyNZQ2yxclpTlO2pP+XG8w==
X-Received: by 2002:a17:90b:2ecd:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-318c93252f0mr4647020a91.33.1751031034466; 
 Fri, 27 Jun 2025 06:30:34 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c15232c9sm2489462a91.45.2025.06.27.06.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 06:30:34 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH] target/riscv: rvv: Fix missing exit TB flow for ldff_trans
Date: Fri, 27 Jun 2025 21:30:13 +0800
Message-ID: <20250627133013.443997-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

According to the V spec, the vector fault-only-first load instructions
may change the VL CSR.
So the ldff_trans TCG translation function should generate the
lookup_and_goto_ptr flow as the vsetvl/vsetvli translation function to
make sure the vl_eq_vlmax TB flag is correct.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2b6077ac067..4cd030c7eb3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1361,6 +1361,12 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     fn(dest, mask, base, tcg_env, desc);
 
     finalize_rvv_inst(s);
+
+    /* vector unit-stride fault-only-first load may modify vl CSR */
+    gen_update_pc(s, s->cur_insn_len);
+    lookup_and_goto_ptr(s);
+    s->base.is_jmp = DISAS_NORETURN;
+
     return true;
 }
 
-- 
2.43.0


