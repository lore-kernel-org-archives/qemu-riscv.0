Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6h9d-0003Rr-VL
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 19:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9X-0003Pb-P0
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 19:31:24 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9W-0004Nu-3b
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 19:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656545481; x=1688081481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLOOBif4pCDYgoFjEfB6Feh5vEd8rtZcstKimUQcuvU=;
 b=SElNhOlkZwcKlmpL/7/p3OvTW4zMkrxkqq7VMl7jIm/jY1NNPs+8ZvS0
 tXAZbyHGEOFAhqKm1/r50j2Axssmz46aHg4Zh7+fHD6lTBtrganv3BTiS
 P+F8TGIG/eiKyfn/gEWkbL1Kt/RVdCyBv1SvBXf4p8m4KyztH+4DVpwpV
 qx1a3yvvJzIE54VwkEq/0caWuxH2Yz8NSy8bBZFcUCBS6JwmQ3GBHsBUK
 1zXSf8MPjSUyNi8pAc+zdFWGMCo7hewlQvUbnzVHSHlrwODDvE7511DPR
 m4Vt8e4TYxZELLLj14eWX/fAIhGFYtQZ4NTAtwBcMf7dDi84sqgiMX+w+ A==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650902400"; d="scan'208";a="205161718"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2022 07:31:18 +0800
IronPort-SDR: urBZ3fpmlkT0+GmvwL0IwQC/CCCgWiWSvwvVKtHcZfrmFr19062s7jcBD1VdOxS/fhLRdERw5t
 zr0liy4CrQotWJupZxGTLnLEuyTzKzOqptN5RNP+u8zZDSfFPfoNFsAeuWVWvAc9UtTMJj8r1k
 UDqRja6vW1nKpIuVr+BQxqmFjwBoqTHGGc06vtA7xLspWAmlcI2luTxxW6qlDsxshIZz8pHo4+
 tJoJJqVBEqjtJxs4kCG7yRWPkVeveSDljne7FabHYgObjDMz0a2bxJpSfmxNzgKMHZt6Kg+8Xe
 VgBB4McjdGEMCSmLk/Dro5+Z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 15:53:37 -0700
IronPort-SDR: EvAf0HCourqhqzg06kPftplHKzzIRl0AgQfqGGRHp74OC2MYz9akwpNPodk8h5zmsfn7XmLsc/
 CDaDtwUiU7qWLZMgFe0RoyKJ1sjjoLSgLNB/F9WaGOZ/Yitp+VrTO9SCnCy3xUPSqnpLlCdUrV
 N8opm0v0zaVdZX5ifuPhp/j1hCPKZs2A46is4bW40PsbTtDs719RhHBtFNRHfzvSLKJS1X6/bZ
 yKzjYhzMi/RzF55i5eTI6ntt5uouIeF9g/pAXhdst8B3XUJSi2SWQ/cuQ0CPW/zLt4OkWOhwkY
 me8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 16:31:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYHlp0QYBz1RtVk
 for <qemu-riscv@nongnu.org>; Wed, 29 Jun 2022 16:31:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656545472; x=1659137473; bh=OLOOBif4pCDYgoFjEf
 B6Feh5vEd8rtZcstKimUQcuvU=; b=FjRR9h7oOxD3xyfcHBGp70X83aRcFFJBNy
 /JRh1bSGZ5br6NQVxXh+qQ2NWzanqy9w/HW0heUtfuBjNl3Ct5QWuaiYUlplHLoR
 u4eLIwFKZ9BE/Fx+KVtBTqwUXc/f2QAWPMldbx6/6M/Vu6Na8GCfee8p/QipS394
 zlqIte2iazBF9gcZqj3T7TXN2i+9aklBWzzXED9CMItTzPNeqLAIWNZY69JCY91b
 ZY1Gl9fr6T+ipno1FYUM6Xobu/8EmvKvYptbvDBlqgVSKIVcEIHJdrUrsSsdLjLg
 6NC2oUMu90Mx45kto1RH3emO0R9IKE/U+dWEvCRddX1IslD+1vqQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vYMUJi2qjx2V for <qemu-riscv@nongnu.org>;
 Wed, 29 Jun 2022 16:31:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.111])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYHlf1P3yz1Rwnl;
 Wed, 29 Jun 2022 16:31:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH 2/2] target/riscv: Ibex: Support priv version 1.11
Date: Thu, 30 Jun 2022 09:31:02 +1000
Message-Id: <20220629233102.275181-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1723d02fc=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

The Ibex CPU supports version 1.11 of the priv spec [1], so let's
correct that in QEMU as well.

1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e6521351..178b4de51f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -237,7 +237,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu =3D false;
     cpu->cfg.epmp =3D true;
 }
--=20
2.36.1


