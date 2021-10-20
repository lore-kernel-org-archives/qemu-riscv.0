Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0bj-0007tj-0E
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bf-0007lP-RZ; Tue, 19 Oct 2021 21:41:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0be-0005RN-BE; Tue, 19 Oct 2021 21:41:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so2913191pjq.0; 
 Tue, 19 Oct 2021 18:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vxb2XciZGqJbUZInnci3trRJBIYLUXnuhjZ3WDmEdw=;
 b=T+PFCm5zKBFFT00TA/KthGTvAnJG7M7nthUYQpK+zTwpgvm/PpMtNXTvrbqzRSwYge
 aHM++VahwULoIF7sB8+xvebua2NL/ytTe/VQmdJeIea1cr5b9R6mrIyURAM/QMEBD89Q
 QCa2HM1ZACkSkGvYfd8ZBCwQo3sX1axlhoQhxTEXjRYoZwWL3tbJGHYnsS5SilQleDBs
 +SMy+1yXRsWjvmPzyAhZCRxlkV0hnSlJNp+g9Hmnqs1DfQ1zIgFZRHiriyzEyinRfxcY
 kjjQ2KNwMXm4G0NeABK6fXJyIxAWEzg2qiZAcy9he6iAjoi0V7oB0yB52asXeTnyJqQL
 cmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vxb2XciZGqJbUZInnci3trRJBIYLUXnuhjZ3WDmEdw=;
 b=YtXXbRhmSclVzDtA1vix/4gzhst3bQzwm1Ikwvz1U/O8GcJE4W8Sp5hJr2je4IjDZK
 E8POOWnG/Zuam0as2Ysrchi0/KyfXUEqf5G9ibD8Faihz5txQu5p3W/q2D2qz8ssnnu6
 iVSiEof3sA+BhHDuMyj09ZU8dxd4zB2UeLnH6ULTgXI21lfE1oN89zVDJ59p6XhSABAj
 89uO5sB9ZjnAYkCnWSzZEgsRq17AsPRGwT+jZS9scrC8tg4NHE/wr/NYkHCKekZ7/gJp
 qTsKvoeBhsBOB4qMGI5Fs3qdKoDpxYU0UCdBQJ0+Ds6FgcjWJIKaEDYYw33UORY058L3
 A01w==
X-Gm-Message-State: AOAM532m+NJVPwbQb3TvT3HP+1yXMzJ7D+zT1fs5y7WL+rsbzG/LcaqY
 eiE9gxNhspm0GcCVW1nrMtEhPklfymo=
X-Google-Smtp-Source: ABdhPJyNf+DpLWGKo7MF4dgZxfiZCbKPf572zhHrZnOGRUBS2QryMMTk/W2WhtvQdIKPzUMmBEUUrA==
X-Received: by 2002:a17:902:9a83:b0:13e:5b1e:aa40 with SMTP id
 w3-20020a1709029a8300b0013e5b1eaa40mr36843677plp.41.1634694084815; 
 Tue, 19 Oct 2021 18:41:24 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Wed, 20 Oct 2021 09:41:08 +0800
Message-Id: <20211020014112.7336-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 01:41:28 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

While at it add check for user supplied RAM size and error out if it
mismatches board expected value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- add RAM size check
- assign mc->default_ram_size

 hw/riscv/opentitan.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 9803ae6d70..5d568ea58a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "hw/riscv/opentitan.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
@@ -64,20 +65,25 @@ static const MemMapEntry ibex_memmap[] = {
 
 static void opentitan_board_init(MachineState *machine)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     const MemMapEntry *memmap = ibex_memmap;
     OpenTitanState *s = g_new0(OpenTitanState, 1);
     MemoryRegion *sys_mem = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+
+    if (machine->ram_size != mc->default_ram_size) {
+        char *sz = size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_RISCV_IBEX_SOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
-    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
-        memmap[IBEX_DEV_RAM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[IBEX_DEV_RAM].base, main_mem);
+        memmap[IBEX_DEV_RAM].base, machine->ram);
 
     if (machine->firmware) {
         riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base, NULL);
@@ -95,6 +101,8 @@ static void opentitan_machine_init(MachineClass *mc)
     mc->init = opentitan_board_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
+    mc->default_ram_id = "riscv.lowrisc.ibex.ram";
+    mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
 }
 
 DEFINE_MACHINE("opentitan", opentitan_machine_init)
-- 
2.25.1


