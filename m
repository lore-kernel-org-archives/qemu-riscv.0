Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D67CD37B6
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 08:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qhQGY-0003ST-1q; Sat, 16 Sep 2023 04:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qhQGW-0003Q7-Ss
 for qemu-riscv@nongnu.org; Sat, 16 Sep 2023 04:02:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qhQGT-00066K-44
 for qemu-riscv@nongnu.org; Sat, 16 Sep 2023 04:02:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68fb2e9ebcdso2372983b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 16 Sep 2023 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694851372; x=1695456172;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEoFSfA0E+eFy/GOPRnOuEzTUNwGcfOXWig+xDARntI=;
 b=Ydbc+mhPs7QM/yNHSDZDufJxmxzqH58rrZ98yJd2UhVBIBT313m7NrAJsjvYaf7SU7
 +3EUsl4nJ5T8hbUPxXD6CiwWB09Lu2cqmacK2WVV4iW8eE3ntmsaqiN3h8SxiNBTtyz2
 b+CwbasFn+x2UUuXj4g9ikVxTGHAuTNtepxL3JX/a2v3OyuLrkyx4CyzCxIkSZT9T4Xn
 oZUEWuRYEotqMX41yJLMcQdDAPwVrSQy0iEyc3QsSbSueIcsKU6vJLzUGS6jW4xNfiEt
 dQxqfTXhHWk2w0YLP9Js/SL/g929KlJdInJJw5EPSBxIDLWeH1ttEdo/HMScyVyBFOO1
 0myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694851372; x=1695456172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEoFSfA0E+eFy/GOPRnOuEzTUNwGcfOXWig+xDARntI=;
 b=uTrFrCAtSsTeMHI2Fp4lAx8NasvwjseDLrjZu7hxoJ9njelW9QRsr0/M7hP+jH1vaz
 S0GDLhmQvNwFuSeGNz0UomI/6V2jZcqHfWdO4v4B0x5OW5fpUdmt8nmABMThIU1uiVUQ
 zWhS2IfiCWzgdc8uahPaLCPFNUiNx/FlVvl5hCpfoxekLigyLIBj7whxbvUf9qm/BRny
 g0pTq4IHAXqKrNNST8UZJf8+5Rbnc1eQjyB9p8v9yOUZFwpQmPMgIUWjMODzlaBgRNJF
 5OHFD3hqdEWsTR7d6LKpxSn0MhnKp/7rx4MVczlgADl6D0U8K8uy5Q7k/uThqZpP7rGX
 3qqw==
X-Gm-Message-State: AOJu0YwRdWA7huuGCJtYDptS0cFq3EuvsMGra6iWZNaUFR5kjTk+eBix
 X0sPOQV2hn547Pua4sSPw+DYdQ==
X-Google-Smtp-Source: AGHT+IG0fbXSrDRSiTh0I11E4ed5xILhVTVEanVL6RXYzdvY1D6ggO1LXXgtrvhd8lOu9iNsT5z6zQ==
X-Received: by 2002:aa7:88cd:0:b0:68f:c9df:2ccb with SMTP id
 k13-20020aa788cd000000b0068fc9df2ccbmr4061742pff.1.1694851371818; 
 Sat, 16 Sep 2023 01:02:51 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 z21-20020aa791d5000000b0068a46cd4120sm4029484pfa.199.2023.09.16.01.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 01:02:51 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH v8 11/19] gdbstub: Infer number of core registers from XML
Date: Sat, 16 Sep 2023 17:01:28 +0900
Message-ID: <20230916080149.129989-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230916080149.129989-1-akihiko.odaki@daynix.com>
References: <20230916080149.129989-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

GDBFeature has the num_regs member so use it where applicable to
remove magic numbers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h   | 3 ++-
 target/s390x/cpu.h      | 2 --
 gdbstub/gdbstub.c       | 5 ++++-
 target/arm/cpu.c        | 1 -
 target/arm/cpu64.c      | 1 -
 target/avr/cpu.c        | 1 -
 target/hexagon/cpu.c    | 1 -
 target/i386/cpu.c       | 2 --
 target/loongarch/cpu.c  | 2 --
 target/m68k/cpu.c       | 1 -
 target/microblaze/cpu.c | 1 -
 target/riscv/cpu.c      | 1 -
 target/rx/cpu.c         | 1 -
 target/s390x/cpu.c      | 1 -
 14 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c84c631242..5426822ee0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -126,7 +126,8 @@ struct SysemuCPUOps;
  * @gdb_adjust_breakpoint: Callback for adjusting the address of a
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
- * @gdb_num_core_regs: Number of core registers accessible to GDB.
+ * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 to infer
+ *                     from @gdb_core_xml_file.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index eb5b65b7d3..c5bac3230c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -451,8 +451,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
 #define S390_R13_REGNUM 15
 #define S390_R14_REGNUM 16
 #define S390_R15_REGNUM 17
-/* Total Core Registers. */
-#define S390_NUM_CORE_REGS 18
 
 static inline void setcc(S390CPU *cpu, uint64_t cc)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index c2afdf20c2..8d45daf6d7 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -541,9 +541,12 @@ void gdb_init_cpu(CPUState *cpu)
         gdb_register_feature(cpu, 0,
                              cc->gdb_read_register, cc->gdb_write_register,
                              feature);
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
     }
 
-    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    if (cc->gdb_num_core_regs) {
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    }
 }
 
 void gdb_register_coprocessor(CPUState *cpu,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a13c609249..dc38ebec18 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2388,7 +2388,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6b91aab6b7..72a1089163 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -754,7 +754,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8f741f258c..a77ec65b04 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -246,7 +246,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "avr-cpu.xml";
     cc->tcg_ops = &avr_tcg_ops;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 1dc8e0da24..b7d688e583 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -388,7 +388,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
-    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
     cc->gdb_core_xml_file = "hexagon-core.xml";
     cc->disas_set_info = hexagon_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5678b52472..f948530d3c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7968,10 +7968,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
 #else
     cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
 #endif
     cc->disas_set_info = x86_disas_set_info;
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f88cfa93ce..03cc1b7384 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -772,7 +772,6 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base32.xml";
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
@@ -786,7 +785,6 @@ static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_arch_name = loongarch64_gdb_arch_name;
 }
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 70d58471dc..cf69a3ecc9 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -572,7 +572,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 18;
     cc->tcg_ops = &m68k_tcg_ops;
 }
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index e1eff0b837..0826855b80 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -429,7 +429,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
-    cc->gdb_num_core_regs = 32 + 25;
     cc->gdb_core_xml_file = "microblaze-core.xml";
 
     cc->disas_set_info = mb_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a03c9069ca..f8234da054 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2138,7 +2138,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 33;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 157e57da0f..4a45f6dc8c 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -239,7 +239,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "rx-core.xml";
     cc->tcg_ops = &rx_tcg_ops;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index cf4b5e43f2..a97b69bda3 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -348,7 +348,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-    cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file = "s390x-core64.xml";
     cc->gdb_arch_name = s390_gdb_arch_name;
 
-- 
2.42.0


