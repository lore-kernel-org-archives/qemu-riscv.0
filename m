Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163FECD6911
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 09:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qq95G-0002MK-5V; Tue, 10 Oct 2023 05:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94h-000151-M9
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:51 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq94f-0008DM-Kv
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:30:47 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9b9ad5760b9so919266266b.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 02:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930244; x=1697535044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGDIRmDFCC3SzHQp/xiOV97Tov37+momJ53r+jvT974=;
 b=xQd8MQoDOWF0fREbiwL/c5Kj62Jpbr9o33zDUjg1Rb8/MefzGDvunMEM3S4RltVzWu
 iuUY4Y6AxeZqXTRoaMehNG2v3/4YsyaVtwRuy/gZfr0oM2OK5ENTJU3dYzNe1rZW68Iv
 FDSBMGicR8G0j+hq6zcp4+iaDETtdJG8yfs+6R3oFmO3qBIIsn/zGLsI0iwATbQ6P+7q
 PL4ddaEbpVafWkzVxm/6eXsfVzcUNX4UBWGI7S/tt/hDqLLPcDIFKQ6KsuuyAOuHbmCO
 e5sIC7sQQ8oeK3F4n2B7bzPkxnjrYX872fnW5u7479lvVjMgyK1jN3LaK+IMC9kwfHvq
 nbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930244; x=1697535044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGDIRmDFCC3SzHQp/xiOV97Tov37+momJ53r+jvT974=;
 b=S6tjmlUIMA0LSTIzvf4hp/vA1vh+653RGL+Q0CoCozEBDnXyFarSrdv1hpdaGgh6dt
 RnR4shAqUXyhyl4hEUg20XEq+vHK8GgLSGTuIOK6EW0be9TrMWREyKIu8CkS6x/ljerK
 VHwj8zOE8TcTkTpIqnguywk0lgJxf/+StauMYiRNMyCkiIutxBjooUx5yZ2bEDfSOrR0
 Nqeau/2e1NK/Nzj5E0ObaiWVDAS+1u06r5a4CMHfSsUNeEr8QiDEnN5/pwmNHKRioNQu
 dP0x3L+dYv7VmTqaCAjRZ+P85fZ5sDmpHjmEzuSOAB/lno+hZJDNfSwT1PImAdoefmIq
 8yhg==
X-Gm-Message-State: AOJu0YwBjppuIZa9NPG4xREg7ge8asye5vIJW9Sb9JpdN1HXVPMageGo
 WiVD4KdKL58CZwlPY4rzBfA5cg==
X-Google-Smtp-Source: AGHT+IH7XgVjSNOW5i+EWuhhgWfn0b9q76ni2kt3phZYbOaNn2gkvmaK4ov4hf6aPkbs+5Ce4X2x/g==
X-Received: by 2002:a17:906:8a77:b0:9b3:308:d046 with SMTP id
 hy23-20020a1709068a7700b009b30308d046mr15417914ejc.61.1696930244444; 
 Tue, 10 Oct 2023 02:30:44 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 st12-20020a170907c08c00b009b9f87b34b6sm6753332ejc.189.2023.10.10.02.30.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:30:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 12/18] target/mips: Declare CPU QOM types using DEFINE_TYPES()
 macro
Date: Tue, 10 Oct 2023 11:28:54 +0200
Message-ID: <20231010092901.99189-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a0023edd43..83ee54f766 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -595,17 +595,21 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo mips_cpu_type_info = {
-    .name = TYPE_MIPS_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(MIPSCPU),
-    .instance_align = __alignof(MIPSCPU),
-    .instance_init = mips_cpu_initfn,
-    .abstract = true,
-    .class_size = sizeof(MIPSCPUClass),
-    .class_init = mips_cpu_class_init,
+static const TypeInfo mips_cpu_types[] = {
+    {
+        .name           = TYPE_MIPS_CPU,
+        .parent         = TYPE_CPU,
+        .instance_size  = sizeof(MIPSCPU),
+        .instance_align = __alignof(MIPSCPU),
+        .instance_init  = mips_cpu_initfn,
+        .abstract       = true,
+        .class_size     = sizeof(MIPSCPUClass),
+        .class_init     = mips_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(mips_cpu_types)
+
 static void mips_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(oc);
@@ -630,7 +634,6 @@ static void mips_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&mips_cpu_type_info);
     for (i = 0; i < mips_defs_number; i++) {
         mips_register_cpudef_type(&mips_defs[i]);
     }
-- 
2.41.0


