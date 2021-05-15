Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEV-0000ed-83
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyES-0000Zg-5l
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEP-0006E0-FM
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
 b=YnyndHzT1F+5eL+YVZjVpRNRP/RBsz4Ad2K1OwanOX4SDX9fR5wfzqagTG/XtXr8pHEjf+
 PTG1LOqfWZs/CTw3luCSjDhQGB9iDgGlZEn8bp9+LMAsihnEMLhD1DdWT1Jzjj0wy+xkwl
 P/huCsEFrY2vSaB/7KDTMWyU72FFjc4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-Z2L_aXr8MqevJ8cJQ4EgXA-1; Sat, 15 May 2021 13:37:39 -0400
X-MC-Unique: Z2L_aXr8MqevJ8cJQ4EgXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so440536wmc.7
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
 b=GM4/SwibDiIavTH1FdNwGy/I+eKNMPWM8zQFHvASyx7VTUm+bxchko0ddoA430+FoS
 ZTsdCF3qJtxgaZwtGwOGMjqlron1cSrZW62Hb/Hf+WVpBMNnDGqA03Hgn093Wv9qAyaK
 l+gyR8c8hm3d7wR9Dod+HwW34gsJPcXAgP3Ep9bHa9/cU+dGoa91kgJt5VkdQEK/t99U
 HvTXgMxRv1SNAfOimIXJvD7wDzdBfTU6pGSg2w//2DCVdoou8vaRooJyncxGuuED2TBf
 LB6hE1t/tsfXy6gbGR26gWUJ1W0+B5DltQ3ag8QPKLGu2kAywuwJ7af0MvBpr0EtSRo7
 0nhg==
X-Gm-Message-State: AOAM531sR+Y9bJFFGUX+N/zgj3jC8vpkMx3ev1zJV6h/a+ghWLibho+i
 NXNHFw3kuLIck6NSoY1cUq99RtK70iTCUxWzRV69h1YbzCbQPpdw0Tlxj5fiUsCIUiTcQiYlVlP
 qUhxhcEooXiSwG50=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3770242wme.39.1621100258032; 
 Sat, 15 May 2021 10:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyBs6Pteko4o0DW+BGZzQDrEJAvsFdZpZXCrww7Nd91irtzV2sFZ5IkQXQu4bTw46PafCWbw==
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3770224wme.39.1621100257888; 
 Sat, 15 May 2021 10:37:37 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x11sm10019081wrl.13.2021.05.15.10.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 04/12] hw/arm/Kconfig: Remove unused DS1338 symbol from
 i.MX25 PDK Board
Date: Sat, 15 May 2021 19:37:08 +0200
Message-Id: <20210515173716.358295-5-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 17:37:44 -0000

In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
the test") we removed the DS1338 device from the i.MX25 machine
but forgot to remove it in the machine Kconfig definitions, do
it now.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 85c6a1a088c..5827c092b28 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,7 +386,6 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
-    select DS1338
 
 config FSL_IMX31
     bool
-- 
2.26.3


