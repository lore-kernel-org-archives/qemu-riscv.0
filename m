Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZLRy-0001ik-FU
	for mharc-qemu-riscv@gnu.org; Mon, 25 Nov 2019 15:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iZLRw-0001iG-4a
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2019 15:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iZLRv-0001ZX-5T
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2019 15:59:12 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iZLRu-0001Yk-Tl
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2019 15:59:11 -0500
Received: by mail-pf1-x442.google.com with SMTP id 193so7952067pfc.13
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2019 12:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/bK3rjKNKAxPCsP91x8nfqOFqkRRa3KADYelkxKxxm8=;
 b=i+owirUQTPxJrd9+0fUTFVpoUAKsugqewqVDo0gtbMZIBA+sDDQVWf4q24gKmAIt8e
 w08KPIQ7Y1ot2s1Bdb3dpVZXYEov4glrKYDDsAkjalUujehGoFYcUAzNf2O2r8SxtsED
 wE4hfQK/G9jjosiayXvNk5LTqlgZw8a8KBL72MFIj6TrOdSeHpBl4PgNkZGUnv/sIEnr
 T6U5TDaquvuvgHoQwIQA6+Sh3Ue7T/x6jwbbXxQHzxhprZh5nw3Sc0d4y7Qox0Vm3TIS
 YMcU16ROv3DrO8A5IrQCVSPPYl77CEezeq0XOOA9gRORS48WAzJzs8q8njgR73db/IED
 RP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/bK3rjKNKAxPCsP91x8nfqOFqkRRa3KADYelkxKxxm8=;
 b=i4xueaYX7b8PwCnLbclz1AQ2vv5nydtUEnhj3aayGoBloZXNMsxYEpeizaPJ+LkSUI
 FPySNx4oJf/fXb0F1L7v5Yblb184UdT+/oaPNPCyuRSMcBcs3Tej0j7pSpbwTnoHZGFd
 1uYnt6KG1MckhNrgavNAF6LlBZkq0oUM6ucE8VQ5ijUmGCyK3lYyCN7Ao1Q4y6YxmW1g
 o8Cdq9i9ARdsCKO2las57IQZaG0MuzV2fO/2gKZT09v5hKnm8SNtleQT7auSYMhwk88N
 DDX8LrBlpF4pVAEnW4BCIwCF8FHHPyCdghhAQ5oWF6kkNENwrw5f+/zygu8r7Rj8TQZK
 bkGw==
X-Gm-Message-State: APjAAAUUZxMyRuXDTLMGYgJ8okxOVGg9IKm6fjQjpR0I5zTUdcXRjFVg
 /kouROw/9RgYp+SmO+og5T9wnQ==
X-Google-Smtp-Source: APXvYqy+/1/lFZlqFY9TM2pPv3FbUx1bg2fi37jika3JVGJwGaa8/0bkAinjRJUWaIfkFiKGY60sRw==
X-Received: by 2002:a65:4085:: with SMTP id t5mr34982101pgp.335.1574715549559; 
 Mon, 25 Nov 2019 12:59:09 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id i123sm9849648pfe.145.2019.11.25.12.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 12:59:09 -0800 (PST)
Subject: [PULL 1/2] RISC-V: virt: This is a "sifive,test1" test finisher
Date: Mon, 25 Nov 2019 12:58:53 -0800
Message-Id: <20191125205854.226672-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191125205854.226672-1-palmerdabbelt@google.com>
References: <20191125205854.226672-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
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
X-List-Received-Date: Mon, 25 Nov 2019 20:59:13 -0000

From: Palmer Dabbelt <palmer@sifive.com>

The test finisher implements the reset command, which means it's a
"sifive,test1" device.  This is a backwards compatible change, so it's
also a "sifive,test0" device.  I copied the odd idiom for adding a
two-string compatible field from the ARM virt board.

Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 23f340df19..74f2dce81c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -359,7 +359,10 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     nodename = g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
+    {
+        const char compat[] = "sifive,test1\0sifive,test0";
+        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
+    }
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
-- 
2.24.0.432.g9d3f5f5b63-goog


