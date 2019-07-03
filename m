Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapK-0005LF-Kr
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapI-0005G7-Ou
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapH-0006DW-Ki
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37367)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapH-0006B6-9m
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so1491022ljf.4
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=TZ7LklPK8UvVtDwbEWjV8Myyoa+ER/F09z/DtS5QZ9Q=;
 b=VBQevR/bXGm344cdrv32NGlyBGRNrgwIuU3q53ew3jWiIL6klZTmhwBeEEqkbWL7lm
 WwQ1nUuu3B8Od9mznIzS/uqDCQGbGGmgPNstSLIM3prknn5THyIbQPsFp9l+LfGfPZ/A
 9WlkBkYzpAcH6KRlfzQEuSlbgG5tSFzeojhPeh38XJnLe3FS7nYl1gbXYpuwQCzhH/eT
 /Q0t/6anW8XHdRFNG822mm7NDg2pk/lTVZZKv8VAu0hKletIzSg6q9Aqbw5uhfgraq0G
 WFqFSD0j4G2VNu6EEIiFHxZeHmi7cI64A6vlglWQY0Q2TDpMOVA0ujGHsmd86T85/Alr
 oRHQ==
X-Gm-Message-State: APjAAAV2y/tHAO59RUN4xJDjax3Jy0fD8Rdc1+Om0U+8IGNTbwHI+ANp
 gIc+msDTmMJ+rMOqwOk0z5vEyPeNpYiZiw==
X-Google-Smtp-Source: APXvYqzktnSmwseN5NP8Lnu343kymcH1R7z28pqLm1HdYbLw4LmYVYvWKhkLDgIBrToVxqUxG7ZpZw==
X-Received: by 2002:a2e:12dc:: with SMTP id 89mr20693838ljs.40.1562143273831; 
 Wed, 03 Jul 2019 01:41:13 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id 11sm340283ljc.66.2019.07.03.01.41.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:13 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:19 -0700
Message-Id: <20190703084048.6980-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Dayeol Lee <dayeol@berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.194
Subject: [Qemu-riscv] [PULL 03/32] target/riscv: Fix PMP range boundary
 address bug
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:18 -0000

From: Dayeol Lee <dayeol@berkeley.edu>

A wrong address is passed to `pmp_is_in_range` while checking if a
memory access is within a PMP range.
Since the ending address of the pmp range (i.e., pmp_state.addr[i].ea)
is set to the last address in the range (i.e., pmp base + pmp size - 1),
memory accesses containg the last address in the range will always fail.

For example, assume that a PMP range is 4KB from 0x87654000 such that
the last address within the range is 0x87654fff.
1-byte access to 0x87654fff should be considered to be fully inside the
PMP range.
However the access now fails and complains partial inclusion because
pmp_is_in_range(env, i, addr + size) returns 0 whereas
pmp_is_in_range(env, i, addr) returns 1.

Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index fed1c3c0301b..e0fe2064074a 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -245,7 +245,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
          from low to high */
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + size);
+        e = pmp_is_in_range(env, i, addr + size - 1);
 
         /* partially inside */
         if ((s + e) == 1) {
-- 
2.21.0


