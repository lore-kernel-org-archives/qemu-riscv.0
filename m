Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDkhP-0003jb-O3
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 05:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDkhM-0003hS-2q; Wed, 11 Aug 2021 05:38:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDkhJ-0005jz-1U; Wed, 11 Aug 2021 05:38:55 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id F1B0420780;
 Wed, 11 Aug 2021 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1628674729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tguyCt+BzDdHqIZ4CE6207mB0+/25QkElhg+9VKaH64=;
 b=O0KI2XarJa58qWIY/qF7JIzTdd5qyfRoOAjzvhAi21lmuDWC2HkbLcULbyzINrFYLMfBuN
 Z9i/12NbnC5O3PBdxcTdZvhCG8r18E8YpfpxGr/w8ghpZ8QxVjvbpGxflQbT+vTqXpCsJ+
 et2C+OlMkleMNnrdFxkF6l2Fie6E+Ek=
From: Damien Hedde <damien.hedde@greensocs.com>
To: damien.hedde@greensocs.com,
	qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>
Subject: [PATCH 1/2] hw/char/ibex_uart: set user-creatable
Date: Wed, 11 Aug 2021 11:38:37 +0200
Message-Id: <20210811093838.18719-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811093838.18719-1-damien.hedde@greensocs.com>
References: <20210811093838.18719-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 11 Aug 2021 09:38:57 -0000

The ibex_uart meets the criteria to be user_creatable: all
parameters are set from properties.
Note that this patch, alone, does not allow to create an instance
with -device cli option or device_add qmp command. Since it is
a sysbus device, additional authorization must be done by the
machine.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/char/ibex_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 9b0a817713..b1646422c0 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -546,6 +546,7 @@ static void ibex_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     dc->reset = ibex_uart_reset;
     dc->realize = ibex_uart_realize;
     dc->vmsd = &vmstate_ibex_uart;
-- 
2.32.0


