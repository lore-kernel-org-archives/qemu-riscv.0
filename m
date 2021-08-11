Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDkhO-0003iG-FE
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 05:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDkhL-0003hE-DJ; Wed, 11 Aug 2021 05:38:55 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDkhI-0005jL-VW; Wed, 11 Aug 2021 05:38:54 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4257820777;
 Wed, 11 Aug 2021 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1628674728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D4zb2SZOxmLMnMu7AmwkeIsHGrNGKpd/txgGlzDcaVE=;
 b=N1kYEi+f1VxmK56wryRkfJTi1m5Y/7tu4IEk3xd9PEjrkTdlcpT9hZxMATSr2ITgl2YJLn
 khUtjYRPayEHpFgVoVzNFDmIyGORLXqafHnomVS11ichkSlK/EPOVJJH48Cen4k4U/I0+c
 ABiBej9/7i9RjxnoB9zRF+BPZ6gmKpk=
From: Damien Hedde <damien.hedde@greensocs.com>
To: damien.hedde@greensocs.com,
	qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>
Subject: [PATCH 0/2] Set user creatable for flag ibex uart and plic
Date: Wed, 11 Aug 2021 11:38:36 +0200
Message-Id: <20210811093838.18719-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.32.0
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

Hi,

This small series only consist in setting the user_creatable flag
of ibex_uart and ibex_plic devices. These two devices are already
using properties to configure themselves so nothing else is required.

Note that this change alone will not allow creation of these devices
using -device cli option or device_add qmp command as they are sysbus
devices.

We do that because we are currently working on adding the possibily
to configure/build a machine from qmp commands (see this rfc:
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html). 
We are using these simple devices in order to test our additions.

We prefer to send these 2 patches on a separate series as they are not
really related to the main topic. We will send a following series
for the additions.

Thanks,
Damien

Damien Hedde (2):
  hw/char/ibex_uart: set user-creatable
  hw/char/ibex_plic: set user-creatable

 hw/char/ibex_uart.c | 1 +
 hw/intc/ibex_plic.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.32.0


