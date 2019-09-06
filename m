Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Gyw-0004wk-Dw
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gys-0004qx-82
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gyp-0004b9-Ec
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:21:01 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42160)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6Gyi-0004Ww-PY; Fri, 06 Sep 2019 12:20:52 -0400
Received: by mail-pf1-x442.google.com with SMTP id w22so4820770pfi.9;
 Fri, 06 Sep 2019 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=PnrelrKJNyAA40BYppo2f/3YgQsXtxmBHhSk1SaPVOg=;
 b=FzWXqV75MSCBn/2EqbsRNRmnZS90AtxrMWzoDSX6p5lvD0d6ZY5Sfp3F7j8WRRmjVK
 IWTXiuKBwHVQl+aF879/vYj1qMw42FCmyXQtIhsccb1jVn2+HuuVGzpuutFPyjsRKFjA
 cOoEZkWuOfBLaDWL8UpL1MWtJabD2IgF9ooWeqSMYIXb1lnu6X9br8Yyd4bQvAL7KUxV
 6+JuzO/jcp72o2rl2VDsOpCk9/bOD/u9fMU5ajHJv2yeBweIP49eOObttPkLjZIbOz5C
 UfUkrPqA5OSNtNlY5HZOYJdXQk370DwyKZ948v+7IEnJgeZeCFFJatZM5G6l6sohT51B
 8jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=PnrelrKJNyAA40BYppo2f/3YgQsXtxmBHhSk1SaPVOg=;
 b=RT6jrZj0XRUIN0LoXx3VEgoJ0IqCnp5mx5PH2Auw0zHntWIbMN4NHICojd5o8RKjN7
 gZBqw+QtN/6e1rxiji3TAEnDQ7PAMqS2MPVoQrPlCzQfsdsW9f6gDxKVY8FuQbuvyupd
 xBr+KZcrusl8r0zCScuopmvGNlxFBV6JOLUvH06UU1+/lsZJLaMFs0+ghttAouokTvkq
 shKFIWVr/uMqtniqjV8ohMN3YdJpXiVX/JH211rfFmuxVQtG8i7pPBQH3OHoi4zxxmOf
 iuTtRL620tW4ylp3RBkG0pb6PHRxkyS5WnNFCJImLg3Dl1LMF/DrSxlGhfAv9LQk5dVU
 B8Jg==
X-Gm-Message-State: APjAAAUnqdFPe+eUE4Ex1g7CY9Oi9b1rdlmjG9F1BgYc5UPZtJtvj49s
 t/3hYyN98RmhUraaU25WAxc=
X-Google-Smtp-Source: APXvYqwbmUObw0dlWcrCj1ZiXzI7mEEba6uOnp0YXqsG1XuxaYiAwpe/EsUe+cm5EL2UHaIrkxdZyA==
X-Received: by 2002:a63:194f:: with SMTP id 15mr8854137pgz.382.1567786851660; 
 Fri, 06 Sep 2019 09:20:51 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:20:13 -0700
Message-Id: <1567786819-22142-27-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v8 26/32] riscv: sifive_u: Change UART node
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
X-List-Received-Date: Fri, 06 Sep 2019 16:21:05 -0000

OpenSBI for fu540 does DT fix up (see fu540_modify_dt()) by updating
chosen "stdout-path" to point to "/soc/serial@...", and U-Boot will
use this information to locate the serial node and probe its driver.
However currently we generate the UART node name as "/soc/uart@...",
causing U-Boot fail to find the serial node in DT.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a3ee1ec..5ca3793 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -286,7 +286,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uartclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
-    nodename = g_strdup_printf("/soc/uart@%lx",
+    nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
-- 
2.7.4


