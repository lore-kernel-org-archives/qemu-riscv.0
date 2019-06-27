Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHR-00030n-QC
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60887)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGj-0001ny-GQ
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGh-0007k7-1o
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:00 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:36092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWGd-0006hw-V4
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:24:57 -0400
Received: by mail-pf1-f175.google.com with SMTP id r7so1412646pfl.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dzPUzTIkHxzJQoxigOG9F6jOZkqkITw8eDaqBssKL50=;
 b=dZcOHccEYERfNhC6eM3TdblMSFkg9g0frohiAbPoLehvRmMKWB0LXIdjB3frUhvXOn
 ej4qW1nJH8r/udfKAfDp7Z6m5y3VlvphsdvKjrlIdT0Ykp5xFr6pcQmOq1aQVaUA+7zk
 OhIU/y1bVOL/PmfUU5c/KO/CMa+45fE4DQ/xtVF6jqiAZJywS5nkBnxm3gGwvbj8PFgG
 RQYZAH/vadMxx9Ng0UkD0ykINJtK63W4/NJbCXcmRDHWzkuSe6SQ52P5ZtIXGRgxbJSB
 sM7kII6UygWyhczBAC8h22wzlC+XneohBwpZs4wbCX9gPD2jyNguiUfY+RAFmNo20W4f
 OTIQ==
X-Gm-Message-State: APjAAAVYB3C+60KmWAokO+aMU21xW6ObV1/GoEP2iWG5JNYaIkSQNOfU
 yjYByVZzbEeE37knTi/QEzvKw3SwemMTPw==
X-Google-Smtp-Source: APXvYqxJVrGAklmJBR35j92MhzmHsn92MFYFrhkwAKmYdWk/oKZWwyesZPjPZ7v0pCT2Q1RjAaYHmg==
X-Received: by 2002:a17:90a:bf08:: with SMTP id
 c8mr6702182pjs.75.1561649021900; 
 Thu, 27 Jun 2019 08:23:41 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id 12sm3088819pfi.60.2019.06.27.08.23.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:41 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:45 -0700
Message-Id: <20190627152011.18686-9-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.175
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:04 -0000

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


