Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B2C4167D
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 11:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD0Y3-0006w5-Aw; Tue, 12 Dec 2023 06:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1rD0Y1-0006vJ-8W; Tue, 12 Dec 2023 06:03:33 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1rD0Xx-0001cW-Tw; Tue, 12 Dec 2023 06:03:32 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com F11BAC0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1702379003;
 bh=LNTqhCFAPEPjVhXNqila5VsKx8aqtn2PAKuk5zZOE5I=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=ONZtDZABJ9Az2gg8o42GWZ+2KuC2OtNHMx9vuAnO0v9ibNafII5my6wrFcxtipFYK
 fNFMddy3WJ6E4ekxUcKYqNYSSpNOs6j6RvySCNH2NaCiJblkIj1HNstaj0+xhMdkNl
 MseG9eGg1r+H6SxaYKj09J8Sohkfq6rLlMhArM5mjzjYo5XOOeNdKyF+mJ8Z7zZ618
 d+JnsGSMxcVElLYMOS9HaJOTsmGBR7iujneyeLHF3iAw2uKjeLOp1Fev3FMlTpj1w3
 k+OJLoafI6NXcbDrqgQ5PgsLFwsGf3WlALEeljhzNs7P7qQ6nauhhJ8J3gikQTyWSq
 b2LYWJyF+AKVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1702379003;
 bh=LNTqhCFAPEPjVhXNqila5VsKx8aqtn2PAKuk5zZOE5I=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=SBTVOuyGSpduY8B+Z4ZOVeGwQe/dMxClcYmF1yUf9NetrpGkFJDUXOgUeDOkm911Y
 TB98UtQqtZ+Jh8+V+lxoT7+wRjVVVo8ayd6x0jcqiL/2K8EnIKo+clgwTQbR1LZF0o
 EgkAFzUwTIz+bk7byTLSWfmBAw0/BFdNQxoSQslmlE2yQGfAlX9c4fc76DkdGYJoTu
 FScGubjzIMBdVF3x3JgvzvVEXWJm75Li/Zmmb08rmES/Z9C/dGIfAsZTBElMLG8Xvt
 WRKpjKIDR4VSKOn+KUTxzP9/W/qjrp3ykOAW7hOKc+A0ctweqn4N/sfiCWjRH+p0Pu
 rgvKzbdsFQ6wg==
From: Irina Ryapolova <irina.ryapolova@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Irina Ryapolova
 <irina.ryapolova@syntacore.com>
Subject: [PATCH v2 1/2] target/riscv: FIX xATP_MODE validation
Date: Tue, 12 Dec 2023 14:03:04 +0300
Message-ID: <20231212110305.45443-1-irina.ryapolova@syntacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
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

[Changes since v1]
used satp_mode.map instead of satp_mode.supported

[Original cover]
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
index fde7ce1a53..735fb27be7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1278,8 +1278,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    return (vm & 0xf) <=
-           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
+    uint64_t mode_supported = riscv_cpu_cfg(env)->satp_mode.map;
+    return get_field(mode_supported, (1 << vm));
 }
 
 static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
-- 
2.25.1


