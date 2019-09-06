Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Gyy-00050b-Pu
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gyr-0004p0-8g
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gyp-0004az-C8
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:21:01 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39977)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6Gyh-0004WG-JU; Fri, 06 Sep 2019 12:20:51 -0400
Received: by mail-pf1-x441.google.com with SMTP id x127so4825864pfb.7;
 Fri, 06 Sep 2019 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=mpOBZsfANLx4jYRLNgFN6PX8rKpeoYKm0YW6RSuKwR8=;
 b=BQSN9DZbERXfeUIxyg4qWMjPzZXlgzR1b8RV9ZYGRLl6x8d1Zt2X2EcMi7316rfmw6
 0g3B9VY8xpKXoLAEzac2icG+ocjIsZW54g5v4JAPCHYMwfR8gGfLzP93soM5uM5UChvD
 eZ4ov2mCiPEA6V7ojrBHnA5mEeGqvjwxoeneoXzvQCSdNBK562fimUghY/knk3S3Fbkw
 0DpYNm+NT0AaiXuxL73ny2BlByzcmLPld6A5SJU7zQvENuQlIIpLB3NcuYoIS3UGocsz
 HOMan3dLqpsuzAoxykYkjSjDJs+/yo1EXzL5zuXJhz2s7uQisnQ6HQwCe/4/v6UpKvD3
 fr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=mpOBZsfANLx4jYRLNgFN6PX8rKpeoYKm0YW6RSuKwR8=;
 b=rkcrWah2h0USqGOcJemVwqrX9QuDGtVg3cfmjZYx4XrPUPFKUbdtDQpy/dGAG3R+YC
 eZlqBmsIOwFDekxsg5HnNyM/kqvCN4kK+9QBJub8dhwgssF4K9+pRXm5K/xHnNDcwqXI
 sbNrtMZ5chTCytf3dq4IHdkt2Ll4nlZAy6UZR6Rp1DH9n1FzmhddTbo7NzMX0DATz/f2
 ExtJ4CBAcU9KgXgnWbjUFXdWwYHVADe2O+a96QN6lMRHGf7DRwINenhcCgkw3oFp1cQB
 DlIx6tLa95cLJkO3mpCv2+EMzClC68I5R1NUFB2mhT/glpcKxt7LzEq36vHDkwRdxyN+
 3uHg==
X-Gm-Message-State: APjAAAWnrCACbpiNlI7Im0ndq085+xvrOGrpsIu43r7Jl4bJH9l2yxHK
 MkAeaU6cL5NqIidUF8cpvE0=
X-Google-Smtp-Source: APXvYqxEndgRUJdfwMPP5C8xUjNyybCWWVzfnxHqcD7fcvkKIPdpcHZMI/Hg2um9uB7b8nS5jK1kjQ==
X-Received: by 2002:a63:2349:: with SMTP id u9mr5995052pgm.214.1567786850602; 
 Fri, 06 Sep 2019 09:20:50 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.49
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:20:12 -0700
Message-Id: <1567786819-22142-26-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PATCH v8 25/32] riscv: sifive_u: Update UART base
 addresses and IRQs
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
X-List-Received-Date: Fri, 06 Sep 2019 16:21:06 -0000

This updates the UART base address and IRQs to match the hardware.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- update IRQ numbers of both UARTs to match hardware as well

Changes in v2: None

 hw/riscv/sifive_u.c         | 4 ++--
 include/hw/riscv/sifive_u.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ea21095..a3ee1ec 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -62,8 +62,8 @@ static const struct MemmapEntry {
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
     [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
-    [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
-    [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
+    [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
+    [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index bb46745..7dfd1cb 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -65,8 +65,8 @@ enum {
 };
 
 enum {
-    SIFIVE_U_UART0_IRQ = 3,
-    SIFIVE_U_UART1_IRQ = 4,
+    SIFIVE_U_UART0_IRQ = 4,
+    SIFIVE_U_UART1_IRQ = 5,
     SIFIVE_U_GEM_IRQ = 0x35
 };
 
-- 
2.7.4


