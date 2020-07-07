Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsojO-0000uu-W8
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 10:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jskYl-0006c9-Tu
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 06:10:43 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jskYk-00016Y-CS
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 06:10:43 -0400
Received: by mail-pg1-x544.google.com with SMTP id t6so19811011pgq.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2020 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jbaiWudyLl1t/ATOC3EUXBawMf9xIkzMV5OYrN8XXaQ=;
 b=jUx4tk2wk0BKZI69QPVABLSmjmfpsG0H7/U22wo7KeKuJCICFiyUllZ2Bwqd90heA5
 a18mvZfrI7pvryi5c707NFjxArPLRio9wYB3JrEho/OLAbSN/+Qfb/9o8ZTobOWWZhKv
 wWTsY5D2kiUxyqGLxK6F8YWJLWiji53/HViRpu5h9k4KkBjsPDNLMAVA7UpeExBSRtdH
 0CiKa3Qv2Su5coGGFwE7MCA/JmfR+7I5FaFtPQTwOZDUgRhNKI4LWPvmp1MDQ41iIPl4
 BEZKRUNIqEaySViKsAy/B2KIWkIf63PUwTcyr5Qa64HOwplosflBB0K111PHCVoSvn/o
 0XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jbaiWudyLl1t/ATOC3EUXBawMf9xIkzMV5OYrN8XXaQ=;
 b=Ic0p4T6TAsUob0ROX7TcOi/edwmwyyr6a9fbClZ8e7ON+VHZcnjkHfdYcpMCC0himh
 //J2u/3UtMRr6DktDt412PUYLtF5Cm19dvwdfq2eWyuuRHorpsnHTaAeTI72h10s0jl3
 kTDU2hE3wdKlt2noACjnktCsXiKgYeCurMByYb2P7EhrHzotIZ5cyAsf8VsO1P4Yhget
 7Yv1yIuVHLS6Jo0vreXL7MNDuPt1/91CUWqtI7P0aqvaNnMk2tecZ4QcEM8WcBELza3l
 3oFkv6oru8+uQSoR0JBOx4r99/r+RxhinGD0/bdXEtpT+oJuVAHC178I286dR0JfusSM
 cnIg==
X-Gm-Message-State: AOAM533qKRxlKnCRGm0g2SLrWLNYeqAkrDZEh1581Wu7ZQSTSrTy86HZ
 rmGMNqe8dbOxGOxjUzerO867izWqSQ0awn1K
X-Google-Smtp-Source: ABdhPJyoklt6mR6LVQUUM9I2DmHV+7R00x2/L6A8LzLU8i2BGy3hOd1PwrUWjHtJe2lqqvd3rLYdoA==
X-Received: by 2002:a63:e14c:: with SMTP id h12mr4277018pgk.110.1594116640309; 
 Tue, 07 Jul 2020 03:10:40 -0700 (PDT)
Received: from localhost.localdomain ([39.98.209.129])
 by smtp.googlemail.com with ESMTPSA id
 u188sm18996965pfu.26.2020.07.07.03.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:10:39 -0700 (PDT)
From: lazyparser@gmail.com
To: qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, Wei Wu <lazyparser@gmail.com>
Subject: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20` operand.
Date: Tue,  7 Jul 2020 18:09:30 +0800
Message-Id: <20200707100930.4041-1-lazyparser@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=lazyparser@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Jul 2020 10:37:58 -0400
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
X-List-Received-Date: Tue, 07 Jul 2020 10:10:44 -0000

From: Wei Wu <lazyparser@gmail.com>

`imm20` operand type is used in LUI/AUIPC and other instructions.
The value should not be left shifted 12bits for disassembly output.

Signed-off-by: Wei Wu <lazyparser@gmail.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 278d9be924..a2b6472bd8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2083,7 +2083,7 @@ static int32_t operand_imm12(rv_inst inst)
 
 static int32_t operand_imm20(rv_inst inst)
 {
-    return (((int64_t)inst << 32) >> 44) << 12;
+    return ((int64_t)inst << 32) >> 44;
 }
 
 static int32_t operand_jimm20(rv_inst inst)
-- 
2.17.1


