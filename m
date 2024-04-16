Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80CBC4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:03:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwo4A-0002zZ-EX; Tue, 16 Apr 2024 15:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo3i-0002RC-IW
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 15:01:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo3e-0005pO-D7
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 15:01:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a51b008b3aeso590599966b.3
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713294089; x=1713898889; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGmHgX0sXYbEat6EBpXLxmNF9uP2m/qR4kqm1cYWX4M=;
 b=TCNJQdo5lSZynmA4Esp7ZCml/zSiheREy0jKqGGUhJ08G3ubhrIS6bpbWHziKT9ob8
 mUyZ9W3VWRKOyQcUVDK2Lk3+CI/q565SrfQNUmHbrejFbOqC5zFqy53QVJPnJFLT/BIx
 CWo9Z3IKnxM/MzX8XcmFUd4TErSwk/Pz4TstXeC12s9BFUJDCrGF2yrLHw9Cv8TcdtmI
 cVMz1wuNCWugitUrN/wvra2gpnt5jnnspo8xlADp3yiRio80QrL8UwmZ2RZ3Damyb71m
 HHiJYif6O/PJBrxiCwFfA/5XGxZd8CkPP2lcTJ2I1wRxr5GSZDdSeK12MYO9LtcQXwi5
 H9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713294089; x=1713898889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGmHgX0sXYbEat6EBpXLxmNF9uP2m/qR4kqm1cYWX4M=;
 b=D8I39/OhEgBopMOXZyHHqrWkgJ0yfWzbUPfy6NLUELReLeet9kRim9t1h3iN9oex+U
 cRidqJst4FPVtRobjW2pYpes1BeP3iqq8bcpt1j90Fgrcn3KKeX8YhAPy15E5QpWSK4r
 dyQZ64nUK8mAS4CnhuYyG5b5igzNT907e9PEfnqCb9v4aFK5uIChfLYQlc0i/8kk5zPZ
 O0tLmPBn4j7FR1+McHsa+G7y60s89ExR+lYfPFfqPcErlXCuAvjSWamCulqGBKAO+Y3J
 mB4TZBir/CWzrkehZS5OmLpkYJXrKGqnoAFRwt+Q7+Z8Fqe8XvDQ/1Bh2EPEMIizf86I
 ML3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlbjdKwEcXsXDbogcq2/zhsRo0vCYTrbqWhS/pO0oAfVlttyT13Akno3j0cCwvG0IYl1m7Z66leHG8z4srx4telSKaAJg=
X-Gm-Message-State: AOJu0YylwB6te9BX+OOW8bRHWlaYaTrnDHZFMNSEVoZ7JGbNqV49AWGF
 Ci+U86aaBjx8JKGi1/3qU3JjyoZfdCnG1Ym2/+cQMc/+M6irXVcv66Z8q6ECkNc=
X-Google-Smtp-Source: AGHT+IHwSLlfXpGmmQgYiDUJLR1M/IaxvhamPbEJuRmw3eYDC+dQDZkHraqE/dsrkb77qrGpJhsYJw==
X-Received: by 2002:a17:906:2988:b0:a52:2486:299f with SMTP id
 x8-20020a170906298800b00a522486299fmr8851431eje.71.1713294088766; 
 Tue, 16 Apr 2024 12:01:28 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a170906c01600b00a51cdde5d9bsm7211175ejz.225.2024.04.16.12.01.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 12:01:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, devel@lists.libvirt.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v4 16/22] hw/i386/pc: Remove deprecated pc-i440fx-2.2 machine
Date: Tue, 16 Apr 2024 20:59:32 +0200
Message-ID: <20240416185939.37984-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

The pc-i440fx-2.2 machine was deprecated for the 8.2
release (see commit c7437f0ddb "docs/about: Mark the
old pc-i440fx-2.0 - 2.3 machine types as deprecated"),
time to remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 docs/about/deprecated.rst       |  2 +-
 docs/about/removed-features.rst |  2 +-
 include/hw/i386/pc.h            |  3 ---
 hw/i386/pc.c                    | 23 -----------------------
 hw/i386/pc_piix.c               | 21 ---------------------
 5 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a2a1b9d337..75bf0f4886 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -219,7 +219,7 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
 better reflects the way this property affects all random data within
 the device tree blob, not just the ``kaslr-seed`` node.
 
-``pc-i440fx-2.2`` up to ``pc-i440fx-2.3`` (since 8.2) and ``pc-i440fx-2.4`` up to ``pc-i440fx-2.12`` (since 9.1)
+``pc-i440fx-2.3`` up to ``pc-i440fx-2.3`` (since 8.2) and ``pc-i440fx-2.4`` up to ``pc-i440fx-2.12`` (since 9.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These old machine types are quite neglected nowadays and thus might have
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 01c55103d3..4664974a8b 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -816,7 +816,7 @@ mips ``fulong2e`` machine alias (removed in 6.0)
 
 This machine has been renamed ``fuloong2e``.
 
-``pc-0.10`` up to ``pc-i440fx-2.1`` (removed in 4.0 up to 9.0)
+``pc-0.10`` up to ``pc-i440fx-2.2`` (removed in 4.0 up to 9.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These machine types were very old and likely could not be used for live
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 231aae92ed..df97df6ca7 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -274,9 +274,6 @@ extern const size_t pc_compat_2_4_len;
 extern GlobalProperty pc_compat_2_3[];
 extern const size_t pc_compat_2_3_len;
 
-extern GlobalProperty pc_compat_2_2[];
-extern const size_t pc_compat_2_2_len;
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 633724f177..18bef7c85e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -281,29 +281,6 @@ GlobalProperty pc_compat_2_3[] = {
 };
 const size_t pc_compat_2_3_len = G_N_ELEMENTS(pc_compat_2_3);
 
-GlobalProperty pc_compat_2_2[] = {
-    PC_CPU_MODEL_IDS("2.2.0")
-    { "kvm64" "-" TYPE_X86_CPU, "vme", "off" },
-    { "kvm32" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Conroe" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Penryn" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Nehalem" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Westmere" "-" TYPE_X86_CPU, "vme", "off" },
-    { "SandyBridge" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Haswell" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Broadwell" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Opteron_G1" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Opteron_G2" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Opteron_G4" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Opteron_G5" "-" TYPE_X86_CPU, "vme", "off" },
-    { "Haswell" "-" TYPE_X86_CPU, "f16c", "off" },
-    { "Haswell" "-" TYPE_X86_CPU, "rdrand", "off" },
-    { "Broadwell" "-" TYPE_X86_CPU, "f16c", "off" },
-    { "Broadwell" "-" TYPE_X86_CPU, "rdrand", "off" },
-};
-const size_t pc_compat_2_2_len = G_N_ELEMENTS(pc_compat_2_2);
-
 GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
 {
     GSIState *s;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index dcf50684a4..30bcd86ee6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -429,11 +429,6 @@ static void pc_compat_2_3_fn(MachineState *machine)
     }
 }
 
-static void pc_compat_2_2_fn(MachineState *machine)
-{
-    pc_compat_2_3_fn(machine);
-}
-
 #ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
@@ -828,22 +823,6 @@ static void pc_i440fx_2_3_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v2_3, "pc-i440fx-2.3", pc_compat_2_3_fn,
                       pc_i440fx_2_3_machine_options);
 
-static void pc_i440fx_2_2_machine_options(MachineClass *m)
-{
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
-
-    pc_i440fx_2_3_machine_options(m);
-    m->hw_version = "2.2.0";
-    m->default_machine_opts = "firmware=bios-256k.bin,suppress-vmdesc=on";
-    compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
-    compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
-    pcmc->rsdp_in_ram = false;
-    pcmc->resizable_acpi_blob = false;
-}
-
-DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
-                      pc_i440fx_2_2_machine_options);
-
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
-- 
2.41.0


