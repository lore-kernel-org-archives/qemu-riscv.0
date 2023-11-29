Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0A9C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 17:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8NzD-00007i-Mv; Wed, 29 Nov 2023 12:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1r8NzB-0008VG-PC
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 12:04:29 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1r8Nz7-0002zV-HU
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 12:04:29 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cfc3f50504so33221545ad.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Nov 2023 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1701277464; x=1701882264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/52Np4NKh02g/xFTctIbb9Rk3QH3KmZVD4jfr+ROnU=;
 b=BnJC9zFaBTE+KuQi+913fgYgJzyoY01SrjzZE7Yi4ApM/KEjTPxZqvQ+JHn6Ke51iY
 1Xsx4wBbB7O7OCF6p5Tj2gR+H/+nQde6l6YplcVJKfnBZ8ks7lzzye71FXFh4L+h1QxT
 LeawK681sb7E/5M+QfzW6m8OlfFygTbqe5TDoU9EIklscjstMQUmRTH2Zcx/Ud2GJLUZ
 FeeZhFD8b81r43BdrFoqJFDlZP9IT+ugiozmyExW3zXlXJKZvDFExSKxwY61DkkAoVWT
 DLdMGY5DerRVPUTDSBW4FFed5FGyBvHvKPCGeslNJYvp0TNU3l9MFkKBTNOtNRcBictI
 ys2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701277464; x=1701882264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/52Np4NKh02g/xFTctIbb9Rk3QH3KmZVD4jfr+ROnU=;
 b=Lqmp1R17y55wy6ePMn2MI6J8U0DQVCc3uBWXrxl6xd48PC39rw7h1YtVhBeGs8uSQR
 exXg5QsicRvQEqYI1ZtNlKR+VB1XcI0hsMSXjE499BeUgInYNUtVQlQW0bbWKP9AK1Lr
 QD3SimCoyaKQaAvJlQXnoCkTgofBl2pK0k0/4DWBsBfCDccxxe+wV0wYCxXNjwKoqeWc
 SQ7bGN/rILrmb9zZl5jJnxOjemmjaVeFwCrTfTzBRgGrD5nB3uOkH8gfNkLqFLjanqEh
 ZY2N3H3hsqUhoL6pyLsrDMD8DOuOiGTT3RTKsCa+5yyrQNTCZgTTBpPreZDtuAKC364U
 Ri0A==
X-Gm-Message-State: AOJu0YzWg9VYIy29TjUTbdnpgrmHae1TgyAIcHpZXzqkRmvVY+dnYff+
 FwWHP3/jXK1GKmqsp0njPWjcEmfg5BjPE0L8yRV5Gg==
X-Google-Smtp-Source: AGHT+IGPkJTg5S4qK9RbfO9IBCM3zCOpCzFFQO5hQQl/OBPXkd7sDcYYORFcpVhkQWVE7/Dm0AMdqA==
X-Received: by 2002:a17:902:d50f:b0:1cf:eacb:a12c with SMTP id
 b15-20020a170902d50f00b001cfeacba12cmr7898292plg.65.1701277464063; 
 Wed, 29 Nov 2023 09:04:24 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 p5-20020a170902eac500b001cfc6838e30sm6921383pld.308.2023.11.29.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:04:23 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: The whole vector register move instructions
 depend on vsew
Date: Thu, 30 Nov 2023 01:03:58 +0800
Message-Id: <20231129170400.21251-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129170400.21251-1-max.chou@sifive.com>
References: <20231129170400.21251-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x634.google.com
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

The RISC-V v spec 16.6 section says that the whole vector register move
instructions operate as if EEW=SEW. So it should depends on the vsew
field of vtype register.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 114ad87397f..3871f0ea73d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3643,8 +3643,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
         uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
         if (s->vstart_eq_zero) {                                        \
-            /* EEW = 8 */                                               \
-            tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
+            tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),                \
                              vreg_ofs(s, a->rs2), maxsz, maxsz);        \
             mark_vs_dirty(s);                                           \
         } else {                                                        \
-- 
2.34.1


