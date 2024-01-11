Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B192C47422
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNtmz-0003OC-2I; Thu, 11 Jan 2024 07:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtm5-0002rk-L4
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:03:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtm0-0007NH-Dx
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:03:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3374c693f92so3902304f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704974579; x=1705579379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3GnBwtsWZjmvkynj7oUUXZs0ui1nia9dU8ifkh5Y4E=;
 b=LS7arI4DLSdd0rFkc+l/YR82iFnHs6UWVxJBPyDY7qNtU+pwJb4vVb0zl8xx0L4dUd
 K+78UT62cBthZ3mhKAsByh2kpxJn1mJoR8fzZ6tNP+pyj/DuQdynM4MGVg+QxIQ187fc
 XUtVtyt6euO/AH0Bi/NJ/YQlR+8WZ9mIiD/OKtFemuNJl1zrphvuPgdfaA18H+xwquPs
 fxLy9MaJKA0gXZixaKBcghQT5POJhnwY/qLjglHBbFVQL0n7yrdstwKKSTMP3aNNTXL0
 EKFBHBrIMW17COSdS7wQI1TiUzi04Judo1LlmehMJLstap9vgJSt2RsjmsfQhq4+nMIM
 Ochg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704974579; x=1705579379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3GnBwtsWZjmvkynj7oUUXZs0ui1nia9dU8ifkh5Y4E=;
 b=ajfA6GKNjhRYkoRmXL5Ui+OqEvSqsxyktpYz+tdpnoMbvwf5rsQqBBZGVKLmVkMUXw
 mp/Ap4MGIYUY3CiWo7hjNcTXA23uH1Is2zx5XDL1UsHR6aKAyl+RS3XJHGXdz8JhllbL
 RsdM34vmYBLiERDNK7lLPzS/wbFMREucSmc4e21uDlM5wS9HVL7GgWf52k4F/HLYtjvH
 BYkZ3MD8L1/zbT8yVecgyZ2FRRmWwURlf9Mhb/vmzFLQWiFxSVxYYaRp80XQbtFrvx/D
 vqZvwicXRIWF16wkGYiHn/KRjE3SDXkk4XUB6ynFOyJAKQyxKIHSkm2znvuivL3aEXZv
 +t/g==
X-Gm-Message-State: AOJu0Yza6Z5RI+SVBRaBmVgwbKQSGA5LuPiIjufnY4aLIfwvZa1p5MiN
 TJvGkZ8Zfo965cP1Xh3LL1IfOJs/TnxBjoBUpT58jqz0Un0DRw==
X-Google-Smtp-Source: AGHT+IHSzMOPp0ALbe0wKJFLAJaKBIcNQ1+plizv5OIIgz5u7iXTLYDdRorDgArTrQmWFgad4eBWDQ==
X-Received: by 2002:adf:ed12:0:b0:337:628f:55a1 with SMTP id
 a18-20020adfed12000000b00337628f55a1mr537162wro.78.1704974578904; 
 Thu, 11 Jan 2024 04:02:58 -0800 (PST)
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d44cb000000b00336898daceasm1048278wrr.96.2024.01.11.04.02.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Jan 2024 04:02:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] target/riscv: Rename tcg_cpu_FOO() to include 'riscv'
Date: Thu, 11 Jan 2024 13:02:21 +0100
Message-ID: <20240111120221.35072-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240111120221.35072-1-philmd@linaro.org>
References: <20240111120221.35072-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The tcg_cpu_FOO() names are riscv specific, so rename
them as riscv_tcg_cpu_FOO() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 14133ff665..994ca1cdf9 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -929,7 +929,7 @@ static bool riscv_cpu_is_vendor(Object *cpu_obj)
  *   -> cpu_exec_realizefn()
  *      -> tcg_cpu_realize() (via accel_cpu_common_realize())
  */
-static bool tcg_cpu_realize(CPUState *cs, Error **errp)
+static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Error *local_err = NULL;
@@ -1372,7 +1372,7 @@ static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
 }
 
-static void tcg_cpu_instance_init(CPUState *cs)
+static void riscv_tcg_cpu_instance_init(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
@@ -1386,7 +1386,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
     }
 }
 
-static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
+static void riscv_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /*
      * All cpus use the same set of operations.
@@ -1394,30 +1394,30 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
     cc->tcg_ops = &riscv_tcg_ops;
 }
 
-static void tcg_cpu_class_init(CPUClass *cc)
+static void riscv_tcg_cpu_class_init(CPUClass *cc)
 {
-    cc->init_accel_cpu = tcg_cpu_init_ops;
+    cc->init_accel_cpu = riscv_tcg_cpu_init_ops;
 }
 
-static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+static void riscv_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
-    acc->cpu_class_init = tcg_cpu_class_init;
-    acc->cpu_instance_init = tcg_cpu_instance_init;
-    acc->cpu_target_realize = tcg_cpu_realize;
+    acc->cpu_class_init = riscv_tcg_cpu_class_init;
+    acc->cpu_instance_init = riscv_tcg_cpu_instance_init;
+    acc->cpu_target_realize = riscv_tcg_cpu_realize;
 }
 
-static const TypeInfo tcg_cpu_accel_type_info = {
+static const TypeInfo riscv_tcg_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("tcg"),
 
     .parent = TYPE_ACCEL_CPU,
-    .class_init = tcg_cpu_accel_class_init,
+    .class_init = riscv_tcg_cpu_accel_class_init,
     .abstract = true,
 };
 
-static void tcg_cpu_accel_register_types(void)
+static void riscv_tcg_cpu_accel_register_types(void)
 {
-    type_register_static(&tcg_cpu_accel_type_info);
+    type_register_static(&riscv_tcg_cpu_accel_type_info);
 }
-type_init(tcg_cpu_accel_register_types);
+type_init(riscv_tcg_cpu_accel_register_types);
-- 
2.41.0


