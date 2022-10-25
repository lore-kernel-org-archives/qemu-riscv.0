Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on832-0004Gg-6R
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 20:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on830-00045R-GX; Mon, 24 Oct 2022 20:44:02 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82y-0005Fd-UQ; Mon, 24 Oct 2022 20:44:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05B33B80EDF;
 Tue, 25 Oct 2022 00:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767FDC433C1;
 Tue, 25 Oct 2022 00:43:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="G1KF+vIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWgHHf5sujP6iTUGGEkOEJD6tNbkAvI7pDJ41Ebu1BU=;
 b=G1KF+vIoe+LYD4qwrJ+MF0ODWCndwMsGgmHjSo5GL4P1TZ5EiXEuna3rQHmUH3Z4Ze9vBi
 vyyAW7TpJAEELB4f9pY7q/g1PSjUxjxEzDHgHR4WIoDPzhzjLWF5pjPGHw+Lk8Yt5SqwTD
 kwqR6GAWa9c+hn6vwA5iSOvgMEJRNlQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e6d250c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:43:52 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4 05/11] riscv: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 02:43:21 +0200
Message-Id: <20221025004327.568476-6-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Tue, 25 Oct 2022 00:44:02 -0000

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
index e82bf27338..ebd351c840 100644
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
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
 }
-- 
2.38.1


