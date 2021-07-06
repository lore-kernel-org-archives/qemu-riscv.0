Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0hij-0007dg-Ce
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 05:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0hih-0007ZD-9n; Tue, 06 Jul 2021 05:50:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0hif-0003Yc-8r; Tue, 06 Jul 2021 05:50:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id c17so33164822ejk.13;
 Tue, 06 Jul 2021 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fY7hbtR5nAg5Ha144ZKkJXuGDOU3o/3kVizCyviJB3U=;
 b=ak5MDuIwGL5EVE8oM0DohVr915EWylktRr1XD6DqMrlfjOEQjWWbs+RksZcTV/Q8M3
 29PXgBl8WGlZKaByFui+S1iGm8svHUd9RoPufNK2Wz6iADr/9FrPfElIpiT3XQLkVr4M
 FGAsKppuZ86MKp2SVox4bEhVD2PMYzmVIX6tY7W06aVdn5W3pVq0JzN5HD+CcqMri1Ri
 C3YfW/xITknsy0oaqiOEHzlR5b1T0k0plxKngv+mZORbrgK0YzeksJWRV27MtTkwK1RT
 6r8Nkxg0PRR/6nexDRlFSBURCx6sPxvo1liSms+Uy7c+Fh561eYeNRRJA71TFNzs7jhI
 3IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fY7hbtR5nAg5Ha144ZKkJXuGDOU3o/3kVizCyviJB3U=;
 b=lao0vbCkySFbi+KlluI+z2gjWly4KvyF0ArTtq4WdKuMt+lVG/Am9ej3n86YweLTXM
 G4veNpu+3wkKK8ImXGp+u92MuiHG09Im+LH948xoGCKK+ZGUe9Huhyd6deW6pTdRzbAn
 dG4emkz67Sjhvd1cckm6GEpxBAp5cliortvNZCiMgrdD9IDbQSNAxs2bgdt00mKChHkg
 bVCDXHz5hwxD4DX9eNm+eXDksKD3FY3XC7ljRl+ZVkHbI5xDODd7iFU884pfkyxJX0nu
 we0tKTEFzAnzM1862h2lpbA1fh2I/yVum4/kuW3LLsktoKK3ShUkpPIyCWoxE3j9ZReE
 Cm1g==
X-Gm-Message-State: AOAM531h9Edp/+N/belrNXIvKim48CBFerM63dKsSPeBMotXmRVXbKiu
 kVLDBygU4ebJpPgZG0GzwWs=
X-Google-Smtp-Source: ABdhPJz3XrHV2K5CXsh6FeFb3nvAXGi7HPGPlsjonuTadqE+sxlbpmFUjSSs9aHoPzbMeGDPF7otNg==
X-Received: by 2002:a17:906:7711:: with SMTP id
 q17mr10163109ejm.437.1625565017967; 
 Tue, 06 Jul 2021 02:50:17 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id s6sm5223106ejo.4.2021.07.06.02.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 02:50:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] docs/system: riscv: Update Microchip Icicle Kit for direct
 kernel boot
Date: Tue,  6 Jul 2021 17:50:45 +0800
Message-Id: <20210706095045.1917913-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x629.google.com
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
X-List-Received-Date: Tue, 06 Jul 2021 09:50:23 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds a new section in the documentation to demonstrate how to
use the new direct kernel boot feature for Microchip Icicle Kit,
other than the HSS bootflow, using an upstream U-Boot v2021.07 image
as an example.

It also updates the truth table to have a new '-dtb' column which is
required by direct kernel boot.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/system/riscv/microchip-icicle-kit.rst | 54 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index 54ced661e3..817d2aec9c 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -47,13 +47,13 @@ The user provided DTB should have the following requirements:
 
 QEMU follows below truth table to select which payload to execute:
 
-=====  ========== =======
--bios     -kernel payload
-=====  ========== =======
-    N           N     HSS
-    Y  don't care     HSS
-    N           Y  kernel
-=====  ========== =======
+===== ========== ========== =======
+-bios    -kernel       -dtb payload
+===== ========== ========== =======
+    N          N don't care     HSS
+    Y don't care don't care     HSS
+    N          Y          Y  kernel
+===== ========== ========== =======
 
 The memory is set to 1537 MiB by default which is the minimum required high
 memory size by HSS. A sanity check on ram size is performed in the machine
@@ -106,4 +106,44 @@ HSS output is on the first serial port (stdio) and U-Boot outputs on the
 second serial port. U-Boot will automatically load the Linux kernel from
 the SD card image.
 
+Direct Kernel Boot
+------------------
+
+Sometimes we just want to test booting a new kernel, and transforming the
+kernel image to the format required by the HSS bootflow is tedious. We can
+use '-kernel' for direct kernel booting just like other RISC-V machines do.
+
+In this mode, the OpenSBI fw_dynamic BIOS image for 'generic' platform is
+used to boot an S-mode payload like U-Boot or OS kernel directly.
+
+For example, the following commands show building a U-Boot image from U-Boot
+mainline v2021.07 for the Microchip Icicle Kit board:
+
+.. code-block:: bash
+
+  $ export CROSS_COMPILE=riscv64-linux-
+  $ make microchip_mpfs_icicle_defconfig
+
+Then we can boot the machine by:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 -m 2G \
+      -sd path/to/sdcard.img \
+      -nic user,model=cadence_gem \
+      -nic tap,ifname=tap,model=cadence_gem,script=no \
+      -display none -serial stdio \
+      -kernel path/to/u-boot/build/dir/u-boot.bin \
+      -dtb path/to/u-boot/build/dir/u-boot.dtb
+
+CAVEATS:
+
+* Check the "stdout-path" property in the /chosen node in the DTB to determine
+  which serial port is used for the serial console, e.g.: if the console is set
+  to the second serial port, change to use "-serial null -serial stdio".
+* The default U-Boot configuration uses CONFIG_OF_SEPARATE hence the ELF image
+  ``u-boot`` cannot be passed to "-kernel" as it does not contain the DTB hence
+  ``u-boot.bin`` has to be used which does contain one. To use the ELF image,
+  we need to change to CONFIG_OF_EMBED or CONFIG_OF_PRIOR_STAGE.
+
 .. _HSS: https://github.com/polarfire-soc/hart-software-services
-- 
2.25.1


