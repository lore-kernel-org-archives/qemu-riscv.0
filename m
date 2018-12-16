Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYfau-00046J-Qo
	for mharc-qemu-riscv@gnu.org; Sun, 16 Dec 2018 18:13:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfaq-000466-2E
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:13:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfam-0006Fv-9o
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:13:02 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:36329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sorear2@gmail.com>) id 1gYfak-0006EM-7g
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:59 -0500
Received: by mail-qt1-x843.google.com with SMTP id t13so12254655qtn.3
	for <qemu-riscv@nongnu.org>; Sun, 16 Dec 2018 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/0yCf7/vpNbLgiA+RoMiSgUY4fkdlg4H49m/zFHFmVw=;
	b=tDkYLKrueQegSzasgj8WGwlVB6iYuc8F9WgtNaw74n7gKwytF/skPB8+ksMIoxWRk6
	6jcNb3IrYnOwhkCFtbFlEXZGaLStP5ZdpK8qrsvGX+iZkQgQWrEGmkdbisb6AIdne3mZ
	w2pnwgfA4fE745odPSdBM5n5CHRHyPAU96G7NShFNj1ZjLK41OMfGybV+q6OsulRgVN2
	4fEv2x/Q0x2FVwDUQt6+psi1dtw/Yd6u2Gk+Fl5QVlV73ljEvZZUMTBFy87/TJLOcscF
	veOkSWqoypHfVKcpx+lVrbjVRMMbhO+U8O+9bnVKVTQOzSgU2RFTF0MtZ8LBHO3QokGM
	nlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/0yCf7/vpNbLgiA+RoMiSgUY4fkdlg4H49m/zFHFmVw=;
	b=L/jznTNkJPi/c5Xbk6pVSsU3dL4XEorhse+VWHZ8Q5ijjlbEzvZtRrve9T801I8A5z
	EPmUW3RVAEnvt8zotOR1/uQ7MSzWzdIeEaJRDOYA/UF9G4D69MhK39ljaxPrrngYvYpS
	vu6kg4M54ANpl1z5hiZ/zD4gjuAbcdkQU70RBS/llr+rwtNKTmvfx8J3fU+ghW0lxt46
	TCU/zTQPco8HICR8bqo8fBO33Iq+flMGmwgWSEtrSJSSAE5U1Z0HaSgGOJmEwMR0ZN3Z
	t4EKub5hSp+mB9e6Mr9ElS6VOBtvwMwPRbejqMZc5hVbx+LZ58eOpiQuu28XqozqpUNU
	z8Ww==
X-Gm-Message-State: AA+aEWZxcKtGsClgbladkYU5/GxBmquKFuMcD+BqBw/vwomaMurPwAzB
	U/sBRUrVzTx6PPRdlkmY0pkwBXKotFU=
X-Google-Smtp-Source: AFSGD/XFzW18x6lIUY8OjeKiVsqa4zIDp6wEoRhPk+3sIlAC1SXue95AgiyXDcX4+y+q9uDt5jqDGQ==
X-Received: by 2002:a0c:d033:: with SMTP id u48mr11030208qvg.146.1545001977271;
	Sun, 16 Dec 2018 15:12:57 -0800 (PST)
Received: from localhost.localdomain
	(209-6-78-127.s3965.c3-0.abr-cbr1.sbo-abr.ma.cable.rcncustomer.com.
	[209.6.78.127]) by smtp.gmail.com with ESMTPSA id
	e186sm5713451qkb.32.2018.12.16.15.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Dec 2018 15:12:56 -0800 (PST)
From: Stefan O'Rear <sorear2@gmail.com>
To: qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan O'Rear <sorear2@gmail.com>, Michael Clark <mjc@sifive.com>
Date: Sun, 16 Dec 2018 18:12:27 -0500
Message-Id: <1545001947-29444-5-git-send-email-sorear2@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
References: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: [Qemu-riscv] [PATCH v2 4/4] RISC-V: Support separate firmware and
 kernel payload
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
X-List-Received-Date: Sun, 16 Dec 2018 23:13:07 -0000

Support for separate firmware and kernel payload is added
by updating BBL to read optional preloaded kernel address
attributes from device-tree using a similar mechanism to
that used to pass init ramdisk addresses to linux kernel.

    chosen {
        riscv,kernel-start = <0x00000000 0x80200000>;
        riscv,kernel-end = <0x00000000 0x80590634>;
    };

These attributes are added by QEMU and read by BBL when combining
-bios <firmware-image> and -kernel <kernel-image> options. e.g.

$ qemu-system-riscv64 -machine virt -bios bbl -kernel vmlinux

With this change, bbl can be compiled without --with-payload
and the dummy payload alignment is altered to make the memory
footprint of the firmware-only bbl smaller. The dummy payload
message is updated to indicate the alternative load method.

This load method could also be supported by a first stage boot
loader that reads seperate firmware and kernel from SPI flash.
The main advantage of this new mechanism is that it eases kernel
development by avoiding the riscv-pk packaging step after kernel
builds, makes building per repository artefacts for CI simpler,
and mimics bootloaders on other platforms that can load a kernel
image file directly. Ultimately BBL should use an SPI driver to
load the kernel image however this mechanism supports use cases
such such as QEMU's -bios, -kernel and -initrd options following
examples from other platforms that pass kernel entry to firmware
via device-tree.

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
---
 hw/riscv/boot.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e51e7f9..43f328d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -32,16 +32,70 @@
         fprintf(stderr, "boot: %s: "fs, __func__, ##__VA_ARGS__); \
     }
 
-static uint64_t load_kernel(const char *kernel_filename)
+static uint64_t kernel_offset;
+
+static uint64_t kernel_translate(void *opaque, uint64_t addr)
 {
-    uint64_t kernel_entry, kernel_high;
+    /* mask kernel virtual address and offset by load address */
+    if (kernel_offset) {
+        return (addr & 0x7fffffff) + kernel_offset;
+    } else {
+        return addr;
+    }
+}
 
-    if (load_elf(kernel_filename, NULL, NULL,
-                 &kernel_entry, NULL, &kernel_high,
+static hwaddr riscv_load_firmware(const char *filename)
+{
+    uint64_t firmware_entry, firmware_start, firmware_end;
+
+    if (load_elf(filename, NULL, NULL,
+                 &firmware_entry, &firmware_start, &firmware_end,
                  0, EM_RISCV, 1, 0) < 0) {
-        error_report("could not load kernel '%s'", kernel_filename);
+        error_report("could not load firmware '%s'", filename);
         exit(1);
     }
+
+    /* align kernel load address to the megapage after the firmware */
+#if defined(TARGET_RISCV32)
+    kernel_offset = (firmware_end + 0x3fffff) & ~0x3fffff;
+#else
+    kernel_offset = (firmware_end + 0x1fffff) & ~0x1fffff;
+#endif
+
+    boot_debug("entry=0x" TARGET_FMT_plx " start=0x" TARGET_FMT_plx " "
+               "end=0x" TARGET_FMT_plx " kernel_offset=0x" TARGET_FMT_plx "\n",
+               firmware_entry, firmware_start, firmware_end, kernel_offset);
+
+    return firmware_entry;
+}
+
+static hwaddr riscv_load_kernel(const char *filename, void *fdt)
+{
+    uint64_t kernel_entry, kernel_start, kernel_end;
+
+    if (load_elf(filename, kernel_translate, NULL,
+                 &kernel_entry, &kernel_start, &kernel_end,
+                 0, EM_RISCV, 1, 0) < 0) {
+        error_report("could not load kernel '%s'", filename);
+        exit(1);
+    }
+
+    boot_debug("entry=0x" TARGET_FMT_plx " start=0x" TARGET_FMT_plx " "
+               "end=0x" TARGET_FMT_plx "\n", kernel_entry, kernel_start,
+               kernel_end);
+
+    /*
+     * pass kernel load address via device-tree to firmware
+     *
+     * BBL reads the kernel address from device-tree
+     */
+    if (fdt) {
+        qemu_fdt_setprop_cells(fdt, "/chosen", "riscv,kernel-end",
+                               kernel_end >> 32, kernel_end);
+        qemu_fdt_setprop_cells(fdt, "/chosen", "riscv,kernel-start",
+                               kernel_start >> 32, kernel_start);
+    }
+
     return kernel_entry;
 }
 
@@ -91,8 +145,20 @@ hwaddr riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt)
 {
     hwaddr firmware_entry = 0;
 
+    /* load firmware e.g. -bios bbl */
+    if (machine->firmware) {
+        firmware_entry = riscv_load_firmware(machine->firmware);
+    }
+
+    /* load combined bbl+kernel or separate kernel */
     if (machine->kernel_filename) {
-        firmware_entry = load_kernel(machine->kernel_filename);
+        if (machine->firmware) {
+            /* load separate bios and kernel e.g. -bios bbl -kernel vmlinux */
+            riscv_load_kernel(machine->kernel_filename, fdt);
+        } else {
+            /* load traditional combined bbl+kernel e.g. -kernel bbl_vmlimux */
+            firmware_entry = riscv_load_kernel(machine->kernel_filename, NULL);
+        }
         if (machine->initrd_filename) {
             /* load separate initrd */
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-- 
2.8.0


