Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjkY8-0000x5-Nk
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 13:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pjkY7-0000wq-TJ; Tue, 04 Apr 2023 13:34:27 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1pjkY6-0004z7-FA; Tue, 04 Apr 2023 13:34:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A7E06379E;
 Tue,  4 Apr 2023 17:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6298CC433EF;
 Tue,  4 Apr 2023 17:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680629651;
 bh=nA751IN4ok/gQKu18Ix8SbS+Tl6rz3vNS509EHBuvW0=;
 h=From:To:Cc:Subject:Date:From;
 b=HSZ1XqSAOgafi/N8Ybw5qHIvkSkDCuFyYOZSadWsHc78mslOHWsq61U7Mqt38008W
 v9DZWVWZ2ylUcHQdkR0Nfyf2s/oz3yPOLVyfUNpFcqGfSdz8Q8NGCInfDE3h6EzcQg
 3t+pOKiP13IvP/m2y1SkwYrywzZf+M1/ygHqWymPE4KoFFAzsgfV1iqC5VmXX/Q8Gg
 K91Z0fvs9DlxkFcqmzUQkDRSbJjB7MkjS2O8XnrW8XjrzqkOjX5bLA65824zDRBZDF
 OHTudcslz8hUptiw6izOIq18m/3qfcUmjy5ukk+d60eze5IA0pe9L7ZUU3Z3x+tEMd
 wy6ADX6phschw==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] target/riscv: fix invalid riscv,event-to-mhpmcounters entry
Date: Tue,  4 Apr 2023 18:33:34 +0100
Message-Id: <20230404173333.35179-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 04 Apr 2023 17:34:28 -0000

From: Conor Dooley <conor.dooley@microchip.com>

dt-validate complains:
> soc: pmu: {'riscv,event-to-mhpmcounters':
> [[1, 1, 524281], [2, 2, 524284], [65561, 65561, 524280],
> [65563, 65563, 524280], [65569, 65569, 524280], [0, 0, 0], [0, 0]],
> pmu: riscv,event-to-mhpmcounters:6: [0, 0] is too short

There are bogus 0 entries added at the end, of which one is of
insufficient length. This happens because only 15 of
fdt_event_ctr_map[]'s 20 elements are populated & qemu_fdt_setprop() is
called using the size of the array.
Reduce the array to 15 elements to make the error go away.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I dunno if I am missing something intentional here, feel free to scream
if so!
---
 target/riscv/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index b8e56d2b7b..fa1e1484c2 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -35,7 +35,7 @@
  */
 void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
 {
-    uint32_t fdt_event_ctr_map[20] = {};
+    uint32_t fdt_event_ctr_map[15] = {};
     uint32_t cmask;
 
     /* All the programmable counters can map to any event */
-- 
2.39.2


