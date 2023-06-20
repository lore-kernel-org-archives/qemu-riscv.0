Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9CAEB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 10:16:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHiVJ-0000YU-Nc; Fri, 07 Jul 2023 06:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1qHiVI-0000XO-6D; Fri, 07 Jul 2023 06:15:56 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1qHiVG-0003z4-6L; Fri, 07 Jul 2023 06:15:55 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 47CAE11F042;
 Fri,  7 Jul 2023 10:15:52 +0000 (UTC)
From: ~rlakshmibai <rlakshmibai@git.sr.ht>
Date: Tue, 20 Jun 2023 19:20:06 +0530
Subject: [PATCH qemu v3 1/1] fdt_load_addr is getting assigned as the result
 of riscv_compute_fdt_addr(), which is an uint64_t.
Message-ID: <168872495192.6334.3845988291412774261-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <168872495192.6334.3845988291412774261-0@git.sr.ht>
To: alistair.francis@wdc.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, lakshmi.bai.rajasubramanian@bodhicomputing.com,
 rathinabalan.thalaiappan@bodhicomputing.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: ~rlakshmibai <lakshmi.bai.rajasubramanian@bodhicomputing.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodhicomputin=
g.com>

fdt_load_addr is declared as uint32_t which is not matching with the
return data type of riscv_compute_fdt_addr. Modified fdt_load_addr data type
to uint64_t to match the riscv_compute_fdt_addr() return data type. This fix
also helps in calculating the right fdt address when DRAM is mapped to higher
64-bit address.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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

