Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwJ-0008IG-K6
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwF-0008A7-57
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwD-0006mC-T4
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:18 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:46451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwD-0006lf-M3
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:17 -0400
Received: by mail-wr1-f50.google.com with SMTP id d17so10679038wrq.13
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=6LjmDeAL87SuuDyQOaR6PZ+xifwSg2XG2OmboMVgOmA=;
 b=BGrI92G5sJhY/+4dleEabFk9nUGQu0vXB28Yfmwv/T0eGCF2+/lkZcnTcDouDbZ5Ww
 fB1RF39Z/sJ9M1arnBq6blQGx8FJiuyWLEj9iEjX8BNa0BskJdMewjcumwTwzSAQwb2N
 feWdOTNv65dFZCUeOqsU/lUoGYPuDz1hgv7QVi7BSfBKRn+5oq7WBZSzuTxUv2J1kDVW
 ukj0XaKJZsbEo9Ac+fjN75Ih7w/5ALP7IaVhAietctQ/m8BhuHqSGYHq0V6YO5f37oS1
 Ryg3fSHBSQwe4ovo6goAZwHJJ5+3dc43jzFOnQXDi4+bPvz249tCvy/d/mpJ1ruFGFFC
 pUqw==
X-Gm-Message-State: APjAAAWx72kusbhOsMxSZvMx78r+Y3kiT0CVwCEwto3tNYhaItyn/+hR
 OK/xSYvWsRJkPI0UFKlfbWhk2zZuzEdZug==
X-Google-Smtp-Source: APXvYqwSAcKIV2uCiMe0h9HmJm5ElS3T4uW1tcvOg//FCCZ/fyK7onWOhURLE8wWf1Gj30Z/BJDGow==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr4086064wru.116.1568190316211; 
 Wed, 11 Sep 2019 01:25:16 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id v4sm31601269wrg.56.2019.09.11.01.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:15 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:56 -0700
Message-Id: <20190910190513.21160-31-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.50
Subject: [Qemu-riscv] [PULL 30/47] riscv: sifive_u: Set the minimum number
 of cpus to 2
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:22 -0000

From: Bin Meng <bmeng.cn@gmail.com>

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 4 +++-
 include/hw/riscv/sifive_u.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2947e06f71..2023b71d53 100644
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
index f25bad8f13..6d227410f8 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -69,6 +69,8 @@ enum {
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
 
+#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
+
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-- 
2.21.0


