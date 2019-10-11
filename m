Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iJ47J-0000eb-OE
	for mharc-qemu-riscv@gnu.org; Fri, 11 Oct 2019 19:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iJ47H-0000eK-5T
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 19:14:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iJ47F-0001JY-DE
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 19:14:34 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:45170)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iJ47F-0001JG-5R
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 19:14:33 -0400
Received: by mail-qt1-x842.google.com with SMTP id c21so16179675qtj.12
 for <qemu-riscv@nongnu.org>; Fri, 11 Oct 2019 16:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtUDd5e/TA51h4IZxO1cpupAltRdyzMyfziFMZdbB/U=;
 b=kp4iHyo3TaywfyDOiK+F/61RdOqMWz28RUJq+PdXiO1NrDfhTErkDbHUfv7T7DBUog
 56eoIOFMtMQ6sDZgwzHDUNIpjbxQ5xVJyhP8G16BbbB1wricN8KJ7I9L6JeGEir3zccP
 lqyDfyRrhToeGaGp6m6ZBOMwUpWkObz+YDVnToCoiv/mcUDA/dqzB/WnYrVnF9NVh953
 VkAB89aNLnurH8364HssS2pz/5hMudAUTEu8Vxr+En7IJuANWCZlKXSIxZ2BV42s69Y3
 Z7yfEt/SN7b/9V6aGOEnsYwUm56op4HYcQLiuOVlf49s56itglAUta6V5JoOA6L/FVbf
 G+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtUDd5e/TA51h4IZxO1cpupAltRdyzMyfziFMZdbB/U=;
 b=cDz+311yeV3Szcv7fG6J98FSExalVx0n0nNgbhr9YOXMCWW4xAv6fn2d71vqENmnUg
 IE8OdyRRgMeaApt6MdrQiEMO+4sDgsvh4KNd2ha+HZ6XTAjJ1L4x9LHusd+9jNWVpIT2
 VEzFt1O9NM1QNdxFeb1N/r4LGhtnw1whi5CathEgY+0Gko6dIiQHmZjGK2DI7wwP4xE8
 6Yux764+EhII+8UnyuMJT+dR+7RFBnrwLdjC4TL1ciwYsjg0jFozz3rI/1n3kTb7R/E8
 el3OceWvl+qXS+9WyfWB47gcyBlL2cG2fumm397E4VhBQXiDGWDj5h9GU6kYCLORlCPG
 2UMA==
X-Gm-Message-State: APjAAAWmSlnG8mVzfaMRgUpq4VP9W6bq7qKkeJMFmMX6LBuYhtVnb1uq
 KSg8ORynUP8VpQybO3K7Zny5tw==
X-Google-Smtp-Source: APXvYqzRNlsgXmhqdup3Wb2rVu1disrPOOGbhEAj28ZsHBVFKB0kQ+GIZwMy/rvDVtwhuBL4a4QGxw==
X-Received: by 2002:ac8:550d:: with SMTP id j13mr19683509qtq.37.1570835671728; 
 Fri, 11 Oct 2019 16:14:31 -0700 (PDT)
Received: from ip-172-31-33-50.ec2.internal
 (ec2-34-206-44-154.compute-1.amazonaws.com. [34.206.44.154])
 by smtp.gmail.com with ESMTPSA id 194sm4305953qkm.62.2019.10.11.16.14.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 11 Oct 2019 16:14:30 -0700 (PDT)
From: Dayeol Lee <dayeol@berkeley.edu>
To: qemu-devel@nongnu.org
Cc: diodesign@tuta.io, Dayeol Lee <dayeol@berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv: PMP violation due to wrong size parameter
Date: Fri, 11 Oct 2019 23:14:06 +0000
Message-Id: <20191011231406.9808-1-dayeol@berkeley.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
X-List-Received-Date: Fri, 11 Oct 2019 23:14:36 -0000

riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
using pmp_hart_has_privs().
However, if the size is unknown (=0), the ending address will be
`addr - 1` as it is `addr + size - 1` in `pmp_hart_has_privs()`.
This always causes a false PMP violation on the starting address of the
range, as `addr - 1` is not in the range.

In order to fix, we just assume that all bytes from addr to the end of
the page will be accessed if the size is unknown.

Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e32b6126af..7d9a22b601 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -441,6 +441,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPURISCVState *env = &cpu->env;
     hwaddr pa = 0;
     int prot;
+    int pmp_size = 0;
     bool pmp_violation = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
@@ -460,9 +461,19 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                   "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
                   " prot %d\n", __func__, address, ret, pa, prot);
 
+    /*
+     * if size is unknown (0), assume that all bytes
+     * from addr to the end of the page will be accessed.
+     */
+    if (size == 0) {
+        pmp_size = -(address | TARGET_PAGE_MASK);
+    } else {
+        pmp_size = size;
+    }
+
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
+        !pmp_hart_has_privs(env, pa, pmp_size, 1 << access_type, mode)) {
         ret = TRANSLATE_PMP_FAIL;
     }
     if (ret == TRANSLATE_PMP_FAIL) {
-- 
2.20.1


