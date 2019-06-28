Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul6-0000Ha-I6
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54681)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukd-0008JO-6S
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukW-0000H7-Kv
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:30 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:44419)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukW-0008Tk-DF
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:24 -0400
Received: by mail-pg1-f171.google.com with SMTP id n2so2876138pgp.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dzPUzTIkHxzJQoxigOG9F6jOZkqkITw8eDaqBssKL50=;
 b=DXIOaIuFzLw3DFPqI6O3hv8sxaH4Vn50hNIWzmc0hX5A3SVZXTz3dz4OwLN/uDsHDa
 3Jp1+M8nVpmrH2vk42+t0BZJ9PuWQpUgUW63mwVymkGVkqWaRdxekzAyZZciBt826s0T
 Ti5/3xNKySjFnTC/GxZ8p0s6wsVGCZYIt2Wm5xtV7N0uvvMOQPS8w0YS6b6uXj/AgUcD
 /L9sIPs7/L9X+WkzjZ+V1Vk2j49i8wNGCG6sdWzdXIvVwKekIo9m95Pw4LWD/h5DWJK1
 YJg6yBlLoMF9vHIrPovz0AS0QyAo2h88ZxdXJPaTVWWOEax7j0KbmLwsv83TLoIen8uK
 uZqA==
X-Gm-Message-State: APjAAAVix0y2xqYRb6BhblARG+wZK8c/LOj3YBzuXWqo/eEDSgxRoh+U
 3c+uT9rHm+VjKN8saxyqC1P6Zg==
X-Google-Smtp-Source: APXvYqz3vzDp/EqRx9HDfzGkrLnZLv+y4KWaqE8j9lwkdTf60XrloxM5jg1l0uiCyALiCaOjzuGTyg==
X-Received: by 2002:a65:6454:: with SMTP id s20mr8726360pgv.15.1561743182870; 
 Fri, 28 Jun 2019 10:33:02 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id w4sm3012655pfw.97.2019.06.28.10.33.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:02 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:01 -0700
Message-Id: <20190628173227.31925-9-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.171
Subject: [Qemu-riscv] [PULL 08/34] RISC-V: Check PMP during Page Table Walks
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:36 -0000

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


