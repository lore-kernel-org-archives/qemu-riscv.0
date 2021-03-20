Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNY1F-0005U2-Cz
	for mharc-qemu-riscv@gnu.org; Sat, 20 Mar 2021 05:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNY1C-0005QS-Qe; Sat, 20 Mar 2021 05:35:39 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNY1A-0006e1-0R; Sat, 20 Mar 2021 05:35:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616232921; cv=none; d=zohomail.in; s=zohoarc; 
 b=DIoPCiUyIP7kEPoQPo15ipd13YQQCckTQMxn2hQX9oBNOzahWt7hkgJhm+QHiZTWLjR+D7QBx8R3KkAnDQVDqa07gRJXDPVtfuR11E2nzAdgkyHuZyWMwnkkSw8AaCizoTjMkCYEFIvvCjs0wB6/98LkMLmHdBaeqEdN4OR87qA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616232921;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=ADKOgabrLJYijRTByHXNUpvHeMzzz9ifJatn4atOPHs=; 
 b=BSAyiSnTAHIN5/HhlOXgupFHIaC4inhuCO32kNnUGsvCbnqcMCyYN4JRuJehBSz3/bG6HSBCCY6UOo7tA9rwTr7gn9tRLs9DnSNkYbTox//+JmgoSo4u96uN1hzgFGbHvZ4YXuTKAjoXz+/r/YwiMeevqi1DNPquBXJjvd+hrYM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616232921; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=ADKOgabrLJYijRTByHXNUpvHeMzzz9ifJatn4atOPHs=;
 b=w3Aceovu7En/LYVrBci1+EnEwv+yaxy2El4TmsBfg/3oHmCCc33tOoo3X9VB1I46
 /913sfrcX5fsUDsknQ4Ql27fUosl2tEH/XDpmxJA6/Rl+C5l12blKBaPV+JADftTb1Z
 uXfqhdwhSzqTvRKMZaMDSVRALp/rj6enBghwyCvY=
Received: from localhost.localdomain (49.207.212.3 [49.207.212.3]) by
 mx.zoho.in with SMTPS id 1616232918156279.8627736546946;
 Sat, 20 Mar 2021 15:05:18 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210320093509.80016-1-vijai@behindbytes.com>
Subject: [PATCH] hw/riscv: Drop the unused fdt pointer
Date: Sat, 20 Mar 2021 15:05:09 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 20 Mar 2021 09:35:39 -0000

Drop the unused fdt pointer in riscv_setup_rom_reset_vec API.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 hw/riscv/boot.c         | 2 +-
 hw/riscv/spike.c        | 2 +-
 hw/riscv/virt.c         | 2 +-
 include/hw/riscv/boot.h | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0d38bb7426..893e307da6 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -249,7 +249,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, R=
ISCVHartArrayState *harts
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint32_t fdt_load_addr, void *fdt)
+                               uint32_t fdt_load_addr)
 {
     int i;
     uint32_t start_addr_hi32 =3D 0x00000000;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index ec7cb2f707..0b68710afb 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -298,7 +298,7 @@ static void spike_board_init(MachineState *machine)
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base=
,
                               memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr);
=20
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0b39101a5e..7c247626c8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -695,7 +695,7 @@ static void virt_machine_init(MachineState *machine)
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
+                              fdt_load_addr);
=20
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 11a21dd584..27b9569e2f 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,7 +46,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RIS=
CVHartArrayState *harts
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint32_t fdt_load_addr, void *fdt);
+                               uint32_t fdt_load_addr);
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
--=20
2.25.1



