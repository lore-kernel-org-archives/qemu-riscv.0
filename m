Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ki1qY-0000Px-Gn
	for mharc-qemu-riscv@gnu.org; Wed, 25 Nov 2020 15:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qX-0000N8-0o
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2020 15:57:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qT-0003LR-IE
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2020 15:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2/00TLrnhb1EAZoELCRZkrRxl7+zesQjlzM1dccqtI=;
 b=A1jOzawt3HE83Q48bcKhsSm2YTTQDhXoSqVfU2ALI0f9nWo43WgtFr/npGo8PL0AkNYfTz
 Od3sfdAW3JS/gp3H/XQecbfok2K2Y2oEKVidkQMl58VjIdn5TTCQjQZqXBnub2PhgyqHpm
 I0ZU9jmEyZvNARD7j6Jf7uFSdsuciuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-sK7tNT8SM3apCRfJKGpRKw-1; Wed, 25 Nov 2020 15:56:54 -0500
X-MC-Unique: sK7tNT8SM3apCRfJKGpRKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B529100C616;
 Wed, 25 Nov 2020 20:56:49 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5D7F60854;
 Wed, 25 Nov 2020 20:56:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v2 1/6] arch_init: Move QEMU_ARCH definitions to cpu.h
Date: Wed, 25 Nov 2020 15:56:31 -0500
Message-Id: <20201125205636.3305257-2-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 25 Nov 2020 20:57:01 -0000

Instead of a collection of #ifdefs on arch_init.c, define
QEMU_ARCH inside each cpu.h file.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Rolnik <mrolnik@gmail.com>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Anthony Green <green@moxielogic.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Stafford Horne <shorne@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 target/alpha/cpu.h      |  1 +
 target/arm/cpu.h        |  1 +
 target/avr/cpu.h        |  1 +
 target/cris/cpu.h       |  1 +
 target/hppa/cpu.h       |  1 +
 target/i386/cpu.h       |  1 +
 target/lm32/cpu.h       |  1 +
 target/m68k/cpu.h       |  1 +
 target/microblaze/cpu.h |  1 +
 target/mips/cpu.h       |  1 +
 target/moxie/cpu.h      |  1 +
 target/nios2/cpu.h      |  1 +
 target/openrisc/cpu.h   |  1 +
 target/ppc/cpu.h        |  1 +
 target/riscv/cpu.h      |  1 +
 target/rx/cpu.h         |  1 +
 target/s390x/cpu.h      |  1 +
 target/sh4/cpu.h        |  1 +
 target/sparc/cpu.h      |  1 +
 target/tricore/cpu.h    |  1 +
 target/unicore32/cpu.h  |  1 +
 target/xtensa/cpu.h     |  1 +
 softmmu/arch_init.c     | 46 -----------------------------------------
 23 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967..313a4e456e 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -438,6 +438,7 @@ void alpha_translate_init(void);
 #define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
 #define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
+#define QEMU_ARCH QEMU_ARCH_ALPHA
 
 void alpha_cpu_list(void);
 /* you can call this signal handler from your SIGBUS and SIGSEGV
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..3f469a6485 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2822,6 +2822,7 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
+#define QEMU_ARCH QEMU_ARCH_ARM
 
 #define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index d148e8c75a..98f5df0ad7 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -31,6 +31,7 @@
 #define AVR_CPU_TYPE_SUFFIX "-" TYPE_AVR_CPU
 #define AVR_CPU_TYPE_NAME(name) (name AVR_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_AVR_CPU
+#define QEMU_ARCH QEMU_ARCH_AVR
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b6492909..2482915699 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -249,6 +249,7 @@ enum {
 #define CRIS_CPU_TYPE_SUFFIX "-" TYPE_CRIS_CPU
 #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
+#define QEMU_ARCH QEMU_ARCH_CRIS
 
 #define cpu_signal_handler cpu_cris_signal_handler
 
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 61178fa6a2..74d813289b 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -242,6 +242,7 @@ static inline int cpu_mmu_index(CPUHPPAState *env, bool ifetch)
 void hppa_translate_init(void);
 
 #define CPU_RESOLVING_TYPE TYPE_HPPA_CPU
+#define QEMU_ARCH QEMU_ARCH_HPPA
 
 static inline target_ulong hppa_form_gva_psw(target_ureg psw, uint64_t spc,
                                              target_ureg off)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 88e8586f8f..03202f610c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1971,6 +1971,7 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
 #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_X86_CPU
+#define QEMU_ARCH QEMU_ARCH_I386
 
 #ifdef TARGET_X86_64
 #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu64")
diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
index ea7c01ca8b..169c0ff19d 100644
--- a/target/lm32/cpu.h
+++ b/target/lm32/cpu.h
@@ -238,6 +238,7 @@ bool lm32_cpu_do_semihosting(CPUState *cs);
 #define LM32_CPU_TYPE_SUFFIX "-" TYPE_LM32_CPU
 #define LM32_CPU_TYPE_NAME(model) model LM32_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LM32_CPU
+#define QEMU_ARCH QEMU_ARCH_LM32
 
 #define cpu_list lm32_cpu_list
 #define cpu_signal_handler cpu_lm32_signal_handler
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 521ac67cdd..87b5324b2c 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -514,6 +514,7 @@ enum {
 #define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
 #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
+#define QEMU_ARCH QEMU_ARCH_M68K
 
 #define cpu_signal_handler cpu_m68k_signal_handler
 #define cpu_list m68k_cpu_list
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index c1c264199f..cbe60fbf58 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -378,6 +378,7 @@ int cpu_mb_signal_handler(int host_signum, void *pinfo,
                           void *puc);
 
 #define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU
+#define QEMU_ARCH QEMU_ARCH_MICROBLAZE
 
 #define cpu_signal_handler cpu_mb_signal_handler
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 23f8c6f96c..8a6707aa81 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1285,6 +1285,7 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
 #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
+#define QEMU_ARCH QEMU_ARCH_MIPS
 
 bool cpu_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const char *cpu_type, uint64_t isa);
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index bd6ab66084..f638509381 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -95,6 +95,7 @@ int cpu_moxie_signal_handler(int host_signum, void *pinfo,
 #define MOXIE_CPU_TYPE_SUFFIX "-" TYPE_MOXIE_CPU
 #define MOXIE_CPU_TYPE_NAME(model) model MOXIE_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_MOXIE_CPU
+#define QEMU_ARCH QEMU_ARCH_MOXIE
 
 #define cpu_signal_handler cpu_moxie_signal_handler
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 86bbe1d867..b8fabdfb60 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -207,6 +207,7 @@ void nios2_check_interrupts(CPUNios2State *env);
 void do_nios2_semihosting(CPUNios2State *env);
 
 #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
+#define QEMU_ARCH QEMU_ARCH_NIOS2
 
 #define cpu_gen_code cpu_nios2_gen_code
 #define cpu_signal_handler cpu_nios2_signal_handler
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index bd42faf144..68ff1d06c9 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -348,6 +348,7 @@ void cpu_openrisc_count_stop(OpenRISCCPU *cpu);
 #define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
 #define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
+#define QEMU_ARCH QEMU_ARCH_OPENRISC
 
 typedef CPUOpenRISCState CPUArchState;
 typedef OpenRISCCPU ArchCPU;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e4082e..fd870c4cf4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1334,6 +1334,7 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
 #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
 #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
+#define QEMU_ARCH QEMU_ARCH_PPC
 
 #define cpu_signal_handler cpu_ppc_signal_handler
 #define cpu_list ppc_cpu_list
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0a326c843..3f566b1c7f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -33,6 +33,7 @@
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
+#define QEMU_ARCH QEMU_ARCH_RISCV
 
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7b..05c195962a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -122,6 +122,7 @@ typedef RXCPU ArchCPU;
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
+#define QEMU_ARCH QEMU_ARCH_RX
 
 const char *rx_crname(uint8_t cr);
 void rx_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 60d434d5ed..d528d18b6d 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -797,6 +797,7 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
 #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
 #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_S390_CPU
+#define QEMU_ARCH QEMU_ARCH_S390X
 
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 714e3b5641..f0314774f8 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -249,6 +249,7 @@ void cpu_load_tlb(CPUSH4State * env);
 #define SUPERH_CPU_TYPE_SUFFIX "-" TYPE_SUPERH_CPU
 #define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
+#define QEMU_ARCH QEMU_ARCH_SH4
 
 #define cpu_signal_handler cpu_sh4_signal_handler
 #define cpu_list sh4_cpu_list
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index b9369398f2..9d80f8b500 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -662,6 +662,7 @@ int cpu_sparc_signal_handler(int host_signum, void *pinfo, void *puc);
 #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
 #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
+#define QEMU_ARCH QEMU_ARCH_SPARC
 
 #define cpu_signal_handler cpu_sparc_signal_handler
 #define cpu_list sparc_cpu_list
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index b82349d1b1..28c86f77b0 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -402,6 +402,7 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
 #define TRICORE_CPU_TYPE_SUFFIX "-" TYPE_TRICORE_CPU
 #define TRICORE_CPU_TYPE_NAME(model) model TRICORE_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_TRICORE_CPU
+#define QEMU_ARCH QEMU_ARCH_TRICORE
 
 /* helpers.c */
 bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
index 7a32e086ed..6c0d88aa9b 100644
--- a/target/unicore32/cpu.h
+++ b/target/unicore32/cpu.h
@@ -147,6 +147,7 @@ typedef UniCore32CPU ArchCPU;
 #define UNICORE32_CPU_TYPE_SUFFIX "-" TYPE_UNICORE32_CPU
 #define UNICORE32_CPU_TYPE_NAME(model) model UNICORE32_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_UNICORE32_CPU
+#define QEMU_ARCH QEMU_ARCH_UNICORE32
 
 static inline void cpu_get_tb_cpu_state(CPUUniCore32State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 3bd4f691c1..c7a503b01d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -589,6 +589,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 #define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
 #define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
+#define QEMU_ARCH QEMU_ARCH_XTENSA
 
 #ifdef TARGET_WORDS_BIGENDIAN
 #define XTENSA_DEFAULT_CPU_MODEL "fsf"
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 7fd5c09b2b..7ef32a98b9 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -48,52 +48,6 @@ int graphic_depth = 32;
 #endif
 
 
-#if defined(TARGET_ALPHA)
-#define QEMU_ARCH QEMU_ARCH_ALPHA
-#elif defined(TARGET_ARM)
-#define QEMU_ARCH QEMU_ARCH_ARM
-#elif defined(TARGET_CRIS)
-#define QEMU_ARCH QEMU_ARCH_CRIS
-#elif defined(TARGET_HPPA)
-#define QEMU_ARCH QEMU_ARCH_HPPA
-#elif defined(TARGET_I386)
-#define QEMU_ARCH QEMU_ARCH_I386
-#elif defined(TARGET_LM32)
-#define QEMU_ARCH QEMU_ARCH_LM32
-#elif defined(TARGET_M68K)
-#define QEMU_ARCH QEMU_ARCH_M68K
-#elif defined(TARGET_MICROBLAZE)
-#define QEMU_ARCH QEMU_ARCH_MICROBLAZE
-#elif defined(TARGET_MIPS)
-#define QEMU_ARCH QEMU_ARCH_MIPS
-#elif defined(TARGET_MOXIE)
-#define QEMU_ARCH QEMU_ARCH_MOXIE
-#elif defined(TARGET_NIOS2)
-#define QEMU_ARCH QEMU_ARCH_NIOS2
-#elif defined(TARGET_OPENRISC)
-#define QEMU_ARCH QEMU_ARCH_OPENRISC
-#elif defined(TARGET_PPC)
-#define QEMU_ARCH QEMU_ARCH_PPC
-#elif defined(TARGET_RISCV)
-#define QEMU_ARCH QEMU_ARCH_RISCV
-#elif defined(TARGET_RX)
-#define QEMU_ARCH QEMU_ARCH_RX
-#elif defined(TARGET_S390X)
-#define QEMU_ARCH QEMU_ARCH_S390X
-#elif defined(TARGET_SH4)
-#define QEMU_ARCH QEMU_ARCH_SH4
-#elif defined(TARGET_SPARC)
-#define QEMU_ARCH QEMU_ARCH_SPARC
-#elif defined(TARGET_TRICORE)
-#define QEMU_ARCH QEMU_ARCH_TRICORE
-#elif defined(TARGET_UNICORE32)
-#define QEMU_ARCH QEMU_ARCH_UNICORE32
-#elif defined(TARGET_XTENSA)
-#define QEMU_ARCH QEMU_ARCH_XTENSA
-#elif defined(TARGET_AVR)
-#define QEMU_ARCH QEMU_ARCH_AVR
-#endif
-
 const uint32_t arch_type = QEMU_ARCH;
 
 int kvm_available(void)
-- 
2.28.0


