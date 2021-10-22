Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdndJ-0006CT-Bm
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 02:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdndG-000666-F8
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:02:22 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdndE-0001k1-G8
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634882540; x=1666418540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tIl49NFH4soxYku9mq71XJIPaUw0Rwo5rYYaBctrYPI=;
 b=INALhES774xqfbnpyppwu3PRqEM0h14va6HrdzSBhwKyXM6XPBaY67Ui
 sMIK7PAG/ZGas3OViRp2ZXLDlrF/COmz4D5VV0zwsqhlqfUx0/brOGEPH
 MatCBuxTWVpSqevWQJR8VmaH/r8kWxC6uYXyDq59+sDAGXaaw6GdCgOHI
 +8kPAAKPM6ux292KtwXx2Tb6bsy88iFXavzeE8eoGjwZFCw2lReN0IBMB
 Y8VK5RBpt7C+0Xe+YkqSyevlY/8rGWMq2IIlmglLAcV7Yhf9KaFwm+1xQ
 t6e4huaxzpRGMdFq5OUHxA2l5EsPakIgc4NF7bWquKycyswJ+FP7lwHNE g==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="182601934"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 14:02:15 +0800
IronPort-SDR: AwKSRe3C9zUYLzb70MeF34ThBnHCrNCtxIEsdpbY0MxVBqc1Alhd3h8Ci9yfgerlK0FmMOl32F
 M3k2fDJVXWNfV3STf9Wo1R19jraYyudalC4SXr1MVsBtK+h0MlTq9j1DbQAheGjI1oa0CmRinv
 1nlFX9VWOjeGZnVt5G+WAaGYcKp8qhtd0XG18KbjRFcM18Kva6PIXIZov5HQy/fBQU2o1V9DMM
 G4zsIcjCtkhM0xEGLvQSa92qy1Hb7lnurGDKp4X8A8wcbMA5KwffDcFMvtdFZ0TpAQxdKkAIu6
 uOvw8eGmtAZFHCi0UDaM4jTw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:36:18 -0700
IronPort-SDR: xzAytnDlYwplWya+vB/+QejXXrZvXEluEybsXBiB1em3sRASk3fc7LMepm6V+5AyjSIg5/1vgK
 H4v+dlrkp8do0vnSMQD69EQOnSLafdPT/mjsFc/+7Wd99U1E1+x9Bxk59pIAY5nj4pA7Er7M/f
 irbHeXHm+/BF7H45ap1Y5mZN1WDU8NbfecOKXXSp7UUM0yMaJLATrB6iMnA0xOhzlOQa3BQFPA
 MLb5DxN8oWw2fvzW7eZk0S7t3BoQmyWwgFHv/3iqgnZRaWmQ/LGem3R8JcVZmv81jEcF6Wops5
 Izw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:02:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbDJl1stMz1RtVt
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 23:02:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634882534; x=1637474535; bh=tIl49NFH4soxYku9mq
 71XJIPaUw0Rwo5rYYaBctrYPI=; b=A3IomvUAwccmhBZ7oia1vUCGcmbNM1oj7F
 b/9ozHDw/hpGgm6OKYWRaKtKZCVGwJtzaIotN/x+7uxKbL6o3wuTjFIAws2+44mI
 SClSzmSAy89C9YjYTKDFiKjfmGkYmGkycUch7RC+uj0srYC17cGTyj0e+fmkSRr/
 SqUT/dCcsc/4b6AgeVdiPxz8l29CzvvAQEhF3lzcZW1ApGvkg2TD/16lvO28SA+m
 xifY31eGr62fFPkA5pXUUUSH5ZzxNuSvTHio96g5Hwdpm4kmaoMDk9lPxisGQXlg
 HyLiuw6/QE2zJ55BS/4ZbiPXIa6giOgHzR9OpyRDi0AVxHUP9oBA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gi0H2GaRotNG for <qemu-riscv@nongnu.org>;
 Thu, 21 Oct 2021 23:02:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbDJc758jz1RtVl;
 Thu, 21 Oct 2021 23:02:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 5/5] hw/riscv: virt: Use the PLIC config helper function
Date: Fri, 22 Oct 2021 16:01:33 +1000
Message-Id: <20211022060133.3045020-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 22 Oct 2021 06:02:22 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2d3a8ec405..8715cfe659 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -748,24 +748,6 @@ static FWCfgState *create_fw_cfg(const MachineState =
*mc)
     return fw_cfg;
 }
=20
-/*
- * Return the per-socket PLIC hart topology configuration string
- * (caller must free with g_free())
- */
-static char *plic_hart_config_string(int hart_count)
-{
-    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
-    int i;
-
-    for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D "MS";
-    }
-    vals[i] =3D NULL;
-
-    /* g_strjoinv() obliges us to cast away const here */
-    return g_strjoinv(",", (char **)vals);
-}
-
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -840,7 +822,7 @@ static void virt_machine_init(MachineState *machine)
         }
=20
         /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config =3D plic_hart_config_string(hart_count);
+        plic_hart_config =3D riscv_plic_hart_config_string(hart_count);
=20
         /* Per-socket PLIC */
         s->plic[i] =3D sifive_plic_create(
--=20
2.31.1


