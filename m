Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvSf5-0002si-Ke
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 16:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34005)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hvSf3-0002lt-7W
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 16:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hvSf2-00076I-9e
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 16:35:53 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32916)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hvSf2-00074r-4H
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 16:35:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so42402890plo.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 13:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=R8xWP9Mxshej5PA8tCd2n8Cul5yLRtIaS9eOBFzo/ZQ=;
 b=HokyvfXn7TMQk6rWBoYDCaRJcyFZmGoNl+UcIycc3oEQr3GNzOOnf3BcbeNPVb4AWB
 Jf+n+/P1v1aHgtGK++/kcegc7ESgiisVSPldRh8595Vv4ihzqsPjuZF2XJshlUxRKmz1
 ZKXZAsl1wd9+VG35s7POqZsz+uM17aUyQjWZVvi5wPzioc2+mHyUrFDWPoFFtetYoOGC
 pfybKrhJJkZLErM+XBmr4zzhwp19qCpEXojz/EtrHTsZxXMpHk2anfVRmyDnR1ZICCuj
 EetdNtClUlM3V0N2bfKs5nhy3sNbmgZAw52jMjhs5x+N9UFXrADM1xE0qdCtXNH7wunV
 U3eQ==
X-Gm-Message-State: APjAAAUZ2DsrDtuDbXHNqwT9St5iOJVNrSW9f2MMLtHw3s3Nb6bjF1yV
 fxQV7HHT9X1GnlTi3kmtlLbtaQ==
X-Google-Smtp-Source: APXvYqxX5SLoJ8LCMG8hrdBU22+vVLN9GHqDo4HQr/WML2TFEw4hEbgiIF2ZxIqOC6C5Ikf2EfVGaQ==
X-Received: by 2002:a17:902:82c4:: with SMTP id
 u4mr9960400plz.196.1565210150735; 
 Wed, 07 Aug 2019 13:35:50 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q22sm85567918pgh.49.2019.08.07.13.35.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 13:35:50 -0700 (PDT)
Date: Wed,  7 Aug 2019 10:49:44 -0700
Message-Id: <20190807174944.17944-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <Atish.Patra@wdc.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: [Qemu-riscv] [PATCH v2] RISC-V: Ignore the S and U extensions when
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
X-List-Received-Date: Wed, 07 Aug 2019 20:35:54 -0000

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
 target/riscv/cpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd20ad7..74f3449c4918 100644
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
+                *p++ = lower;
+                break;
+            }
         }
     }
     *p = '\0';
-- 
2.21.0


