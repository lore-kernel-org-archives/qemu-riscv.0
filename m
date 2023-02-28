Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWugX-0006cj-6G
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 02:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWugV-0006cC-Gk; Tue, 28 Feb 2023 02:46:03 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWugR-00008H-Kz; Tue, 28 Feb 2023 02:46:03 -0500
X-QQ-mid: bizesmtp70t1677570326tmqixu05
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 15:45:23 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: qdVriHgIVQiv0ievwJ7aNWCodZ77WTgis6tZ+790IMksUrzrnW7awINOX++a4
 5iZXGOXRlWwgJWD5SvQUfihUgiNtDKo8/Yqp5fDfnOPfaZwG492n+JeesPcziEt3kZ/RHo7
 tmXZAnvrFSG0H3v9cIZ/MReNm8uAXk1WCwqVRAOxg6p2RHNmMkCULS67+2n03c8rI8UnUg1
 ae8JpO/ESEkOZhOPBlXEchbMb8LXtmsrltDCri0KrurJHVK93Rx9dfFubjjmRnU1gxAGZT2
 Hw73PQBeWS6oonvLww+PeKkuo+0wBKfKRvm50D4pkoy5FYyyUh0CHVQe/Vf4vDcXOSLd490
 PQhC/TBIxdjY+d/Iow=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 1/2] hw/riscv: Skip re-generating DT nodes for a given DTB
Date: Tue, 28 Feb 2023 15:45:21 +0800
Message-Id: <20230228074522.1845007-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 07:46:04 -0000

Launch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
machines, QEMU complains:

  qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS

The whole DT generation logic should be skipped when a given DTB is
present.

Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---

(no changes since v1)

 hw/riscv/sifive_u.c | 1 +
 hw/riscv/virt.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ad3bb35b34..76db5ed3dd 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -118,6 +118,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
+        return;
     } else {
         fdt = ms->fdt = create_device_tree(&fdt_size);
         if (!fdt) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..0c7b4a1e46 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1014,6 +1014,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
             error_report("load_device_tree() failed");
             exit(1);
         }
+        return;
     } else {
         ms->fdt = create_device_tree(&s->fdt_size);
         if (!ms->fdt) {
-- 
2.25.1


