Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42D5C77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:59:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzHf7-0001Hz-Er; Wed, 17 May 2023 09:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHf5-0001F8-CW
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:51 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHf3-0000Xl-Mz
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:51 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3945180bef1so550675b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684331868; x=1686923868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWt2ZMWA6z+B9QZASmH5IEOuVSLKg4cj3mZuVfKgT9E=;
 b=MGZdnd2ukuvB8MVF+0VU1dWqIfJVCIb5vmKGBBlIVHP5NHBef1riz2/1hyDbA/8fBb
 Dt5Cw+6KSd8LkAEwhFPPpxoumIUWpgjZPynbsmXjTrEH+vv+ap13OJPm+Dc+iSVRV41D
 yCj4hcpPFsSgJtBuwm/ZKUCHF6EZc5xZMtZXOZyzoaQIcvc7CL03KA//fBrQhC9ghAkC
 9441ph/bq3oUnPTf3LEaeGNqx9xB7pWJbgWaL8wfOH2OqF9fBbaxLHHiUg3TSTCHO6R2
 agolp4wqZ3L/22TUkIc64p0I/pPKb0P7/SybYACu8j7rTN9m/xQwJA8sNvuMWxZuMOeN
 wrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684331868; x=1686923868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWt2ZMWA6z+B9QZASmH5IEOuVSLKg4cj3mZuVfKgT9E=;
 b=CLDmoypslxhVjrXstIrlvicaz005RHAgdSZ9z4E3SJqzSXLPyBT2sD4dVstPq6ly8q
 7hXeRkKlXmNVAo80lGjxGp1r3iZddi1fEiWs7bCs38PUW8VQ6jDYDaUeodtFvn4b0PV/
 0TCr1yZMJh33NNXeK/o0NGLu+ajGho6SxBtyY1HYnswp34BA+s7M7DiYQ2GiO2CiCosF
 bP8M01eKAeRHTOtqzVb7fawf/RcxHhQrPf1ZHII647qCanOe4vz9FeYd3MTdizmMFDAf
 n5shNM3CyMrqo/FTePxwNJPqKKu609F8yetWx1+xaMPWhcY8kFZS6oVhKYzfzBNe01VX
 sJWg==
X-Gm-Message-State: AC+VfDxI4Li7BR1ZPddypxfVs0K6LH1WXN5iwq44kjE5FgLDiPIE0+0X
 2XD60JhiXeyJbyNz0C9TYlzYJw==
X-Google-Smtp-Source: ACHHUZ7eNlt0D86+8IoLPOpOBufgbJ0HEmranlwJPP3dLmHCQ4r9T2y/kF1WcVs3IEOwOwopX0yrhQ==
X-Received: by 2002:a05:6808:10d1:b0:396:cd:82b1 with SMTP id
 s17-20020a05680810d100b0039600cd82b1mr8464034ois.2.1684331868646; 
 Wed, 17 May 2023 06:57:48 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a544815000000b00383d9700294sm9409562oij.40.2023.05.17.06.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:57:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 09/11] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Wed, 17 May 2023 10:57:12 -0300
Message-Id: <20230517135714.211809-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517135714.211809-1-dbarboza@ventanamicro.com>
References: <20230517135714.211809-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32240a0b10..9e33fa4301 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1294,13 +1294,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1308,6 +1301,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.40.1


