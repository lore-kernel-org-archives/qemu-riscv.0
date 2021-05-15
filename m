Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEj-0000qv-59
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEa-0000lV-Nm
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEW-0006Ho-JI
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
 b=E5YAm38QHzAgmKd27PBH7F+wicQRUEA5xQ4VgYljkCz7wQtZ7ZdI6PqA6Mf80sap0aixPc
 saGUn5GJTcHIIPDS2X79iJ1WQqOYwL8bVlPQiaCiwexdN/aRXiv+NdUzoYCxWAWmsg51ua
 EpyKzDsHoWFV8ChduiuBR/SqwRbaAUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564--ZHpDCuTP9-Zgn6f-8TBiA-1; Sat, 15 May 2021 13:37:44 -0400
X-MC-Unique: -ZHpDCuTP9-Zgn6f-8TBiA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1648596wmn.9
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
 b=F0EdA5pBzffMHRs9yLJCkLNBmimZSdREBdMeI5+3y9b8XpD3HVRXBJqf4QoMJCP3op
 BudV/5LshsJe73N4hTaQPsBrVlSI1sELhH6F9f6zcOh6s+QCXb12aEuhdmZSAfepFkEJ
 VE1f2ykg+it9riyioZWvQIqmj1QTxyGuq80fvjN4R2BXEAyG/novOlyAYvKx2yG95yaE
 k9w02YeJ+BUvxOWECjs3Fr94KrZ57yQF3TEii1NRhYsSHR1lIqjsA2mmXfv6PZflaTvh
 3ELfKLAKpYEkkAvlm/WEd2q5xU/90C8eknF/R7mBHjPrZgwTit4ERiOo7PDxlupbU0YK
 wVvA==
X-Gm-Message-State: AOAM531Pen+Wg5v7pLBJOEZojUw/y3GiuhcqvqFloE+QRInjIwAvodfF
 VJQqGsIGic4chYSDcxGmRNU2oYAhL01YjiZUZ3iB4Uebv1laUdcVLCcudYuNCS4qK082Ey5RGLI
 aBgfBXP1FHMxfa/0=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr17484721wmj.77.1621100262893; 
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGVOh7pkMkDvwyl4op4hAAMWNNYbI6Usln0UJOegBSdd5y4Gs1f92XifVNt+WjkNOmwRwmog==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr17484711wmj.77.1621100262785; 
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 61sm11021853wrm.52.2021.05.15.10.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/12] hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
Date: Sat, 15 May 2021 19:37:09 +0200
Message-Id: <20210515173716.358295-6-philmd@redhat.com>
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
X-List-Received-Date: Sat, 15 May 2021 17:37:53 -0000

Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
added a dependency on the TYPE_IMX_USDHC model, but forgot to add
the Kconfig selector. Fix that to solve when built stand-alone:

  $ qemu-system-arm -M imx25-pdk
  qemu-system-arm: missing object type 'imx-usdhc'
  Aborted (core dumped)

Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5827c092b28..6bb34926bb5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,6 +386,7 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
+    select SDHCI
 
 config FSL_IMX31
     bool
-- 
2.26.3


