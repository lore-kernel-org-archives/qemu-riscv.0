Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98900C54E58
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 06:11:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkHpD-0000Yj-Cl; Wed, 13 Mar 2024 02:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rkHot-0000Uz-LP
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 02:10:32 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rkHom-0000Cs-Oy
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 02:10:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ddcdeb0098so879605ad.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2024 23:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710310220; x=1710915020; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vyCSucVrf+Vy6cdbeKJg8n86g0EOFvFg8cc6rgKBkXE=;
 b=O1XzvURpM9KzjUhOWBuzmFQxfmvkpIZDIx8+CGYCfNXd6ej67r8wvnaOSozEol/7rA
 kXU+osbVwOk6rqp+BW6seOqKE5Ydx1plNAaCfOTvELRiFF7DWibVdCoj9X5Aw5LY30Is
 zwusqnf19gGptufwGQCd9QqsBzM+5dOZGt4CAIoI5edzkJh/oTd1+1E6a9bVJv0c51DL
 LXtQucwliCxwkZlemgo91ubLb0oJHt69yzyi0gJWBXJA8CRh34CKTQ7fQzSRuAciWmOW
 QFP2nUDFOeqOmtuPUNJfxLxEbSXrw5qc7LqgWbBJ8BtTniJEmBFNoXkf1XkMcT7ryqAg
 /Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710310220; x=1710915020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyCSucVrf+Vy6cdbeKJg8n86g0EOFvFg8cc6rgKBkXE=;
 b=MZEXp0eyTv5YFcPF3CQjh1dbK6pOjdhQLBcErftG5ktJCR3wrIkYAjJsBvqQVVXf5Q
 NxHYJ3FVtLtRuSKLtaXEnrwIxO4EYXeQ2Cjda2mSI9XZcwhEQM93uxC4ZLq0swRNhrO0
 PH+Fy4u7SLkiw4NA1Oku1olxjcrF08ud4+U40Gu8e48tWhY9IsQ8vxZmSD9l2cXIabT/
 hNDDldCtyAbA+SDyDrMVkO2ujTFsJj6gQQIFxNVQo+9p3WSJDoAVyQq97rg4pKIhvdWB
 uCF5iNmVbFKryIzupoRtLJzMvoqPYA97iiHAZK0HzSoT5dHJEZoLJ+CmMqybOByQ4+xX
 qktw==
X-Gm-Message-State: AOJu0Yy8rzgQPjaQS8Pn2VKv4CAp7cbGJfuC6a2qS0/MFeL/8x+tFsFR
 rDym0663U50Z9sDmGGoCKvU5Zyl2xQ5x5tvFsv8lDq3ThUHo70AholNn2vPscm3GrrFdPgUtXC1
 f
X-Google-Smtp-Source: AGHT+IHip3y4zqqJRj41qLIwWeZ8MuB5IVmlZCLDAvyP/3xR6jazyXhLhFblBobsdr5I3xSOKdialQ==
X-Received: by 2002:a17:902:e843:b0:1dd:b883:3398 with SMTP id
 t3-20020a170902e84300b001ddb8833398mr3826257plg.4.1710310219966; 
 Tue, 12 Mar 2024 23:10:19 -0700 (PDT)
Received: from localhost.localdomain ([106.51.83.242])
 by smtp.gmail.com with ESMTPSA id
 kj14-20020a17090306ce00b001dd3bc79142sm7755402plb.264.2024.03.12.23.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 23:10:19 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] target/riscv: Enable sdtrig for Ventana's Veyron CPUs
Date: Wed, 13 Mar 2024 11:39:31 +0530
Message-Id: <20240313060931.242161-4-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313060931.242161-1-hchauhan@ventanamicro.com>
References: <20240313060931.242161-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

Ventana's Veyron CPUs support sdtrig ISA extension. By default, enable
the sdtrig extension and disable the debug property for these CPUs.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ab057a0926..9ddebe468b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -568,7 +568,9 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     cpu->cfg.ext_zicbom = true;
     cpu->cfg.cbom_blocksize = 64;
     cpu->cfg.cboz_blocksize = 64;
+    cpu->cfg.debug=false;
     cpu->cfg.ext_zicboz = true;
+    cpu->cfg.ext_sdtrig = true;
     cpu->cfg.ext_smaia = true;
     cpu->cfg.ext_ssaia = true;
     cpu->cfg.ext_sscofpmf = true;
-- 
2.34.1


