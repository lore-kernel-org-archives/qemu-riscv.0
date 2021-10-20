Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0bp-00082w-Da
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bk-0007yH-Ky; Tue, 19 Oct 2021 21:41:34 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0bi-0005gQ-Tj; Tue, 19 Oct 2021 21:41:32 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f11so1529297pfc.12;
 Tue, 19 Oct 2021 18:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mD7/PuCvDIg/ueaYUzJA1zLICNITcLj/HedHvpWU5eU=;
 b=H/km4TfiXTHVfOhAmbzbyve5E9dHv23t/HAzlfUNWPALS5lf8U2juLTHLyXY5r6l9n
 BnFDLBZaCl74QISf3eadrjQIGR2kuDpyw3LCuXiP9yfNxZB4C5tzGCr0F9yv38OKOh0O
 aU0tgc9SKAvlNh6jhrDmskeTDiAstmVvd4bNW5IzV5JEJ7wMs4YY+xlE5ARK71h+IFFW
 1TEFM0irhHNgvYnjhTKiR5CI+3RC4wMiodOrJYb66v0e7PvyER3g8bXLYW0sh+eXIlk7
 exleOw3ImHDRDsjv3Rok+Ib/o6HEEpn81iz4MIzztPLg9iNIukBw2w7jZW+EUmJMFz+N
 A56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mD7/PuCvDIg/ueaYUzJA1zLICNITcLj/HedHvpWU5eU=;
 b=uTmTBwZVZyPA25Xx8Bl2otAw0lwRgDUybY1YjD7IJNK3LXbQTKjt4QQwG4AN8w5Qph
 MqdWiBLRSutihuhbX1txF3/2R6UlyLXRqfxgdifiAi0OzfRVs/ofcJpYA/Ht8Dx+l9Xy
 5lye3cPAVgHAJJRltaukftPNLjqURQGtJkD2DLdOFNNydu7HWfBorW8PVAGP+EM0AqTb
 G7vg4f4s7gXtNvByw6LQqU5netmPp4JAuKtuxbUAhuicoIiHMtfRFK6g5NnUP+0zc264
 HrDgrHOFraWV3tKvGNNJ/0LBSAiaTxO3x8549AubEBmXJVdFdrYvZPSA4t1RS4n1sMLo
 VFkQ==
X-Gm-Message-State: AOAM531qrPB6FuTajIZCH1rWwQHQPBvLCzN2trE78S1fkJzBBOYic/EM
 /bMmreuzV8e2TPQGKhThLtigvn3tqCE=
X-Google-Smtp-Source: ABdhPJx2iKMn+ROcTlPd3EtZgt1qKYSG83U5ixHG8/VRx7Hr29dLAY40sxc9auo3Szw/Pdej4YrN3w==
X-Received: by 2002:a05:6a00:15c9:b0:44c:a998:b50d with SMTP id
 o9-20020a056a0015c900b0044ca998b50dmr3262475pfu.49.1634694089150; 
 Tue, 19 Oct 2021 18:41:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f4sm407147pgn.93.2021.10.19.18.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 18:41:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Wed, 20 Oct 2021 09:41:10 +0800
Message-Id: <20211020014112.7336-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020014112.7336-1-bmeng.cn@gmail.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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

While at it add check for user supplied RAM size and error out if it
mismatches board expected value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- add RAM size check
- assign mc->default_ram_size

 hw/riscv/sifive_e.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 6e95ea5896..9b206407a6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
@@ -71,22 +72,27 @@ static const MemMapEntry sifive_e_memmap[] = {
 
 static void sifive_e_machine_init(MachineState *machine)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     const MemMapEntry *memmap = sifive_e_memmap;
 
     SiFiveEState *s = RISCV_E_MACHINE(machine);
     MemoryRegion *sys_mem = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     int i;
 
+    if (machine->ram_size != mc->default_ram_size) {
+        char *sz = size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_E_SOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
     /* Data Tightly Integrated Memory */
-    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
-        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
+        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
 
     /* Mask ROM reset vector */
     uint32_t reset_vec[4];
@@ -142,6 +148,8 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
     mc->init = sifive_e_machine_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = SIFIVE_E_CPU;
+    mc->default_ram_id = "riscv.sifive.e.ram";
+    mc->default_ram_size = sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
 
     object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
                                    sifive_e_machine_set_revb);
-- 
2.25.1


