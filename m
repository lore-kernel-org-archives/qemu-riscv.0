Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNi-00068N-AM
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNg-00065Q-Go; Mon, 29 Mar 2021 13:08:48 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:39712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNb-0004Vr-CF; Mon, 29 Mar 2021 13:08:48 -0400
Received: by mail-qv1-xf34.google.com with SMTP id q9so6801004qvm.6;
 Mon, 29 Mar 2021 10:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sctzd6sCDsdKz4W7rd8g7ptCxPS8jcNkmPFt25WCiiU=;
 b=dzesrvinxPR9SvW+bISMEizvwnRRi1mAbLXvnlHgyW1mktamMI4LEq/Z7SxHaux8sK
 n9NRguqdCRGcLq+c5hilq+BRE92e5YLtLS9XFY9UcH+0vPyzGzePLr7A82ilR0YIivI2
 f6c+bC1gWf+t4CpoKoj0tGVaK7JyM2GKUvluS49kjH6TByXZzcyZZdNwpAQDPJirQsX+
 a89rOoYgjQ1l6VzIgwDnagzb7szzk0io4hcVQqT7/GNuWvtXmYBK3mmovcNMTYe0iFMO
 0MgpTOZ0i4hC1JxC4/dJZLD6ofniF18gw1Bu9+hLiHSEmEew40TNojDcb9IqHkt1Kpkr
 +gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sctzd6sCDsdKz4W7rd8g7ptCxPS8jcNkmPFt25WCiiU=;
 b=N71sJv5Dwon+fX92oEdvNUAXsHG7YIVWDATDvXmsi9A6q1FaTCy6SbaTgcdAcx0e0j
 UT+JQvj75ZOnYb8szGaWRu5fC1FnDjqsfvlZFm0AGlIpWeB2wtrC8oJPNidT9CqOEEvg
 ydODL++z0XOB6HbThtXYGJj0z/woBsFjKhQqleJ/w5vWQTLC4Hvfvk4CZVPG0a8bX3rH
 8op9vh3ZGNWoCAcBhZJAgTq8eN+VNQoP+8LqT3p2+9PlBMgyOhb4yv6T5fPNbj/30l92
 oTggoIQC/gbJPExOahfZEyqcB9LVfsWEcUXK7rj6+dkHYDojSJ0ULKNXTaqAR5NoQPzv
 JW7Q==
X-Gm-Message-State: AOAM530Ea7cY0yDL6a7LoGb42LZCUyVkxEBVdZsFVSS64PmHY2d1/fCN
 GBZVBKCKsd9ViDQtO+Fvk0OsdhHGWdk=
X-Google-Smtp-Source: ABdhPJwt8seZikjGPhkIcEdelnVIS3hjjMH3jTeaNIIQDogSRelkX4mR5DtbLVrtDsakHnDy98QV9w==
X-Received: by 2002:a0c:f44d:: with SMTP id h13mr26427553qvm.31.1617037721572; 
 Mon, 29 Mar 2021 10:08:41 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 7/8] hw/riscv: Use macros for BIOS image names
Date: Tue, 30 Mar 2021 01:08:17 +0800
Message-Id: <20210329170818.23139-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:49 -0000

From: Bin Meng <bin.meng@windriver.com>

The OpenSBI BIOS image names are used by many RISC-V machines.
Let's define macros for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/riscv/boot.h | 5 +++++
 hw/riscv/sifive_u.c     | 6 ++----
 hw/riscv/spike.c        | 6 ++----
 hw/riscv/virt.c         | 6 ++----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 11a21dd584..0e89400b09 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -24,6 +24,11 @@
 #include "hw/loader.h"
 #include "hw/riscv/riscv_hart.h"
 
+#define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
+#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
+#define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
+#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
+
 bool riscv_is_32bit(RISCVHartArrayState *harts);
 
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 651a439528..d484ec3483 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -557,12 +557,10 @@ static void sifive_u_machine_init(MachineState *machine)
 
     if (riscv_is_32bit(&s->soc.u_cpus)) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
     if (machine->kernel_filename) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc33061f23..4f19c8acba 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -257,13 +257,11 @@ static void spike_board_init(MachineState *machine)
      */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.elf",
-                                    memmap[SPIKE_DRAM].base,
+                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.elf",
-                                    memmap[SPIKE_DRAM].base,
+                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     }
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d04733d97c..25e845fc78 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -676,12 +676,10 @@ static void virt_machine_init(MachineState *machine)
 
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
     if (machine->kernel_filename) {
-- 
2.25.1


