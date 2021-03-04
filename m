Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHwOC-0007wk-93
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 17:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwO9-0007nu-AY; Thu, 04 Mar 2021 17:24:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwO6-0002cp-GL; Thu, 04 Mar 2021 17:24:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id h7so1846291wmf.3;
 Thu, 04 Mar 2021 14:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHP7+H+pUpBFPq7GhPyMRNWKOjnIMPvaEGxuyNvHJzs=;
 b=I3dGCnIMFZALivYxWDyIIZvhm8Lr/tUBMUiRV+I2DYDZ+ri/NKGJesaPU4RimErCNZ
 bp7OB4m0wdRpmsWyaGzrcZBAczwWqP5jbtOYLAzvm/4yexC0ZKvC//m8hdOJr+kBSgGM
 1FfSRwiKihAD7hk9GT50rvMAEh3+7qhyW7xiJ4cQpLFde4Ma7runXu0WIgeG7k+ndLTS
 1dLkIySzW0pfquwAdwywSFQ+AcqY/HdNSqlXCPgotq+sEeBgeO0w+uzR56Glm7eMtqBy
 cTubW6Qa45wbPyPTU8JlpVVEMH7pk/mGmPjeW4keIKv+Z0szWlaYENOT/2wwicP8kV3N
 aFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nHP7+H+pUpBFPq7GhPyMRNWKOjnIMPvaEGxuyNvHJzs=;
 b=EBF2oc1kJQrkUk0dOjhqRg9MNBFzloqqmdsV7/bI2QMvya6kTsEM8ZbAZ3J92aVo6e
 SmLMlHuAuhLpbZ0973RLvmVjjjTk1NZDbU3t7iRfPqlQpm7cVGPz+9TrN38y+Yu/L8sl
 p3t+BJYK7aD8mUbDY7fQfjWUOVN3Wi7PbwYSayXOE+xpfEhYSs9R47FhNq9rPAcZCZen
 fA1YBpNzlrNhPRnw0YgHw5Ke0ollzW/+0clNwvixI+atzyfGWwe4tcwHAJnIrH1Ct9li
 wLrwGvzxJEfHCDYS8EE7bBPaduW1q312Sh+G5t5Y3Zd/b41IOxJmjLDHS1CxecOPHB0G
 Sqow==
X-Gm-Message-State: AOAM533WR60qJpNV462niXcgLpTLUnZEy/W8HpntGldLreCM2bys77K+
 +Tktf/fNFPJ1UVMQtr/lBpg8gi8Id8o=
X-Google-Smtp-Source: ABdhPJxsxA17v1Gnk1btW5Iksqs5ErEa/VKmfoXpmRBTcwvAgs1B6TGV/Jbl7FGEmLku5rGipnyNTg==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr5736938wma.141.1614896642933; 
 Thu, 04 Mar 2021 14:24:02 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m132sm1400938wmf.45.2021.03.04.14.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:24:02 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [RFC PATCH v2 7/8] cpu: Move CPUClass::has_work() to TCGCPUOps
Date: Thu,  4 Mar 2021 23:23:22 +0100
Message-Id: <20210304222323.1954755-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
X-List-Received-Date: Thu, 04 Mar 2021 22:24:10 -0000

We can only check if a vCPU has work with TCG.
Restrict the has_work() handler to TCG by moving it to
the TCGCPUOps structure, and adapt all the targets.

cpu_common_has_work() is removed as being inlined in
cpu_has_work().

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- finished PPC
- check cc->tcg_ops->has_work non-null (thuth)
---
 include/hw/core/cpu.h           |  2 --
 include/hw/core/tcg-cpu-ops.h   |  4 ++++
 accel/tcg/cpu-exec.c            |  6 +++++-
 hw/core/cpu.c                   |  6 ------
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               |  3 ++-
 target/hexagon/cpu.c            |  2 +-
 target/hppa/cpu.c               |  2 +-
 target/i386/cpu.c               |  7 +------
 target/i386/tcg/tcg-cpu.c       |  6 ++++++
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/moxie/cpu.c              |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/tricore/cpu.c            |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc | 10 +++++-----
 29 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 66109bcca35..8efea289e7e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -86,7 +86,6 @@ struct AccelCPUClass;
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do.
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
  * runtime configurable endianness is currently big-endian. Non-configurable
  * CPUs can use the default implementation of this method. This method should
@@ -149,7 +148,6 @@ struct CPUClass {
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
     int reset_dump_flags;
-    bool (*has_work)(CPUState *cpu);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 72d791438c2..f5d44ba59f3 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -19,6 +19,10 @@ struct TCGCPUOps {
      * Called when the first CPU is realized.
      */
     void (*initialize)(void);
+    /**
+     * @has_work: Callback for checking if there is work to do
+     */
+    bool (*has_work)(CPUState *cpu);
     /**
      * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
      *
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index b9ce36e59e2..4e73550f981 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -451,7 +451,11 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    return cc->has_work(cpu);
+    if (cc->tcg_ops->has_work) {
+        return cc->tcg_ops->has_work(cpu);
+    }
+
+    return false;
 }
 
 static inline bool cpu_handle_halt(CPUState *cpu)
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..3110867c3a3 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -261,11 +261,6 @@ static void cpu_common_reset(DeviceState *dev)
     }
 }
 
-static bool cpu_common_has_work(CPUState *cs)
-{
-    return false;
-}
-
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
     CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
@@ -397,7 +392,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
 
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
-    k->has_work = cpu_common_has_work;
     k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index e50ae7bef06..57e88bbe7fd 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -210,6 +210,7 @@ static void alpha_cpu_initfn(Object *obj)
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
 
@@ -230,7 +231,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6d2d9f2100f..7181deee84a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2263,6 +2263,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 #ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
+    .has_work = arm_cpu_has_work,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
@@ -2291,7 +2292,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 7d0ab606ae1..7416aa805d0 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -188,6 +188,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
+    .has_work = avr_cpu_has_work,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
@@ -208,7 +209,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 4586302ba39..eef76a211f1 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -197,6 +197,7 @@ static void cris_cpu_initfn(Object *obj)
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
@@ -207,6 +208,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
@@ -286,7 +288,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index a13a941ed5b..cda63537d32 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -268,6 +268,7 @@ static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
 
 static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
+    .has_work = hexagon_cpu_has_work,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
     .tlb_fill = hexagon_tlb_fill,
 };
@@ -284,7 +285,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 5f1822b5fe6..b9437f4c534 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -135,6 +135,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
+    .has_work = hppa_cpu_has_work,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .tlb_fill = hppa_cpu_tlb_fill,
@@ -155,7 +156,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 50008431c35..464e136a072 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7171,6 +7171,7 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.eip = value;
 }
 
+/* FIXME TCG only? */
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -7213,11 +7214,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
-{
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
-}
-
 static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -7404,7 +7400,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
 
 #ifdef CONFIG_TCG
     tcg_cpu_common_class_init(cc);
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6a35aa664dc..fee8487135d 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -57,10 +57,16 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.eip = tb->pc - tb->cs_base;
 }
 
+static bool x86_cpu_has_work(CPUState *cs)
+{
+    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+}
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
+    .has_work = x86_cpu_has_work,
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 4ad253a50ec..5d18255ac83 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -214,6 +214,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
 
 static const struct TCGCPUOps lm32_tcg_ops = {
     .initialize = lm32_translate_init,
+    .has_work = lm32_cpu_has_work,
     .cpu_exec_interrupt = lm32_cpu_exec_interrupt,
     .tlb_fill = lm32_cpu_tlb_fill,
     .debug_excp_handler = lm32_debug_excp_handler,
@@ -234,7 +235,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, lm32_cpu_reset, &lcc->parent_reset);
 
     cc->class_by_name = lm32_cpu_class_by_name;
-    cc->has_work = lm32_cpu_has_work;
     cc->dump_state = lm32_cpu_dump_state;
     cc->set_pc = lm32_cpu_set_pc;
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 9b2f651213b..9c38138215f 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -506,6 +506,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
+    .has_work = m68k_cpu_has_work,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .tlb_fill = m68k_cpu_tlb_fill,
 
@@ -526,7 +527,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 4e086ab5465..809f42b5e0d 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -356,6 +356,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
+    .has_work = mb_cpu_has_work,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .tlb_fill = mb_cpu_tlb_fill,
@@ -378,7 +379,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
 
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 81030c5c407..a189710904a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -688,6 +688,7 @@ static Property mips_cpu_properties[] = {
  */
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
+    .has_work = mips_cpu_has_work,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .tlb_fill = mips_cpu_tlb_fill,
@@ -713,7 +714,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index c3de71b82fe..942804de21b 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -98,6 +98,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
 
 static const struct TCGCPUOps moxie_tcg_ops = {
     .initialize = moxie_translate_init,
+    .has_work = moxie_cpu_has_work,
     .tlb_fill = moxie_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
@@ -117,7 +118,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = moxie_cpu_class_by_name;
 
-    cc->has_work = moxie_cpu_has_work;
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 0de93cdd98f..cfd9f002436 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -211,6 +211,7 @@ static Property nios2_properties[] = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
 
@@ -232,7 +233,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 52aef277232..674e1ac0d23 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -178,6 +178,7 @@ static void openrisc_any_initfn(Object *obj)
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
+    .has_work = openrisc_cpu_has_work,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .tlb_fill = openrisc_cpu_tlb_fill,
 
@@ -197,7 +198,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6f9822bc0a1..a5de166bb3f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -584,6 +584,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
+    .has_work = riscv_cpu_has_work,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
@@ -607,7 +608,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 28d2becc32c..f5f967ff509 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -177,6 +177,7 @@ static void rx_cpu_init(Object *obj)
 
 static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
+    .has_work = rx_cpu_has_work,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .tlb_fill = rx_cpu_tlb_fill,
@@ -198,7 +199,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d57f69e7f7d..d2f897bf41a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -465,6 +465,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
+    .has_work = s390_cpu_has_work,
     .tlb_fill = s390_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
@@ -493,7 +494,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
-    cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 9d77f9cfdae..8bac001bfa4 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -227,6 +227,7 @@ static const VMStateDescription vmstate_sh_cpu = {
 
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
+    .has_work = superh_cpu_has_work,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .tlb_fill = superh_cpu_tlb_fill,
@@ -250,7 +251,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = superh_cpu_class_by_name;
-    cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index ccabe189c4a..761813ce96b 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -853,6 +853,7 @@ static Property sparc_cpu_properties[] = {
 
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
+    .has_work = sparc_cpu_has_work,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
@@ -879,7 +880,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-    cc->has_work = sparc_cpu_has_work;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index c7f8a898caf..3bc89e736b3 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -138,6 +138,7 @@ static bool tilegx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 static const struct TCGCPUOps tilegx_tcg_ops = {
     .initialize = tilegx_tcg_init,
+    .has_work = tilegx_cpu_has_work,
     .cpu_exec_interrupt = tilegx_cpu_exec_interrupt,
     .tlb_fill = tilegx_cpu_tlb_fill,
 
@@ -158,7 +159,6 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, tilegx_cpu_reset, &tcc->parent_reset);
 
     cc->class_by_name = tilegx_cpu_class_by_name;
-    cc->has_work = tilegx_cpu_has_work;
     cc->dump_state = tilegx_cpu_dump_state;
     cc->set_pc = tilegx_cpu_set_pc;
     cc->gdb_num_core_regs = 0;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 5b500b575bd..b493e3ede85 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -146,6 +146,7 @@ static void tc27x_initfn(Object *obj)
 
 static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
+    .has_work = tricore_cpu_has_work,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .tlb_fill = tricore_cpu_tlb_fill,
 };
@@ -161,7 +162,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
     cc->class_by_name = tricore_cpu_class_by_name;
-    cc->has_work = tricore_cpu_has_work;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
     cc->gdb_write_register = tricore_cpu_gdb_write_register;
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index a732b08748d..55569018296 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -124,6 +124,7 @@ static const VMStateDescription vmstate_uc32_cpu = {
 
 static const struct TCGCPUOps uc32_tcg_ops = {
     .initialize = uc32_translate_init,
+    .has_work = uc32_cpu_has_work,
     .cpu_exec_interrupt = uc32_cpu_exec_interrupt,
     .tlb_fill = uc32_cpu_tlb_fill,
 
@@ -142,7 +143,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
                                     &ucc->parent_realize);
 
     cc->class_by_name = uc32_cpu_class_by_name;
-    cc->has_work = uc32_cpu_has_work;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index badc3a26aa2..849a664a679 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -185,6 +185,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
+    .has_work = xtensa_cpu_has_work,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
@@ -208,7 +209,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index fe76d0b3773..1558de804c9 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -8633,7 +8633,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8806,7 +8805,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -9026,7 +9024,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -9241,7 +9238,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -10865,6 +10861,7 @@ static Property ppc_cpu_properties[] = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
+  .has_work = ppc_cpu_has_work,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
@@ -10878,6 +10875,7 @@ static const struct TCGCPUOps ppc_tcg_ops = {
 
 static const struct TCGCPUOps power7_tcg_ops = {
   .initialize = ppc_translate_init,
+  .has_work = cpu_has_work_POWER7,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
@@ -10891,6 +10889,7 @@ static const struct TCGCPUOps power7_tcg_ops = {
 
 static const struct TCGCPUOps power8_tcg_ops = {
   .initialize = ppc_translate_init,
+  .has_work = cpu_has_work_POWER8,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
@@ -10904,6 +10903,7 @@ static const struct TCGCPUOps power8_tcg_ops = {
 
 static const struct TCGCPUOps power9_tcg_ops = {
   .initialize = ppc_translate_init,
+  .has_work = cpu_has_work_POWER9,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
@@ -10917,6 +10917,7 @@ static const struct TCGCPUOps power9_tcg_ops = {
 
 static const struct TCGCPUOps power10_tcg_ops = {
   .initialize = ppc_translate_init,
+  .has_work = cpu_has_work_POWER10,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
@@ -10946,7 +10947,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
-    cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
     cc->dump_statistics = ppc_cpu_dump_statistics;
     cc->set_pc = ppc_cpu_set_pc;
-- 
2.26.2


