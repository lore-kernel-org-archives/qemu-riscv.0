Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP51g-0002A7-Aq
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 11:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP51e-00029g-Ep; Sat, 11 Sep 2021 11:34:42 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP51c-0005iA-OP; Sat, 11 Sep 2021 11:34:42 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f21so813246plb.4;
 Sat, 11 Sep 2021 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eAFVni2yUlOJONWFhPyU1OiFQ3sEB2MqnLEKknFi9Yk=;
 b=l/+kB7KjbDhk9j1XmPu8EU5KQF85Nvr5K1awFInLELjcazlAOStkIKrX7369jH1lxK
 IFl5kgNnXhizP1/QZZb0iZjjbLOQyM2Ey/xkpp/u3gLzMjZie0nPG0U1G1XfNfck0jcj
 RZuENnQI5TJvzXWTQORd217OuukbcLZcyZKsQalnOMBnye1T6SRZvSIUFdoM4D+JonDa
 glafm5cy/amjQCX3oPZgFcbS6wjGSw2mZGIY2AbYLADYPQXMzuvczX6umvMGIr25U1bO
 QB8kKThMxqaPM5YT7cmw2GrYkMUDxVP4IPmRAXSwE9YNmncUPHo+3IOBd6oZpka6ta9B
 r/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eAFVni2yUlOJONWFhPyU1OiFQ3sEB2MqnLEKknFi9Yk=;
 b=LoS9ysqsFQz8OZ19e57DI5iy3wwmsIFCHn988/iv7Ld6GvlQM0EasKFvKgJPn3AY6d
 8RYAM/a9G9/GnRDi8g5IN7RKdVSp/9afGa6+eXdXxtXmeduj1LQgkvSTHEcZEee9dnUy
 IfFW0UyYnYKGXyll1BKE0ln6PkmxtJxOp3X+Ixsn63ZZfPV+lzeglZEDfYh7Jzfo2LTp
 9k33PvRWFcEo9REQXhV3dzktcCg2a6f9J8oizwkzxMWoRvJhu0fUIJUPsa6koToGAsUD
 sli766tVLlA1J/atztUHZPMhkyrt6+6PrqJ1M0jiksWeazcHOsgFrLPnAdJebW4Chicn
 PJhQ==
X-Gm-Message-State: AOAM533SN+LAR3jQlXxQjOxqb4jLY2olVuxHbV9dTfQ/f9mbJdmdpEj6
 YVpC1RYukD9L09oPlPzSNgo=
X-Google-Smtp-Source: ABdhPJxt/fgIyWFzbAlbM7CYiZu8IQcpKq2P1nrkJpRL2RG35SGMHBXN3iFgR3GyfT+3b2VWBv4sng==
X-Received: by 2002:a17:90b:380c:: with SMTP id
 mq12mr3506033pjb.73.1631374478863; 
 Sat, 11 Sep 2021 08:34:38 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 19sm2291461pfh.12.2021.09.11.08.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 08:34:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] docs/system/riscv: sifive_u: Update U-Boot instructions
Date: Sat, 11 Sep 2021 23:34:31 +0800
Message-Id: <20210911153431.10362-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Sat, 11 Sep 2021 15:34:42 -0000

In U-Boot v2021.07 release, there were 2 major changes for the
SiFive Unleashed board support:

- Board config name was changed from sifive_fu540_defconfig to
  sifive_unleashed_defconfig
- The generic binman tool was used to generate the FIT image
  (combination of U-Boot proper, DTB and OpenSBI firmware)

which make the existing U-Boot instructions out of date.

Update the doc with latest instructions.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/system/riscv/sifive_u.rst | 49 ++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 01108b5ecc..8ac93d0153 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -209,15 +209,16 @@ command line options with ``qemu-system-riscv32``.
 Running U-Boot
 --------------
 
-U-Boot mainline v2021.01 release is tested at the time of writing. To build a
+U-Boot mainline v2021.07 release is tested at the time of writing. To build a
 U-Boot mainline bootloader that can be booted by the ``sifive_u`` machine, use
-the sifive_fu540_defconfig with similar commands as described above for Linux:
+the sifive_unleashed_defconfig with similar commands as described above for
+Linux:
 
 .. code-block:: bash
 
   $ export CROSS_COMPILE=riscv64-linux-
   $ export OPENSBI=/path/to/opensbi-riscv64-generic-fw_dynamic.bin
-  $ make sifive_fu540_defconfig
+  $ make sifive_unleashed_defconfig
 
 You will get spl/u-boot-spl.bin and u-boot.itb file in the build tree.
 
@@ -312,31 +313,29 @@ board on QEMU ``sifive_u`` machine out of the box. This allows users to
 develop and test the recommended RISC-V boot flow with a real world use
 case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM,
 then U-Boot SPL loads the combined payload image of OpenSBI fw_dynamic
-firmware and U-Boot proper. However sometimes we want to have a quick test
-of booting U-Boot on QEMU without the needs of preparing the SPI flash or
-SD card images, an alternate way can be used, which is to create a U-Boot
-S-mode image by modifying the configuration of U-Boot:
+firmware and U-Boot proper.
+
+However sometimes we want to have a quick test of booting U-Boot on QEMU
+without the needs of preparing the SPI flash or SD card images, an alternate
+way can be used, which is to create a U-Boot S-mode image by modifying the
+configuration of U-Boot:
 
 .. code-block:: bash
 
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make sifive_unleashed_defconfig
   $ make menuconfig
 
-then manually select the following configuration in U-Boot:
-
-  Device Tree Control > Provider of DTB for DT Control > Prior Stage bootloader DTB
+then manually select the following configuration:
 
-This lets U-Boot to use the QEMU generated device tree blob. During the build,
-a build error will be seen below:
+  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior Stage bootloader DTB
 
-.. code-block:: none
+and unselect the following configuration:
 
-  MKIMAGE u-boot.img
-  ./tools/mkimage: Can't open arch/riscv/dts/hifive-unleashed-a00.dtb: No such file or directory
-  ./tools/mkimage: failed to build FIT
-  make: *** [Makefile:1440: u-boot.img] Error 1
+  * Library routines ---> Allow access to binman information in the device tree
 
-The above errors can be safely ignored as we don't run U-Boot SPL under QEMU
-in this alternate configuration.
+This changes U-Boot to use the QEMU generated device tree blob, and bypass
+running the U-Boot SPL stage.
 
 Boot the 64-bit U-Boot S-mode image directly:
 
@@ -351,14 +350,18 @@ It's possible to create a 32-bit U-Boot S-mode image as well.
 .. code-block:: bash
 
   $ export CROSS_COMPILE=riscv64-linux-
-  $ make sifive_fu540_defconfig
+  $ make sifive_unleashed_defconfig
   $ make menuconfig
 
 then manually update the following configuration in U-Boot:
 
-  Device Tree Control > Provider of DTB for DT Control > Prior Stage bootloader DTB
-  RISC-V architecture > Base ISA > RV32I
-  Boot images > Text Base > 0x80400000
+  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior Stage bootloader DTB
+  * RISC-V architecture ---> Base ISA ---> RV32I
+  * Boot options ---> Boot images ---> Text Base ---> 0x80400000
+
+and unselect the following configuration:
+
+  * Library routines ---> Allow access to binman information in the device tree
 
 Use the same command line options to boot the 32-bit U-Boot S-mode image:
 
-- 
2.25.1


