Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4G03-0007zB-RW
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzt-0007kU-R5
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzs-0006nM-C4
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:45 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39640)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzo-0006ce-7K; Sat, 31 Aug 2019 22:53:40 -0400
Received: by mail-pl1-x644.google.com with SMTP id az1so4093015plb.6;
 Sat, 31 Aug 2019 19:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=ym9v0ZaJHljMquLkFK5t7+JSLLStHTc8XRWOzIEPBUw=;
 b=JM3jTu3lKnuDUopRASdX2GT9GMeLiuuT8av8lXkmx4t/qnwEHp9/NCVAQ5lv0DlqTP
 FiH0MrbpBXV2LLkkyMnAL1uSSQkJHkB/67X07E9j/LyNx6wZyN8zOIGmPFPC+lzVXFOk
 cxoPvShs+pinNkU2GY6D5P6mt982kcxEEvKirX6qtCG7lffOpGCJPHVKt9b0mL1OLJg8
 5sCzd+4jdyaEWlVestsjVcS9ogEyW5F1g1VXBv09R/KT9GHNSG6I7UNKGu3o6U/qcMoj
 YGCpPVTXkyzFI7O7MUrGvIyBBbKpA/s7aq+7LrNBkCYyMeFMq2BNNPhLZXDsoloAtrjF
 RxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=ym9v0ZaJHljMquLkFK5t7+JSLLStHTc8XRWOzIEPBUw=;
 b=Zq+OgCZ0o8k1QBoqGbUdvFGSncg00im/6eg+ry0TgunjvvZ+zBGY604tYUktRoO6kf
 YMdw6yQ/hjrkETEsro3LywTagzQbauSMczEI13bRyoS03sducS5UXlzjvYhrh/Ci6cRc
 wMIHenky/VLw++QHc5oGJCCYx/cMP/DkOPtaIKQtU5cLPtsZH2AhqGTuReHK6UshaITv
 jsCJ+VlHQjjy7hdtjzLNZxppNiWeraO5owFi7tUh37fZxlaEvrBF1uXd3h3QmFx/NjT5
 KEMQKFqxVsVVquYddmWAchSaCSKa0UC4WUfSc6nY8CuSEhV4m/BuEDwKP7lzURNom6pM
 IVEw==
X-Gm-Message-State: APjAAAXqSgUwqp6nWKbKPOx621X+ur4rC5U+HtXBSexAwZ72Z+RD3HSd
 Xn1lPv8dyWgrcfpmo3807Gk=
X-Google-Smtp-Source: APXvYqzdTmpWyUZriOvcJC7WoQw37Ayyfob+MqnbndT8hmAlga7t6TtIqVyHcypDq4fqJCaoWhcCFw==
X-Received: by 2002:a17:902:b605:: with SMTP id
 b5mr23686396pls.103.1567306418445; 
 Sat, 31 Aug 2019 19:53:38 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.37
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:59 -0700
Message-Id: <1567306391-2682-19-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH v7 18/30] riscv: sifive_u: Update PLIC hart
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:50 -0000

With heterogeneous harts config, the PLIC hart topology configuration
string are "M,MS,.." because of the monitor hart #0.

Suggested-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7f51d9d..24ae3d1 100644
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
2.7.4


