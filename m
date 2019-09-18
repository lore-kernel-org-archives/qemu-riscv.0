Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAc2P-00087O-HG
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAc2F-0007x8-Hs
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:38:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAc2D-0005ZD-Lm
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:38:27 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45686)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAc2D-0005YT-Fc
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:38:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id 4so38643pgm.12
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=4YRrInDZ0nZMnqkxeYbaNMMDWGEYLAY0VfYbuezaFh4=;
 b=c38fX4hIJSAviPhrDLuCMrp4ea8D7sGbEHckEptYX8405lRTA4DWOdFEEBRbNCMBXw
 9Bv3w7cYucwhOmO3j0uZkyHrfygQHdvPjgVf9iA9VCoYSWRDgVvm7HkzNDc+bsbDrUhn
 /TNRUIJ9Th6LBGjWttiUMgvgVaY0P3mCX9OwdtPc2VOzDmY+iMpX5NUh7dRGDgo3hjLY
 uq2dctlb+CF47C6+NLgHQpHpgbLq15ciJAp6qxzq2CpF2cycBtvW8ec20IVQwxC0XE0G
 jDCKqNhO9/OyzQvlZLV85b9t5u5rs6EJf3QwMD9zbR4WB4oAtBAeVc/3/TX2yENf+TEa
 wSdg==
X-Gm-Message-State: APjAAAVAcU2qsXZ8d9jaLOKocjk3772ncEyDE6n4n27aY4oMuylAIDgg
 G6do23ZwbwoNrUZyd23pNAxKZXzq4oM=
X-Google-Smtp-Source: APXvYqwui2dNepizw4JatJ8OKBdbMKN9XD15Ux8yJmucytEK+b2+zMMFOYapC67K7LSMCR+Z+hICSg==
X-Received: by 2002:a63:925d:: with SMTP id s29mr4631021pgn.144.1568821103000; 
 Wed, 18 Sep 2019 08:38:23 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e189sm6644475pgc.15.2019.09.18.08.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:38:22 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:02 -0700
Message-Id: <20190918145640.17349-11-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 10/48] riscv: Add a helper routine for finding
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
X-List-Received-Date: Wed, 18 Sep 2019 15:38:32 -0000

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


