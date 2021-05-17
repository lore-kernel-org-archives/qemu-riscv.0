Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liarR-00067D-H1
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarP-0005xS-0n; Mon, 17 May 2021 06:52:31 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarN-0006hd-BZ; Mon, 17 May 2021 06:52:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id b7so2714319wmh.5;
 Mon, 17 May 2021 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=numJYWQfN9cjP4y3FBe1McH7f7YrqdT6BscR7duwZVs=;
 b=PjPIsEmrl335FJg+p+NxwQla9zW8A5KcKXnlX0P1PCNzYPtTQOTNAltDsuUQ+UATZ6
 GWNhnGQY3iCRH0E3fSh5VcxfGfdikuMZfyoovt7O2NODXr5ZzV2/UfQVLeEehANfLgGo
 yN5EceicQeG3ghsmcB/fwMLa/4zSmvFAsu4u64/mS3a0uzwAmCTtuxoCOU1egTRdv9aP
 QQAs4Jw7OkwmbxSL4UZV8zFgKaBD4J26div+p/ddz8P68LVFttmIHcl7LL6eVCH94KkN
 Y3sGMJB6NxxW6Lv75q6F/+5+W57Wt1fPGTBOMWFORxLgg/JZifflZHvZ6WlgxOu5A3/D
 qWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=numJYWQfN9cjP4y3FBe1McH7f7YrqdT6BscR7duwZVs=;
 b=RZX2z1i+bwaMnoC2z2m4IXXDFZoNMmLndjs1TlNCnQkZdb3JMr/hxKXMFPyR7YdsKF
 UkpSKZne3zgaJZr/uyOwaaSfvmZ+zkDsqzA5r7cF557uUagdN6PHT0xmldylPCV1y6ai
 i1aux8KftAuufjOtie8zDZf9JLvctPLYrmRcYLSjRt78QYxhcuTVXvVJf65wthYySJD1
 UkUU5BqcSlneIAyyJgECyYPd7Da2h1Ypesw28KT4mNuNj9DJrGIsEdz7/vhXsYgU7C0t
 t/tQKE4bdTMpIefq6iNLij0AifhTu0NE32wcdnRHv3/6dkz12DTUkQU35WLSri3mfNDx
 y8LQ==
X-Gm-Message-State: AOAM531qPrQlcT+dJo9u6jvhLgq1BDwcdh0YPvCpNLx8TH8nzMW0y0xI
 V+zZdUziSYd6ml86W7oE/kDprMTBXZh19Q==
X-Google-Smtp-Source: ABdhPJy3zXW8JzQyPPM0JT0plWT+oXbAu0+OlSmfl+DZ6r9raOTZPH9wTTipZrhs42HF9vg4dfzVDA==
X-Received: by 2002:a1c:a7c2:: with SMTP id
 q185mr32839778wme.112.1621248746260; 
 Mon, 17 May 2021 03:52:26 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c15sm17019645wrd.49.2021.05.17.03.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 09/23] cpu: Directly use get_paging_enabled() fallback
 handlers in place
Date: Mon, 17 May 2021 12:51:26 +0200
Message-Id: <20210517105140.1062037-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:52:32 -0000

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu-common.c | 13 -------------
 hw/core/cpu-sysemu.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5913ffe22be..2aa6b8cffca 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,18 +66,6 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
-bool cpu_paging_enabled(const CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return cc->get_paging_enabled(cpu);
-}
-
-static bool cpu_common_get_paging_enabled(const CPUState *cpu)
-{
-    return false;
-}
-
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp)
 {
@@ -316,7 +304,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 7f3a3574943..931ba46354d 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -22,6 +22,17 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 
+bool cpu_paging_enabled(const CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_paging_enabled) {
+        return cc->get_paging_enabled(cpu);
+    }
+
+    return false;
+}
+
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-- 
2.26.3


