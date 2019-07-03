Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapQ-0005a3-4G
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapO-0005UI-1F
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapM-0006QE-S3
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:21 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33128)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapM-0006Nz-K2
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so1506242ljg.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=D1HIL5SBmBBlqGmn3DV7OFXg5gWo+HXWOwuA3mR3IqE=;
 b=Sq9yBsYVPECeA7Kjj9XE++UUDzjxG7SzzyzB8U/C953yXeXvJPBKTgNtRmhCOwY+9e
 ADqLZtZJg1HB3FhDxcmsc3R+ktKykE1V4T/cWDmspFbWN1sJuIqZFskr04J/NmGCqnAx
 5O2sgMssPVlxjAMOdt7yVWbgvVkAN9vpwtJ1Rih0YNeJIzU6KsFzQsI388pPTN5pAaNR
 DbqzrwQi2DUqTYI8Fv2ifZivacsqNn/4WdpXSCoDkP+6aUwePfh1ReQ6apJtD+YKpCKL
 4ybNrtnhYd0qxuzXGfIJEXwUnFDIv+WVbVbO/6wPj3rYMy07YNMhwmaG65cuIPhfN04w
 W6iA==
X-Gm-Message-State: APjAAAUGrbsb3FzEv8yFHZtqWF+s8j6VkeOmpEG2rQF6GsBuWfOvSuFu
 cgTmLo83TI1x0aTcl20k4c1oug==
X-Google-Smtp-Source: APXvYqz0YCnSubA2q7ypKkeNwCDmJ+Mkruj38luMs43GLY2i3z0f/gK5u7QH7lWAxLU7KEPaK5dyYw==
X-Received: by 2002:a2e:9158:: with SMTP id q24mr2478639ljg.119.1562143279251; 
 Wed, 03 Jul 2019 01:41:19 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id p12sm343296lja.23.2019.07.03.01.41.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:18 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:22 -0700
Message-Id: <20190703084048.6980-7-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.196
Subject: [Qemu-riscv] [PULL 06/32] RISC-V: Raise access fault exceptions on
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:23 -0000

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


