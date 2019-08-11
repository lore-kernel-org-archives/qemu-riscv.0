Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwit7-0006pD-UT
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 04:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwit5-0006gg-Hj
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwit4-00047U-Kw
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 04:07:35 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36299)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwit2-00045Y-KD; Sun, 11 Aug 2019 04:07:32 -0400
Received: by mail-pf1-x442.google.com with SMTP id r7so48245543pfl.3;
 Sun, 11 Aug 2019 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=EvhVZdHb2hebBUuM2+1LwSpIfoOPqSDNrj4o6ITuFwg=;
 b=nPNwMQtwSnxqESDNDJi64+FVKMNwQ534K71jEShF6vqNetAOGYh84xboTYjuRh5tAX
 VH4fWPYqBr/Ah/f730XH9fF0ks8TEmgkn1nAZp+TES+tolb7w+vlGfsEbJx33T2nREO7
 nV6Kf/4OLf2cc/3/3P0hScSwj5Gmf0+1ZhD9gPA0ihaCkg4JnqEO+Nq8uFB8yrBMRcuS
 MHHOXSmaB7f9497Ns7XpRNmQiHzMOKQyGmWU1oiHSqqX+laG3T3G52Btcp5tI5krh7P9
 fRgjzznyMkd21JHLLUJF68il/sdz5LMgOMWVroZjXW0ZLN4N2/pik5GE9G6ps5ZOGcbs
 YpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=EvhVZdHb2hebBUuM2+1LwSpIfoOPqSDNrj4o6ITuFwg=;
 b=a5nqv6o8udgd5/3pWNVNVw9gy2xMB6d2l2vpP5IGAOYvltNFeZTJ/LzoweAdRJUkiv
 /9sGS1iD2z2zsckK35rbrCDIA3yWbgWfYxCk24HEu8N8vaMN7cPWOrhcCN5i2by88eBq
 fRlSIyKnlMqUcvkszA7GadMIcCMnTx+VNeKWnZvE0eq/eRnGTJg1279ZF54gjBAHb6MQ
 qihPF0+uaSffnM3Llm30XkP8LF0cLV+8U91+bXf4/TzgbSArEmUi0IlAzsIVpqjn+hqk
 4Sy2k0ybdPSKkjE+UkK/O7IT76TPaxYxZxntt7ZCTefnHJX8wNsSfkdNSgV8/dCO8beD
 mZKQ==
X-Gm-Message-State: APjAAAUxreiu/DH8+BlCuy5s/jgWZpjPIa9QmVYsXFBoPU3kD2boKFsV
 sQ+soBYCiEUz6nWubg4jAEo4FP61
X-Google-Smtp-Source: APXvYqxSvQWUMfk2gVubQ3yWkWGe8pVd1zZzU9waxR9j4DqSkLTIkWhaEFDxhPDCJwFoYMjK0bvJtg==
X-Received: by 2002:a63:62c6:: with SMTP id
 w189mr25059280pgb.312.1565510851794; 
 Sun, 11 Aug 2019 01:07:31 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v8sm87339107pgs.82.2019.08.11.01.07.30
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Aug 2019 01:07:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 11 Aug 2019 01:06:55 -0700
Message-Id: <1565510821-3927-23-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v3 22/28] riscv: sifive_u: Generate an aliases
 node in the device tree
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
X-List-Received-Date: Sun, 11 Aug 2019 08:07:36 -0000

The Linux kernel SiFive UART driver expects an aliases node to be
present in the device tree, from which the driver extracts the port
number from "serial#" in the aliases node.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7eb2b7e..0c1a89f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -284,6 +284,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     if (cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
+    qemu_fdt_add_subnode(fdt, "/aliases");
+    qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
     g_free(nodename);
 }
 
-- 
2.7.4


