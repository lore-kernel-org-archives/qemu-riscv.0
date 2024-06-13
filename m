Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57578C27C6E
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 01:31:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHZI2-0001xB-01; Wed, 12 Jun 2024 21:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHx-0001vm-Av
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 21:30:05 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHv-0008Dr-L4
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 21:30:05 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-681ad081695so349887a12.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jun 2024 18:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718242202; x=1718847002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMVIvPPDyIsXb0IIrUQL6wLJN2o+AMmh9m6vpVCxHFY=;
 b=Rov1rsbJdg0OSKfC8G/xvxY1dLR7g3pddeG/OKTLoeZrOGHC28wxYRCBaTzLtJZqXi
 zKS2DILs3rAfBU74LnYz75RKTMTgG3TcWqf64kMmmdoAy38brmrk89m2cOduLeGoPHma
 D4dCRRJUjYsnqAn6X/bxzpWEFg/BCSqET8qpwOfy93m3H0KIKa51lhXtCo0w0xqHFqXB
 u/SzIYajWA0M3sz+6wAzdsVH3tgO8qN5bLJz3zX1FP3XNO0Yk2AgvRPmSAObRM7VDTIo
 C0tDblw1BKho738oZePPEgLmLno5otUqbYYAo5k4Q6fc5Z7h2XHSKX1Ge9e/0O14rFq3
 3OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718242202; x=1718847002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMVIvPPDyIsXb0IIrUQL6wLJN2o+AMmh9m6vpVCxHFY=;
 b=MIxtr4jy7XjGbgd2m4r9MveDbl4xXvqCHizvABupvTRhSiXjPZDNjqw/l13NBgdhR/
 30lBVDUbaiWsCiyOfg3GqkCarBJ5lnKQUxL9aozz+DC7ezIMNft6Lm/1amZ9l2iuaMV0
 Kta6qZ4QjSSPSwWIpAF7IE5afIhzYd6KFIMdkiYY3H4XMn/iv4gCcHOjn9gCRzo6RQl+
 9Rk6njUxwx9ppgJBuB0L3PYRfPjQg1M6HBGh7QZmJqC0mBn4Ve6i2qgNn++Bcblamzca
 +vUvXa/ZlUrjeoqMGxOn85oPZywikVtQhEAr4hDjvin6xT/CauNh7w3SMqyh4LHvIXyS
 KZKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLq8R+nZhczz+plXGiQe6qWZZsVVKU6aBaVRIvXDqdA8cljEpULHF7/hXachqBdMQQqqP2pEWinEgXyVUbBfJGEVt5mvM=
X-Gm-Message-State: AOJu0Yy742x4atxZBkyIn/tLCmM2IYH4BalUtS5jNVQfWBL4wN2VRs5t
 eF9dKI5IqU4rm8YldV+nbwE/5oo5XEAoTRVxuijvpz/5vdJfP8F9Aggj+Pgymhg=
X-Google-Smtp-Source: AGHT+IEIm5KyI5vCn8sVO7D3GSrJORUnbs5AB/aRH/spttJR0DR4FaKE7mCo7Zlx8rJV0IGbVA2H6g==
X-Received: by 2002:a05:6a20:43a3:b0:1af:939b:d477 with SMTP id
 adf61e73a8af0-1b8a9b8dfbamr4030446637.36.1718242202296; 
 Wed, 12 Jun 2024 18:30:02 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e723fasm1264155ad.97.2024.06.12.18.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 18:30:02 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 3/3] hw/net: Fix the transmission return size
Date: Thu, 13 Jun 2024 09:35:01 +0800
Message-Id: <20240613013501.426905-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613013501.426905-1-fea.wang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix the transmission return size because not all bytes could be
transmitted successfully. So, return a successful length instead of a
constant value.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/net/xilinx_axienet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 7d1fd37b4a..05d41bd548 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -847,7 +847,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
     axienet_eth_rx_notify(s);
 
     enet_update_irq(s);
-    return size;
+    return s->rxpos;
 }
 
 static size_t
-- 
2.34.1


