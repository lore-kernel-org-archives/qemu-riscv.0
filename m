Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRYDP-0006hA-AO
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 06:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lRYDG-0006eh-Dp; Wed, 31 Mar 2021 06:36:38 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lRYDE-0002Xc-0a; Wed, 31 Mar 2021 06:36:38 -0400
Received: by mail-ed1-x529.google.com with SMTP id e7so21677214edu.10;
 Wed, 31 Mar 2021 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6B8F1C+YQqkROypmJL0Djudesqu5mXiaDlrt1fs9/Uk=;
 b=FJrYz/TdcuwnpYfAoaAcbslGLQ0zf/HcaW1/lEnOOt3w7wsz0FenB/oLMDzDPrWNyU
 AYVtsfo+ylTV26I1k1Hrv09IuHHYcetZBoEQ5lkzYsEBkHEQegk5oLwStMsYKq0YSvXq
 3nfEGKPDZRDZKyYHT1zh5hwpO5T1MSGSL0r2B9UqjnJS0sv/aihswUwoM3hQx0tcH2zv
 6r+QyH5dc54hwfvJI8HzOGePzJdf3HBwDI7EADaIGJ5K/rBIuWRQnFRl9ncKOhO+4fZT
 Y/q9UFlSNfeGisY4cGPc0C8BOuXMrW7b2gXYTpDSzWSor8FvnDUoxVD0mBYbnyjIyKQO
 7pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6B8F1C+YQqkROypmJL0Djudesqu5mXiaDlrt1fs9/Uk=;
 b=DJHSOVii6mDmpBdxQyLhkT017Qnu+FTYJpDsmQL7fyK6IDkKAPMFublzck+pZD/mrS
 oq5hNIXx3esCXyg82ahUUZ7OOovdxpthckEh+ERBjkSvmZU7pcc6GCcUQ7ISq83kDw7V
 rFZWZhMKF/GIVK4qK3raIMfKbrDdIF06L0MnThig+x4ciDQXpFFkiMpgb6MmKPpGeNIa
 9L606qfzIqhYbrJsSgyojQPLG7ca/aBya8gouKvotMEFaiREorURdK77308Skxw940Gp
 rdyDCKC2qSzGZhi9y/IqEfi01aDa6OJnjJzU1hb6/ptsruhH/XlB/d5UfO9tfHdWMMyh
 J9fQ==
X-Gm-Message-State: AOAM531aT5XlgA+B0WHEWS9EnIEalFfOLQ/Janr3OdicqOpvKqEpZBge
 wrmo9PMsBtGSMUq26ll095w=
X-Google-Smtp-Source: ABdhPJy1kbvk2yO7js3fJfwVeRTQ67d4UtTElXK2hPTUB0IQB1MfXox9xhO/i9wi4G9JdDl8WwgUig==
X-Received: by 2002:a05:6402:d07:: with SMTP id
 eb7mr2796854edb.242.1617186993521; 
 Wed, 31 Mar 2021 03:36:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id j25sm1302075edy.9.2021.03.31.03.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:36:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Emmanuel Blot <eblot.ml@gmail.com>
Subject: [PATCH] hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]
Date: Wed, 31 Mar 2021 18:36:12 +0800
Message-Id: <20210331103612.654261-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 10:36:38 -0000

This was accidentally dropped before. Add it back.

Reported-by: Emmanuel Blot <eblot.ml@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index f939bcf9ea..82096b3e5a 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -50,7 +50,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 
-static MemMapEntry sifive_e_memmap[] = {
+static const MemMapEntry sifive_e_memmap[] = {
     [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
     [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
     [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
-- 
2.25.1


