Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oeNXL-0007iD-JZ
	for mharc-qemu-riscv@gnu.org; Fri, 30 Sep 2022 17:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNXJ-0007Yp-4B
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 17:27:09 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNXF-0005O0-3Q
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 17:27:08 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id h10so1877813qvq.7
 for <qemu-riscv@nongnu.org>; Fri, 30 Sep 2022 14:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oB+dyg98Hn9EhaZ+z9jCbAieIr+G1LHl2YFiqazvYaM=;
 b=GoHyOkYs1sOcpeUChwPXcOgfh/Umt7GmFlpKb8rbT1BwejCy9+9238E2i/mCSxYIW2
 8xreqlT+L2K8IjhEjJNnZ3vU3HforJMngfnnONL9lTDPG0+Kfz4tR3A5oxG34XVwwHhp
 FGUMMrahUQGIMXnuVJVExvR3Piq4zCwHoL9KHFY17wIt3i/5hmKUXFKAHum/AO8x8shS
 0UCvCS53HyQ+MVGgT8ScWXqhRxolmCuBB7vRV8AGj9EAe3agIxD0+y6/575fauqhN/Tm
 kQbxILx6DhgM150ORReHoR8skfAVdRQz56ECpt/45RVaDDBpnDRysglP6msbHvifL3mr
 nOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oB+dyg98Hn9EhaZ+z9jCbAieIr+G1LHl2YFiqazvYaM=;
 b=AmNNP4nLDes9dCAkZyCE7LYja/0Mz8i1y4jp4cUxiFXdw7hIZrsUd0mVIJXqYTINa+
 CgSGmBV0C0GiMxQlFeK8LA2WBa9o1LH9cCMZGXmvjJSCkDQvN/oGXRjRgMSza5dSbR4w
 3eAIq+his632kPyeCTgNPxThtmIihx1oU7oxqcpD8qiNjnPwa8RQKg8hpUYhDNPiYSq/
 SCtFYaScLPea0c9e3KpttZDsu8cZDPQn55bFapbPxwiJgRgArhnJvKKKLDiPp+bCdJxY
 xo3yBZK/uQP3J/flUTkoqszHWMIw6DZwGOtRYG16b0HqlTkEeHd0mKfloNXF8VmIOPcI
 pHSw==
X-Gm-Message-State: ACrzQf0dA3HTibYh8N8/O46Sm4pAS9yC+QGrr3hsbq5bHu/K+xoT8kzX
 Wo74C8Wp+BBI4wbztEoZJ67Wbw==
X-Google-Smtp-Source: AMsMyM49qdPlai7nNHPQlaZYaI4HeyBcH5s4MhhcAki90Hyu20ZWFy1x0Vz04n6YIcif00O2WyX3HQ==
X-Received: by 2002:a0c:8041:0:b0:4af:b13b:2624 with SMTP id
 59-20020a0c8041000000b004afb13b2624mr7508973qva.92.1664573224298; 
 Fri, 30 Sep 2022 14:27:04 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:27:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v6 16/18] hw/core: Add CPUClass.get_pc
Date: Fri, 30 Sep 2022 14:26:20 -0700
Message-Id: <20220930212622.108363-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
X-List-Received-Date: Fri, 30 Sep 2022 21:27:09 -0000

Populate this new method for all targets.  Always match
the result that would be given by cpu_get_tb_cpu_state,
as we will want these values to correspond in the logs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Eduardo Habkost <eduardo@habkost.net> (supporter:Machine core)
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:Machine core)
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org> (reviewer:Machine core)
Cc: Yanan Wang <wangyanan55@huawei.com> (reviewer:Machine core)
Cc: Michael Rolnik <mrolnik@gmail.com> (maintainer:AVR TCG CPUs)
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com> (maintainer:CRIS TCG CPUs)
Cc: Taylor Simpson <tsimpson@quicinc.com> (supporter:Hexagon TCG CPUs)
Cc: Song Gao <gaosong@loongson.cn> (maintainer:LoongArch TCG CPUs)
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn> (maintainer:LoongArch TCG CPUs)
Cc: Laurent Vivier <laurent@vivier.eu> (maintainer:M68K TCG CPUs)
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com> (reviewer:MIPS TCG CPUs)
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> (reviewer:MIPS TCG CPUs)
Cc: Chris Wulff <crwulff@gmail.com> (maintainer:NiosII TCG CPUs)
Cc: Marek Vasut <marex@denx.de> (maintainer:NiosII TCG CPUs)
Cc: Stafford Horne <shorne@gmail.com> (odd fixer:OpenRISC TCG CPUs)
Cc: Yoshinori Sato <ysato@users.sourceforge.jp> (reviewer:RENESAS RX CPUs)
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> (maintainer:SPARC TCG CPUs)
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de> (maintainer:TriCore TCG CPUs)
Cc: Max Filippov <jcmvbkbc@gmail.com> (maintainer:Xtensa TCG CPUs)
Cc: qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Cc: qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs)
Cc: qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Cc: qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
---
 include/hw/core/cpu.h   |  3 +++
 target/alpha/cpu.c      |  9 +++++++++
 target/arm/cpu.c        | 13 +++++++++++++
 target/avr/cpu.c        |  8 ++++++++
 target/cris/cpu.c       |  8 ++++++++
 target/hexagon/cpu.c    |  8 ++++++++
 target/hppa/cpu.c       |  8 ++++++++
 target/i386/cpu.c       |  9 +++++++++
 target/loongarch/cpu.c  |  9 +++++++++
 target/m68k/cpu.c       |  8 ++++++++
 target/microblaze/cpu.c |  8 ++++++++
 target/mips/cpu.c       |  8 ++++++++
 target/nios2/cpu.c      |  9 +++++++++
 target/openrisc/cpu.c   |  8 ++++++++
 target/ppc/cpu_init.c   |  8 ++++++++
 target/riscv/cpu.c      | 13 +++++++++++++
 target/rx/cpu.c         |  8 ++++++++
 target/s390x/cpu.c      |  8 ++++++++
 target/sh4/cpu.c        |  8 ++++++++
 target/sparc/cpu.c      |  8 ++++++++
 target/tricore/cpu.c    |  9 +++++++++
 target/xtensa/cpu.c     |  8 ++++++++
 22 files changed, 186 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 18ca701b44..f9b58773f7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -115,6 +115,8 @@ struct SysemuCPUOps;
  *       If the target behaviour here is anything other than "set
  *       the PC register to the value passed in" then the target must
  *       also implement the synchronize_from_tb hook.
+ * @get_pc: Callback for getting the Program Counter register.
+ *       As above, with the semantics of the target architecture.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_adjust_breakpoint: Callback for adjusting the address of a
@@ -151,6 +153,7 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
+    vaddr (*get_pc)(CPUState *cpu);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index a8990d401b..979a629d59 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,14 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+static vaddr alpha_cpu_get_pc(CPUState *cs)
+{
+    AlphaCPU *cpu = ALPHA_CPU(cs);
+
+    return cpu->env.pc;
+}
+
+
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -244,6 +252,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
+    cc->get_pc = alpha_cpu_get_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7ec3281da9..fa67ba6647 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -60,6 +60,18 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
+static vaddr arm_cpu_get_pc(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (is_a64(env)) {
+        return env->pc;
+    } else {
+        return env->regs[15];
+    }
+}
+
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb)
@@ -2172,6 +2184,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
+    cc->get_pc = arm_cpu_get_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 05b992ff73..6900444d03 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -32,6 +32,13 @@ static void avr_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc_w = value / 2; /* internally PC points to words */
 }
 
+static vaddr avr_cpu_get_pc(CPUState *cs)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+
+    return cpu->env.pc_w * 2;
+}
+
 static bool avr_cpu_has_work(CPUState *cs)
 {
     AVRCPU *cpu = AVR_CPU(cs);
@@ -214,6 +221,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
+    cc->get_pc = avr_cpu_get_pc;
     dc->vmsd = &vms_avr_cpu;
     cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed6c781342..22f5c70f39 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,6 +35,13 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+static vaddr cris_cpu_get_pc(CPUState *cs)
+{
+    CRISCPU *cpu = CRIS_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -297,6 +304,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
+    cc->get_pc = cris_cpu_get_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index fa9bd702d6..04a497db5e 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -251,6 +251,13 @@ static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
     env->gpr[HEX_REG_PC] = value;
 }
 
+static vaddr hexagon_cpu_get_pc(CPUState *cs)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+    return env->gpr[HEX_REG_PC];
+}
+
 static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
                                             const TranslationBlock *tb)
 {
@@ -337,6 +344,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
+    cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
     cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS + NUM_VREGS + NUM_QREGS;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index a6f52caf14..e25d3db6d5 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -36,6 +36,13 @@ static void hppa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.iaoq_b = value + 4;
 }
 
+static vaddr hppa_cpu_get_pc(CPUState *cs)
+{
+    HPPACPU *cpu = HPPA_CPU(cs);
+
+    return cpu->env.iaoq_f;
+}
+
 static void hppa_cpu_synchronize_from_tb(CPUState *cs,
                                          const TranslationBlock *tb)
 {
@@ -168,6 +175,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
+    cc->get_pc = hppa_cpu_get_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1db1278a59..ad623d91e4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6824,6 +6824,14 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.eip = value;
 }
 
+static vaddr x86_cpu_get_pc(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    /* Match cpu_get_tb_cpu_state. */
+    return cpu->env.eip + cpu->env.segs[R_CS].base;
+}
+
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -7106,6 +7114,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
+    cc->get_pc = x86_cpu_get_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 941e2772bc..20a92ea56c 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -82,6 +82,14 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+static vaddr loongarch_cpu_get_pc(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    return env->pc;
+}
+
 #ifndef CONFIG_USER_ONLY
 #include "hw/loongarch/virt.h"
 
@@ -680,6 +688,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
+    cc->get_pc = loongarch_cpu_get_pc;
 #ifndef CONFIG_USER_ONLY
     dc->vmsd = &vmstate_loongarch_cpu;
     cc->sysemu_ops = &loongarch_sysemu_ops;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 25d610db21..1e902e1ef0 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -31,6 +31,13 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+static vaddr m68k_cpu_get_pc(CPUState *cs)
+{
+    M68kCPU *cpu = M68K_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -540,6 +547,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
+    cc->get_pc = m68k_cpu_get_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index aed200dcff..73af51769e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -84,6 +84,13 @@ static void mb_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.iflags = 0;
 }
 
+static vaddr mb_cpu_get_pc(CPUState *cs)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static void mb_cpu_synchronize_from_tb(CPUState *cs,
                                        const TranslationBlock *tb)
 {
@@ -391,6 +398,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
+    cc->get_pc = mb_cpu_get_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
     cc->gdb_write_register = mb_cpu_gdb_write_register;
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c15c955367..da58eb8892 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,13 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+static vaddr mips_cpu_get_pc(CPUState *cs)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+
+    return cpu->env.active_tc.PC;
+}
+
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -557,6 +564,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
+    cc->get_pc = mips_cpu_get_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 19b2409974..2b28429c08 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,6 +34,14 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+static vaddr nios2_cpu_get_pc(CPUState *cs)
+{
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+    CPUNios2State *env = &cpu->env;
+
+    return env->pc;
+}
+
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -362,6 +370,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
+    cc->get_pc = nios2_cpu_get_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &nios2_sysemu_ops;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index cb9f35f408..33cf717210 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -31,6 +31,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+static vaddr openrisc_cpu_get_pc(CPUState *cs)
+{
+    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
                                              const TranslationBlock *tb)
 {
@@ -218,6 +225,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
+    cc->get_pc = openrisc_cpu_get_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6e080ebda0..763a8431be 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7214,6 +7214,13 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.nip = value;
 }
 
+static vaddr ppc_cpu_get_pc(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+
+    return cpu->env.nip;
+}
+
 static bool ppc_cpu_has_work(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7472,6 +7479,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
+    cc->get_pc = ppc_cpu_get_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b29c88b9f0..6ca05c6eaf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -462,6 +462,18 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
+static vaddr riscv_cpu_get_pc(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    /* Match cpu_get_tb_cpu_state. */
+    if (env->xl == MXL_RV32) {
+        return env->pc & UINT32_MAX;
+    }
+    return env->pc;
+}
+
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
@@ -1154,6 +1166,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
+    cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 33;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index fb30080ac4..134b4b6bb6 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -32,6 +32,13 @@ static void rx_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+static vaddr rx_cpu_get_pc(CPUState *cs)
+{
+    RXCPU *cpu = RX_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static void rx_cpu_synchronize_from_tb(CPUState *cs,
                                        const TranslationBlock *tb)
 {
@@ -208,6 +215,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
+    cc->get_pc = rx_cpu_get_pc;
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &rx_sysemu_ops;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index c31bb2351f..df00040e95 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -88,6 +88,13 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
+static vaddr s390_cpu_get_pc(CPUState *cs)
+{
+    S390CPU *cpu = S390_CPU(cs);
+
+    return cpu->env.psw.addr;
+}
+
 static bool s390_cpu_has_work(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -297,6 +304,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
+    cc->get_pc = s390_cpu_get_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 06b2691dc4..4bafbf8596 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -34,6 +34,13 @@ static void superh_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+static vaddr superh_cpu_get_pc(CPUState *cs)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static void superh_cpu_synchronize_from_tb(CPUState *cs,
                                            const TranslationBlock *tb)
 {
@@ -261,6 +268,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
+    cc->get_pc = superh_cpu_get_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 55268ed2a1..1b2afb0cb8 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -693,6 +693,13 @@ static void sparc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.npc = value + 4;
 }
 
+static vaddr sparc_cpu_get_pc(CPUState *cs)
+{
+    SPARCCPU *cpu = SPARC_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static void sparc_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
@@ -896,6 +903,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
 #endif
     cc->set_pc = sparc_cpu_set_pc;
+    cc->get_pc = sparc_cpu_get_pc;
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f0..91b16bdefc 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -41,6 +41,14 @@ static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
     env->PC = value & ~(target_ulong)1;
 }
 
+static vaddr tricore_cpu_get_pc(CPUState *cs)
+{
+    TriCoreCPU *cpu = TRICORE_CPU(cs);
+    CPUTriCoreState *env = &cpu->env;
+
+    return env->PC;
+}
+
 static void tricore_cpu_synchronize_from_tb(CPUState *cs,
                                             const TranslationBlock *tb)
 {
@@ -176,6 +184,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
+    cc->get_pc = tricore_cpu_get_pc;
     cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index fd553fdfb5..cbbe0e84a2 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -44,6 +44,13 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+static vaddr xtensa_cpu_get_pc(CPUState *cs)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+
+    return cpu->env.pc;
+}
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
 #ifndef CONFIG_USER_ONLY
@@ -233,6 +240,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
+    cc->get_pc = xtensa_cpu_get_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
-- 
2.34.1


