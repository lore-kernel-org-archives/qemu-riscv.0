Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEO-0000KN-3Z
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEM-0000D1-7u
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEK-0006Aa-Mu
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
 b=D9NedgT3VSrkPQwTYTtIsGlErAZpthfrfifzJp3kpuJrr0ySU0PVYl8CtU7iG+e2bjRhmQ
 PuhRWAIlLIWwGQEVgfVHas73SrpjqLQ0vc0ky4WdLNVQcnySd7EvsfYBVZQu0yqhgnxMeU
 oDmGrl8XoaAMJVpR9Dgddw/RfcFK184=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-aPBWIugJPVaiwkFM-f7beA-1; Sat, 15 May 2021 13:37:34 -0400
X-MC-Unique: aPBWIugJPVaiwkFM-f7beA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso1651526wml.6
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
 b=RzXJ17lCrcnB/AclP2ljax6/LMuHzsmsJSSMlnFjnRieQoWjB1GHyhHODTRRFZl5Y1
 UJU8VTspPRXT9oLNoiTm473hidmQiaSprO2FMyDvM3xmnIwat/uhpRO7l1CWN8u/TTcF
 3M7dM/Euc1bJLms5Bpdoi4BnEY5JIx7IwDxnU0cG78HvBZnLOTSXa4cT43F+OnSMBIV1
 yTN9IPTSXxIMdJY/sQrD6j+PudqTgqh+wwvZ12DpipDZFRAiXpOi99mBnHq2GqFQTg8O
 nAitszk7hp9Ye5JiqXDjigafal1smQxZX2CtsgKM2Qko3Ru9FvcVRscIY1flyCfSVLbt
 NjtA==
X-Gm-Message-State: AOAM5328bbHZ7ATqQqspTgj5TLI/UijFdH/xom/+f3We1LYEE5ucwKF8
 z58hX6hXBMrTCGZ6LU3QD+/6IbH40wdIUZ+1z6sf73snqfojH2XPbCLsxdx5NbxAEyok5kWkWqH
 ofvl3OHru7EGOOq8=
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3743200wme.19.1621100253362; 
 Sat, 15 May 2021 10:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY81/AM1k54bDXruKvRIomEErOv9vjg+vI2AQgtq4Ayz/+9KFltkQvriNz3cEMu45Ca/C/7Q==
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3743192wme.19.1621100253232; 
 Sat, 15 May 2021 10:37:33 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b68sm2216685wmb.11.2021.05.15.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Bin Meng <bmeng.cn@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/12] hw/arm/Kconfig: Add missing dependency NPCM7XX ->
 SMBUS
Date: Sat, 15 May 2021 19:37:07 +0200
Message-Id: <20210515173716.358295-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 17:37:38 -0000

The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
this isn't advertised with proper Kconfig symbol, leading
to an early build failure when building NPCM7XX machines
standalone:

  The following clauses were found for AT24C

      config AT24C depends on I2C
      select AT24C if NPCM7XX

Fix by adding SMBUS to NPCM7XX.

Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a..85c6a1a088c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select SMBUS
     select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
-- 
2.26.3


