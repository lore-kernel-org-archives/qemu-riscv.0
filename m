Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Py-00063G-UC
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Pu-0005rh-0B
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Ps-00047J-SM
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:49 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Ps-00046o-Ms
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:48 -0400
Received: by mail-pg1-x543.google.com with SMTP id p1so7165068pgi.4
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=o43RPnYxBJ6zG1efVp6eoAI+8V+9lXTJj+YBPx9n47c=;
 b=YURNv/wF0HooB/D3oxv2eoYK+Ml+CuSzNM2RBfdsnX0rrsGRkRn0Vz32SDxZeEllXv
 Z2HSCqCkPjkQv6aJY4CaT5LUhhWmXdp0y9vO9AFSxWvWBHfu5ovrHiLK/Uh8DGdme5UM
 i3zej0czQ7Z381cjq6XEGj3zGeV1iwYQCZJn2kMA+TkCKxWUR4meynzV+1N7kLVFwaV0
 FWZ9LPO9ZjaHHD7gj8rIvQrDZcOyHQNJHSVnIxidFJ731HGyVgiBnOL7XwkkxWpPJIKS
 XRED1kR3rsfM+7vDHkuI9ToLK589NLBGiP+5yJQq8Wr5cQx3ht/K8cxTVdZzhKQHoiFJ
 uyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=o43RPnYxBJ6zG1efVp6eoAI+8V+9lXTJj+YBPx9n47c=;
 b=LrCI/FxAu2lN/RemR2ROxFJKtvCrcQmZJSdfCUTulBgKkI0a/E0nzalu9UgxVa9nMZ
 RLjMwzPEcaAn6tf1UgF2l4tc2OUyia4m6h8J3S5Ud2EmoPkQP/l4t02K5nl31LiOBGYv
 LuJl0paEKSxlK+38T6hNDLKz4coIEZt1K0sSN4aig0Nw6jJPp1zttVyoB2Dk/ypdyckG
 OCk8tbun48/cvklQLqgfq2iM5XaDJp44ld23CNzTJM63G5Y8v2kF+cg7v7/tn63DtyeJ
 TRgUshbr6Rm3dLx3pdNts8ZRn8WCnBAo7uafZoX9Y8UAtGsgsEY8wKI8GdeAq+0KAAW8
 IolQ==
X-Gm-Message-State: APjAAAVelbYr5ed4CzlSHACIywjYtiYb8z6A2IqZZr7PYuusy4DdRl55
 BNx44p+gy4g15sT/ESOYNubVcA==
X-Google-Smtp-Source: APXvYqxDmMHQz8muQRofK2H2gzvTBJSerDtfjffa7I72LYufKlKkxhHCgeB+0zSpFJvgagDLdOau7A==
X-Received: by 2002:a63:5d06:: with SMTP id r6mr21640753pgb.216.1572278327779; 
 Mon, 28 Oct 2019 08:58:47 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g17sm10503611pgn.37.2019.10.28.08.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:47 -0700 (PDT)
Subject: [PULL 18/18] target/riscv: PMP violation due to wrong size parameter
Date: Mon, 28 Oct 2019 08:49:02 -0700
Message-Id: <20191028154902.32491-19-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Dayeol Lee <dayeol@berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:52 -0000

From: Dayeol Lee <dayeol@berkeley.edu>

riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
using pmp_hart_has_privs().
However, if the size is unknown (=0), the ending address will be
`addr - 1` as it is `addr + size - 1` in `pmp_hart_has_privs()`.
This always causes a false PMP violation on the starting address of the
range, as `addr - 1` is not in the range.

In order to fix, we just assume that all bytes from addr to the end of
the page will be accessed if the size is unknown.

Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d4f1007109..0e6b640fbd 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -223,6 +223,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 {
     int i = 0;
     int ret = -1;
+    int pmp_size = 0;
     target_ulong s = 0;
     target_ulong e = 0;
     pmp_priv_t allowed_privs = 0;
@@ -232,11 +233,21 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         return true;
     }
 
+    /*
+     * if size is unknown (0), assume that all bytes
+     * from addr to the end of the page will be accessed.
+     */
+    if (size == 0) {
+        pmp_size = -(addr | TARGET_PAGE_MASK);
+    } else {
+        pmp_size = size;
+    }
+
     /* 1.10 draft priv spec states there is an implicit order
          from low to high */
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + size - 1);
+        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
 
         /* partially inside */
         if ((s + e) == 1) {
-- 
2.21.0


