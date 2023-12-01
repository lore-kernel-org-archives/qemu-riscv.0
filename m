Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AD9C07E97
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 11:55:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r927K-0000Wh-RY; Fri, 01 Dec 2023 06:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1r927C-0000Ve-UO; Fri, 01 Dec 2023 06:55:26 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1r927A-00056l-D6; Fri, 01 Dec 2023 06:55:26 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com A9726C0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1701431722;
 bh=rk/6P/AMFpU2E7sVi9CNapk5oB1+HOiTa4oYEyTG/yA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=KJzMGN/h+ZMhrlRzL47nJhrSfKVOx6rxuPUcqr0ZCIZX9n9k6Mv9SBRm37qHsBMAj
 qVCyrqkSh0izeeA4eqnuZs4kO9JUbFe9N++eTXAgR5tj9wsWmSjJFfxaZLmqEGSYmi
 fSkNTJ+/02EP1aNWqO6CVOzkmTiCB4WV9vRc78AdAaFWY6/dp+eEJHfLlCV2gf+Amq
 B/PHvv0fOqfGJBv7KVHEXlthkm0aHHYZW2WBCi6eed0P5tr78OEjC/RxCpty04spMw
 h+zEh5QaaMF9sp3kltNf3BFk+LxICoK9Ec0Pj6gZvTjYZavs4y2G/MuwEi4Nvb/BuS
 Y8p6oUnQsctsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1701431722;
 bh=rk/6P/AMFpU2E7sVi9CNapk5oB1+HOiTa4oYEyTG/yA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=jQamnhYq0bvrLX5b4+W5drr3LvHh2ENXN2Ih1SILu6KG9nDnL6NqdBmsQXYzGY5OG
 NA4OyXrrj66LtQSziiVIUjBc1wMQyMRm9P4DezaJVqQhtCVXcDep62W8UQ8eoIhk5l
 /64aQYOOpIr9JbhKR6aFiRSjmF2iznLCcsvKnJQbQxqegdPA117zbcTmHCKbDo+p0n
 mvnpJ48UEYJEQidrYvxVs2abbAliQyYIZktutTv1Mrme5WbXxTAGgIJDwR7lF0Ep+3
 ROwRs6EqRDEdJvGyJlBMpoKBuTywWV6SGTZM8dG5OX5FkGHDD3HAHdG55D7lLu5MKw
 WeQLyiguMFU9Q==
From: Irina Ryapolova <irina.ryapolova@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Irina Ryapolova
 <irina.ryapolova@syntacore.com>
Subject: [PATCH 1/2] target/riscv: FIX xATP_MODE validation
Date: Fri, 1 Dec 2023 14:53:38 +0300
Message-ID: <20231201115339.18353-1-irina.ryapolova@syntacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 S-Exch-02.corp.yadro.com (10.78.5.239)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=irina.ryapolova@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

The SATP register is an SXLEN-bit read/write WARL register. It means that CSR fields are only defined
for a subset of bit encodings, but allow any value to be written while guaranteeing to return a legal
value whenever read (See riscv-privileged-20211203, SATP CSR).

For example on rv64 we are trying to write to SATP CSR val = 0x1000000000000000 (SATP_MODE = 1 - Reserved for standard use)
and after that we are trying to read SATP_CSR. We read from the SATP CSR value = 0x1000000000000000, which is not a correct
operation (return illegal value).

Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
---
 target/riscv/csr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1a53..6f244815b7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1278,8 +1278,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    return (vm & 0xf) <=
-           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
+    uint64_t mode_supported = riscv_cpu_cfg(env)->satp_mode.supported;
+    return get_field(mode_supported, (1 << vm));
 }
 
 static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
-- 
2.25.1


