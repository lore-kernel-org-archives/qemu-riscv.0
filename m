Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xw6-0007yO-Dc
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw1-0007rY-J0
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw0-0006aF-5K
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvz-0006Zu-Vh
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so1614986wme.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=G7Nvco3Ed4SzCOF6c1+pxFi6zNWbYlWlCIq1YYzo3nE=;
 b=cxFnfKk59H8dwkHpLBZBp7eQypR4+suOVrULuL6tPU9Q6Y80c9nQq/CKVlA69pv3e7
 BFGwFMTevv4OjaVFaIM+eyzSZaAOPbFfHfk6e9kZQuKh3j0HsS694wvo73Nt9er15rcq
 SrsCLuXysPlCIfgXc76l8VkV4AeIT5GD/iivKzzmqA5VyBy87YD0saJ03S0x7ljFddvQ
 FYdyc3SVjrwRWaeac8JTUn8WaJhds4A9HLlnKUqB6s+gL6ZBzhcQ6IssF8xfPu7KPTPV
 23tU6Z8Mf9G+4M0PhhEm0ea5zp1qgwwIq2C3lUl3ej8x8LKUpgP0DTcpoE0RbkKua/kw
 T/zw==
X-Gm-Message-State: APjAAAVMsCloLmYTVPDr0aPq4l6/1DAh+ogpbXoWsSxERl1TeMDT/qfe
 x3+10r4VWxcz8KnHv3wB9GiDlvw8xw5m4A==
X-Google-Smtp-Source: APXvYqzxKbgwqMTxlGKJx5isQSoFqeEhAIV1/KRpQk9IvBNwmsmFa3kHYM8H2K1HZT6SGTB2sth3jg==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr3095160wmj.25.1568190302679; 
 Wed, 11 Sep 2019 01:25:02 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id l62sm3821040wml.13.2019.09.11.01.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:02 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:46 -0700
Message-Id: <20190910190513.21160-21-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: [Qemu-riscv] [PULL 20/47] riscv: hw: Remove the unnecessary include
 of target/riscv/cpu.h
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:08 -0000

From: Bin Meng <bmeng.cn@gmail.com>

The inclusion of "target/riscv/cpu.h" is unnecessary in various
sifive model drivers.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c | 1 -
 hw/riscv/sifive_test.c | 1 -
 hw/riscv/sifive_uart.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 982fbb26fd..c413f0cb76 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/riscv/sifive_prci.h"
 
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index aa544e7428..339195c6ff 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -23,7 +23,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
-#include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/riscv/sifive_test.h"
 
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 215990b443..a403ae90f5 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/riscv/sifive_uart.h"
-- 
2.21.0


