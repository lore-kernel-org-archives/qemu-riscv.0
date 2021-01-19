Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1hbz-00049v-7c
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 22:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1hbv-000495-QQ; Mon, 18 Jan 2021 22:23:15 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1hbu-0006vJ-8d; Mon, 18 Jan 2021 22:23:15 -0500
Received: by mail-pl1-x62c.google.com with SMTP id r4so9699523pls.11;
 Mon, 18 Jan 2021 19:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lkOMMBEvfSBDQoI21wVPZJpEUQ3pr1l1lES84h5wUWk=;
 b=tNntGWkmvjtmr1cbdbCeam2xsASLNTyOarSZe7UOZTZqMEkUSf2VqBuEeij0jH6bTH
 6brt3qW/uDDo4KqKmHg2KS5r5pQIP3GGyiH9fSGlyxdz3ee54NQog1Kls3Cn1n1wCsy7
 8q7cQQweMk0vEtqX5DNv+VDxt/kDkc+SHgejjRjrp+SA9q7v3pnZgsjRLvhotBhbtW/W
 fHfA/vZ06G2Fydp/JYxaIYEGJWUH8dQdNKy05f+/ypglc01bKIaUSiLHSZKPjd2eEZwE
 IAGzGhYMfbiQgxR2Muv3cHXL4vdWCWSHjvcWGL59l96i7KIGzLLOrLKAeU8L5rfABqT8
 gAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lkOMMBEvfSBDQoI21wVPZJpEUQ3pr1l1lES84h5wUWk=;
 b=jXaYkDzzo2/kQcTcR6bei3nfel1/45B4V8K2Z0tVBh3h8K96pAnKXOYz33v0RbvwHg
 ofI2LoWFz6K0JkYA29Z3XcZ83ByV+JdS6AD3XMyHvtcE8eN2yV9vIHGUEqpXcm/uMxdz
 6wYUzm6vbIAU2EUX1UO9CzIj6dMP7MaDI7d36FTEHdCm1L5jVZTFCG4HNRz0E90MrhtT
 L67N5TNw4s20Eg5LqrdaLHdDmwSI4veBn0Fyv5hadRRmPyWyhJEMUBSje4IKaA+ECC9R
 /ESgjGm6nmwFaTzlhFvOqv6W1RQZW0Bg8V1zprsyADT1AmGPLBswy5L+iPTJbRQi75nB
 WH3w==
X-Gm-Message-State: AOAM53248uBJiV9kF58esFWfxvtv84pGam8ierrGCkMgLCdMK2s0W7ku
 3qG7e39P31X5htQjB+4TWBs=
X-Google-Smtp-Source: ABdhPJyZ+hpLBbpMqH3Z/ZZP/vMunmwzW4w5q/fnVpzHEe4QnEDYPu0NtQE/REBIesDGc6kApzUh6A==
X-Received: by 2002:a17:90a:4083:: with SMTP id
 l3mr2766839pjg.109.1611026592475; 
 Mon, 18 Jan 2021 19:23:12 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id y22sm1013993pfb.132.2021.01.18.19.23.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 19:23:12 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Green Wan <green.wan@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] hw/misc: sifive_u_otp: Use error_report() when block
 operation fails
Date: Tue, 19 Jan 2021 11:23:05 +0800
Message-Id: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 19 Jan 2021 03:23:16 -0000

From: Bin Meng <bin.meng@windriver.com>

At present when blk_pread() / blk_pwrite() fails, a guest error
is logged, but this is not really a guest error. Change to use
error_report() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/misc/sifive_u_otp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index f921c67..4d8f793 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/sysbus.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/misc/sifive_u_otp.h"
@@ -65,8 +66,7 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
 
                 if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
                               SIFIVE_U_OTP_FUSE_WORD) < 0) {
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "read error index<%d>\n", s->pa);
+                    error_report("read error index<%d>", s->pa);
                     return 0xff;
                 }
 
@@ -169,8 +169,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
                 if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
                                &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
                                0) < 0) {
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "write error index<%d>\n", s->pa);
+                    error_report("write error index<%d>", s->pa);
                 }
             }
 
@@ -260,15 +259,13 @@ static void sifive_u_otp_reset(DeviceState *dev)
         serial_data = s->serial;
         if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "write error index<%d>\n", index);
+            error_report("write error index<%d>", index);
         }
 
         serial_data = ~(s->serial);
         if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "write error index<%d>\n", index + 1);
+            error_report("write error index<%d>", index + 1);
         }
     }
 
-- 
2.7.4


