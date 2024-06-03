Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2045CC25B76
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 05:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0YM-0000CO-1D; Mon, 03 Jun 2024 01:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0YK-0000B0-5P
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:48:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sE0YI-0005O1-Hp
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 01:48:15 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f44b594deeso28857305ad.2
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 22:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717393693; x=1717998493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVZpJhKtEcd9YCJGkGQF9gaW6VhHFLErv6FyXahbmsc=;
 b=DtdQalAwp3XkTppTR1nIifPAc7lC7PDZiJeVE07pXmA+CGa0cMTIvfBQbgA9XXZu9C
 GqHXtXB8JgU5ShZLZCdVIRb2HdxdQb5VzZ9u/0VK1XK6BNgjqEVIhfSLfkXZq47lLBwM
 z63zjrwJ/dkr8yWEwKEcN9IPa6Lb2PPaer6zHcq1/axOHlDqy+HYd+WZN86qd8PFoM6y
 lUCv1bC8wkAmYIzQGzoppTbN1Ao7wIuLc2qqdz7Pjvb8srdCSdPyIqn1up3wC0KrgVia
 p8pyhokf9JyuMZEz+VjExw1KGDYb16TstlsQI+omQpIWTTDg9LSudc4UxUaRPBqAlHrJ
 E6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717393693; x=1717998493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVZpJhKtEcd9YCJGkGQF9gaW6VhHFLErv6FyXahbmsc=;
 b=D9ZfLgOKLMxPMZKR0QIWLpS6tsMJR1Wll5i24TBzQUG3+XQvCVh2aIu52GtY0fRma6
 +YIPlaRm69XBl87JFat6v/tcRa92ICGNbQS9a2QiZIxvnWXAT3E+NmbXUwD1xRPCT0mN
 yO9IgJX+WXkADoCyD5844DImFILcF1CjCOUmxWH+poTl0ITRiVztJ7pDWOkvUNa1o0yd
 9U1K7t70TG0XxK7BWaHVQ4ksKervhljdgBZNzK/Xb29XKz/X0O2NG7Gk7r5zQV0ftnC9
 JaZ0o3hr1oNlCmw0p5E+wweWXXott8cEw/mMJeR/MbDiCE75gu7WCM1r6WJenh/eu/TQ
 eVmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9gJtJs6qggRrcl2cFmhS9hyIuWseOGsudX1UX8so8ShJ7mrguzK53bmY7Z9UOwbmblNUgycD9aSnysNzKq8t+lQVZbM8=
X-Gm-Message-State: AOJu0YwsC2Hn+/0Pfo3ay9DoY+fyUZw2HNsQC+fT4XMsxkyqNra7UITv
 BXspDjDh9kCrANl5ZRY5bsYoLUG5S0KYXA/CzchEdFqkraDwEn/BBdxUmB+CPJA=
X-Google-Smtp-Source: AGHT+IF/NhAHUv5NOzJAxHVrM0NCdw27QFO4bXQgcjKCUBHyY61JMxxZUcQGLtEgnjIVyb5Iua3rDg==
X-Received: by 2002:a17:902:f908:b0:1f4:8faa:cd68 with SMTP id
 d9443c01a7336-1f63702346cmr69194085ad.29.1717393693229; 
 Sun, 02 Jun 2024 22:48:13 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63241e085sm55824135ad.299.2024.06.02.22.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 22:48:12 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 4/4] hw/net: Fix the transmission return size
Date: Mon,  3 Jun 2024 13:52:48 +0800
Message-Id: <20240603055248.3928469-5-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603055248.3928469-1-fea.wang@sifive.com>
References: <20240603055248.3928469-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x631.google.com
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


