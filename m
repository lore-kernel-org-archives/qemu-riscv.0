Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxin4-0002LB-CT
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:54:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxin1-0002K9-Dx
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:54:48 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mximz-0003oX-B8
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630485; x=1671166485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lLEZM4gScoF01+Fu+KXzGB/NfgDsTqudT14Hm+pxMs=;
 b=bPTLKAN68+xWKvC4Yimw+RirTxTTuLIFWukVKLP3NruDnxTsUtEEmbVz
 fLjAx9+zRfg+FuSNgeF1ihEk0ZDlz4maib3ZZUyocpk6ucEppW/HyHpPx
 9AEH5Lhu8HJC8CccNYbzZkpIxlIDi7X5Z2BuThl6XR0/b9wbi1cTtpRos
 2ctiLGqfc7UdSrPbp/zewhPq70Pft1iugrAqBorut+rKqbf/BVTnfCjns
 tkZ8RL+ZYsPL8VelJaiFz2sFSgB/S2tGHKBB7q/IM5JtMsvSpI+rKCQ//
 rMm9bVeY9cOa1x2Yq6GR5nl2bmCtxW/naP5qqfIABLoTYUCKnmtf/xukw A==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354554"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:44 +0800
IronPort-SDR: kdFzAuVrHDdSN0fah4sSntPnx81kteEp/T1oPlnHk6O0ppMrCiY+QDo3wqDFty0auiFbf1Ztpv
 Ydqr2L8ArC1hskiq5hZJONPN0O6Q5wm2gocHeQnk5kxUYdWoZJ6Zdkb4cFwNSQ04VT4o6o2TfU
 G9yHJ6beI7fHzq+w5UwWRKTQ9NnfpXFYyKKi/nGR2ARIj+5/14h1LDMOmocLM6qzhopZQCMLP/
 pno8h8/2Gd9N3UnQPcanb+/Mq6NwUX2sMGZAuOB3FTUJf/GF+fNiehB0Rcqmesn2xbLoRQ5DJE
 GFDNFP9xAfEmM0qC2XcAb+e0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:38 -0800
IronPort-SDR: BC93lUCl2BsA0yEl7NAO7Qdb70zRi87HMi1fEQuDhuar82NKphazm7MsbW4z1wl3YGIpZlayiQ
 79lEQKcNr7S57Fr54UwZS/IGm8ws7Ci/rs6PYJJZ4LWM1A6B407iZyT7pcltmRT3NOPgE+oux7
 Q5CF7CfjPgSaKxXmbCjjA4umBCxf1Li4LZ78fNdbILj39DWSS4W/BkoKSFqPLXGjxfE7wIlvMm
 XuGYaClna0gqrOuWYs3ozKT1peJiQwK60qCNDK9sIfeMAXJnrMcAyTsgyMf7HOaN1g3U+EXyD5
 PBM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0CR61Nmz1Rwns
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:54:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630483; x=1642222484; bh=3lLEZM4gScoF01+Fu+
 KXzGB/NfgDsTqudT14Hm+pxMs=; b=ZqJs7pBl+ppXh5r6N+asKBA/UtqKHGMx72
 XTIWpwSdoi3dj3tSzoSG2Z0lBWdJfkv8meE0UZCITcmeFmhvVz/wWBpVurktwp00
 sLpCFBIrD0AbdpTCBTOC15wi34YQSmlLROUxkritHTlSjG4l0mBHp4zezp6a+oRd
 luKuKeQo2wQ4TENd/z51Zujb4VUTCAlRfvEi+FOw7TFFUqugOfZ3/9NUlf5ZS9V7
 8eHdqaKg7EdJ477ZaZp1bYGg0CFnKQdNdYtp2nNs/8DDCpQWSajbBR4Gir5iHWPH
 0/GAkwRrwPzBzH/PcP2LrEERNzvYx9oVgOiPz5uKhmHQYmNZmmIg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nxVbNQefx8T9 for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:54:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CL6BDLz1RtVG;
 Wed, 15 Dec 2021 20:54:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 1/9] hw/intc: sifive_plic: Add a reset function
Date: Thu, 16 Dec 2021 14:54:19 +1000
Message-Id: <20211216045427.757779-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Thu, 16 Dec 2021 04:54:48 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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


