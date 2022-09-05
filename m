Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oV3kE-0003PV-4B
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 00:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oV3kA-0003Or-Pq
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 00:29:55 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oV3k8-0004NK-A8
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 00:29:53 -0400
Received: by mail-pg1-x529.google.com with SMTP id c24so7074912pgg.11
 for <qemu-riscv@nongnu.org>; Sun, 04 Sep 2022 21:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=JEqOjE7qgfPHaAK0g036/FP/i4rSlui0iDxhlSDYI4Y=;
 b=H4C2A2NE8s7LXsa2Ku/O9E8Z3Cs/qk7bs7cif2qNhRm9JXRvtZ/rzY1dRbHTJTWLCL
 c5PKoyyCWYnHdo4IdEnUXYRrscju+vK2Whm6noZ/m1Fl93W8bLEjIS8h3m25AGsvL3wp
 BsTjDzb715RpJvv8LkQwYF03vhvs3xWp9LPRxKkbzRrfoM22AdbyW53t3Rj8FPGOjsFU
 ZVhfSNM8czywd7W8TJfdrWkiOjy9AwCuh3fcTelVgfluQbg8G3mtnkKys+6sLOk73k2x
 0emXGa5UhNGrWlf0AXA82xnfnE8C4OILEyxHzPvF8MIk4gXQL08/o1bipFlttqIdgDHS
 H3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=JEqOjE7qgfPHaAK0g036/FP/i4rSlui0iDxhlSDYI4Y=;
 b=zuxkxip3B8JQBTAgv8nOfO7juOViVNOG4n301HdcOO2h30sfS5gb8IbLQMhQ3sTBj4
 zAB0R8iRsYl79cYur2nZGX1yD3Gt0Jotxvc0nNuIu0Rp5jiNPBXeriQVCCMIk4OzA5Dv
 RbpfOG3AEpFh8eHIICYOuArFGKsZU89thpAYplE7uGdCmz7pf5X3zifwlcTPeGRtjwM/
 4K6/tnvBzLXQ5IUJDGlIfemcXMqElscRZCPIX7jRHoeN5I2HwequXzQun0bEnpmM60z6
 lYV9jWZ/Rt5SEtxV41CEc30I7bZjJtvrOSeefZ89wBXO6l5ivg/HoKjMqhVnCq3xv0jw
 UzWA==
X-Gm-Message-State: ACgBeo1WghjxyHsTUaont6xQccTiW542tbZmwq1plk0MX5q6P5gxE1hi
 c5cB3PnukoqLtELW165ZWRs0Aw==
X-Google-Smtp-Source: AA6agR5xIFvtRd0tnQjOPqbtKxZQWtaokSfzznmhMDUnRwy3NiEHtibWLUvbcIcVi7pxNbX9apEHbw==
X-Received: by 2002:a05:6a00:1501:b0:52e:67e9:56d7 with SMTP id
 q1-20020a056a00150100b0052e67e956d7mr48288348pfu.48.1662352187904; 
 Sun, 04 Sep 2022 21:29:47 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 a20-20020aa795b4000000b0053812f35a41sm6526113pfk.194.2022.09.04.21.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 21:29:47 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH] hw/riscv: virt: Enable booting S-mode firmware from pflash
Date: Mon,  5 Sep 2022 09:59:40 +0530
Message-Id: <20220905042940.146913-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Sep 2022 04:29:55 -0000

To boot S-mode firmware payload like EDK2 from persistent
flash storage, qemu needs to pass the flash address as the
next_addr in fw_dynamic_info to the opensbi.

Update the kernel_entry with the flash address when no kernel
is specified via QEMU command line  so that opensbi
can jump to the flash address. This assumes flash drive unit 1 is
used to keep dynamic payload similar to other architectures.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ff8c0df5cd..1ee855fded 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1284,6 +1284,18 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    if (drive_get(IF_PFLASH, 0, 1)) {
+        /*
+         * Assume second pflash unit (unit=1) to hold the S-mode firmware
+         * like EDK2. Set kernel_entry to flash address if kernel argument
+         * is not set and pflash unit 1 is configured.
+         */
+        if (!kernel_entry) {
+            kernel_entry = virt_memmap[VIRT_FLASH].base +
+                             virt_memmap[VIRT_FLASH].size / 2;
+        }
+    }
+
     /*
      * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
      * tree cannot be altered and we get FDT_ERR_NOSPACE.
-- 
2.25.1


