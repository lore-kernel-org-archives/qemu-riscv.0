Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwL-0008MJ-TT
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwH-0008EA-RL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwG-0006nh-Mc
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:21 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:50423)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwG-0006nR-Gh
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:20 -0400
Received: by mail-wm1-f47.google.com with SMTP id c10so2328086wmc.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Yjyg0NrpwLuGQ7qLdff8UjTsM3h30sEKXkKsPatOXKo=;
 b=tcK5hQUUrehMMq01MpklHpNhVg7JGS7SghoO4BzfkYnNHJ1wABC0+3DAraxjECQk02
 5UmUpHwHnUkkA6w1xZYWQPFG+yGsWTDU6V6iZ9rzgE88/+yxhT+Kvgo1VNnnIyrg1lci
 wYQJTiqcXgdjwZ3ezz2sSacbRpZbKk80TnvQBPmAX0lW3tYEy5oGo9XYh/QiVLue4jgv
 2CcJj0YhJtoFnNaWEK+zsrugi7do/Spv/Yk7RsSy2qsty9+pM1Xuul0cMIKlEkFvr8BJ
 kEt4QlcWTnhIydIgiqx46gRH9UPMVyXIJ3zNZAhJ7glxsKMy5YTR30fybC+WIaM8R7h5
 HABw==
X-Gm-Message-State: APjAAAXXuBNAlM19QQZ2cXTZ5WhCsWPz040cIpaDsBPB5YAdKoJ+HbcM
 HbGfkHuR65wLOkySmiEC8B22igQRXYaD0A==
X-Google-Smtp-Source: APXvYqxjte6I1fhTeD+leFOMvbhhk0FJg/VwPum7J3VLU8rNMdiEimmHjtL8F2+ChG1EjBK3XU/UaQ==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr2837886wmd.102.1568190319132; 
 Wed, 11 Sep 2019 01:25:19 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id v4sm31601457wrg.56.2019.09.11.01.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:18 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:58 -0700
Message-Id: <20190910190513.21160-33-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.47
Subject: [Qemu-riscv] [PULL 32/47] riscv: sifive_u: Update PLIC hart
 topology configuration string
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:24 -0000

From: Bin Meng <bmeng.cn@gmail.com>

With heterogeneous harts config, the PLIC hart topology configuration
string are "M,MS,.." because of the monitor hart #0.

Suggested-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6c4634dcac..713c451e85 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -424,10 +424,11 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     plic_hart_config = g_malloc0(plic_hart_config_len);
     for (i = 0; i < ms->smp.cpus; i++) {
         if (i != 0) {
-            strncat(plic_hart_config, ",", plic_hart_config_len);
+            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
+                    plic_hart_config_len);
+        } else {
+            strncat(plic_hart_config, "M", plic_hart_config_len);
         }
-        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
-                plic_hart_config_len);
         plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
     }
 
-- 
2.21.0


