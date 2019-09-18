Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsl-0007cB-FA
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsc-0007Nq-3f
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsa-0006xP-Q1
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:29 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:37951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsa-0006wl-KI
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:28 -0400
Received: by mail-pf1-f170.google.com with SMTP id h195so207083pfe.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/slVi5LkPf35jqkW3jrcMeEbGR/Vs94NBRRu6ouuKKk=;
 b=GRMKDvMK9nl7A1TM04BJs0X8jG0nqSQXQy/u+YUYSyYguFHC7qxm4MP7oEkYBbk6ZK
 Rt3ijrbW1JdaP+JAlQk87sMagXJaRcfz9fAvetft6rvaOEvcl2a+Urj53knbH2CuuvKg
 vYKof6GeOtdarujTg6z++xfxlb9eoQ9ffb7zdH1ROszGEo4jTTM9JHTb+wtzaUnbz+al
 d1XpeUBqxKBX6jmw4aWVcEE6ybT4DLN4NggG+ckG7Kd4tmOB0Zmww/05c6zQLbWOpIfN
 85LdkcES7vrzrjoehiiJqk87EtoXU90qO0/RG8IjKnmqqIIbQEDPOWdou/oDPQCu2Nrv
 KAnQ==
X-Gm-Message-State: APjAAAWje+zi79avoVfrZr+QrY/JxA+OUZko9YLSJNjH97T6Pdf54N4z
 S6JXP3Id/CFc57l1919jMvOhIFeFhu4=
X-Google-Smtp-Source: APXvYqxeDww68b1Woksa4lrq/D6H18nuAMHfkcgWd8O3k7XanZa+HbaCXhG238lYXiKYQepDD727Pw==
X-Received: by 2002:a62:d45a:: with SMTP id u26mr4883586pfl.137.1568820507242; 
 Wed, 18 Sep 2019 08:28:27 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p190sm7653671pfb.160.2019.09.18.08.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:26 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:22 -0700
Message-Id: <20190918145640.17349-31-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.170
Subject: [Qemu-riscv] [PULL 30/48] riscv: sifive_u: Set the minimum number
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:33 -0000

From: Bin Meng <bmeng.cn@gmail.com>

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[Palmer: Set default CPUs to 2]
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 5 ++++-
 include/hw/riscv/sifive_u.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2947e06f71..feee21e42a 100644
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
@@ -433,6 +434,8 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
      * management CPU.
      */
     mc->max_cpus = 4;
+    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
+    mc->default_cpus = mc->min_cpus;
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


