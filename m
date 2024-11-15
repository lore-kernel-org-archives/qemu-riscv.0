Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30155D6A223
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 01:45:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBlO9-0000SZ-EN; Thu, 14 Nov 2024 20:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tBlO7-0000SA-Of
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 20:44:43 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tBlO6-00068B-7b
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 20:44:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso236227b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 17:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731635080; x=1732239880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48YVVGJ2o29hkZVTXS546oXVnY+Lq85//Fs8NubK6AA=;
 b=WP/qckIxo9VHBT70A4a7RLYN/4nqo+K9n0j5iHJBK+W7qx75ir5X6+CEfsNqmUoakc
 AxppNrZV2SoW9h7jbm4I4F3m09gAJFKz8yHQUfBZFfhY4iuMKJGXfSd0bHmyTZd+xiwX
 b9fA+FXoK9mvSCpQrxt/htrM3bvxDLGi9ZHWaDH3K3xnaSJPQNyC7ekg4vdCeoILmzr1
 VPI27+ATVMllWCj89ptBgK4/ZcAjrDbjp8crVhky44eZJljoslTDlJ5ZNG9OQ0V6EbFd
 M022nTRELCB370fUVHv55SoCAveltQL7Y40vjY88AXIUnfnLqBaJBWtqT8RNLeBJkFjG
 vJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731635080; x=1732239880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48YVVGJ2o29hkZVTXS546oXVnY+Lq85//Fs8NubK6AA=;
 b=izq1cNrVWVsv+msKyRrmOLGaZUgOFlwtsAMJNdYUrbpcq2HAcFS0VpVxdap2C1Nn57
 5UwTPEtrjsd8xiXBI0unPDbBBY/zqpNU4+P+N0cJ+B4XvHzxa3XoegHIIOmhXzABBRRh
 aRIIxovEiGMb6geFTtnMpUZjaLpawmP/+qiPqR/psmCV9YQ8FHlzXP8fpEiSmEhn749D
 3cE3mxPY+sqHyRQ5C67Y9NFYoT4g1+i8W27n+R64/7zL9dvwvwycsB48Zj11RpUW1/Q7
 28QkQLD2YsOyRGVGfXNO4nLlGJdOme8lyG2iD1pqMg4OtSPKQohOVilEBW2IxuLQ1GOJ
 xScg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb1bvqeDG248qQV+asoeQv+CrHdM+tpmg8/kZq2mkQ7H1CyvY6oSbFSzxwlN5LXiG/ayUAQXnW1mFz@nongnu.org
X-Gm-Message-State: AOJu0YwRydUXfJfueRAo1oqLcAlRyi6SDTPRIcnNuSpbhhk4p81G1vRE
 1rA+OImAZfb0eh4xNed1t+ZNQIXRc7gCCEsNlnIKR07g3lrh2vUjrtV0r++ULqA=
X-Google-Smtp-Source: AGHT+IGtdu6IlUhBHmOdFWCB+8flpDD+71jHEur78bzaSZbso540LmuqVxGtTPRtWZpczOCJ6pl9qw==
X-Received: by 2002:a05:6a00:2396:b0:720:aa27:2e45 with SMTP id
 d2e1a72fcca58-72476bb4d28mr1384766b3a.14.1731635080105; 
 Thu, 14 Nov 2024 17:44:40 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72477120bc8sm312514b3a.70.2024.11.14.17.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 17:44:39 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 1/1] hw/net: Support Marvell 88E1111 phy driver
Date: Fri, 15 Nov 2024 09:47:02 +0800
Message-Id: <20241115014702.1663274-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

When the ethernet PHY's compatible string is 'ethernet-phy-id0141.0cc2',
it will be matched with the Marvell driver in Linux instead of the
generic driver. They differ from reading the PHY register17.11 bit which
is for 'Speed and Duplex Resolved' and the value 0 will clear
phydev->link and stop the flow. To avoid getting stuck, change the
constant return value in QEMU for the bit to 1 to keep the driver going.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 hw/net/xilinx_axienet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index faf27947b0..ee4b3afe9c 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -102,7 +102,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
             break;
         case 17:
             /* Marvell PHY on many xilinx boards.  */
-            r = 0x8000; /* 1000Mb  */
+            r = 0x8800; /* 1000Mb  */
             break;
         case 18:
             {
-- 
2.34.1


