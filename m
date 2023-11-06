Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A83C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:27:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxT4-0006L3-K8; Mon, 06 Nov 2023 06:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxT3-0006G5-Jg
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:29 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSp-00057r-Qs
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32fbf271346so1513500f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268893; x=1699873693; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1c+BV5Tpk9NJdk/9uGPTtpoehyOljryZgDubWA0xkSQ=;
 b=zJKWiuj/d1M0jet+WlNAkaoMgWmRdfR3EdQNLZpz+ZCu7OyjePrS191xn3ELHYReJk
 x1M8XyTdLIWUJ1UIpKBXixFJTwi27Oslz9aVO4so7/T7MecSVzVnOG5cDx/H4LEBLN88
 63bmMmXAojejQy7ENg6YiH5tf5RgDafCnzMB7sDI8y81IrgaZaSrX4CnXCQqjUjSgNo5
 JwTbeMJkCB2DMY7lAlvIg8zwSXZlauANiMv+ZVZBMs/tQs83nshRKOpbcKaT/8cYMLM8
 UDdN3ZgopgNOToTalUSCmGZd58j8YVnAoNuPvWXsUWwqaKjL3+uLolujTAixKdcrqfff
 W8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268893; x=1699873693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1c+BV5Tpk9NJdk/9uGPTtpoehyOljryZgDubWA0xkSQ=;
 b=G2ftlBiZNGaPDcyPP9/xLrG4PheG9RAD3SVWG29iosghsvU8ezgvAqEzgmN0agYK8p
 iwBdnGT5f7YEhzpWDn50wOeKuQeeU22jXy6p6d51qY14+qDxYMscK7a2anaf270DchK0
 S49F8wcYna7v1PKq/bxRaNucQ4D/7PcgdVYYBGm7KsNMfigc4t4qqUeszvG49pkT7Ka3
 mIgcxmSTdJGcnMQSSqt1mVMG4bqoKlvofE05YE4RIqN7irnTxTDUllDWntJqepWC085C
 KtzO1MAEMVkadg6xAvx5Zo5G8iOhemb3i4LUMs7Ehi3463BzDUICji27mXQv6OoWvfOq
 GiGQ==
X-Gm-Message-State: AOJu0YwnaWl4z31wg50+qEtrkOOhdURrt3UGEH3e0Bx5uIvdw6mVPbXW
 6jLnT+0dV7RcSv+7eXlvBF4rBQ==
X-Google-Smtp-Source: AGHT+IFUfEPgJeqeBUUqYn0HxWEHowevUtNbHp5ZBZ2R9PkQdeXdrg9oHvMCfdnh5DWjqHW4fF0gbg==
X-Received: by 2002:a05:6000:1864:b0:32f:7c4d:8746 with SMTP id
 d4-20020a056000186400b0032f7c4d8746mr24071431wri.12.1699268893422; 
 Mon, 06 Nov 2023 03:08:13 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600004d000b0032dbf99bf4fsm9290025wri.89.2023.11.06.03.08.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:08:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 40/60] hw/cpu: Clean up global variable shadowing
Date: Mon,  6 Nov 2023 12:03:12 +0100
Message-ID: <20231106110336.358-41-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Fix:

  hw/core/machine.c:1302:22: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      const CPUArchId *cpus = possible_cpus->cpus;
                       ^
  hw/core/numa.c:69:17: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      uint16List *cpus = NULL;
                  ^
  hw/acpi/aml-build.c:2005:20: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      CPUArchIdList *cpus = ms->possible_cpus;
                     ^
  hw/core/machine-smp.c:77:14: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      unsigned cpus    = config->has_cpus ? config->cpus : 0;
               ^
  include/hw/core/cpu.h:589:17: note: previous declaration is here
  extern CPUTailQ cpus;
                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20231010115048.11856-2-philmd@linaro.org>
---
 include/hw/core/cpu.h     | 8 ++++----
 cpu-common.c              | 6 +++---
 linux-user/main.c         | 2 +-
 target/s390x/cpu_models.c | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index eb943efb8f..77893d7b81 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -586,13 +586,13 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 }
 
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
-extern CPUTailQ cpus;
+extern CPUTailQ cpus_queue;
 
-#define first_cpu        QTAILQ_FIRST_RCU(&cpus)
+#define first_cpu        QTAILQ_FIRST_RCU(&cpus_queue)
 #define CPU_NEXT(cpu)    QTAILQ_NEXT_RCU(cpu, node)
-#define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus, node)
+#define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus_queue, node)
 #define CPU_FOREACH_SAFE(cpu, next_cpu) \
-    QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus, node, next_cpu)
+    QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
 
 extern __thread CPUState *current_cpu;
 
diff --git a/cpu-common.c b/cpu-common.c
index 45c745ecf6..c81fd72d16 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -73,7 +73,7 @@ static int cpu_get_free_index(void)
     return max_cpu_index;
 }
 
-CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
+CPUTailQ cpus_queue = QTAILQ_HEAD_INITIALIZER(cpus_queue);
 static unsigned int cpu_list_generation_id;
 
 unsigned int cpu_list_generation_id_get(void)
@@ -90,7 +90,7 @@ void cpu_list_add(CPUState *cpu)
     } else {
         assert(!cpu_index_auto_assigned);
     }
-    QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
+    QTAILQ_INSERT_TAIL_RCU(&cpus_queue, cpu, node);
     cpu_list_generation_id++;
 }
 
@@ -102,7 +102,7 @@ void cpu_list_remove(CPUState *cpu)
         return;
     }
 
-    QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+    QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu_list_generation_id++;
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 0c23584a96..0cdaf30d34 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -156,7 +156,7 @@ void fork_end(int child)
            Discard information about the parent threads.  */
         CPU_FOREACH_SAFE(cpu, next_cpu) {
             if (cpu != thread_cpu) {
-                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+                QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
             }
         }
         qemu_init_cpu_list();
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4dead48650..5c455d00c0 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -757,7 +757,7 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
     const S390CPUDef *def = s390_find_cpu_def(type, gen, ec_ga, NULL);
 
     g_assert(def);
-    g_assert(QTAILQ_EMPTY_RCU(&cpus));
+    g_assert(QTAILQ_EMPTY_RCU(&cpus_queue));
 
     /* build the CPU model */
     s390_qemu_cpu_model.def = def;
-- 
2.41.0


