Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUis-0001cX-9z
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUiq-0001ZB-Mf; Mon, 18 Oct 2021 11:38:44 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUio-00071M-TO; Mon, 18 Oct 2021 11:38:44 -0400
Received: by mail-pj1-x1034.google.com with SMTP id gn3so6970627pjb.0;
 Mon, 18 Oct 2021 08:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xk5tZcB4gES1RHjvLAPIsV7P9s8Id8pMPfTjwDZZico=;
 b=f5hZt3Njr/aLlAQoJ7OdV3U4uT0XWMBceZjlrTz/me1MsPaWaYzkYnVb9mtmlVTQyo
 c93p6Q26pdeYtjQkTJAhC4jDN/peCxJcGO7OR7CLykYB1UMBXEltG1Pb+GveKgCYBxQi
 5kAc2PFehI5ZIyqhTUccprUquechSXTB4E+9i5XVcyndufze6XpuXp7jerOaux5hBQMD
 oACjtBqwjOePA1MVfkRe+9dP5y62Uztc5sxwZfn8NFbbKQ/itN0JjBwCQdOXitUVYeXg
 XCEKCEfkTxrqyAczpOUzqVtlmvNgM+unabNyLOK7bcsDCcdITiLXk+oBlrWrS/eoE890
 Im/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xk5tZcB4gES1RHjvLAPIsV7P9s8Id8pMPfTjwDZZico=;
 b=P0k9HaMg02UkvN75IGPiAmQkKYEvkcFHzaU2w32UpIKlkD28aCx1CvNeFItYa6jVHw
 ue8RSGCEWd3JDzn+P7N8+VenUPBLWjr+4raSDcOGmupqVJc0VtVOVp0u6CfjKHIEIL/T
 0EGkVCGXMqIsKlNoW0EaLQ1SB1yI2Y8vvJmy6I1Pu5LCnRJAn9BE/a7hfsL2UTr/amy+
 c2ibHvTQmITOAO4TsPRHaXr49SgXN8yXOfukp0M+L4CJwDGJ6lVZtv7VLL78OyXzCoQT
 7cRqHiDA1tEkk0CzL+/Pf0aXzyW9++NsPn/OkJ38PmzZJMqPJm8TyUQ2tv9ESNTs0u06
 emLg==
X-Gm-Message-State: AOAM5312OlbnUhUaZnIkExHJc8bWW92j1srql+rjCs8jTsd1mmbiekg5
 xZvtB97wwOqo/b5pCDYHl7kFrmfMRl4=
X-Google-Smtp-Source: ABdhPJyvphSGdWdPvYQ7zJ5fgJHWdzW5QW9+hibYWyz7upasvaxoqYoo3WNfjQT7koy8ZuH05vyDkw==
X-Received: by 2002:a17:90a:4dc6:: with SMTP id
 r6mr48473374pjl.5.1634571520941; 
 Mon, 18 Oct 2021 08:38:40 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a30sm13899649pfr.64.2021.10.18.08.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:38:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 3/6] hw/riscv: shakti_c: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Mon, 18 Oct 2021 23:38:26 +0800
Message-Id: <20211018153829.24382-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 15:38:45 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/shakti_c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index d7d1f91fa5..90e2cf609f 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -45,7 +45,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
 {
     ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
 
     /* Allow only Shakti C CPU for this platform */
     if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
@@ -59,11 +58,9 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
 
     /* register RAM */
-    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
-                           mstate->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory,
                                 shakti_c_memmap[SHAKTI_C_RAM].base,
-                                main_mem);
+                                mstate->ram);
 
     /* ROM reset vector */
     riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
@@ -88,6 +85,7 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
 static const TypeInfo shakti_c_machine_type_info = {
-- 
2.25.1


