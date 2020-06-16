Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkzod-0007Dd-Pu
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jun 2020 20:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jkzoX-00076z-F9; Mon, 15 Jun 2020 20:50:57 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jkzoV-0006Kd-Sm; Mon, 15 Jun 2020 20:50:57 -0400
Received: by mail-pg1-x542.google.com with SMTP id t7so8428659pgt.3;
 Mon, 15 Jun 2020 17:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QY9pGdBoodyuLWvgAtPYSQUKGC728WHZnKf/IZEpuTo=;
 b=dnATSJaxAOjAG4IrUAiAXRRRrIELq610DGPctm7kU1hIlr0BfYI8rjL05bKP7Kgpkp
 2ogu3Jk3trbxebfjfoL8wUVL1mrPdsLSp7BMdF0Gm+K5w9uOtIWWLfbHpR3Obi5CP8rv
 RbXPk7aRCn/lI8pXb3LU90lkADbAfI0aXPU62R+Hpo16+POeRQ3af5XpMTUhCKpjPC75
 SrG8+bLBbXTcb8fpEVWkVemU25E7gHOrvO8eD38hWW/Xxc6i7G9uDKZJq2JjEkDh2M1F
 p7Di3zRjP2GvN09rvXLpmvG1J1CyI5IwC2V+AfJAgMH7cllyUU/BD4+AS2f7sCDtZGlr
 m0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QY9pGdBoodyuLWvgAtPYSQUKGC728WHZnKf/IZEpuTo=;
 b=gouXRwxgn4V0SXrcmBpb6hH/+DnRo/tDVZ83//aEwDw8EnM4qJmrJSvsP6WRtc9rUY
 5AllTDlo1B4kN3On+xWXg+/LUzPUTNCAlJO2Bu7Xt6GSgoLjgLqk6oB4ysLZBTiwUIpi
 +7fIiMYDEHZhGvGxiRy38DsbEw4lW9Wa01XK5Z0QctCingcepa3s+6V2HTq2Z+EWuHJ7
 em/wnsnZ/bcoIq9LddNADjhzVN2HGlijuGisuGjrLtZVhADnK49hVEkCiYjkMAN3/s5e
 qvmOS3NSnx+oUneKdIZ/J/SMXqrOjLe62/qU6bW9azqg/276jLTADHKRCgHrv8ACmglM
 qQ0Q==
X-Gm-Message-State: AOAM531F9fdls8cHiqoIlh5JXWhtYTHvq3DyPi0JU/QF81xuu04lzG0c
 YWzpsWqE5+h1ZfVBFTzG0Ag=
X-Google-Smtp-Source: ABdhPJzS+RgCryDBd6ZjIW0ETfs6wsnPT5erLQwhYSm300Db8soIKyOH+EDuW6+8B2JAVcRvgeGwaQ==
X-Received: by 2002:aa7:8681:: with SMTP id d1mr271973pfo.230.1592268654148;
 Mon, 15 Jun 2020 17:50:54 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id i20sm15210539pfd.81.2020.06.15.17.50.53
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 15 Jun 2020 17:50:53 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 4/5] hw/riscv: sifive_u: Sort the SoC memmap table entries
Date: Mon, 15 Jun 2020 17:50:40 -0700
Message-Id: <1592268641-7478-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
References: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Tue, 16 Jun 2020 00:50:58 -0000

From: Bin Meng <bin.meng@windriver.com>

Move the flash and DRAM to the end of the SoC memmap table.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/riscv/sifive_u.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f64aa52..c94ff6f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -80,10 +80,10 @@ static const struct MemmapEntry {
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_GPIO] =     { 0x10060000,     0x1000 },
     [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
-    [SIFIVE_U_FLASH0] =   { 0x20000000, 0x10000000 },
-    [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x10090000,     0x2000 },
     [SIFIVE_U_GEM_MGMT] = { 0x100a0000,     0x1000 },
+    [SIFIVE_U_FLASH0] =   { 0x20000000, 0x10000000 },
+    [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
 };
 
 #define OTP_SERIAL          1
-- 
2.7.4


