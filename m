Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvr-0007bd-Q7
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvl-0007Ts-VV
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvk-0006Rw-NB
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvk-0006RX-I7
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id 7so2331243wme.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ObpRu4yWGJ56Lce0E8Qj/S0MZ1B/JMtbNndq30ymwo0=;
 b=NoGNCgCh/O9SwuJwHsFTSXQhfim2oXWbArdliOw06JyC0uvICRXbPmLPj+Bfu4zvi3
 9QzRnN+IhMbVnlUVlpWocCx8kfHaaUIxULh7Hc2sB9ZBY8K7zVzGlWzVVFJ2tWhK+T09
 f+DnvPqmlCrNd8SVjkZaWQTMAWTZhHwzrOwczRyx7HLVytNr6byAh420HI0jmGCbjceW
 D6pa4BQdP0VYPhwPPk7LpGvFj3YXc8zotgBp6bbzGjt3+CI37g/V65EBxzso71A2mE8F
 n4wBWwoZNYN36QWMXbKvW6HNqPxGv8y4hRRtZC8Wd2bN3cKcq8jQ6GWqA1jIodexzyLd
 qWXA==
X-Gm-Message-State: APjAAAWGm+o5P+Ewt4qfbla+AZeDpMYqhg8qNj8C8B/QK5Cko7TlCzQv
 YFptYgxi8xRfCMbiHB5Bt26VzmAVIraUjA==
X-Google-Smtp-Source: APXvYqxNqrIiqEfeTP1aB6QlMIjUB+10N7FyZyAqvpceN0arO6UlOSXNdVdzFApNV3LXtQ4yolCG8w==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr2764209wmc.30.1568190287159;
 Wed, 11 Sep 2019 01:24:47 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id j30sm24749986wrb.66.2019.09.11.01.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:46 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:35 -0700
Message-Id: <20190910190513.21160-10-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: [Qemu-riscv] [PULL 09/47] riscv: rv32: Root page table address can
 be larger than 32-bit
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:53 -0000

From: Bin Meng <bmeng.cn@gmail.com>

For RV32, the root page table's PPN has 22 bits hence its address
bits could be larger than the maximum bits that target_ulong is
able to represent. Use hwaddr instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 96373b67d8..87dd6a6ece 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -186,12 +186,12 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     *prot = 0;
 
-    target_ulong base;
+    hwaddr base;
     int levels, ptidxbits, ptesize, vm, sum;
     int mxr = get_field(env->mstatus, MSTATUS_MXR);
 
     if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        base = get_field(env->satp, SATP_PPN) << PGSHIFT;
+        base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
         sum = get_field(env->mstatus, MSTATUS_SUM);
         vm = get_field(env->satp, SATP_MODE);
         switch (vm) {
@@ -211,7 +211,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
           g_assert_not_reached();
         }
     } else {
-        base = env->sptbr << PGSHIFT;
+        base = (hwaddr)(env->sptbr) << PGSHIFT;
         sum = !get_field(env->mstatus, MSTATUS_PUM);
         vm = get_field(env->mstatus, MSTATUS_VM);
         switch (vm) {
@@ -249,7 +249,7 @@ restart:
                            ((1 << ptidxbits) - 1);
 
         /* check that physical address of PTE is legal */
-        target_ulong pte_addr = base + idx * ptesize;
+        hwaddr pte_addr = base + idx * ptesize;
 
         if (riscv_feature(env, RISCV_FEATURE_PMP) &&
             !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
@@ -261,7 +261,7 @@ restart:
 #elif defined(TARGET_RISCV64)
         target_ulong pte = ldq_phys(cs->as, pte_addr);
 #endif
-        target_ulong ppn = pte >> PTE_PPN_SHIFT;
+        hwaddr ppn = pte >> PTE_PPN_SHIFT;
 
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
-- 
2.21.0


