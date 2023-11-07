Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6782AC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:29:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0LAT-00087e-Sr; Tue, 07 Nov 2023 07:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9m-0006M3-66
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9e-0005E3-Vo
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:07 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9dd3f4a0f5aso607177066b.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359960; x=1699964760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ha90/Hq7XHS9/aRysWmfk7kygcTDZa2YjrZy/ilrJOc=;
 b=uDhY9spH/6Ai8iwOvLh4uZ2XM8p1UnqFJtJ43ozut29LJJMrAO/EB4fQ0vKt64B4+b
 IgJ+n5gCJoYGp6tpyh+EqonU/udVQrxnG2cbuOidbLaGkIWm3S5Kp6dHuEUiBERQaPHX
 lJYjbaSo5C4G4rD1BOReL6QQWwzpdF0LfOPkQevRaje/cPndYGz7k/79i5xhCzrik4Ko
 mGq31brLTWsqpIQ6F7oLjz8muJUNqiGAfJnBKeeZdTmdxLIfssdomQAwwtkhYO/3Qy8D
 T+QKtRSPtvfjXjt0bR4aRx0YBuokBYN3sG5u8qnZe01K9L+QHBCOTeiFVUWhZk2paSsz
 IJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359960; x=1699964760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ha90/Hq7XHS9/aRysWmfk7kygcTDZa2YjrZy/ilrJOc=;
 b=SFIYPSzDFakTTRV4m/Ze7nReqQL3inLX6stvO4IrG0lYIuM/HV4mi7jeyFU+vFuAPR
 MTKu+HmWfh0hTheo1c+SOq1UILRsOrc4myyu8X32ia0nyO3rqr8Cf5NSJxGV/pbgqgsD
 MeIe0DX6UaEKYRdGidIrzQVjW81XS6pTRLyWWvnS12Ix3fFfHQU8NxpRWblMphKF7uzU
 Det4vVzgDrpNzBSC7S3+nTDGaNDUMDIJMiS8y0uTiQeydk+4ND16hHh+KfGBesXiZDvM
 dLKFMOG2ewhEqZdCXdRlU7Y5HE793GR9WouA4Kpy1Dq2Lyr60yYjrk7QM4Aj3H4YAz3Y
 CstA==
X-Gm-Message-State: AOJu0YziS0k69ZesegSWBVZEf9ScMcPql27d0g6lu9/Jhyd9pk289wHi
 7M4XLO/l5xjP5Sl9nvVxBQvBOrXUZhcrmmYdznk=
X-Google-Smtp-Source: AGHT+IGg3rwygxtdxxt3q4bGOXOdrXVavL102HTHH9Lvr4AFm30SPraxSKFny38NHWp2wMPM8mFHNg==
X-Received: by 2002:a17:907:9603:b0:9d3:f436:6807 with SMTP id
 gb3-20020a170907960300b009d3f4366807mr17965607ejc.42.1699359960111; 
 Tue, 07 Nov 2023 04:26:00 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a1709064e4700b0099d798a6bb5sm981057ejw.67.2023.11.07.04.25.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 51/75] hw/cpu: Clean up global variable shadowing
Date: Tue,  7 Nov 2023 13:24:37 +0100
Message-ID: <20231107122442.58674-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
 bsd-user/main.c           | 2 +-
 cpu-common.c              | 6 +++---
 linux-user/main.c         | 2 +-
 target/s390x/cpu_models.c | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

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
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index c402fadf46..e6014f517e 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -118,7 +118,7 @@ void fork_end(int child)
          */
         CPU_FOREACH_SAFE(cpu, next_cpu) {
             if (cpu != thread_cpu) {
-                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+                QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
             }
         }
         mmap_fork_end(child);
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


