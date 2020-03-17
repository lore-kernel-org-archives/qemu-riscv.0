Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jE3Ud-0008GH-Ar
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 00:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3Ua-0008BQ-Ru
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3UZ-0002nq-LY
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:12 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42571)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1jE3UZ-0002fT-Fz
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:11 -0400
Received: by mail-pl1-x643.google.com with SMTP id t3so9003314plz.9
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 21:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=2h8EAiuDrspnzxr4GNpQ/1tZBmlKA5RBBaJwzzdSex0=;
 b=s2xqYpjYQ+CJLGk34Xrg/uwnXMHXlmaeWmB1lLf07wnf8ebIJ7XOxTWMRJttCGko2C
 P2lIgCAdg880xQHvksWI0hAAJFnG4RvlMfEHFCSyK3dYGzleTokr0XTiBTw26tkeHCnd
 7NBWejnFOdn3yymtaZbkFrUQbHMTQejNRsvUEDvko/+NfJrIydOS8XWxe0RtwDJ8KvM3
 dqxgpW5uzy3eZE+bL9JCZDjh5CzP0MGjywomhmAmkXXco36bipEJdR93vg3LPoDWhLX5
 0yomus015OcD+J3iQjHe5Dx0X1WXsjMGeamCZLBWMnzG+bix8B1c7JonxknCqO8LtbgK
 Jimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=2h8EAiuDrspnzxr4GNpQ/1tZBmlKA5RBBaJwzzdSex0=;
 b=EsT2ST2Wl19YtNaPmMBZiUbMITDJZS5PFyUF/Hg+4Q7tXjFcOXa5W9ym5vT9xbR26O
 0YCDUaOu0QPzS+72mqpPGGY0aXh5LfSssUIM9s5ShfmKx9iYlVoxQ/9Un1kNgBeRRnl+
 yFSYce48un1syQ8j0+6yVMaq7GUSPORzOQIw5y6S68dc9LWmc6HApZI5dtW6wXScCHS4
 won1zCB1N/BYw2rV3WXdnrHFWWcwTaHTbCXPArUZgm4uZLXbKr9CHYF7Dl3xBIVufkUH
 kGC16e9lnA9o6pZAuiFTIcam812pik3HRT4u5AlikinI2mUrbGrrXH/9tJTxYhFBZMon
 Vd4g==
X-Gm-Message-State: ANhLgQ3hcJvi/i6/N/pw+k5PksSbaEPRHgm6Cr3xGBxwzqnPcD+m/iwC
 AVuagixsXsgN2arxQkEMAPQZGyVQ2w+65Q==
X-Google-Smtp-Source: ADFU+vtArDFC1QGTHkxtH4OOgQu1L6KWdnnnoVYt+xwYoZHzvU4qDC8IPhdzetTb3iHClFx+MUcIqQ==
X-Received: by 2002:a17:90b:3692:: with SMTP id
 mj18mr3048427pjb.138.1584417970026; 
 Mon, 16 Mar 2020 21:06:10 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id 129sm1294079pfw.84.2020.03.16.21.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 21:06:09 -0700 (PDT)
Subject: [PULL 4/6] riscv: sifive_u: Update BIOS_FILENAME for 32-bit
Date: Mon, 16 Mar 2020 21:05:45 -0700
Message-Id: <20200317040547.222501-5-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200317040547.222501-1-palmerdabbelt@google.com>
References: <20200317040547.222501-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Tue, 17 Mar 2020 04:06:14 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Update BIOS_FILENAME to consider 32-bit bios image file name.

Tested booting Linux v5.5 32-bit image (built from rv32_defconfig
plus CONFIG_SOC_SIFIVE) with the default 32-bit bios image.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/sifive_u.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 156a003642..4409ea1ccc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -56,7 +56,11 @@
 
 #include <libfdt.h>
 
-#define BIOS_FILENAME "opensbi-riscv64-sifive_u-fw_jump.bin"
+#if defined(TARGET_RISCV32)
+# define BIOS_FILENAME "opensbi-riscv32-sifive_u-fw_jump.bin"
+#else
+# define BIOS_FILENAME "opensbi-riscv64-sifive_u-fw_jump.bin"
+#endif
 
 static const struct MemmapEntry {
     hwaddr base;
-- 
2.25.1.481.gfbce0eb801-goog


