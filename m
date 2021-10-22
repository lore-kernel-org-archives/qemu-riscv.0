Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdnd2-0005Vj-CZ
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 02:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdncz-0005Tc-2x
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:02:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdncw-00018A-Sb
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634882522; x=1666418522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gAmmYyKP+l3T8k3JuQE1UQcUwiL8X1Z35jFIHlXUg1E=;
 b=UIuqh3sY/nmYidjsWK9UZVVnhFD5MxLfofI8vYFtgUp0H/8TMDZnYIrq
 zG/0/FZTncSINJmTBva0ghJJQOv8dO+gSyPPQchcF9RXCiS5j1PYImNEB
 K4TaWldN9Mrxr2+xBROrscHPQdW+lyQuW2l0bFGojqsAfUZeSfPSa8F9G
 yFh2fw0c4mEMQq0Sxt0sJZTQEdJOBDdx7rcHDpvjRFfYyVWsoJ+FRnQG6
 HZPwOwSD/WncF19upxuAtz/dCiTEEM7mQyxNzWl/p+NA11Zn30saqQI+X
 Z0xLTT0J0EvP8Zd7kqjuN6i3fbrRgnFqAik60iTrMJnvR6YYJtAS7ZJ7O A==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="287463447"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 14:02:01 +0800
IronPort-SDR: wZh4xI+CdtZDH1lGq79wLMFbHArHJlDMbCARejHuobdkwg+2yu4vFJZj2pSdDwAu0VE5eZyxPW
 u2JEYvR4UNPhrv/Z80sC3kTx1WV56qszp76mJEBkqLfSfotuPRJ2XcFfGb9DpqAg+JTPBXoX9W
 yxJgwbJQtFpYK+LJgU+HsMOYn+57JtmS4MtW9sduATIR8uJ4I96MPo21wFU0wKJA71Zh0jDbrr
 BlNSVJ7UPjBL2wBXh0hKwauiRo3vtLZWl/v8KiUaHdJ6jImPJkRwGZ8sEBLA7lc4X6NzGN4sBF
 Y9LyBXmDVJenCaumX8LYNEpl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:37:37 -0700
IronPort-SDR: b9HTyXHoHNpP58C/iJvq5f27xKJx/YcTlinV4wqEIAOqY9Hl789+LitB+jW5GF83Qu7/Zzm8o2
 S3ZJEroJbEIZE9ur3TGsvH6UEmX5iamudAPAEndufdpaY86yYHe9gU404tO6o497p+eotDDOAs
 o+hL7QZFobVGlc5nx/N77TJdMPS1cYXpVQsXvG8p9gEFRvsTn+B4lbDt49J2kigha/az1ywsOQ
 aqoek7rDbqx/76Zo4xyfkVyCpyBC/8EYR0uKBNtMRd3F+eKiKUP5IZAitOBN/JG2jz37nkOFCU
 Oac=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:02:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbDJT1bNgz1RtVp
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 23:02:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634882520; x=1637474521; bh=gAmmYyKP+l3T8k3JuQ
 E1UQcUwiL8X1Z35jFIHlXUg1E=; b=a2v3HLSShWCffPK1yVZrtRUi1/asH+nrP7
 bGxG4twCOKxW7lmXlXcMQolrmW24PsppHQcJLV8fqEfV7NvnwA1/1jiffR/zxZdr
 CnbCRXocrgHGCU7yEr4rrrhOkJZH7kjvc24J9wzJSpeLAbv/YGX9y9CmTxGYK8Z3
 2HwPbJR+asCGJjr6aqehcWiVc6Fwdhb4C0ZgVnKIN2XjLobFsZ/zTE9bB+zA37yD
 oHdy4zNV4KpEd2fG8ne1bDJ3+X5/dgesRXCe2fOdLf65LPQ/MYLPqnR8GXsy6x0u
 kqSLjTkEQYlkMISLOFP55eKKAiDGUQIh74bviua9mFVxGw/T7Hbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CKd_lB5A3ptT for <qemu-riscv@nongnu.org>;
 Thu, 21 Oct 2021 23:02:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbDJM0lmTz1RtVl;
 Thu, 21 Oct 2021 23:01:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 3/5] hw/riscv: sifive_u: Use the PLIC config helper function
Date: Fri, 22 Oct 2021 16:01:31 +1000
Message-Id: <20211022060133.3045020-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Oct 2021 06:02:06 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fc5790b8ce..0010b404ee 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -813,7 +813,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    size_t plic_hart_config_len;
     int i, j;
     NICInfo *nd =3D &nd_table[0];
=20
@@ -854,18 +853,7 @@ static void sifive_u_soc_realize(DeviceState *dev, E=
rror **errp)
                                 l2lim_mem);
=20
     /* create PLIC hart topology configuration string */
-    plic_hart_config_len =3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
-                           ms->smp.cpus;
-    plic_hart_config =3D g_malloc0(plic_hart_config_len);
-    for (i =3D 0; i < ms->smp.cpus; i++) {
-        if (i !=3D 0) {
-            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
-                    plic_hart_config_len);
-        } else {
-            strncat(plic_hart_config, "M", plic_hart_config_len);
-        }
-        plic_hart_config_len -=3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1=
);
-    }
+    plic_hart_config =3D riscv_plic_hart_config_string(ms->smp.cpus);
=20
     /* MMIO */
     s->plic =3D sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
--=20
2.31.1


