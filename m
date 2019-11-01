Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQZcV-00035D-5c
	for mharc-qemu-riscv@gnu.org; Fri, 01 Nov 2019 12:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iQZcS-00032r-JW
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iQZcR-0005vx-Ch
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:17:48 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iQZcR-0005s6-79
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2019 12:17:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id e3so2476558plt.7
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2019 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=FWN25eP3ttkhHBPL8KIS9xKijpRU7CQEubpr34vg72E=;
 b=gZDwP1qPSECl8jBoIlwkw6alNMeF0H9HZNVUPRgxoOjIeJhVmrQUei+SCZ6PEOaJXe
 wPya4mnkQsb1B/p+EXOuU6YvunEpoCNE2x9PMcEgD30fctVvHl+1AolFklyCzydpP/V6
 OH7MkoNZg21AbnDGqazc7LiPgCp69gDMimu3CJKa5o6TCmMCXObGesJSds3i/wQT5KNY
 L831PJQztWz99kh+QegWVhtj561Tcm5u78heZWB3XIbOx7qSUSFPOd9KrPvvjW7W1s3R
 Y5ToJtP20vmIaYBLqK1nsKqg07QOGLjbscFXh0/IE8qhhRL4ukeMRtLaDye1sFbmJtBJ
 /Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=FWN25eP3ttkhHBPL8KIS9xKijpRU7CQEubpr34vg72E=;
 b=kGofGmysLbMq6UKk/iLBoNl+k1pD5QfpYKQnLvqg4yKhXItKqWmL2PVr5P3Wo2Vdnr
 jFSlkCkn2O+RxYnrN72SoEaxypXbM/UmvbkJdCkWZUUzgr8pwNnBby/MVtipJIVVp8Ki
 uL6GcX0N+gxd7vQB6qzpqeiKdES4ySr57RrZLfD4T9UM+2waenoRbTo4ZOwhVt1H488G
 Y60g3fI4Cxtjs61VkePkb0vmTcOJdDDbOiTLJn6/UeuIfOdwqLNOXw6xbv8SvJFcUZPr
 o0Q9AkMk7B/jpeh4eMeIoJDTACgD1rpbTY6rwWHSEpZhmbxnAYzMDhyH1gWluS4PspGR
 7l9A==
X-Gm-Message-State: APjAAAX5YpMlomyOR8zZXGXndfeu6OI9BkNzGyh5VAZKpQ0f+xCW/fR9
 TXubOTucMBrgAgRPyORgPydYwQ==
X-Google-Smtp-Source: APXvYqwneqcy2pixK4/B+flVdvqcT8IBq2G1XvEQvbekfmfu+onmMPvVOhXUmzsU+TK3RTt4twsKPA==
X-Received: by 2002:a17:902:ab94:: with SMTP id
 f20mr12637334plr.231.1572625066176; 
 Fri, 01 Nov 2019 09:17:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x10sm1889579pfn.36.2019.11.01.09.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 09:17:45 -0700 (PDT)
Subject: [PULL] MAINTAINERS: Change to my personal email address
Date: Fri,  1 Nov 2019 09:16:54 -0700
Message-Id: <20191101161654.2871-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191101161654.2871-1-palmer@sifive.com>
References: <20191101161654.2871-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Fri, 01 Nov 2019 16:17:49 -0000

I'm leaving SiFive in a bit less than two weeks, which means I'll be
losing my @sifive email address.  I don't have my new email address yet,
so I'm switching over to my personal address.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92961faa0e..c2a68555ae 100644
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
@@ -2401,7 +2401,7 @@ F: tcg/ppc/
 F: disas/ppc.c
 
 RISC-V TCG target
-M: Palmer Dabbelt <palmer@sifive.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
-- 
2.21.0


