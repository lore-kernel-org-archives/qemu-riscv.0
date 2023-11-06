Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1CFC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:14:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxPW-0007Di-E7; Mon, 06 Nov 2023 06:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxPS-00072c-1O
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxPK-0003pk-9O
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso2599437f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268676; x=1699873476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5exP2PnN1x4Gjh5C/d3tcoOclvUbJ8KnxJFGqP8eGFA=;
 b=XOwRP2YRURQBCArcTo7ttyE0cqMo9FMIfbjJARGl+c43djQuH+8X358IbQMd3LMprf
 HAUWr97tCGAV+lDu+hm8qbYuBjd+ctOKP4M97S3mTzBm0AaJzObqMnPM1opt3C2e2gzz
 D8E2UHlEn0glLARx7dWIcPfu5Khkdwp0WrzgreDnQs9jIRmgp+TMHhH3QmpnrXRlCm/X
 3V4NwgVWKjvNIVQp3Zbf4gicp/Jcun1DIdaiu83To19hSN+zBRv3EAaNzSV1G1yNIgli
 pLihECqCd0S8JIYSayxTf66xorXg8GP9OP9BfbVEmdJ4IRttRwaZ2ROa3byGT9b0rGr8
 fwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268676; x=1699873476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5exP2PnN1x4Gjh5C/d3tcoOclvUbJ8KnxJFGqP8eGFA=;
 b=VLS/sDMZVds84RkonhyRjCR2gWSVBo6ZpxhfbiDz1HT0VcVxljXAkEwdWNf5TcvQGs
 W19cbTaHIbrNuxG0xAdzp34h07rcT7NchPYYmByGAWrwfxdk/SZvyDe1XS7+ugN6zGu8
 1LaE4xjq+C49g2pco4skvzT7qgBlpmJrhAq1ZO6mfyMhnuH4h02UyqmOKEfeRIQLqs4H
 JbVsnOXJEVgo1wC7YIZE3S7NCzMsmvbDKumTu5ZxL6AZhZWraOht8/oQjwL9U0lUoN4W
 csIANQDIX8FG6CWjBNtUhkwranLJ9gFPSGsSYPOXyIhusovA+eRRd84+eUlsSBZtnbn6
 evOA==
X-Gm-Message-State: AOJu0YzRpYqJMsdDg4YMzvfbQdqDhBxMoC3E5u0fxFPNuUS5aG25L1ua
 fHhDxGZWuBBv3yf8/dKFHbCUhA==
X-Google-Smtp-Source: AGHT+IFBVT/Gojs6LXLFwf6yzKXBVTiT6H6oSpXIbb3ONqzrM6zgUqAETF1GAh2U4mDSLHTJ2M0bhA==
X-Received: by 2002:a05:6000:1ace:b0:32f:908e:c7de with SMTP id
 i14-20020a0560001ace00b0032f908ec7demr16575818wry.57.1699268676473; 
 Mon, 06 Nov 2023 03:04:36 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adfe949000000b003253523d767sm120250wrn.109.2023.11.06.03.04.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:04:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 08/60] target: Unify QOM style
Date: Mon,  6 Nov 2023 12:02:40 +0100
Message-ID: <20231106110336.358-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

Enforce the style described by commit 067109a11c ("docs/devel:
mention the spacing requirement for QOM"):

  The first declaration of a storage or class structure should
  always be the parent and leave a visual space between that
  declaration and the new code. It is also useful to separate
  backing for properties (options driven by the user) and internal
  state to make navigation easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231013140116.255-2-philmd@linaro.org>
---
 target/alpha/cpu-qom.h      | 2 --
 target/alpha/cpu.h          | 2 --
 target/arm/cpu-qom.h        | 4 ----
 target/arm/cpu.h            | 2 --
 target/avr/cpu-qom.h        | 3 +--
 target/avr/cpu.h            | 2 --
 target/cris/cpu-qom.h       | 2 --
 target/cris/cpu.h           | 2 --
 target/hexagon/cpu.h        | 5 +----
 target/hppa/cpu-qom.h       | 2 --
 target/hppa/cpu.h           | 2 --
 target/i386/cpu-qom.h       | 2 --
 target/i386/cpu.h           | 2 --
 target/loongarch/cpu.h      | 4 ----
 target/m68k/cpu-qom.h       | 2 --
 target/m68k/cpu.h           | 2 --
 target/microblaze/cpu-qom.h | 2 --
 target/microblaze/cpu.h     | 2 --
 target/mips/cpu-qom.h       | 2 --
 target/mips/cpu.h           | 2 --
 target/nios2/cpu.h          | 4 ----
 target/openrisc/cpu.h       | 4 ----
 target/ppc/cpu.h            | 2 --
 target/riscv/cpu-qom.h      | 3 +--
 target/riscv/cpu.h          | 2 --
 target/rx/cpu-qom.h         | 2 --
 target/rx/cpu.h             | 2 --
 target/s390x/cpu-qom.h      | 3 +--
 target/s390x/cpu.h          | 2 --
 target/sh4/cpu-qom.h        | 2 --
 target/sh4/cpu.h            | 2 --
 target/sparc/cpu-qom.h      | 2 --
 target/sparc/cpu.h          | 2 --
 target/tricore/cpu-qom.h    | 2 --
 target/tricore/cpu.h        | 2 --
 target/xtensa/cpu-qom.h     | 2 --
 target/xtensa/cpu.h         | 2 --
 37 files changed, 4 insertions(+), 84 deletions(-)

diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index 1f200724b6..c5fbd8f11a 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -35,9 +35,7 @@ OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
  * An Alpha CPU model.
  */
 struct AlphaCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index e2a467ec17..c8d97ac27a 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -259,9 +259,7 @@ typedef struct CPUArchState {
  * An Alpha CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUAlphaState env;
 
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index d06c08a734..153865d1bb 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -46,9 +46,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
  * An ARM CPU model.
  */
 struct ARMCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
@@ -62,9 +60,7 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
                        TYPE_AARCH64_CPU)
 
 struct AArch64CPUClass {
-    /*< private >*/
     ARMCPUClass parent_class;
-    /*< public >*/
 };
 
 void register_cp_regs_for_features(ARMCPU *cpu);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d51dfe48db..2f7ab22169 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -852,9 +852,7 @@ typedef struct {
  * An ARM CPU core.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUARMState env;
 
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 01ea5f160b..d89be01e0f 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -36,9 +36,8 @@ OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
  *  A AVR CPU model.
  */
 struct AVRCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
+
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 };
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 4ce22d8e4f..f8b065ed79 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -144,9 +144,7 @@ typedef struct CPUArchState {
  *  A AVR CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUAVRState env;
 };
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index 431a1d536a..c2fee242f4 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -36,9 +36,7 @@ OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
  * A CRIS CPU model.
  */
 struct CRISCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 676b8e93ca..6aa445348f 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -174,9 +174,7 @@ typedef struct CPUArchState {
  * A CRIS CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUCRISState env;
 };
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 10cd1efd57..035ac4fb6d 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -130,17 +130,14 @@ typedef struct CPUArchState {
 OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
 
 typedef struct HexagonCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
+
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 } HexagonCPUClass;
 
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUHexagonState env;
 
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index b96e0318c7..67f12422c4 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -35,9 +35,7 @@ OBJECT_DECLARE_CPU_TYPE(HPPACPU, HPPACPUClass, HPPA_CPU)
  * An HPPA CPU model.
  */
 struct HPPACPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 798d0c26d7..518ea94f4f 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -233,9 +233,7 @@ typedef struct CPUArchState {
  * An HPPA CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUHPPAState env;
     QEMUTimer *alarm_timer;
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 2350f4ae60..58145717ef 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -47,9 +47,7 @@ typedef struct X86CPUModel X86CPUModel;
  * An x86 CPU model or family.
  */
 struct X86CPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     /* CPU definition, automatically loaded by instance_init if not NULL.
      * Should be eventually replaced by subclass-specific property defaults.
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 471e71dbc5..096f85483e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1897,9 +1897,7 @@ struct kvm_msrs;
  * An x86 CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUX86State env;
     VMChangeStateEntry *vmsentry;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 8b54cf109c..8f0e9f0182 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -371,9 +371,7 @@ typedef struct CPUArchState {
  * A LoongArch CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPULoongArchState env;
     QEMUTimer timer;
@@ -398,9 +396,7 @@ OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
  * A LoongArch CPU model.
  */
 struct LoongArchCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 0ec7750a92..13d94c9fe3 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -35,9 +35,7 @@ OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
  * A Motorola 68k CPU model.
  */
 struct M68kCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 20afb0c94d..9ea18028ad 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -164,9 +164,7 @@ typedef struct CPUArchState {
  * A Motorola 68k CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUM68KState env;
 };
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index cda9220fa9..2a734e644d 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -35,9 +35,7 @@ OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
  * A MicroBlaze CPU model.
  */
 struct MicroBlazeCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e43c49d4af..e8000237d8 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -343,9 +343,7 @@ typedef struct {
  * A MicroBlaze CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUMBState env;
 
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 0dffab453b..c70b4a34be 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -39,9 +39,7 @@ OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
  * A MIPS CPU model.
  */
 struct MIPSCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5fddceff3a..617c373797 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1209,9 +1209,7 @@ typedef struct CPUArchState {
  * A MIPS CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUMIPSState env;
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 70b6377a4f..ede1ba2140 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -42,9 +42,7 @@ OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
  * A Nios2 CPU model.
  */
 struct Nios2CPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
@@ -214,9 +212,7 @@ typedef struct {
  * A Nios2 CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUNios2State env;
 
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 334997e9a1..29cda7279c 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -39,9 +39,7 @@ OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
  * A OpenRISC CPU model.
  */
 struct OpenRISCCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
@@ -301,9 +299,7 @@ typedef struct CPUArchState {
  * A OpenRISC CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUOpenRISCState env;
 };
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 30392ebeee..24dd6b1b0a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1313,9 +1313,7 @@ typedef struct PPCVirtualHypervisorClass PPCVirtualHypervisorClass;
  * A PowerPC CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUPPCState env;
 
diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index f3fbe37a2c..b9164a8e5b 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -63,9 +63,8 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
  * A RISCV CPU model.
  */
 struct RISCVCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
+
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f8ffa5ee38..f0dc257a75 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -389,9 +389,7 @@ struct CPUArchState {
  * A RISCV CPU.
  */
 struct ArchCPU {
-    /* < private > */
     CPUState parent_obj;
-    /* < public > */
 
     CPURISCVState env;
 
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index 1c8466a187..f4cd5664e5 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -36,9 +36,7 @@ OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
  * A RX CPU model.
  */
 struct RXCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index f66754eb8a..8379f4a150 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -107,9 +107,7 @@ typedef struct CPUArchState {
  * A RX CPU
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPURXState env;
 };
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 00cae2b131..1088965fd5 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -49,9 +49,8 @@ typedef enum cpu_reset_type {
  * An S/390 CPU model.
  */
 struct S390CPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
+
     const S390CPUDef *cpu_def;
     bool kvm_required;
     bool is_static;
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 40c5cedd0e..4f366f9e4e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -172,9 +172,7 @@ static inline uint64_t *get_freg(CPUS390XState *cs, int nr)
  * An S/390 CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUS390XState env;
     S390CPUModel *model;
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 89785a90f0..08fbebc996 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -42,9 +42,7 @@ OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
  * A SuperH CPU model.
  */
 struct SuperHCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index f75a235973..dc0561b73b 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -204,9 +204,7 @@ typedef struct CPUArchState {
  * A SuperH CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUSH4State env;
 };
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index 78bf00b9a2..b4a0db84ce 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -40,9 +40,7 @@ typedef struct sparc_def_t sparc_def_t;
  * A SPARC CPU model.
  */
 struct SPARCCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 758a4e8aaa..84a030e406 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -569,9 +569,7 @@ struct CPUArchState {
  * A SPARC CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUSPARCState env;
 };
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index 612731daa0..b3b6c75a3a 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -27,9 +27,7 @@
 OBJECT_DECLARE_CPU_TYPE(TriCoreCPU, TriCoreCPUClass, TRICORE_CPU)
 
 struct TriCoreCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index a357b573f2..b4a6ab141d 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -63,9 +63,7 @@ typedef struct CPUArchState {
  * A TriCore CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUTriCoreState env;
 };
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 419c7d8e4a..424bcbd8dd 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -47,9 +47,7 @@ typedef struct XtensaConfig XtensaConfig;
  * An Xtensa CPU model.
  */
 struct XtensaCPUClass {
-    /*< private >*/
     CPUClass parent_class;
-    /*< public >*/
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index c6bbef1e5d..85aab1bdf8 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -556,9 +556,7 @@ struct CPUArchState {
  * An Xtensa CPU.
  */
 struct ArchCPU {
-    /*< private >*/
     CPUState parent_obj;
-    /*< public >*/
 
     CPUXtensaState env;
     Clock *clock;
-- 
2.41.0


