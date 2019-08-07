Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvNQI-00019u-DG
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 11:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hvNQF-00013i-Km
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hvNQD-0005kt-Dt
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:00:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hvNQB-0005j7-FU
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 11:00:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so41262732plr.4
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 08:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/z3SaXELBbM1r0WgxX2Aa0ZqhKzjlwWQ5XV4JiXHSQc=;
 b=h8FKRrRr4arJfgUFFd3m+B2hd3lHy9x01T1/S1InMUOH5H6qcKa0M445iicIl4TFxr
 HTmdLDaz31gjbrZs/JPAEHWd1jbknnD0OH15dRyaYuMJBLUf0H1xt8kyUd82dMFIiWE2
 Pqiv94u6+7kfm254VAwa0bC4sdQR6siWMXF1ZTMAfHprVWeJUBlN4hmryWVH2aYyQ86M
 3WKv1qqFWZS0PcyL7bCagCiXmMzBETuHqCeuuVFxd8bhAkcQXKqS6x6VDTruWL6YsSbO
 UB8OoAux9rVjL3Yj22PWxzCrLT5s+16VdMKqJDAyWmzkOQgMDEQBOVpFhuDKCDzrKc41
 JDeg==
X-Gm-Message-State: APjAAAVRzDWRiNwPLlVbvkizx2BNpDVM+vEb1bgqAr7UzQhpto3c4qEh
 tKGPUGZcdot+CjUp4C+KGHqa3g==
X-Google-Smtp-Source: APXvYqxpvrcPP1rXQEzW5s408YNpQQayr5I9ZkLIuETds3ak6LOeEHY0CdB/jHuNnjkwjNRqXoe3VA==
X-Received: by 2002:a62:e815:: with SMTP id c21mr10089381pfi.244.1565190008346; 
 Wed, 07 Aug 2019 08:00:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 64sm93539840pfe.128.2019.08.07.08.00.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 08:00:07 -0700 (PDT)
Date: Wed,  7 Aug 2019 07:59:39 -0700
Message-Id: <20190807145939.1281-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <Atish.Patra@wdc.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
Subject: [Qemu-riscv] [PATCH for 4.1] RISC-V: Ignore the S and U extensions
 when formatting ISA strings
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
X-List-Received-Date: Wed, 07 Aug 2019 15:00:17 -0000

The ISA strings we're providing from QEMU aren't actually legal RISC-V
ISA strings, as both the S and U extensions cannot exist as
single-letter extensions and must instead be multi-letter strings.
We're still using the ISA strings inside QEMU to track the availiable
extensions, so this patch just strips out the S and U extensions when
formatting ISA strings.

This boots Linux on top of 4.1-rc3, which no longer has the U extension
in /proc/cpuinfo.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
This is another late one, but I'd like to target it for 4.1 as we're
providing illegal ISA strings and I don't want to bake that into a bunch
of other code.
---
 target/riscv/cpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd20ad7..4df14433d789 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -501,7 +501,22 @@ char *riscv_isa_string(RISCVCPU *cpu)
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
     for (i = 0; i < sizeof(riscv_exts); i++) {
         if (cpu->env.misa & RV(riscv_exts[i])) {
-            *p++ = qemu_tolower(riscv_exts[i]);
+            char lower = qemu_tolower(riscv_exts[i]);
+            switch (lower) {
+            case 's':
+            case 'u':
+                /*
+                 * The 's' and 'u' extensions shouldn't be passed in the device
+                 * tree, but we still use them internally to track extension
+                 * sets.  Here we just explicitly remove them when formatting
+                 * an ISA string.
+                 */
+                break;
+
+            default:
+                *p++ = qemu_tolower(riscv_exts[i]);
+                break;
+            }
         }
     }
     *p = '\0';
-- 
2.21.0


