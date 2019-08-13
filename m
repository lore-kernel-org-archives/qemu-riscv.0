Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxfgn-0005uE-OU
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 18:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hxfgl-0005td-DY
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 18:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hxfgk-0006UN-Fh
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 18:54:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33132)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hxfgk-0006U9-AT
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 18:54:46 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so11209140pgn.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 15:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=9hzQDp4ZaD0ACnDOE3HEeTilvKbeiwOSKUnAotgimJQ=;
 b=J5TbL4jCZOcz7/d0Vnf2M9kiSya6aMtRdnNMk2SzLF/JNwmWjdsHvNHb8CEnJklkH4
 8ew5s98ulnioQBe1IEgjy6P4PwDczAaLubuIBvGaRJEnQMM/8rM2Ptiug459hP32RVx4
 FReRN7nwMw6rVN9TT9sgzMqU5I18uy0G+YvbO8OrzQQg+A3vcSgcbV7dYVu9WfL3inPv
 W0aLS0HW3Q2VFupx241THEZUe1cq9vAhSmFgTLVYBzFM8M5OA02Z7zQSErcZkmghsJyn
 Q1hnxdp2IhujIM0ffzIYLROKlxetgj0p50ntI3z4kMYn7kexAgvNcAlP1+T2yzhWwbn/
 duMw==
X-Gm-Message-State: APjAAAURzyoQ5xsPT0odaShMfEjR/iKy4jkDtecKXolNa4ruvg5V6jGU
 FfvGHeYD8t9SJ1RDDT84wbBB/Q==
X-Google-Smtp-Source: APXvYqxotfhbhfvjziG8ocdUpOtNFpDWKhIFFk8kTQRMLIb+3/PvuqOYJpTIBqfPScCSSuomLZXqUw==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr36374923pgi.152.1565736884691; 
 Tue, 13 Aug 2019 15:54:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w10sm3258290pjv.23.2019.08.13.15.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 15:54:44 -0700 (PDT)
Date: Tue, 13 Aug 2019 15:53:07 -0700
Message-Id: <20190813225307.5792-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,       qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PATCH v2] RISC-V: Ignore the S and U letters when
 formatting ISA strings
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
X-List-Received-Date: Tue, 13 Aug 2019 22:54:48 -0000

The ISA strings we're providing from QEMU aren't actually legal RISC-V
ISA strings, as both S and U cannot exist as single-letter extensions
and must instead be multi-letter strings.  We're still using the ISA
strings inside QEMU to track the availiable extensions, so this patch
just strips out the S and U extensions when formatting ISA strings.

This boots Linux on top of 4.1-rc3, which no longer has the U extension
in /proc/cpuinfo.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd20ad7..a67c54c738ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -501,7 +501,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
     for (i = 0; i < sizeof(riscv_exts); i++) {
         if (cpu->env.misa & RV(riscv_exts[i])) {
-            *p++ = qemu_tolower(riscv_exts[i]);
+            char lower = qemu_tolower(riscv_exts[i]);
+            switch (lower) {
+            case 's':
+            case 'u':
+                /*
+		 * The 's' and 'u' letters shouldn't show up in ISA strings as
+		 * they're not extensions, but they should show up in MISA.
+		 * Since we use these letters interally as a pseudo ISA string
+		 * to set MISA it's easier to just strip them out when
+		 * formatting the ISA string.
+		 */
+                break;
+
+            default:
+                *p++ = lower;
+                break;
+            }
         }
     }
     *p = '\0';
-- 
2.21.0


