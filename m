Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pd-0005K6-2q
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7PX-0005Am-AR
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7PW-0003ov-1E
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:27 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39568)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7PV-0003oU-Ri
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id p12so7161705pgn.6
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Wcazrf1d/6yq7xUtsUWqMfgOcS0Og4vhQQt08gFl/0k=;
 b=E7Bv8nszzqYRNDu0wJ0GehmOgmGOZ507uv3L5jUofx2a4PCFKaGL3TujuL514uP+Hm
 Y6gzyVya/vUMm6W0Ch8YvQ/vQN9j1ohUh7PWzWNtXiJL+9pMTe6L/ivadbZtAT7ArOkB
 RPoPhI5QBudqISQNA7euZOlodKygmOZEdSS8ckPKW4lkaQPn7K/c3ygP1tU700ZUQdYK
 0C90H+hghYx/5YxFY2J2fBxW47B6pnTjCKa+/tmwvES5sQN5NgrVZvzq0ErHQlqvm8Ei
 dtZiTbgNGPAFzS9YTMg9PJtbehEy+l29v+9Y0xnE797RaI1lHnIFMcwbj4e5mJ1KiSzP
 9uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Wcazrf1d/6yq7xUtsUWqMfgOcS0Og4vhQQt08gFl/0k=;
 b=cJjZy8FDnY6aN5XdBUu/XvCi1Rdpcq17CFpYScxgzZ8UbyeMMY2Wrnor+H2vMLDAlu
 sMvRNik62lkhxDzqJ0Pp2rZsJGlYMMY34FIZk14pwUXLyWkTQ+pALIb93p9EPkgl7GTn
 36Fdoy4mg7JmDb5JJwuYO7qIPBGTFxGl8fKX0x1Ol3+VP6negVz01f3ww8JABp73bi2n
 oabFxaA1ZtpSvo1g9cdNpm/xxDyV5pZXyHGcnJdn0rTpSRYsuNffxwvi5+v3593Vs1Mq
 atBhg5ftR/Z1IlvO7awOplzDmV8GLBQVa8Wix/OL90EBjy/f/5684QBhfnCY7nq4hb5p
 tj0g==
X-Gm-Message-State: APjAAAWjE30P9Lq+tmXzKnrcM0zGuxbIlPRO7v0IiYCikGKqJz12f8Ut
 /HgFTCtZQxlauXMofQCoa9DfWg==
X-Google-Smtp-Source: APXvYqzmrhPmJxA2AbMG1Lt+nDArHSJ0TD1DWwygocl6qh3nZ3wzPD1OQN2Rae9luzF5CgsarQ650A==
X-Received: by 2002:aa7:80c6:: with SMTP id a6mr20617068pfn.89.1572278304867; 
 Mon, 28 Oct 2019 08:58:24 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i123sm13313009pfe.145.2019.10.28.08.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:24 -0700 (PDT)
Subject: [PULL 05/18] riscv: sifive_u: Add ethernet0 to the aliases node
Date: Mon, 28 Oct 2019 08:48:49 -0700
Message-Id: <20191028154902.32491-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:31 -0000

From: Bin Meng <bmeng.cn@gmail.com>

U-Boot expects this alias to be in place in order to fix up the mac
address of the ethernet node.

This is to keep in sync with Linux kernel commit below:
https://patchwork.kernel.org/patch/11133033/

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 02dd76176e..1ac51e3632 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -270,6 +270,10 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
+
+    qemu_fdt_add_subnode(fdt, "/aliases");
+    qemu_fdt_setprop_string(fdt, "/aliases", "ethernet0", nodename);
+
     g_free(nodename);
 
     nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
@@ -297,7 +301,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 
-    qemu_fdt_add_subnode(fdt, "/aliases");
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
 
     g_free(nodename);
-- 
2.21.0


