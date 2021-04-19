Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNFR-0004qL-MP
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNFN-0004na-2u; Mon, 19 Apr 2021 02:19:02 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNEt-0005yK-7j; Mon, 19 Apr 2021 02:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618813111; x=1650349111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAxzhW2heL1O/qeLTh6rWsqzlTWl7MNh1NZ6zHObLQU=;
 b=Z59gyV0czQYTMK0eZTh6Vv8OeRb7IT3S8FTe3d2+LoXeblTc94ZG3lCh
 PTHrwxLhOGL+Pb+Xpbzt7cxBz9YRpvW1Lv3xRYBRErbRl+lFifDshcNp5
 aGE4DDPl55WGA373/gSW2Un+jP/pibryxeLoq5cWSsUgER41JxNwpH3LX
 gSYuxbRRXRjTKuZeXky/ni9xrK3+huwi+9fxAOReQgPAhViJ9o8rjNjoG
 /r2hveG/R4EfHqQDkh9e3Cv3tM2CVOPlNC2Ix3KHdRkRl2HLTxUg+QIIE
 7GnzEa3nqgbslwGA/65TZ+IAq6igXUBQ/PmHoGwVZhzsSo7jI4Adxpipj Q==;
IronPort-SDR: TCUQKa7GXDRWULLU74kyjCsfM1gAk91pw5zdkOFgIHxOw6Xq27l7NcJKB7mmYK0kPk6RWxH/G+
 wzzKZy/jW/kHHSMM/y18UPqttmWpg0WVAvTpMoXIYTY9W6fWRZSwE3kAoRXDHEgUy7AW3/aylv
 KKN9/Ymk3l50t5JBy3Ni1ffWsi0JFnyUXcKKl/DS079kNWaYXJG+SP5djfk/7izUaO4jmgPoIU
 7wBZEn9+Jt6a+v43uy4qmjURaSjOyC55jsWjj168DOXz9fy+8YpR1lSU2upT0DDbWiuSQvPoBw
 KJI=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="165961266"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:18:30 +0800
IronPort-SDR: p/OKF/KUYDR1WzCwkvBtMU8j6B5jQyV0AUQPUDXckqMlJAqc55NkmGv05dKCa1uoJAK1qt6jvH
 WnmVpME8b1BvlhZK14EQIPa8t4CTVxEwEk2/rMLw0phQsLQ2OaSU8zJYPs4GL+obzgn7cy/+xi
 poYz3BdLmTGmuOXfvc4h3xbUvulTYhjXCv/xL92ZMjo/UIX3w5lzmPAuNdNby6NDDLE345bP7k
 FAgQ3Rr8180CVpZo88X6U1eE3be+nJk7imz6pdn+jnrbXScpOHw0NmONHQEpGJJAp1n78VxiKg
 zsmaESsgNCFdnk2NjasD64tb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:57:37 -0700
IronPort-SDR: D2/5EbiIG0aWWfXvnlxgq7V4EPbfULfZbnVuWUSKkECi00FT86gE8Ns/GbOIrhxXz4eFqu+7AF
 xsEEzc9DgL9dQ2Om/nl/4ej3om0f2cQeUZRfU51tm+yCZrby4uakQiQ7TbQ3TXjcvYt/4Jyaf9
 v/cEej5XeYOJyw3A7B2kJTRE6BquMcMQ9O2jMpyb1jEiYlIQqRcpWynsO00MGcfZs64KkqNyfi
 NIW3OhbkCH2kBUvM7Ks37UoYKg+vWba3PlZPhTt9JQo2XkcV6kHwyFZrVnp+iUzHgoHdjMjakK
 6IU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Apr 2021 23:18:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 8/8] target/riscv: Add ePMP support for the Ibex CPU
Date: Mon, 19 Apr 2021 16:18:06 +1000
Message-Id: <d426baabab0c9361ed2e989dbe416e417a551fd1.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
References: <cover.1618812899.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=736d87ece=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 19 Apr 2021 06:19:03 -0000

The physical Ibex CPU has ePMP support and it's enabled for the
OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66787d019c..4bf6a00636 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -202,6 +202,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
-- 
2.31.1


