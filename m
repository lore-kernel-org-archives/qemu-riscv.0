Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvv-0007id-9w
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvr-0007bt-Ur
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvq-0006Ua-Ti
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:55 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55142)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvq-0006UA-OV
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so2327093wmp.4
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=3hJQGoN/dkKnxfz2wZzkBe8IK9Gek4+jV7PzGIOzZB8=;
 b=IW9r+72UF9+O1e4j58A0/hFiK8qyxTG9pSUKdoEf2By99QMZXmDJDDRGJOfHDtVuUg
 FWkmcitqEQ1oyG/cdFqQRdYLBMrFlbN+zo49PH8u7jskgftqW/MTdV3otvLT2tuwX5Sk
 p3WoZl/C1QKmt2HapIuhULkW2T7I4jGtVwhUXhQTOYft84Y46YA/B0lEGDUl5pMfPYRM
 C3Tqx5EtDtAWVqNWow0PURX8arPgGSs8xJMRgzcxfQ/Q6ng3cS7n1IF2zmjNUKOlDJGy
 RKmoyDIyX6j4ZmQkBodGKA4Q2kwrEYBSDkfr/KhKxa8LjdJ1uCkb6S4mpoLKb1lDPjfX
 U66w==
X-Gm-Message-State: APjAAAWttVcK37We+7EpzbBYV3DXZ4J9IN8qdOjBYmtly00hEVHvUhG6
 GJZCrg0E+MCa8+9MZMF+uNjRgqNikG8HqA==
X-Google-Smtp-Source: APXvYqy4OOqHjWu2bFFeY9E1qUXYpCK7loKq9UIfr+RugRSB4B5heRLAh7wJY48pHiTOkjy7vcJXcQ==
X-Received: by 2002:a7b:cf11:: with SMTP id l17mr2799594wmg.162.1568190293264; 
 Wed, 11 Sep 2019 01:24:53 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id s12sm29134876wra.82.2019.09.11.01.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:52 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:39 -0700
Message-Id: <20190910190513.21160-14-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: [Qemu-riscv] [PULL 13/47] riscv: sifive_test: Add reset
 functionality
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:58 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This adds a reset opcode for sifive_test device to trigger a system
reset for testing purpose.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_test.c         | 4 ++++
 include/hw/riscv/sifive_test.h | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index afbb3aaf34..3557e16701 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -22,6 +22,7 @@
 #include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
+#include "sysemu/runstate.h"
 #include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/riscv/sifive_test.h"
@@ -42,6 +43,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
             exit(code);
         case FINISHER_PASS:
             exit(0);
+        case FINISHER_RESET:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            return;
         default:
             break;
         }
diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
index 3a603a6ead..1ec416ac1b 100644
--- a/include/hw/riscv/sifive_test.h
+++ b/include/hw/riscv/sifive_test.h
@@ -36,7 +36,8 @@ typedef struct SiFiveTestState {
 
 enum {
     FINISHER_FAIL = 0x3333,
-    FINISHER_PASS = 0x5555
+    FINISHER_PASS = 0x5555,
+    FINISHER_RESET = 0x7777
 };
 
 DeviceState *sifive_test_create(hwaddr addr);
-- 
2.21.0


