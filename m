Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48608C30653
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 11:48:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sM4dg-00083i-6k; Tue, 25 Jun 2024 07:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sM4dd-00081v-Mk
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 07:47:06 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sM4da-0000dH-VG
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 07:47:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fa2ea1c443so19272925ad.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 04:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1719316021; x=1719920821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3sU1P3Bi7Bp0EOiBgadVjj6g4xG1ocNLTAeQdyId9c=;
 b=CTFN2GNi8Yc84TRiCccNh9jQlVImk0Fp0qqwyICe39zVGz/HJm/5sAISv67ftbeIG2
 3e1f2YMKeYRvk2Pph41arbAPSocsK2lkYsPgk7nKUDaUTTHqiRH6WoxTJGNzxDU6d2We
 INIhOXuiUnByZGwXym6B3gQ1z8O97af5gbzoYpk+P2nppGDcRuzaCIOhJNvvty1J4hfE
 Chdsc4yOhnFEAiBdjkNcd/j7UGGMH2WpfuE4UUv39/FyHU6PmnrTjzAeT5oj4hgDmHlW
 RDbEyw8LtcUFjrbt+h68MF6U8MM4aRL2g/asrsTjPrTh/ON/X3pjLZ8w6a9H4f+Cbg3c
 M35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719316021; x=1719920821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3sU1P3Bi7Bp0EOiBgadVjj6g4xG1ocNLTAeQdyId9c=;
 b=S6AfSmhcwncG01XIu2HJS6qag6ZVos1Ien4tPg8XAoW0veeXAqAkEJBRrXWv52t5TA
 waX+KX5/lhMHosCWWenwzn6Q5YzCS/G2iIt6UnIgmHNdX1A8z35sH5dHOd5HRgzMCagc
 aYzSTelKETCdp7EzF32rUdcIY6o7Jw/JpPPGCfMrReehArG2zeJ5MSupwrjh/tztM/c+
 vX924yd0D2ZxgCkBqPpPPtI23J0hrqPSSJ5u3YlebxPG0+HfI00w9EPprevvYCzN27QR
 ixnxotGPnO6WJ0mYtcWiQeeIbWXzlBPl7tt+uQNhCNSYshiEdUudLYsrYVV+yrdKllpK
 gvkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9LNTBrasY3GGsZgrOhS8SwuXJ6Wz0a/aU+EtV2F7aUdxDRloz7v4wbiDX/W344JLOMwk+VFu5OMYdO/VaBbFwbzyaLac=
X-Gm-Message-State: AOJu0YwdrLgsP813rxyeODn3wbI0unsW9xF82hnFM3/vvUsCaClFcCpB
 JoM5j57VVUqT6AkSXBQrN8CFz904Q0sWCW68sJQHs+HPnPBX0a7PWE/UUhcrDp8=
X-Google-Smtp-Source: AGHT+IFi3LEOZRrUQ6uJUwacub3AD+Z7K94Gvpu/nQAIEGG16LbV9EN9T6AQb6UJDIB3NoJz8UjeoQ==
X-Received: by 2002:a17:902:d2c5:b0:1fa:2e45:bcb8 with SMTP id
 d9443c01a7336-1fa2e45bd32mr76106865ad.2.1719316021414; 
 Tue, 25 Jun 2024 04:47:01 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb321d4esm79472325ad.67.2024.06.25.04.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 04:47:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 5/6] target/riscv: Add Zc extension implied rule
Date: Tue, 25 Jun 2024 19:46:28 +0800
Message-ID: <20240625114629.27793-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240625114629.27793-1-frank.chang@sifive.com>
References: <20240625114629.27793-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Zc extension has special implied rules that need to be handled separately.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Tested-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 1a3aef5bff..ccca9037ed 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -925,11 +925,45 @@ static void cpu_enable_implied_rule(RISCVCPU *cpu,
     }
 }
 
+/* Zc extension has special implied rules that need to be handled separately. */
+static void cpu_enable_zc_implied_rules(RISCVCPU *cpu)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPURISCVState *env = &cpu->env;
+
+    if (cpu->cfg.ext_zce) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
+
+        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
+        }
+    }
+
+    /* Zca, Zcd and Zcf has a PRIV 1.12.0 restriction */
+    if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+
+        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
+        }
+
+        if (riscv_has_ext(env, RVD)) {
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
+        }
+    }
+}
+
 static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
 {
     RISCVCPUImpliedExtsRule *rule;
     int i;
 
+    /* Enable the implied extensions for Zc. */
+    cpu_enable_zc_implied_rules(cpu);
+
     /* Enable the implied MISAs. */
     for (i = 0; (rule = riscv_misa_ext_implied_rules[i]); i++) {
         if (riscv_has_ext(&cpu->env, rule->ext)) {
-- 
2.43.2


