Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvYW1-0000Lt-Ma
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 22:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33443)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvYVz-0000IC-4L
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 22:50:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvYVx-0007RO-V2
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 22:50:55 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvYVt-0007P1-R7; Wed, 07 Aug 2019 22:50:50 -0400
Received: by mail-pf1-x443.google.com with SMTP id f17so39213883pfn.6;
 Wed, 07 Aug 2019 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=MEY23tj3FXe9ybdCBXoqAcmhF9Bqo5UZJscRu4cbUuc=;
 b=B6d0rf5hd9CYP9oe3XObusydn4RUrl/T4kVgi0oG0UCUhbmox7UVON8c9g4FufI+WR
 1BIfl7Mkyk4x0+oh4JsQSWxjw6PS2NHnCKu1WEPkkMFqOYAvmm3l3SfNGof5XcsUSe2d
 JTQ5yACLAeB/G0hawNn7cGgkTZCjiWl001Pa8taDY9D5b9kLWbZXbqNvIbuDKXUdogdQ
 0yGXNfvlTP63NyvH2h1QZX3XbUowsNNobghSsYD3NIaE99YBNm6LyHJ7nYHXzwggiTNT
 dS3/DPa/Ujf7JkKKgiBIjyWZVE9tcWEy5XsYEqXLFkbh7YBxu3e3B9oh6LcXygjdtIID
 CKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=MEY23tj3FXe9ybdCBXoqAcmhF9Bqo5UZJscRu4cbUuc=;
 b=k0ekJNW67OgkeThlC0GinS2cDUVKf8uvIV8lR1u5j/+sqVAOB0DBxT6TqtxHV3Kv3Y
 tYo2HCYFeI19KohZ4sbuZ89fHL1Id5ynJdjnT8kq6SXaDVD1v+fNejb8fghL+Vjt5m8n
 9Kegnw4hYhHJVDtfg5uehJB0ZF5H4Vpg4kjA3CWqd0z8noDYS1D9D/pHhijJunA0IZc2
 /IrFg7INoD+k+HhvuAre5h0MS7a5jSVvpazMFSmBuTXGq15jAnlPRd3LZNcPWcB5tk+J
 pXzzebYgoCahlePcVFcMWy5iaUuEvryfCLpOrOqICOEHUiRg2VfaVStCyHpY3q7EbyKF
 PGwQ==
X-Gm-Message-State: APjAAAUqm5hTsnIvPGpeR9MMFevivvfPYEJ2ywP6VEVf2Jiwdx3LMf5k
 8JuUI0SPz1VNPagmtWq5dU0=
X-Google-Smtp-Source: APXvYqxYNyHTsewdBL4VTaw7ocNWXUjHB70ACk4DdXh2PBxabWqFTGOK37KsYIJdT7IvcEUJPU1rnA==
X-Received: by 2002:a62:e403:: with SMTP id r3mr12258743pfh.37.1565232645639; 
 Wed, 07 Aug 2019 19:50:45 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id a1sm63456777pgh.61.2019.08.07.19.50.44
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 19:50:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 19:49:30 -0700
Message-Id: <1565232570-29296-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
References: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-riscv] [PATCH v2] riscv: rv32: Root page table address can be
 larger than 32-bit
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
X-List-Received-Date: Thu, 08 Aug 2019 02:50:56 -0000

For RV32, the root page table's PPN has 22 bits hence its address
bits could be larger than the maximum bits that target_ulong is
able to represent. Use hwaddr instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- promote ppn, env->satp/env->sptbl to hwaddr otherwise the page
  table base will not be correctly calculated

 target/riscv/cpu_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e32b612..b2b4f3a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -176,12 +176,12 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
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
@@ -201,7 +201,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
           g_assert_not_reached();
         }
     } else {
-        base = env->sptbr << PGSHIFT;
+        base = (hwaddr)(env->sptbr) << PGSHIFT;
         sum = !get_field(env->mstatus, MSTATUS_PUM);
         vm = get_field(env->mstatus, MSTATUS_VM);
         switch (vm) {
@@ -239,7 +239,7 @@ restart:
                            ((1 << ptidxbits) - 1);
 
         /* check that physical address of PTE is legal */
-        target_ulong pte_addr = base + idx * ptesize;
+        hwaddr pte_addr = base + idx * ptesize;
 
         if (riscv_feature(env, RISCV_FEATURE_PMP) &&
             !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
@@ -251,7 +251,7 @@ restart:
 #elif defined(TARGET_RISCV64)
         target_ulong pte = ldq_phys(cs->as, pte_addr);
 #endif
-        target_ulong ppn = pte >> PTE_PPN_SHIFT;
+        hwaddr ppn = pte >> PTE_PPN_SHIFT;
 
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
-- 
2.7.4


