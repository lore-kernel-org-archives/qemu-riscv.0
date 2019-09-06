Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Gyr-0004pO-H7
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gyh-0004eM-G0
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gyf-0004VN-I2
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:51 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6Gya-0004Qp-Tg; Fri, 06 Sep 2019 12:20:45 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w22so4820526pfi.9;
 Fri, 06 Sep 2019 09:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Cylafmwj1XEvENZAZffSqGpBHi9I3XNarRlDliw8g+w=;
 b=Lb7Ig0JCgFb2gf8MbiWJfNeKKZWIWtFxshtKIjWDjDou8mcQErH+E7Q+Xpc0tsFR8b
 UEsiXeQmjYNpHZraMDuipzamMxorBQfigqqtSE7l2gx9SADmMqxHnBaXSrmu2vAcp478
 LYLjufssaljmyAaIW3XGdo2R8cimXJmwdljwgkYuH0smsFby5fFrVDLw+X1IoN4M8Tny
 tqF3LF0Hsr9f4xe2ODgK1Irew+Fi/IhsB0EzQ3zfe4hTJpwGYZWFKfCMlWHhFLqsc9Ib
 js1xcH4ut9xfuzTlCCpQ4wG8yM5Aq/zsrccdNh9sr0tWHJteTK9JtaUU9rXIUCL8vNPs
 RSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Cylafmwj1XEvENZAZffSqGpBHi9I3XNarRlDliw8g+w=;
 b=jLNbXBi8OdM2T9HwUC8N0gLp3GkNeVw+UeXRNJfW7czrmSdyAXbNNlT9yMqDWRhv8t
 lHQaHvbKcvJQt2vFdZqDXj0IZzOiWahYAFEbNW7wc0SOCFqRWBJpPGDOQfknbnFsj55d
 O+yD7V2hJuxJJz0VTN1VGTri1Qx4Ax4OBTeqJxbzyJXsXukAocPGkZ52ztnVKYV4mkm6
 aAsx/rOmPJ3WW9czC/DBmhzvEcGiVc0zXxW8gb8ifiFh52dy/qGnkQh0SqJ2yjVeA6uK
 I11raleGnq9tR/lrUyxQbZJusVySjr0SGSScKl+KNtIyFrnUqPsm19Hso7/7L0KfBz2/
 FtzA==
X-Gm-Message-State: APjAAAXMZ9Wx9w/N+ibRXcSRgSgLcQvBfdL4JvUBmsudu2qGIDcs/4Am
 b7hfD9rtZICwd9sPFRXNCGkObUeY
X-Google-Smtp-Source: APXvYqwiA1Wq76fdIB2yT/alUqnhtuDOyJxtCNfjTAwOyaAcwbYnTZ6F/IGy72J7KHJTCoZcCQdxIw==
X-Received: by 2002:a17:90a:2525:: with SMTP id
 j34mr10910068pje.11.1567786843946; 
 Fri, 06 Sep 2019 09:20:43 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.42
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:20:05 -0700
Message-Id: <1567786819-22142-19-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42f
Subject: [Qemu-riscv] [PATCH v8 18/32] riscv: sifive_u: Set the minimum
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
X-List-Received-Date: Fri, 06 Sep 2019 16:20:54 -0000

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v8: None
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
index 2947e06..2023b71 100644
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
index f25bad8..6d22741 100644
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
2.7.4


