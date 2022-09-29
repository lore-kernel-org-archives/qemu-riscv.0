Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe2sv-00052A-Ut
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 19:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe2st-0004vB-Bi; Thu, 29 Sep 2022 19:24:03 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe2sr-0008VU-Pr; Thu, 29 Sep 2022 19:24:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D355FB8267F;
 Thu, 29 Sep 2022 23:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF57C433D6;
 Thu, 29 Sep 2022 23:23:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aVj1dhMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664493836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HftbmP2bOLL0qaTIFvjVy40wbSWxhakG63dKzx542s=;
 b=aVj1dhMTMWvmYJSwvkuRLjrJls62jv2kkr7ITaA2VLKhI7oOJPs73NHoQ7zrNMDSo07ufC
 Usk72PB3qLpEj6Zttd2l+LP1nv4nNM6RqT7bNncU33b93cHi4tOu1MuuVuzHWvjWPMOSpl
 9d8PByCTY6wrTInP5PAsDXfv9ian1H8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3ee3846
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 29 Sep 2022 23:23:56 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PATCH 3/6] riscv: re-randomize rng-seed on reboot
Date: Fri, 30 Sep 2022 01:23:36 +0200
Message-Id: <20220929232339.372813-3-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-1-Jason@zx2c4.com>
References: <20220929232339.372813-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 29 Sep 2022 23:24:03 -0000

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/riscv/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..aaecf21543 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -30,6 +30,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
 #include "sysemu/kvm.h"
+#include "sysemu/reset.h"
 
 #include <libfdt.h>
 
@@ -241,6 +242,8 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
+    qemu_register_reset(qemu_fdt_randomize_seeds,
+                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
 }
-- 
2.37.3


