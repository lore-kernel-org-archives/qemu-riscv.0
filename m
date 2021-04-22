Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfAe-00028D-8R
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAc-00024R-Fr; Thu, 22 Apr 2021 15:39:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAa-0005C3-Ax; Thu, 22 Apr 2021 15:39:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so16416wmh.0; 
 Thu, 22 Apr 2021 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6YQeevinF+UxncXXirBs+TNeTtBEGxrSMPU7gVD3MU=;
 b=R/moRZZ4c/y/LytyMN+wjV1mwDXDkhoT85uL0akSO41gWVv/C1vgmSDNZRwlyTLfde
 cOvNizbIUk/d6t5ZcJa1y8rNyl8aZ74AjJrbmHoYnahICZECo6Cu+lI0+DZ/nUXIPHVt
 YfQfFuTysTK2y1YPFhL0LVrP5tKrV9WWpuSPGrC/mX7FDOxA5T7waLP2REqFL0zTp1x2
 IQylqtu3R7/1EILg1Gl1JOpln3KlnZVIfwj6z4sd7bMjNcGY0N/DPUyVyi++f+H4rixv
 duCFlWwe4l5qRlSOOZnaDoFP9LRtigOjHVVwuAu2zlk1sUAo54Pnc6UHYSPLWIZftjrO
 6guQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J6YQeevinF+UxncXXirBs+TNeTtBEGxrSMPU7gVD3MU=;
 b=KQSO3AHx8F+J6MfoxXJeiHC0yDyZ6Fu4QkXPDSN92fEaSEXdieJF30JRZczg5HCi34
 /MMwS5gYPu5+V+0RZxmaQkckuQ883LhN1dn87CRviD8aU1iRiKrixNvquhZC2iyf3SmX
 rjwLjL6qgs/gEjX3kkoqhEfg0ab9fCw+9RaprQWjbIqRtxmaOZSRJZtmfuDgTA2W+cTR
 L3I2v6qTfn+Mzvx+sjRqsifKhOID3ETK8SstL1yj88auGX9YuwweB29odNZa6FhfnklH
 /fd3DYRna6nTMXd7zR+qMgfHOr9+hnS6Zm9WB8kIEH+MRJx8FhZQwsDgnKxNKfIUX3t8
 CQ6g==
X-Gm-Message-State: AOAM530DtIi1PEw7LngAY1aM3RiUpsE6uDnegXcdBpo9ePdb3Kwi+3P/
 +cSiQLdG/U13C++i71hb9cwkGlDjD1FLOw==
X-Google-Smtp-Source: ABdhPJxItIbUjNhRpmmaJBQYrpeQf7tDHu/V9XV4sBbnuZw+wZyqong/VFrRstYleBeofBXfBdXplg==
X-Received: by 2002:a1c:2857:: with SMTP id o84mr1650722wmo.181.1619120360024; 
 Thu, 22 Apr 2021 12:39:20 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c15sm5287828wrr.3.2021.04.22.12.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:19 -0700 (PDT)
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 03/18] cpu: Directly use cpu_write_elf*() fallback handlers
 in place
Date: Thu, 22 Apr 2021 21:38:47 +0200
Message-Id: <20210422193902.2644064-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:27 -0000

No code directly accesses CPUClass::write_elf*() handlers out
of hw/core/cpu.c (the rest are assignation in target/ code):

  $ git grep -F -- '->write_elf'
  hw/core/cpu.c:157:    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:171:    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:186:    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:200:    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:440:    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
  hw/core/cpu.c:441:    k->write_elf32_note = cpu_common_write_elf32_note;
  hw/core/cpu.c:442:    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
  hw/core/cpu.c:443:    k->write_elf64_note = cpu_common_write_elf64_note;
  target/arm/cpu.c:2304:    cc->write_elf64_note = arm_cpu_write_elf64_note;
  target/arm/cpu.c:2305:    cc->write_elf32_note = arm_cpu_write_elf32_note;
  target/i386/cpu.c:7425:    cc->write_elf64_note = x86_cpu_write_elf64_note;
  target/i386/cpu.c:7426:    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
  target/i386/cpu.c:7427:    cc->write_elf32_note = x86_cpu_write_elf32_note;
  target/i386/cpu.c:7428:    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
  target/ppc/translate_init.c.inc:10891:    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
  target/ppc/translate_init.c.inc:10892:    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
  target/s390x/cpu.c:522:    cc->write_elf64_note = s390_cpu_write_elf64_note;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 43 ++++++++++++-------------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index daaff56a79e..a9ee2c74ec5 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -154,60 +154,45 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf32_qemunote) {
+        return 0;
+    }
     return (*cc->write_elf32_qemunote)(f, cpu, opaque);
 }
 
-static int cpu_common_write_elf32_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf32_note) {
+        return -1;
+    }
     return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
-static int cpu_common_write_elf32_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf64_qemunote) {
+        return 0;
+    }
     return (*cc->write_elf64_qemunote)(f, cpu, opaque);
 }
 
-static int cpu_common_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf64_note) {
+        return -1;
+    }
     return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
-static int cpu_common_write_elf64_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     return 0;
@@ -437,10 +422,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->has_work = cpu_common_has_work;
     k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
-    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
-    k->write_elf32_note = cpu_common_write_elf32_note;
-    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
-    k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.3


