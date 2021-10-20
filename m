Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0bs-00084l-7O
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bn-0007zv-H6; Tue, 19 Oct 2021 21:41:36 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bl-0005iU-Sc; Tue, 19 Oct 2021 21:41:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id w17so3146099plg.9;
 Tue, 19 Oct 2021 18:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kjezReZnz27CpRw7F1KmV8x3RHUjwNsopHcmxq5Y4U=;
 b=DF2NMfsLz0zwdwNdiHeFhVPrTcUZglFniTPEkZVygTbLpNJ7QoOIbE1F4jp7MCgNSE
 Ngfrx+8fLxRo8XSturbOeGaKEElIu6IKRmuXQXvdkoO9yeVTCjF/GzWxvnLWu5Im7r7x
 L9+zztBPvCTv+UTx6iPKsG5fUiDfdbUgBwhEarYDSF8viOnU/Z/MMx+is0AT/P1zPIvS
 7KK07H8KUJZnO6nvCy/4j/4IPkSjy5SzbVy3Y3G3//HnMsm6QkCZ3GIyuEvylidy0jqc
 5TTcVUFto4gV4TFos+f5n5XjHz3Awy0uscQtOI4FPPuG4YL1IDuToI804xx8ScDmtmV/
 GftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kjezReZnz27CpRw7F1KmV8x3RHUjwNsopHcmxq5Y4U=;
 b=XpEuSVteJR9qJAtM7NNtIkNrz/thwlnkteZ967p2Q5/APmEUd+fchhkV+PVtXtrRmh
 Z7kTcRuBAkuDARCafiBsJ+mTVgQ88aZIFQTUZJ+Fu941y4ORycG4JUI2mvcEAVd1uNWr
 vsPA90FlV79cum20iO6ZiEQnnu+oDU8ZZv0r1gUeJqr2ffLDrUEujX8pLGkubffr+xam
 5B+RZuZeKS91hK/wSatULAVvTLmMgPEQeHc2CDS10eDHwbmrWE3hxXnn3RSXQqGjXjTP
 7Dl4nbSxhsoKnTF5sCuck7ZG39NQiJ2G1BdUKJ0j8lTn863+fpcODpkK5LG8mSVtr2jZ
 Lj8w==
X-Gm-Message-State: AOAM5319Go1gOL6gN3rgRJpMqMAUBjuVgQxTAASBEDn5UFoUrqYIKssy
 Cyhteeepe0aktyYAO+wcgHU=
X-Google-Smtp-Source: ABdhPJzOKdoD+bbBJJ4D8dQJkzvIdyLLzGNZJwxRyTA36w0QqWWXq9lcW4JU0uQwWdu5dVqdBm6ggQ==
X-Received: by 2002:a17:902:bb96:b0:13f:b181:58ef with SMTP id
 m22-20020a170902bb9600b0013fb18158efmr18634778pls.2.1634694091424; 
 Tue, 19 Oct 2021 18:41:31 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 5/6] hw/riscv: sifive_u: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Wed, 20 Oct 2021 09:41:11 +0800
Message-Id: <20211020014112.7336-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 01:41:36 -0000

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

 hw/riscv/sifive_u.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fc5790b8ce..0217006c27 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -528,7 +528,6 @@ static void sifive_u_machine_init(MachineState *machine)
     const MemMapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
@@ -549,10 +548,8 @@ static void sifive_u_machine_init(MachineState *machine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
     /* register RAM */
-    memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM].base,
-                                main_mem);
+                                machine->ram);
 
     /* register QSPI0 Flash */
     memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
@@ -748,6 +745,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpu_type = SIFIVE_U_CPU;
     mc->default_cpus = mc->min_cpus;
+    mc->default_ram_id = "riscv.sifive.u.ram";
 
     object_class_property_add_bool(oc, "start-in-flash",
                                    sifive_u_machine_get_start_in_flash,
-- 
2.25.1


