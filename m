Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omtRw-0007pg-Re
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 05:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1omrtg-0007Lj-L8; Mon, 24 Oct 2022 03:29:24 -0400
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1omrtc-0003PW-Bq; Mon, 24 Oct 2022 03:29:20 -0400
X-QQ-mid: bizesmtp74t1666596488tdnds4lz
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 24 Oct 2022 15:28:06 +0800 (CST)
X-QQ-SSF: 01200000000000103000000A0000000
X-QQ-FEAT: 7jw2iSiCazp9ia2sp4s8/XglSjZ59qFOB91BAFXtQ2dGdA9sLiljTVFHH1UOM
 fER6DgMUzku3xWyJoK/8Lg9YTro+cKHW8fywMXR/MvY/42zSi8T8ig9j1iNMgKy8MPwCweN
 ytBVaTWq6sWznBHh1HkEpDmJbs6SDEvuLJS2jStjELosnc3B61BvS639Z9ScT1E0ssnAS3E
 Tyc0gsCB0ctObReFY1KdM1GmncXaENyABl4o2RaicOmIrj/o30zklbsxmod84tth4up9Sp7
 QVihjUB5Isc45Z0t6Q5k0fQq1SHip4VaRDrn9YLuEW7Fsi8Nm6vD/0KFJCP8DPXw36Dt1Xb
 bOdqrRiRly4+ShZDKvjDGZqvYlIE8pnb/etLOZw
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] treewide: Remove the unnecessary space before semicolon
Date: Mon, 24 Oct 2022 15:28:02 +0800
Message-Id: <20221024072802.457832-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Oct 2022 05:08:48 -0400
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
X-List-Received-Date: Mon, 24 Oct 2022 07:29:28 -0000

%s/return ;/return;

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/hw/elf_ops.h         | 2 +-
 hw/9pfs/9p.c                 | 2 +-
 hw/dma/pl330.c               | 2 +-
 hw/net/can/can_sja1000.c     | 2 +-
 hw/timer/renesas_cmt.c       | 2 +-
 hw/timer/renesas_tmr.c       | 8 ++++----
 hw/virtio/virtio-pci.c       | 2 +-
 target/riscv/vector_helper.c | 2 +-
 target/rx/op_helper.c        | 4 ++--
 ui/vnc-jobs.c                | 2 +-
 ui/vnc.c                     | 2 +-
 11 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 7c3b1d0f6c..fbe0b1e956 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -117,7 +117,7 @@ static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int must_swab,
     shdr_table = load_at(fd, ehdr->e_shoff,
                          sizeof(struct elf_shdr) * ehdr->e_shnum);
     if (!shdr_table) {
-        return ;
+        return;
     }
 
     if (must_swab) {
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index aebadeaa03..76c591a01b 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1786,7 +1786,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
     err = pdu_unmarshal(pdu, offset, "ddw", &fid, &newfid, &nwnames);
     if (err < 0) {
         pdu_complete(pdu, err);
-        return ;
+        return;
     }
     offset += err;
 
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 08e5938ec7..e5d521c329 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1328,7 +1328,7 @@ static void pl330_debug_exec(PL330State *s)
     }
     if (!insn) {
         pl330_fault(ch, PL330_FAULT_UNDEF_INSTR | PL330_FAULT_DBG_INSTR);
-        return ;
+        return;
     }
     ch->stall = 0;
     insn->exec(ch, opcode, args, insn->size - 1);
diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index e0f76d3eb3..73201f9139 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -431,7 +431,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr, uint64_t val,
             (unsigned long long)val, (unsigned int)addr);
 
     if (addr > CAN_SJA_MEM_SIZE) {
-        return ;
+        return;
     }
 
     if (s->clock & 0x80) { /* PeliCAN Mode */
diff --git a/hw/timer/renesas_cmt.c b/hw/timer/renesas_cmt.c
index 2e0fd21a36..69eabc678a 100644
--- a/hw/timer/renesas_cmt.c
+++ b/hw/timer/renesas_cmt.c
@@ -57,7 +57,7 @@ static void update_events(RCMTState *cmt, int ch)
 
     if ((cmt->cmstr & (1 << ch)) == 0) {
         /* count disable, so not happened next event. */
-        return ;
+        return;
     }
     next_time = cmt->cmcor[ch] - cmt->cmcnt[ch];
     next_time *= NANOSECONDS_PER_SECOND;
diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index d96002e1ee..c15f654738 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -67,18 +67,18 @@ static void update_events(RTMRState *tmr, int ch)
     int i, event;
 
     if (tmr->tccr[ch] == 0) {
-        return ;
+        return;
     }
     if (FIELD_EX8(tmr->tccr[ch], TCCR, CSS) == 0) {
         /* external clock mode */
         /* event not happened */
-        return ;
+        return;
     }
     if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CSS_CASCADING) {
         /* cascading mode */
         if (ch == 1) {
             tmr->next[ch] = none;
-            return ;
+            return;
         }
         diff[cmia] = concat_reg(tmr->tcora) - concat_reg(tmr->tcnt);
         diff[cmib] = concat_reg(tmr->tcorb) - concat_reg(tmr->tcnt);
@@ -384,7 +384,7 @@ static void timer_events(RTMRState *tmr, int ch)
                                     tmr->tcorb[ch]) & 0xff;
     } else {
         if (ch == 1) {
-            return ;
+            return;
         }
         tcnt = issue_event(tmr, ch, 16,
                            concat_reg(tmr->tcnt),
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index e7d80242b7..34db51e241 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1675,7 +1675,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
         if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
             error_setg(errp, "VIRTIO_F_IOMMU_PLATFORM was supported by"
                        " neither legacy nor transitional device");
-            return ;
+            return;
         }
         /*
          * Legacy and transitional devices use specific subsystem IDs.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b94f809eb3..0020b9a95d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -211,7 +211,7 @@ static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
         return;
     }
     if (tot - cnt == 0) {
-        return ;
+        return;
     }
     memset(base + cnt, -1, tot - cnt);
 }
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 9ca32dcc82..acce650185 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -286,7 +286,7 @@ void helper_suntil(CPURXState *env, uint32_t sz)
     uint32_t tmp;
     tcg_debug_assert(sz < 3);
     if (env->regs[3] == 0) {
-        return ;
+        return;
     }
     do {
         tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
@@ -305,7 +305,7 @@ void helper_swhile(CPURXState *env, uint32_t sz)
     uint32_t tmp;
     tcg_debug_assert(sz < 3);
     if (env->regs[3] == 0) {
-        return ;
+        return;
     }
     do {
         tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 4562bf8928..886f9bf611 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -373,7 +373,7 @@ void vnc_start_worker_thread(void)
     VncJobQueue *q;
 
     if (vnc_worker_thread_running())
-        return ;
+        return;
 
     q = vnc_queue_init();
     qemu_thread_create(&q->thread, "vnc_worker", vnc_worker_thread, q,
diff --git a/ui/vnc.c b/ui/vnc.c
index acb3629cd8..88f55cbf3c 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3085,7 +3085,7 @@ static void vnc_rect_updated(VncDisplay *vd, int x, int y, struct timeval * tv)
 
     rect = vnc_stat_rect(vd, x, y);
     if (rect->updated) {
-        return ;
+        return;
     }
     rect->times[rect->idx] = *tv;
     rect->idx = (rect->idx + 1) % ARRAY_SIZE(rect->times);
-- 
2.25.1


