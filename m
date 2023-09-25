Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A632BCE7AB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:59:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpq2-0000dT-PX; Mon, 25 Sep 2023 13:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppz-0000cf-2I
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppw-0002Bq-Gc
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-578b407045bso5308417a12.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664654; x=1696269454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIlNvKVe9OTA8egt3cf/svUMIvB2+X3kSHOpaS7W4Ek=;
 b=XKXEI1jc6N1hzE1Z+zh9EPwHn/+YkiH8vrTRqzmv2nBIdwOu0fX3YsK40LSCzmPBrn
 JE6ny6tgLSxbg0aInf2uThzCA+FHgtBiLyyrlSNVZV1ZdQxR9/gzHp8fqtQT/oBUIgcY
 /2/kzTJhpSeVBLr8SDB3IwSQhlLJtOfhzA9PrXlidUyIe90qIncF1wpDe7UL8r3yPTh0
 S+rRl8UJ0pPJXuLUqbFToB7vWMXsKqQRRlACzAPN0k3TgDXLlsHApfnVvOIztce5BrIE
 FvGGTJRALyZ0S+IR6IxY9fsgLsoCqy0cJCHJEbz5EG+f3xdu1ktFcbWFfp13KqxJBi+N
 SL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664654; x=1696269454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YIlNvKVe9OTA8egt3cf/svUMIvB2+X3kSHOpaS7W4Ek=;
 b=oN48cFrOsx+SXYGSP5P4mERfCcsSMG33dgPPKYI/0g7wRuNXFxECZN7/jo6OOv3+0M
 vWVUV4pLbveoI+X9iMBabwe0DPLhi8tY4vXaaNNch8MdyiugNumXbAWMhtBBj3k1+Jo+
 ZktW7mnAPvEN0TiudN5Z51ycm3gwJSrqzvuQbgkZyGu3t5Ljs5BMhvJ3lADVqzkmXsFH
 kmf2L+krTvofbEexGvskPO+Qx5ft4Q2i+0vP6l2h1eH5T/4wR4Tj329HUpHKlSLhLF5Q
 b7bwR7FqQ9YM2i83rgzu1/RrnB8mpzSGcco0lFEbBGNbBoI35XaV2cdQiUQYL7SX3785
 gWbQ==
X-Gm-Message-State: AOJu0YxOdve7Nn0aU/1nBfqvLFvtHwE47BL++dBcx8bG42j2dFFQg6Lt
 tEG4CQ2uvCjAUXneIvaHs2B5vw==
X-Google-Smtp-Source: AGHT+IFCx45lTshLhjQezFzfkqdu8K2pLDRu29JA/8ySPRDFvR6+wTjsz5fZrInb0uYM8UqGQC1Lqw==
X-Received: by 2002:a17:90b:3a92:b0:273:cec7:23ee with SMTP id
 om18-20020a17090b3a9200b00273cec723eemr6533788pjb.37.1695664654368; 
 Mon, 25 Sep 2023 10:57:34 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 06/19] target/riscv: move 'host' CPU declaration to kvm.c
Date: Mon, 25 Sep 2023 14:56:56 -0300
Message-ID: <20230925175709.35696-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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

This CPU only exists if we're compiling with KVM so move it to the kvm
specific file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 15 ---------------
 target/riscv/kvm.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 848b58e7c4..f8368ce274 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -652,18 +652,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 }
 #endif
 
-#if defined(CONFIG_KVM)
-static void riscv_host_cpu_init(Object *obj)
-{
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
-#if defined(TARGET_RISCV32)
-    set_misa(env, MXL_RV32, 0);
-#elif defined(TARGET_RISCV64)
-    set_misa(env, MXL_RV64, 0);
-#endif
-}
-#endif /* CONFIG_KVM */
-
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -2041,9 +2029,6 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     },
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
-#if defined(CONFIG_KVM)
-    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
-#endif
 #if defined(TARGET_RISCV32)
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 1e4e4456b3..31d2ede4b6 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -1271,3 +1271,24 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
 
     kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
 }
+
+static void riscv_host_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+
+#if defined(TARGET_RISCV32)
+    env->misa_mxl_max = env->misa_mxl = MXL_RV32;
+#elif defined(TARGET_RISCV64)
+    env->misa_mxl_max = env->misa_mxl = MXL_RV64;
+#endif
+}
+
+static const TypeInfo riscv_kvm_cpu_type_infos[] = {
+    {
+        .name = TYPE_RISCV_CPU_HOST,
+        .parent = TYPE_RISCV_CPU,
+        .instance_init = riscv_host_cpu_init,
+    }
+};
+
+DEFINE_TYPES(riscv_kvm_cpu_type_infos)
-- 
2.41.0


