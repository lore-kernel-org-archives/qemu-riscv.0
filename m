Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufPu-0000nP-IF
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58405)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPd-0000OB-2k
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPc-0002t2-4T
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:40 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34067)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPZ-0002pl-Nw; Mon, 05 Aug 2019 12:00:37 -0400
Received: by mail-pg1-x544.google.com with SMTP id n9so33750183pgc.1;
 Mon, 05 Aug 2019 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=HmEOrQlPGOd0Y81l931aXbkGZtqwGBdfoUEd2ZirFRk=;
 b=fAG6hGCDvp2ioiFiIdPyhLs4odrCu2Mi2EaultibP5/mzhilRx7U/DzeeYYshpm/F1
 Wr2lFsHZSevZ36xGMJObEhM41jYxM6uVrHOp6mvH5WoUE8dk6etDdjY7hhi0RmqVJ+Vg
 1cEB1rYHvGJDdJfU7PouLCwrI8XQmERQ/w/el3aohxL9yQcxCwRVrHqkueMeTxZgvszV
 jLXO1rHYKNCkRUe7Ws9eCsYw2n4WgGe8RMdw9guunlJUb0fdKS3+uEjXpDkhblIM4eUJ
 ZGh8+UL31VLym6+gAHPXW85OLr0I2OhCe1x1SdGMvfB/UrZ61YpgLNGwTc1xucy4w4nr
 SBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=HmEOrQlPGOd0Y81l931aXbkGZtqwGBdfoUEd2ZirFRk=;
 b=euLhq9F9QLwa/O2FvsjCgg5TMtezzBfyz2fsWLh450XJxqZQqJpUJNO45mxOb12bdJ
 rMoBp7o9VtIikx1FArS6Qp8gy9WEtZbQDVVVsnzuYML081qBe2EbeNhi2yV+mZEUVQOn
 BYavK88CRjBK8g4R5aaNMFb0WfX9DgPQrg1vPlhFI9wRZFOLtMwGACO0tYKUf4ARZbll
 lARJY+dgic99ZchZFZRMZDbG13HdLL2DrQwKaPJdgdgIJSNUi51DEk3IXA4U8C3U5tgi
 GlIZsfEC9anAX9N+wMyhiudkxu3ZuctfQl/tUJ424QcSmAnwRvxRBHWPnnrv+OiHNE/S
 Rvyg==
X-Gm-Message-State: APjAAAUUtlt47ef77y14bGVtGXUKMFXt+0OeWQ9agcHyVpYUUeertXw+
 ZW0Il6aucy5aFuIp+Zols68=
X-Google-Smtp-Source: APXvYqznoOYCYswgx1X853oPmpSslnBBUugTuEj9/BjbAHgLRFlkUEXCcSEZ/zxCB+TllwWx3QAo0Q==
X-Received: by 2002:aa7:9afc:: with SMTP id y28mr72451044pfp.252.1565020836907; 
 Mon, 05 Aug 2019 09:00:36 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.35
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:03 -0700
Message-Id: <1565020823-24223-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PATCH 08/28] riscv: sifive_u: Update PLIC hart
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
X-List-Received-Date: Mon, 05 Aug 2019 16:00:43 -0000

With heterogeneous harts config, the PLIC hart topology configuration
string are "M,MS,.." because of the monitor hart #0.

Suggested-by: Fabien Chouteau <chouteau@adacore.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 206eccc..b235f29 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -372,10 +372,11 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
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


