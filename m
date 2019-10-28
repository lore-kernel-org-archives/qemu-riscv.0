Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pv-0005ve-FW
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Pq-0005kp-RP
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Pp-00043z-OG
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:46 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34853)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Pp-000432-GZ
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:45 -0400
Received: by mail-pf1-x442.google.com with SMTP id d13so6103528pfq.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Rf7l20baL3wXANMavS2hbKDA48ozo8auToQW/WNuPTs=;
 b=Nxr7bULAjuvvpptsDgYu04UUAZc4QgwYBV3m+t/eiYZ+mDLFhpXZ0tU7LlO/C7QbQI
 17FHjkQtB+/6fEShsASOYlKFsdVzp9xjCGLqCsCEh22EDb4TUYRJbBxRPc/yNe3kjghA
 SuY8Gk0HWWXQMHfQJI/dw7Az7JsivZlVMPkTI4VnKziFZzHnXqMsCHJlvil82RIERgLN
 a6p5X99yzBjjSNwzOEbhq3jVwTeGhh8Bjixu5INw0pFo2A7JEY7Tv4hGjfffHpn/CB9Y
 qOTkzL61CZmt/26y9wZWFZBrtpsuT8GWCM7fDPg52H1Q0zUoZKAkb3DrW8N2sL+54A8A
 cNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Rf7l20baL3wXANMavS2hbKDA48ozo8auToQW/WNuPTs=;
 b=rkbhSn1711Y3FQdN/Y4fHeb8jn0Jscjh6auLf0LlnzFlgmuFm1zcnVdNhUu8cZB3Eq
 smuu/mcyz/Jsg/Y3DNqAZ/R/NWJu8Oj8LoQWYQCoIAZwG7bLZ8lCLwtdD2onQ+g17m9P
 Ke09wDhcwV+Y3Py31I52NY0OsonL4lb/MMOc9d3+J0ZWH0CvnquNw2NO2JigCnzkM7bC
 Vvp1iZyRvt/wrXng8FOwDYDKko6zxMJU5vNps3UQTJ5c8Q/nPnecIv5YIRj1lmWQnAm8
 14eBADxBVoeGxCScPxrsv9LKPlhJWhFtrT61b653dVmU0xTukUozIXpjsdZQ/GJdlLIa
 f8mw==
X-Gm-Message-State: APjAAAUcb5zitpCgSB1NPKJOxWvukoTau6vvme4cdcsOul6WiL4Yo4/4
 YNkL6xUhI69gc8eCbbumqVQEyA==
X-Google-Smtp-Source: APXvYqzP6RAn/bhU3NbvkC+OGNuHCBhWUIFWABoctEMHxx1ExPL2lnKjWH9JAcvwXd0+jzHcAmFxBQ==
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr21648902pfd.255.1572278324651; 
 Mon, 28 Oct 2019 08:58:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y129sm12530908pgb.28.2019.10.28.08.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:44 -0700 (PDT)
Subject: [PULL 16/18] target/riscv: Make the priv register writable by GDB
Date: Mon, 28 Oct 2019 08:49:00 -0700
Message-Id: <20191028154902.32491-17-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Jonathan Behrens <jonathan@fintelia.io>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:49 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

Currently only PRV_U, PRV_S and PRV_M are supported, so this patch ensures that
the privilege mode is set to one of them. Once support for the H-extension is
added, this code will also need to properly update the virtualization status
when switching between VU/VS-modes and M-mode.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 1f71604b78..1a7947e019 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -387,6 +387,15 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 {
+    if (n == 0) {
+#ifndef CONFIG_USER_ONLY
+        cs->priv = ldtul_p(mem_buf) & 0x3;
+        if (cs->priv == PRV_H) {
+            cs->priv = PRV_S;
+        }
+#endif
+        return sizeof(target_ulong);
+    }
     return 0;
 }
 
-- 
2.21.0


