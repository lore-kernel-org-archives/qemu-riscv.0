Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfAt-0002Vp-NZ
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAr-0002P1-5m; Thu, 22 Apr 2021 15:39:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAp-0005MD-Jw; Thu, 22 Apr 2021 15:39:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so3738424wmi.5; 
 Thu, 22 Apr 2021 12:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kR/07YuyIEQWuHZD87qpk3O+O1bGxZyn441vbmFYrqk=;
 b=B61HVxiHPvc2L1Q3rWC05ArMLEC43GpyOd0QNbmsgh0jYMsLaJgyRnSufjZCxpCZfc
 QeaDb5jYj1O4HVDDsPP0FyykEPfXuebljtGPmWaZZpNPdg1zPlQXSPLne8wo5g+rhgqL
 MSxc6R2OuWrGvoRkhmaLycS9PYT6d2EUF5jdtBJKfPt+nWNHjKHav8DKAXHzTGAnWvBX
 vly7gcCrJDfF5HdaQ3Hwbqt+Fr+1KmHeaWSJCGtdlY68hzmwF0VzTJkD0K1/dHPMv69R
 BL4NPQNRM0xwuG0m0vgDrK75saORy2Og6N6BaBWsgI3u+ag3JoaGI6cpC8Fc8qakhxxl
 m6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kR/07YuyIEQWuHZD87qpk3O+O1bGxZyn441vbmFYrqk=;
 b=O35nyxCwN0PU08lfeCKsMbwBGcEBPB6rOut3G5bD7Lv52egvzF7k8z7c7VTbJG3Vq5
 mp1Qkq6Q9TEjOylsK9iUwmFP9TRXUlk6krUD2VzbBBGmVWag5vypps2hhxH4eiG+Tv+I
 RMC66n4/Df4h10JNuULV5shc/BSAXIF8bzyLLNZEnk6ehH8xfaxMmwZTBalI5h1MlmYS
 /GbUFKTsUgCra7M93VJotjKQ5C6VpWtyx0Iy5kmJLtBTlmfL3mDNJVGUP3xEYbcR7Shd
 2Iy468ttFnv/w819+pe+VcENyIsEe2tDPGuIPP/+XaW6L9z1x2hVaJ2w63BSiV+8GVB4
 hX5w==
X-Gm-Message-State: AOAM530/4IJhKqaWuzXjmCd6v3A80u3nMZJOozU97BUL+aS1o3ouB4ev
 bWvZsUbp9OCKoV24V7DHmIJkzdmE4X8S0A==
X-Google-Smtp-Source: ABdhPJzk+c0E3j8WXodKdxjcpUdgd3h2Ptl8ACAVLC1Zse3Q3pZjVjVabU66yn5XYMaQ5ZckFQVqrg==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr1754764wmk.112.1619120375904; 
 Thu, 22 Apr 2021 12:39:35 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s14sm5052614wrm.51.2021.04.22.12.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v6 06/18] cpu: Assert DeviceClass::vmsd is NULL on user
 emulation
Date: Thu, 22 Apr 2021 21:38:50 +0200
Message-Id: <20210422193902.2644064-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:41 -0000

Migration is specific to system emulation.

Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
and assert in cpu_exec_realizefn() that dc->vmsd not set under
user emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c                  | 1 +
 target/sh4/cpu.c       | 5 +++--
 target/unicore32/cpu.c | 4 ++++
 target/xtensa/cpu.c    | 4 +++-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/cpu.c b/cpu.c
index bfbe5a66f95..4fed04219df 100644
--- a/cpu.c
+++ b/cpu.c
@@ -138,6 +138,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
+    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);
     assert(cc->vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f8..35d4251aaf3 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -218,10 +218,12 @@ static void superh_cpu_initfn(Object *obj)
     env->movcal_backup_tail = &(env->movcal_backup);
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -257,12 +259,11 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_sh_cpu;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 59;
-
-    dc->vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 0258884f845..a74ac7b6140 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -115,10 +115,12 @@ static void uc32_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_uc32_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -146,7 +148,9 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
+#ifndef CONFIG_USER_ONLY
     dc->vmsd = &vmstate_uc32_cpu;
+#endif
     cc->tcg_ops = &uc32_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c1..a66527e2d45 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -176,10 +176,12 @@ static void xtensa_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -216,9 +218,9 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_xtensa_cpu;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    dc->vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
-- 
2.26.3


