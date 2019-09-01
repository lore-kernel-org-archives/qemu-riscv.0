Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4G05-00081U-CJ
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzt-0007kG-EI
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzs-0006n0-9T
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:45 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzl-0006Z1-3D; Sat, 31 Aug 2019 22:53:38 -0400
Received: by mail-pf1-x441.google.com with SMTP id 26so4563397pfp.9;
 Sat, 31 Aug 2019 19:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=UM+Y7KDLzrYTrBk4xhqiDKoDDPO9EnMtwCiqmXP8L+I=;
 b=AZJOoEmD0DE8rVsQPM+Wouwynw8xPiad1jt3NbNulX9XJ/669cQFi7GPo0VX21pxrG
 VMUA2rNlFYGMo/O2EVsu/SdeOiZzC0u99zj8gZHXwk/pOxBTPFk0FLohFH1egiHpsDH/
 EBEzhdJPwa0hLl214hNr8TpifZHe7LKKugyKfMBFrPCvIf1spv8UNLGrZTmAsVSECWEc
 kIpZ9LGpugsQPB+DSXt/Fhl93fe5ZrtkB5VIG6unremn8iLLOQihxIoWGuq/W9iQAAip
 uTAAWFdSr83L+gD+BybGN3g19lbg53+bCLk89xcZxfOiQDypa5OAt58IndPRZ4OtH8Yx
 t0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=UM+Y7KDLzrYTrBk4xhqiDKoDDPO9EnMtwCiqmXP8L+I=;
 b=owBiQewBLHNyNZXesRFiyABPpHWBywIvICjChcyMpsYZsq43lnyJ4Jk011UHPnam2w
 mSrfphQ4LnWc87izk1qP9N7Oibxnv4S3h2F5ZNRB9vMBXb4ZF4TGRdQ8gy4qpwJakfHv
 scoqMdDm10yQ30HW5LBcb1GNo/RU9BXZmcGFTkDn3a9ety3OAvR0HS88rWEFOtbymMTE
 hF8L5cR7q+gGUVsTHanvYpM++ctyeryU6TZAVMBjAXeXJwrZWvSnXyv4kAzYBl1D1IBV
 cOOqwslKzxTNO0A1i/jQ6lF4WSYWhichkzoEZwcEsKwSmqpdOR0BGJWDBLh2cxQEzWNv
 ApPQ==
X-Gm-Message-State: APjAAAVV7HWBjtPj3slau0XPwt1GE7wtnS8rSPvTvaK20WwYvuNE1Mgk
 M/AvIEwsySctrJSFgkPKzRw=
X-Google-Smtp-Source: APXvYqzL6uJ8DVN39RWoZzi89h1ABF9kYIveRrvaRboz1b+214hgzJK/9tT8u8wpVxJuZrqXeeE8bQ==
X-Received: by 2002:a65:640d:: with SMTP id a13mr19253235pgv.256.1567306416267; 
 Sat, 31 Aug 2019 19:53:36 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.35
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:57 -0700
Message-Id: <1567306391-2682-17-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PATCH v7 16/30] riscv: sifive_u: Set the minimum
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:50 -0000

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- use management cpu count + 1 for the min_cpus

Changes in v2:
- update the file header to indicate at least 2 harts are created

 hw/riscv/sifive_u.c         | 4 +++-
 include/hw/riscv/sifive_u.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3f58f61..67b503a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,7 +10,8 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  *
- * This board currently uses a hardcoded devicetree that indicates one hart.
+ * This board currently generates devicetree dynamically that indicates at least
+ * two harts.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -433,6 +434,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
      * management CPU.
      */
     mc->max_cpus = 4;
+    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
 }
 
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 4abc621..32d680c 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -68,6 +68,8 @@ enum {
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
+#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
+
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-- 
2.7.4


