Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2cwI-0003Md-4f
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 10:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cw1-0003Hj-0S
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cvx-0003W1-H2
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:58:58 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34731)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cvs-0003OA-HH; Tue, 27 Aug 2019 10:58:52 -0400
Received: by mail-pg1-x544.google.com with SMTP id n9so12856991pgc.1;
 Tue, 27 Aug 2019 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=9zPJ4Q9TIgxIyECVOCVkDoBRfMIAHimE+QxZVrAJ+Xo=;
 b=mMDwwOz7p9gowc1r3aRglqPDJZ6In/MRrdUIGzJp4OD+kvIlvi0zO70cwdgeD96Ol6
 UygXm3vKL5Lk+GXiS834cTSQhVS2otMKdtZICtswVGz6q45sn7mr9Ccmo42LXsiPjLmB
 dPyVEkvHGqij9lfKdZqwnbQOJhG9XpV4yMLS8QAjXQDymbX75AGjnIEWywSMcc4JPCyJ
 v6i/XMHM4taEyJ5+7ZZiSEHyK9cvzMNYCn7ul6Essfwzl2mkQVVyn0ceZr+MDi0uL1bm
 QumT5DEhxsHf24wElAUqAWPAM8flpFwvmtHSQw0jZbSwoVSKh8OOL/L1RokS7t+ZgrM4
 O44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=9zPJ4Q9TIgxIyECVOCVkDoBRfMIAHimE+QxZVrAJ+Xo=;
 b=qy31XN2l70tUZwjO1KeGnloe6xx0ru75ricMpkcCi50DOQ9RwNYs2kPI3T+vy5X8kM
 51yZT7JGdihI7X8YmrUgrcrSpuwyHI8veaOj43c5pshhDACIxatsxsjCdWCUrtvjCxZW
 8NG8Y5Y1l6+7toYQ3qOJftpVCdmJHKsZOmOKm51qncZmfTgX1T8trb4EEHNEVPWNI7bE
 63PwenttqAh3F6HAzvsN87qPTWD4jY1QR7FHJFBUbG97z9QJeecm41YhTRbTtYHX6TiK
 eiFaE+U0X/5pnRqtStpyCRnF1OJIJRMf96m37f7hr9yCqDkMWtoR9KEweEQCzWZ6WjRh
 D+sw==
X-Gm-Message-State: APjAAAWESQxf12/ckC/5jF6B3ybWBhaF4AaFtc7tRfJotIUy7RPfIBzz
 Si1MnBd+mbk4m/FXYaUXOOo=
X-Google-Smtp-Source: APXvYqwB2h13iFT/lvPIBPhltqcGQ0tCsEjc7GmSxNYH2DbIJq1Vp++Xg58RHWl5oGiZzPwNl+PgBA==
X-Received: by 2002:a17:90b:907:: with SMTP id
 bo7mr26153582pjb.107.1566917931720; 
 Tue, 27 Aug 2019 07:58:51 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.58.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:58:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:15 -0700
Message-Id: <1566917919-25381-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PATCH v6 06/30] riscv: hw: Remove the unnecessary
 include of target/riscv/cpu.h
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
X-List-Received-Date: Tue, 27 Aug 2019 14:59:04 -0000

The inclusion of "target/riscv/cpu.h" is unnecessary in various
sifive model drivers.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v6: None
Changes in v5:
- new patch to remove the unnecessary include of target/riscv/cpu.h

Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_prci.c | 1 -
 hw/riscv/sifive_test.c | 1 -
 hw/riscv/sifive_uart.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 1ab98d4..1957dcd 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "target/riscv/cpu.h"
 #include "hw/riscv/sifive_prci.h"
 
 static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 655a3d7..31cad9f 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -23,7 +23,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/sysemu.h"
-#include "target/riscv/cpu.h"
 #include "hw/riscv/sifive_test.h"
 
 static uint64_t sifive_test_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index cd74043..1601bd9 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "target/riscv/cpu.h"
 #include "hw/riscv/sifive_uart.h"
 
 /*
-- 
2.7.4


