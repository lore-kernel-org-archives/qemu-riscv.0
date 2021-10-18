Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIZI-0005CG-OE
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZH-00059O-PI
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:40:03 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZF-0006jq-0B
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524800; x=1666060800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOJHT33AmvBuAavfWO+VDGYYMhs/3tDBqE4/z6LbhPY=;
 b=SDwLIO1Yik8l5iU10HKd8dZpKfWLxRYfFrfv1/yC/Kd1FLIZPexyAciw
 al1liqtIvJLnpNRFlZklAFc1BfiQVGQaOPOVaJM7KEp+lucz/pFVmdLwA
 9stqvz04mVv1D5BkxB86kI2Yjwrcug5CgsWZY9RmvkS9C3JIfYIlFMLWc
 uNsdy2SogGPonimTf59Nrsrmr+0PpVdoHfp20VMeLOh/jy4WQD27eHg7E
 JTfKk/Pn6KB5HBITtnyL5PQm3TwUMoh8nprW/d/XrmeK1uc+mzs4KuEpm
 Gj3sS0UIyFwdA0YshqKQWqewJe1e2YyBr7dzSMSrWu0+0nTrMbVWfRJRI A==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="183138072"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:54 +0800
IronPort-SDR: cgTAh2ZLHFTSibLtTRvE2H1cNybel9su+lvOUH7ld9WeIT9jX9JWP/rI1BmEq/y2bscEiXvca8
 aQZYwyrntPMdywLQhIWm0yqc1nMKiaLqUToJCAjJOrrdOKlrt5eLtxDFVATzsVuYbi92hnza9O
 HwjuBFCsu2lJL4qwkFQdU4eIukyR7F+67SBb4Klhbd0ikX9KVOm+i+EbZWcvPDBj1v/AeqR7GS
 zRtXjQLhjUMN69tRe9pnG6iScVaT01jI4ssbQO32mYgSno0C02vnF5yKnZQHMPsFnfzemjeEkd
 UF+dLRrEEY0/+QqaMVXuHSvj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:14:02 -0700
IronPort-SDR: bofsu+TYfLpjBbRV4xVzMoQKMwcqLJkk1wM0+jmR7Le6FIaBmur8LR/GTGBQKqJ+XFOMgVhaDx
 xeUrMFWwJNCvTE3u9yhRoHGISgdeVPkbjg1ckAGpSiBBUJ06GDJlX1gMUQ7vyNL87bIMN5Et+Y
 r+/RxiFq0nOVStr+LwBY1CDZUuLb18FZlT1e62hXAY5BvrA5ZTyJWmlFTFVb6b1XyMLO505saB
 ov8JgPyqJokGKLeU90dZ/zG0qQSyTfE4LcOE+ONcz0Dgj1fB1hWktZK1eB6fuKkGzeGkO/sAic
 BK4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh164bg5z1RvTm
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:39:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524794; x=1637116795; bh=dOJHT33AmvBuAavfWO
 +VDGYYMhs/3tDBqE4/z6LbhPY=; b=H4u6UKzp/+edaa17fJVTjIQmVm1j9ncMDC
 hRglJ3rXr4gGK/fLtmmR9djiOfQJ4Zmhgiy9K9VKytDkp4dFT4kB9s1ggu54FZUo
 NDK0mHwYNoa34vf4nTMvU7YPRrbwAlE7qBzFINzKZV9mjfonnlCIQtAnHo+JTang
 oORLgcsOSyX43WP6n6rlNdmtX4zGEsHh8h+afQ26BSlRYVS2WQ1WSQbB/8BsYSuv
 Z+kaKBmUadmzf3TrNliO36H7qWOiF5NmbI5uEz3I7K0QYaisEsha5YgyAYem53b9
 VZ/lVyc9TkQe9uJLibrzI2tyMoivCzDOUx8fIC32T3i2OZWiL69w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id npp9_23hcEHc for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 19:39:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh112r7wz1RvlJ;
 Sun, 17 Oct 2021 19:39:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 5/9] hw/intc: sifive_plic: Cleanup the irq_request function
Date: Mon, 18 Oct 2021 12:39:41 +1000
Message-Id: <4200da222a65c89ed1ba35f754dcca7fdd9f08d6.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Mon, 18 Oct 2021 02:40:04 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index d77a5ced23..877e76877c 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -412,12 +412,10 @@ static void parse_hart_config(SiFivePLICState *plic=
)
=20
 static void sifive_plic_irq_request(void *opaque, int irq, int level)
 {
-    SiFivePLICState *plic =3D opaque;
-    if (RISCV_DEBUG_PLIC) {
-        qemu_log("sifive_plic_irq_request: irq=3D%d level=3D%d\n", irq, =
level);
-    }
-    sifive_plic_set_pending(plic, irq, level > 0);
-    sifive_plic_update(plic);
+    SiFivePLICState *s =3D opaque;
+
+    sifive_plic_set_pending(s, irq, level > 0);
+    sifive_plic_update(s);
 }
=20
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
--=20
2.31.1


