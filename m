Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kczUH-0002c3-0z
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 18:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5772e8c53=alistair.francis@wdc.com>)
 id 1kczUD-0002b7-Qb; Wed, 11 Nov 2020 18:25:11 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:11722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5772e8c53=alistair.francis@wdc.com>)
 id 1kczU8-0001oW-VS; Wed, 11 Nov 2020 18:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605137824; x=1636673824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CmLcrDqzgzQg6WvVcHtc+xT6zgkwt7zifC4DjjHNC1A=;
 b=PnQqZCmdY5yxxqkozd64vs0lKYkqcAJOHrXzWrwFpEo/N7liKf9EyWwV
 1mUKSygWBpF97TBcEF/3/Uvj4arDrNzL3Y3TLJT86r0xGEpSovhQXpH5R
 BzjkL24Vkb3TvpKRndDZuNyPIjeOkF+C6I8WeYBug2dZjpCdkqFrwO7Ju
 Sfsb8Qz8LZxWV1CV35FM0GsXdgIGR3s4ZkC7ski9tJA2Xb8HJrTxhZ7UE
 rlS1npgZgOHlROVTGdnbRii6kMgacdEZpMHE4LKNO0xnWpY8dEgTfyZk2
 DImplG7n7zdumwYg9Bkr9YWGniZorZqBOVrJoK7ZQDEEVlKZncazq0wXc Q==;
IronPort-SDR: jtzobgxMJsKJYFC0cazRC4wkp5Dkw+JprwEPOFWZ+NiFo25yazxApAguzS4sOoscfTTi27n690
 KVDvo2EQFvB2LUiMUkp8PKYXwtHJdaCAzPBTWIUW7pthA1BibPGiCU8wpQ7XTep9JWWYJPhVzw
 T8N3e1aIufoWAdaO0NvXcFG7XWOwVy0C9jS1Xq3cZYIBWiT00NoXO5T6ZHMo3v/AxuiRlLa1bq
 xNo8Lz3jtU0gY2ZyyeIjRyw+zwjr///2KCCz/TQCSQMePWqJ9R85eMhCDNfo7GntoLn4rST9J5
 6rE=
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="255996588"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Nov 2020 07:37:00 +0800
IronPort-SDR: 0KZILCDieweQwqUrCArLiYyJbYd/AZ0BDYmzhK4Do/iSysi1bjLmU0GM7QMFpsj7vDEq07pquR
 oSfX+nhqME0BcWBVfl46cShUlNAM8fg7kvYlEZ4j3Eh7FEXQX7rJJS/kj7SGx/dfVQIBRKRO0y
 p+oR5aulRTVinB1Dl30EgVfT/zpwRxm7tvmylcDl9U+rmkCUm82Es4Rz+tnuF8tIj8EaYSPUK+
 KvYjUTX0mR5uQp/nzXbJursTeSY09jUcFUEa1NiREIlcHFqsk2wuxnWRZfs0zzEhRpLgA6+Ely
 dBENdb/t1wBfMKuXVwDGfy+0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 15:11:01 -0800
IronPort-SDR: 4DOXCw6R7O60WEZQ3L+HKA3tDWBa1ywB0zghblZHdN5IozDr8ZjD/vzt2+b7Xp0H11skhwB7kA
 AWyFdh9nBXaGk9521hiZ9vfTkfLzeXlW6jQyJD09WuNLzUl4GeIgoY69IMmAPSzD2xYBp3JjEw
 BAiCC9e3X1BkakdANr7dfaF0ca1wixtZNGaz7Qlz2wPw5Q6x3ZZFPzzuW17nPjMjMZil23pcv5
 qlLeR9wgwOPabVBoWhFSOkRonIdicuyuHl+fr34f72kBUTCivNTzaO8SV+5MrSgM2rlVuujfCv
 Prs=
WDCIronportException: Internal
Received: from usa002979.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.31])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Nov 2020 15:25:02 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/2] intc/ibex_plic: Ensure we don't loose interrupts
Date: Wed, 11 Nov 2020 15:13:24 -0800
Message-Id: <e7bcf98c6925b1e6e7828e7c3f85293a09a65b12.1605136387.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <22d2fb0d7af5ca316c67ac909926368d1bcb7cf5.1605136387.git.alistair.francis@wdc.com>
References: <22d2fb0d7af5ca316c67ac909926368d1bcb7cf5.1605136387.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=5772e8c53=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 18:25:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 11 Nov 2020 23:25:11 -0000

If an interrupt occurs between when we claim and complete an interrupt
we currently drop the interrupt in ibex_plic_irqs_set_pending(). This
somewhat matches hardware that also ignore the interrupt between the
claim and complete process.

In the case of hardware though the physical interrupt line will still
be asserted after we have completed the interrupt. This means we will
still act on the interrupt after the complete process. In QEMU we don't
and instead we drop the interrupt as it is never recorded.

This patch changed the behaviour of the Ibex PLIC so that we save all
interrupts that occur while we are between claiming and completing an
interrupt so that we can act on them after the completition process.

This fixes interrupts being dropped when running Tock on OpenTitain in
QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/ibex_plic.h |  1 +
 hw/intc/ibex_plic.c         | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 37f03356b3..7fc495db99 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -33,6 +33,7 @@ struct IbexPlicState {
     MemoryRegion mmio;
 
     uint32_t *pending;
+    uint32_t *hidden_pending;
     uint32_t *claimed;
     uint32_t *source;
     uint32_t *priority;
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index db9e0aa25f..341c9db405 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -48,6 +48,7 @@ static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool level)
          * The interrupt has been claimed, but not completed.
          * The pending bit can't be set.
          */
+        s->hidden_pending[pending_num] |= level << (irq % 32);
         return;
     }
 
@@ -176,8 +177,21 @@ static void ibex_plic_write(void *opaque, hwaddr addr,
             s->claim = 0;
         }
         if (s->claimed[value / 32] & 1 << (value % 32)) {
+            int pending_num = value / 32;
+
             /* This value was already claimed, clear it. */
-            s->claimed[value / 32] &= ~(1 << (value % 32));
+            s->claimed[pending_num] &= ~(1 << (value % 32));
+
+            if (s->hidden_pending[pending_num] & (1 << (value % 32))) {
+                /*
+                 * If the bit in hidden_pending is set then that means we
+                 * received an interrupt between claiming and completing
+                 * the interrupt that hasn't since been de-asserted.
+                 * On hardware this would trigger an interrupt, so let's
+                 * trigger one here as well.
+                 */
+                s->pending[pending_num] |= 1 << (value % 32);
+            }
         }
     }
 
@@ -239,6 +253,7 @@ static void ibex_plic_realize(DeviceState *dev, Error **errp)
     int i;
 
     s->pending = g_new0(uint32_t, s->pending_num);
+    s->hidden_pending = g_new0(uint32_t, s->pending_num);
     s->claimed = g_new0(uint32_t, s->pending_num);
     s->source = g_new0(uint32_t, s->source_num);
     s->priority = g_new0(uint32_t, s->priority_num);
-- 
2.29.2


