Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iTAFJ-0000Ir-0t
	for mharc-qemu-riscv@gnu.org; Fri, 08 Nov 2019 14:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iTAFE-0000Cm-H4
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iTAFD-00065E-CU
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:32 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iTAFD-00064s-7P
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:31 -0500
Received: by mail-pf1-x443.google.com with SMTP id n13so5341769pff.1
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2019 11:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=tM4Fro2TVwkO5f8g7B2j9ujSbXOxCnayqaeFwddAub0=;
 b=YVUh2sWqTpEsCPUFUfc7lHA6DqDheheDlRXwy4adX+zaiGg5E35gi4DvX317kmuZ3F
 uzd1E0aMootYzW3hWBEz7NPfcPbjHrFUtxVsAYYJ28+wic/rdrbMKGVASUePI4myZzsq
 OceIEvUgvxZQ2B+eJoQpPfqkBksqyVt0UFlk81sOefbOCi9WQa8VzUyEXWD8njikPa0Q
 KSKVlqoMzufrm2EdbdZSrhuzfz6EOslTTAn6DEJpYU4wz0+8Qowxd9CXTojwr6Owscuq
 RqykuOXIoEtGEdlg2caWy62iH+cBBM6wBRrr//hnkQ8wUV7re69agX1oN1y+qGHJPyn9
 N8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tM4Fro2TVwkO5f8g7B2j9ujSbXOxCnayqaeFwddAub0=;
 b=TBki/AAdoZszDFVwhKtu1KnW3f4+pFYySKNzdKPW1/PzIDZEaGWZw6tpmhqbX8HNgc
 BdtSR8R35knM/8pxuAjTwkXkb64d0CXxJVQdTVcfqwMZfLI6f79JFDxrQ1t3UKwPrLgP
 L4UrgCaR3MDGu9VtEfjulv3uoZ7pa17sXh9x/4bt1DMp2pJ2GOoUGn0kXz/apv3oK5by
 gsH3hli+WWgPpXw06TEESEMjsXswRVR2RJ/cnKELYZa4GmBp1Z78nCBBr+YGvG/lmK2r
 TssVVpB6e7sQthC4wj1UtrcLIDdpmEIPgr8nfdx/qRmluBak9Eu0oreHNOwL7taNkK06
 GHhw==
X-Gm-Message-State: APjAAAXaUcRkY98hp9nkVJte6ykH3JrpgiQiAeSsGVkT8Iw1MtHvQxT4
 OPhooPPUwf4mKk423CQgRdATmIZJ38M=
X-Google-Smtp-Source: APXvYqyrGOnLuRk4FgFZpne9bF6/pVqmwaDHEIfbSixB8zyzH8jvZtKCG8KIWTfttqaah879NKq8uw==
X-Received: by 2002:a63:f513:: with SMTP id w19mr13779501pgh.55.1573242509630; 
 Fri, 08 Nov 2019 11:48:29 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f13sm10128262pfa.57.2019.11.08.11.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 11:48:29 -0800 (PST)
Subject: [PATCH v2 3/3] RISC-V: virt: This is a "sifive,test1" test finisher
Date: Fri,  8 Nov 2019 11:47:58 -0800
Message-Id: <20191108194758.17813-4-palmer@dabbelt.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191108194758.17813-1-palmer@dabbelt.com>
References: <20191108194758.17813-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Fri, 08 Nov 2019 19:48:35 -0000

The test finisher implements the reset command, which means it's a
"sifive,test1" device.  This is a backwards compatible change, so it's
also a "sifive,test0" device.

Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 23f340df19..65ad725920 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -359,7 +359,8 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     nodename = g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
+    qemu_fdt_setprop_strings(fdt, nodename, "compatible",
+                             "sifive,test1\0sifive,test0\0");
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
-- 
2.21.0


