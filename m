Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iPg31-0003oY-0W
	for mharc-qemu-riscv@gnu.org; Wed, 30 Oct 2019 00:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iPg2y-0003n7-IM
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2019 00:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iPg2x-0001C1-9T
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2019 00:57:28 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iPg2w-0001BQ-TG
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2019 00:57:27 -0400
Received: by mail-pf1-x442.google.com with SMTP id b128so691031pfa.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Oct 2019 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=QD5lzKum+Qo4vVF6hgbVJbUU4Qh7RzWKO3RZ7H1Bm0A=;
 b=p/socSB8T1sjyFDkXRmQkZSCZSjjCS+9CUG52wW/nmYHbXtYvK7u4yE5u9dm37Ec9M
 wMuAZOzCptwbssantO/Vp3DVqKCEZe7gsaqrjpsBs1pXJfm50hRIaTCmO2Gdmn4MffGs
 5+VHBrNwWV/+skvMAdRwz9ekDh+H3DtYl2DbWNxbgCJYsDg6nha4d//KFf3ZwDwDQRKl
 mPwpBg2i/uq7VUMl7/dKN+tokhHUxig1NcIwWDs1vmRCldQUC94OkdMLRDY9PRJ9Nr9N
 6XP6CF7aZMR9jThKetWL3rqOjq5lEm4isjHC3f049MKXyt0SmOWO1aiOPybzAZBXa3/U
 DX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=QD5lzKum+Qo4vVF6hgbVJbUU4Qh7RzWKO3RZ7H1Bm0A=;
 b=TGBh5cJM4A3gKbGvjgoj1E/xzm4NDYqBYWn7qBCdGOKhaVZHIJx+zP5CwNs8lMijps
 S3XneZ7LqOOtbqir2BjIdSxMUTJ51H6btizcIbM2vzcGBnBUp4zSqHoqiknYQXZaTjm1
 8WDOasvHkYcFN/3VVv6+nToLl0bDZ3qvcBgbd49dynYjGi3u5n6QZ23tEoWTh+XlSXP1
 8CIVMVIoCEkmxl8p+epY8uPdCvlOhvEXzEe9T5fz9kshW5hFu0IEqTl2WAjBxZridmGL
 01nylkyAhPLj6ujefBapKTocESvT/pinNMIpUcyA/Nr57f/BPHVjMf9R1YAM4FwH3oa2
 plgw==
X-Gm-Message-State: APjAAAXkFSjTzzhV67Q/87xJ6GFDnWp5Ojy6wkOCOOdY6UH0jvUVJy24
 nNVGFMceXRbGPb5iJ+HKXXThpA==
X-Google-Smtp-Source: APXvYqyLnBnl0qQjGR+lCpSI8Rh9Tj0sQQUl92gf35LwP0Rqgf+XxkxFwU0pLzfsfmZmtnGi2bnmRg==
X-Received: by 2002:a17:90a:9104:: with SMTP id
 k4mr11442805pjo.39.1572411445399; 
 Tue, 29 Oct 2019 21:57:25 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id s24sm974473pfm.144.2019.10.29.21.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 21:57:24 -0700 (PDT)
Subject: [PATCH] MAINTAINERS: Change to my personal email address
Date: Tue, 29 Oct 2019 21:43:41 -0700
Message-Id: <20191030044341.29179-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
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
X-List-Received-Date: Wed, 30 Oct 2019 04:57:29 -0000

I'm leaving SiFive in a bit less than two weeks, which means I'll be
losing my @sifive email address.  I don't have my new email address yet,
so I'm switching over to my personal address instead.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 325e67a04eee..20445f353e7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -259,7 +259,7 @@ F: include/hw/ppc/
 F: disas/ppc.c
 
 RISC-V TCG CPUs
-M: Palmer Dabbelt <palmer@sifive.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
@@ -2392,7 +2392,7 @@ F: tcg/ppc/
 F: disas/ppc.c
 
 RISC-V TCG target
-M: Palmer Dabbelt <palmer@sifive.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
-- 
2.21.0


