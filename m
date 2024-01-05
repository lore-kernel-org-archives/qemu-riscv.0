Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B3C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:44:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmMf-0004ov-4z; Fri, 05 Jan 2024 10:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMX-0004f2-2A
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:58 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMV-0003Bh-9j
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e353c8d75so14559855e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469434; x=1705074234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woqU0CJbLpbBNTO5d7sFgz50JLFq3nMIZ0ht3SRJ1YE=;
 b=xSpH4fYkHdsPRicQUBBr9yk+JuKO+SmbCrl1mHawHDzs73/ZTgDaMs9ug/h5bG6sC/
 jMvOYRWaF5Kjz0YAtG94CQS0/wLiZx0jMnWALgBH1yMluVYF12j2RuLShZKfWl5bHce1
 lX2wuo+HsFcrOwjVp3RbwJWT03fXukqPB6dKVmCy2FdQ5GoVpJGn0IPWlQJWu0s4uH9M
 rZTbNjmh4nA0zZBjG5LfP5M/nIKGJEjKJQn1vdGl9Va170gWDXkqZ1BclqLdf67nOC8c
 sOn4x/gXWdO1iSn/TW5V9AEDvH6I5kE6gKMJr2h4MKfT61DbzM23GbNvjrGL2TT5MTmH
 gcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469434; x=1705074234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=woqU0CJbLpbBNTO5d7sFgz50JLFq3nMIZ0ht3SRJ1YE=;
 b=aGRe0dAebGVJC9CXM/DFlp2Wz1uGKyJFyDLU7ZjonEJbTPUcStbzdVrl0zU8UfGZo/
 ux6VoBxaVq5rpg4/Z6W+UNL82R7sS7VkiikwrzTeggtcm4LBFlMiiIsexqqzTkDmeDGA
 vA1jkSJ+wrc8DNSa+OvL47S3RbJ5TUL2wX8J4qGX2aEVL7pWRAT8s3CipmO7uSYwKif4
 Rnjcn+RajCHF8FhvxsHphen/VOk8B92/UHHhyaZlbbuHbx+dQ7QKKkFVLRddMhQCIGa7
 8Zm6aHGVuwYn3BvJC3ZOz7/u5/i+lxSqN6IInWT0Q/xeglylI+1yWKkJ+wsVt16+DsW0
 9r+Q==
X-Gm-Message-State: AOJu0YzbboILtrTK1NVUHK9LzJRjypS/rVee75wLU5mV3KlnjH8iJE+C
 UtjEDoJvvGT0w9mJchC9VhohUaWsUM/dVg==
X-Google-Smtp-Source: AGHT+IEeRcFLbKk4dFeAmeBvJcSygmKaaj/1gLM6njWmdPg6vzuBbto2c0jdOLbPMEUjorS5a5yEaA==
X-Received: by 2002:a7b:cbd9:0:b0:40d:62f6:5d51 with SMTP id
 n25-20020a7bcbd9000000b0040d62f65d51mr1336159wmi.127.1704469434059; 
 Fri, 05 Jan 2024 07:43:54 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b0040e3ac9f4c8sm898004wmp.28.2024.01.05.07.43.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/71] target/arm: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:01 +0100
Message-ID: <20240105154307.21385-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Gavin Shan <gshan@redhat.com>

No changes of the output from the following command before and
after it's applied.

[gshan@gshan q]$ ./build/qemu-system-aarch64 -cpu ?
Available CPUs:
  a64fx
  arm1026
  arm1136
  arm1136-r2
  arm1176
  arm11mpcore
  arm926
  arm946
  cortex-a15
  cortex-a35
  cortex-a53
  cortex-a55
  cortex-a57
  cortex-a7
  cortex-a710
  cortex-a72
  cortex-a76
  cortex-a8
  cortex-a9
  cortex-m0
  cortex-m3
  cortex-m33
  cortex-m4
  cortex-m55
  cortex-m7
  cortex-r5
  cortex-r52
  cortex-r5f
  max
  neoverse-n1
  neoverse-n2
  neoverse-v1
  pxa250
  pxa255
  pxa260
  pxa261
  pxa262
  pxa270-a0
  pxa270-a1
  pxa270
  pxa270-b0
  pxa270-b1
  pxa270-c0
  pxa270-c5
  sa1100
  sa1110
  ti925t

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-9-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h    |  3 ---
 target/arm/helper.c | 46 ---------------------------------------------
 2 files changed, 49 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0282e0d28..8c3ca2e231 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2737,7 +2737,6 @@ static inline bool access_secure_reg(CPUARMState *env)
                        (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)), \
                        (_val))
 
-void arm_cpu_list(void);
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
@@ -2840,8 +2839,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
 
-#define cpu_list arm_cpu_list
-
 /* ARM has the following "translation regimes" (as the ARM ARM calls them):
  *
  * If EL3 is 64-bit:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fc546df5c7..a2a7f6c29f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9468,52 +9468,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #endif
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void arm_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CPUClass *cc = CPU_CLASS(oc);
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", name);
-    } else {
-        qemu_printf("  %s\n", name);
-    }
-    g_free(name);
-}
-
-void arm_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    list = g_slist_sort(list, arm_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, arm_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 /*
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
-- 
2.41.0


