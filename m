Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwyRN-0002Bm-3Z
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 22:25:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mwyRJ-0002B0-Tr
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 22:25:17 -0500
Received: from [2a00:1450:4864:20::434] (port=38563
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mwyRH-0001nQ-TS
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 22:25:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id q3so30181233wru.5
 for <qemu-riscv@nongnu.org>; Mon, 13 Dec 2021 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUSxU9RiVv20VDseJCb/y3nyWW47kB8Mgo+wyVliFao=;
 b=UkyOXDKVSn0AleH8tEJ0TeKyWes9yzbPpRyzo5nI4sIMoD0g5RG29yjDxgVNdmryXa
 XgMK+y3LcNzNLXydk+UEtlB80P5+1SwiKdZJwy+g8PSMYTexEQzLPzADdrTD4eXJbw9k
 ZcuqAPcfhI0hJmPDye5VD7wPjmj0wZ1+z+vp6z1IjxpULye6KHsSnaFlJOs3mIvGRfCF
 lWnuiokeym732s+A6obUFjUrW0+ulOlgkacbfnLqT7KM1ahJIRroG03AOObAWmueOLDg
 DY9RLdioBypSY1JEwslpaAIVW3oGiZWeeAyRvkLHdNzG9qWjkoxvBueFYFwdis15wI/Z
 kAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUSxU9RiVv20VDseJCb/y3nyWW47kB8Mgo+wyVliFao=;
 b=odNB5RKjBt+/HE4CN4CVG2RWiKEBrcFHxbFaZ0j2H8IjQYeFoNbDLapakVIYpABtAB
 0JoT6MxVVhhIe8SpqbGQSo7tJHXIkbz7CXHeXnBfiR7dISft/VMWytBxD26ZqoazCyGb
 utdYvd8pSwm7LlG4ydCrqQICJ+zElTLM95JkscBtY0JBHl9zi6TYmXdxlKNdi7OdSkAg
 h4ZJJSZCRJm6ojRO+f6tS/yi4U0ii+Hx5pAx/wcu5Cp1wrP3hTApqvGZeVVrr3ZAq8M/
 mVgRF7Cj6QGII5bnX1Uew3JHA9WkIwQOkgvdSQhdOHEri8MdEb8C54PqX+ujdoGY1KI1
 9R0g==
X-Gm-Message-State: AOAM530LRifEDOEeMSHOdEZFoMdf2397zbrdxu8zqYPah4SMRfGejLFB
 1vTRJq9Y+EI2BAzJreZt+jLvAg==
X-Google-Smtp-Source: ABdhPJyfvvgmyiQVEO+gpkOA7uzZv984Hrpj57B/qSXCJk0STVd/P3Bi5f1TKAMFAn1uFjoxZUCYLw==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr2873662wrv.11.1639452311544; 
 Mon, 13 Dec 2021 19:25:11 -0800 (PST)
Received: from Jessicas-MacBook-Pro.local (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id q26sm12463692wrc.39.2021.12.13.19.25.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Dec 2021 19:25:11 -0800 (PST)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id C357DA66ECD5; Tue, 14 Dec 2021 03:25:09 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-riscv@nongnu.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] hw/riscv: Use load address rather than entry point for
 fw_dynamic next_addr
Date: Tue, 14 Dec 2021 03:24:56 +0000
Message-Id: <20211214032456.70203-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 14 Dec 2021 03:25:19 -0000

The original BBL boot method had the kernel embedded as an opaque blob
that was blindly jumped to, which OpenSBI implemented as fw_payload.
OpenSBI then implemented fw_jump, which allows the payload to be loaded
elsewhere, but still blindly jumps to a fixed address at which the
kernel is to be loaded. Finally, OpenSBI introduced fw_dynamic, which
allows the previous stage to inform it where to jump to, rather than
having to blindly guess like fw_jump, or embed the payload as part of
the build like fw_payload. When used with an opaque binary (i.e. the
output of objcopy -O binary), it matches the behaviour of the previous
methods. However, when used with an ELF, QEMU currently passes on the
ELF's entry point address, which causes a discrepancy compared with all
the other boot methods if that entry point is not the first instruction
in the binary.

This difference specific to fw_dynamic with an ELF is not apparent when
booting Linux, since its entry point is the first instruction in the
binary. However, FreeBSD has a separate ELF entry point, following the
calling convention used by its bootloader, that differs from the first
instruction in the binary, used for the legacy SBI entry point, and so
the specific combination of QEMU's default fw_dynamic firmware with
booting FreeBSD as an ELF rather than a raw binary does not work.

Thus, align the behaviour when loading an ELF with the behaviour when
loading a raw binary; namely, use the base address of the loaded kernel
in place of the entry point.

The uImage code is left as-is in using the U-Boot header's entry point,
since the calling convention for that entry point is the same as the SBI
one and it mirrors what U-Boot will do.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 hw/riscv/boot.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 519fa455a1..f67264374e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -151,12 +151,19 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
-    uint64_t kernel_entry;
+    uint64_t kernel_load_base, kernel_entry;
 
+    /*
+     * NB: Use low address not ELF entry point to ensure that the fw_dynamic
+     * behaviour when loading an ELF matches the fw_payload, fw_jump and BBL
+     * behaviour, as well as fw_dynamic with a raw binary, all of which jump to
+     * the (expected) load address load address. This allows kernels to have
+     * separate SBI and ELF entry points (used by FreeBSD, for example).
+     */
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
-                         &kernel_entry, NULL, NULL, NULL, 0,
+                         NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_entry;
+        return kernel_load_base;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
-- 
2.33.1


