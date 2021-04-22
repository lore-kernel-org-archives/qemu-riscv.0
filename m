Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfBB-0002vN-40
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfB9-0002qh-9J; Thu, 22 Apr 2021 15:39:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfB6-0005WX-Pm; Thu, 22 Apr 2021 15:39:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so3742035wmf.3; 
 Thu, 22 Apr 2021 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a4MHO0sAjPu1j4vS2GRsLm7Hf4W1jjvtSticZ+mNDUM=;
 b=GTu0e8Bp5+vhPuJIJuFaWMmWUuY/lzxngtTQlH5X4oI/JxEVWg/81/XYiS2rvU7Yo0
 nmhsXkIddVrk0b+upIMOBDABjrGrQy5i6rq8icy4VRWAfYvq9mjL5pCtj3TESyyQvhB7
 a/2xrfixQPjVN1Gs4hG9ziy+1gxdMW8QwPYnfEVzOEp3Csl97J1JGZ3h5JbU+/eWMqLP
 xcfDjeeFszmS8GOGaG6gaF5NGlDFhk1hyTt8D66DAt/PsoqDQsFyL69rv4fFTFuCJ5Cs
 ibs7GfGhthCrQv3HST/6v35i2+kf+G1krzvwHpqLUsxU9KGZF1Xl8K3gbHCkXw1YwfMd
 aLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a4MHO0sAjPu1j4vS2GRsLm7Hf4W1jjvtSticZ+mNDUM=;
 b=PbBkceEbNyibVBz3d/xz2PuWUBgG/ntlSoGXngikKuDRWxA2jeRdY4Tjxk0F6B0TKY
 zI9jxl+G+Xhg7Dnsq7S3XX3XClJwfOjhwPRs/qaYFO/Xr7XGQHHtHSSlzFcZptVyP+vx
 kmz9uAAKhR/ifBg8bcLYkjeD7aOU+FK+DU+7p5C0doTmK9yKrt5PpRu22rBiOyFIjwmV
 EkTqS3vC5b1VzEqIrcasSfdvg7gtg0WMl1WC7YI7pyCeavJQ7LMrzxefa6MIoi+kJcRN
 NXZX4G94W/fc12I7czfhaEpayaWGVJo7ayXXev8Ig+MujCBDE6W/aisCJJ36cysZPaQi
 abUw==
X-Gm-Message-State: AOAM531luGvzm6hrSFQNorPtbXDDlZbUy/L5iKiKFNFSye6tmCyoQb2w
 9Fym3D8ET5pumCdIykqbfXmNOU08fZY4hw==
X-Google-Smtp-Source: ABdhPJwUXM2nwf483lvZxNNIPwtwMBwSGDA0CTGAAAZnQZm5GJ+cTcLaXbfYuaJV12+/LUoQk6zAcg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr1710332wmj.128.1619120393221; 
 Thu, 22 Apr 2021 12:39:53 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l20sm5301995wmg.33.2021.04.22.12.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v6 09/18] cpu: Introduce SysemuCPUOps structure
Date: Thu, 22 Apr 2021 21:38:53 +0200
Message-Id: <20210422193902.2644064-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:59 -0000

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
 target/sh4/cpu.c                 |  4 ++++
 target/sparc/cpu.c               |  6 ++++++
 target/tricore/cpu.c             |  4 ++++
 target/unicore32/cpu.c           |  4 ++++
 target/xtensa/cpu.c              |  4 ++++
 target/ppc/translate_init.c.inc  |  6 ++++++
 24 files changed, 148 insertions(+)
 create mode 100644 include/hw/core/sysemu-cpu-ops.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 10dd16531ba..23b718a4a51 100644
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
@@ -191,6 +193,9 @@ struct CPUClass {
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
index 3062e8c702e..c1943194cf1 100644
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
index 3353bcb9fc7..5c8bb9b3fec 100644
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
     dc->vmsd = &vms_avr_cpu;
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
index f85ae518dd4..0920eeef1e7 100644
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
     cc->legacy_vmsd = &vmstate_x86_cpu;
+    cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index e27c1a8bc97..2b40f2b2559 100644
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
     dc->vmsd = &vmstate_lm32_cpu;
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
index 11604954504..0bbaff3b57a 100644
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
     cc->legacy_vmsd = &vmstate_mips_cpu;
+    cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index e5da3fa3f17..e7bf5298c67 100644
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
     dc->vmsd = &vmstate_moxie_cpu;
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
index 70be7e8287a..c465695f00d 100644
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
     cc->legacy_vmsd = &vmstate_riscv_cpu;
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
index 197c4b87f30..7503b9e0c8b 100644
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
     cc->legacy_vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
+    cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 35d4251aaf3..85e15ec9954 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -223,6 +223,9 @@ static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+
+static const struct SysemuCPUOps sh4_sysemu_ops = {
+};
 #endif
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -259,6 +262,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &sh4_sysemu_ops;
     dc->vmsd = &vmstate_sh_cpu;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index ba497561bfa..743a7287a4f 100644
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
     cc->legacy_vmsd = &vmstate_sparc_cpu;
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
index a74ac7b6140..60ae917f0ee 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -120,6 +120,9 @@ static const VMStateDescription vmstate_uc32_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+
+static const struct SysemuCPUOps uc32_sysemu_ops = {
+};
 #endif
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -149,6 +152,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
 #ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &uc32_sysemu_ops;
     dc->vmsd = &vmstate_uc32_cpu;
 #endif
     cc->tcg_ops = &uc32_tcg_ops;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a66527e2d45..d0bf06696e4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -181,6 +181,9 @@ static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+
+static const struct SysemuCPUOps xtensa_sysemu_ops = {
+};
 #endif
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -217,6 +220,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &xtensa_sysemu_ops;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_xtensa_cpu;
 #endif
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 110a68a867e..b15abc36851 100644
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
     cc->legacy_vmsd = &vmstate_ppc_cpu;
+    cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-- 
2.26.3


