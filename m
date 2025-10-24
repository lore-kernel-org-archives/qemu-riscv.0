Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9FCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:26:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNQM-0005B0-V7; Fri, 24 Oct 2025 15:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNQM-0005AX-2q
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:26:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNQI-0000fk-5Q
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:26:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so22778075e9.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333960; x=1761938760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwqgehZVsbFB79GaS98pbRrXCd0QXF8i259SKWhblxM=;
 b=XYRepmdlGkijcOWBIfqpPxWxLb12s/vIWQPLqKDdKaqe2ZjZa2L6yuAutIpItVwap4
 1iuCRgAjSwrSoguNJVwUi7CbovCLZJmKPMKFb6XeHtfVf/eFw0BE94eLsFQqNWxGP+k3
 hdYFTcrrlNzoaJVJO9SsCNi1gl0Lvd/RbxVMUuTjhNAihIhewRVfN+CNytnHwWM3oVQV
 9O46uP2BX7FEJiOy0Jd4Jt7Wjy6bnRLpBCagxS34LHH3ZxFqzr2pQpvqLQMOa6dlI6PA
 B9XMW+9EProQ0IXJBdyP7H5f6zSpXbpAyv9OIzM5s1zgHY0A2aJTfW2uYLQndsELIxTb
 qEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333960; x=1761938760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwqgehZVsbFB79GaS98pbRrXCd0QXF8i259SKWhblxM=;
 b=GBaxm7a2xdvgjiz893wJ4bYI8iK85EVcllsFrzLaXkRxWn6qxvvSSQT+hApQCP+lJ0
 zM+2nP7PEZJYbscNUmtBvCzN09au9jCaxymcqviQWoHAN7UC/uIFOdNK9V88fgJq9/kg
 V00Uu0qpJeE2FPOoWgt2a1Rc4qctqd200CGNoZQxHg9Fp1fEuPe5fUsaxsEsolhxl0un
 I4AUtdzzSIhOhi2MBGwgMKgKtLcGY9mp2pXLyXC1l7mzKPN9WY+hr2OE3n5sZ0HdVOdr
 ZgFo01RR8ikVi8jo8oHWLrg1XD0zJA+nlxNEEfQWNK5a08mal6oDgzQFZze3R8Ms8a/C
 uhtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo+vUCK83mIrExF4f3xyY7+NCBDRswjOm7AE4VBrImcXOCM8GbP70hJ9d4O+qH1q14EJroioWdn+lW@nongnu.org
X-Gm-Message-State: AOJu0YwFE8YdoGn5ZdVhB4wK/oD/hluCXPfjNrjGALxB52iIv2eEzag1
 Kmgq1v+WPXhRgs6oMwoyK588UgjX+q9vKYD1/pVR05PC662mXSXmDN2XMS6wxCMs2ks=
X-Gm-Gg: ASbGncu6iVDjl8kIVmIcmkffa/oiIjNOkxb2fBSPj4Jk5uwOgemhENiwoG60Wa01PSm
 Zpu1ZxV0PmVmklcNe091QkEHvfzDjcAlburHNKl62ZKeaguu8SnW4C4Bq9kugQz3Jc0AgwUG2MC
 vjuPgEsdkoFwikqwdyGVV+WM959uiQLKtSX1l8K0KyW3pqgIbhWf9/sVR46QIV3BSv1uW4E2s0P
 x5z3lukhtf+T/NeMYcsbXJwjFRnz0DNQltPVyc0lDVXpLpK4i9mH8Oq7gZY/zuIgZsw9uQZJMxk
 q7DOUtDdObdLNIHy4yprj5GdaeQUdVkHzVJBqGGnjDBBT5VOo9c+5G1AskpNow7wjgPJDUJ3Jkh
 l3ZS4bmX8FAlxAooXvQGNPuchC/R8T8YfHH59diqoA7vRJlBRoK9GK1Tv5+cHUH45ltwOv7A49B
 8JU67Ogs5VAxDYRbSF6VMaAnTyTOfkkazvRI53GNzgO30QGn+0d/+TPjgp9EYd
X-Google-Smtp-Source: AGHT+IFv2AKaZqiIcY9hzI5VLODEXV7jQcDdGTX1gQrQKLDL7Dwnu/U9sRqTvNe4mwY4DfrAuB5tAQ==
X-Received: by 2002:a05:600c:3e07:b0:471:13fc:e356 with SMTP id
 5b1f17b1804b1-471178760f8mr225087775e9.3.1761333960082; 
 Fri, 24 Oct 2025 12:26:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429930e35casm1914582f8f.30.2025.10.24.12.25.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:25:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 14/27] hw/usb/imx: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:01 +0200
Message-ID: <20251024190416.8803-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  include/hw/usb/imx-usb-phy.h:49:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     49 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/usb/imx-usb-phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/usb/imx-usb-phy.h b/include/hw/usb/imx-usb-phy.h
index d1e867b77a3..a267c03c7e1 100644
--- a/include/hw/usb/imx-usb-phy.h
+++ b/include/hw/usb/imx-usb-phy.h
@@ -4,6 +4,7 @@
 #include "hw/sysbus.h"
 #include "qemu/bitops.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 enum IMXUsbPhyRegisters {
     USBPHY_PWD,
-- 
2.51.0


