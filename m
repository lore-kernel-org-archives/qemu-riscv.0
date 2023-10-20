Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E6CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:40:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsWD-0005No-Q2; Fri, 20 Oct 2023 12:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsW7-0005CI-8l
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsW5-0002gh-MP
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:30 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so162627766b.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819908; x=1698424708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJgrMi/wBqEbOvB4DV5saOShbSMfpSRqXMWSTunBKJo=;
 b=j/iqubrldvfGNHyR1EiLGFfkWpATzt021m/DEmJANJ+fI7aiCnPQP7LCNB8CymPpeH
 l5VnhwMfeuKvjOzZDY2AOLeyK96lNpXe7wi4ntLiPh8HDDhsA2rXo5/t4LdobeRMTyG7
 TKLITtqWBjjH01e+f873bbThtYBMshMFIfKMP9etBKBaYDrn0h+YhBSrEu6lNUFQFhKM
 iTN6CehHKhaJJSDcxQzXccUtHdrxb5XulFf2EXx3Wmv4MSd9AhcP0EAwhEKF9Z3HZB9T
 U7pZIbzIOpbzW+1VDSvsr6wuVjavR3LLyg+TJMbZ4f6nsHiSsf+/b/FhHYTgdmlrqcZZ
 aTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819908; x=1698424708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJgrMi/wBqEbOvB4DV5saOShbSMfpSRqXMWSTunBKJo=;
 b=YZUptF3kNPdf+3+F1FBnssn01iGXhozEVnnVbQJxMHNTGVgCp8x15xwa8MT4DNiHLr
 mg9gDdQHLIziuZ1WQQ5wU9P6g5mBhaI2qf0ZLeVzgBHGWDqpPSMDv5kTpust86Ab/vYC
 cGKeHn/NQ5ccKVA6r9Alhn7eobXJ1/OELiMN2IlU95DukaFUg79tkzjSjR9L0Ctn7NA9
 Zn02V24vRW1lK6nh72Ozv6eVEF6+GBE1KIWpghOH/Jx59mzoiX944k6bna/9Gf74/Mq7
 OOGBMKcQdCv5L5+oYsOGCyIznPSEzov1BXiWMeHvpe0PLRB0ALB9mbVoR0hkSaYBaszR
 Na1w==
X-Gm-Message-State: AOJu0YxuhV8Dkqv9yZ3dOBZgyEJi7X9yKwq2FYKG9RNQZ4VMxGAp9+lN
 puBbPEiSF5r2WFGxDsREy2lenw==
X-Google-Smtp-Source: AGHT+IH7+ZNyajLwkQ3t7c25QQCi97yzQLzCUBWOzenMRYSotv/xdOmSa0eQLzVkCMAjxOV447k7wA==
X-Received: by 2002:a17:906:c14c:b0:9c3:e158:316a with SMTP id
 dp12-20020a170906c14c00b009c3e158316amr1782665ejc.68.1697819907900; 
 Fri, 20 Oct 2023 09:38:27 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 s19-20020a170906bc5300b009b957d5237asm1805635ejv.80.2023.10.20.09.38.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:38:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 13/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_M68K_CPU)
Date: Fri, 20 Oct 2023 18:36:35 +0200
Message-ID: <20231020163643.86105-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_M68K_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/m68k_irqc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
index 0c515e4ecb..071937e6eb 100644
--- a/hw/intc/m68k_irqc.c
+++ b/hw/intc/m68k_irqc.c
@@ -35,7 +35,7 @@ static void m68k_irqc_print_info(InterruptStatsProvider *obj, Monitor *mon)
 static void m68k_set_irq(void *opaque, int irq, int level)
 {
     M68KIRQCState *s = opaque;
-    M68kCPU *cpu = M68K_CPU(first_cpu);
+    M68kCPU *cpu = M68K_CPU(qemu_get_cpu(0, TYPE_M68K_CPU));
     int i;
 
     if (level) {
-- 
2.41.0


