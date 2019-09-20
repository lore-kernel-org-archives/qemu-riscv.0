Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBKC1-0003Vq-AB
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 10:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBKBv-0003QW-S3
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 10:47:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBKBu-0003An-SI
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 10:47:23 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iBKBs-00039q-ID; Fri, 20 Sep 2019 10:47:20 -0400
Received: by mail-pl1-x644.google.com with SMTP id w10so3291676plq.5;
 Fri, 20 Sep 2019 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Jkm0ljehZywZ2iXiHGqHTmmKoGBleQrarPOjldtOvIw=;
 b=XB0mj5rAi5k79Ektlt4WBY57icoLPPhHkMPmbmnBljNKjTjkBqc2d9kjHAuvMPeoZ/
 la2CTfKjIrwU1xcGLdB3w1iBMVAG8xlKUImd6C1ns33vXeJ5wGwYicVV155wwY7GmQaJ
 vw5YEzd4v2B4eGRh4jWHcaq9L4oFCQRL+qjnu2kHD4rFHi/VWvZsX70E1DHyt+cHR0vn
 nzIkpMlCcN7jFQLbHSAVyofb9Vk+Tz1ZQID4vsjv68wXaNyknZrPj0tadnk0tEM0Vgns
 P1tF3KNTMFaoITjKsBTNJWDvJCBqcIZPIoAGSJxYeeqaOCZBI9X1sZLdzgbOiR8PVxmH
 jOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Jkm0ljehZywZ2iXiHGqHTmmKoGBleQrarPOjldtOvIw=;
 b=OGng49z3I33flhgw2BM9vBPyeKCPpdAbArt0vNG/0R8QZqckiRpna5Xl/GrUQABcVN
 KC+88zjw3q4VI3eHZt/qm3T/RqDixXWBU1VxBCwOuD7RnsV2MFMx4aS0HeenfsBPgYrH
 mycgxFw/OhSC/LkDtPA9Xr7ltlTGnbBrRjSxamsdUcKIhiwLRaEI/aWaJ3vakyU9elVs
 TQ/abxILqviimhstjStciGN/lEuqSriuez3vRUEcx0jn6/b3W7yri6p2EM7BGQBzdMl3
 c5bhVBFd+cvD3kTPUNyhc+6E/3/1flyTSJqpkZGm+UbIwefNPwtoJBIYCCYn8R6PkhdS
 IVKA==
X-Gm-Message-State: APjAAAUqXC2OyPHX7LwLnjuZykfQWxAvjoChouGaBazuaKAO+EUGYgXL
 geJW6DXCw5CRtHyc3MqJVgA=
X-Google-Smtp-Source: APXvYqyGBNdYrp4JC7beAU5zXlZzIA9enGnaEvnTJY6vDmxh+5uNBMrYRJv8syXWW6UzoINAGPe2YA==
X-Received: by 2002:a17:902:a406:: with SMTP id
 p6mr17492719plq.134.1568990839606; 
 Fri, 20 Sep 2019 07:47:19 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id m102sm2483247pje.5.2019.09.20.07.47.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 20 Sep 2019 07:47:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: Skip checking CSR privilege level in debugger mode
Date: Fri, 20 Sep 2019 07:47:14 -0700
Message-Id: <1568990834-9371-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Fri, 20 Sep 2019 14:47:26 -0000

If we are in debugger mode, skip the CSR privilege level checking
so that we can read/write all CSRs. Otherwise we get:

(gdb) p/x $mtvec
Could not fetch register "mtvec"; remote failure reply 'E14'

when the hart is currently in S-mode.

Reported-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/csr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f767ad2..974c9c2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -801,7 +801,10 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv = get_field(csrno, 0x300);
     int read_only = get_field(csrno, 0xC00) == 3;
-    if ((write_mask && read_only) || (env->priv < csr_priv)) {
+    if ((!env->debugger) && (env->priv < csr_priv)) {
+        return -1;
+    }
+    if (write_mask && read_only) {
         return -1;
     }
 #endif
-- 
2.7.4


