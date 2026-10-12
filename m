Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02798CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGIBi-0006QT-OD; Mon, 12 Oct 2026 11:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGIBf-0006PD-4g
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:43:39 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGIBd-0004TJ-Gh
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:43:38 -0400
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so12730235e9.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819816; x=1792424616;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SvxLkYLFxBz+kmta5sRtklppBkoMZNtdkurTxLQZymc=;
 b=IC8neU0PQE1x4rbRIfJ/j94Dzy+Hf1CbrZQMR1hlF6VT29/lMqQ7iCkjRInQqrOQ2p
 n6beCayF8OgPkKonwg1rD4or7tfwPB7Zc9CRVqOoYVlkvCwpQ5yp+GuUoWBpWeO2zmBR
 0XJK4+FinrPCyBixNvk/zwfHWUYRu6aTLouSx/NWW68AChOaMkaP8QmhZgck06RUC9BU
 TUZr8F+O5KwOq/lFXMoBt64msF+eFSXSvIkUPW+fej4IH2OQFJ/8+s0JH+OVCvlqYUNA
 PkeldBAm79N27GfzKh+uuWR8F8ci+SudhDQxIa75qLjT5ZfGc3KozZzpuCcq9HnIuaBA
 JZbg==
X-Forwarded-Encrypted: i=1;
 AKwUvByKZsVc4AAmINVepIWdG+WF6ImL+DYoxLiuLzvAFdllrmQMJ3XYuJ+w1sIv6lXnj4521fTLqq21pnjA@nongnu.org
X-Gm-Message-State: AFq9FYIFztMeX7uy3SlaTgVc0Orb1poQwFOcMm978YpWK1Dxz+g79ccg
 6akShR8M/xodrj9bJD3w11eeJQfNOlHlkECafZOBUdtYOCMSwdndO51D
X-Gm-Gg: AYBFou18g3UQ29BgVKEAnFS2fwjnBLcZ5AlzGnbNIq0cecIGXoRlgvc43aMkUaCw+qN
 v4GgcW2RHeGWS+V2hO2gwjWCeUWAvA/Q3jUJjQyE6jZkihPdAorp3uTR3QzwUA4+8hHQifI3H7U
 /oXKUpH1YJNPYfbyYviUDatICZ97zWTZs4nSnhfG+DbMQsfueW8E8kSkAwePLzZZ4OMrepruGrj
 DZ2n5D1BhdwXlKLAsCxilONaJUMRP9E+BDWBBXaWo5InuSzWtdWfAoebhZSVlYRjz46agr6wD76
 TBqJGQlBnYHjkJkDDRQWalZ4R/4vez+9CijgY3qhEPlap8m8bw0cz7M58+/ij2R7fHU/bZoIjQd
 Y2CBcMWWLBK5IGeSM7A3iccHqj/9PGBVL9oQRJUd5fVheV81kp76t7VavcUTfmdy06QX9g16qIR
 OBISy2Hu75rqr2zYX+WKqIsMCvA5Qtj20VZbH+fkm+C0n6cvNs0hR/f7Z15j3+xAv4F2BlvbACM
 70Xk5x1NdBwjT1O87OSTzIpmReUqEm9wM7ClbQwEvzwSA==
X-Received: by 2002:a05:600c:46cf:b0:49e:8191:e5cb with SMTP id
 5b1f17b1804b1-4a18e4a3ac7mr203566265e9.5.1791819815754; 
 Mon, 12 Oct 2026 08:43:35 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2343asm549923185e9.9.2026.10.12.08.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:43:35 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:43 +0200
Subject: [PATCH v2 50/50] tests/functional/arm: minerva: add BMC boot test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-50-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815522; l=2482;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=zMnHp1SdNieEAjweeitFky57rPPnAgy18OpmLaUpJ1g=;
 b=nyi8/XBH9UGmX2jVpKGkPotKXBP+6qgCH8/kFF3zlDpCxKWzlCrCE5166Mwx1mGaS3fPQdgBt
 lC3vUfcIfIODPHsZmTDAwhyk09JVuJuoJKLKsYYO+a267DsTK/gtylH
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f52.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


