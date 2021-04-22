Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWs8-0006ET-Qt
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWs6-00068M-Gg; Thu, 22 Apr 2021 06:47:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWs4-000582-17; Thu, 22 Apr 2021 06:47:46 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so2967735wmq.4; 
 Thu, 22 Apr 2021 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qsXp8OKDDW+PlplyGz+QwsT/qhDxPykmsnrnmWldzQ=;
 b=Ae+uN+lHmLTzIW1JkUZTYSeaXBZjcPZr04dWJKBQwtRWSevhNItsQBJSfiI3yqgh9E
 crDl9I9Dgzw2l6+HBMxlJUbw0Xf7OtPflk40lrZkzXEfFmJwECVSATVIb3uuxq3GrXbA
 LpRgUOEu4k8h2XVUFSY2amwtUTpdtJ9y/FWt/E7vfMM8WcVJCcVQ4c1jgRqMzjxVzCno
 8vJ/UG+60J8sgZ6oEvn73sd7u8kuyISc301qiKZ9ze6txVwERhXykAHoGIxIzvgF5lJF
 rdjpHP0U4YFAgaQeiw6/DY4NsJ0yRfwuOpFP/thUVZQHLcj1q62EOQHMd0E5H6E8kQ7/
 xJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5qsXp8OKDDW+PlplyGz+QwsT/qhDxPykmsnrnmWldzQ=;
 b=Cz8DiDmV1i/hDOsNs2s/Q9+AMgfDBPQ4acqNn0RbcAd+dZjH0jeRp4KMgZjFEQMB6L
 l9h0lkXVb/26ZKV/XN28cewe8L2Y4aOue50hze3cDwNc1c77/5WCpk/xnQCR4CNH1r+Y
 Zhb3AyGBLXrtFBXiA3XPXNqqWKXdTvQb2yQsvL/SeLrizFdPoqFucORrGXiUApWmUzPw
 nX42vu6CvNvN/yE0JEgw5uqwEvDpEmGkkdv2FJHpJNaW6awy3LdWyBfOIAgrx6n4aF/S
 Wh2HWd0Z0nEyGG9gPWyJ8Z/ewlqQSSH5x6VROZUueBK7IOwvEn6ZJH0TTot8cIjZIaD9
 6csQ==
X-Gm-Message-State: AOAM530/D4tuSt3QZJnjp8cdd8D5yQfBgRYi2WrPf7bCpJ4bry4UqJwh
 fBLYLv2h73hY/EBOsFmrQ2LKrFlkLcNuFA==
X-Google-Smtp-Source: ABdhPJxqRkL2nhVgK+4xqQPerI6VCl5Zj27vBUIiNjMNMw1fWywtfPM3lkaZXVhiXwNHsTKpoIUznA==
X-Received: by 2002:a1c:7ed3:: with SMTP id z202mr3113196wmc.136.1619088460857; 
 Thu, 22 Apr 2021 03:47:40 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o18sm2514220wmp.26.2021.04.22.03.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Juan Quintela <quintela@redhat.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 06/15] cpu: Introduce SysemuCPUOps structure
Date: Thu, 22 Apr 2021 12:46:55 +0200
Message-Id: <20210422104705.2454166-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Apr 2021 10:47:47 -0000

Introduce a structure to hold handler specific to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            |  5 +++++
 include/hw/core/sysemu-cpu-ops.h | 21 +++++++++++++++++++++
 target/alpha/cpu.c               |  6 ++++++
 target/arm/cpu.c                 |  6 ++++++
 target/avr/cpu.c                 |  4 ++++
 target/cris/cpu.c                |  6 ++++++
 target/hppa/cpu.c                |  6 ++++++
 target/i386/cpu.c                |  6 ++++++
 target/lm32/cpu.c                |  6 ++++++
 target/m68k/cpu.c                |  6 ++++++
 target/microblaze/cpu.c          |  6 ++++++
 target/mips/cpu.c                |  6 ++++++
 target/moxie/cpu.c               |  4 ++++
 target/nios2/cpu.c               |  6 ++++++
 target/openrisc/cpu.c            |  6 ++++++
 target/riscv/cpu.c               |  6 ++++++
 target/rx/cpu.c                  |  8 ++++++++
 target/s390x/cpu.c               |  6 ++++++
 target/sh4/cpu.c                 |  6 ++++++
 target/sparc/cpu.c               |  6 ++++++
 target/tricore/cpu.c             |  4 ++++
 target/unicore32/cpu.c           |  4 ++++
 target/xtensa/cpu.c              |  6 ++++++
 target/ppc/translate_init.c.inc  |  6 ++++++
 24 files changed, 152 insertions(+)
 create mode 100644 include/hw/core/sysemu-cpu-ops.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 08af2c383a5..24cb05c5476 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,6 +80,8 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
+#include "hw/core/sysemu-cpu-ops.h"
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -190,6 +192,9 @@ struct CPUClass {
     bool gdb_stop_before_watchpoint;
     struct AccelCPUClass *accel_cpu;
 
+    /* when system emulation is not available, this pointer is NULL */
+    const struct SysemuCPUOps *sysemu_ops;
+
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
 };
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
new file mode 100644
index 00000000000..e54a08ea25e
--- /dev/null
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -0,0 +1,21 @@
+/*
+ * CPU operations specific to system emulation
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SYSEMU_CPU_OPS_H
+#define SYSEMU_CPU_OPS_H
+
+#include "hw/core/cpu.h"
+
+/*
+ * struct SysemuCPUOps: System operations specific to a CPU class
+ */
+typedef struct SysemuCPUOps {
+} SysemuCPUOps;
+
+#endif /* SYSEMU_CPU_OPS_H */
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 27192b62e22..cd01d34d92f 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -206,6 +206,11 @@ static void alpha_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps alpha_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps alpha_tcg_ops = {
@@ -238,6 +243,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
+    cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0dd623e5909..73a236486df 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1943,6 +1943,11 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
     return g_strdup("arm");
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps arm_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 static struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
@@ -1986,6 +1991,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
+    cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932ba..78ef4473c50 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -184,6 +184,9 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "\n");
 }
 
+static const struct SysemuCPUOps avr_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps avr_tcg_ops = {
@@ -214,6 +217,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
     cc->vmsd = &vms_avr_cpu;
+    cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed983380fca..394df655c9f 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -193,6 +193,11 @@ static void cris_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps cris_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps crisv10_tcg_ops = {
@@ -294,6 +299,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_cris_cpu;
+    cc->sysemu_ops = &cris_sysemu_ops;
 #endif
 
     cc->gdb_num_core_regs = 49;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d8fad52d1fe..6605c42e509 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -131,6 +131,11 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_HPPA_CPU);
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps hppa_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps hppa_tcg_ops = {
@@ -163,6 +168,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_hppa_cpu;
+    cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->gdb_num_core_regs = 128;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7c..69858dcb243 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7391,6 +7391,11 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps i386_sysemu_ops = {
+};
+#endif
+
 static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 {
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
@@ -7432,6 +7437,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->vmsd = &vmstate_x86_cpu;
+    cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c23d72874c0..15935ae7ceb 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -210,6 +210,11 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps lm32_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps lm32_tcg_ops = {
@@ -242,6 +247,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_lm32_cpu;
+    cc->sysemu_ops = &lm32_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index a14874b4da2..600812d682b 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -503,6 +503,11 @@ static const VMStateDescription vmstate_m68k_cpu = {
 };
 #endif
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps m68k_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps m68k_tcg_ops = {
@@ -535,6 +540,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_m68k_cpu;
+    cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 433ba202037..c6a10b1a52b 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -352,6 +352,11 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_MICROBLAZE_CPU);
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps mb_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps mb_tcg_ops = {
@@ -388,6 +393,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
+    cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
     cc->gdb_num_core_regs = 32 + 27;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index dce1e166bde..493331bf7bb 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -680,6 +680,11 @@ static Property mips_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps mips_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 /*
@@ -721,6 +726,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_mips_cpu;
+    cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 83bec34d36c..2cd631a7304 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -94,6 +94,9 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static const struct SysemuCPUOps moxie_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps moxie_tcg_ops = {
@@ -125,6 +128,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
+    cc->sysemu_ops = &moxie_sysemu_ops;
     cc->tcg_ops = &moxie_tcg_ops;
 }
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e9c9fc3a389..296ccc0ed3c 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -207,6 +207,11 @@ static Property nios2_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps nios2_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps nios2_tcg_ops = {
@@ -238,6 +243,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &nios2_sysemu_ops;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2c64842f46b..cd8e3ae6754 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -174,6 +174,11 @@ static void openrisc_any_initfn(Object *obj)
                       | (IMMUCFGR_NTS & (ctz32(TLB_SIZE) << 2));
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps openrisc_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps openrisc_tcg_ops = {
@@ -205,6 +210,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_openrisc_cpu;
+    cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
     cc->disas_set_info = openrisc_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b6..a6b909fa797 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -581,6 +581,11 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     return NULL;
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps riscv_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps riscv_tcg_ops = {
@@ -625,6 +630,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
+    cc->sysemu_ops = &riscv_sysemu_ops;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 7ac6618b26b..bbee1cb913f 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -173,6 +173,11 @@ static void rx_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps rx_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps rx_tcg_ops = {
@@ -202,6 +207,9 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
+#ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &rx_sysemu_ops;
+#endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1bb..36085035d1f 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -477,6 +477,11 @@ static void s390_cpu_reset_full(DeviceState *dev)
     return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
 }
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps s390_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -520,6 +525,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
+    cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f8..970d94a8a1a 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -223,6 +223,11 @@ static const VMStateDescription vmstate_sh_cpu = {
     .unmigratable = 1,
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps sh4_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps superh_tcg_ops = {
@@ -257,6 +262,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &sh4_sysemu_ops;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc83..a5dde9f7dd9 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -848,6 +848,11 @@ static Property sparc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps sparc_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -890,6 +895,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_sparc_cpu;
+    cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0b1e139bcba..8865fa18fce 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -142,6 +142,9 @@ static void tc27x_initfn(Object *obj)
     set_feature(&cpu->env, TRICORE_FEATURE_161);
 }
 
+static const struct SysemuCPUOps tricore_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps tricore_tcg_ops = {
@@ -171,6 +174,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 0258884f845..b67283ca592 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -120,6 +120,9 @@ static const VMStateDescription vmstate_uc32_cpu = {
     .unmigratable = 1,
 };
 
+static const struct SysemuCPUOps uc32_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps uc32_tcg_ops = {
@@ -147,6 +150,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_uc32_cpu;
+    cc->sysemu_ops = &uc32_sysemu_ops;
     cc->tcg_ops = &uc32_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c1..e93154de3e0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -181,6 +181,11 @@ static const VMStateDescription vmstate_xtensa_cpu = {
     .unmigratable = 1,
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps xtensa_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps xtensa_tcg_ops = {
@@ -215,6 +220,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &xtensa_sysemu_ops;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f526..2a858cd0f2a 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10878,6 +10878,11 @@ static Property ppc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifndef CONFIG_USER_ONLY
+static const struct SysemuCPUOps ppc_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -10921,6 +10926,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_ppc_cpu;
+    cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-- 
2.26.3


