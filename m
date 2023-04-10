Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plqto-00064c-U9
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 08:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1plqtm-00063s-7P; Mon, 10 Apr 2023 08:45:30 -0400
Received: from forward200b.mail.yandex.net ([178.154.239.157])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1plqtj-0004EY-DJ; Mon, 10 Apr 2023 08:45:29 -0400
Received: from mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:2e14:0:640:2cd1:0])
 by forward200b.mail.yandex.net (Yandex) with ESMTP id 594B3600E9;
 Mon, 10 Apr 2023 15:45:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id GjTsr15WxCg0-Fl0umwGp; 
 Mon, 10 Apr 2023 15:45:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1681130718; bh=QH2N4eeyInqkY06AIpAaUM0Mz1Y9FcENyUlKryXQsrY=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=e5+2JzTG8JdCh+Axa4QW6icM1VfLyhNPWUO4Wf2AOmTGaUZzAK02anjPKYeAU+GYA
 Ies8GD4WqU2pPtoTNlppWrJDOGZ0Uoarq+l8v9h0q8gELHRRU6OmqANLNB8ADH63QJ
 i1hc+wzRvLvZlKF6VRZ6aWkZcJjBip3BTdoOGw2M=
Authentication-Results: mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v3 0/2] Support for print to log vector extension registers
Date: Mon, 10 Apr 2023 15:44:49 +0300
Message-Id: <20230410124451.15929-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.157;
 envelope-from=ivan.klokov@syntacore.com; helo=forward200b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 10 Apr 2023 12:45:31 -0000

The patch added an ability to include VPU registers in the 'cpu' logging.
---
v3:
   - split of the patch into two parts: general and RISC-V specific
---

Ivan Klokov (2):
  util/log: Add vector registers to log
  target/riscv: Add RVV registers to log

 accel/tcg/cpu-exec.c  |  3 +++
 include/hw/core/cpu.h |  2 ++
 include/qemu/log.h    |  1 +
 target/riscv/cpu.c    | 56 ++++++++++++++++++++++++++++++++++++++++++-
 util/log.c            |  2 ++
 5 files changed, 63 insertions(+), 1 deletion(-)

-- 
2.34.1


