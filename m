Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EQt-0007g7-EW
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:06:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQr-0007cl-W5
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:06:58 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQq-0007tB-6D
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420416; x=1672956416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XEm4hcsLEdMTCGKbGJj98LwZvGvF7wOw0ARvNPFpnaY=;
 b=dqaXtFGBgd6y6NCTOxAlpip4T4xiK9liuNByeONxwzEWD6RHt4DvQgrB
 Or8v2GldVB19l/dd3olD6eMXV3zyPn/9TnPvvPiDDNTCD9xNX0mZrn8/s
 7AoqTkM2sqjEqdbPDwSZE9hz0fGkx64DOElQtIcau5sEI2yca0HXd/YLC
 CMzITX1Kapr8KkrrBXB5ZZ3KRrAt+LYAUeF1IjIHPvV0XnXKP+AnXsONZ
 bRf5wFJmuSPj3jMydiJFpvU3a9/MTv3JohIPskhWww635KM3N7h2LQ7cr
 mCLvkWnYuk8DU7AtgQLN533qLet809LjUkq2vgZzO8X/eSP7L0ZVbUTni g==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="188746543"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:39:55 +0800
IronPort-SDR: eXgVTld2ZS8iLbCtvuWBMCrLeRDJx8rfkt+2GGkgnlMVF+LsmF+KU2J221oGjqtYAarxdWfZYu
 SFm20VoHQNLgjGKn1SbO62lSG9NZoXDw91u0arRlkQiT/w6kEnIBK1/7aPBjghtB3EnhMzi+Ss
 9r6wZQLUOxDkWeH+QYFqr1KkyeIwIiLkUCoSptbs6Jy62U2u30+2DGqdmG2fB5vzOL1Wok8BRK
 Rp/MqtMsNLjpW1BbCRbw77hpF3pLWGgm612ZuTjoVlEsNhFH5jL+cz8X3SWAdj3jVOlQTH/yqQ
 2nCFQHWneSkRWTwVgR/mN2bA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:13:47 -0800
IronPort-SDR: tgtYAl2gfhqRgQ7pL1YRs9FUF2dAR+Lb5iQWM7vWV4G3HinQz2xbN7FPyMo7FgJON32v4wI1aB
 tKK6/kl8rzBDfI3ekyXHDy4GliBlqAcTa9V6kpczOlaUaJzdz1yoB2lzqm790tIzbQgoSjDBAg
 RsN5+mGzCEm92kAtNDgOTNQ24Gs4Vkb/sXLHa/9ivE/VWglIyoJdbm/M8oMBOCyW10u6wtDzrz
 lFwvvxYyCt+CAIfyRIs1+cqlG4ZlF/PcyOGMr6ZKZjCtsPTXhlZu0Dq1cksV1YpJPG0f/it3o8
 mYc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:39:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZ35SXwz1VSm2
 for <qemu-riscv@nongnu.org>; Wed,  5 Jan 2022 13:39:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641418795; x=1644010796; bh=XEm4hcs
 LEdMTCGKbGJj98LwZvGvF7wOw0ARvNPFpnaY=; b=nQJ8ljk6o113SXtmBSNAej1
 Qm0dV39xFrmonVx+4hxYGrZNHoZsna5FbqBM92/3kQec5gpPP9E4LI3t35I+USxq
 2adkGQHuASfJdpxDODRy7f+0QccsWQIaIdNgGkdmkGPboRLqu2qXxhyaDYkawewn
 IONAv+CGqryaZa3999fYsVh7PbP5wxMRcGQBiRMgFwxCvUv0E+G0PI1Bhh87lS/M
 sy4NP+NSlAmL5odEuTwLRHguL3GkeCmz2Bk0jhxB+dj/dwGXuV6V4UhewUE6q5A4
 ghfV0nlNrZY2O2hk11Fkr57dmCUDKf0abae7iE4yAYsjvLr3FKGqaNHp+icr1Tw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id W1449rTLG49N for <qemu-riscv@nongnu.org>;
 Wed,  5 Jan 2022 13:39:55 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjYx6ywFz1VSkh;
 Wed,  5 Jan 2022 13:39:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 1/8] hw/intc: sifive_plic: Add a reset function
Date: Thu,  6 Jan 2022 07:39:30 +1000
Message-Id: <20220105213937.1113508-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Wed, 05 Jan 2022 22:06:58 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 877e76877c..a9f7a1bfb0 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,6 +355,23 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
+static void sifive_plic_reset(DeviceState *dev)
+{
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
+    int i;
+
+    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
+    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
+    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);
+
+    for (i =3D 0; i < s->num_harts; i++) {
+        qemu_set_irq(s->m_external_irqs[i], 0);
+        qemu_set_irq(s->s_external_irqs[i], 0);
+    }
+}
+
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -501,6 +518,7 @@ static void sifive_plic_class_init(ObjectClass *klass=
, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->reset =3D sifive_plic_reset;
     device_class_set_props(dc, sifive_plic_properties);
     dc->realize =3D sifive_plic_realize;
     dc->vmsd =3D &vmstate_sifive_plic;
--=20
2.31.1


