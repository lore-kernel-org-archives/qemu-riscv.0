Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWFo-0001Wq-IW
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFb-0001Ig-7K
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFQ-0006fg-2t
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWFM-0006XZ-GM
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id 25so1178424pgy.4
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=TZ7LklPK8UvVtDwbEWjV8Myyoa+ER/F09z/DtS5QZ9Q=;
 b=NR7qJf7RiGxjtM0cf/g+fgnBdjsMOyrny4x1TCnoMzNecjWWC8qOmceZ90wCTRgpUj
 5F6l5nDq1TBRumYXeeLgYGu+9gPFg2OkJ8AIe8yvSGeYEvYcUJys2IqP2fyFz8BIxevR
 JrcH0PXYKsHqVoVFh8R7lEIS6Yrl87dP3Iua1hcBv8BxU2orsb6G/4OayH54gBD8GVMv
 RSvIZl6TL0cRQna6GsVJb0TiQ5ZGuIPIJ+QsX/v/z2eyrsdMtr59LH9Wl3kgmTR78V+G
 7FmcLVXp9ANeBXzpCQ0usv+tIZoyNJ10K4+lMV+a+PYbB2v+8cLgDx6Ss73WtFMUg29a
 0YZg==
X-Gm-Message-State: APjAAAW0EFw+fTTsnXtlKPpKJwrQabskbVfYb641rR1iA6sFSP5Sg/mB
 izs2DcO0vlXNDoojrJCXaWyr+9cFRRliuA==
X-Google-Smtp-Source: APXvYqz96Z5D+cDoqKbBihFB+I4HnE63ScZ4XIrhinLF5xe1t36Ibe09/oWBTCkDhgvNQ92gzY61Fw==
X-Received: by 2002:a65:45c1:: with SMTP id m1mr4496552pgr.260.1561649009389; 
 Thu, 27 Jun 2019 08:23:29 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id h1sm4117306pfg.55.2019.06.27.08.23.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:28 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:40 -0700
Message-Id: <20190627152011.18686-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Dayeol Lee <dayeol@berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 03/34] target/riscv: Fix PMP range boundary
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
X-List-Received-Date: Thu, 27 Jun 2019 15:23:57 -0000

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


