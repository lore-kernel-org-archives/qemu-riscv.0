Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31968C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:06:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33M7-0007TB-H5; Tue, 14 Nov 2023 19:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Ls-0007IO-Q4
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Lq-0008Ds-Ev
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFAFhxRfroIsfxn23HJWeW06LXJGCEmhPBiImG7e8Nk=;
 b=ihNRULnH63Gb/x2WBc4SpchMmhcw/6VGdc342wxiQJs8BXNqNCmR4Vl7C+9LIjA4BQXPtR
 YF6+R4VIv5ydvI9sm7/yuMDDgi1E/eV3S5DtiMAkxmOfPNxVgX4Yew7MEJXYnEm9PRv2s2
 bNyYKK/MyZBkn2l7C3TRBt4/CYndRwE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-MIfYUSP1P6yl4iPFHj5sGw-1; Tue,
 14 Nov 2023 19:01:46 -0500
X-MC-Unique: MIfYUSP1P6yl4iPFHj5sGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 294191C03141;
 Wed, 15 Nov 2023 00:01:43 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E865C15885;
 Wed, 15 Nov 2023 00:01:29 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 21/31] target/xtensa: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:18 +1000
Message-ID: <20231114235628.534334-22-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-xtensa -cpu ?
Available CPUs:
  test_mmuhifi_c3
  sample_controller
  lx106
  dsp3400
  de233_fpu
  de212
  dc233c
  dc232b

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-xtensa -cpu ?
Available CPUs:
  dc232b
  dc233c
  de212
  de233_fpu
  dsp3400
  lx106
  sample_controller
  test_mmuhifi_c3

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/xtensa/cpu.h          | 10 +---------
 target/xtensa/helper.c       | 19 +++----------------
 target/xtensa/overlay_tool.h |  7 ++-----
 3 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index dd81729306..ffeb1ca43f 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -491,11 +491,6 @@ typedef struct XtensaConfig {
     bool use_first_nan;
 } XtensaConfig;
 
-typedef struct XtensaConfigList {
-    const XtensaConfig *config;
-    struct XtensaConfigList *next;
-} XtensaConfigList;
-
 #if HOST_BIG_ENDIAN
 enum {
     FP_F32_HIGH,
@@ -600,8 +595,6 @@ G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
 
-#define cpu_list xtensa_cpu_list
-
 #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
 
 #if TARGET_BIG_ENDIAN
@@ -620,13 +613,12 @@ void xtensa_collect_sr_names(const XtensaConfig *config);
 void xtensa_translate_init(void);
 void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
 void xtensa_breakpoint_handler(CPUState *cs);
-void xtensa_register_core(XtensaConfigList *node);
+void xtensa_register_core(XtensaConfig *config);
 void xtensa_sim_open_console(Chardev *chr);
 void check_interrupts(CPUXtensaState *s);
 void xtensa_irq_init(CPUXtensaState *env);
 qemu_irq *xtensa_get_extints(CPUXtensaState *env);
 qemu_irq xtensa_get_runstall(CPUXtensaState *env);
-void xtensa_cpu_list(void);
 void xtensa_sync_window_from_phys(CPUXtensaState *env);
 void xtensa_sync_phys_from_window(CPUXtensaState *env);
 void xtensa_rotate_window(CPUXtensaState *env, uint32_t delta);
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index dbeb97a953..3654739b09 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -35,8 +35,6 @@
 #include "qemu/qemu-print.h"
 #include "qemu/host-utils.h"
 
-static struct XtensaConfigList *xtensa_cores;
-
 static void add_translator_to_hash(GHashTable *translator,
                                    const char *name,
                                    const XtensaOpcodeOps *opcode)
@@ -187,17 +185,15 @@ static void xtensa_core_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = config->gdb_regmap.num_regs;
 }
 
-void xtensa_register_core(XtensaConfigList *node)
+void xtensa_register_core(XtensaConfig *config)
 {
     TypeInfo type = {
         .parent = TYPE_XTENSA_CPU,
         .class_init = xtensa_core_class_init,
-        .class_data = (void *)node->config,
+        .class_data = (void *)config,
     };
 
-    node->next = xtensa_cores;
-    xtensa_cores = node;
-    type.name = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), node->config->name);
+    type.name = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), config->name);
     type_register(&type);
     g_free((gpointer)type.name);
 }
@@ -234,15 +230,6 @@ void xtensa_breakpoint_handler(CPUState *cs)
     }
 }
 
-void xtensa_cpu_list(void)
-{
-    XtensaConfigList *core = xtensa_cores;
-    qemu_printf("Available CPUs:\n");
-    for (; core; core = core->next) {
-        qemu_printf("  %s\n", core->config->name);
-    }
-}
-
 #ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
                                     vaddr addr, MMUAccessType access_type,
diff --git a/target/xtensa/overlay_tool.h b/target/xtensa/overlay_tool.h
index 701c00eed2..7373ba7592 100644
--- a/target/xtensa/overlay_tool.h
+++ b/target/xtensa/overlay_tool.h
@@ -450,13 +450,10 @@
 #endif
 
 #if TARGET_BIG_ENDIAN == (XCHAL_HAVE_BE != 0)
-#define REGISTER_CORE(core) \
+#define REGISTER_CORE(config) \
     static void __attribute__((constructor)) register_core(void) \
     { \
-        static XtensaConfigList node = { \
-            .config = &core, \
-        }; \
-        xtensa_register_core(&node); \
+        xtensa_register_core(&config); \
     }
 #else
 #define REGISTER_CORE(core)
-- 
2.41.0


