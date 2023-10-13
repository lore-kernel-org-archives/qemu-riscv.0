Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F21CDB483
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:05:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImQ-0004Dw-4K; Fri, 13 Oct 2023 10:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkI-0007Qz-Pr
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:37 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkB-0002JG-32
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:02:27 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so3298156a12.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205741; x=1697810541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9eu+dYuqEAuyUfcja/Rp4G880IWvzHYCzxEd3S6+NQ=;
 b=N5HQUzG2wWqtckjz7CLDWXq9XhC5v26xJpFc5wU7mywdYcs5sle1+yoE04EpmA2dry
 RjTF33XrgyV8t4naAHySbuxZPchIeuvIvdt85pag5LiJchhH3i0+NFVfubLN0gKw0LkT
 4Vz5bhDnFATsMtsd7yFVfoFFiVx0iIJ7E74BYVO9L4ARAVOndY0c/FLh/Y5MesR1yodE
 gG+g+AwaCftEVuFmVQ7VbT2sL+u1H7AbMacPt4l7NxWZXdKRpjWkpopoJCJHD5SvJK5J
 jjy2WKbBlUVYhkNTMyi9u3RQXyRUcEw0kwR12hKv/TIpjNwWrORRIrj61ixWGD2JMivN
 KnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205741; x=1697810541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9eu+dYuqEAuyUfcja/Rp4G880IWvzHYCzxEd3S6+NQ=;
 b=n55tMUNXCkerGTs6WCeYSw9IS95Ju0YUNxiyKnEjvWIE7672UwQeidQjJ7B2+m1iNb
 fey1tuhFl2lplvkZ+TszNYFfsby4kUwtC+T4Rpn7BcA7N/CfJ3ra6ih4h4dUpfa2hlfm
 ycxBBnq1I4RhJZsyViSh/ikexK9f2Lf4QBwbzwUbd9MRbDpT4I8N52j4z4coWG60FDEK
 kC8eTVC2r6yrWKvsDCe5ZzmE8p3V2cL1JAPCUws4c1L8nAU00PIZ7F/OyLrogdg+Yh8t
 6hlBxtMhn/barBCTGTa2bjF9W8BpJ9nsLsym3LgZHdoJbMRq1Rt9UqaMTELlgScqd1YJ
 siDg==
X-Gm-Message-State: AOJu0YwZEDcAekXFwkjiDKvj0rfi+omQUiD/zho51akk/clUhXHF35Ri
 JUYyVBLfOFUS/bLIXOSEfIjc1w==
X-Google-Smtp-Source: AGHT+IEL2eQX1yArv7xIgtrCpMqzwkTgXtYCuOGsCtjluMJmW/H2CFejC9aMs875GwWsNKZB5WrBJw==
X-Received: by 2002:a50:c8cd:0:b0:53e:21f6:d784 with SMTP id
 k13-20020a50c8cd000000b0053e21f6d784mr3394709edh.8.1697205740721; 
 Fri, 13 Oct 2023 07:02:20 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05640210d600b00530a9488623sm11526147edu.46.2023.10.13.07.02.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:20 -0700 (PDT)
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
Subject: [PATCH v2 06/16] target: Declare FOO_CPU_TYPE_NAME/SUFFIX in
 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:05 +0200
Message-ID: <20231013140116.255-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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

Hegerogeneous code needs access to the FOO_CPU_TYPE_NAME()
macro to resolve target CPU types. Move the declaration
(along with the required FOO_CPU_TYPE_SUFFIX) to "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu-qom.h   | 5 ++++-
 target/alpha/cpu.h       | 2 --
 target/avr/cpu-qom.h     | 5 ++++-
 target/avr/cpu.h         | 2 --
 target/cris/cpu-qom.h    | 5 ++++-
 target/cris/cpu.h        | 2 --
 target/i386/cpu-qom.h    | 3 +++
 target/i386/cpu.h        | 2 --
 target/m68k/cpu-qom.h    | 5 ++++-
 target/m68k/cpu.h        | 2 --
 target/mips/cpu-qom.h    | 3 +++
 target/mips/cpu.h        | 2 --
 target/rx/cpu-qom.h      | 5 ++++-
 target/rx/cpu.h          | 2 --
 target/s390x/cpu-qom.h   | 5 ++++-
 target/s390x/cpu.h       | 2 --
 target/sh4/cpu-qom.h     | 5 ++++-
 target/sh4/cpu.h         | 2 --
 target/sparc/cpu-qom.h   | 5 ++++-
 target/sparc/cpu.h       | 2 --
 target/tricore/cpu-qom.h | 5 +++++
 target/tricore/cpu.h     | 2 --
 target/xtensa/cpu-qom.h  | 5 ++++-
 target/xtensa/cpu.h      | 2 --
 24 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index c5fbd8f11a..c4a4523993 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU Alpha CPU
+ * QEMU Alpha CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -27,6 +27,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
 
+#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
+#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
+
 /**
  * AlphaCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index c8d97ac27a..3bff56c565 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -426,8 +426,6 @@ enum {
 
 void alpha_translate_init(void);
 
-#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
-#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(void);
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index d89be01e0f..75590cdd97 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU AVR CPU
+ * QEMU AVR CPU QOM header (target agnostic)
  *
  * Copyright (c) 2016-2020 Michael Rolnik
  *
@@ -28,6 +28,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
 
+#define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
+#define AVR_CPU_TYPE_NAME(name) (name AVR_CPU_TYPE_SUFFIX)
+
 /**
  *  AVRCPUClass:
  *  @parent_realize: The parent class' realize handler.
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index f8b065ed79..0487399cb2 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -28,8 +28,6 @@
 #error "AVR 8-bit does not support user mode"
 #endif
 
-#define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
-#define AVR_CPU_TYPE_NAME(name) (name AVR_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_AVR_CPU
 
 #define TCG_GUEST_DEFAULT_MO 0
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index c2fee242f4..d7e5f33e62 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU CRIS CPU
+ * QEMU CRIS CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -27,6 +27,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
 
+#define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
+#define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
+
 /**
  * CRISCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 6aa445348f..b821bb7983 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -240,8 +240,6 @@ enum {
 /* CRIS uses 8k pages.  */
 #define MMAP_SHIFT TARGET_PAGE_BITS
 
-#define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
-#define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
 
 /* MMU modes definitions */
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 58145717ef..dffc74c1ce 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -32,6 +32,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
 
+#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
+#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
+
 typedef struct X86CPUModel X86CPUModel;
 
 /**
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index a600468698..2dea4df086 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2239,8 +2239,6 @@ void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7);
 /* hw/pc.c */
 uint64_t cpu_get_tsc(CPUX86State *env);
 
-#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
-#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_X86_CPU
 
 #ifdef TARGET_X86_64
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 13d94c9fe3..df0cc8b7a3 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU Motorola 68k CPU
+ * QEMU Motorola 68k CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -27,6 +27,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 
+#define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
+#define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
+
 /*
  * M68kCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 9ea18028ad..7f34686a6f 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -561,8 +561,6 @@ enum {
     ACCESS_DATA  = 0x20, /* Data load/store access        */
 };
 
-#define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
-#define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
 
 #define cpu_list m68k_cpu_list
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index c70b4a34be..5822dfb1d2 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -31,6 +31,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
 
+#define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
+#define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
+
 /**
  * MIPSCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 617c373797..12cc1bfafd 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1301,8 +1301,6 @@ enum {
  */
 #define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
 
-#define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
-#define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
 
 bool cpu_type_supports_cps_smp(const char *cpu_type);
diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
index f4cd5664e5..6213d877f7 100644
--- a/target/rx/cpu-qom.h
+++ b/target/rx/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * RX CPU
+ * QEMU RX CPU QOM header (target agnostic)
  *
  * Copyright (c) 2019 Yoshinori Sato
  *
@@ -28,6 +28,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(RXCPU, RXCPUClass, RX_CPU)
 
+#define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
+#define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
+
 /*
  * RXCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 8379f4a150..c81613770c 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -112,8 +112,6 @@ struct ArchCPU {
     CPURXState env;
 };
 
-#define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
-#define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 const char *rx_crname(uint8_t cr);
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 1088965fd5..fcd70daddf 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU S/390 CPU
+ * QEMU S/390 CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -27,6 +27,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 
+#define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
+#define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
+
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
 
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index e56982dd69..988e2954a4 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -808,8 +808,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
 
 
 /* helper.c */
-#define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
-#define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_S390_CPU
 
 /* interrupt.c */
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 08fbebc996..bd0ef49fa1 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU SuperH CPU
+ * QEMU SuperH CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -31,6 +31,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(SuperHCPU, SuperHCPUClass, SUPERH_CPU)
 
+#define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
+#define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
+
 /**
  * SuperHCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index dc0561b73b..dbe00e29c2 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -250,8 +250,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr);
 
 void cpu_load_tlb(CPUSH4State * env);
 
-#define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
-#define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
 
 #define cpu_list sh4_cpu_list
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index b4a0db84ce..aca29415b4 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU SPARC CPU
+ * QEMU SPARC CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -31,6 +31,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
 
+#define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
+#define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
+
 typedef struct sparc_def_t sparc_def_t;
 /**
  * SPARCCPUClass:
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 691287f134..31772c9b73 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -648,8 +648,6 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 #endif
 
-#define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
-#define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
 
 #define cpu_list sparc_cpu_list
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index b3b6c75a3a..2598651008 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -1,4 +1,6 @@
 /*
+ * QEMU TriCore CPU QOM header (target agnostic)
+ *
  *  Copyright (c) 2012-2014 Bastian Koppelmann C-Lab/University Paderborn
  *
  * This library is free software; you can redistribute it and/or
@@ -26,6 +28,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(TriCoreCPU, TriCoreCPUClass, TRICORE_CPU)
 
+#define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
+#define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
+
 struct TriCoreCPUClass {
     CPUClass parent_class;
 
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index b4a6ab141d..c537a33ee8 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -268,8 +268,6 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, vaddr *pc,
     *flags = new_flags;
 }
 
-#define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
-#define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_TRICORE_CPU
 
 /* helpers.c */
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 424bcbd8dd..03873ea50b 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU Xtensa CPU
+ * QEMU Xtensa CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  * All rights reserved.
@@ -36,6 +36,9 @@
 
 OBJECT_DECLARE_CPU_TYPE(XtensaCPU, XtensaCPUClass, XTENSA_CPU)
 
+#define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
+#define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
+
 typedef struct XtensaConfig XtensaConfig;
 
 /**
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 85aab1bdf8..d6d2fb1f4e 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -586,8 +586,6 @@ G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 
 #define cpu_list xtensa_cpu_list
 
-#define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
-#define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
 
 #if TARGET_BIG_ENDIAN
-- 
2.41.0


