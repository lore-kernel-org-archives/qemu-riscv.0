Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufPg-0000Xq-9d
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58306)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPZ-0000D7-PB
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPY-0002p6-8o
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39295)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPV-0002mY-Fv; Mon, 05 Aug 2019 12:00:33 -0400
Received: by mail-pf1-x443.google.com with SMTP id f17so35880966pfn.6;
 Mon, 05 Aug 2019 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=MEocHzA8bLZdtMtZmnxyMFpvcuFhlZ5VTIY45of3ZJc=;
 b=HQzXWJznvGwCmSo+GhD2WL3Sh+Ya/PUJUiNt/8tmsdCZYupQUTiS1H0WEDIgfjceHy
 qkBcTzsv9iHxlwne4KrdHsjMmLac3jCtQlKPAUenPtRJqQHrRbT/+tsfwH/bbKgKG7k0
 xVgIr2Dj0W1hENaNMzoH4fXncLMNHwppemJb2vX2hYfwNpOJ4rPgqjD219WzNCdOEgQu
 LtO7A3PGz3ecN5RUxiCRQkdWGZsdynVU/yYYCcCHkmRf9PzfkA7G/XOar3foleegGzRp
 AamLidYoWFAayrG/bFwCtiKdDGqvBTZbVNOyp79nEUV8lXFcheXI3Bfy2iiZ8zApwt+2
 Psbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=MEocHzA8bLZdtMtZmnxyMFpvcuFhlZ5VTIY45of3ZJc=;
 b=BrP+pMvroPLrkI/jjjzrpO8qd4XQdBp6Rur3x1FGYxYgN6e3Bg+U3GP8+0+Q1YVv6L
 oul3aYp+kiDmVhzhI11A9k3Oe7f0gDpTksVNrQb0SpfXx6xeX+t4Gl/wnyHlkKAoPKpc
 /StHtORzpQOLsaC9PngsRjS8741lBr/n395OgbT3gYUMkbShIT16EOALGQB0zWybu1hZ
 2Xeh8S+eMqgMHBdl0j5xdb71ZoNS7GXyyuJCdZk76zkWgaThZTCeFYomOdYD1iT5GUg/
 /crPfG3huhBDdQnXwIa8QkKW7icf5xlseqSWK7mC1X7RgiGoj0NS+lUXiXXhjzGkStkq
 x8YQ==
X-Gm-Message-State: APjAAAWjkCoQpA0JYL5GvRyXROOmONudLWM8P+WoEaufyt/6FyKeCpKM
 XXv/nVghQlWb0Vmb8RZAhx4=
X-Google-Smtp-Source: APXvYqw6DO6Nq+xSuhhojNGibQugquqVtd634/4KyFMdqo246Yz/7QLJf+sJHYTiuKAMn3iVvUB6rQ==
X-Received: by 2002:aa7:8193:: with SMTP id g19mr71794742pfi.16.1565020832644; 
 Mon, 05 Aug 2019 09:00:32 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.31
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 08:59:59 -0700
Message-Id: <1565020823-24223-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-riscv] [PATCH 04/28] riscv: hart: Extract hart realize to a
 separate routine
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
X-List-Received-Date: Mon, 05 Aug 2019 16:00:39 -0000

Currently riscv_harts_realize() creates all harts based on the
same cpu type given in the hart array property. With current
implementation it can only create symmetric harts. Exact the
hart realize to a separate routine in preparation for supporting
heterogeneous hart arrays.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/riscv_hart.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index ca69a1b..3dd1c6a 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -37,26 +37,33 @@ static void riscv_harts_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
+static void riscv_hart_realize(RISCVHartArrayState *s, int hart,
+                               char *cpu_type, Error **errp)
+{
+    Error *err = NULL;
+
+    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[hart],
+                            sizeof(RISCVCPU), cpu_type,
+                            &error_abort, NULL);
+    s->harts[hart].env.mhartid = hart;
+    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[hart]);
+    object_property_set_bool(OBJECT(&s->harts[hart]), true,
+                             "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+}
+
 static void riscv_harts_realize(DeviceState *dev, Error **errp)
 {
     RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
-    Error *err = NULL;
     int n;
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
     for (n = 0; n < s->num_harts; n++) {
-        object_initialize_child(OBJECT(s), "harts[*]", &s->harts[n],
-                                sizeof(RISCVCPU), s->cpu_type,
-                                &error_abort, NULL);
-        s->harts[n].env.mhartid = n;
-        qemu_register_reset(riscv_harts_cpu_reset, &s->harts[n]);
-        object_property_set_bool(OBJECT(&s->harts[n]), true,
-                                 "realized", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+        riscv_hart_realize(s, n, s->cpu_type, errp);
     }
 }
 
-- 
2.7.4


