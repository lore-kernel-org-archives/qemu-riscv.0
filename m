Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmx6A-0000P0-R3
	for mharc-qemu-riscv@gnu.org; Thu, 13 Apr 2023 09:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pmx69-0000OP-4p; Thu, 13 Apr 2023 09:34:49 -0400
Received: from forward103a.mail.yandex.net ([178.154.239.86])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1pmx66-0007E1-9r; Thu, 13 Apr 2023 09:34:48 -0400
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0f:26a7:0:640:a2d5:0])
 by forward103a.mail.yandex.net (Yandex) with ESMTP id 18CDE46D2E;
 Thu, 13 Apr 2023 16:34:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id aYXaEQ3DaqM0-s7DP2ZSK; 
 Thu, 13 Apr 2023 16:34:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1681392877; bh=fddc4In/XQfRFQB17O0ghe7YSnR/26YAmE4GlNFqlHU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=xK8k1mbJETLJ+2t/8vRzDr8pIzqGdzl7h9WEEkbGEWOVVzzd+CjfRFDdZltsbTpdm
 yF++jo+6vmfMMsRVNqozr+9e+h8sKoXWxZyWq8fc/+1+9qUl1DgL9g96iejZ02u1lD
 Mnb0R9+N2LTYKrq7/9ikVFgcLfpyrsA8GnbAGD68=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, anup@brainfault.org,
 anup.patel@wdc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH] hw/intc/riscv_aplic: Zero init APLIC internal state
Date: Thu, 13 Apr 2023 16:34:32 +0300
Message-Id: <20230413133432.53771-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.86;
 envelope-from=ivan.klokov@syntacore.com; helo=forward103a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Apr 2023 13:34:49 -0000

Since g_new is used to initialize the RISCVAPLICState->state structure,
in some case we get behavior that is not as expected. This patch
changes this to g_new0, which allows to initialize the APLIC in the correct state.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 hw/intc/riscv_aplic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index cfd007e629..71591d44bf 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -803,7 +803,7 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
 
     aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
     aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
-    aplic->state = g_new(uint32_t, aplic->num_irqs);
+    aplic->state = g_new0(uint32_t, aplic->num_irqs);
     aplic->target = g_new0(uint32_t, aplic->num_irqs);
     if (!aplic->msimode) {
         for (i = 0; i < aplic->num_irqs; i++) {
-- 
2.34.1


