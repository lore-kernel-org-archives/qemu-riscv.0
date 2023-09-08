Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F460EE57FA
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 11:23:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeZZw-0003rM-Ui; Fri, 08 Sep 2023 07:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZv-0003pg-4l
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 07:23:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZs-0003gc-2k
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 07:23:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso21596725e9.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694172186; x=1694776986; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82urobPczF4xiQF4fXZ3dDYPIeiqKie7Xzo0ZiKG+mM=;
 b=ye3M8/NdP2OgRfeipGw+HxGlrgozS3I9qfb94EKaYrz2avT+pn7YiXKZlPD3pZYqQh
 G1MXsKD8vECDe0qF5hC2eEWMzEZZjmL+w8/l9/poGTa19EeZRvXSVvoTLGbWt3lrim4n
 xEYqo/sVwPh3rwFLFYqUn7LggNqOAxf6pgMhE+VPpdWzHZGSvN9GqSHbZjkUDRVpimPI
 i3QQuW+BgKEcI1WXkwxXoEMGTIBn0NelM2usElEnYTPApUAo0vuueM6PEmszg6gKohUS
 pyOq3lfh0inJkL6ACsMPJsa4IU3uvM6C8nQc6dPHtLYlMygvzvD4Sck6vEHstISW4W4w
 VGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694172186; x=1694776986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82urobPczF4xiQF4fXZ3dDYPIeiqKie7Xzo0ZiKG+mM=;
 b=Y+s4kVPgGs3eyBtPwZUBys94orw38YaQcMCPzLhoMIEM6odhQrb5IM35Gz0DjWxTsC
 waZtZJ/j4md2+Ynj6hAnefNnW86tzBrFcXy6n3ooE3VEwgAm58eiGSZXhR0SkIKOmOTW
 yrvfVy6Bcy6gG0GK4/RA6jtoQb4ZmN7iebYCBs2iOMA79gNzYC3iFt6x2xff5bjsMFN8
 dcgXm8chZfEAeTNAQuZXWDeJIb5/PHbRBXBSUDuwnyEr4G1IsaWJtuyPv8MmwTl4PBx5
 ks3ZbGUXgqqj4XxwBvGT1kGq8FKHfDnjL9/lkf6oenWeVeiRJVrswi+cvCFc8d8L/Mn3
 ysxw==
X-Gm-Message-State: AOJu0Yy1UoGRdilvicEVzztKV4zIaGHQv7BrtC4HOG0bI6k3uGViFW0G
 68onXEXs4/bpGUgAZZMh2DNMZg==
X-Google-Smtp-Source: AGHT+IHJ//Oq0WnWCVGY+oVTajQAkvPMVqgpa2y93ysEZ+gpCV7FuutdoYO6T6lkjQg1Lqktk1Qf0g==
X-Received: by 2002:a1c:4c0d:0:b0:402:ee9e:ed98 with SMTP id
 z13-20020a1c4c0d000000b00402ee9eed98mr1824246wmf.34.1694172186483; 
 Fri, 08 Sep 2023 04:23:06 -0700 (PDT)
Received: from m1x-phil.lan (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr.
 [176.173.167.175]) by smtp.gmail.com with ESMTPSA id
 q8-20020adfea08000000b0031f2dea4810sm1862430wrm.61.2023.09.08.04.23.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Sep 2023 04:23:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
Date: Fri,  8 Sep 2023 13:22:33 +0200
Message-ID: <20230908112235.75914-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908112235.75914-1-philmd@linaro.org>
References: <20230908112235.75914-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Add a field to return the QOM type name of a CPU class.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h   | 2 ++
 hw/core/cpu-common.c    | 2 +-
 target/alpha/cpu.c      | 1 +
 target/arm/cpu.c        | 1 +
 target/avr/cpu.c        | 1 +
 target/cris/cpu.c       | 1 +
 target/hexagon/cpu.c    | 1 +
 target/hppa/cpu.c       | 1 +
 target/i386/cpu.c       | 1 +
 target/loongarch/cpu.c  | 1 +
 target/m68k/cpu.c       | 1 +
 target/microblaze/cpu.c | 1 +
 target/mips/cpu.c       | 1 +
 target/nios2/cpu.c      | 1 +
 target/openrisc/cpu.c   | 1 +
 target/ppc/cpu_init.c   | 1 +
 target/riscv/cpu.c      | 1 +
 target/rx/cpu.c         | 1 +
 target/s390x/cpu.c      | 1 +
 target/sh4/cpu.c        | 1 +
 target/sparc/cpu.c      | 1 +
 target/tricore/cpu.c    | 1 +
 target/xtensa/cpu.c     | 1 +
 23 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 129d179937..e469efd409 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -100,6 +100,7 @@ struct SysemuCPUOps;
 
 /**
  * CPUClass:
+ * @cpu_resolving_type: CPU QOM type name
  * @class_by_name: Callback to map -cpu command line model name to an
  *                 instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
@@ -148,6 +149,7 @@ struct CPUClass {
     DeviceClass parent_class;
     /*< public >*/
 
+    const char *cpu_resolving_type;
     ObjectClass *(*class_by_name)(const char *cpu_model);
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index c6a0c9390c..2d24261a6a 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -155,7 +155,7 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
     assert(cpu_model);
     oc = object_class_by_name(typename);
     cc = CPU_CLASS(oc);
-    assert(cc->class_by_name);
+    assert(cc->cpu_resolving_type && cc->class_by_name);
     oc = cc->class_by_name(cpu_model);
     if (oc == NULL || object_class_is_abstract(oc)) {
         return NULL;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 351ee2e9f2..0ddea8004c 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -254,6 +254,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, alpha_cpu_realizefn,
                                     &acc->parent_realize);
 
+    cc->cpu_resolving_type = TYPE_ALPHA_CPU;
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 42e29816cc..9e51bde170 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2377,6 +2377,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
                                        &acc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_ARM_CPU;
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 4b255eade1..f6004169ac 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -233,6 +233,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, avr_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_AVR_CPU;
     cc->class_by_name = avr_cpu_class_by_name;
 
     cc->has_work = avr_cpu_has_work;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 115f6e2ea2..adde4f599d 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -314,6 +314,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, cris_cpu_reset_hold, NULL,
                                        &ccc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_CRIS_CPU;
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 5e301327d3..2d4fed838d 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -381,6 +381,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, hexagon_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_HEXAGON_CPU;
     cc->class_by_name = hexagon_cpu_class_by_name;
     cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 11022f9c99..47950a15ae 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -192,6 +192,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, hppa_cpu_realizefn,
                                     &acc->parent_realize);
 
+    cc->cpu_resolving_type = TYPE_HPPA_CPU;
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 00f913b638..9979464420 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7951,6 +7951,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                                        &xcc->parent_phases);
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
+    cc->cpu_resolving_type = TYPE_X86_CPU;
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index fe2e5ecc46..189dfd32d1 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -743,6 +743,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, loongarch_cpu_reset_hold, NULL,
                                        &lacc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_LOONGARCH_CPU;
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 004f3d6265..bd7bb103d7 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -558,6 +558,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_M68K_CPU;
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 03c2c4db1f..bb5f2c1f00 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -414,6 +414,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, mb_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_MICROBLAZE_CPU;
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 63da1948fd..649147df2e 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -578,6 +578,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, mips_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_MIPS_CPU;
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index bc5cbf81c2..fc7c6a83ee 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -381,6 +381,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, nios2_cpu_reset_hold, NULL,
                                        &ncc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_NIOS2_CPU;
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 3bbbcc4e63..5e1e0576e0 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -243,6 +243,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, openrisc_cpu_reset_hold, NULL,
                                        &occ->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_OPENRISC_CPU;
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 02b7aad9b0..bc106d01a2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7357,6 +7357,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, ppc_cpu_reset_hold, NULL,
                                        &pcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_POWERPC_CPU;
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 17b00eb7c0..e8f04ef82b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2130,6 +2130,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_RISCV_CPU;
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index c98034540d..2a6df418a8 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -222,6 +222,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     resettable_class_set_parent_phases(rc, NULL, rx_cpu_reset_hold, NULL,
                                        &rcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_RX_CPU;
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df167493c3..bcba466bb4 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -336,6 +336,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, s390_cpu_reset_full, &scc->parent_reset);
 
     scc->reset = s390_cpu_reset;
+    cc->cpu_resolving_type = TYPE_S390_CPU;
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index bc112776fc..17c87f15f2 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -283,6 +283,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, superh_cpu_reset_hold, NULL,
                                        &scc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_SUPERH_CPU;
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 130ab8f578..e41a9f4ee2 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -902,6 +902,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, sparc_cpu_reset_hold, NULL,
                                        &scc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_SPARC_CPU;
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index a2381b0dc1..ffe5158786 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -202,6 +202,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
+    cc->cpu_resolving_type = TYPE_TRICORE_CPU;
     cc->class_by_name = tricore_cpu_class_by_name;
     cc->has_work = tricore_cpu_has_work;
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a31825a2b5..13bed05d0c 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -252,6 +252,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     resettable_class_set_parent_phases(rc, NULL, xtensa_cpu_reset_hold, NULL,
                                        &xcc->parent_phases);
 
+    cc->cpu_resolving_type = TYPE_XTENSA_CPU;
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
-- 
2.41.0


