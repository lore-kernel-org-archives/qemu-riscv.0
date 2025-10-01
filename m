Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE92CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:09:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQQ-0001JQ-QF; Wed, 01 Oct 2025 11:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQ9-00017J-Nx
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:10 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPD-0000gR-Jx
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso52632695e9.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331163; x=1759935963; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euVgIeZJHIZBB4YFcdJbP7PY3/zoj3Ofxhi7NManz1g=;
 b=cvb1udqPLK+uvqZW5Bcao+00jOPDaZ2WMsZm3dkoUlDn/iC+9aSX59aUYYP+PMax0+
 jwjEIu7tEB1xLGRozPMdgWsy3hCX9WnOTIOnkOya3QdgJpqE1u8HBrAUR3vhuKGtFHFL
 cMEsOVzMHA6AvsM5q8ejhGji7kAzFbRwTG+OjkwumeNUb7Nmb4GgRsd67vUQ6RLE3Hm6
 IwOlivKXUYAdR2UTX4mZ9O7KSFVHGqrSPlOqK6CYa96Z3uv80fujlj1PYMz85ttXyVX1
 qYJoNkCfDMjp4DOzbIpsvIhufxEC7Y0Q5/EaengJdAFzACXTpHMXP2X+/kchnCLM8mRu
 mxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331163; x=1759935963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=euVgIeZJHIZBB4YFcdJbP7PY3/zoj3Ofxhi7NManz1g=;
 b=rx0JqLZzX3v9vMJiGtGjlZQ1Hi6z6m6zdoV2bsaP1yolypB+ijUOCPq1WNU0aMx94s
 m7fQarKslimKrlYG6tp4qBkRDklwesquyiwlBnm69TCMmR3fgr5SNrPfe4bTyqt3+H/1
 S6z8kNFOS11dg/l5lrSEfutWY9WkRhg3/t3pHJYRqOhEpynWUGvrMJ5RAuYd/RVNblFP
 fh8kfLVfVT+SxyermcQv45fXIQembor0vbjkZjK9rtqst+OyrqyD34u3/vNmdpCAspaG
 iG2g5SrzvJwzVrKEpufcoFV/xcctWBgtyBsr8EkEZLF2bOsQn2Sb8fuOSbAwYDei4kpf
 goAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfjd3pGBU9P5oXiXi+j64okcFvxcyblJH/FdOHlx9SJGbIXFjVFRi/ZCtwQgmhRPGq2e7penSBkkTU@nongnu.org
X-Gm-Message-State: AOJu0YwNy0jEbXBwWknPq9JIT2sp5dWiKV+m6Z4aXumX7NvbZiXt/Vhf
 psd75X4yDaAwfPrij+B3eGTc9coQw2648+QSstu/sGD4WoSw2SLYcH8K0iQXEnCycwo=
X-Gm-Gg: ASbGncugeBzJyp5ylKCTmk3CRMi+YD7XZ0H8bdyet3RiXD3znKKyy/MBsJ1M8Gh9dTR
 X3WK95o8M2umSTU7BK2Yw6XPQx4s6g/cfbLN0ge8SZeVONGo4BnpLkZf1ptA6UtsxDOhTqMg6y4
 m7DcKwDiJAhPC+3RR4oBbOOaK4jEu38J9DiqACkKlBJp9qFeQ8Qtiz1zhn+XpGvUjIq9NzEPtKM
 2kWkm20pe4ty6tqXUYLQh9nbC0YnHyq3e+LjSkzGBgWI+/Ng7JsLZTSgAFSZNViOieoxYrbOEPg
 MdlR/0tDOnRDC1D2sdGMDX3TVpq02KR3mZ4RpBqo+lnNvGl8wqCAJlrmcbT5BktT1EX34q/6lqG
 KDSi91d/8dvh6YBGs9jSQfw/WoMfUCNBWYQ5qCESKMOTTvMXnKoCiJz9BBXUAM4W8Y3PbaH4vQH
 TeZn8q5VngzdSUaNqK9rpL
X-Google-Smtp-Source: AGHT+IGzXR0Dkt5MMU7ttnv9s9jwILY1OZIbTD4RyJ+s9yDyfL+98y3Pen4wfa8ji9b+co3j6DmrEA==
X-Received: by 2002:a05:600c:8b2c:b0:46e:37af:f90e with SMTP id
 5b1f17b1804b1-46e6126245cmr38125115e9.6.1759331162740; 
 Wed, 01 Oct 2025 08:06:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb7203b8asm27682148f8f.9.2025.10.01.08.06.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 06/22] hw/m86k: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:11 +0200
Message-ID: <20251001150529.14122-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/m68k/mcf5208.c |  6 ++++--
 hw/m68k/q800.c    | 17 ++++++++++-------
 hw/m68k/virt.c    |  5 +++--
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 75cc076f787..9354829e8a4 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -206,12 +206,14 @@ static void m5208_rcm_write(void *opaque, hwaddr addr,
 {
     M68kCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
+
     switch (addr) {
     case 0x0: /* RCR */
         if (value & RCR_SOFTRST) {
             cpu_reset(cs);
-            cpu->env.aregs[7] = ldl_phys(cs->as, 0);
-            cpu->env.pc = ldl_phys(cs->as, 4);
+            cpu->env.aregs[7] = ldl_phys(as, 0);
+            cpu->env.pc = ldl_phys(as, 4);
         }
         break;
     default:
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 793b23f8155..9ec7122a4f8 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -107,10 +107,11 @@ static void main_cpu_reset(void *opaque)
 {
     M68kCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
 
     cpu_reset(cs);
-    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
-    cpu->env.pc = ldl_phys(cs->as, 4);
+    cpu->env.aregs[7] = ldl_phys(as, 0);
+    cpu->env.pc = ldl_phys(as, 4);
 }
 
 static void rerandomize_rng_seed(void *opaque)
@@ -263,6 +264,7 @@ static void q800_machine_init(MachineState *machine)
     const char *bios_name = machine->firmware ?: MACROM_FILENAME;
     hwaddr parameters_base;
     CPUState *cs;
+    AddressSpace *cpu_as;
     DeviceState *dev;
     SysBusESPState *sysbus_esp;
     ESPState *esp;
@@ -573,6 +575,7 @@ static void q800_machine_init(MachineState *machine)
     macfb_mode = (NUBUS_MACFB(dev)->macfb).mode;
 
     cs = CPU(&m->cpu);
+    cpu_as = cpu_get_address_space(cs, 0);
     if (linux_boot) {
         uint64_t high;
         void *param_blob, *param_ptr, *param_rng_seed;
@@ -590,7 +593,7 @@ static void q800_machine_init(MachineState *machine)
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
+        stl_phys(cpu_as, 4, elf_entry); /* reset initial PC */
         parameters_base = (high + 1) & ~1;
         param_ptr = param_blob;
 
@@ -647,9 +650,9 @@ static void q800_machine_init(MachineState *machine)
         }
         BOOTINFO0(param_ptr, BI_LAST);
         rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
-                              parameters_base, cs->as);
+                              parameters_base, cpu_as);
         qemu_register_reset_nosnapshotload(rerandomize_rng_seed,
-                            rom_ptr_for_as(cs->as, parameters_base,
+                            rom_ptr_for_as(cpu_as, parameters_base,
                                            param_ptr - param_blob) +
                             (param_rng_seed - param_blob));
         g_free(param_blob);
@@ -683,8 +686,8 @@ static void q800_machine_init(MachineState *machine)
 
             ptr = rom_ptr(MACROM_ADDR, bios_size);
             assert(ptr != NULL);
-            stl_phys(cs->as, 0, ldl_be_p(ptr));    /* reset initial SP */
-            stl_phys(cs->as, 4,
+            stl_phys(cpu_as, 0, ldl_be_p(ptr));    /* reset initial SP */
+            stl_phys(cpu_as, 4,
                      MACROM_ADDR + ldl_be_p(ptr + 4)); /* reset initial PC */
         }
     }
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 98cfe43c73a..e5ce0c28878 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -219,6 +219,7 @@ static void virt_init(MachineState *machine)
 
     if (kernel_filename) {
         CPUState *cs = CPU(cpu);
+        AddressSpace *as = cpu_get_address_space(cs, 0);
         uint64_t high;
         void *param_blob, *param_ptr, *param_rng_seed;
 
@@ -301,9 +302,9 @@ static void virt_init(MachineState *machine)
         }
         BOOTINFO0(param_ptr, BI_LAST);
         rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
-                              parameters_base, cs->as);
+                              parameters_base, as);
         qemu_register_reset_nosnapshotload(rerandomize_rng_seed,
-                            rom_ptr_for_as(cs->as, parameters_base,
+                            rom_ptr_for_as(as, parameters_base,
                                            param_ptr - param_blob) +
                             (param_rng_seed - param_blob));
         g_free(param_blob);
-- 
2.51.0


