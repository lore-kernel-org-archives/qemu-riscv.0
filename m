Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHm-0003LB-7O
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHT-00036M-8r
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHP-0008RJ-RP
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:46 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHP-0006dx-IX
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:43 -0400
Received: by mail-pg1-f193.google.com with SMTP id k13so1168560pgq.9
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=D1HIL5SBmBBlqGmn3DV7OFXg5gWo+HXWOwuA3mR3IqE=;
 b=AXwj59+OXpX2btAgJ/VUKUTEipkoY/MjcH9jv7059OlNAyVVGMHANYCp9uRNA75ZsS
 CgnabAH7uD4mAzNEK+NkXps83Qe6jKc5iCCSG6DPYDOx6VCnuWgrECglZ/8KF4eSLQH2
 yTvHy75bEd3xhtoEpgfWmrb4AzwwulnABOiovKQ6O/QkzRD5P8ACcwSPKbrO6CEmDQU1
 ZWc9MZd9+4xLcUS4uXIeJGR9yoeplbKF8PyF5z857etjd+djYMn0kmI+/IGKlJC4QpWx
 53wVyLdI/XtItgwL0xVqqyEav2f8Lth+3P5++wiadm0/4Ba+M1p8vKhUr7NaKKq/OtLA
 ma5A==
X-Gm-Message-State: APjAAAWUisfS3QYyWLL5oemSdwtOcuJRX56oXVj3tn2dGDfH14Xi0Epe
 k3uauwglYSyzVY5pwBspe+0LTRMTRQW9YQ==
X-Google-Smtp-Source: APXvYqxDaEWLLQB8fkwoK3yZU7rCX3qjMztCZ/F/6l+n7NunyB7bfU+/KEkS8baPbYJsjd/WtAiEYg==
X-Received: by 2002:a17:90a:2430:: with SMTP id
 h45mr6962496pje.14.1561649016893; 
 Thu, 27 Jun 2019 08:23:36 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id h1sm3166288pfo.152.2019.06.27.08.23.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:36 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:43 -0700
Message-Id: <20190627152011.18686-7-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: [Qemu-riscv] [PULL 06/34] RISC-V: Raise access fault exceptions on
 PMP violations
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:49 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

Section 3.6 in RISC-V v1.10 privilege specification states that PMP violations
report "access exceptions." The current PMP implementation has
a bug which wrongly reports "page exceptions" on PMP violations.

This patch fixes this bug by reporting the correct PMP access exceptions
trap values.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a45b05ef8395..ffbfaf433268 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -337,12 +337,13 @@ restart:
 }
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
-                                MMUAccessType access_type)
+                                MMUAccessType access_type, bool pmp_violation)
 {
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions =
         (env->priv_ver >= PRIV_VERSION_1_10_0) &&
-        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE;
+        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
+        !pmp_violation;
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = page_fault_exceptions ?
@@ -424,6 +425,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPURISCVState *env = &cpu->env;
     hwaddr pa = 0;
     int prot;
+    bool pmp_violation = false;
     int ret = TRANSLATE_FAIL;
 
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
@@ -438,6 +440,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
+        pmp_violation = true;
         ret = TRANSLATE_FAIL;
     }
     if (ret == TRANSLATE_SUCCESS) {
@@ -447,7 +450,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        raise_mmu_exception(env, address, access_type);
+        raise_mmu_exception(env, address, access_type, pmp_violation);
         riscv_raise_exception(env, cs->exception_index, retaddr);
     }
 #else
-- 
2.21.0


