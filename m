Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iN1b3-0000eo-UD
	for mharc-qemu-riscv@gnu.org; Tue, 22 Oct 2019 17:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iN1b1-0000bn-3T
 for qemu-riscv@nongnu.org; Tue, 22 Oct 2019 17:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iN1az-0001ep-HE
 for qemu-riscv@nongnu.org; Tue, 22 Oct 2019 17:21:38 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:42600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iN1az-0001eL-4Y
 for qemu-riscv@nongnu.org; Tue, 22 Oct 2019 17:21:37 -0400
Received: by mail-qt1-x842.google.com with SMTP id w14so29046566qto.9
 for <qemu-riscv@nongnu.org>; Tue, 22 Oct 2019 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ciWYO+JQTfvwrYJqiccgIFokh0umLIjCGNk8VTvZkI=;
 b=cVTdazFlt+E+xN+sUem5370SgcTGwyhjVxJXbzsYy5by9y4njNglJcHtu5y8/bCCo4
 zH3mOFyd9FNKLwkhqVHzDkEi2P/yryiJ0of76nnqxTUFoAYWpXE5Mr1UZKzjez4E0BOd
 lqrlYqirqnyc1aXGMbQwsiTV85oPWafEVzjCedjHurVnBmPA8e6D4hOj5cekY2OmmJIQ
 6nX9Xrfl3gFQ0hTlIQrK858UdOBWept0FA9qnCnIk3ZBCbaUjdMDAFBEC1mTK95Wh+42
 +Ya05P/CM77DB3u9Cfg8tAQOUj+hC4FvIPbUJZ3CfO0RiU2TETaBiGXzc9Ri89HbP3vw
 kFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ciWYO+JQTfvwrYJqiccgIFokh0umLIjCGNk8VTvZkI=;
 b=VdgsGRx0+B7DrRkktJMaUHE71NwvxZBkwRTwSjHOF1pO8M/P/LwYW4ZmKL9AHqcSNp
 RdBaaAf9MTIFRNz23DoR/ZuTs4EyQw2Rn8MEjzPSMmh116HUYfMhKn5DPCmdUJyu335M
 2oFDb9eYbZWZa9+gbTOPxBcC3QTKE7qjlbH2SzLtU+wpNcXpn+MEaQblfjIZ9nbems0z
 Wczdybm5EQ6rK9FAlRcwH+49kiSBIc8ZPo5qKFn8TMhB7zaGD6vfwRZTWyCtlju/3KH4
 zGhhLSSQFZZy47n+hgJQypFgFAhiz/VK/6vNxCkOF5rjUQ5zy3cehL3+eNyikJNTnqNh
 vSuA==
X-Gm-Message-State: APjAAAXha2aCXoSYkN7L1NLRp1zBHQF9FGM6WjnLDK2Wzm0Y0pIpQE9j
 u9c83S6xan7KVgjy7ADQMUu5Tg==
X-Google-Smtp-Source: APXvYqwsdr6ZhYJ8iiAjz/Hg+tgGmCI7x+R7tbcmQgArv30Q09txhTI2OVFfcCfN2iRTQPqYmh99Lg==
X-Received: by 2002:ac8:73cf:: with SMTP id v15mr1610041qtp.310.1571779295221; 
 Tue, 22 Oct 2019 14:21:35 -0700 (PDT)
Received: from ip-172-31-33-50.ec2.internal
 (ec2-34-206-44-154.compute-1.amazonaws.com. [34.206.44.154])
 by smtp.gmail.com with ESMTPSA id z5sm9625014qkl.101.2019.10.22.14.21.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Oct 2019 14:21:34 -0700 (PDT)
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
Date: Tue, 22 Oct 2019 21:21:29 +0000
Message-Id: <20191022212129.8452-1-dayeol@berkeley.edu>
X-Mailer: git-send-email 2.23.0
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
X-List-Received-Date: Tue, 22 Oct 2019 21:21:40 -0000

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
 target/riscv/pmp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 958c7502a0..7a9fd415ba 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -232,6 +232,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 {
     int i = 0;
     int ret = -1;
+    int pmp_size = 0;
     target_ulong s = 0;
     target_ulong e = 0;
     pmp_priv_t allowed_privs = 0;
@@ -241,11 +242,21 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         return true;
     }
 
+    /*
+     * if size is unknown (0), assume that all bytes
+     * from addr to the end of the page will be accessed.
+     */
+    if (size == 0) {
+        pmp_size = -(addr | TARGET_PAGE_MASK);
+    } else {
+        pmp_size = size;
+    }
+
     /* 1.10 draft priv spec states there is an implicit order
          from low to high */
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + size - 1);
+        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
 
         /* partially inside */
         if ((s + e) == 1) {
-- 
2.23.0


