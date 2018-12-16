Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYfam-00045r-N9
	for mharc-qemu-riscv@gnu.org; Sun, 16 Dec 2018 18:13:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfak-00044p-83
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfai-0006DY-Bi
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:58 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:38205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sorear2@gmail.com>) id 1gYfai-0006Cf-0E
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:56 -0500
Received: by mail-qt1-x841.google.com with SMTP id p17so12222744qtl.5
	for <qemu-riscv@nongnu.org>; Sun, 16 Dec 2018 15:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEW4Q7Ca35VZ/Ek9JBxaV/ku1LLXQJgFuVgBsz9Qlmk=;
	b=Ok4zrWTPGpWjzGveRWs790plppLQ7t72sQU6covo/7l9CVj8ukopIjxRQE63TvPfP0
	bW5ijWB5LWP3POGLBtKAFtpMSyyzgGrjbv9fZ+iAES/HDkneHwuErwf89J1tL7uO3WnF
	eGe8Lz6pBGNaNswni4vGKhzwhyduc+ZH2NFf1PR8wjoMaDJrct0moFTG6j9zwLp84vvz
	n+8j4QTdCxD3deVG4RPggQiuq8b26KB760NzJFO8EjyTCVOxk8FRSN5D3FsA+Jny7y9b
	fu1Adf/uzerQBtR7jUoIRm7nnlbcrhW50OZ3GipJhbvZfVkSRUB6Y2jHxr8WpS3mWn1O
	eyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEW4Q7Ca35VZ/Ek9JBxaV/ku1LLXQJgFuVgBsz9Qlmk=;
	b=fiX4r30PFpplzM+5+sCshWZBFriG1p7s3xej4uPC2sWffGnRk4zzqK/AA2ZrON+is5
	eIb3vSpe8NkWSVpBw8GkGLv1H6E2VqCZjnR5WUF97vTxnBMnIJ7PsiciRXj5kuFDvowx
	g57DuXQoJhT/E9OANhaD7xasV77GFfPo+4v5C/E7q2Wjow2ahoK7/OViu3ncZ84aLOrz
	RFTpNXNhXkHlnyw/myNKhX4C2ulotCRdIjugdzJbICSEqCTElqj9lIjoEBfmA7kF7xkU
	tlY+S/4M0Eby4hFRNfAir3mlya6X9RKisRue3xq1vjGrxk6dGOZ7yQhfKUjPPzXq18Au
	8y9A==
X-Gm-Message-State: AA+aEWZpwrLA41Vw+QugaJPQtlgkmj0fDisBLUkvcFw8WXSs9T+SUukJ
	/Me0+Arr+uef16A4X40x0GqD67HgwWU=
X-Google-Smtp-Source: AFSGD/UHnjzeCwlSWvA87S9TCr6RqAn/ovi2fmj4RJvfJZZ8P8cv/4pRrFsUJhP2hs705GJehwpxUQ==
X-Received: by 2002:ac8:3975:: with SMTP id t50mr11072819qtb.331.1545001975247;
	Sun, 16 Dec 2018 15:12:55 -0800 (PST)
Received: from localhost.localdomain
	(209-6-78-127.s3965.c3-0.abr-cbr1.sbo-abr.ma.cable.rcncustomer.com.
	[209.6.78.127]) by smtp.gmail.com with ESMTPSA id
	e186sm5713451qkb.32.2018.12.16.15.12.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Dec 2018 15:12:54 -0800 (PST)
From: Stefan O'Rear <sorear2@gmail.com>
To: qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan O'Rear <sorear2@gmail.com>, Michael Clark <mjc@sifive.com>
Date: Sun, 16 Dec 2018 18:12:26 -0500
Message-Id: <1545001947-29444-4-git-send-email-sorear2@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
References: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: [Qemu-riscv] [PATCH v2 3/4] RISC-V: Honor entry point in loaded ELF
 firmware
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2018 23:12:59 -0000

The virt board is changed to use the firmware address from the
loaded firmware or combined firmware+kernel. This is normally
equal to the DRAM base address of 0x8000_0000, however now it
is possible to boot firmware at different load addresses because
the reset code jumps to the actual firmware entry address.

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
---
 hw/riscv/boot.c         |  9 ++++++---
 hw/riscv/virt.c         | 17 ++++++++++++++---
 include/hw/riscv/boot.h |  2 +-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 54e3139..e51e7f9 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -87,15 +87,18 @@ static void riscv_load_initrd(const char *filename, uint64_t mem_size,
     }
 }
 
-void riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt)
+hwaddr riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt)
 {
-    if (machine->kernel_filename) {
-        uint64_t firmware_entry = load_kernel(machine->kernel_filename);
+    hwaddr firmware_entry = 0;
 
+    if (machine->kernel_filename) {
+        firmware_entry = load_kernel(machine->kernel_filename);
         if (machine->initrd_filename) {
             /* load separate initrd */
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               firmware_entry, fdt);
         }
     }
+
+    return firmware_entry;
 }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4c2e894..38979f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -235,6 +235,7 @@ static void riscv_virt_board_init(MachineState *machine)
     size_t plic_hart_config_len;
     int i;
     void *fdt;
+    hwaddr firmware_entry;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
@@ -261,7 +262,17 @@ static void riscv_virt_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    riscv_load_firmware_kernel_initrd(machine, fdt);
+    /*
+     * combined firmware and kernel: -kernel bbl_vmlimux
+     * separate firmware and kernel: -bios bbl -kernel vmlinux
+     * firmware, kernel and ramdisk: -bios bbl -kernel vmlinux -initrd initramfs
+     */
+    firmware_entry = riscv_load_firmware_kernel_initrd(machine, fdt);
+
+    if (firmware_entry == 0) {
+        firmware_entry = memmap[VIRT_DRAM].base;
+    }
+
     /* reset vector */
     uint32_t reset_vec[8] = {
         0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
@@ -274,8 +285,8 @@ static void riscv_virt_board_init(MachineState *machine)
 #endif
         0x00028067,                  /*     jr     t0 */
         0x00000000,
-        memmap[VIRT_DRAM].base,      /* start: .dword memmap[VIRT_DRAM].base */
-        0x00000000,
+        firmware_entry,              /* .word firmware_entry */
+        firmware_entry >> 32,
                                      /* dtb: */
     };
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 92948f3..3af21fc 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -19,6 +19,6 @@
 #ifndef HW_RISCV_BOOT_H
 #define HW_RISCV_BOOT_H
 
-void riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt);
+hwaddr riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt);
 
 #endif
-- 
2.8.0


