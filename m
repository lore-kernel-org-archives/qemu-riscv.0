Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDkhR-0003mB-AD
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 05:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDkhL-0003hD-Ct; Wed, 11 Aug 2021 05:38:55 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDkhJ-0005kJ-0z; Wed, 11 Aug 2021 05:38:54 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id DE08B21C27;
 Wed, 11 Aug 2021 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1628674730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9R7jF56aA28DyxjA5hcGXCN/D27QmrYNNCUyrqBlAg=;
 b=g/kT1PCfqeM6nVXWn/6lzSP3bMcjXT+xgcbfeuna8bYEG8Gf6tiFG7v370ynDual+Vk0I4
 eJbCjtOCVK5pp7RZsfFY73kewCb/zlh1AE7betv7NaBbEyplc0NS3alLSqobW8K6hNQVFq
 aeslmved2TBoUqQ5IUUyr6DLju3OHfg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: damien.hedde@greensocs.com,
	qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>
Subject: [PATCH 2/2] hw/char/ibex_plic: set user-creatable
Date: Wed, 11 Aug 2021 11:38:38 +0200
Message-Id: <20210811093838.18719-3-damien.hedde@greensocs.com>
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

The ibex_plic meets the criteria to be user_creatable: all
parameters are set from properties.
Note that this patch, alone, does not allow to create an instance
with -device cli option or device_add qmp command. Since it is
a sysbus device, additional authorization must be done by the
machine.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/intc/ibex_plic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index edf76e4f61..8abd5ee613 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -291,6 +291,7 @@ static void ibex_plic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     dc->reset = ibex_plic_reset;
     device_class_set_props(dc, ibex_plic_properties);
     dc->realize = ibex_plic_realize;
-- 
2.32.0


