Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhPo2-0000KA-OJ
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 01:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhPnz-0000Gw-Rw; Thu, 21 Apr 2022 01:56:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhPny-0001pz-6g; Thu, 21 Apr 2022 01:56:39 -0400
Received: by mail-pg1-x534.google.com with SMTP id q19so3773201pgm.6;
 Wed, 20 Apr 2022 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHnzDGKqIh6N1cF4DxeQPk7+iSRYpnz5A7I979NUz/Q=;
 b=azh2mIswGaLx4j5hZnATirQxHgXHFVm716mCX3eOZcb/ntC4qoW9f0NEumJqAcSYyW
 c6knSx3c2w2fLb9lfxKCmd107ZareZBqRRNBb4fHYp0M1IFX19a/D2xx8aZOqC+mH9Xy
 VEdCLoAIo9TMIGJ6aodio4UL4uHfgOFt6kQHMGv5zki+Ag9rB+3yVkO39D5qEda5l3+s
 azqrCj+a/193Vm3KpAlx7l5CMzxB4j3shXLvSMHS2l+X6bk6/EFf/3z+jRW6XRVewWKf
 qnAr3ncGcWmwDsU58O8ISuDV0dJB96DAWN4MyNOuqxBTeV24eKRJ0ZObywvq9mSs1GEq
 7ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHnzDGKqIh6N1cF4DxeQPk7+iSRYpnz5A7I979NUz/Q=;
 b=tZruULg47vq8pKT8u/yPgxbei0XfCuxxjaqctV1o8Pb2ZS1Zpk6PP584ZbR6RLcADM
 oia/nN7X/jsS1tzYpe3Y5N+9oVxEAaY8pcPomSafumaa0rhLFrIj8+Yaf8csnGvzlpAf
 uttvsZHlUBNtw8mDrSAFczm8akqdYYmGAA9kraJasWusVgTmGn4jHQaJfEdziwwD/fX9
 1/kexLOv+jKc4NnXETFodNeZqmSfTIAFCTu3SnKgee1rnxMRvo4xeuBJcjdSvRXfB1Uk
 XhCUeQwI7iuuwDnUXOXv1QydTV0LHF3mGT5Nn7gFsgIDVCKFe/2SFRuhes30LzVU9sPw
 dwaQ==
X-Gm-Message-State: AOAM532JYQJWwH6aqPhAqlpfdVkOQMcAQYU4y20NXATE1v5kmPtPLhdi
 kMJZUXI5RCcEg7WAkcAY4zE=
X-Google-Smtp-Source: ABdhPJwJR/9NNxf/r2b8DR1gkCSH7bt5VrWdwTTavEXgNMPTpNVKmbh/umfA2tELsvy2W/lZnlQV+g==
X-Received: by 2002:a63:5fcb:0:b0:3aa:5209:471d with SMTP id
 t194-20020a635fcb000000b003aa5209471dmr8298489pgb.36.1650520595912; 
 Wed, 20 Apr 2022 22:56:35 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 x16-20020a17090ab01000b001cd4989ff4bsm1169300pjq.18.2022.04.20.22.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 22:56:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/2] hw/riscv: spike: Add '/chosen/stdout-path' in device tree
 unconditionally
Date: Thu, 21 Apr 2022 13:56:28 +0800
Message-Id: <20220421055629.1177285-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Apr 2022 05:56:40 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the adding '/chosen/stdout-path' property in device tree
is determined by whether a kernel command line is provided, which is
wrong. It should be added unconditionally.

Fixes: 8d8897accb1c ("hw/riscv: spike: Allow using binary firmware as bios")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/spike.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d059a67f9b..1562b000bb 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -174,10 +174,11 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     riscv_socket_fdt_write_distance_matrix(mc, fdt);
 
+    qemu_fdt_add_subnode(fdt, "/chosen");
+    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
+
     if (cmdline) {
-        qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
     }
 }
 
-- 
2.25.1


