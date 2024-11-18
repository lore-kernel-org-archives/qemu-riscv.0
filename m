Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15924D10F3A
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 01:18:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tCqO9-00018D-1K; Sun, 17 Nov 2024 20:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tCqO4-00015V-5a
 for qemu-riscv@nongnu.org; Sun, 17 Nov 2024 20:17:08 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tCqO1-0006SP-OZ
 for qemu-riscv@nongnu.org; Sun, 17 Nov 2024 20:17:07 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-720c2db824eso3199569b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 17 Nov 2024 17:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731892623; x=1732497423;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vTwUWeOBYxedW2UpgZEtaCjLh9J+yVkl+/fWLaqQqm4=;
 b=gjaruk1NpVJtksDbuItOGNb0pRNXlllPkneZnP6psuI/l767M4c9TIUOBA3HunRO1b
 a3GVBiYsSlip/WypxlpzEkJglwxYDCVEKD1MyE21Fp4CgRUryFjU6jHPwzORCRCY9Xyc
 9SESFVL5cQZNCdqBf21Kni+ju3R5sdfCnzewto6G/EH80zt4A5vTFBSid3pKWkGGkOB0
 DZT5zgwyesewTCitcHMsJhncKBijW96cqXsDWWdFpAknoaf099hRc4UfB7qLzcRkymGX
 w+YCM9HsiUy36NqpMXT5Vh7BX5+kttPEfwHGPUlk/diD2X29pckoLxCdxRXGAm9rNYyo
 G0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731892623; x=1732497423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vTwUWeOBYxedW2UpgZEtaCjLh9J+yVkl+/fWLaqQqm4=;
 b=QO7VK1ovMJ6cgqr+tnxEn2DwrFl/gPAfUJG4Abig2Vqd0nItYfgfCzrYGClsQt0/Ez
 Qd2lWtdM7vASUtfP1pqMp6gxdvHAU7exLtt8t76apy/OL8zpWOePSFdG4bVEeJWth7n6
 /0DFbnDCB/qH92HKa07pw3Af7DkiGy6bUSTqh+bPkfywDCkjs4Qwgad13GxWCY/Lz1Ho
 c1SAa5wj07SWQi3MjafH11tv5UUIdxNLfUAyZAZPd23dVT3qIs2JrJ/5vuAF2TFyqyDG
 9ksE7AgN57XnaiV35sderX6Z8hBDnZmx9AldOPr9j2RD/zxgJu20kFEU8yCrl+4u/V80
 kFTQ==
X-Gm-Message-State: AOJu0YzBhYmRwdWnlV81RZ9xSkStzND7MUMvIdOca4Kp3bGJas+r3s1Y
 RvYmgX5rZO/9ZJx4bbN4JSLdV71jxoE1I520s7fw2ffCewBKjyfDYfvort5iXds=
X-Google-Smtp-Source: AGHT+IEwZY5kGEiU8iG2TpGudSxC8njlxU0UDeI2a1y6PnU4xVa1Qx8FYXlEjBQLnJOFTZTZNL6lIQ==
X-Received: by 2002:a05:6a00:4fc8:b0:71e:5e04:be9b with SMTP id
 d2e1a72fcca58-72476bb89b3mr12661111b3a.12.1731892623118; 
 Sun, 17 Nov 2024 17:17:03 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724771e8b75sm5134024b3a.147.2024.11.17.17.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 17:17:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Sun, 17 Nov 2024 17:15:57 -0800
Subject: [PATCH v3 09/11] target/riscv: Invoke pmu init after feature
 enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241117-counter_delegation-v3-9-476d6f36e3c8@rivosinc.com>
References: <20241117-counter_delegation-v3-0-476d6f36e3c8@rivosinc.com>
In-Reply-To: <20241117-counter_delegation-v3-0-476d6f36e3c8@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The dependant ISA features are enabled at the end of cpu_realize
in finalize_features. Thus, PMU init should be invoked after that
only. Move the init invocation to riscv_tcg_cpu_finalize_features.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c62c2216961b..2b57aa4d1704 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -934,6 +934,20 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+#ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.pmu_mask) {
+        riscv_pmu_init(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        if (cpu->cfg.ext_sscofpmf) {
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          riscv_pmu_timer_cb, cpu);
+        }
+    }
+#endif
 }
 
 void riscv_tcg_cpu_finalize_dynamic_decoder(RISCVCPU *cpu)
@@ -981,7 +995,6 @@ static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
 
     tcg_cflags_set(CPU(cs), CF_PCREL);
 
@@ -989,19 +1002,6 @@ static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
         riscv_timer_init(cpu);
     }
 
-    if (cpu->cfg.pmu_mask) {
-        riscv_pmu_init(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return false;
-        }
-
-        if (cpu->cfg.ext_sscofpmf) {
-            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                          riscv_pmu_timer_cb, cpu);
-        }
-    }
-
     /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. */
     if (riscv_has_ext(env, RVH)) {
         env->mideleg = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;

-- 
2.34.1


