Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA94CDB482
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:05:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImd-0005iu-Ft; Fri, 13 Oct 2023 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIli-0000xh-Jb
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:04:01 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIle-0002gQ-Mk
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so3849850a12.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205831; x=1697810631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4alAtOXM/H/5FX7cyO/SwuIUYprCQ9PCZpIdYP2vGY=;
 b=P0K0EOKBNNDBU7BITx4q5wgLWKMrIAEvxAY6zGwhsaQ/jB017LuJd1wxmWrbnoqh9U
 fXGvyu8CsFRE+0S3pZzBQl1YhvrqMAXZGFGSa6+o3y505AUBBHIouO8Pi62qQd4USFJn
 gYb4wMwd0Bu1dSdUrSQdC/GpJY6rO2XMcMz1jEAuealT4EDKUkMCXR305D0SZckqav6I
 X14Mlzqkl5a3Pbao9jh9Xi/93OD5fhXrM3Ax+ru2DqTmQ9UKLqCR/cJs+ZzgWhA4Q3yw
 xAtIo3eKFPzYKi6Ck6Aln0X+NetA7bLk0wKP295wZzpLDQWF9NaLVO3Z2qPVaPPfxDXx
 JJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205831; x=1697810631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4alAtOXM/H/5FX7cyO/SwuIUYprCQ9PCZpIdYP2vGY=;
 b=M/H4VVFzElVlywiWzQHLczRBI5GQdBiPNGvY89N0C5WvrHeJH9wNg3U9Lu3N/lv8Dr
 aqKQ6nafmBH/ZVf2gaWEfSz+5NXMoB/cLpbvwJKuRewYk0PpNtepEFHzlb9XyVF9nx0b
 UzC2wOJX28Z8OM6KEtFZhsr65NEgai/xmeIWkJz6cWiXVmx/zgWI9SYgQ9vS7hXntgMw
 srw9AO87xtBzUe/8O9QLR/8tegbf4OQy3TCT+2D4YNMkhkCq+rnESMaA/noQsTI2kNu1
 VJEngEX/f/n2rSSyugfADkXx9mrlrCn4hZstYhZKSsqdnj4Mr727XLLWWlmAxwNpDSzB
 HWPg==
X-Gm-Message-State: AOJu0YxPHHrnQM2Q/XcRHHVTMye2t1hCeeaiAdJZxrbvL+S+DsEyI5lo
 dl3Iyw6VHujQGmo+VhiFklPPmQ==
X-Google-Smtp-Source: AGHT+IERKCTNVWD0dJclVoyHnhGisvpmsV/d+FMKb6sYDuUfem0HyRDDDLrUvGmq/Ea0lVyeOnjJ1w==
X-Received: by 2002:a17:906:30cc:b0:9a1:c447:3c62 with SMTP id
 b12-20020a17090630cc00b009a1c4473c62mr23478118ejb.49.1697205831758; 
 Fri, 13 Oct 2023 07:03:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 gq7-20020a170906e24700b00993664a9987sm12476932ejb.103.2023.10.13.07.03.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:51 -0700 (PDT)
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
Subject: [PATCH v2 16/16] target/sparc: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:15 +0200
Message-ID: <20231013140116.255-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 8ba96ae225..1e66413e94 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -924,17 +924,21 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &sparc_tcg_ops;
 }
 
-static const TypeInfo sparc_cpu_type_info = {
-    .name = TYPE_SPARC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(SPARCCPU),
-    .instance_align = __alignof(SPARCCPU),
-    .instance_init = sparc_cpu_initfn,
-    .abstract = true,
-    .class_size = sizeof(SPARCCPUClass),
-    .class_init = sparc_cpu_class_init,
+static const TypeInfo sparc_cpu_types[] = {
+    {
+        .name           = TYPE_SPARC_CPU,
+        .parent         = TYPE_CPU,
+        .instance_size  = sizeof(SPARCCPU),
+        .instance_align = __alignof(SPARCCPU),
+        .instance_init  = sparc_cpu_initfn,
+        .abstract       = true,
+        .class_size     = sizeof(SPARCCPUClass),
+        .class_init     = sparc_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(sparc_cpu_types)
+
 static void sparc_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
     SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
@@ -959,7 +963,6 @@ static void sparc_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&sparc_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(sparc_defs); i++) {
         sparc_register_cpudef_type(&sparc_defs[i]);
     }
-- 
2.41.0


