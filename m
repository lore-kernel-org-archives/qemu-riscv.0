Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsX-0007GU-DV
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsR-00076F-3I
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsP-0006or-UY
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:18 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:45225)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsP-0006ni-Oo
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:17 -0400
Received: by mail-pl1-f172.google.com with SMTP id u12so95842pls.12
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=xpkGcRJRYadCT6ocDlVxXul15aD8WH0BAO94YOt7Pqc=;
 b=ruujDxAdo80kxm71tBRwncj5jS3hQnCIQwFEV73SlyjiStg8cclPVoksbM01ZN4PbF
 mJ44QbkthA8+JwWcE7PQzn5FghkFqcf9E1s8SJ77s6rJ+paYCpDbp45YJDhtBpSnAekV
 KZ89tzDGZ6hQPvEG75pMLe3x7A5rhEc5X1CVGS/iiTb1ccvhYWNU5CcYjFKNFo2odp7r
 mjlLKTxLxQnZy8ERX31pIkDlMysw2FSFqd2Edkzm+Gxi/pp8QKwA1Q2cpbJ9cOhPlHzO
 Ny3C9pGYJlnS3XVlY219ZBcL+gQ86fAW7PLo2auy40ycjq+dVO35jLvIhb/coLrKsSSu
 o1Eg==
X-Gm-Message-State: APjAAAW0EFydul34bwpdseX+BfeZ5O8WHxZcgHqI5QnMsJZrah3q6Qit
 0k9OGiAVSSvfVDnVTaYcexUGOGs2VWE=
X-Google-Smtp-Source: APXvYqxiUJaoP6chcZoXKqQu9MwlV1dyNJvg0+aOvok3WF+W+DaW7MHkF0Jvw/qULcVkMuubbNPo6A==
X-Received: by 2002:a17:902:6545:: with SMTP id
 d5mr4877277pln.333.1568820496321; 
 Wed, 18 Sep 2019 08:28:16 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i1sm13119473pfg.2.2019.09.18.08.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:15 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:14 -0700
Message-Id: <20190918145640.17349-23-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.172
Subject: [Qemu-riscv] [PULL 22/48] riscv: sifive_u: Remove the unnecessary
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:23 -0000

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


