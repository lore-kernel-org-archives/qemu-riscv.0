Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4429C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 10:21:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxPOh-0001Ys-KF; Mon, 30 Oct 2023 06:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1qxPOX-0000v7-R1; Mon, 30 Oct 2023 06:21:20 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1qxPOU-0005ja-Qo; Mon, 30 Oct 2023 06:21:17 -0400
Received: from LT2ubnt.. (unknown [159.148.28.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id F3A483FBA1; 
 Mon, 30 Oct 2023 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698661270;
 bh=3GCehRoUQTTLHwBehjbOAMyNSUQP7XzEyuivE4Adaf0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=SShQPQ7JImQZ/z2dnxsd8YLYHKVxN4/e4BfduajtmTFF6QUGKhE11fWXTmvvW97hl
 t5bwX7segOulBY8AdbLEWgtd030neD+VwoHmpMpgJf4m6cuvNejBn5sE5f3OHEkLWR
 J/xSnGQVS/hZB+Y1vICkCVkoBaqEMMf3x9lHwKR4/Zxnh5BvxomyDFTOjMtKA/8Cp5
 KuGRNVKg5cPHEWT8U30fUL5hoXHXqKqu+1iE7MEPhDwZWvvS+GabpotzFvanSSItr5
 nQdxgt6seJ9q1T7t0K3Evowdb+QnYNLyWTwPKpD6fyM9dT6TluOg2a/aYZNOAFdTqk
 p11FU3SmdOhCw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v2 1/1] target/riscv: correct csr_ops[CSR_MSECCFG]
Date: Mon, 30 Oct 2023 12:21:05 +0200
Message-Id: <20231030102105.19501-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.121;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-canonical-1.canonical.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The CSR register mseccfg is used by multiple extensions: Smepm and Zkr.

Consider this when checking the existence of the register.

Fixes: 77442380ecbe ("target/riscv: rvk: add CSR support for Zkr")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	rebase on alistair23/riscv-to-apply-next
---
 target/riscv/csr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4ca96ddd1d..fc26b52c88 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -528,11 +528,14 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static RISCVException smepmp(CPURISCVState *env, int csrno)
+static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_cfg(env)->ext_smepmp) {
         return RISCV_EXCP_NONE;
     }
+    if (riscv_cpu_cfg(env)->ext_zkr) {
+        return RISCV_EXCP_NONE;
+    }
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
@@ -4766,7 +4769,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    = { "mseccfg", smepmp, read_mseccfg, write_mseccfg,
+    [CSR_MSECCFG]    = { "mseccfg",   have_mseccfg, read_mseccfg, write_mseccfg,
                          .min_priv_ver = PRIV_VERSION_1_11_0           },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
-- 
2.40.1


