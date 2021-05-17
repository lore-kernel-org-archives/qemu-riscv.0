Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liarX-0006Va-Cu
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarU-0006Ks-QX; Mon, 17 May 2021 06:52:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarS-0006ke-Aa; Mon, 17 May 2021 06:52:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o127so3298792wmo.4;
 Mon, 17 May 2021 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUBQ2jpiST+SjMtXV19Tr50fj7IFpfqAc4jPduflUQA=;
 b=nWQ7/CEDtfWl1LXldVPc9K5bALGvFIUBV6ph6/N8+ChrQW23KFZp5MpgMQLYwj5Tgz
 xisu6owmQlGD3f5LKGqNpPUpQCH0/UcmkyriF/I9yAMLgOKbhJxeGz5AXUzZn2c+YyTO
 uzJFIVk+EkNUdQB6T7YsRZjrs4VhABYwv89ZQlrocLX2R4IXRBUv0YwpXMgmNnYAHJ59
 n5Oa4ACmY7PG9NPs+r34M3lPgUXekl14gSB2IyaeYkmw7Iq0gFYZW0ZKEHEPfO+liGjz
 BTpNraEeGM7OwJJn9OxNOncY9tQjHORKWtPn+8vKmcIviFICatTMUoMvoDB0/0Jr/hpD
 8G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XUBQ2jpiST+SjMtXV19Tr50fj7IFpfqAc4jPduflUQA=;
 b=cMznoKQoPPt9koWX0aZ946HcS59PEk86JRPLzI2gsmuqNHzvIk1JvZt8qSRM5vIVW7
 56+QuI3WI35lX4PjYwLw1wGM5WjCc2hs6BajHJ1Eptci+JFz+Pu/Cq8SYX1ZHDi+L622
 hF4RiiBodJm0D261qHYw0qO+L8c3hp7EHlrx8lX1Qhanf/XQm5IX/vkL0Gr68gjVsDI4
 G+PuLFwVF0fgGcAQ/rOEL8fg72qClkcG1BxbLScu9o9qGhaECdZKa6RKhohA/RHFMqDs
 gREf/Atau7jsMlqGhnCubovI0obiJvCTc1ZldLvia6mSRY2lUwsJDfPPMUgZb5KmG3oc
 mORw==
X-Gm-Message-State: AOAM532YbHsX+VcPPyzI0sRMzcM4hDszaVlqBamEEemsyK1Qj2KOfEyw
 DZGZVxixFlHwindxNlUyWVeoIwiW7LyDTA==
X-Google-Smtp-Source: ABdhPJzIkw5diq4X5Z2elTFmNxSCJz+e8KNJZlWO7KlXhKmhaz5YLGhd1xq1Ffj6YkNca7lf/DxgQQ==
X-Received: by 2002:a1c:4043:: with SMTP id n64mr19203312wma.9.1621248751005; 
 Mon, 17 May 2021 03:52:31 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s18sm6373966wra.80.2021.05.17.03.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 10/23] cpu: Directly use get_memory_mapping() fallback
 handlers in place
Date: Mon, 17 May 2021 12:51:27 +0200
Message-Id: <20210517105140.1062037-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:52:37 -0000

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu-common.c | 16 ----------------
 hw/core/cpu-sysemu.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 2aa6b8cffca..9530e266ecb 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,21 +66,6 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
-void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
-                            Error **errp)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->get_memory_mapping(cpu, list, errp);
-}
-
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
-    error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
-}
-
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
@@ -304,7 +289,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 931ba46354d..aa68ca281e8 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -33,6 +33,19 @@ bool cpu_paging_enabled(const CPUState *cpu)
     return false;
 }
 
+void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
+                            Error **errp)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
+
+    error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
+}
+
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-- 
2.26.3


