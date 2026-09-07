Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E7FC79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctq-0001y8-8r; Mon, 07 Sep 2026 13:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cZp-00054F-TJ
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:52:17 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cZn-0004zr-Nv
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:52:13 -0400
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-482dd6ee390so4316072f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799930; x=1789404730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SvxLkYLFxBz+kmta5sRtklppBkoMZNtdkurTxLQZymc=;
 b=UTNiOAZYoPzKdCC4FmQDlkLqJ7+dZZh2Fzt3MAcKxeHsW3y+Yw7ken1DStf/vEOA06
 52/8fPXA43DOIk4tWnTeLudQtvq62newIaRgbQ8ll+skJc4FejWHdV1GEJC/Y5eRQo6D
 Jb2TYnEYY0UCrqP8hYcKiPgWgiBKy9ksT9Z+ezlMpMNdJ8JKPjbiItLa1gR9tOxaD/u2
 cDCkpnCs//s3Q2k1892OkR9xaM/+fASj0PmJBLReflaQCRkDuzKEAOOQhB+6TUNMej5h
 a3yJXZO2+NVTipX17Zrw6IvaGbUd8+WTkpphFnsj5DPOWYOrIhzU+w56s5XU1HZSChMR
 LGnQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7kvKR+OiwkQnc8UFL6r06Up47l3xnHiVIJq0Rxd4icPahbn0phsqjf9Fm8pPdPvBtlD/NMH7/sGWH@nongnu.org
X-Gm-Message-State: AFuF++l5jHfv4y40SPgpC5yFClCkfAs18dKskxb1Zd6tsV+OjORwo5W4
 N2dYLvcLdMvD1sRgH/LNSF9QNk4X4AtfIFcyzzkMBM0dyqrenp8HzZ8cr6EcIqku
X-Gm-Gg: AYBFou2T0GVYZZvN0AYedfnH5Qh2yVtqPRB5rHpowO5CxQlx+ga3cIyZWR061uyVMkZ
 h8okSfZB45/U2Y+PXrMbjkWFy/qyCm0Vdq3gCGmepKo9tYcKNxhayoz7cdnQEApD613P3aBxOkX
 ccD8VkjTcLe119n8+xefFO9eXVQKBTgSUTlpfNmoS2XoZ5RyKOv5uGSRoipYme68riabGbZnPpZ
 Z0Bxo/ZNKNbE1uMpws3OdoraW4YhF4+9QF9xwmRi/Ddtat4G+ByM7qMCH6vpDSm9SBYCT0M0K1k
 3GMd1WIXHehoQe+gt2MwZIMdmj+TgCPVvPC7HkGOvr/eU9px+DxAxbpFlaUWHCrVk3tKHFi5v/0
 0DrediLb5ti4pEoJk5hphYJ/FU472vDRfrBINxHVEPHD9yRE/BrlY+zQVmSzaRGFu4er/J1GqL9
 0DJWBhrayVmkxq3TzA041XUiF5pnt2XsAavxGtomVHMlAPHkPo8xmEPZyzbh3SSypMl6S4zc6Rk
 kJKZNuXg9e7Xw2LUV5rxvyN8Fiz0n7wSK8=
X-Received: by 2002:a05:600c:c173:b0:49c:cedc:3c36 with SMTP id
 5b1f17b1804b1-49cf82a514cmr244391835e9.16.1788799930026; 
 Mon, 07 Sep 2026 09:52:10 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf772692dsm383936695e9.10.2026.09.07.09.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:52:09 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:40 +0200
Subject: [PATCH 50/50] tests/functional/arm: minerva: add BMC boot test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-50-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799323; l=2482;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=zMnHp1SdNieEAjweeitFky57rPPnAgy18OpmLaUpJ1g=;
 b=V1QzQMxFouIxH4+6g0pVsz7I5wTEN7pR2ggQuv3Iq8sMs0tlCTfPc+Z4JyM62A5ZZPXCfz4/Y
 BQs9aZ1zMwsC5KjI+t1YSLVMlBc+KUKDXGAHdGYkT58OSPpETyxitFy
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f47.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Sep 2026 13:12:51 -0400
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add a functional test booting the Facebook Minerva BMC machine.

Note: The boot image currently lives on a personal fork; a TODO in the
test notes it should be relocated under legoater/qemu-aspeed-boot before
upstreaming.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/arm/meson.build            |  2 ++
 tests/functional/arm/test_aspeed_minerva.py | 30 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 61b00932db..dd1ddf7f6f 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -16,6 +16,7 @@ test_arm_timeouts = {
   'aspeed_bletchley' : 480,
   'aspeed_catalina' : 480,
   'aspeed_gb200nvl_bmc' : 480,
+  'aspeed_minerva' : 480,
   'aspeed_rainier' : 480,
   'bpim2u' : 500,
   'collie' : 180,
@@ -51,6 +52,7 @@ tests_arm_system_thorough = [
   'aspeed_bletchley',
   'aspeed_catalina',
   'aspeed_gb200nvl_bmc',
+  'aspeed_minerva',
   'aspeed_rainier',
   'bpim2u',
   'canona1100',
diff --git a/tests/functional/arm/test_aspeed_minerva.py b/tests/functional/arm/test_aspeed_minerva.py
new file mode 100644
index 0000000000..925a82b139
--- /dev/null
+++ b/tests/functional/arm/test_aspeed_minerva.py
@@ -0,0 +1,30 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+
+class MinervaMachine(AspeedTest):
+
+    # TODO: the boot image currently lives on a personal fork; move it under
+    # legoater/qemu-aspeed-boot before upstreaming.
+    ASSET_MINERVA_FLASH = Asset(
+        'https://github.com/eblot/qemu-aspeed-boot/raw/refs/heads/minerva-bmc/images/minerva-bmc/openbmc-20260720025047/'
+            'obmc-phosphor-image-minerva-20260720025047.static.mtd.xz',
+        'bd713df39d3c09846299a2377315465187a4dcd33c29d3b3d683ef13b59f36bb')
+
+    def test_arm_ast2600_minerva_openbmc(self):
+        image_path = self.uncompress(self.ASSET_MINERVA_FLASH)
+
+        self.do_test_arm_aspeed_openbmc('minerva-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0xf00',
+                                        soc='AST2600 rev A3')
+
+if __name__ == '__main__':
+    AspeedTest.main()

-- 
2.50.1


