Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prFs7-0002h0-Un
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 06:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1prFs1-0002g7-Qu
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 06:26:02 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1prFrz-0008Vm-UE
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 06:26:01 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-38e5eeba43cso1809531b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682418358; x=1685010358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jaMha8KMuusMoaFz3efdY0jc86c4PJOQMzqKQheE2YQ=;
 b=UDEHCF4UBkHAw5nIo3OkdqxcPZF7YaEuttJbNp6lIYOXRoXtIEkmqxckcdUoFCkKyR
 Zz1hs+2fpq5lU8++QDJqbIxQLilMVyxq+nYRQWd08pXFOn5RgZds2t4e0OSVPalH9GbP
 0HFRoDXABiVlY4v4+Cbpmis1x/sJalbT9Gc5LbsgAp3LUT5UIhsdtt852QlV4Vcw/5w+
 uKs9izDyCdf0bI1GWbojZ3M0RasMqVof6KxERWWuXdkrC1xM4sjT8uN9JlorUt7hSLDD
 5JlLQLuEWnVL+qiFb0PX5gi+Efq0atUeBDSYhJUDj432aPTO6oW4+RDPaEs8tG80zP5J
 qCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682418358; x=1685010358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jaMha8KMuusMoaFz3efdY0jc86c4PJOQMzqKQheE2YQ=;
 b=Pd8DVmYVb/ka0R1uPkbOvylSK0kcsm+Lz1oJ2pwHCCPxjE7oq+Ka+F0JDrErj6s+Sh
 9PXpngT2qF/Ow88hQwgPYiPBOweEOJDRC2N1Tr796SC9xThabEExR8qKtPwM9Of7dGJM
 t67fyvUBo1HifX+hE5xFOsiFLCXB944XNd3E213eIl4MnCmGRIXqUyWVLCm6n2IseJas
 EGiptNjCnymTgWB7n9bCDzwwKCibcX1nmglU6iIXo13hjFGQGmcRsylBgibxDmFio3cQ
 p+o+6o/tpxODfwD8B3TKTZioBeShzAwVNXO5FsYZJddHOgpYICfeIXj1ftD7SYWPRmHo
 B2wA==
X-Gm-Message-State: AAQBX9dgH2ylIlNOYPe9fXo0gk7GM3l9eKZ4e4gJOe718zrn6UtbV5z+
 AykuigidsZ7xEW+estN/sjZ/k12e4aRthhaZvxU=
X-Google-Smtp-Source: AKy350Y5iU/N1zH//Ehkg622x3dBTDKd0PqypyvBtjI7jiU26SOVkXvQEtVct5Zn9tAR7zrwamBleg==
X-Received: by 2002:aca:1c15:0:b0:38c:647b:e2a5 with SMTP id
 c21-20020aca1c15000000b0038c647be2a5mr8212408oic.2.1682418357939; 
 Tue, 25 Apr 2023 03:25:57 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e90:4e5:dd88:3e29:de46:4739])
 by smtp.gmail.com with ESMTPSA id
 v132-20020acade8a000000b00383eaf88e75sm5458285oig.39.2023.04.25.03.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 03:25:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Date: Tue, 25 Apr 2023 15:55:45 +0530
Message-Id: <20230425102545.162888-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Apr 2023 10:26:05 -0000

Currently, virt machine supports two pflash instances each with
32MB size. However, the first pflash is always assumed to
contain M-mode firmware and reset vector is set to this if
enabled. Hence, for S-mode payloads like EDK2, only one pflash
instance is available for use. This means both code and NV variables
of EDK2 will need to use the same pflash.

The OS distros keep the EDK2 FW code as readonly. When non-volatile
variables also need to share the same pflash, it is not possible
to keep it as readonly since variables need write access.

To resolve this issue, the code and NV variables need to be separated.
But in that case we need an extra flash. Hence, modify the convention
such that pflash0 will contain the M-mode FW only when "-bios none"
option is used. Otherwise, pflash0 will contain the S-mode payload FW.
This enables both pflash instances available for EDK2 use.

Example usage:
1) pflash0 containing M-mode FW
qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
or
qemu-system-riscv64 -bios none \
-drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt

2) pflash0 containing S-mode payload like EDK2
qemu-system-riscv64 -pflash <smode_fw_vars> -pflash <smode_fw_code> -machine  virt
or
qemu-system-riscv64 -bios <opensbi_fw> \
-pflash <smode_fw_vars> \
-pflash <smode_fw_code> \
-machine  virt
or
qemu-system-riscv64 -bios <opensbi_fw> \
-drive file=<smode_fw_vars>,if=pflash,format=raw,unit=0 \
-drive file=<smode_fw_code>,if=pflash,format=raw,unit=1,readonly=on  \
-machine virt

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
The issue is reported at
https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1e53c619ce60587f6

The patch is based on Alistair's riscv-to-apply.next branch.

Changes since v1:
	1) Simplified the fix such that it doesn't break current EDK2.

 hw/riscv/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..ca445d3d02 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1296,10 +1296,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_entry = 0;
     }
 
-    if (drive_get(IF_PFLASH, 0, 0)) {
+    if (drive_get(IF_PFLASH, 0, 0) &&
+                 machine->firmware && !strcmp(machine->firmware, "none")) {
         /*
-         * Pflash was supplied, let's overwrite the address we jump to after
-         * reset to the base of the flash.
+         * Pflash0 was supplied with "-bios none", let's overwrite the address
+         * we jump to after reset to the base of the flash.
          */
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
-- 
2.34.1


