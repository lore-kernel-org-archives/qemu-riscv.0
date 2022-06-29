Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6h9d-0003Qm-0B
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 19:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9Z-0003Ph-Ac
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 19:31:26 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:55901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9W-0004OF-Pl
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 19:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656545482; x=1688081482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xQvE5TkYu0BMIfKgSMMAq+k4C1izUhUSYHPNBq9gtLo=;
 b=LEFtxhZ0SLUCsmjenDa1KippVrsBDiouJ4GT4Qdb0tCDG+0BgURSlzUr
 nP5BjyQ99ovf2cakpHxjdBvT2Gwkp5objSuXezwxi+j8YWp/sqi5tk+Av
 sEh1capGoGr+1IHqUjlpUqZyVHJAVk5tXBxpL6sG8jOJcVI6vdLghDz4C
 lQxnpyg9rbhvkYVnb1v+LEbzeTW5TtkIYB2Y187eMbfPK73+PHnHOvB0d
 IWla3vhdS4nKkhTyvv2cC7qJBPx35LUsAAGeEvNS8qkxO/9zqF3aTjopG
 swSPGPcAmhtNCKtROcFJ7zn83AmEPlefCIid5hebe5pGVQ17VYICxWO2n g==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650902400"; d="scan'208";a="203108174"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2022 07:31:15 +0800
IronPort-SDR: qfBhlzEu4+ZeucqJEAqt9MWY7UYigtHsZ82YUR+d+as3Dgs1hcJpecvxgBfCLFX6Z48MekB44h
 rHEITZlGkEJ+ysvnR4egJArsM9BAfYA2FdkSxf/j+qV+1RBJPs9JnrX4IVsESu+orSfnaOfOcs
 4jAUvcFg0D2vQp4l+4W0hX5rfXFxju19eGegNRiH+P96mTCPxzqVVWYDSeFeHvaj40c5BV8Pvk
 O79Q3uDyDSPdZj2n5LrQfpofeVUu7hdyOvd0lvzvVZN7Bm9wzSEwDYi/afbsx4dPN71gLHFBQC
 NhLlc7EqtY2FQAL7xTzlWXvf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 15:48:53 -0700
IronPort-SDR: AEdkqzrtX1WGPXyCFWJ6O50TGQp/Huc0eWNOgsq3wfPmaKiixOsFyPLF5hLT5Miv4MODT7abEb
 pvZGmM9nPig5ZZmtVIU6U92cRsbR0f3nYXVQSugbQIPE4uVnSh6NY3WdtH6BuVvxb6U9Dc/GCn
 vaGxFiyTh4lzBB3K2cXzc7rKqHdoawHHhE0Ghon0eKx6f3a4SLBAZxrBM90NU3xAbjIpT/MjIp
 /MDb6FkEmIiZ59653SO6YvmDOCf2zcF+pBi2MeBpzvqEdjtbFjpKAQhnSv90hyP5CLvCvSAID+
 ons=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 16:31:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYHll10zcz1Rwnx
 for <qemu-riscv@nongnu.org>; Wed, 29 Jun 2022 16:31:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656545469; x=1659137470; bh=xQvE5TkYu0BMIfKgSM
 MAq+k4C1izUhUSYHPNBq9gtLo=; b=db2eD4WoNQ8SQERhz0ETM8LXjtIyaWwshm
 c0xhUYCEROXCHsQFVaA1NMNL32TO2z/olrwnAYAHbFEEbEbvJ+huqjNl6TjMLF6p
 PPuKyCR91VSGZPlkNmZvcelUapMkO+jVJySmHBdD0qe8w9C+HlX//znPvkrivheN
 hhJnHJaYY7F4fGN0GjenYy+lWYTsoO9T3unqoFbz5wuejiB/GNfhM+LIMX5befl0
 s1HtSXPlTZKGQb7DtYARIBP5yVZyz4GScOBgqR7SQ9k5CJ/7T0P0Bz37qNwXnvB4
 uwqtuvbWLIQhdFVgxMAmbnQnWvdbkJAb8avJ80QeeyDiD38pl9tA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FWEdOQ96dKal for <qemu-riscv@nongnu.org>;
 Wed, 29 Jun 2022 16:31:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.111])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYHlb6kWQz1Rw4L;
 Wed, 29 Jun 2022 16:31:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH 1/2] target/riscv: Fixup MSECCFG minimum priv check
Date: Thu, 30 Jun 2022 09:31:01 +1000
Message-Id: <20220629233102.275181-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=1723d02fc=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jun 2022 23:31:26 -0000

From: Alistair Francis <alistair.francis@wdc.com>

There is nothing in the RISC-V spec that mandates version 1.12 is
required for ePMP and there is currently hardware [1] that implements
ePMP (a draft version though) with the 1.11 priv spec.

1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html

Fixes: a4b2fa433125af0305b0695d7f8dda61db3364b0 target/riscv: Introduce p=
rivilege version field in the CSR ops.
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..6379bef5a5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3561,7 +3561,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
=20
     /* Physical Memory Protection */
     [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
,
-                                     .min_priv_ver =3D PRIV_VERSION_1_12=
_0 },
+                                     .min_priv_ver =3D PRIV_VERSION_1_11=
_0 },
     [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
     [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg =
 },
     [CSR_PMPCFG2]    =3D { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg =
 },
--=20
2.36.1


