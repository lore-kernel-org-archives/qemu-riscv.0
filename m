Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xw7-0007zl-Il
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw3-0007up-Ng
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw2-0006bf-MS
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:07 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xw2-0006bD-H8
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so2332264wme.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=xpkGcRJRYadCT6ocDlVxXul15aD8WH0BAO94YOt7Pqc=;
 b=ksXmccSKj1cZag8hm77str5CYPMzJHTbnJqq1bM5o9xyagL6HR57ohbdzVfiEsS4jq
 wMp1wSQWUs15aUR+Ta2r6/POmdh1AXDq3HCDAbq8uYx+etK0hm2kVHeZweiRc/tEq3cG
 MdPeXv4Ti86br1csGn0M8z39bmSapoSiX6d6ZSuaXmtkKQMrYrCk4zhHY/4Wqd/5WHhu
 2/5dFw6mSIJF1ju2XJjYZyfoV8ELT2Ae78l740u8dAPS7vhV7iygxnUiJ9j9VkoSs3dk
 CAjf+opHllAmQIjbM1bEmhnVzI2LvyxLToqfoxnTvTm3gt8mzBtQSafLyiPxtr3saUhE
 H39g==
X-Gm-Message-State: APjAAAXk0oJonUcz12jBhvBgyM3+WK36rzZ3a/EwNUjYIavaCVGgY3p8
 6L9QFdntPOkKkGLzjriW1ZcLenYJPGFXdw==
X-Google-Smtp-Source: APXvYqzDhdmOI63MeSG7Zaf8rYsFyJLwfBkokVlm4fpS6B6eKDfzOaKebcOB3ioRvDz1zwUNSWVY3w==
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr2802161wma.124.1568190305158; 
 Wed, 11 Sep 2019 01:25:05 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id q14sm43929897wrc.77.2019.09.11.01.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:04 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:48 -0700
Message-Id: <20190910190513.21160-23-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: [Qemu-riscv] [PULL 22/47] riscv: sifive_u: Remove the unnecessary
 include of prci header
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:10 -0000

From: Bin Meng <bmeng.cn@gmail.com>

sifive_u machine does not use PRCI as of today. Remove the prci
header inclusion.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 32d8cee335..2947e06f71 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -38,7 +38,6 @@
 #include "hw/riscv/sifive_plic.h"
 #include "hw/riscv/sifive_clint.h"
 #include "hw/riscv/sifive_uart.h"
-#include "hw/riscv/sifive_prci.h"
 #include "hw/riscv/sifive_u.h"
 #include "hw/riscv/boot.h"
 #include "chardev/char.h"
-- 
2.21.0


