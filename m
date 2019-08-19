Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzZyF-0005UO-A7
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 01:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZy6-0005Gn-9K
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZy4-0008Hj-3A
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:33 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzZxw-0007nu-4P; Mon, 19 Aug 2019 01:12:24 -0400
Received: by mail-pf1-x444.google.com with SMTP id w16so452419pfn.7;
 Sun, 18 Aug 2019 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=VEJB+HxL2ZrMa+PdqWbMrKQ++EGFdXzRJFd60wjp4Xw=;
 b=bkCKGW0002EcdSdhNrnmBn8rPWBa95djQ/Et3RSJgI1u8JTbaUPnLmX98i3WR3W7sZ
 wlq5DYXIiARwF4ucZ2K2Ad5iYKzJIuZTPVcCNLgfDmyslvxj3wE63aWoGKrbxlx0gvuq
 b97GKg9qd15+1DaYBRxOaz0MG9fIuxbRLW3ek3PCcvALjaOjAzlHnbeSLZD0qvGSyO9G
 3dVd6JWazGuqu9mgvkgY7GvREzS/vhQr9y7eGbluX2BZ7P/DzesI2FfNnndF6dBjrzbX
 vUHnagEavWBDnqBruLsXfDX1RSBy/CY+rf3jfAyCF9meOVBzoe7UZLUbOlABcnnhPwXs
 tn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=VEJB+HxL2ZrMa+PdqWbMrKQ++EGFdXzRJFd60wjp4Xw=;
 b=momVPzlCW+SfHYMPb1jYZbgj7D3mbwvBPTNN1chmlyJNzwqcqjD0YjLK+xEIQjZC1x
 +cbPwuvRshr/Jpf2XXs5Anky7M40OmSWEFgraStsDb0VKiKmDCkUYD33TMyKA+MWVP/P
 pYMtKu4Byslk/IzZrXgxoLt6FZD8ooKr4iCsoRcBZLdBJtAZOvPQviQSTHHPL+JTvS/K
 AnQ+jITGAjgZ5HEpyBhl8cnSjln7fZxFnWTFOZUD9XvtICkb+TGCwEtLorRNOjoM9ncO
 q2kv01j2X4qSMbCEaadgt+LR8BbX/lmQ1y9ywle5CSkDCaTUHMXZAacGMCjprIORXV/5
 Ah9g==
X-Gm-Message-State: APjAAAWFjh8BQNC23KXCEMvmxE5SyeeWBs9t7QVnW/iVK97v+G60mhWI
 msstzCEK0Y34s0jvuM1vMCE=
X-Google-Smtp-Source: APXvYqwm3ysD41xzE1AgxVRbYwVna6NwrJFjGev3WtKVA95zx+KN+O2IMiXkkC9hxZ2hwH6vRe4dgg==
X-Received: by 2002:a62:1715:: with SMTP id 21mr22525457pfx.134.1566191543338; 
 Sun, 18 Aug 2019 22:12:23 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q13sm15464986pfl.124.2019.08.18.22.12.22
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 22:12:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 18 Aug 2019 22:11:48 -0700
Message-Id: <1566191521-7820-16-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH v4 15/28] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Mon, 19 Aug 2019 05:12:37 -0000

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v4: None
Changes in v3:
- use management cpu count + 1 for the min_cpus

Changes in v2:
- update the file header to indicate at least 2 harts are created

 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0e5bbe7..a36cd77 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,8 +10,8 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  *
- * This board currently generates devicetree dynamically that indicates at most
- * five harts.
+ * This board currently generates devicetree dynamically that indicates at least
+ * two harts and up to five harts.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -485,6 +485,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
     mc->desc = "RISC-V Board compatible with SiFive U SDK";
     mc->init = riscv_sifive_u_init;
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
+    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
 }
 
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
-- 
2.7.4


