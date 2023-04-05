Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pk5de-00067C-CS
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 12:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dZ-00063a-QH
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dX-0007la-SO
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:29 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so18604531wms.5
 for <qemu-riscv@nongnu.org>; Wed, 05 Apr 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
 b=hnCYq5Dzl/7iLI0rQYbkc9CUi17FFpKYPMxOnHcemCexKvxTdFYuaru2TQEImK5o9e
 jTn4K6Pp9zXxdmmJsMb8gD9S2GQ92Q72Ifh8L6RxwgBOR83AYlvxa/V/6Fh3hPXQBoiV
 z9gKOGSH8bAn5zRrapQGO1yAInmO8o8qVZTpVMRyYOG1CV9m59KTFXQeJKBj8sjGVuru
 vuCXHX5KYhKDn13HSZVsP5Lq2Qz50f1zC2IoyROHSYrzPF6xJDEsucHmTbgNlZ1jt64p
 EjINJfxYuBjgAhCrq5BfDf3e2GoiGGEqH9e7WYG8IshZ6uH7iubAr54kkd/PnEXO2Hgf
 kVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
 b=0Y3vbbWhip4ek4yX6WyC+t1WTE2lon5yWy7YyX6od5lpBMrQGEgEDUmU0851LDUz0T
 yw/M5JwcpXkyUpD4X+2VgerSa57V3sGChbET0UJGOHrmV4e3T8334pVuXMM62YrfWmVI
 96gaCxMkWt1g4DTGiRoNRO9lD6fMmXafXKoIsjVVT6ipqZTwVyLKoRNNt+ApUomTrmyT
 q4mCnJPDKFgUsbMRE9X8TOJxfEBf1v2X9LvAsr557KqHUv5vfk4lawjVsg5FIm5qUqyV
 aUjudITdyLqE0PABJtsNQV0sQnOIa5aVLIZWefZlE8iNlZ7+GkekNHgIRkkAj9l4rHVx
 DwYw==
X-Gm-Message-State: AAQBX9dBYaxlynv6GFHgJ0azO3zTXVoBYh7jx3+Ov9NlEZ3ly8WpN3Gk
 fYoRiAg23KhAzE/ztEU3+iCpkuQ6ii1JDfdDTWw=
X-Google-Smtp-Source: AKy350ZJ+dZx4arE1dDvn+93xqmfAgQekaQ5sdLBd5m5/mFFyw1t5hipklNUBAa6v3f8yS67ujRRZg==
X-Received: by 2002:a05:600c:253:b0:3eb:3f2d:f237 with SMTP id
 19-20020a05600c025300b003eb3f2df237mr5280415wmj.6.1680710726924; 
 Wed, 05 Apr 2023 09:05:26 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a1c4b09000000b003edf2dc7ca3sm2586415wma.34.2023.04.05.09.05.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH 05/10] hw/arm/sbsa-ref: Include missing 'sysemu/kvm.h' header
Date: Wed,  5 Apr 2023 18:04:49 +0200
Message-Id: <20230405160454.97436-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 16:05:30 -0000

"sysemu/kvm.h" is indirectly pulled in. Explicit its
inclusion to avoid when refactoring include/:

  hw/arm/sbsa-ref.c:693:9: error: implicit declaration of function 'kvm_enabled' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    if (kvm_enabled()) {
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 0b93558dde..7df4d7b712 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -26,6 +26,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
-- 
2.38.1


