Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505D8CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:42:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsWg-0006Q5-MM; Fri, 20 Oct 2023 12:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWP-0005l2-EA
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:49 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWK-0002mh-KB
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:49 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5079c846dcfso1281571e87.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819922; x=1698424722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glBeQZnUhkWGnfluElBv8to+WC3WDtUU/ZpHqLDizi4=;
 b=fDHvC9DPADTuiIOKlKlbpT7vBiHa3xHKJ/ok/6A/jFojphktCLSzuxaDf3d2M+Ta5j
 cptXIlZg4GxZHXdEJemEAOJEX1Ixt220l8k4ZsUWZRpRB9hUWG13/x4656tzArpOAxNp
 GGy/ZUkDsJT+ee8yYiQ+NuKYfbeW+uX6TkglydNgUD1EfryPHUkXIv9fA4hwmbxxhWu4
 N/kO4dObkLmBwl78n8hGfk1MXv/tV6iZcDPVdPxTYjcNPjCW3DK7Ow7oMZtLSh8jRLl7
 1U106kO+wFlAFjuTdwwBR3Sn7/KYE7DPtB4FklUVzlgHcm4O2v1IiVUZNnwxc1UHCUDV
 504Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819922; x=1698424722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=glBeQZnUhkWGnfluElBv8to+WC3WDtUU/ZpHqLDizi4=;
 b=B7AXGIcptewe9uOrD3JioSCPeMh1VorsQkqHl6W6WuNUPvXD60W6GWmiCbTdwMWF0G
 eUYF7pN25oejRq3Hwvam9SZCiPBKWYpvgqizw2xzI/FTmduvmXbely2taWCsj5Y3CfWs
 PUIay4HP/p9tRr5kSBtRT5WEj7V02lga+6rHmb8Z5zIrI8wHQRL6lxovgfAH8xB7qNR2
 3d+Rbkm9B2jbWPCdHeo7QwwYmdsJN57FIxlWSyg+m/TdtxHKMPltyc91xqPo7lIA+wkM
 rphPf2mfHlC2JkcEmPLsE36bxN309wtih00wIIrVgf5q/TyEBYbJ210Sa6Z5EYs7XHYY
 +h/A==
X-Gm-Message-State: AOJu0YwYcnE9D+BXbcRG8sEsftGJ/WCqHdHZQFy005RfczMRgH0zMd1b
 TEE9SNgsxnkrwuf8xea2AHvVWw==
X-Google-Smtp-Source: AGHT+IG4AN5MeDxLeh5oiIFI1y2FX/rpR5Rx0eY0mrFrMBl/1N/Ujrv4xlmJWdziViHNemYMcOtoVg==
X-Received: by 2002:ac2:4183:0:b0:507:9f51:acee with SMTP id
 z3-20020ac24183000000b005079f51aceemr1635568lfh.22.1697819922614; 
 Fri, 20 Oct 2023 09:38:42 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170906050c00b00977eec7b7e8sm1809552eja.68.2023.10.20.09.38.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:38:42 -0700 (PDT)
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
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 15/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_RISCV_CPU)
Date: Fri, 20 Oct 2023 18:36:37 +0200
Message-ID: <20231020163643.86105-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
  +   qemu_get_cpu(0, TYPE_RISCV_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/boot.c          | 2 +-
 target/riscv/arch_dump.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1d004660d4..5e979f7b6a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -437,7 +437,7 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
 {
     CPUState *cs;
 
-    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+    for (cs = qemu_get_cpu(0, TYPE_RISCV_CPU); cs; cs = CPU_NEXT(cs)) {
         RISCVCPU *riscv_cpu = RISCV_CPU(cs);
         riscv_cpu->env.kernel_addr = kernel_addr;
         riscv_cpu->env.fdt_addr = fdt_addr;
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 434c8a3dbb..4813d1ac1f 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -167,10 +167,10 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     RISCVCPU *cpu;
     CPURISCVState *env;
 
-    if (first_cpu == NULL) {
+    if (qemu_get_cpu(0, TYPE_RISCV_CPU) == NULL) {
         return -1;
     }
-    cpu = RISCV_CPU(first_cpu);
+    cpu = RISCV_CPU(qemu_get_cpu(0, TYPE_RISCV_CPU));
     env = &cpu->env;
 
     info->d_machine = EM_RISCV;
-- 
2.41.0


