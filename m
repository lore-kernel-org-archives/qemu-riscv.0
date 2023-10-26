Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234B1C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:21:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw2A1-0006q7-75; Thu, 26 Oct 2023 11:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29z-0006pK-Fn
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29k-0006Hz-4b
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:35 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27db9fdec0dso859900a91.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333619; x=1698938419; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NG6r7b9rhLCBcUYVSJoZtIoBWMqyY2dfwA7ypnvCr4=;
 b=KcEs9g/AzyZ/sYd8v5s/ETBo4EfuEiuoHo9wbRDzj44ehzKvTNEYJDfXB2J19b3k3h
 pjmHig2R/NZDmKe38fYfyYDw3kir39HVKOF/JxVvqxRD3qg7EIPvVdSPtg4PwM9qpZKv
 36VSn/1upmi5m2dHvgY9Mjde3JutkQ4DDhSfd738klcO5gh+3Vr8e2fOyzRVSlrpKufy
 hcDQF03Q+f9Zs8WkXP6HpaEjWlD/YnaDOM3p0qunoZD61YOwG+i/2kkhX7Awnqs9PPVH
 L5zdiLCs3RuGvETigfp704Gs+zhkFykFvkV1ne4cH4RT4VgmV1Ev/peHQjWYCVaqQ8CQ
 vf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333619; x=1698938419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NG6r7b9rhLCBcUYVSJoZtIoBWMqyY2dfwA7ypnvCr4=;
 b=NOifuhFR/IrrQ7DZUXEIGY4cHFpeqEg3ZJvF9o1inR8ZPWPjefzKEfYH6R7esNrCXQ
 GNabymVBpcSKvOrWxtoV5aCpadYRcw/4kPLDAA9pW2H4xShsHAJvNtaRxX7ZbLUQeOeS
 KmGP8mykc9U1sxXfubnk+UGLFkU3yFCQK9NEsmayOXHhdTlrmTVVYuy3r4MVZZzWKv0F
 z333xS7n0JOV84gieKDQKcGEr5deLGwfSov7izr01ivES5oZeQN5rxl5wJoda1vX1Brt
 m/b5MNOApyoxwm06/P8R0XYmfTXUEYB9yNRniY58xkP0iJwWd3HrbUMzFL0dz+XT/bHW
 Dd8w==
X-Gm-Message-State: AOJu0Yy5pitdfaMStqc/yEoB04+eoqe1TFuMvSEv1wY9Q2OYs/KmSF46
 Zbasfxnnvk4pTQEKBUfVDKWts8K11mQfXbSXjhq4nQ==
X-Google-Smtp-Source: AGHT+IFGVGWekQlw6U4yViYgA7d+ifsXG/qvMIYAbqsxFAXcKFea0HwIUvE5BViQDYAzhjQsLenGMw==
X-Received: by 2002:a17:90a:f312:b0:27d:2cc3:c805 with SMTP id
 ca18-20020a17090af31200b0027d2cc3c805mr19215767pjb.46.1698333618643; 
 Thu, 26 Oct 2023 08:20:18 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:18 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 02/14] target/riscv: Expose Zvkt extension property
Date: Thu, 26 Oct 2023 23:18:09 +0800
Message-Id: <20231026151828.754279-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a2881bfa383..5099c786415 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -131,6 +131,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
     ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
+    ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1375,6 +1376,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
     MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
     MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
+    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.34.1


