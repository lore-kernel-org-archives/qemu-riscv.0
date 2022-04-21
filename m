Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhPoV-0000Ps-EV
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 01:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhPo3-0000KS-2z; Thu, 21 Apr 2022 01:56:48 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhPo1-0001qE-DG; Thu, 21 Apr 2022 01:56:42 -0400
Received: by mail-pg1-x536.google.com with SMTP id g9so3762028pgc.10;
 Wed, 20 Apr 2022 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s6nteJyOWgHk0MoyoL2TKp3HlZWDYswLgM5u+BHfpFU=;
 b=P5QZ0JOhSvW1bH2LzG0rbY61YQcEjrlCBTuJNXcbx3LSZjOd5qLvY7byQo7C4p2SzB
 o5qgx8dom6qtIlCAeBi2laPEnOhlnhyO0zyhfA0Lg58ik86CCAw89RriP7lctZ3I2U6b
 kTO25IGp79jzJjUt/QUc6lmC/IMRmJPmNcE2bUKqOlTeN9PtNWo0LU+/SxNd5v9W0+14
 r0AU1dAXfK9Kc97WAUrHMen2cRKLMoXtKDO+RHP3KbwnsbLDYyh1cZCR8MY2R9ixDEbT
 eJsEQR/iXoEc+nHh7c8483nWIDU3POitCl9K5A7d6W+8ak73AAxktLmd1oF2fIEb7O+3
 963w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s6nteJyOWgHk0MoyoL2TKp3HlZWDYswLgM5u+BHfpFU=;
 b=RW0N7zgxxeAl+YyEoJPcWJeys5lJ6FzN3TU4eBB2rhij2HUuu2Y04GTVBTLXtsi4j1
 c1U3IUpMGKCUWT+gjGKVJ+G3XxsAceVJ3GKKpYVOH6+zvs9sHqlYSLezohokUtFAZjD1
 FqfV7R0GlQEvaVQza1VhujBG/qBlRFQmeAM+pecAANiZ12uN/BbDWwjr+F1xJIo57VWl
 IFpyEisErN7u6a5VQFTWVBoXVPOIN9g55RXXEzjI2WwHDu4XwrnpannvLafkjstK2Yoj
 GEZpKscyYkGxXfgFyzKSwvZb9rGIO0e9HwUmB5W2g3n5TdBfqrsxwAqCRkXRv/e1Tmax
 xL+g==
X-Gm-Message-State: AOAM533KI9LNL9nSrOrtl35cHcV8vgrb63ZSqprQgA/uwiR2d5ZYL2Z9
 RizwQ3nRvXmiV2WUziG7zxb6etlhZ2c=
X-Google-Smtp-Source: ABdhPJy0Vj/YSBj3brl0wBFw0avUwELQZwTtJ3J9IUQ9xiX39eg8tIe16a3Mu2+ogVeZNk+akY8xpQ==
X-Received: by 2002:a05:6a00:1490:b0:4fb:1544:bc60 with SMTP id
 v16-20020a056a00149000b004fb1544bc60mr27022013pfu.73.1650520599624; 
 Wed, 20 Apr 2022 22:56:39 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 x16-20020a17090ab01000b001cd4989ff4bsm1169300pjq.18.2022.04.20.22.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 22:56:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/2] hw/riscv: Don't add empty bootargs to device tree
Date: Thu, 21 Apr 2022 13:56:29 +0800
Message-Id: <20220421055629.1177285-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421055629.1177285-1-bmeng.cn@gmail.com>
References: <20220421055629.1177285-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 21 Apr 2022 05:57:03 -0000

From: Bin Meng <bin.meng@windriver.com>

Commit 7c28f4da20e5 ("RISC-V: Don't add NULL bootargs to device-tree")
tried to avoid adding *NULL* bootargs to device tree, but unfortunately
the changes were entirely useless, due to MachineState::kernel_cmdline
can't be NULL at all as the default value is given as an empty string.
(see hw/core/machine.c::machine_initfn()).

Note the wording of *NULL* bootargs is wrong. It can't be NULL otherwise
a segfault had already been observed by dereferencing the NULL pointer.
It should be worded as *empty" bootargs.

Fixes: 7c28f4da20e5 ("RISC-V: Don't add NULL bootargs to device-tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 hw/riscv/spike.c           | 2 +-
 hw/riscv/virt.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index cafd1fc9ae..10a5d0e501 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -571,7 +571,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                   "linux,initrd-end", end);
         }
 
-        if (machine->kernel_cmdline) {
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
             qemu_fdt_setprop_string(machine->fdt, "/chosen",
                                     "bootargs", machine->kernel_cmdline);
         }
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..cc8c7637cb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -511,7 +511,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     g_free(nodename);
 
 update_bootargs:
-    if (cmdline) {
+    if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1562b000bb..068ba3493e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -177,7 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
 
-    if (cmdline) {
+    if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..a628a3abdf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -998,7 +998,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     create_fdt_flash(s, memmap);
 
 update_bootargs:
-    if (cmdline) {
+    if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
     }
 }
-- 
2.25.1


