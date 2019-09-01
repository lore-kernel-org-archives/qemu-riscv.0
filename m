Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4Fzy-0007qw-5H
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzi-0007fy-Ir
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzf-0006Rk-VE
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:34 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzc-0006LG-6f; Sat, 31 Aug 2019 22:53:28 -0400
Received: by mail-pf1-x443.google.com with SMTP id 205so4468532pfw.2;
 Sat, 31 Aug 2019 19:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=UxCoLrVpRd3F2zQbsCEwhNmvBti04z08ke2SngMtvE8=;
 b=pDwGQAnJAZKFMYN8Y3PRytRqj436uIGC6Da87HhfmWYT6qUHA2RU45QWHP5pkIADC8
 vlrHUup31NbfwvkwunNGOjxxzrHPRagZHcg7TAJ1NotxygaBD9ogQuGIJYD+z/2zOyi1
 bhCeR8IDgCuy/2HTvIV42vaNEkI/8HSvQr5PezpIvFWOpqg3ZEJU+5mXaAfkBDp3Xn6r
 AK9bCV9+QUJwZbplIYKmrfDnDvQNqxW8lTXYrtXLXls/mWmM+cTYNmRxE9U1UC5kqJ4/
 DEQVvXeFak0r91+dh69xHO7wHCt5mg/rL0VgM9rRbV1pfYeXbGan1Sclyg0ic5GisJ53
 hm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=UxCoLrVpRd3F2zQbsCEwhNmvBti04z08ke2SngMtvE8=;
 b=ErAv0iUtGHyPjd8qjoiwJvgP6aLmnsaQ3Mq/II0y8Z2Zu7/3XSF6yU84tzHZ1s/ezD
 YyzB/MBfKwJkozB97N2uTx8P3E3oUNyvIjBJMUeWRmYyu0h2Y8Uu7H/ZTgw7ykHtA091
 vH5KsLxvzF7ivJJ5nc8HV3+KfHqJHiLmP2ApsHhEfdtPOkL3/AJUKFNEuDme4OO5dqSQ
 DyBaDGvGHgLysj80xt88yJzQ/q3EyRzOpAU1I9fdpsGGRBsSLYUwJegVklPdTZuWvjGo
 6YZHQxZT7apF6brtTYh32won+UKAiVKTxaMqaxLqmxYjVORvWosPJthAmd+rJauMFRZh
 B/bQ==
X-Gm-Message-State: APjAAAV0rkADNa6VfXS3wybqtwSWsJm6g1rJbyIsH8FUMlNmZGzllzPy
 F6oNQ4j0KKioureCFeVup20=
X-Google-Smtp-Source: APXvYqzR5QKiqJVYotk3PHpzklM5axCe49g949FX4wwyI63DbH27EaQMmCTpmWEEzky8xMYjLZF2/A==
X-Received: by 2002:aa7:9e04:: with SMTP id y4mr26985635pfq.18.1567306407498; 
 Sat, 31 Aug 2019 19:53:27 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.26
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:49 -0700
Message-Id: <1567306391-2682-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-riscv] [PATCH v7 08/30] riscv: sifive_u: Remove the
 unnecessary include of prci header
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:38 -0000

sifive_u machine does not use PRCI as of today. Remove the prci
header inclusion.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e22803b..3f58f61 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -39,7 +39,6 @@
 #include "hw/riscv/sifive_plic.h"
 #include "hw/riscv/sifive_clint.h"
 #include "hw/riscv/sifive_uart.h"
-#include "hw/riscv/sifive_prci.h"
 #include "hw/riscv/sifive_u.h"
 #include "hw/riscv/boot.h"
 #include "chardev/char.h"
-- 
2.7.4


