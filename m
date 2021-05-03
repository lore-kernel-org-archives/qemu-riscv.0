Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldh9e-0000eg-5V
	for mharc-qemu-riscv@gnu.org; Mon, 03 May 2021 18:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldh9P-0000Z0-H9; Mon, 03 May 2021 18:34:53 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldh9J-00029V-KK; Mon, 03 May 2021 18:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620081285; x=1651617285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=996xNHOaJte2Ne5Z1bf2gQTkRE6nHIOU5XBHX1YwcPI=;
 b=HOjrypn/qPGr6onxTKcWOrQBPfY+nxu2D3WuUbleEXhTrXqPv35yOLK2
 FxcD9b+IdwQ6MoNc1fcjwV75r0zWm0EjRO6HcpNvBbySAFnSQOB//oDKV
 tY0ZcLdWvIePzgwPhp1zesdxA5VPsU44gAjpWinWK9CvgfcXnH5k99qRR
 0JlDmuDQW47+3DYUte/Wsfp3QCheeXlRegHu7tgQTWlh4THKdVuPkysaj
 gFCfSgU3WHuBiKq2fzJpneHmkv753hKRqd26fAVuYRgtO2TjluRuGNCh1
 Z566OoGpYsKNKQRZoHAHZ4mihfl63szNRDP5dIkBp4o6eSDVH7SyAzoEY w==;
IronPort-SDR: x9Agqk8OCKQbz57lLHecoSuWvQNitrXi4Sej8eG0DcEzQJdO0oboO4q4Ou59g04eoPt7CWzwWy
 QCiyM4UYZzYCYy4W6bKpGAcF2vxDPk2yYdjBk/0N8fjQA6Qh+Z7VV1BxpC+M6Q8ZlQdbEY7R/f
 V8cIEhg9mwYd864FzBlwNt+hTLe5QoVrReYX1Hfvc9fw/mMveJ5zkuEcgLDN5bRYm65uQqW165
 A3tDNh65vCpGZZQCAWimkFcUaFHkjfhfFBNmxNbIvDGl/jZG1MzEECDS0JC/gQK9iBMLRdqJxg
 QPQ=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278115916"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:34:43 +0800
IronPort-SDR: Zs3o2UK2xTaqpigD7dB9EnnQghMjb3X5lOmCSIuRbecFotmEKFaFoyjMEq+n8G9wqQpl1Ck8aJ
 GDLLdjuLUsBEOX54xPchFI4caXGhTUcPjlQfNZEvj5++kwte5A19UqfJ41qJcWvtFMHG4SuGm8
 qK/EFEU9iYYUIb1j0R+spmXdZIDA82Tbo9vdclYobb4DecXqq2DZV9lQG0882FTNgC0/Hi5MkX
 gOkaGodBBprHp0WTSaupHMNrtIkJRC9djAMyPcyc4K4wqFrKjZss5PqsviSHzDyZFSN7tSEz/A
 iYUZlEkoQO++x4HN/C5mBqdu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 15:13:26 -0700
IronPort-SDR: 3z9i/FQL4vCRhrfzHPH3HxEL0djO3l0t5josBZIRzbP9A+gh+Brtpo5mDn/gdVO6huyMYwmVmM
 qFU8/LCnKSZbvXGm5TdUZbDMTaZ9IxkQzzkn609PPlUfvi/WnRSc53O3kKXrzU+0yR5d96TDEy
 ycy8pmr0o7O5WKYKsBY3/inz5hmeVgEhb+rDdVe5qyC/MnDGfB7wpz9ZGHQDmvVb4BBkXfXc8s
 3Q6gxxWdCqH35zFNl319Ip+k6VgLqbfnnqUY5fm++DsmluvmczWjpUbc634ZeXPK8KNkTDnwQs
 J1M=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:34:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] docs/system: Move the RISC-V -bios information to
 removed
Date: Tue,  4 May 2021 08:34:32 +1000
Message-Id: <4f1c261e7f69045ab8bb8926d85fe1d35e48ea5b.1620081256.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 03 May 2021 22:35:00 -0000

QEMU 5.1 changed the behaviour of the default boot for the RISC-V virt
and sifive_u machines. This patch moves that change from the
deprecated.rst file to the removed-features.rst file and the
target-riscv.rst.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/deprecated.rst       | 19 -------------------
 docs/system/removed-features.rst |  5 +++++
 docs/system/target-riscv.rst     | 13 ++++++++++++-
 3 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae86252..dd83c95211 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -52,25 +52,6 @@ pcspk-audiodev=<name>``.
 ``tty`` and ``parport`` are aliases that will be removed. Instead, the
 actual backend names ``serial`` and ``parallel`` should be used.
 
-RISC-V ``-bios`` (since 5.1)
-''''''''''''''''''''''''''''
-
-QEMU 4.1 introduced support for the -bios option in QEMU for RISC-V for the
-RISC-V virt machine and sifive_u machine. QEMU 4.1 had no changes to the
-default behaviour to avoid breakages.
-
-QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``.
-
-QEMU 5.1 has three options:
- 1. ``-bios default`` - This is the current default behavior if no -bios option
-      is included. This option will load the default OpenSBI firmware automatically.
-      The firmware is included with the QEMU release and no user interaction is
-      required. All a user needs to do is specify the kernel they want to boot
-      with the -kernel option
- 2. ``-bios none`` - QEMU will not automatically load any firmware. It is up
-      to the user to load all the images they need.
- 3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
-
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 29e90601a5..747a763b37 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -126,6 +126,11 @@ devices.  Drives the board doesn't pick up can no longer be used with
 This option was undocumented and not used in the field.
 Use `-device usb-ccid`` instead.
 
+RISC-V firmware not booted by default (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``
+for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 8d5946fbbb..0001c55fca 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -69,5 +69,16 @@ undocumented; you can get a complete list by running
    riscv/microchip-icicle-kit
    riscv/sifive_u
 
-RISC-V CPU features
+RISC-V CPU firmware
 -------------------
+
+When using the ``sifive_u`` or ``virt`` machine there are three different
+firmware boot options:
+ 1. ``-bios default`` - This is the default behaviour if no -bios option
+      is included. This option will load the default OpenSBI firmware automatically.
+      The firmware is included with the QEMU release and no user interaction is
+      required. All a user needs to do is specify the kernel they want to boot
+      with the -kernel option
+ 2. ``-bios none`` - QEMU will not automatically load any firmware. It is up
+      to the user to load all the images they need.
+ 3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmware.
-- 
2.31.1


