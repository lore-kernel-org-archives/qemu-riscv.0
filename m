Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mM31t-0006pL-JO
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 02:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM31p-0006mM-BG
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 02:50:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:19099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=873c9cf92=alistair.francis@opensource.wdc.com>)
 id 1mM31n-0000Xe-Jh
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 02:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630651819; x=1662187819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CabCeNKMr2BSUP3/hzRnLm4PnGZoL4nLnozgep7bsco=;
 b=FAevYvuC/POiPuY3Cw/vpHRmyU0KFagkNFA9ljPbZlYEbyI2+dvCo07r
 R3+thxZxIUwF3zvgLSJ7zl+OMPbrt+32MqzeXT+nNWMpDl0BzvrFyLjca
 PfT21F212pbPBBdJyNZkvsBSfD/MkNiFLSeZ2Oml4C5cSAh0VPDnpmNed
 KJu04XHoc0fVtv4+t1NYth+PbBn4CyLOilrMaEWqu3zX4Asv+sHY+Rew7
 2k3U+fFZgBAXrD5nO0GymWZk+1J8xDyCOrqt+YnazlmQ9PcjP9l/N4cd1
 t/+9nvWebwTf8RrjdShXe241FXqC8GdtbgdWm5VuvZF6BPupmI1HDdiif g==;
X-IronPort-AV: E=Sophos;i="5.85,264,1624291200"; d="scan'208";a="179654009"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 14:50:13 +0800
IronPort-SDR: BCOBZii4PYkawfC/2qlEOwrPFgcjEmxZ82vQHu4XZ6NbV4Y709WnMHD321drCh7whDxDiMUiW1
 M0JQVdlneD8scaeNtAHmhEaF5NKzl9Rrk5ExbyOiauBq89s1FKPh3r0wS8LdyWrlcyToQMhi43
 XcCjbhcqIIYBIKqn64t8DYcd3hUd1LAYjPPq38Xq/Ml4SrKolKf83kcgqtHeoM59gLsPq89NQh
 J0pBgNROmw+NpAW1oR9PGtHn0eip+zzAmhQGxT9LPM48xGBA/Ok9I3NpqZ4bQJU6tuHaGv3zPn
 H8IUSiOnAAxQGaDXy14TBDrP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:26:57 -0700
IronPort-SDR: xKYsY0GGpRclZi3QEoCQ6wQSVS+jlcHYaC0O1QVaDinTWzhl/wUn4Tyhg2buusXxc3Udk1mWJ3
 MX+fW82gk15lps2CKNVpLJnHGU6BNut3s35hUOE5ZGkI1l//+K9VaxKPatDD1JClUol4+hWidP
 NzaWVkQm7Q/HJO5kP7gbxKJV8PcKouM9Sh0gbge7JNFzyfwuUHEDousxPF41TSMWjCMgfVOMBU
 pCcPD+3KRW+QOjAHNklisxeNjuKXLhR3Av8LRXKlk4m8ohwuKgio/ZkqHYR20oZMmP3KZQIR+O
 HXI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:50:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H17hh6Nhtz1RvlZ
 for <qemu-riscv@nongnu.org>; Thu,  2 Sep 2021 23:50:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630651812;
 x=1633243813; bh=CabCeNKMr2BSUP3/hzRnLm4PnGZoL4nLnozgep7bsco=; b=
 pT2oUiO1CRD7m6P+zHS8d1KCkKNeI12UNIJ5Gq7r9YX+8Q1fV7fAw47z9WFgiekN
 5W+iBCHxnYEQBBRYPCLBim8o04IGQ8XDLcdrQCm2MCCoNmW6Dw8zKKCC/hHonx0/
 rMmZmvm9xMjBFXWCkeDdA/ZDqBTa8/tTeCQBE7Fo06JKlWQC2T4SqjLhWg22bybN
 5pS90+nt51CtBxFO6WYmH/THtiK/mlE+eW4BNbMAhLgT7eyvOOe0h4K5gpTVFKSS
 4ZVMX92hteCfzuoo7tUomTiqdB8i55wnMMzRZXHCIHHL6CjLvCSdj/HLfkonMbyK
 dlZrslEDQEtPTBd8qxKeyw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pEmmydLtJRWh for <qemu-riscv@nongnu.org>;
 Thu,  2 Sep 2021 23:50:12 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H17hb6spBz1RvlP;
 Thu,  2 Sep 2021 23:50:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/3] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
Date: Fri,  3 Sep 2021 16:50:00 +1000
Message-Id: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=873c9cf92=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Sep 2021 06:50:22 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Using a macro for the PLIC configuration doesn't make the code any
easier to read. Instead it makes it harder to figure out what is going
on, so let's remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5624adda58..d562ec6722 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -550,7 +550,7 @@ static char *plic_hart_config_string(int hart_count)
     int i;
=20
     for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D VIRT_PLIC_HART_CONFIG;
+        vals[i] =3D "MS";
     }
     vals[i] =3D NULL;
=20
--=20
2.31.1


