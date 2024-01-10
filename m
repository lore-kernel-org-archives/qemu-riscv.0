Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECECC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNVnJ-0001W6-8V; Wed, 10 Jan 2024 05:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rNVn9-0001SN-R0; Wed, 10 Jan 2024 05:26:36 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rNVn5-0002Ac-VN; Wed, 10 Jan 2024 05:26:34 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C6AD7B81CEE;
 Wed, 10 Jan 2024 10:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F223FC433F1;
 Wed, 10 Jan 2024 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704882379;
 bh=MHnWxdBgsPkLhB8O457v8UhLxlVOUR8IOe/2YdhJE00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jyl0qPVVfRZOfK5/IcE74gpBnl1EDHxgjFLDxYdcb65A3Tzo+n6ukObdvfJSnmZDl
 0Z6I+QZaDt9XH1bthoStDH6divm9o6AjFLZOx30nJnZ3Wi/HWWtFW8NBVA4O+cuJEU
 C5D+9gkWEjcsGqHU2AHklgxF8P3xcHGwnNxAC50cTLkkMxFLWUk682OkZVw3UDzKpl
 MeztL9a3neUAxo3Qqg0L97bwpHhzb3CvWGq4McYZo3zV/DveVzgHLooRMXJcIBzt1K
 O1g37m/vSfr2/gwpE3VdmH/9CZ8D6p6jZ90l4cTT7skalQifgWeUW6yfJh4c+yZR8U
 zS/ohunxhecDw==
From: Conor Dooley <conor@kernel.org>
To: qemu-riscv@nongnu.org
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] target/riscv: use misa_mxl_max to populate isa string
 rather than TARGET_LONG_BITS
Date: Wed, 10 Jan 2024 10:25:36 +0000
Message-Id: <20240110-eastward-sulfide-f365c89681e0@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240110-mold-renovate-256db1b5c70e@spud>
References: <20240110-mold-renovate-256db1b5c70e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=conor.dooley@microchip.com; h=from:subject:message-id;
 bh=eMHp4WF8kiaDPOpXOfMcqHM5QHTMhiMLE5l3zLH2AEw=;
 b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnzCubtlD7jJ8V40euRfNLEf3rvMm7b9cb3hu4xzhLe4
 fzjwIEJHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAbjIKob/AS/mTt8tFjtbaMW3
 Zw+OMMzgDt7hu//GhvMeDnYrX/Hek2ZkeKUX0MFs+8Sl9en//1uL/Bu/nqw7ITdPgGdVfNIFJfM
 vPAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp;
 fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=conor@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.493,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Conor Dooley <conor.dooley@microchip.com>

A cpu may not have the same xlen as the compile time target, and
misa_mxl_max is the source of truth for what the hart supports.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Link: https://lore.kernel.org/qemu-riscv/20240108-efa3f83dcd3997dc0af458d7@orel/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Perhaps this misa_mxl_max -> width conversion should exist as a macro?
There's now 3 individual conversions of this type - two I added and one
in the gdb code.
---
 target/riscv/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8cbfc7e781..5b5da970f2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1860,7 +1860,9 @@ char *riscv_isa_string(RISCVCPU *cpu)
     int i;
     const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
     char *isa_str = g_new(char, maxlen);
-    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
+    int xlen = 16 << cpu->env.misa_mxl_max;
+    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", xlen);
+
     for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
         if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
             *p++ = qemu_tolower(riscv_single_letter_exts[i]);
-- 
2.39.2


