Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBFAEB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 15:59:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBdlk-0006pX-Td; Tue, 20 Jun 2023 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1qBclz-0002UU-IU; Tue, 20 Jun 2023 10:55:59 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1qBclx-0002Nb-LV; Tue, 20 Jun 2023 10:55:59 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 61A9711EF74;
 Tue, 20 Jun 2023 14:55:54 +0000 (UTC)
From: ~rlakshmibai <rlakshmibai@git.sr.ht>
Date: Tue, 20 Jun 2023 20:07:50 +0530
Subject: [PATCH qemu] fdt_load_addr is getting overflowed when there is no
 DRAM at lower 32 bit address space. To support pure 64-bit DRAM address,
 fdt_load_addr variable's data type is changed to uint64_t =?utf-8?q?instead?=
 =?utf-8?b?wqBvZsKgdWludDMyX3Qu?=
MIME-Version: 1.0
Message-ID: <168727295428.6281.779141407696793820-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Jun 2023 11:59:45 -0400
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
Reply-To: ~rlakshmibai <lakshmi.bai.rajasubramanian@bodhicomputing.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodhicomputin=
g.com>

Signed-off-by: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodh=
icomputing.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 95708d890e..c348529ac0 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1244,7 +1244,7 @@ static void virt_machine_done(Notifier *notifier, void =
*data)
     target_ulong start_addr =3D memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     const char *firmware_name =3D riscv_default_firmware_name(&s->soc[0]);
-    uint32_t fdt_load_addr;
+    uint64_t fdt_load_addr;
     uint64_t kernel_entry =3D 0;
     BlockBackend *pflash_blk0;
=20
--=20
2.38.5

