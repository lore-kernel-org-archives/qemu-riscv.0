Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUXx3-0006Hu-Tt
	for mharc-qemu-riscv@gnu.org; Fri, 01 May 2020 11:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jUXwm-0005uY-98
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 11:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jUXwi-0007LM-RO
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 11:51:27 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jUXwP-0006nh-Sw; Fri, 01 May 2020 11:51:05 -0400
Received: by mail-pl1-x642.google.com with SMTP id u22so3765440plq.12;
 Fri, 01 May 2020 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WrvmKTGX/CX3RpsyigZdEeijEnWRcSxW4YeYCjRcA5s=;
 b=PP9Hbrr/FqPDEBZUCi1vvua/oqtzpdR806p1kmtmCawzKe1vYke0LGUGPUaaEuZ+PO
 tp/PGfKqHi8lZL/uBzXOuUyV4mwdpAk5K/j4s4/iBzIJ5BsNXuy6DVdnfT947c+rrZWc
 k/DXOzV48fAD+Rg9yIYDbWQZjM3onEh8Wy/MhvCfjA7RySMn5EHX3u39aPO/bgT4rZF2
 RvevVgRwrDaFI/MxtxPZgt6NtPr9dZFPyvCTb74W0VPtKW0GVKhIhFpffgwNgI5/gCzC
 IeQmWCxIDL6+9jQXI5ayufnU6a6TKh9bdA64XVMILFs36py03HlKPm1g7D1BajaECRkj
 x8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WrvmKTGX/CX3RpsyigZdEeijEnWRcSxW4YeYCjRcA5s=;
 b=coGnt3qva15kfUaz53jFexgIweRpyYq3TTCZEbArDggf/mMpwJpXUf1aff/o/1x/CM
 xJod9wUa2xobHctXv9W/KwmyxkkOOJB7XjaZGeJ2/+6MQye0m686sU48qa/I4SFQAtDS
 CBHMRKR6SJ/htH5bRe78mPTuKn5uqS91V8DXSs61AvxtXjDg7Ir2poDh5ryGrFSQ1oqO
 AlcebWKl3qx2c+Q58oHiWZyT45P7PVAA9je3ZTW30/p4uNCDWeue1cw9113n2C++Oq+z
 noyZHez+wgs5T/GFt/mWsaIrmGfD4TzKM3ST83OpCOVp9UEAFetLePLPoFjvDJgz50oz
 K8Pw==
X-Gm-Message-State: AGi0PuYE0VEKSDmMi0TfoM2LVMB2SJh7H/OLZJdQooUEPCNLjhAOBBw9
 IxNVlLYtka041CsbQIykQLc=
X-Google-Smtp-Source: APiQypJTKuL0ox5D3gQO7sAq7oKs6A7YLyJUW3U2IyDEb7wH+UlVJ5K+vPbUYxKi8eL7d8eXz8yVdA==
X-Received: by 2002:a17:90a:a484:: with SMTP id z4mr271357pjp.40.1588348264323; 
 Fri, 01 May 2020 08:51:04 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id e4sm2385968pge.45.2020.05.01.08.51.03
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
Subject: [PATCH 4/5] riscv/spike: Change the default bios to use generic
 platform image
Date: Fri,  1 May 2020 08:50:53 -0700
Message-Id: <1588348254-7241-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::642
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

To keep sync with other RISC-V machines, change the default bios
to use generic platform image.

While we are here, add some comments to mention that keeping ELF
files here was intentional.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/spike.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d0c4843..6f26fcf 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -45,10 +45,15 @@
 
 #include <libfdt.h>
 
+/*
+ * Not like other RISC-V machines that use plain binary bios images,
+ * keeping ELF files here was intentional because BIN files don't work
+ * for the Spike machine as HTIF emulation depends on ELF parsing.
+ */
 #if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
+# define BIOS_FILENAME "opensbi-riscv32-generic-fw_jump.elf"
 #else
-# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.elf"
+# define BIOS_FILENAME "opensbi-riscv64-generic-fw_jump.elf"
 #endif
 
 static const struct MemmapEntry {
-- 
2.7.4


