Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB1ACDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:06:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImW-0004uP-Pc; Fri, 13 Oct 2023 10:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlA-0000PE-EN
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:24 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIl5-0002UD-6N
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:24 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so431250666b.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205797; x=1697810597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGFmBfq77hiCYUzTv7o6AOP7VnebQdIwnvJgn+wZM78=;
 b=aYB0AGDLOFfsFAM9jSSs7IssCA/g5gniniYPkJ+jkH2nXKreUtEujZ7xiGrNVIb8xE
 TgkcG22qxuFwBuU/vxLiq/eTVDQL/7EMrHumnycjd9A2wwQh70Ws0+h5N/OliULFcZmB
 TEIYf92SZbzPZjriVhiIwiOUPHriELTwBVQrkBYIVZPsXUwz8exrymqVPdmgBGSNXCVm
 ys/epo+NYBjwMKDTuDHy0YXN6rVFnCosFbogIjrXBBL+vKcuP6tqKLcQYrZdPdVCwt0h
 Xb6+/JltwO5f6U+74M1n3iTSy0W9NiDlozLuxOoily25zP7TpIwzZLLkTQwpAkihe04+
 Ot0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205797; x=1697810597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGFmBfq77hiCYUzTv7o6AOP7VnebQdIwnvJgn+wZM78=;
 b=hY97YvcEDMyX8D+LJlwT5VvrbciA69uaaJVJtDsKBuf4L8ShG0+mUWD5ELGdmFxiOI
 EWLyGlhpjDpWR4a+h/dr3vD815CMNSf08MAaCSGi82mDjnhSH9jRAAKzF1qU8Zq4bT4y
 73oc83vwQfM67ch+QLe7J6XsjoYytxAuzUkZxX5g9x3QrPCnlQaYf5DPJenPGN2Izbpa
 bYXT/RvcD+QOjJpTqga2a2TxBmFimUlBKVfBnIwh6J0x6PgJMFfoDW96ClleaXYO7fTA
 wLGxbo6NbEl6cgvAZbVrYhX4Rhh1rL0bJmWKwKuVr0cHAft+2nlju/Py3atou/9S6uoE
 ahsQ==
X-Gm-Message-State: AOJu0Yy4pZUwUeiWaTszI6SFr3z7XipSspGW63fEoEdY8SsZG01KeCoP
 zkE01LiWxwn0u5DKypwwhMZRQg==
X-Google-Smtp-Source: AGHT+IHme/MBd8AMlr8n5IEv1hkYDCgRpSmDe2mg62hsjyltBWhAm/vWSFqx/oxlSPiXtfyfJn62tA==
X-Received: by 2002:a17:907:6ea3:b0:9b2:bcea:e517 with SMTP id
 sh35-20020a1709076ea300b009b2bceae517mr197071ejc.10.1697205795457; 
 Fri, 13 Oct 2023 07:03:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 dv8-20020a170906b80800b0099cc36c4681sm12423023ejb.157.2023.10.13.07.03.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:14 -0700 (PDT)
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
Subject: [PATCH v2 12/16] target: Move ArchCPUClass definition to 'cpu.h'
Date: Fri, 13 Oct 2023 16:01:11 +0200
Message-ID: <20231013140116.255-13-philmd@linaro.org>
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

The OBJECT_DECLARE_CPU_TYPE() macro forward-declares each
ArchCPUClass type. These forward declarations are sufficient
for code in hw/ to use the QOM definitions. No need to expose
these structure definitions. Keep each local to their target/
by moving them to the corresponding "cpu.h" header.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu-qom.h      | 16 ---------------
 target/alpha/cpu.h          | 13 +++++++++++++
 target/arm/cpu-qom.h        | 27 -------------------------
 target/arm/cpu.h            | 25 ++++++++++++++++++++++++
 target/avr/cpu-qom.h        | 16 ---------------
 target/avr/cpu.h            | 14 +++++++++++++
 target/cris/cpu-qom.h       | 19 ------------------
 target/cris/cpu.h           | 16 +++++++++++++++
 target/hexagon/cpu-qom.h    |  1 -
 target/hppa/cpu-qom.h       | 16 ---------------
 target/hppa/cpu.h           | 14 +++++++++++++
 target/i386/cpu-qom.h       | 39 -------------------------------------
 target/i386/cpu.h           | 35 +++++++++++++++++++++++++++++++++
 target/loongarch/cpu-qom.h  |  1 -
 target/m68k/cpu-qom.h       | 16 ---------------
 target/m68k/cpu.h           | 13 +++++++++++++
 target/microblaze/cpu-qom.h | 16 ---------------
 target/microblaze/cpu.h     | 13 +++++++++++++
 target/mips/cpu-qom.h       | 20 -------------------
 target/mips/cpu.h           | 17 ++++++++++++++++
 target/nios2/cpu-qom.h      |  1 -
 target/openrisc/cpu-qom.h   |  1 -
 target/riscv/cpu-qom.h      | 16 +--------------
 target/riscv/cpu.h          | 14 +++++++++++++
 target/rx/cpu-qom.h         | 15 --------------
 target/rx/cpu.h             | 14 +++++++++++++
 target/s390x/cpu-qom.h      | 37 +----------------------------------
 target/s390x/cpu.h          | 30 ++++++++++++++++++++++++++++
 target/s390x/cpu_models.h   |  8 ++++----
 target/sh4/cpu-qom.h        | 23 ----------------------
 target/sh4/cpu.h            | 20 +++++++++++++++++++
 target/sparc/cpu-qom.h      | 18 -----------------
 target/sparc/cpu.h          | 18 +++++++++++++++--
 target/tricore/cpu-qom.h    | 10 ----------
 target/tricore/cpu.h        |  6 ++++++
 target/xtensa/cpu-qom.h     | 21 --------------------
 target/xtensa/cpu.h         | 20 +++++++++++++++++--
 37 files changed, 284 insertions(+), 335 deletions(-)

diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index c4a4523993..1b32b18d34 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_ALPHA_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_ALPHA_CPU "alpha-cpu"
 
@@ -30,19 +29,4 @@ OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
 #define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
 #define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
 
-/**
- * AlphaCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
- *
- * An Alpha CPU model.
- */
-struct AlphaCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    DeviceReset parent_reset;
-};
-
-
 #endif
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 3bff56c565..d672e911dd 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -267,6 +267,19 @@ struct ArchCPU {
     QEMUTimer *alarm_timer;
 };
 
+/**
+ * AlphaCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_reset: The parent class' reset handler.
+ *
+ * An Alpha CPU model.
+ */
+struct AlphaCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+};
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_alpha_cpu;
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 35c3b0924e..02b914c876 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_ARM_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_ARM_CPU "arm-cpu"
 
@@ -29,35 +28,9 @@ OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
 
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
-typedef struct ARMCPUInfo {
-    const char *name;
-    void (*initfn)(Object *obj);
-    void (*class_init)(ObjectClass *oc, void *data);
-} ARMCPUInfo;
-
-/**
- * ARMCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * An ARM CPU model.
- */
-struct ARMCPUClass {
-    CPUClass parent_class;
-
-    const ARMCPUInfo *info;
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
-
 #define TYPE_AARCH64_CPU "aarch64-cpu"
 typedef struct AArch64CPUClass AArch64CPUClass;
 DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
                        TYPE_AARCH64_CPU)
 
-struct AArch64CPUClass {
-    ARMCPUClass parent_class;
-};
-
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 06f92dacb9..ad2f32efd5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,6 +1116,31 @@ struct ArchCPU {
     uint64_t gt_cntfrq_hz;
 };
 
+typedef struct ARMCPUInfo {
+    const char *name;
+    void (*initfn)(Object *obj);
+    void (*class_init)(ObjectClass *oc, void *data);
+} ARMCPUInfo;
+
+/**
+ * ARMCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * An ARM CPU model.
+ */
+struct ARMCPUClass {
+    CPUClass parent_class;
+
+    const ARMCPUInfo *info;
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+struct AArch64CPUClass {
+    ARMCPUClass parent_class;
+};
+
 /* Callback functions for the generic timer's timers. */
 void arm_gt_ptimer_cb(void *opaque);
 void arm_gt_vtimer_cb(void *opaque);
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 75590cdd97..38dbcc0535 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -22,7 +22,6 @@
 #define TARGET_AVR_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_AVR_CPU "avr-cpu"
 
@@ -31,19 +30,4 @@ OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
 #define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
 #define AVR_CPU_TYPE_NAME(name) (name AVR_CPU_TYPE_SUFFIX)
 
-/**
- *  AVRCPUClass:
- *  @parent_realize: The parent class' realize handler.
- *  @parent_phases: The parent class' reset phase handlers.
- *
- *  A AVR CPU model.
- */
-struct AVRCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
-
 #endif /* TARGET_AVR_CPU_QOM_H */
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 0487399cb2..8a17862737 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -147,6 +147,20 @@ struct ArchCPU {
     CPUAVRState env;
 };
 
+/**
+ *  AVRCPUClass:
+ *  @parent_realize: The parent class' realize handler.
+ *  @parent_phases: The parent class' reset phase handlers.
+ *
+ *  A AVR CPU model.
+ */
+struct AVRCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
 extern const struct VMStateDescription vms_avr_cpu;
 
 void avr_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index d7e5f33e62..741ca97a1b 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_CRIS_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_CRIS_CPU "cris-cpu"
 
@@ -30,22 +29,4 @@ OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
 #define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
 #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
 
-/**
- * CRISCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- * @vr: Version Register value.
- *
- * A CRIS CPU model.
- */
-struct CRISCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-
-    uint32_t vr;
-};
-
-
 #endif
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index b821bb7983..1be7f90319 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -179,6 +179,22 @@ struct ArchCPU {
     CPUCRISState env;
 };
 
+/**
+ * CRISCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ * @vr: Version Register value.
+ *
+ * A CRIS CPU model.
+ */
+struct CRISCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+
+    uint32_t vr;
+};
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_cris_cpu;
diff --git a/target/hexagon/cpu-qom.h b/target/hexagon/cpu-qom.h
index f02df7ee6f..da92fe7468 100644
--- a/target/hexagon/cpu-qom.h
+++ b/target/hexagon/cpu-qom.h
@@ -10,7 +10,6 @@
 #define QEMU_HEXAGON_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_HEXAGON_CPU "hexagon-cpu"
 
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index 4b1d48f7ca..7270e93e6b 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -21,25 +21,9 @@
 #define QEMU_HPPA_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_HPPA_CPU "hppa-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(HPPACPU, HPPACPUClass, HPPA_CPU)
 
-/**
- * HPPACPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
- *
- * An HPPA CPU model.
- */
-struct HPPACPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    DeviceReset parent_reset;
-};
-
-
 #endif
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 518ea94f4f..0a0c7366c2 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -239,6 +239,20 @@ struct ArchCPU {
     QEMUTimer *alarm_timer;
 };
 
+/**
+ * HPPACPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_reset: The parent class' reset handler.
+ *
+ * An HPPA CPU model.
+ */
+struct HPPACPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+};
+
 #include "exec/cpu-all.h"
 
 static inline int cpu_mmu_index(CPUHPPAState *env, bool ifetch)
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index dffc74c1ce..d4e216d000 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -21,8 +21,6 @@
 #define QEMU_I386_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qemu/notify.h"
-#include "qom/object.h"
 
 #ifdef TARGET_X86_64
 #define TYPE_X86_CPU "x86_64-cpu"
@@ -35,41 +33,4 @@ OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
 #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
 #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
 
-typedef struct X86CPUModel X86CPUModel;
-
-/**
- * X86CPUClass:
- * @cpu_def: CPU model definition
- * @host_cpuid_required: Whether CPU model requires cpuid from host.
- * @ordering: Ordering on the "-cpu help" CPU model list.
- * @migration_safe: See CpuDefinitionInfo::migration_safe
- * @static_model: See CpuDefinitionInfo::static
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * An x86 CPU model or family.
- */
-struct X86CPUClass {
-    CPUClass parent_class;
-
-    /* CPU definition, automatically loaded by instance_init if not NULL.
-     * Should be eventually replaced by subclass-specific property defaults.
-     */
-    X86CPUModel *model;
-
-    bool host_cpuid_required;
-    int ordering;
-    bool migration_safe;
-    bool static_model;
-
-    /* Optional description of CPU model.
-     * If unavailable, cpu_def->model_id is used */
-    const char *model_description;
-
-    DeviceRealize parent_realize;
-    DeviceUnrealize parent_unrealize;
-    ResettablePhases parent_phases;
-};
-
-
 #endif
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 2dea4df086..e21d293daa 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2037,6 +2037,41 @@ struct ArchCPU {
     bool xen_vapic;
 };
 
+typedef struct X86CPUModel X86CPUModel;
+
+/**
+ * X86CPUClass:
+ * @cpu_def: CPU model definition
+ * @host_cpuid_required: Whether CPU model requires cpuid from host.
+ * @ordering: Ordering on the "-cpu help" CPU model list.
+ * @migration_safe: See CpuDefinitionInfo::migration_safe
+ * @static_model: See CpuDefinitionInfo::static
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * An x86 CPU model or family.
+ */
+struct X86CPUClass {
+    CPUClass parent_class;
+
+    /* CPU definition, automatically loaded by instance_init if not NULL.
+     * Should be eventually replaced by subclass-specific property defaults.
+     */
+    X86CPUModel *model;
+
+    bool host_cpuid_required;
+    int ordering;
+    bool migration_safe;
+    bool static_model;
+
+    /* Optional description of CPU model.
+     * If unavailable, cpu_def->model_id is used */
+    const char *model_description;
+
+    DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
+    ResettablePhases parent_phases;
+};
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_x86_cpu;
diff --git a/target/loongarch/cpu-qom.h b/target/loongarch/cpu-qom.h
index 82c86d146d..fa3fcf7186 100644
--- a/target/loongarch/cpu-qom.h
+++ b/target/loongarch/cpu-qom.h
@@ -9,7 +9,6 @@
 #define LOONGARCH_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
 #define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index df0cc8b7a3..273e8eae41 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_M68K_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_M68K_CPU "m68k-cpu"
 
@@ -30,19 +29,4 @@ OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 #define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
 #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
 
-/*
- * M68kCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A Motorola 68k CPU model.
- */
-struct M68kCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
-
 #endif
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7f34686a6f..6cfc696d2b 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -169,6 +169,19 @@ struct ArchCPU {
     CPUM68KState env;
 };
 
+/*
+ * M68kCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A Motorola 68k CPU model.
+ */
+struct M68kCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
 
 #ifndef CONFIG_USER_ONLY
 void m68k_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 78f549b57d..92e539fb2f 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -21,25 +21,9 @@
 #define QEMU_MICROBLAZE_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
 
-/**
- * MicroBlazeCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A MicroBlaze CPU model.
- */
-struct MicroBlazeCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
-
 #endif
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e8000237d8..b5374365f5 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -355,6 +355,19 @@ struct ArchCPU {
     MicroBlazeCPUConfig cfg;
 };
 
+/**
+ * MicroBlazeCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A MicroBlaze CPU model.
+ */
+struct MicroBlazeCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
 
 #ifndef CONFIG_USER_ONLY
 void mb_cpu_do_interrupt(CPUState *cs);
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 5822dfb1d2..0eea2a2598 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_MIPS_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #ifdef TARGET_MIPS64
 #define TYPE_MIPS_CPU "mips64-cpu"
@@ -34,23 +33,4 @@ OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
 #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
 #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
 
-/**
- * MIPSCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A MIPS CPU model.
- */
-struct MIPSCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-    const struct mips_def_t *cpu_def;
-
-    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
-    bool no_data_aborts;
-};
-
-
 #endif
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 12cc1bfafd..52f13f0363 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1217,6 +1217,23 @@ struct ArchCPU {
     Clock *count_div; /* Divider for CP0_Count clock */
 };
 
+/**
+ * MIPSCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A MIPS CPU model.
+ */
+struct MIPSCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+    const struct mips_def_t *cpu_def;
+
+    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
+    bool no_data_aborts;
+};
 
 void mips_cpu_list(void);
 
diff --git a/target/nios2/cpu-qom.h b/target/nios2/cpu-qom.h
index 931bc69b10..2fd9121540 100644
--- a/target/nios2/cpu-qom.h
+++ b/target/nios2/cpu-qom.h
@@ -10,7 +10,6 @@
 #define QEMU_NIOS2_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_NIOS2_CPU "nios2-cpu"
 
diff --git a/target/openrisc/cpu-qom.h b/target/openrisc/cpu-qom.h
index 1ba9fb0a4c..14bac33312 100644
--- a/target/openrisc/cpu-qom.h
+++ b/target/openrisc/cpu-qom.h
@@ -10,7 +10,6 @@
 #define QEMU_OPENRISC_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 76efb614a6..35ca5c4600 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -20,7 +20,6 @@
 #define RISCV_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_RISCV_CPU "riscv-cpu"
 #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
@@ -44,21 +43,8 @@
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
-typedef struct CPUArchState CPURISCVState;
+typedef struct CPUArchState CPURISCVState; // XXX
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 
-/**
- * RISCVCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A RISCV CPU model.
- */
-struct RISCVCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d832696418..a7edf95213 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -414,6 +414,20 @@ struct ArchCPU {
     GHashTable *pmu_event_ctr_map;
 };
 
+/**
+ * RISCVCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A RISCV CPU model.
+ */
+struct RISCVCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
 {
     return (env->misa_ext & ext) != 0;
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index 6213d877f7..ac2e5785ef 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -20,7 +20,6 @@
 #define RX_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_RX_CPU "rx-cpu"
 
@@ -31,18 +30,4 @@ OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 
-/*
- * RXCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A RX CPU model.
- */
-struct RXCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
 #endif
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index c81613770c..e931e77e85 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -112,6 +112,20 @@ struct ArchCPU {
     CPURXState env;
 };
 
+/*
+ * RXCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A RX CPU model.
+ */
+struct RXCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 const char *rx_crname(uint8_t cr);
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index fcd70daddf..4037e31f79 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_S390_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_S390_CPU "s390x-cpu"
 
@@ -30,40 +29,6 @@ OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
 #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
 
-typedef struct S390CPUModel S390CPUModel;
-typedef struct S390CPUDef S390CPUDef;
-
-typedef struct CPUArchState CPUS390XState;
-
-typedef enum cpu_reset_type {
-    S390_CPU_RESET_NORMAL,
-    S390_CPU_RESET_INITIAL,
-    S390_CPU_RESET_CLEAR,
-} cpu_reset_type;
-
-/**
- * S390CPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
- * @load_normal: Performs a load normal.
- * @cpu_reset: Performs a CPU reset.
- * @initial_cpu_reset: Performs an initial CPU reset.
- *
- * An S/390 CPU model.
- */
-struct S390CPUClass {
-    CPUClass parent_class;
-
-    const S390CPUDef *cpu_def;
-    bool kvm_required;
-    bool is_static;
-    bool is_migration_safe;
-    const char *desc;
-
-    DeviceRealize parent_realize;
-    DeviceReset parent_reset;
-    void (*load_normal)(CPUState *cpu);
-    void (*reset)(CPUState *cpu, cpu_reset_type type);
-};
+typedef struct CPUArchState CPUS390XState; // XXX
 
 #endif
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 988e2954a4..7e2cccec65 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -175,6 +175,36 @@ struct ArchCPU {
     uint32_t irqstate_saved_size;
 };
 
+typedef enum cpu_reset_type {
+    S390_CPU_RESET_NORMAL,
+    S390_CPU_RESET_INITIAL,
+    S390_CPU_RESET_CLEAR,
+} cpu_reset_type;
+
+/**
+ * S390CPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_reset: The parent class' reset handler.
+ * @load_normal: Performs a load normal.
+ * @cpu_reset: Performs a CPU reset.
+ * @initial_cpu_reset: Performs an initial CPU reset.
+ *
+ * An S/390 CPU model.
+ */
+struct S390CPUClass {
+    CPUClass parent_class;
+
+    const S390CPUDef *cpu_def;
+    bool kvm_required;
+    bool is_static;
+    bool is_migration_safe;
+    const char *desc;
+
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+    void (*load_normal)(CPUState *cpu);
+    void (*reset)(CPUState *cpu, cpu_reset_type type);
+};
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_s390_cpu;
diff --git a/target/s390x/cpu_models.h b/target/s390x/cpu_models.h
index cc7305ec21..d7b8912989 100644
--- a/target/s390x/cpu_models.h
+++ b/target/s390x/cpu_models.h
@@ -18,7 +18,7 @@
 #include "hw/core/cpu.h"
 
 /* static CPU definition */
-struct S390CPUDef {
+typedef struct S390CPUDef {
     const char *name;       /* name exposed to the user */
     const char *desc;       /* description exposed to the user */
     uint8_t gen;            /* hw generation identification */
@@ -38,10 +38,10 @@ struct S390CPUDef {
     S390FeatBitmap full_feat;
     /* used to init full_feat from generated data */
     S390FeatInit full_init;
-};
+} S390CPUDef;
 
 /* CPU model based on a CPU definition */
-struct S390CPUModel {
+typedef struct S390CPUModel {
     const S390CPUDef *def;
     S390FeatBitmap features;
     /* values copied from the "host" model, can change during migration */
@@ -49,7 +49,7 @@ struct S390CPUModel {
     uint32_t cpu_id;        /* CPU id */
     uint8_t cpu_id_format;  /* CPU id format bit */
     uint8_t cpu_ver;        /* CPU version, usually "ff" for kvm */
-};
+} S390CPUModel;
 
 /*
  * CPU ID
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index bd0ef49fa1..6cf5fbb074 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_SUPERH_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_SUPERH_CPU "superh-cpu"
 
@@ -34,26 +33,4 @@ OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
 #define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
 #define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
 
-/**
- * SuperHCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- * @pvr: Processor Version Register
- * @prr: Processor Revision Register
- * @cvr: Cache Version Register
- *
- * A SuperH CPU model.
- */
-struct SuperHCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-
-    uint32_t pvr;
-    uint32_t prr;
-    uint32_t cvr;
-};
-
-
 #endif
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dbe00e29c2..360eac1fbe 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -209,6 +209,26 @@ struct ArchCPU {
     CPUSH4State env;
 };
 
+/**
+ * SuperHCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ * @pvr: Processor Version Register
+ * @prr: Processor Revision Register
+ * @cvr: Cache Version Register
+ *
+ * A SuperH CPU model.
+ */
+struct SuperHCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+
+    uint32_t pvr;
+    uint32_t prr;
+    uint32_t cvr;
+};
 
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index aca29415b4..a86331bd58 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -21,7 +21,6 @@
 #define QEMU_SPARC_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #ifdef TARGET_SPARC64
 #define TYPE_SPARC_CPU "sparc64-cpu"
@@ -34,21 +33,4 @@ OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
 #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
 #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
 
-typedef struct sparc_def_t sparc_def_t;
-/**
- * SPARCCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A SPARC CPU model.
- */
-struct SPARCCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-    sparc_def_t *cpu_def;
-};
-
-
 #endif
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 31772c9b73..9cee99d687 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -252,7 +252,7 @@ typedef struct trap_state {
 #endif
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
-struct sparc_def_t {
+typedef struct sparc_def_t {
     const char *name;
     target_ulong iu_version;
     uint32_t fpu_version;
@@ -266,7 +266,7 @@ struct sparc_def_t {
     uint32_t features;
     uint32_t nwindows;
     uint32_t maxtl;
-};
+} sparc_def_t;
 
 #define CPU_FEATURE_FLOAT        (1 << 0)
 #define CPU_FEATURE_FLOAT128     (1 << 1)
@@ -562,6 +562,20 @@ struct ArchCPU {
     CPUSPARCState env;
 };
 
+/**
+ * SPARCCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A SPARC CPU model.
+ */
+struct SPARCCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+    sparc_def_t *cpu_def;
+};
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_sparc_cpu;
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index 2598651008..e35dc1ad2d 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -21,8 +21,6 @@
 #define QEMU_TRICORE_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
-
 
 #define TYPE_TRICORE_CPU "tricore-cpu"
 
@@ -31,12 +29,4 @@ OBJECT_DECLARE_CPU_TYPE(TriCoreCPU, TriCoreCPUClass, TRICORE_CPU)
 #define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
 #define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
 
-struct TriCoreCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
-
 #endif /* QEMU_TRICORE_CPU_QOM_H */
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index c537a33ee8..de3ab53a83 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -68,6 +68,12 @@ struct ArchCPU {
     CPUTriCoreState env;
 };
 
+struct TriCoreCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
 
 hwaddr tricore_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void tricore_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 03873ea50b..d932346b5f 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -30,7 +30,6 @@
 #define QEMU_XTENSA_CPU_QOM_H
 
 #include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TYPE_XTENSA_CPU "xtensa-cpu"
 
@@ -39,24 +38,4 @@ OBJECT_DECLARE_CPU_TYPE(XtensaCPU, XtensaCPUClass, XTENSA_CPU)
 #define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
 #define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
 
-typedef struct XtensaConfig XtensaConfig;
-
-/**
- * XtensaCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- * @config: The CPU core configuration.
- *
- * An Xtensa CPU model.
- */
-struct XtensaCPUClass {
-    CPUClass parent_class;
-
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-
-    const XtensaConfig *config;
-};
-
-
 #endif
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index d6d2fb1f4e..dd81729306 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -426,7 +426,7 @@ extern const XtensaOpcodeTranslators xtensa_core_opcodes;
 extern const XtensaOpcodeTranslators xtensa_fpu2000_opcodes;
 extern const XtensaOpcodeTranslators xtensa_fpu_opcodes;
 
-struct XtensaConfig {
+typedef struct XtensaConfig {
     const char *name;
     uint64_t options;
     XtensaGdbRegmap gdb_regmap;
@@ -489,7 +489,7 @@ struct XtensaConfig {
     const xtensa_mpu_entry *mpu_bg;
 
     bool use_first_nan;
-};
+} XtensaConfig;
 
 typedef struct XtensaConfigList {
     const XtensaConfig *config;
@@ -562,6 +562,22 @@ struct ArchCPU {
     Clock *clock;
 };
 
+/**
+ * XtensaCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ * @config: The CPU core configuration.
+ *
+ * An Xtensa CPU model.
+ */
+struct XtensaCPUClass {
+    CPUClass parent_class;
+
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+
+    const XtensaConfig *config;
+};
 
 #ifndef CONFIG_USER_ONLY
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.41.0


