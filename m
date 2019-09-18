Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsi-0007WW-E5
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbse-0007Rw-QO
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsd-0006z8-HF
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39028)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsd-0006yr-CO
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so44128pgi.6
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Supmr9q+8YlVFK3tNfVw7bIH+Epm9JEKvf8SkP1cu4M=;
 b=K58DMsGPjM1q35tXy8ztMHmH7QsEEfkovAc1Xl+77uTE6kevwyHMhNfVIMNBYdyIZT
 yfppKLPqr4JYC7cCTmJ679MQ36XnuBBLdGkvv5adNPBntBXRkKP7X4BJGPq3xLnBpbKb
 WrpBySiSshtsMlYBzxon42h5iIZ+RosMsgQxDmzxW+8LSSDpU9h7KGfThRnFq7Ej/ZIL
 JVinfcn4Lmwj9yJz9lF68VqmVielk/2pmVbjvRh3PsspgQl+KVPrKbcj6fiIWg+9FqjO
 ETKzY1F01ylUbg9hN2BVFUpnDltafHrFeL/h+zkb4SWb4a77J0G5y7OfBP0ycxzHp2f/
 W9qg==
X-Gm-Message-State: APjAAAXtBoqBcG7b92x6AUkC5EXPpkhWuap+1/BiHait5EiWhNHJmwoG
 aDPr32gCrhUzlyZ/Agl8Ah10JOrwMZg=
X-Google-Smtp-Source: APXvYqyMJ+wYd9nmmjJVm6JLWrdoGPi6KZ8oXXnAHkdNvsFjxmNLOYUX5TxNPikW5kKsEDwqK8j/4g==
X-Received: by 2002:a63:c203:: with SMTP id b3mr4568590pgd.450.1568820509976; 
 Wed, 18 Sep 2019 08:28:29 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m24sm5122742pgj.71.2019.09.18.08.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:29 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:24 -0700
Message-Id: <20190918145640.17349-33-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 32/48] riscv: sifive_u: Update PLIC hart
 topology configuration string
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:35 -0000

From: Bin Meng <bmeng.cn@gmail.com>

With heterogeneous harts config, the PLIC hart topology configuration
string are "M,MS,.." because of the monitor hart #0.

Suggested-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fc126bc06..d80b203cc1 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -424,10 +424,11 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     plic_hart_config = g_malloc0(plic_hart_config_len);
     for (i = 0; i < ms->smp.cpus; i++) {
         if (i != 0) {
-            strncat(plic_hart_config, ",", plic_hart_config_len);
+            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
+                    plic_hart_config_len);
+        } else {
+            strncat(plic_hart_config, "M", plic_hart_config_len);
         }
-        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
-                plic_hart_config_len);
         plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
     }
 
-- 
2.21.0


