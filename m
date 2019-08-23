Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i11rU-0004NX-LN
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 01:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rQ-0004IP-MI
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rO-0002h2-Jo
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:40 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11rM-0002eI-3e; Fri, 23 Aug 2019 01:11:36 -0400
Received: by mail-pg1-x542.google.com with SMTP id n9so5100817pgc.1;
 Thu, 22 Aug 2019 22:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=w3+CZBUY4GZi4/tMEq4QSlu25Shg1y3L2OpYpI0AQag=;
 b=kFX1hSq59UN7lx+v0cz6IRqC995/M/TlwDljLecVXVU479focWWtCEhNxgs72/o9a0
 z3Hpglu/KOCHqW9PyzCZrOBVOarGM0eJ1Fz3DKTSGgQJdZIlb3BVAu0O8ZcpPFXZHmOn
 EZrvHC0TAUnAcq2U4u6AdFBvNvvoaz11fvn71nW4yi73ir7i9JIG1YmDN072xuTeSNEk
 0Yu02xx8NXzWVdrjAX8XR5Y3UJOx5oQuuWuPdbxXmBb3lVHkYPDCfWFBAmdywm2+BInB
 WIz3Fz8PuJUg/gkEO0YPgTPpX5fkWUohSMOE/VeZrtLivzrw6ayyxYDkc+7wbv9Ic0+o
 tqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=w3+CZBUY4GZi4/tMEq4QSlu25Shg1y3L2OpYpI0AQag=;
 b=Bvm/tpoUR5wa2fBYtgU8Zl9ebblJwm5Zb/dBk6vvX1qWVX4yAhxNN6c1DeIdGCjiw7
 R9g7mIfMLVWrixcOEIpJwhXz2RG0NonkxDymOg3YVGZ/8J2ErpyltK7ZwKih1HdC7m7U
 mhyPj/jnJkaRof1Bo81rQjQxv1wSRsckyOL91hmxRiEBlUJtxrbQ1HVHNaev069dHpKm
 fRC0zS6uljfVFKAzrFMoQMhwZFWVtKjJuZHcSPbq95puQuB6YK4AFcx/KwWOHkzSf+/t
 ZgT4u257wcjOTlj+rKg50xUg7N6lIsquu+8BJ9cIA7dhEuld71IwAUyf5BJNWi743I9W
 4mPg==
X-Gm-Message-State: APjAAAWxttn+QiPi28lFFi4HQGt8phdGPHRelNk2Ybr2tt3l6IeXJkzq
 cmh/zEdwuLweANXGXYO5DtA=
X-Google-Smtp-Source: APXvYqyhhEseIuN1ApAxR1RNODlzhF1gc6vMKnKZnYRtDQk7SGcCfx9mwmfjpVQztNQbk9kPViusCQ==
X-Received: by 2002:a17:90a:dc82:: with SMTP id
 j2mr3370273pjv.89.1566537095317; 
 Thu, 22 Aug 2019 22:11:35 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.34
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:10:56 -0700
Message-Id: <1566537069-22741-18-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH v5 17/30] riscv: sifive_u: Set the minimum
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
X-List-Received-Date: Fri, 23 Aug 2019 05:11:42 -0000

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v5: None
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


