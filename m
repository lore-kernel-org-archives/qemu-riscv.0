Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EB3CDB483
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:05:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImd-0005mM-Us; Fri, 13 Oct 2023 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIll-00012u-P3
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:04:08 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlV-0002fF-Oj
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:04:01 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so333210366b.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205823; x=1697810623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UC29UT+n44RqVD1Gw8xlAiVXKwDekYV24KCYK3TH/3k=;
 b=RP7kiOEJSRd5ip2eoEMuD3bd3BpeUSsrBcv9CjWQEKiunIsBkNWzgzvOm7MKChXhd2
 gywDo3qta/F7LZX+iwlRGlXGqeMugsf2ZFEqfkU3pKqasq1lhrXuWwf1FM1DzlEIWBLs
 EcgY2csS85/ufr5wemPqjbTJL+/4kfhLFEqUzSTlAYXJb1XRs7JTYQkcrn/xL+pA+/5H
 RIfiGHx0oHtDPhLuzDkGcfQl54ihZR1vh6XCqNhL5x04DrkoZFqgEaUHahV4xdH8IfEg
 ydZEEqO0w/9WtGv/DKyQM71JgMhHas9w49MD6w+J0Zv5P2QCpAVeBzflf6nwYFiYUAEk
 KiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205823; x=1697810623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UC29UT+n44RqVD1Gw8xlAiVXKwDekYV24KCYK3TH/3k=;
 b=biRSUll7ZEAtyfvIzq+VVKq4olvdIL/Q8/XAx3m/b3ZFPs4aH5bL0/AxZGFTNj4rsF
 kR4GPMZzPC0rwb+bJVsQqE1+HlT6thVFXl7hzHgPn6jsILw/wxqypPnxApU0uqCgFrsC
 ieVY/pM5HoWOSluvWP740L7CZL/VsLRXR33+KjR3vCDvDU10F9CUJFGp+gCgYCceA7Fa
 wamOdELO7QnVnceFP+Dvn/NualpwI4gg3B/0Ieq/rJdq1cxqhVWXB2ix03Plfwl/i9nm
 t/0/pvKZkNWrTc+5t3MQa8RwljxuLgoVZQQHWNnUF+aPRux3xg6yoLpon5jFycAZ2gDQ
 +UsQ==
X-Gm-Message-State: AOJu0Ywyz/J/9xzsxaDqyFShtJpDSb/iYieVhd2OAz5i18W8Ons0Qfov
 EfzRaiZb8JRz0oHpz0cjqJ2CSg==
X-Google-Smtp-Source: AGHT+IFSIBB6KsYrsJn8aWJjRt08xsuKtzgh8Yh5alVdFgXO0nNGepiunMGxMumYcODH+6dzexmHUQ==
X-Received: by 2002:a17:906:144:b0:9ae:54c3:c627 with SMTP id
 4-20020a170906014400b009ae54c3c627mr22453688ejh.71.1697205822564; 
 Fri, 13 Oct 2023 07:03:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170906360f00b0099d804da2e9sm12558220ejb.225.2023.10.13.07.03.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 15/16] target/ppc: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:14 +0200
Message-ID: <20231013140116.255-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c | 52 +++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40fe14a6c2..055436c141 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7408,39 +7408,34 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo ppc_cpu_type_info = {
-    .name = TYPE_POWERPC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(PowerPCCPU),
-    .instance_align = __alignof__(PowerPCCPU),
-    .instance_init = ppc_cpu_instance_init,
-    .instance_finalize = ppc_cpu_instance_finalize,
-    .abstract = true,
-    .class_size = sizeof(PowerPCCPUClass),
-    .class_init = ppc_cpu_class_init,
+static const TypeInfo ppc_cpu_types[] = {
+    {
+        .name           = TYPE_POWERPC_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(PowerPCCPU),
+        .instance_align = __alignof__(PowerPCCPU),
+        .instance_init  = ppc_cpu_instance_init,
+        .instance_finalize = ppc_cpu_instance_finalize,
+        .class_size     = sizeof(PowerPCCPUClass),
+        .class_init     = ppc_cpu_class_init,
 #ifndef CONFIG_USER_ONLY
-    .interfaces = (InterfaceInfo[]) {
-          { TYPE_INTERRUPT_STATS_PROVIDER },
-          { }
+        .interfaces     = (InterfaceInfo[]) {
+              { TYPE_INTERRUPT_STATS_PROVIDER },
+              { }
+        },
+#endif
+    },
+#ifndef CONFIG_USER_ONLY
+    {
+        .name           = TYPE_PPC_VIRTUAL_HYPERVISOR,
+        .parent         = TYPE_INTERFACE,
+        .class_size     = sizeof(PPCVirtualHypervisorClass),
     },
 #endif
 };
 
-#ifndef CONFIG_USER_ONLY
-static const TypeInfo ppc_vhyp_type_info = {
-    .name = TYPE_PPC_VIRTUAL_HYPERVISOR,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(PPCVirtualHypervisorClass),
-};
-#endif
-
-static void ppc_cpu_register_types(void)
-{
-    type_register_static(&ppc_cpu_type_info);
-#ifndef CONFIG_USER_ONLY
-    type_register_static(&ppc_vhyp_type_info);
-#endif
-}
+DEFINE_TYPES(ppc_cpu_types)
 
 void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
@@ -7635,4 +7630,3 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #undef RGPL
 #undef RFPL
 }
-type_init(ppc_cpu_register_types)
-- 
2.41.0


