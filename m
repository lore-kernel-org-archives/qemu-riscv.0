Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C976CCE7A8C
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 09:02:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vJphN-0005qh-Q0; Fri, 14 Nov 2025 04:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vJpgh-00046s-1s
 for qemu-riscv@nongnu.org; Fri, 14 Nov 2025 04:01:47 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vJpgd-0007Fi-RA
 for qemu-riscv@nongnu.org; Fri, 14 Nov 2025 04:01:46 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7a9cdf62d31so2076062b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Nov 2025 01:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763110902; x=1763715702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UXAFxMHlvRSnA7eqtSuOeq6X1JUPuTSkqH51774VWV8=;
 b=UK/WdP8TAijd0l/c7kB0mW3MsBypGhOV5LDdPdtAmwtrQLfCG1tWxG3wm5svfxWbJ7
 2nnVABgPbhKaupeP+ora3T+UsSCmnwOYNYiVQBo8fwgmOk5KUSgDj+m5qgiQbHoBlFwy
 8IzqunXlGWfrlbUy2ang9oWvYHJkqyFL/lxhR041+VXBEMJ21CXTO9Y0PDUVNezb+PUc
 xir6h/ZRzK1NNxOWvRRmRZwKyOKauEIowrJ3lPoTwNlLFclz+ptDh9VlMC2UKcgb8lOH
 6QSjJpIYQdUcPs3MW3kvf31/2XFWvPO/Mrz6a+DQo9z8n9uK8CsOt5S7ug0Vx/c6mqHA
 gpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763110902; x=1763715702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UXAFxMHlvRSnA7eqtSuOeq6X1JUPuTSkqH51774VWV8=;
 b=oPn9TfUX71UVWJC7lreoy/W7sM7M4S5kb9qkU/HC/6I0gcQC6wsF+RCudw+oFItXhY
 hv3GWqEd+TEG7OHbouoWREsIURh7r2OmPd5vghgtC2ZUuNIzbXbg6VfkwQojVp+8XxQo
 r80zM0AaqOw+kM+nggnPvXz8vx+dfjM+tFGOAmHZ2oVxVOq8QmnFkBGInQylAiFZHiVY
 P+WBgysnErzu0i+I/WhjfbwASeTSIWKbhKv7Z/VjzcgVJOP/GGnAdcTqjRYxaMyYTpV7
 q8mDbCigzRybfjJojmbXEzW71QdyY965ccPsowpTI9k51qsIKVfBDuJ+MN9UMxbQRPxE
 uBFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm6gscADK2TqeviibM+XR3F4yXDaZbeKzNWm5NFvyETuzJpasrMT0ww9S6M3g9iivx8HhNygfqCWOK@nongnu.org
X-Gm-Message-State: AOJu0YyHgjohZlyV3PEbQqT+oJR6Scb+KXfJTu82vZ7Q3DUIvebrSzlI
 /XdcIEsI5duEXM/s5dnHn8DDAOsWIu91vYETyzOzwRioYWlVDLMzPEIkPbNOU5wsfgQ=
X-Gm-Gg: ASbGnctpnLBQ3mWrp8NQ6ep3baL3ySR1vwx3/Jx2ucPE19bNp8I5rIxcIMqvv1aACtF
 eRsI4WQPEbCnPKaDOKtVah3KhWcc5W9XgyWinOm8T0tIBmSayndonCfgJehkZcA80EOV9auLDEj
 nhiJjLQH5u6Vqew8Nr7rc1EJsR9OkocDcQPEdl6mfu0otMVYsz5MNRD4UfyiRUepdmK84mBU63b
 2uksm0R23XI1BCXrBsbIv/Dwv6oPT6ysSuJ4FXJ2ri/U+XZW32t98Yt4avgI8WxnP9IQgm/jXsg
 mgi/oRwJ7GVJk1pIpJIGigDKNtZUukiZ328+iVUsSNF54g8PUh5LHeCXgutR2FBJOrWUAUPujAc
 SdvB2Ha3sWpgk70CrrIV1EDmRTIDTBig5YBlhuPBZ8WbJ3eGAWhkDip28BZehVKrOOGyqLN0x4f
 aPsu+TTAW2cMZFamUb7jTxlvvM+ROKuGB7U3ZEx7vcL5OzNwgg
X-Google-Smtp-Source: AGHT+IG6JoqC+OwN+zp8veFIHYGO7Slcy0gNqgc8sKe5BBh9C+MZgw6tGQH0BeMf+8IR1yFlMFfBJQ==
X-Received: by 2002:a05:7022:ea44:b0:119:e56c:18af with SMTP id
 a92af1059eb24-11b41504ba5mr461285c88.23.1763110902375; 
 Fri, 14 Nov 2025 01:01:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088625sm8049254c88.8.2025.11.14.01.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 01:01:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 1/2] target/riscv: Update MISA.C for Zc* extensions
Date: Fri, 14 Nov 2025 17:01:32 +0800
Message-ID: <20251114090134.1125646-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114090134.1125646-1-frank.chang@sifive.com>
References: <20251114090134.1125646-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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

MISA.C is set if the following extensions are selected:
  * Zca and not F.
  * Zca, Zcf and F (but not D) is specified (RV32 only).
  * Zca, Zcf and Zcd if D is specified (RV32 only).
  * Zca, Zcd if D is specified (RV64 only).

Therefore, we need to set MISA.C according to the rules for Zc*
extensions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 440626ddfad..da09a2417cc 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1150,6 +1150,36 @@ static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
     }
 }
 
+/*
+ * MISA.C is set if the following extensions are selected:
+ *   - Zca and not F.
+ *   - Zca, Zcf and F (but not D) is specified on RV32.
+ *   - Zca, Zcf and Zcd if D is specified on RV32.
+ *   - Zca, Zcd if D is specified on RV64.
+ */
+static void riscv_cpu_update_misa_c(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+
+    if (cpu->cfg.ext_zca && !riscv_has_ext(env, RVF)) {
+        riscv_cpu_set_misa_ext(env, env->misa_ext | RVC);
+        return;
+    }
+
+    if (riscv_cpu_mxl(env) == MXL_RV32 &&
+        cpu->cfg.ext_zca && cpu->cfg.ext_zcf &&
+        riscv_has_ext(env, RVD) ? cpu->cfg.ext_zcd : riscv_has_ext(env, RVF)) {
+        riscv_cpu_set_misa_ext(env, env->misa_ext | RVC);
+        return;
+    }
+
+    if (riscv_cpu_mxl(env) == MXL_RV64 &&
+        cpu->cfg.ext_zca && cpu->cfg.ext_zcd) {
+        riscv_cpu_set_misa_ext(env, env->misa_ext | RVC);
+        return;
+    }
+}
+
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
@@ -1157,6 +1187,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 
     riscv_cpu_init_implied_exts_rules();
     riscv_cpu_enable_implied_rules(cpu);
+    riscv_cpu_update_misa_c(cpu);
 
     riscv_cpu_validate_misa_priv(env, &local_err);
     if (local_err != NULL) {
-- 
2.43.0


