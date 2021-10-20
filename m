Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0bk-0007ww-5K
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bi-0007rc-70; Tue, 19 Oct 2021 21:41:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bg-0005Xf-IJ; Tue, 19 Oct 2021 21:41:29 -0400
Received: by mail-pg1-x534.google.com with SMTP id g184so21059613pgc.6;
 Tue, 19 Oct 2021 18:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iqfmG4qbpsjSVtZKYW2vZosJ7rbYunRdOsfFpSsoAv4=;
 b=au+H1Bd3/HtzifxGyAuu7fVCG1V4Q3C358WxtFDeRJhQADyOByhg6EDc7WaSgkuBpZ
 7lGnKc7PBOtQpHEqoby8Gs3hkjPUVYrqeYaA6g0/BK3j5dNJT42rUWZQ+jY/sR1TMNBk
 lNaOpF7I4cm+K9eUTnrWItthRr+p1F0ZIaIU0TIvknEIC1bc8lU8vHrSXO1ExfHyE+Qx
 SsuTdIdBZkW3EN/q9wPihsHjmX/j8wqSnM5+LylJU4D0UK4ZR9kQw8BEc+hPRTelSmLB
 JIjVQdZuUzQnKl0BBtx4QZ3TCiK8f/mIXsOHbgA5Gq7NTJ8XO/ila0m0dreTJngrPx4Q
 0ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqfmG4qbpsjSVtZKYW2vZosJ7rbYunRdOsfFpSsoAv4=;
 b=cOB9ezoZWGpS+pJvMrBvA3LfcxKHUYdDuoGi02CBRCk1iicqStTJuNy3HQRJckBIAS
 jR4zMflH/N1yx3/HGBtNtoA55BqYXEkuPZxW2zXUasplfWSePoiFwFdktalLZqWvD7Y6
 ioblVC/ziOdToakoZvcTB9eqx0lTAi6LqSxKin1cPvDI3j7mrRwm/T87RvKdvTjDz23p
 0mMFKjf8gMULf1DOw6yLaCqebmYDLYkTPOBGf9fUF7pLxKvJVZ//MjJNalM48KyrNjCP
 Ba+FHU4v6krpLNBnMr1FgXLJYo9jNvkz6PCS6GkRlVP1IoBQS54dOwLatZAItOAKUppV
 Z6uw==
X-Gm-Message-State: AOAM533L/l2w0huXHjt9VHgpm0xebdhYGUQTERK6acCXgvwdW+w9PtmR
 xT4QdaeJfhqN9RtQrJGR3gMUbU1iKfc=
X-Google-Smtp-Source: ABdhPJy14qt0anEqAnobXhEajjcsXqz6zhWkWcruITcGZBryBqvGxzTrHMpg/DT0ILQ/bikteztnKw==
X-Received: by 2002:a63:b906:: with SMTP id z6mr25370387pge.406.1634694086968; 
 Tue, 19 Oct 2021 18:41:26 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 3/6] hw/riscv: shakti_c: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Wed, 20 Oct 2021 09:41:09 +0800
Message-Id: <20211020014112.7336-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 01:41:30 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---

(no changes since v1)

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


