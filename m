Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr9fK-00031U-L2
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 19:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hr9fI-0002xM-JK
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 19:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hr9f6-0007Dv-8a
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 19:30:10 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:40310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hr9es-0006OK-1a
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 19:29:57 -0400
Received: by mail-pl1-f177.google.com with SMTP id a93so25238553pla.7
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 16:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Bj2QPnrhDA3XafxqIn5N019+xRgqy1t8vZrKKYPqIyI=;
 b=W8B2+/3gZKglCjK1ZtPpI5T+hca47HM/qKW1PH1aYH1jlfg8YMxbEHpz1TNnTxnWS2
 VoOPK+Rut1EyxYvgH8KYWRZ+MAZT1JbXWPGItG4GmOcTnl1ZSE1AIjfSpGjXCP+iiHR1
 XU8WGrYI5piCMfvTLzpcGhtTTvtxz2iJflYp0QhbnbZDHk9t17GmGBXveKiCV07EjJ88
 nswfGsd+Rt4BDR4mYkVUfJ4jqU+H+OUKp2zt+OwIe/h5ZiS4WqiawaXUhtR+GADzxRVd
 L322K2W99PWA1t8OOFfG+Pae0XxzhzkOxES0p5hTc70q24kithrJlgE8NzSKNgzdh6Lx
 Q/fQ==
X-Gm-Message-State: APjAAAXwBW4ZIwAsKSKdz5eBeSBDsoAvJND+uYirPSbkkilGeuyu+BZs
 dDE2ajOBTgVaYVfS0mZ4lmc=
X-Google-Smtp-Source: APXvYqxIf8DGhXVzt/0mIIZj9L42Ax12usiAMz+/tFFxgJd4OH5WrBQn4RaiNHASXfzben4bBlBRiw==
X-Received: by 2002:a17:902:2f84:: with SMTP id
 t4mr94764328plb.57.1564183672426; 
 Fri, 26 Jul 2019 16:27:52 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w4sm72048848pfn.144.2019.07.26.16.27.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 16:27:51 -0700 (PDT)
Date: Fri, 26 Jul 2019 16:27:31 -0700
Message-Id: <20190726232731.28572-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726232731.28572-1-palmer@sifive.com>
References: <20190726232731.28572-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.177
Subject: [Qemu-riscv] [PULL] riscv/boot: Fixup the RISC-V firmware warning
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
X-List-Received-Date: Fri, 26 Jul 2019 23:30:21 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Fix a typo in the warning message displayed to users, don't print the
message when running inside qtest and don't mention a specific QEMU
version for the deprecation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 5dee63011b43..6b7d322e857c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -26,6 +26,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/boards.h"
 #include "elf.h"
+#include "sysemu/qtest.h"
 
 #if defined(TARGET_RISCV32)
 # define KERNEL_BOOT_ADDRESS 0x80400000
@@ -46,10 +47,13 @@ void riscv_find_and_load_firmware(MachineState *machine,
          * In the future this defaul will change to loading the prebuilt
          * OpenSBI firmware. Let's warn the user and then continue.
         */
-        warn_report("No -bios option specified. Not loading a firmware.");
-        warn_report("This default will change in QEMU 4.3. Please use the " \
-                    "-bios option to aviod breakages when this happens.");
-        warn_report("See QEMU's deprecation documentation for details");
+        if (!qtest_enabled()) {
+            warn_report("No -bios option specified. Not loading a firmware.");
+            warn_report("This default will change in a future QEMU release. " \
+                        "Please use the -bios option to avoid breakages when "\
+                        "this happens.");
+            warn_report("See QEMU's deprecation documentation for details.");
+        }
         return;
     }
 
-- 
2.21.0


