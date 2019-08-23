Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i11rJ-00047q-7G
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 01:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rF-00042K-D6
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rE-0002Xr-7N
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:29 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40289)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11rB-0002VL-W2; Fri, 23 Aug 2019 01:11:26 -0400
Received: by mail-pg1-x541.google.com with SMTP id w10so5085594pgj.7;
 Thu, 22 Aug 2019 22:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=hrQC5pexYbXUG1YTE6t9xU7Lp0SfEiWHb4ZiElloTac=;
 b=U6uWz8LfuhsDG3mCDKEXNkglzjeDVsHNu5/XT0B+Xgcs2bEvsRa1aqy0SVyd04fGDC
 G/t8eWOIfeJI4NB4Psz1X+Ap4UvDHdTBwc4RnY44SyQdytmNKDELUfvZL600EBRIBnHl
 AG3TCJVpY6gNVDkmP8Oix3y7xwAu6sINp05gWcTqyDx3SAq4Pjc3/tIljahpEDBjlrfu
 cFLsaPCdItRr5GhbKEm4GL3HQCzAlu0HoAaF8fUMYBdTzC4RrdW4nshVTLoMQ3Il6XG7
 VSRVcUp31Tp+hM52Ar9C8ixl4nr1LAvFL/h4suu0x9G70y5+stchSG2VWBjhPIwG7OUC
 w7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=hrQC5pexYbXUG1YTE6t9xU7Lp0SfEiWHb4ZiElloTac=;
 b=az5viJwryGJLzR5hNFEzzIdTb9vDNulkl6Ta75aLO9OyR3hqvYwIx2JSXJjFDxRmvr
 1bl5M3aQQKBWIOC0B7ZgCirFRvuepyJWUq6+bBpbqPRue3kfpGzY9Dj1BKlHpufbaelX
 RIYNbNlknkGEWdRS1RMa8vMrj94rIlzgOzP+hn6tUp6gRERCFfGgU+tfeefo1XpFGHpX
 Uu+LTAC8amgLL5uBqZd6mcQuBokhzqT3yOpkLCqoqkpRfJh0DTiRIXiB7Mxz2TbbkF5L
 ekCCGy9k+gjtF3h/H3jQ162AkxxMERR0MWy5odCs6J6V3gODyBsNw92byIsTpTnMDCNu
 tF8g==
X-Gm-Message-State: APjAAAU9rsezM7Clq0Ag5AjYYddzIPv9TgicyTHJmCPdik1jbu3UoPIi
 UrVcEWapNFRVEoDeEkks6vs=
X-Google-Smtp-Source: APXvYqwCIEJx6/sXuJKiqRPSKgaE8XJ/g4eE975ZF7J2Ib4u86D9urp6R5oP5FnERNqlipANVMPwEA==
X-Received: by 2002:a17:90a:5887:: with SMTP id
 j7mr3299275pji.136.1566537085272; 
 Thu, 22 Aug 2019 22:11:25 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.24
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:10:47 -0700
Message-Id: <1566537069-22741-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-riscv] [PATCH v5 08/30] riscv: sifive_u: Remove the
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
X-List-Received-Date: Fri, 23 Aug 2019 05:11:31 -0000

sifive_u machine does not use PRCI as of today. Remove the prci
header inclusion.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

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


