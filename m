Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFec1-0002hN-7P
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 12:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFeby-0002bO-P6
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:10:02 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFebw-00069D-0w
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:10:02 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 d16-20020a4a5210000000b004f23d1aea58so426936oob.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4dXSiAnits5ErKwehcEjsLRKL1HaEAOZOXpk41ZAWU=;
 b=S2SERipg15y4IXl848CDa/ZgPj93Ezd31PiqNY6UifDVOKt8+PtFjIRJ+YFbmvlfMt
 ilfO0BKD7nA9BayltTgbkk6dzEuSzUX5LhX8pRAD/PwJpXV32u1N2xxQ7K/ceuSLicY5
 pW0BDy6n1Mspx2zgytrAGJ3tUlubV/Gf3mc7VXukaD5ESQPF6pLiK/dpdq9/qS7kvZgK
 NhC4GPbl1YcjnrHWNfFtr0C4o5uyPpj+9usENog+pEGZUkMgUr0fOwxmIxLOdWqusD99
 F3Oipcy30cfKR8s+RjrIGzES/UCipiEico6+BgW6VRizC3lgu6Fk8eURLWJD65kYAnXM
 vQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4dXSiAnits5ErKwehcEjsLRKL1HaEAOZOXpk41ZAWU=;
 b=DtCrg8sVvJn/PIpiIXqxkAtvyECSIORRVlRaH9JitvdiP1nzsZGom+HgN04AxXsh1Y
 0xlXMamh8PxOOzG2fIT3Pe1+Z7qxIdxlmNPPp7deb6cE83gNp5wZZp0bIeaag8UWhu2a
 UJ2fJqZ2mtl0s33b9jMPDrdXqxZR/M+9nkXlD+vEWM15cXDOrX2ceyfvqXEv99aw2sgR
 eo3OjtrewvDEsYvb2UDncMVDp2tPADP34Pxdq6RVNqX6zgy4N73jW65/1dTW7vVQVDys
 3D7n0HgCC3tYCF/o7rRtkQPO3W/QVWYj4lJZzRJAKI2edaCsHcsP9WBqeWAo8pHb4H3d
 sNvA==
X-Gm-Message-State: AFqh2kp2kNJocyu354nIv+xSuJB7idGl9do766Bdc/hqQ2CPx5SXkUFG
 /YWvPi1yUOV35ye+GfYljtJbqg==
X-Google-Smtp-Source: AMrXdXvSNJiFv6PAv/N1Lp1vE3Zk7qxb0XYZV9mpGlEv1cDhWfkN6GxK1apcwCjsKnLiU0y12CIyjA==
X-Received: by 2002:a4a:ca93:0:b0:49f:8720:d5b2 with SMTP id
 x19-20020a4aca93000000b0049f8720d5b2mr30777123ooq.8.1673456998770; 
 Wed, 11 Jan 2023 09:09:58 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:09:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 02/10] hw/riscv/virt.c: simplify create_fdt()
Date: Wed, 11 Jan 2023 14:09:40 -0300
Message-Id: <20230111170948.316276-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Jan 2023 17:10:03 -0000

'mem_size' and 'cmdline' aren't being used. Remove them.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a931ed05ab..89c99ec1af 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -999,7 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
 }
 
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+                       bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -1499,8 +1499,7 @@ static void virt_machine_init(MachineState *machine)
     virt_flash_map(s, system_memory);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
-- 
2.39.0


