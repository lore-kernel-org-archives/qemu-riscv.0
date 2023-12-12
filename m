Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C15EC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:36:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1yC-0007kZ-2N; Tue, 12 Dec 2023 07:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1y9-0007iS-AC
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:38 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1y5-0006g6-MI
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:37 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50be3611794so6609992e87.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384469; x=1702989269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzbhv68ZzKweBnjWkRTwSmm/SDs4f1x+mdWf7p/OxfQ=;
 b=do5N7ygwO7lTDVjVqTTlzWdiCcjw6TYYxHlMxuEnmVuTdVPUM5A9KtNzG133Y6HScQ
 hVy+XSyYGC+yvw230KIA4EP85yFBa/TS5LM64oe4fNn++bdVoqXeH4qc4+r5kxrxaKDQ
 Cq1CdGHnpfvNSDtbEFjeW8b2PS3SsakJtoC8lus3Mgp7LYYDKQ722rafshl4mWfKpFgT
 9s81vot4Hi0yEoV3e1uh3cb6tO5Vv9DDR0tyd7JLnuJy/3ZopjKBSTRmBkXLf4BT77cB
 NzfyFOV6G2ZHvxzMs5LdzJ4sUylqEWJaZeXan9IGaxU9bBrfHDpr8o6YA9QgHSZoN2Tf
 yKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384469; x=1702989269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzbhv68ZzKweBnjWkRTwSmm/SDs4f1x+mdWf7p/OxfQ=;
 b=pmMzlduTlmMZcVvAEf9dZT234FPGzuRqruKC7O9ONbP+qGApmgVH2VBBlZL/rv6DrS
 9zB38oTEogU6ReGAivCf7O6g2keGJvDINY4d75fGuMOpCUstvC5upkHHSIei1qu3D3Ti
 4kWjdBLrXNRHTJ76rSHt3WU1N6ji1zmjUrW5j44AOV5UzmQqU0Fc5SVf3H8dgFGhAR0A
 ToJ1jTS/fXKT4xYlcy2YBtueOXhM80zCRy/R8kz1g5Rl487XcWM9EEEsyTllS3fo8tsh
 LbdIkIDyWmTSUnoWjUXEj9+IprAIVcgOOwy0pMG+SWYSesVrqz6USROJZs9XDJQzdWh9
 sPkA==
X-Gm-Message-State: AOJu0Ywg2e48C7GtVzoppVVHYlHXB6zVv2jmMboalzMyrCH2MCT+OJ2F
 37AXv7WxY4hZLKu6qosFKKO3AA==
X-Google-Smtp-Source: AGHT+IEH2dGXihRa4XFLPtgmqzKaF/e0WuyZM68XvEO9tahafoWg3hOEV1ymtHntPjXPNe+A73ySVg==
X-Received: by 2002:a19:4f0a:0:b0:50d:bac:6634 with SMTP id
 d10-20020a194f0a000000b0050d0bac6634mr2378854lfb.67.1702384469407; 
 Tue, 12 Dec 2023 04:34:29 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 fj17-20020a1709069c9100b00a1e4cae6b22sm6156184ejc.41.2023.12.12.04.34.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:34:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 03/23] target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
Date: Tue, 12 Dec 2023 13:33:39 +0100
Message-ID: <20231212123401.37493-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
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

accel/tcg/ files requires the following definitions:

  - TARGET_LONG_BITS
  - TARGET_PAGE_BITS
  - TARGET_PHYS_ADDR_SPACE_BITS
  - TCG_GUEST_DEFAULT_MO

The first 3 are defined in "cpu-param.h". The last one
in "cpu.h", with a bunch of definitions irrelevant for
TCG. By moving the TCG_GUEST_DEFAULT_MO definition to
"cpu-param.h", we can simplify various accel/tcg includes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu-param.h      |  3 +++
 target/alpha/cpu.h            |  3 ---
 target/arm/cpu-param.h        |  8 +++++---
 target/arm/cpu.h              |  3 ---
 target/avr/cpu-param.h        |  2 ++
 target/avr/cpu.h              |  2 --
 target/hppa/cpu-param.h       |  8 ++++++++
 target/hppa/cpu.h             |  6 ------
 target/i386/cpu-param.h       |  3 +++
 target/i386/cpu.h             |  3 ---
 target/loongarch/cpu-param.h  |  2 ++
 target/loongarch/cpu.h        |  2 --
 target/microblaze/cpu-param.h |  3 +++
 target/microblaze/cpu.h       |  3 ---
 target/mips/cpu-param.h       |  2 ++
 target/mips/cpu.h             |  2 --
 target/openrisc/cpu-param.h   |  2 ++
 target/openrisc/cpu.h         |  2 --
 target/ppc/cpu-param.h        |  2 ++
 target/ppc/cpu.h              |  2 --
 target/riscv/cpu-param.h      |  2 ++
 target/riscv/cpu.h            |  2 --
 target/s390x/cpu-param.h      |  6 ++++++
 target/s390x/cpu.h            |  3 ---
 target/sparc/cpu-param.h      | 23 +++++++++++++++++++++++
 target/sparc/cpu.h            | 23 -----------------------
 target/xtensa/cpu-param.h     |  3 +++
 target/xtensa/cpu.h           |  3 ---
 28 files changed, 66 insertions(+), 62 deletions(-)

diff --git a/target/alpha/cpu-param.h b/target/alpha/cpu-param.h
index 68c46f7998..419e454702 100644
--- a/target/alpha/cpu-param.h
+++ b/target/alpha/cpu-param.h
@@ -15,4 +15,7 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS  44
 #define TARGET_VIRT_ADDR_SPACE_BITS  (30 + TARGET_PAGE_BITS)
 
+/* Alpha processors have a weak memory model */
+#define TCG_GUEST_DEFAULT_MO      (0)
+
 #endif
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d672e911dd..5d9aa09ed9 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -24,9 +24,6 @@
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
 
-/* Alpha processors have a weak memory model */
-#define TCG_GUEST_DEFAULT_MO      (0)
-
 #define ICACHE_LINE_SIZE 32
 #define DCACHE_LINE_SIZE 32
 
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index f9b462a98f..59a5f9e480 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -23,14 +23,16 @@
 # ifdef TARGET_AARCH64
 #  define TARGET_TAGGED_ADDRESSES
 # endif
-#else
+#else /* !CONFIG_USER_ONLY */
 /*
  * ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
  * have to support 1K tiny pages.
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
-
-#endif
+#endif /* !CONFIG_USER_ONLY */
+
+/* ARM processors have a weak memory model */
+#define TCG_GUEST_DEFAULT_MO      (0)
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0282e0d28..ea5c8660dc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -27,9 +27,6 @@
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
 
-/* ARM processors have a weak memory model */
-#define TCG_GUEST_DEFAULT_MO      (0)
-
 #ifdef TARGET_AARCH64
 #define KVM_HAVE_MCE_INJECTION 1
 #endif
diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
index 9a92bc74fc..93c2f470d0 100644
--- a/target/avr/cpu-param.h
+++ b/target/avr/cpu-param.h
@@ -32,4 +32,6 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 24
 #define TARGET_VIRT_ADDR_SPACE_BITS 24
 
+#define TCG_GUEST_DEFAULT_MO 0
+
 #endif
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 7960c5c57a..02a787b4f3 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -30,8 +30,6 @@
 
 #define CPU_RESOLVING_TYPE TYPE_AVR_CPU
 
-#define TCG_GUEST_DEFAULT_MO 0
-
 /*
  * AVR has two memory spaces, data & code.
  * e.g. both have 0 address
diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
index bb3d7ef6f7..473d489f01 100644
--- a/target/hppa/cpu-param.h
+++ b/target/hppa/cpu-param.h
@@ -21,4 +21,12 @@
 
 #define TARGET_PAGE_BITS 12
 
+/* PA-RISC 1.x processors have a strong memory model.  */
+/*
+ * ??? While we do not yet implement PA-RISC 2.0, those processors have
+ * a weak memory model, but with TLB bits that force ordering on a per-page
+ * basis.  It's probably easier to fall back to a strong memory model.
+ */
+#define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
+
 #endif
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 8be45c69c9..6b10ab20ba 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -25,12 +25,6 @@
 #include "qemu/cpu-float.h"
 #include "qemu/interval-tree.h"
 
-/* PA-RISC 1.x processors have a strong memory model.  */
-/* ??? While we do not yet implement PA-RISC 2.0, those processors have
-   a weak memory model, but with TLB bits that force ordering on a per-page
-   basis.  It's probably easier to fall back to a strong memory model.  */
-#define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
-
 #define MMU_ABS_W_IDX     6
 #define MMU_ABS_IDX       7
 #define MMU_KERNEL_IDX    8
diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 911b4cd51b..5e15335203 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -24,4 +24,7 @@
 #endif
 #define TARGET_PAGE_BITS 12
 
+/* The x86 has a strong memory model with some store-after-load re-ordering */
+#define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
+
 #endif
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index cd2e295bd6..852adf35db 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -30,9 +30,6 @@
 
 #define XEN_NR_VIRQS 24
 
-/* The x86 has a strong memory model with some store-after-load re-ordering */
-#define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
-
 #define KVM_HAVE_MCE_INJECTION 1
 
 /* support for self modifying code even if the modified instruction is
diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
index cfe195db4e..db5ad1c69f 100644
--- a/target/loongarch/cpu-param.h
+++ b/target/loongarch/cpu-param.h
@@ -14,4 +14,6 @@
 
 #define TARGET_PAGE_BITS 12
 
+#define TCG_GUEST_DEFAULT_MO (0)
+
 #endif
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 00d1fba597..dd1ab75ce9 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -39,8 +39,6 @@
 
 #define IOCSR_MEM_SIZE          0x428
 
-#define TCG_GUEST_DEFAULT_MO (0)
-
 #define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
 #define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
 #define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
diff --git a/target/microblaze/cpu-param.h b/target/microblaze/cpu-param.h
index 9770b0eb52..e530fead1c 100644
--- a/target/microblaze/cpu-param.h
+++ b/target/microblaze/cpu-param.h
@@ -29,4 +29,7 @@
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
 
+/* MicroBlaze is always in-order. */
+#define TCG_GUEST_DEFAULT_MO  TCG_MO_ALL
+
 #endif
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index b5374365f5..943bae67d1 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -24,9 +24,6 @@
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
 
-/* MicroBlaze is always in-order. */
-#define TCG_GUEST_DEFAULT_MO  TCG_MO_ALL
-
 typedef struct CPUArchState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
 #include "mmu.h"
diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index 594c91a156..6f6ac1688f 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -30,4 +30,6 @@
 #define TARGET_PAGE_BITS_MIN 12
 #endif
 
+#define TCG_GUEST_DEFAULT_MO (0)
+
 #endif
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 52f13f0363..620db820f8 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -10,8 +10,6 @@
 #include "hw/clock.h"
 #include "mips-defs.h"
 
-#define TCG_GUEST_DEFAULT_MO (0)
-
 typedef struct CPUMIPSTLBContext CPUMIPSTLBContext;
 
 /* MSA Context */
diff --git a/target/openrisc/cpu-param.h b/target/openrisc/cpu-param.h
index 3f08207485..fbfc0f568b 100644
--- a/target/openrisc/cpu-param.h
+++ b/target/openrisc/cpu-param.h
@@ -13,4 +13,6 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
+#define TCG_GUEST_DEFAULT_MO (0)
+
 #endif
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index dedeb89f8e..e757e84caf 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -24,8 +24,6 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 
-#define TCG_GUEST_DEFAULT_MO (0)
-
 /**
  * OpenRISCCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/ppc/cpu-param.h b/target/ppc/cpu-param.h
index 0a0416e0a8..c5565beae2 100644
--- a/target/ppc/cpu-param.h
+++ b/target/ppc/cpu-param.h
@@ -33,4 +33,6 @@
 #endif
 #define TARGET_PAGE_BITS 12
 
+#define TCG_GUEST_DEFAULT_MO 0
+
 #endif
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f8101ffa29..f21d8de6ff 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -29,8 +29,6 @@
 
 #define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
 
-#define TCG_GUEST_DEFAULT_MO 0
-
 #define TARGET_PAGE_BITS_64K 16
 #define TARGET_PAGE_BITS_16M 24
 
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index b2a9396dec..1fbd64939d 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -28,4 +28,6 @@
  *  - M mode HLV/HLVX/HSV 0b111
  */
 
+#define TCG_GUEST_DEFAULT_MO 0
+
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d74b361be6..01cddf5180 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -42,8 +42,6 @@ typedef struct CPUArchState CPURISCVState;
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
 #endif
 
-#define TCG_GUEST_DEFAULT_MO 0
-
 /*
  * RISC-V-specific extra insn start words:
  * 1: Original instruction opcode
diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index 84ca08626b..11d23b600d 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -13,4 +13,10 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 64
 #define TARGET_VIRT_ADDR_SPACE_BITS 64
 
+/*
+ * The z/Architecture has a strong memory model with some
+ * store-after-load re-ordering.
+ */
+#define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
+
 #endif
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index fa3aac4f97..10a63821b5 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -33,9 +33,6 @@
 
 #define ELF_MACHINE_UNAME "S390X"
 
-/* The z/Architecture has a strong memory model with some store-after-load re-ordering */
-#define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
-
 #define TARGET_HAS_PRECISE_SMC
 
 #define TARGET_INSN_START_EXTRA_WORDS 2
diff --git a/target/sparc/cpu-param.h b/target/sparc/cpu-param.h
index cb11980404..82293fb844 100644
--- a/target/sparc/cpu-param.h
+++ b/target/sparc/cpu-param.h
@@ -23,4 +23,27 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 
+/*
+ * From Oracle SPARC Architecture 2015:
+ *
+ *   Compatibility notes: The PSO memory model described in SPARC V8 and
+ *   SPARC V9 compatibility architecture specifications was never implemented
+ *   in a SPARC V9 implementation and is not included in the Oracle SPARC
+ *   Architecture specification.
+ *
+ *   The RMO memory model described in the SPARC V9 specification was
+ *   implemented in some non-Sun SPARC V9 implementations, but is not
+ *   directly supported in Oracle SPARC Architecture 2015 implementations.
+ *
+ * Therefore always use TSO in QEMU.
+ *
+ * D.5 Specification of Partial Store Order (PSO)
+ *   ... [loads] are followed by an implied MEMBAR #LoadLoad | #LoadStore.
+ *
+ * D.6 Specification of Total Store Order (TSO)
+ *   ... PSO with the additional requirement that all [stores] are followed
+ *   by an implied MEMBAR #StoreStore.
+ */
+#define TCG_GUEST_DEFAULT_MO  (TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST)
+
 #endif
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 6999a10a40..10b04d37c6 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -6,29 +6,6 @@
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
 
-/*
- * From Oracle SPARC Architecture 2015:
- *
- *   Compatibility notes: The PSO memory model described in SPARC V8 and
- *   SPARC V9 compatibility architecture specifications was never implemented
- *   in a SPARC V9 implementation and is not included in the Oracle SPARC
- *   Architecture specification.
- *
- *   The RMO memory model described in the SPARC V9 specification was
- *   implemented in some non-Sun SPARC V9 implementations, but is not
- *   directly supported in Oracle SPARC Architecture 2015 implementations.
- *
- * Therefore always use TSO in QEMU.
- *
- * D.5 Specification of Partial Store Order (PSO)
- *   ... [loads] are followed by an implied MEMBAR #LoadLoad | #LoadStore.
- *
- * D.6 Specification of Total Store Order (TSO)
- *   ... PSO with the additional requirement that all [stores] are followed
- *   by an implied MEMBAR #StoreStore.
- */
-#define TCG_GUEST_DEFAULT_MO  (TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST)
-
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
 #else
diff --git a/target/xtensa/cpu-param.h b/target/xtensa/cpu-param.h
index b1da0555de..0000725f2f 100644
--- a/target/xtensa/cpu-param.h
+++ b/target/xtensa/cpu-param.h
@@ -17,4 +17,7 @@
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 
+/* Xtensa processors have a weak memory model */
+#define TCG_GUEST_DEFAULT_MO      (0)
+
 #endif
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 8a423706d8..ca32657041 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -34,9 +34,6 @@
 #include "hw/clock.h"
 #include "xtensa-isa.h"
 
-/* Xtensa processors have a weak memory model */
-#define TCG_GUEST_DEFAULT_MO      (0)
-
 enum {
     /* Additional instructions */
     XTENSA_OPTION_CODE_DENSITY,
-- 
2.41.0


