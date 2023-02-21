Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUM0l-0006LG-DH
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 01:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pUM0j-0006K0-Ng; Tue, 21 Feb 2023 01:20:21 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pUM0f-0002Pr-RZ; Tue, 21 Feb 2023 01:20:21 -0500
X-QQ-mid: bizesmtp67t1676959939t5j5jyir
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Feb 2023 14:12:05 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: 6c27PqfzmO6dGBzi62XBvY/6S0ZgFVVIwmGSHRerIeu0qs5kz16OK0jItTwyF
 4TE76gM3Yt+KtcXeD90fj0rdLsB4wicpmvxZ5IgtkuzMoh9mpWCCI0kvrG+EHCzRkU0fFac
 nbMzieSI0TJKyTfCOFlAwS/EGA04AOvn2AG5TGODjXBgq+L57jlIPxQMiLy/nFFh7OFZXtR
 vW981ZUqmsi1WH6udqgY3a9GR7v2WIA4Av79fWKKu+fRQABlCvqm7cJuLBRa9dSAeK9/dFz
 90UghiE3MOQeAOaMfw3dv9ypKk2zYDwBVMrSTldiPDN6o7RcKjr3gFSZkNxQLSL+jqmwZ3K
 vj47ediagFB+yZrx9U=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: Skip re-generating DT nodes for a given DTB
Date: Tue, 21 Feb 2023 14:12:03 +0800
Message-Id: <20230221061204.1658306-1-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 21 Feb 2023 06:20:22 -0000

Lanuch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
machines, QEMU complains:

  qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS

The whole DT generation logic should be skipped when a given DTB is
present.

Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

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


