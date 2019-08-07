Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGeI-0001ih-CC
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37051)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGe6-0001eI-Cg
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGe5-0008K6-Ev
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:46:06 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38297)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGe2-0008I1-MO; Wed, 07 Aug 2019 03:46:02 -0400
Received: by mail-pl1-x644.google.com with SMTP id m12so874973plt.5;
 Wed, 07 Aug 2019 00:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=f6T919n+SeWrGFMjenG5tGNknymIFfYMfO7/05KZX6A=;
 b=UAq/6xGLb1pe/EONZxRdIMc2BsFb6/7fQI3Z2dWP70Rz3xz8DVr/NoMhKIE3zpSTZs
 4NjWvhiDKJQBUBvIEcqCInySDTMUVKT2u3QvxzVlmnlc6ACMT1M+j6xJGJGx1KvPMXAD
 zEHRsxryO5jBlk1bhjKeb1QFJLI7qfJ/bJSonOk01yz6nXarI95Pdn7qGsG39xx87C3B
 x+cL7Daq+6DhQlPuVSm1eV0JL9dQgOJvQwjYpmXYjGjErlqwz9r2X9XnUgOBiny6amwP
 889iyxg3OMvvKQahWfo84z1I1QLSgq3YRmGuVabD44Prq6BzR/Ca7KzLX/Lrd2apfsaP
 AJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=f6T919n+SeWrGFMjenG5tGNknymIFfYMfO7/05KZX6A=;
 b=A2OIsLgVIMty6ld59tdxYQE/Tf9Pp1fI+nHzLztCBLC2YG0spLuuT/Elqxvwuou4Bf
 KlF1dFdcZaZwnKlIYrR9U7spQHYCBU7JrtO5PmRgFnweCW3Ex+JzINyTJGMjL4EsYOXW
 lXtYYx0l7KDNqrj7fMUBrLGliEwO4Zt+Ry/4Kuhm/3itF6IbXZowy+1bIos5vPCkDDTM
 jo3Btp3+A7XRaILV6zeZROKKYFML/BXMngMPdgQcD/qe1jtYdwtD5fSCSv+zRehsY4dr
 RMHrIHSdgFpOhcoZoPZgJCf4slX4/qYv/oo+hzVAb1TxK8JWupdYu+EBWFbaHA/j0p3g
 Lb2w==
X-Gm-Message-State: APjAAAX0O1U+TDi73tJh6BqQ2xL1Lm8VjT9BSbfJnOz/KgVsfSlPTc+I
 n+pIO0MHjnhI8lqmUChlgvE=
X-Google-Smtp-Source: APXvYqxoYPSkhJlaWtwrpB+Nrkk8A9r+dw1ES/xRZtuV3URaucewfYmQnINIh84Y36qYSws68Na6Ig==
X-Received: by 2002:a17:902:2ec5:: with SMTP id
 r63mr6912961plb.21.1565163961973; 
 Wed, 07 Aug 2019 00:46:01 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.46.00
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:46:01 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:24 -0700
Message-Id: <1565163924-18621-29-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH v2 28/28] riscv: sifive_u: Update model and
 compatible strings in device tree
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
X-List-Received-Date: Wed, 07 Aug 2019 07:46:08 -0000

This updates model and compatible strings to use the same strings
as used in the Linux kernel device tree (hifive-unleashed-a00.dts).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2: None

 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d7a4aae..48078f1 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -96,8 +96,9 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         exit(1);
     }
 
-    qemu_fdt_setprop_string(fdt, "/", "model", "ucbbar,spike-bare,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "ucbbar,spike-bare-dev");
+    qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
+    qemu_fdt_setprop_string(fdt, "/", "compatible",
+                            "sifive,hifive-unleashed-a00");
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
 
-- 
2.7.4


