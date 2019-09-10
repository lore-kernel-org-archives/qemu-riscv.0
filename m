Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvs-0007c0-1P
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvn-0007Vl-3L
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvm-0006SW-1s
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:50 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44653)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvl-0006S5-T8
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id k6so11297375wrn.11
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=4YRrInDZ0nZMnqkxeYbaNMMDWGEYLAY0VfYbuezaFh4=;
 b=CRCa5G5lqyqRbNxzmoHgr81+HxYOeRXxYJfm/k93g1QB0h/2uKHUGrZ0B9Zm2cv+qM
 KsjC9sS8UemV7E5XK08e93UQSntpoGx11yZsMmoWqT6mBD8aPUx0w18S0EO6d77QUAiL
 Y53jjpsJvMsc31Nc9fecdKfnxhGhyGiYD2UZvLO98PZzzCrR3L/et3yxVIhib9nAeFVu
 ObVFUY2eJxQ1ubsPq8+IzgzafPgm//aHAq1/7/WaOEPf1hDT2a1wGeMnJG+4Eor7QfOd
 QEtNSQ+C/DTGOfQrg7AndhHO4ETcNZVjqv1697wYaPcoZyGuvg4zenss3fowcWMv8LvO
 OY9A==
X-Gm-Message-State: APjAAAVujf7AJnZhVn6wgy3JW6DP/t/RM23SJy6pzgjrib62Gp9a6TJt
 9ZRkat8wSb6CjUkpUXHv4fhsoRaXcR4cjg==
X-Google-Smtp-Source: APXvYqxv0C4mt0fovfgKEk29/h6jDH0gnmoSegp+CN/TXUs3DZpXOUpI3znU1rNs9l9j3hPClu01EQ==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr31264999wrn.142.1568190288501; 
 Wed, 11 Sep 2019 01:24:48 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id z21sm2012852wmf.30.2019.09.11.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:48 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:36 -0700
Message-Id: <20190910190513.21160-11-palmer@sifive.com>
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
X-Received-From: 209.85.221.67
Subject: [Qemu-riscv] [PULL 10/47] riscv: Add a helper routine for finding
 firmware
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:54 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This adds a helper routine for finding firmware. It is currently
used only for "-bios default" case.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c         | 22 +++++++++++++++-------
 include/hw/riscv/boot.h |  1 +
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 4c63b5cf8a..10f7991490 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -69,13 +69,7 @@ void riscv_find_and_load_firmware(MachineState *machine,
          * so then in the future we can make "-bios default" the default option
          * if no -bios option is set without breaking anything.
          */
-        firmware_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-                                           default_machine_firmware);
-        if (firmware_filename == NULL) {
-            error_report("Unable to load the default RISC-V firmware \"%s\"",
-                         default_machine_firmware);
-            exit(1);
-        }
+        firmware_filename = riscv_find_firmware(default_machine_firmware);
     } else {
         firmware_filename = machine->firmware;
     }
@@ -90,6 +84,20 @@ void riscv_find_and_load_firmware(MachineState *machine,
     }
 }
 
+char *riscv_find_firmware(const char *firmware_filename)
+{
+    char *filename;
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    if (filename == NULL) {
+        error_report("Unable to load the RISC-V firmware \"%s\"",
+                     firmware_filename);
+        exit(1);
+    }
+
+    return filename;
+}
+
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr)
 {
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 1f21c2bef1..66075d0e57 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -25,6 +25,7 @@
 void riscv_find_and_load_firmware(MachineState *machine,
                                   const char *default_machine_firmware,
                                   hwaddr firmware_load_addr);
+char *riscv_find_firmware(const char *firmware_filename);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr);
 target_ulong riscv_load_kernel(const char *kernel_filename);
-- 
2.21.0


