Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D176FC04FDF
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:55:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHvk-0003RJ-CD; Wed, 16 Aug 2023 10:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHva-0002xs-5S
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:55:18 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHvT-0002AM-CY
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:55:17 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68871bbfe33so1233924b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197709; x=1692802509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVVdooKF8qtbYGXqlxxO6sXjrL0xj5j1SeLsuJ84KLY=;
 b=iH2nnH3ocQeNFrdKcNfMifkXgMTqutFFQem8mp7A4DoIbF+tDoep6iKXxZziZMa7mx
 hy6fUPrywtQhqrluyRvnD6BAbCMNwejsCtaQ6Ktbcf9JNJY8dVLpzwOKTrExOcnnx1Bq
 qxME2RWLTmwJOmkn7fV5W75aN3ZyWSxsR/7VYMTsD4U+rq5T7bBNe2v7bojQFZRqFVEy
 fVrME3IrFsSTieiewDFWmNzT+5InCtOc3qeJeO7KrD0tRetUrP5E1x9ClCe1QljDX/Yv
 RnQ6/wCDS9c6ONPiWsxVIi+GKek1lEuom7b69NW3mC3djvp9kzcLzR4ccHS7t7dHzrF2
 My1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197709; x=1692802509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVVdooKF8qtbYGXqlxxO6sXjrL0xj5j1SeLsuJ84KLY=;
 b=NT98+EGLjDk2uHPUPpd1JTY4wF8i7U/EnK1TTSgIOkRmyEQQL4uJyNz6qgSjP4qGZy
 W+Zf/FVP9xSDhziXVLrf4EipXlJGWDI6XOsNVSnoXQkIM/QDthCE7wz74eWr/f/rojEA
 eYm501dxOyUxlrRHUw9PmvZV5+BPz47yVdPoFGx67ZiYEsTL/UM+O76lgcpQPutY5uQx
 5a3ErKPktAld1C01pJLsYPwxLdXV8xh9dBn2H2//LkGNe+eC2o++Eyl8NUxUxuV4MAQZ
 fPBSAXViD2813/2GVdYvdGedwA2vntCui1gN0mKZnPmb3IjpKi3g91vvKWpz3g2Cfnld
 Xq4g==
X-Gm-Message-State: AOJu0YyOXsGRn2yHPaNHIVSO4Cf5vpjKDZCeUUkTESDJkkK+Mx0HLR8N
 Vlg9CWny89YtgSfiUS2Tp6uHSg==
X-Google-Smtp-Source: AGHT+IEHmm4MreK6s4Bu6OLMXl1aQdJDjH6CcJMqN+0f9nqE/NOH+wSErUNCAnWqnvG1wmM82iqCGg==
X-Received: by 2002:a05:6a20:9189:b0:13d:bf07:7444 with SMTP id
 v9-20020a056a20918900b0013dbf077444mr2527271pzd.0.1692197708607; 
 Wed, 16 Aug 2023 07:55:08 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:55:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 18/25] hw/core/cpu: Add a parameter to
 gdb_read_register/gdb_write_register
Date: Wed, 16 Aug 2023 23:51:39 +0900
Message-ID: <20230816145155.21049-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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

gdbstub has a static variable named gdb_has_xml that tells if
workarounds for old GDB versions are required when manipulating
registers for GDB.

Now we are reusing the infrastructure to manipulate registers for
plugins. Plugins will not need these workarounds even when an old GDB
is attached. Converting the static variable to a function parameter
would allow to apply or not to apply workarounds depending on the
context.

This change adds the new parameter and replaces references to
gdb_has_xml with it. New code to pass different values to the functions
will be added later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h         |  6 ++++--
 target/alpha/cpu.h            |  6 ++++--
 target/arm/cpu.h              | 13 +++++++++----
 target/avr/cpu.h              |  6 ++++--
 target/cris/cpu.h             |  9 ++++++---
 target/hexagon/internal.h     |  6 ++++--
 target/hppa/cpu.h             |  6 ++++--
 target/i386/cpu.h             |  6 ++++--
 target/loongarch/internals.h  |  6 ++++--
 target/m68k/cpu.h             |  6 ++++--
 target/microblaze/cpu.h       |  6 ++++--
 target/mips/internal.h        |  6 ++++--
 target/openrisc/cpu.h         |  6 ++++--
 target/ppc/cpu.h              | 12 ++++++++----
 target/riscv/cpu.h            |  6 ++++--
 target/rx/cpu.h               |  6 ++++--
 target/s390x/s390x-internal.h |  6 ++++--
 target/sh4/cpu.h              |  6 ++++--
 target/sparc/cpu.h            |  6 ++++--
 target/tricore/cpu.h          |  6 ++++--
 target/xtensa/cpu.h           |  6 ++++--
 gdbstub/gdbstub.c             |  4 ++--
 hw/core/cpu-common.c          |  6 ++++--
 target/alpha/gdbstub.c        |  6 ++++--
 target/arm/gdbstub.c          | 14 ++++++++------
 target/arm/gdbstub64.c        |  6 ++++--
 target/avr/gdbstub.c          |  6 ++++--
 target/cris/gdbstub.c         |  9 ++++++---
 target/hexagon/gdbstub.c      |  6 ++++--
 target/hppa/gdbstub.c         |  6 ++++--
 target/i386/gdbstub.c         | 10 +++++-----
 target/loongarch/gdbstub.c    |  6 ++++--
 target/m68k/gdbstub.c         |  6 ++++--
 target/microblaze/gdbstub.c   |  6 ++++--
 target/mips/gdbstub.c         |  6 ++++--
 target/nios2/cpu.c            |  6 ++++--
 target/openrisc/gdbstub.c     |  6 ++++--
 target/ppc/gdbstub.c          | 22 +++++++++++++---------
 target/riscv/gdbstub.c        |  6 ++++--
 target/rx/gdbstub.c           |  6 ++++--
 target/s390x/gdbstub.c        |  6 ++++--
 target/sh4/gdbstub.c          |  6 ++++--
 target/sparc/gdbstub.c        |  6 ++++--
 target/tricore/gdbstub.c      |  6 ++++--
 target/xtensa/gdbstub.c       |  6 ++++--
 45 files changed, 205 insertions(+), 110 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8fc9a1a140..bb0f96d733 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -157,8 +157,10 @@ struct CPUClass {
     int64_t (*get_arch_id)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     vaddr (*get_pc)(CPUState *cpu);
-    int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
-    int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
+    int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg,
+                             bool has_xml);
+    int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg,
+                              bool has_xml);
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const GDBFeature *gdb_core_feature;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 13306665af..46bd9bc37b 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -279,8 +279,10 @@ bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
-int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                bool has_xml);
+int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                 bool has_xml);
 
 #define cpu_list alpha_cpu_list
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 09bf82034d..3dfa29c3aa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1128,8 +1128,11 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
 #endif /* !CONFIG_USER_ONLY */
 
-int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                              bool has_xml);
+
+int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                               bool has_xml);
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, DumpState *s);
@@ -1137,8 +1140,10 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, DumpState *s);
 
 #ifdef TARGET_AARCH64
-int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                  bool has_xml);
+int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                   bool has_xml);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 7225174668..006e79e018 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -157,8 +157,10 @@ extern const struct VMStateDescription vms_avr_cpu;
 void avr_cpu_do_interrupt(CPUState *cpu);
 bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                              bool has_xml);
+int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                               bool has_xml);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
 vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 8e37c6e50d..d3a62c5480 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -198,9 +198,12 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
-int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                  bool has_xml);
+int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                               bool has_xml);
+int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                bool has_xml);
 
 void cris_initialize_tcg(void);
 void cris_initialize_crisv10_tcg(void);
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index d732b6bb3c..cdd4bb7d26 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -31,8 +31,10 @@
         } \
     } while (0)
 
-int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                              bool has_xml);
+int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                               bool has_xml);
 int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_buf, int n);
 int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_buf, int n);
 
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 9fe79b1242..a983540dd2 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -321,8 +321,10 @@ static inline void cpu_hppa_change_prot_id(CPUHPPAState *env) { }
 void cpu_hppa_change_prot_id(CPUHPPAState *env);
 #endif
 
-int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                               bool has_xml);
+int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                bool has_xml);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 #ifndef CONFIG_USER_ONLY
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e0771a1043..d177f500b8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2057,8 +2057,10 @@ void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 
 void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
-int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                              bool has_xml);
+int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                               bool has_xml);
 
 void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 7b0f29c942..a2ff8b3e3d 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -77,8 +77,10 @@ hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 uint64_t read_fcc(CPULoongArchState *env);
 void write_fcc(CPULoongArchState *env, uint64_t val);
 
-int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
-int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
+int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                    bool has_xml);
+int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                     bool has_xml);
 void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs);
 
 #endif
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index cf70282717..b59d076c0c 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -179,8 +179,10 @@ bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                               bool has_xml);
+int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                bool has_xml);
 
 void m68k_tcg_init(void);
 void m68k_cpu_init_gdb(M68kCPU *cpu);
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index f6cab6ce19..8840bf17f3 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -368,8 +368,10 @@ G_NORETURN void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                            MMUAccessType access_type,
                                            int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                             bool has_xml);
+int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                              bool has_xml);
 int mb_cpu_gdb_read_stack_protect(CPUArchState *cpu, GByteArray *buf, int reg);
 int mb_cpu_gdb_write_stack_protect(CPUArchState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1d0c026c7d..b5462f53a9 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -92,8 +92,10 @@ extern const char fregnames[32][4];
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
 
-int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                               bool has_xml);
+int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                bool has_xml);
 
 #define USEG_LIMIT      ((target_ulong)(int32_t)0x7FFFFFFFUL)
 #define KSEG0_BASE      ((target_ulong)(int32_t)0x80000000UL)
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ce4d605eb7..8c2089db92 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -312,8 +312,10 @@ struct ArchCPU {
 
 void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                   bool has_xml);
+int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                    bool has_xml);
 void openrisc_translate_init(void);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3dc6e545e3..0849ee6e1f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1375,10 +1375,14 @@ static inline bool vhyp_cpu_in_nested(PowerPCCPU *cpu)
 #endif /* CONFIG_USER_ONLY */
 
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
-int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
+int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                              bool has_xml);
+int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg,
+                                    bool has_xml);
+int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                               bool has_xml);
+int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg,
+                                     bool has_xml);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f67751d5b7..46b06b1962 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -421,8 +421,10 @@ int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
 int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, DumpState *s);
-int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                bool has_xml);
+int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                 bool has_xml);
 int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
 uint8_t riscv_cpu_default_priority(int irq);
 uint64_t riscv_cpu_all_pending(CPURISCVState *env);
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 7f03ffcfed..d1a099cf72 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -126,8 +126,10 @@ bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                             bool has_xml);
+int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                              bool has_xml);
 
 void rx_translate_init(void);
 void rx_cpu_list(void);
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 825252d728..4c2bb30358 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -316,8 +316,10 @@ uint16_t float128_dcmask(CPUS390XState *env, float128 f1);
 
 
 /* gdbstub.c */
-int s390_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int s390_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int s390_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                               bool has_xml);
+int s390_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                bool has_xml);
 void s390_cpu_gdb_init(CPUState *cs);
 
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 1399d3840f..74c8f0f574 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -214,8 +214,10 @@ struct ArchCPU {
 
 
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                 bool has_xml);
+int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                  bool has_xml);
 G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 98044572f2..b03174938c 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -573,8 +573,10 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
-int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                bool has_xml);
+int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                 bool has_xml);
 G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                               MMUAccessType access_type,
                                               int mmu_idx,
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 3708405be8..7da6c88a15 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -361,8 +361,10 @@ enum {
 
 uint32_t psw_read(CPUTriCoreState *env);
 void psw_write(CPUTriCoreState *env, uint32_t val);
-int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
-int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
+int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                  bool has_xml);
+int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                   bool has_xml);
 
 void fpu_set_state(CPUTriCoreState *env);
 
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 87fe992ba6..093593eb0c 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -581,8 +581,10 @@ hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
-int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                 bool has_xml);
+int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                  bool has_xml);
 G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e4fbdebca4..5974af7c8f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -490,7 +490,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_read_register(cpu, buf, reg);
+        return cc->gdb_read_register(cpu, buf, reg, gdb_has_xml);
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
@@ -508,7 +508,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_write_register(cpu, mem_buf, reg);
+        return cc->gdb_write_register(cpu, mem_buf, reg, gdb_has_xml);
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ced66c2b34..549f52f46f 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -89,12 +89,14 @@ void cpu_exit(CPUState *cpu)
     qatomic_set(&cpu->icount_decr_ptr->u16.high, -1);
 }
 
-static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
+static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg,
+                                        bool has_xml)
 {
     return 0;
 }
 
-static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
+static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg,
+                                         bool has_xml)
 {
     return 0;
 }
diff --git a/target/alpha/gdbstub.c b/target/alpha/gdbstub.c
index 0f8fa150f8..c5b4a190f3 100644
--- a/target/alpha/gdbstub.c
+++ b/target/alpha/gdbstub.c
@@ -21,7 +21,8 @@
 #include "cpu.h"
 #include "gdbstub/helpers.h"
 
-int alpha_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int alpha_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                bool has_xml)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
     CPUAlphaState *env = &cpu->env;
@@ -57,7 +58,8 @@ int alpha_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return gdb_get_regl(mem_buf, val);
 }
 
-int alpha_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int alpha_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                 bool has_xml)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
     CPUAlphaState *env = &cpu->env;
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index dbc396a88b..7a17dc923d 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -36,7 +36,8 @@ typedef struct RegisterSysregFeatureParam {
    We hack round this by giving the FPA regs zero size when talking to a
    newer gdb.  */
 
-int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                              bool has_xml)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -47,7 +48,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     }
     if (n < 24) {
         /* FPA registers.  */
-        if (gdb_has_xml) {
+        if (has_xml) {
             return 0;
         }
         return gdb_get_zeroes(mem_buf, 12);
@@ -55,7 +56,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     switch (n) {
     case 24:
         /* FPA status register.  */
-        if (gdb_has_xml) {
+        if (has_xml) {
             return 0;
         }
         return gdb_get_reg32(mem_buf, 0);
@@ -71,7 +72,8 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                               bool has_xml)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -101,7 +103,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     }
     if (n < 24) { /* 16-23 */
         /* FPA registers (ignored).  */
-        if (gdb_has_xml) {
+        if (has_xml) {
             return 0;
         }
         return 12;
@@ -109,7 +111,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     switch (n) {
     case 24:
         /* FPA status register (ignored).  */
-        if (gdb_has_xml) {
+        if (has_xml) {
             return 0;
         }
         return 4;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 632ac2a520..23f95534d2 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -22,7 +22,8 @@
 #include "internals.h"
 #include "gdbstub/helpers.h"
 
-int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                  bool has_xml)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -43,7 +44,8 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                   bool has_xml)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
index 150344d8b9..c40f4ecd4b 100644
--- a/target/avr/gdbstub.c
+++ b/target/avr/gdbstub.c
@@ -21,7 +21,8 @@
 #include "qemu/osdep.h"
 #include "gdbstub/helpers.h"
 
-int avr_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int avr_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                              bool has_xml)
 {
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
@@ -51,7 +52,8 @@ int avr_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                               bool has_xml)
 {
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
diff --git a/target/cris/gdbstub.c b/target/cris/gdbstub.c
index 25c0ca33a5..2b5c0d5f14 100644
--- a/target/cris/gdbstub.c
+++ b/target/cris/gdbstub.c
@@ -21,7 +21,8 @@
 #include "cpu.h"
 #include "gdbstub/helpers.h"
 
-int crisv10_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int crisv10_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                  bool has_xml)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
     CPUCRISState *env = &cpu->env;
@@ -53,7 +54,8 @@ int crisv10_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int cris_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int cris_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                               bool has_xml)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
     CPUCRISState *env = &cpu->env;
@@ -88,7 +90,8 @@ int cris_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int cris_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int cris_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                bool has_xml)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
     CPUCRISState *env = &cpu->env;
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index 54d37e006e..42fa563fc4 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -20,7 +20,8 @@
 #include "cpu.h"
 #include "internal.h"
 
-int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                              bool has_xml)
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
@@ -40,7 +41,8 @@ int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     g_assert_not_reached();
 }
 
-int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                               bool has_xml)
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
diff --git a/target/hppa/gdbstub.c b/target/hppa/gdbstub.c
index 48a514384f..44a1869d54 100644
--- a/target/hppa/gdbstub.c
+++ b/target/hppa/gdbstub.c
@@ -21,7 +21,8 @@
 #include "cpu.h"
 #include "gdbstub/helpers.h"
 
-int hppa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int hppa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                               bool has_xml)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
@@ -146,7 +147,8 @@ int hppa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     }
 }
 
-int hppa_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int hppa_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                bool has_xml)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index ebb000df6a..56c9aedd6b 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -32,9 +32,7 @@ static const int gpr_map[16] = {
 static const int gpr_map32[8] = { 0, 1, 2, 3, 4, 5, 6, 7 };
 
 /*
- * Keep these in sync with assignment to
- * gdb_num_core_regs in target/i386/cpu.c
- * and with the machine description
+ * Keep these in sync with the machine description
  */
 
 /*
@@ -96,7 +94,8 @@ static int gdb_write_reg_cs64(uint32_t hflags, uint8_t *buf, target_ulong *val)
     return 4;
 }
 
-int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                              bool has_xml)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -248,7 +247,8 @@ static int x86_cpu_gdb_load_seg(X86CPU *cpu, X86Seg sreg, uint8_t *mem_buf)
     return 4;
 }
 
-int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                               bool has_xml)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 2886b106bb..6b14f73084 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -30,7 +30,8 @@ void write_fcc(CPULoongArchState *env, uint64_t val)
     }
 }
 
-int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                    bool has_xml)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
@@ -48,7 +49,8 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                     bool has_xml)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c
index 1e5f033a12..24e636cddc 100644
--- a/target/m68k/gdbstub.c
+++ b/target/m68k/gdbstub.c
@@ -21,7 +21,8 @@
 #include "cpu.h"
 #include "gdbstub/helpers.h"
 
-int m68k_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int m68k_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                               bool has_xml)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
@@ -48,7 +49,8 @@ int m68k_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int m68k_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int m68k_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                bool has_xml)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index 29ac6e9c0f..71962b98de 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -46,7 +46,8 @@ enum {
     GDB_SP_SHR,
 };
 
-int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                             bool has_xml)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -111,7 +112,8 @@ int mb_cpu_gdb_read_stack_protect(CPUMBState *env, GByteArray *mem_buf, int n)
     return gdb_get_reg32(mem_buf, val);
 }
 
-int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                              bool has_xml)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
diff --git a/target/mips/gdbstub.c b/target/mips/gdbstub.c
index 62d7b72407..9022fc5375 100644
--- a/target/mips/gdbstub.c
+++ b/target/mips/gdbstub.c
@@ -23,7 +23,8 @@
 #include "gdbstub/helpers.h"
 #include "fpu_helper.h"
 
-int mips_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int mips_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                               bool has_xml)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
@@ -76,7 +77,8 @@ int mips_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int mips_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int mips_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                bool has_xml)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index bc5cbf81c2..5015866b4d 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -280,7 +280,8 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_nios2;
 }
 
-static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                       bool has_xml)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
@@ -305,7 +306,8 @@ static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return gdb_get_reg32(mem_buf, val);
 }
 
-static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                        bool has_xml)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index d1074a0581..5ac841e52a 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -21,7 +21,8 @@
 #include "cpu.h"
 #include "gdbstub/helpers.h"
 
-int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                   bool has_xml)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
@@ -46,7 +47,8 @@ int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int openrisc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int openrisc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                    bool has_xml)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index c86b7055ca..d66a35d432 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -48,7 +48,7 @@ static int ppc_gdb_register_len_apple(int n)
     }
 }
 
-static int ppc_gdb_register_len(int n)
+static int ppc_gdb_register_len(int n, bool has_xml)
 {
     switch (n) {
     case 0 ... 31:
@@ -56,7 +56,7 @@ static int ppc_gdb_register_len(int n)
         return sizeof(target_ulong);
     case 32 ... 63:
         /* fprs */
-        if (gdb_has_xml) {
+        if (has_xml) {
             return 0;
         }
         return 8;
@@ -76,7 +76,7 @@ static int ppc_gdb_register_len(int n)
         return sizeof(target_ulong);
     case 70:
         /* fpscr */
-        if (gdb_has_xml) {
+        if (has_xml) {
             return 0;
         }
         return sizeof(target_ulong);
@@ -118,12 +118,13 @@ void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
  * the FP regs zero size when talking to a newer gdb.
  */
 
-int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
+int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n,
+                              bool has_xml)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     uint8_t *mem_buf;
-    int r = ppc_gdb_register_len(n);
+    int r = ppc_gdb_register_len(n, has_xml);
 
     if (!r) {
         return r;
@@ -168,7 +169,8 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
     return r;
 }
 
-int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
+int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n,
+                                    bool has_xml)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
@@ -222,11 +224,12 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
     return r;
 }
 
-int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                               bool has_xml)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    int r = ppc_gdb_register_len(n);
+    int r = ppc_gdb_register_len(n, has_xml);
 
     if (!r) {
         return r;
@@ -269,7 +272,8 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     }
     return r;
 }
-int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
+int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n,
+                                     bool has_xml)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a2ec9a3701..8d583f7f70 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -47,7 +47,8 @@ static const struct TypeSize vec_lanes[] = {
     { "uint8", "bytes", 8, 'b' },
 };
 
-int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                bool has_xml)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -73,7 +74,8 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                 bool has_xml)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
index d7e0e6689b..57d5ed11eb 100644
--- a/target/rx/gdbstub.c
+++ b/target/rx/gdbstub.c
@@ -19,7 +19,8 @@
 #include "cpu.h"
 #include "gdbstub/helpers.h"
 
-int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                             bool has_xml)
 {
     RXCPU *cpu = RX_CPU(cs);
     CPURXState *env = &cpu->env;
@@ -51,7 +52,8 @@ int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int rx_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int rx_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                              bool has_xml)
 {
     RXCPU *cpu = RX_CPU(cs);
     CPURXState *env = &cpu->env;
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 02c388dc32..57871e3b24 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -28,7 +28,8 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/tcg.h"
 
-int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                               bool has_xml)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
@@ -44,7 +45,8 @@ int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                bool has_xml)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index d8e199fc06..9afe6fc116 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -24,7 +24,8 @@
 /* Hint: Use "set architecture sh4" in GDB to see fpu registers */
 /* FIXME: We should use XML for this.  */
 
-int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                 bool has_xml)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
@@ -74,7 +75,8 @@ int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                  bool has_xml)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
diff --git a/target/sparc/gdbstub.c b/target/sparc/gdbstub.c
index a1c8fdc4d5..288cf7d6f7 100644
--- a/target/sparc/gdbstub.c
+++ b/target/sparc/gdbstub.c
@@ -27,7 +27,8 @@
 #define gdb_get_rega(buf, val) gdb_get_regl(buf, val)
 #endif
 
-int sparc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int sparc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                bool has_xml)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
@@ -104,7 +105,8 @@ int sparc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int sparc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int sparc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                 bool has_xml)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index e8f8e5e6ea..a06e590344 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -104,7 +104,8 @@ static void tricore_cpu_gdb_write_csfr(CPUTriCoreState *env, int n,
 }
 
 
-int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                  bool has_xml)
 {
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
@@ -119,7 +120,8 @@ int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                   bool has_xml)
 {
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index 4b3bfb7e59..81d97b51b8 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -63,7 +63,8 @@ void xtensa_count_regs(const XtensaConfig *config,
     }
 }
 
-int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n,
+                                 bool has_xml)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
@@ -118,7 +119,8 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     }
 }
 
-int xtensa_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+int xtensa_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n,
+                                  bool has_xml)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
-- 
2.41.0


