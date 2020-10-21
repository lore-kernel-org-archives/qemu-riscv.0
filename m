Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVHbd-0001N9-71
	for mharc-qemu-riscv@gnu.org; Wed, 21 Oct 2020 13:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVHbb-0001K2-Je
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2020 13:08:55 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVHbZ-0002Lz-5h
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2020 13:08:55 -0400
Received: by mail-wm1-x343.google.com with SMTP id d78so2911050wmd.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2020 10:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1zBaXIPUFkoRX522wNIGvBuniNlrLtU+nW3sIqZkhk=;
 b=RBPepdQz9kw2Kch54mcIFJd9NEI5anhJJEJbjGHVrh8qJXr8Gk7VKjH9h0PNKMxJsL
 /yjP6bQUVRR3d0dOEva2zh9Km3dKMBUbhJx1bJDsqPdZ0jqh8chRuIYKwnnEEiFA1b1G
 kg5s+xFPuXoisq+dpl2NwDP3yzVQoBDPY+7LPBT5duV6sDJe+lFkcxWDNp8t1ktjV2rV
 Yz6huyaeCz6leOqAXx+I8YXzIbw3rAiPdt4kMslLOSMVgYsTumquYEeymW2N4XNlZvlV
 y/UZNTJ4fu1m9LIWwxVMGa6Oa6xWGucNyNyz16zOoUa6B0y/4OfLRv3xB9BKpRWUY1Rq
 5bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1zBaXIPUFkoRX522wNIGvBuniNlrLtU+nW3sIqZkhk=;
 b=Wy18svld/iSKo1dUWwKabe/TZ09Av01V2joD+pbd7cfW1nOuG5C5zela1rKrMytL9M
 FLtVgxQJq1TiUgQqME8itPXO6f7GcntogcXRJYWVVAmxDSR8Dr8Kkj6Tl4oI6Eoy2j3Z
 4VzSAi+Ph6nd/3P5bBgmFsW4MHlNSzIKs6YdpBKb5SGTedGVKse3xi6AHvSJjUB3Z6Wx
 MP1Rnq9rwOP4jdk1SomKcl1s4I+E0YE2vLyMH9/ZywJqjgBblLHcs2Jg50Pjrf2VRkMj
 98iIpIsgR0x/YXHq3BlIxKlrMqw7ZD1qTogNUHqrjYu1d5wDSUKiwIZ42qvr5ZmK04bx
 HiQQ==
X-Gm-Message-State: AOAM530voXccplISmi+O+DeGhISvx54fl3Tt3kvPaj6iRDDAF4NMf+D2
 UVOySY72OdRxBarOZKRkr/Cxsg==
X-Google-Smtp-Source: ABdhPJztTxmd4J+aGRrRXnwDl/57unRcgNdCJ8looxP28yeJjAttTIAgMuf0i4rt7IRBtskkk7r4YQ==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr4474374wmc.62.1603300131688; 
 Wed, 21 Oct 2020 10:08:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c130sm4503880wma.17.2020.10.21.10.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 10:08:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D4AF1FF8C;
 Wed, 21 Oct 2020 18:08:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org, stefano.stabellini@linaro.org,
 stefano.stabellini@xilinx.com, masami.hiramatsu@linaro.org,
 takahiro.akashi@linaro.org, andre.przywara@arm.com,
 stratos-dev@op-lists.linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v1 2/4] hw/riscv: migrate fdt field to generic MachineState
Date: Wed, 21 Oct 2020 18:08:40 +0100
Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201021170842.25762-1-alex.bennee@linaro.org>
References: <20201021170842.25762-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 21 Oct 2020 17:08:55 -0000

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/riscv/virt.h |  1 -
 hw/riscv/virt.c         | 18 +++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..6505ae8d23 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 41bd2f38ba..17c0706156 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -194,7 +194,7 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
-    fdt = s->fdt = create_device_tree(&s->fdt_size);
+    fdt = mc->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -434,12 +434,12 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     g_free(name);
 
     name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(s->fdt, name);
-    qemu_fdt_setprop_string(s->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
+    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 }
 
@@ -613,9 +613,9 @@ static void virt_machine_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     } else {
@@ -636,11 +636,11 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


