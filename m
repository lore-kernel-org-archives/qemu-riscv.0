Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUXx2-0006DB-9o
	for mharc-qemu-riscv@gnu.org; Fri, 01 May 2020 11:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jUXwl-0005uU-Hw
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 11:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jUXwi-0007LL-TF
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 11:51:27 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jUXwP-0006lK-4O; Fri, 01 May 2020 11:51:05 -0400
Received: by mail-pf1-x444.google.com with SMTP id y25so1741185pfn.5;
 Fri, 01 May 2020 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ylx/pEFyvBSzuAmPVOtbxB6kgH6sZM8QUMYekIzs/aY=;
 b=N7RJoGZHPd/sT2zyDo2JpkYjMwCSI5Tf4r6xFeFEytxWE1ftjQQmmeIGRAkfu/Wbsn
 VBKwNwIAqieRLuhQOVNK9W1QFoyu1vFBVbV7JyaaPCZUGc/dRC9Vy4p92NfaqbXEVUt3
 /KcfzoVLw6LSY4sNPNaDMGLcYnRLmlm0YmRMrZleCOQ8LAST+jDInXBS+Rh0BCwegOy1
 vgCTXwlhdYKLMn5H7s8INNDD9bdimvoRAuWkZ2ABkAdhtqUY/aXBrGBRRAO6tyCOyikC
 UvNvxxbIAaUtwYD2lGd1DdSD4n3BmGudzfBdXk85kc1IwAuYWCsuu9x+wHkukWaZKGUx
 9rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ylx/pEFyvBSzuAmPVOtbxB6kgH6sZM8QUMYekIzs/aY=;
 b=oij08kSt1SjoTVGzNye/r1QjeOtwgfiDc27pwNoKm4zZfdPkwefWz7FZ1PYcQY8g7v
 J+gb61vjh2YGGkANzxl9b3OIVhgVLMlFqzK8uG23zk5VnmpxuGajLLwkS71NKKP3gZcU
 h9l/ZbPt8tAToVtpMLZ5Pe9j61ECaiOfRXoXNNxsX445Df1H0r0kdCjJvhrL7GEqFXmI
 u+FTUX1WemjFtQ/cjPHTTo6IueybrtQeK0wS1iSJa6OuoCy2WmmucvEyru1/qe/vB8DH
 Irb/xbZR47H4tKTOuw8qW/7Hk9KbzihXY73sKfGm7zqyaD8XinjpdIN32ab+1p+IQW0F
 Gcvg==
X-Gm-Message-State: AGi0PuYlPN1NkHuOkUp8GXHUQdD7NJsIpdQNnL+6lcbCPwN/DofA6s5t
 3i/DQWbfjTpS4aJMI+aB5lA=
X-Google-Smtp-Source: APiQypI1Pal54Zi+k3sS7Jsaw5WnOsQP0id5eiYJFD223tTwl93iFVo8/KhOc9QGLZFSzzXr/9pJwg==
X-Received: by 2002:aa7:8b15:: with SMTP id f21mr4709179pfd.72.1588348263483; 
 Fri, 01 May 2020 08:51:03 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id e4sm2385968pge.45.2020.05.01.08.51.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 01 May 2020 08:51:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <Anup.Patel@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 3/5] riscv: Use pre-built bios image of generic platform for
 virt & sifive_u
Date: Fri,  1 May 2020 08:50:52 -0700
Message-Id: <1588348254-7241-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Fri, 01 May 2020 15:51:33 -0000

From: Bin Meng <bin.meng@windriver.com>

Update virt and sifive_u machines to use the opensbi bios image
built for the generic FDT platform.

Remove the out-of-date no longer used bios images.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c                          |   4 ++--
 hw/riscv/virt.c                              |   4 ++--
 pc-bios/opensbi-riscv32-generic-fw_jump.bin  | Bin 0 -> 58032 bytes
 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin | Bin 49520 -> 0 bytes
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 49504 -> 0 bytes
 pc-bios/opensbi-riscv64-generic-fw_jump.bin  | Bin 0 -> 66680 bytes
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 57936 -> 0 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 57920 -> 0 bytes
 8 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 pc-bios/opensbi-riscv32-generic-fw_jump.bin
 delete mode 100644 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
 delete mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 create mode 100644 pc-bios/opensbi-riscv64-generic-fw_jump.bin
 delete mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 delete mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bed10fc..cf015cc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -58,9 +58,9 @@
 #include <libfdt.h>
 
 #if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-sifive_u-fw_jump.bin"
+# define BIOS_FILENAME "opensbi-riscv32-generic-fw_jump.bin"
 #else
-# define BIOS_FILENAME "opensbi-riscv64-sifive_u-fw_jump.bin"
+# define BIOS_FILENAME "opensbi-riscv64-generic-fw_jump.bin"
 #endif
 
 static const struct MemmapEntry {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index daae3eb..0c00d93 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -46,9 +46,9 @@
 #include <libfdt.h>
 
 #if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-virt-fw_jump.bin"
+# define BIOS_FILENAME "opensbi-riscv32-generic-fw_jump.bin"
 #else
-# define BIOS_FILENAME "opensbi-riscv64-virt-fw_jump.bin"
+# define BIOS_FILENAME "opensbi-riscv64-generic-fw_jump.bin"
 #endif
 
 static const struct MemmapEntry {
diff --git a/pc-bios/opensbi-riscv32-generic-fw_jump.bin b/pc-bios/opensbi-riscv32-generic-fw_jump.bin
new file mode 100644
index 0000000..dc39398
Binary files /dev/null and b/pc-bios/opensbi-riscv32-generic-fw_jump.bin differ
diff --git a/pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
deleted file mode 100644
index 3e0da54..0000000
Binary files a/pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin and /dev/null differ
diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
deleted file mode 100644
index bc56ed6..0000000
Binary files a/pc-bios/opensbi-riscv32-virt-fw_jump.bin and /dev/null differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_jump.bin b/pc-bios/opensbi-riscv64-generic-fw_jump.bin
new file mode 100644
index 0000000..c8f209a
Binary files /dev/null and b/pc-bios/opensbi-riscv64-generic-fw_jump.bin differ
diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
deleted file mode 100644
index 1acee86..0000000
Binary files a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin and /dev/null differ
diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
deleted file mode 100644
index c62f2b4..0000000
Binary files a/pc-bios/opensbi-riscv64-virt-fw_jump.bin and /dev/null differ
-- 
2.7.4


