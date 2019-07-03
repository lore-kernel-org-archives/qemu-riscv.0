Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapU-0005m9-QG
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51241)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapS-0005fZ-69
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapR-0006bT-4E
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:26 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:36636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapQ-0006YM-SE
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:25 -0400
Received: by mail-lf1-f46.google.com with SMTP id q26so1168543lfc.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dzPUzTIkHxzJQoxigOG9F6jOZkqkITw8eDaqBssKL50=;
 b=aMdGc1ZnJAxBUO1UhlqsAa9h9ZWWCjfqt2zx5LsPaP0vur6oCx/j/0oom2BUXnPqP4
 JiLcq9wGeguga/VLfjtjVmSr1YH35Fe9nPsjTN9elNvWbWywNuO1787N33UBCAYD1n+1
 cscOPNT/NR9UjhrNQBmhJ62weUvWPh1Ng+lrLJynhwa7Atg9rOGyz5dpXEv3+QVzF9il
 Umg9I/Ap9T3h5SmSyYMNp75JmLUYwvnksAda3c5n/XFwMaxUdYeWVrlOV3S5JETYFUW9
 Yjh9y/IBJK6ql9+V0TtXf4XvUnPiRo7PYo9l0gqQxG64wM1iBaUqBYHPaeJic+IclqLk
 2V/Q==
X-Gm-Message-State: APjAAAWLiw/J3fq4Vp6jq3plzC0lDhfp5zGtOkp69o0RVDrEmPMIIewF
 9KXyM8yBQgTXKOBi7zYXZyUZKw==
X-Google-Smtp-Source: APXvYqwLmq9ga6+zRwZtr10y42bkJHzDWQxXSTvT9gd7QaclDaEz+7p88BjxmSnFpQuIoHHEgJOxGg==
X-Received: by 2002:a05:6512:1d2:: with SMTP id
 f18mr16873535lfp.173.1562143283232; 
 Wed, 03 Jul 2019 01:41:23 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id t28sm291190lfp.69.2019.07.03.01.41.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:22 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:24 -0700
Message-Id: <20190703084048.6980-9-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.46
Subject: [Qemu-riscv] [PULL 08/32] RISC-V: Check PMP during Page Table Walks
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:27 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

The PMP should be checked when doing a page table walk, and report access
fault exception if the to-be-read PTE failed the PMP check.

Suggested-by: Jonathan Behrens <fintelia@gmail.com>
Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2e743312536b..934b71c85e13 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@ enum {
 #define PRIV_VERSION_1_09_1 0x00010901
 #define PRIV_VERSION_1_10_0 0x00011000
 
+#define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
 #define MMU_USER_IDX 3
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 71b8123b1019..66be83210f11 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -230,6 +230,12 @@ restart:
 
         /* check that physical address of PTE is legal */
         target_ulong pte_addr = base + idx * ptesize;
+
+        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
+            1 << MMU_DATA_LOAD, PRV_S)) {
+            return TRANSLATE_PMP_FAIL;
+        }
 #if defined(TARGET_RISCV32)
         target_ulong pte = ldl_phys(cs->as, pte_addr);
 #elif defined(TARGET_RISCV64)
@@ -448,8 +454,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
         mode)) {
+        ret = TRANSLATE_PMP_FAIL;
+    }
+    if (ret == TRANSLATE_PMP_FAIL) {
         pmp_violation = true;
-        ret = TRANSLATE_FAIL;
     }
     if (ret == TRANSLATE_SUCCESS) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
-- 
2.21.0


