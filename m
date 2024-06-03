Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F62C25B76
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 06:06:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0pa-0005AA-Db; Mon, 03 Jun 2024 02:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0pY-00057H-TZ
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:06:04 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0pL-0008EG-Av
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:06:04 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-6c4f3e0e3d2so1931711a12.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 23:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717394750; x=1717999550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZZeVZfTb6CcRp0fbJrDOuWmSfqLenkD1dzMHxuQY9o=;
 b=PGaVJGNkSUM8JyGpiipPHEhHV/NKTbCPpv/Va0+dklTPuu/KFPLWdhR+ZnRKvaaF7c
 +Qqclvjas7DeqpQEMPQuukgcl0QeHRKxLHnk7wi+Cagwc09mf6fNpVnNo2JDMTrhN4tY
 P/vClhMCXUGnoAO/stMMILHmISsAnAXeEPhkok8zsVV/FBEGKyWjg+h1v8kqafEIdbor
 IyUm3BN0EO0XP4RDlgiKzocFZ/w7FmTyFYLqfpiiVErdiDdn4K6NbYYInjFOWx2lCpUR
 v0qtsu6cqcJjqNlCdLXKfqB6PpQtEKzyykpOUY2uwiLmNU4FivbuMK1usYA7VGm6/bA+
 N1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717394750; x=1717999550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZZeVZfTb6CcRp0fbJrDOuWmSfqLenkD1dzMHxuQY9o=;
 b=tAPLyThsX/Cgn20XyqhurLkmd9hBqo9793kBGGnK9cn+uUF9DjDUM3TEBbp+HrDIjW
 /rt27ZRusTJwhoE0DeDm9hI1IDXIF9dNLjWu8fzm0wJjMdogFGutl00BX7cE6bMeHbF7
 BGj2229Wd6l0/gc5pw1k5R6yVzn3gcmBRW7yc/S4WMZ7KDY69tDsRNVF6TPRRRzxsEHz
 5IagV3ds8iSXBF3ir20Dh7/uQ58SmTtvnJEH8kZ2+OjmjpBSRw046MfWNQIX9+Hk0tRF
 bXdloELa752XS6Au64H8dyJ5Hp/NOAWMf981GNz5Ac18h7tBbxxXcdROvAx8vOmbrtTt
 FaVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIyozFFYmonKp0LQS+D8fE4z8ssUyqxNAnxqaogIZV21jaipKn2u9bNBd45HcwuTUR/ox1Y3vKBNeEWBaBC0RUHx92JJc=
X-Gm-Message-State: AOJu0Yx0NlkOqWAu+hdbd/nEtWknuLkpFQAb3dWV+stx78Fq6qGakirJ
 yPOiQJFL7FPqGWKrIXOhjstq6TUsiULJszx47xaWSxLrUvchkqUEXvCmA03tOAg=
X-Google-Smtp-Source: AGHT+IHu1fsKNturumnvVEonZnlJpX0PD0O2k8ONr1H2fUJmnfZdh4v0XJxbJTBjmW97pnGZ3XbdUg==
X-Received: by 2002:a05:6a20:258e:b0:1af:d2f8:382a with SMTP id
 adf61e73a8af0-1b26f16e6d0mr10251777637.34.1717394749916; 
 Sun, 02 Jun 2024 23:05:49 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a77afa1fsm7149291a91.42.2024.06.02.23.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 23:05:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH 3/6] target/riscv: Add MISA implied rules
Date: Mon,  3 Jun 2024 14:05:19 +0800
Message-ID: <20240603060522.2180-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240603060522.2180-1-frank.chang@sifive.com>
References: <20240603060522.2180-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

From: Frank Chang <frank.chang@sifive.com>

Add MISA extension implied rules to enable the implied extensions
of MISA recursively.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
---
 target/riscv/cpu.c | 50 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7e5cec7ef..a6e9055c5f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2242,8 +2242,56 @@ RISCVCPUProfile *riscv_profiles[] = {
     NULL,
 };

+static RISCVCPUImpliedExtsRule RVA_IMPLIED = {
+    .is_misa = true,
+    .ext = RVA,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zalrsc), CPU_CFG_OFFSET(ext_zaamo),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule RVD_IMPLIED = {
+    .is_misa = true,
+    .ext = RVD,
+    .implied_misas = RVF,
+    .implied_exts = { RISCV_IMPLIED_EXTS_RULE_END },
+};
+
+static RISCVCPUImpliedExtsRule RVF_IMPLIED = {
+    .is_misa = true,
+    .ext = RVF,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zicsr),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule RVM_IMPLIED = {
+    .is_misa = true,
+    .ext = RVM,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zmmul),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule RVV_IMPLIED = {
+    .is_misa = true,
+    .ext = RVV,
+    .implied_exts = {
+        CPU_CFG_OFFSET(ext_zve64d),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_implied_rules[] = {
-    NULL
+    &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
+    &RVM_IMPLIED, &RVV_IMPLIED, NULL
 };

 RISCVCPUImpliedExtsRule *riscv_ext_implied_rules[] = {
--
2.43.2


