Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwit2-0006W9-J2
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 04:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwisz-0006Kb-AG
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwisy-00043A-CS
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33703)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwisw-00041Y-4Z; Sun, 11 Aug 2019 04:07:26 -0400
Received: by mail-pf1-x444.google.com with SMTP id g2so48249299pfq.0;
 Sun, 11 Aug 2019 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Soss+R8mVg08tv6kS8YP+YW69YI+O20Op04QZAq7bD0=;
 b=UK+S3cC6PjbuZUPEtEn0+Z+R4lFjV/uyCC5suKsdc4kWh1j3NpbyLbjyLEIpIoSaLZ
 iivoYHykQkqU9Px1x9C18h9OmjKzQPiWerdxeo8Vi2XLq/IfLIOQLgwsoqPLJTKE3Xe3
 TJVCOA28Ktti5OxvcyL5WGvd5HxtAtgzfEKwmLyIK44jma0ceRV7+BQX7sPSCDDW7osT
 gpQVcd7GJA6CJvCtirENEv6zjC18Ozhps8wAVyfi7AznB67KPQTrWngN/H2ZzuvDDqE4
 e1BV7Pm4KDqN4siHl42zijesYbZkz7CLYITEFxPCl+ljwKd0g1kS9HDqbYZM8/EFPKiN
 PziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Soss+R8mVg08tv6kS8YP+YW69YI+O20Op04QZAq7bD0=;
 b=ly43Q7ntpVuYmdn9NSM2WzAbuBa6Ra+cqVZRmzo6Xp3ykonj5BG/RcYOYQqp4eZv+Y
 5qQshwHrapXUGtjqknAJt1IGlAoplfo3T7RgXatRhfD+4ogvLEE+seXesfKSl5xwxL5G
 eC+Y6VzrfDsSxzzPQPKA7Y+HbW/IMAvUpIzFPO4OOMzJ69Or0VXNegvpfWEl4A8lDZZO
 T8lvIHhwY7gvyD8ETi9Du4m4osHvKHqb+fWkCjqkoq8vaV7fSJsTGqsXLnupxCZpyjxM
 +VM2073sEP319BeMcSn2gWzSMWLMskuwFI6lRyI+wF78356CrQWmCGSkwqETEvnJymP7
 4+ag==
X-Gm-Message-State: APjAAAU7fi+Z3aKbgAHIy9uJ6FVVAknvz1qoDSE6IQrke7+bLDkn+SM5
 OOf4YWKl4Qi+kHOdeIgsUt4e4xwd
X-Google-Smtp-Source: APXvYqwzATpLu1Z+K1Xn2MWRg4OKMEZIyyvAQdkMxrcFGTu+45E/RTdPYD2BfKuAAaIXDl0ffhO9WQ==
X-Received: by 2002:aa7:8102:: with SMTP id b2mr30667127pfi.105.1565510845443; 
 Sun, 11 Aug 2019 01:07:25 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v8sm87339107pgs.82.2019.08.11.01.07.24
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 01:07:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 11 Aug 2019 01:06:50 -0700
Message-Id: <1565510821-3927-18-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH v3 17/28] riscv: sifive_u: Change UART node
 name in device tree
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
X-List-Received-Date: Sun, 11 Aug 2019 08:07:30 -0000

OpenSBI for fu540 does DT fix up (see fu540_modify_dt()) by updating
chosen "stdout-path" to point to "/soc/serial@...", and U-Boot will
use this information to locate the serial node and probe its driver.
However currently we generate the UART node name as "/soc/uart@...",
causing U-Boot fail to find the serial node in DT.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c0b7498..5022b8f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -274,7 +274,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
-    nodename = g_strdup_printf("/soc/uart@%lx",
+    nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
-- 
2.7.4


