Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgukV-00089G-0X
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54383)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguk0-00085n-R2
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgujy-0008Ji-EM
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:32:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgujy-0008IS-8Z
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:32:50 -0400
Received: by mail-pg1-f193.google.com with SMTP id k13so2877686pgq.9
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=TZ7LklPK8UvVtDwbEWjV8Myyoa+ER/F09z/DtS5QZ9Q=;
 b=Dbvt9eXcHDz2y1Ky6+ItxWNQH95R3G7GgBQzEkzsTts7XDW+nDzkCb7uZUl9TIa8jL
 5gVk6UKnGJBVDmYij7tBEaz1a7SKXZFq7Go6Iq/zzaLHqYGySWnrHsBVApOXgMUa+uKM
 mlDANGZu5BOzZavVIYkFFztHJTUuxffdmSEU4qOD0cgIOZYtjXChY9fm+C5L6O2r4kwq
 sIvxSe+gXmjqjlmSfq4/vjK0RXu5Ao95pt1NsgeXsAZ77vXkLT+DgcVB/u34ejeGdU+s
 tRnwDbf3Qp4S85Sc2VqygcB5dFRV+TMZBnKh4GMUSZ8KO4NGmZEez/SG9z20RcNUeiti
 EfMw==
X-Gm-Message-State: APjAAAU/RnDi5jeBg4owLvBfyDHzWZ09hh9ZqrwyI3xQLBGdApPDJ/WG
 WDnQ6DpOESjsmk15GoSAvVotFA==
X-Google-Smtp-Source: APXvYqyBk/LvGledl175O03URpiHsSPfbfOFMkN0vi4VWr760Ic+394LA9kH6FhvOrn0cTEqymnTLA==
X-Received: by 2002:a63:221f:: with SMTP id i31mr3722713pgi.251.1561743168142; 
 Fri, 28 Jun 2019 10:32:48 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id x6sm2514807pjp.18.2019.06.28.10.32.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:32:47 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:31:56 -0700
Message-Id: <20190628173227.31925-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Dayeol Lee <dayeol@berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:11 -0000

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


