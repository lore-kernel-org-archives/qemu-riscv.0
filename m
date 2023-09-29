Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF84E71D2A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 12:38:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmCks-0000w2-W3; Fri, 29 Sep 2023 08:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmCkg-0000Ym-PF
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 08:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmCkU-000568-J8
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 08:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695991055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jD9gt4KoNF5rjZ9B0XL2VB4HdR2ERaO4mqfMF27/wy8=;
 b=aihtRIoe1su9enawnAMRiS7UZfhh8qc38Lv6hohKSIRHW1fLVU1j9tTEnM3IYwsiZ8UFdp
 6QHVPnImNJxSiDzkyIdmoCKnzSFPrGS90tZSjkJt6HZDoNfa41wg2ZiAEFefH8WWoINFIf
 /Bn8uHoMASOA/HxK4A9xf87uDyblR7M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-cT1FN10jPNe5i368wx__fw-1; Fri, 29 Sep 2023 08:37:31 -0400
X-MC-Unique: cT1FN10jPNe5i368wx__fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87CF71C294CC;
 Fri, 29 Sep 2023 12:37:30 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 051CC40C2064;
 Fri, 29 Sep 2023 12:37:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vijai Kumar K <vijai@behindbytes.com>
Subject: [PATCH] MAINTAINERS: Add unowned RISC-V related files to the right
 sections
Date: Fri, 29 Sep 2023 14:37:27 +0200
Message-ID: <20230929123727.391346-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

There are a bunch of RISC-V files that are currently not covered
by the "get_maintainers.pl" script. Add them to the right sections
in MAINTAINERS to fix this problem.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 355b1960ce..1313257180 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -317,8 +317,11 @@ R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
 R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
 L: qemu-riscv@nongnu.org
 S: Supported
+F: configs/targets/riscv*
+F: docs/system/target-riscv.rst
 F: target/riscv/
 F: hw/riscv/
+F: hw/intc/riscv*
 F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
@@ -330,6 +333,7 @@ L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/insn_trans/trans_xthead.c.inc
 F: target/riscv/xthead*.decode
+F: disas/riscv-xthead*
 
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
@@ -337,6 +341,7 @@ L: qemu-riscv@nongnu.org
 S: Maintained
 F: target/riscv/XVentanaCondOps.decode
 F: target/riscv/insn_trans/trans_xventanacondops.c.inc
+F: disas/riscv-xventana*
 
 RENESAS RX CPUs
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
@@ -1518,6 +1523,7 @@ Microchip PolarFire SoC Icicle Kit
 M: Bin Meng <bin.meng@windriver.com>
 L: qemu-riscv@nongnu.org
 S: Supported
+F: docs/system/riscv/microchip-icicle-kit.rst
 F: hw/riscv/microchip_pfsoc.c
 F: hw/char/mchp_pfsoc_mmuart.c
 F: hw/misc/mchp_pfsoc_dmc.c
@@ -1533,6 +1539,7 @@ Shakti C class SoC
 M: Vijai Kumar K <vijai@behindbytes.com>
 L: qemu-riscv@nongnu.org
 S: Supported
+F: docs/system/riscv/shakti-c.rst
 F: hw/riscv/shakti_c.c
 F: hw/char/shakti_uart.c
 F: include/hw/riscv/shakti_c.h
@@ -1544,6 +1551,7 @@ M: Bin Meng <bin.meng@windriver.com>
 M: Palmer Dabbelt <palmer@dabbelt.com>
 L: qemu-riscv@nongnu.org
 S: Supported
+F: docs/system/riscv/sifive_u.rst
 F: hw/*/*sifive*.c
 F: include/hw/*/*sifive*.h
 
@@ -3543,7 +3551,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
 F: tcg/riscv/
-F: disas/riscv.c
+F: disas/riscv.[ch]
 
 S390 TCG target
 M: Richard Henderson <richard.henderson@linaro.org>
-- 
2.41.0


