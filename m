Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxO3-0007Cp-EL
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxO1-0007BL-Mq
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:13 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxO0-0003i5-0t
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:13 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so11863792otp.9
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AMN5IEYMsR/Vlag+f0ucPBQpiTUOoLxJ2g1+LXpIus=;
 b=XwIlZoj0C5UuKWo1YCBoVWC8BLWRl9Xm6D2DOKPPKTQgHsTb3N0UUzrLsYB2n9GTIM
 I6ii5Nvtx5yDXTLq52BAGva//bDAs6VsICMChTIiQfLZ+XYAs/i6bKcQOKgkPzdZmLhz
 pdTFNI47nMGGfLozKei4idQWSS6jTh+f+ahXnLr8DPdwabsQxljy1OHscKRG3SbS2CwX
 otp8keSdvWAoLKHtcGZ6T+A5olat60i+OlHSnddal+Tv9lATqhSpy/xZLcRPpbquN+JU
 8taGTaMFLKS6dG9O6w9NHAg0yII9HMPwY/AdpR4Ecx4gESQgSkSGX/vObaBEokpZhBTt
 KtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AMN5IEYMsR/Vlag+f0ucPBQpiTUOoLxJ2g1+LXpIus=;
 b=Jd5ZYbH45A9cgmg89L566Eoh+Nxe1ALaGcrgJYmBL/eK5HUiwFmkF7AAXQABwvPcvc
 BVSjHSBEYQnoOx1ptp0/FmpzCEdg281P4kaQf1FussSJaiTOAJ/JBuZ48MO9PTcO2Ujy
 lfG+an3FirjUYodxUUil09MMxF/uYmEpYV81R01j+ladLwJhLGoc8bmWd0w6uzm4ayyx
 AkfYnpft8Kdfn3kO5zWsPmoEsZEEto+WjPQyC/3aYpgukxuZR67zgcBMTtBmpa8lXVlP
 q1rWBjpmoYft4aaz0aC1qjXgyHfLq6lEVIM0uFuW4HuSyjas4stJYtRevygqEl1PD8lc
 7IBA==
X-Gm-Message-State: AFqh2kqTHS3UvsFqO2YEynYBVmuT+usXgVcw6eeff5HezoXHPHfK+Ic1
 zLOY4gAE4Hs4vSKtPE9y3SilrS5Y48QtaNmm
X-Google-Smtp-Source: AMrXdXuBs/AKag4aLM8iCcpmK4AzoiDuxQTfjML+0lMye4bg2c+C2gkusd24iOjJ+BQTwYv5p2zC2Q==
X-Received: by 2002:a05:6830:2785:b0:670:6b50:fde3 with SMTP id
 x5-20020a056830278500b006706b50fde3mr17726917otu.26.1672337530873; 
 Thu, 29 Dec 2022 10:12:10 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:12:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 09/11] hw/riscv/boot.c: use MachineState in
 riscv_load_kernel()
Date: Thu, 29 Dec 2022 15:11:33 -0300
Message-Id: <20221229181135.270661-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 29 Dec 2022 18:12:14 -0000

All callers are using kernel_filename as machine->kernel_filename.

This will also simplify the changes in riscv_load_kernel() that we're
going to do next.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c            | 3 ++-
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/opentitan.c       | 3 +--
 hw/riscv/sifive_e.c        | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 2 +-
 8 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index a78461cd14..5606ea6f43 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -171,10 +171,11 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
+    const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
 
     g_assert(kernel_filename != NULL);
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 1e9b0a420e..82ae5e7023 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,8 +629,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 85ffdac5be..64d5d435b9 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,8 +101,7 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..3e3f4b0088 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,8 +114,7 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c40885ed5c..bac394c959 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,8 +598,7 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 99dec74fe8..bff9475686 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,8 +307,7 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 02f1369843..c8e35f861e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,8 +1281,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index cfd72ecabf..f94653a09b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -43,7 +43,7 @@ char *riscv_find_firmware(const char *firmware_filename,
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-- 
2.38.1


