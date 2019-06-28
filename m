Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulT-0000fh-5F
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55189)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgulK-0000cX-Af
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgulH-00012D-UP
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgulH-00010n-N9
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:34:11 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so3321687pff.9
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Ll0IfljzezEKYOWEmbGf9wV1tOe7NCSXkPQeobGClJk=;
 b=iB3yGdoyYhAPvfMsoKggFCWrdGsDFusXhckoim89wNwICqBCGDHvYAzydstzOhxV0E
 R7B4RzdjSggG1L2TiEiq5dLUVMiLbB4pKLhZ3ZDgijr0D/iinXFV5rzihzSzrt8TXGfI
 WZJ12C+eUS/Ddlj027zUuXNgIkBiI/UQFokdufJy2lGqqeNR1mZZtXkrKYrWzWG2d8rE
 IE1jd1RmyyKRNqxJpo0ICb/0QHcF6X8zZ81/8IkX8t4fsqGqomvPjhzsfplqsWDPuJuO
 CRxoASExq5r4rfrqSOFOWrD52mdsVN70ngFQ7+Tgj/yH2E29Y7nh69jyf3ASUW7vQvmy
 ZnAg==
X-Gm-Message-State: APjAAAUDzulqLTyoeaY+tVbLQgfhqUWWG6xKrm7uc12mFSQCT7efMb2y
 /IZSya3/jdc0u+yh7XHl1KfUxOkbO7oEjafL
X-Google-Smtp-Source: APXvYqze22H5KcEhFfCajKSVrhJiw1mfdoinFOIu7mWm/myddmt14oH1wqDEva/AHHx/VANH0uopxA==
X-Received: by 2002:a17:90a:bf02:: with SMTP id
 c2mr14592101pjs.73.1561743250039; 
 Fri, 28 Jun 2019 10:34:10 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id 64sm4146984pfe.128.2019.06.28.10.34.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:34:09 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:25 -0700
Message-Id: <20190628173227.31925-33-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: [Qemu-riscv] [PULL 32/34] hw/riscv: Extend the kernel loading
 support
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
X-List-Received-Date: Fri, 28 Jun 2019 17:34:18 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Extend the RISC-V kernel loader to support Image and uImage files.
A Linux kernel can now be booted with:

    qemu-system-riscv64 -machine virt -bios fw_jump.bin -kernel Image

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 883df49a0c65..ff023f42d01d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -56,12 +56,22 @@ target_ulong riscv_load_kernel(const char *kernel_filename)
     uint64_t kernel_entry, kernel_high;
 
     if (load_elf(kernel_filename, NULL, NULL, NULL,
-                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) < 0) {
-        error_report("could not load kernel '%s'", kernel_filename);
-        exit(1);
+                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) > 0) {
+        return kernel_entry;
     }
 
-    return kernel_entry;
+    if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
+                       NULL, NULL, NULL) > 0) {
+        return kernel_entry;
+    }
+
+    if (load_image_targphys_as(kernel_filename, KERNEL_BOOT_ADDRESS,
+                               ram_size, NULL) > 0) {
+        return KERNEL_BOOT_ADDRESS;
+    }
+
+    error_report("could not load kernel '%s'", kernel_filename);
+    exit(1);
 }
 
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-- 
2.21.0


