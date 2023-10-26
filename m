Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08FDC27C46
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:22:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw2AW-0007nY-7N; Thu, 26 Oct 2023 11:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AE-00070p-Oj
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2A7-0006N8-Ti
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-27d1a03f540so876111a91.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333642; x=1698938442; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npJ2K69OOSsKJtanlFl7eXChj2RfZqQfMPOCGuCNX+0=;
 b=Kg5hh4Tva8E+YXM8uI/6+Y3spNZA8qHzqEobPpz1R5yKTeYzVF/lmmPTMHQojIcgCs
 0Kp2YnsThPAZ4VB/zd3MjO9ErVfeDj5eRoPPxrCTHkSpNlSuDG3EG6XqDX8xAIF0DpzL
 Jo3mGk0/XtnyZLxwUcGCZ4x/bOIlNqWkLNhzcs5paunxAygiCOHqbH9ezG8I/A2rRV3d
 Q7zIsO9szBT0bsqri5Ztw+Z+wsBDSIpT7/pwyeUEHxR+LMjG2ibjSHS160RiLq4HwzZo
 1w/Oi+d+UuzbBGR1CkDI8T1ICcNPeC8tB8EwpyYaSckf+7MvgxdKtLyg9ceFYz1yBzKT
 L9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333642; x=1698938442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=npJ2K69OOSsKJtanlFl7eXChj2RfZqQfMPOCGuCNX+0=;
 b=i4saoKb03sXymuhjMKnA7cIxCnWVBw8NOE7Ch7Jgh01QiWVdSwTm2bOZOrmNKMVLD0
 63IkL8pp2lpY/ucSdqOl1jXLXU1F//COUmAdL9BDVuzBfG0T/LO1b2yo1eEeaMX8hmGy
 iRO3Q8Njj8629Vm9YFH1W9KXJ407DZhkEXCNC6kAgFry5rEA7gZmSbPEN2TXw+m9M4LK
 qJsOiSYYAi7pjA9pYjVwcAbWZf/+PWloKpiCwrwp52Ey88wa/+NzlxA1ClxS/xDjoN81
 4FXmjg4GANpFMiGY/D9BlUOBTptAJijBABSGSjVP6sTlRyEJTg6AKF1IR1VEvfbgPCB7
 1YuA==
X-Gm-Message-State: AOJu0Yy3JDRuNm+RNYCzpdnI613s479Nzc7Q48PGKDbpaGihKfyb13Ri
 XLRHuXb/I/JZk/XhaY+gotiNwA==
X-Google-Smtp-Source: AGHT+IGI7LNSXd4nkD3L9ysinhjWBQc/NBp/PaYV+apL9rb13k2Sr25mVc+IrXjkxPfZIvh/CDPw4Q==
X-Received: by 2002:a17:90a:7887:b0:274:6839:6a8c with SMTP id
 x7-20020a17090a788700b0027468396a8cmr15726445pjk.6.1698333642218; 
 Thu, 26 Oct 2023 08:20:42 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:42 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 08/14] target/riscv: Add cfg properties for Zvks[c|g]
 extensions
Date: Thu, 26 Oct 2023 23:18:15 +0800
Message-Id: <20231026151828.754279-9-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102a.google.com
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

Vector crypto spec defines the ShangMi algorithm suite related
extensions (Zvks, Zvksc, Zvksg) combined by several vector crypto
extensions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu_cfg.h     |  3 +++
 target/riscv/tcg/tcg-cpu.c | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index fd07aa96a27..7b0ca657a6a 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -99,6 +99,9 @@ struct RISCVCPUConfig {
     bool ext_zvkn;
     bool ext_zvknc;
     bool ext_zvkng;
+    bool ext_zvks;
+    bool ext_zvksc;
+    bool ext_zvksg;
     bool ext_zmmul;
     bool ext_zvfbfmin;
     bool ext_zvfbfwma;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index e460701a13c..f9023ca75c7 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -519,6 +519,23 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
     }
 
+    if (cpu->cfg.ext_zvksc) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvks), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
+    }
+
+    if (cpu->cfg.ext_zvksg) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvks), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkg), true);
+    }
+
+    if (cpu->cfg.ext_zvks) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvksed), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvksh), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
+    }
+
     if (cpu->cfg.ext_zvkt) {
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
-- 
2.34.1


