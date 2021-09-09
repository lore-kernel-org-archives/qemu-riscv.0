Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOPIG-0003l8-Hp
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 15:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPID-0003da-4k; Thu, 09 Sep 2021 15:01:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPI8-0007Nk-1N; Thu, 09 Sep 2021 15:01:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id n10so1495194eda.10;
 Thu, 09 Sep 2021 12:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBaftD2HDN9Nf5cir5Muklttb7yddyUCtA5aZqQW4QQ=;
 b=OsuK2Jm3KDDfWQgzUIhXhyqMr+MfY2wEKucV8S7g9hz7Kq6f/ysGsV6fv7JiT1p1mZ
 9hfbJW+Tlel+1Dov4YmnieEHNB7uVpzh70ZkMY5dkmm96FtxoZl1EVYnE8ntGQgWrKYW
 WIpxwD+mgNRBDycTpvGk+td5bnIAKhu4xora15tqFuqKaTBuaRrLIznKyijuG0EURITD
 dorw0nRliiQ92bQPr2PPJHccWAejbNvKq7zssZvQTiWnHQXNZAKug2V/w6zQg+rbo4/l
 mqmp4PLeplIKDRpkvuVl/yJdZJ3cF6+BGrgBJGtcBTNMf9v30rXTJHSvqAKJR/EUKluN
 yMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBaftD2HDN9Nf5cir5Muklttb7yddyUCtA5aZqQW4QQ=;
 b=VbkdJSu1E11ZDNhqGcjQj5cE48KMZxbrGWVy07JByGaVi1kLPE3Sgz68zu11aJNvus
 3AXKgHsz0JH/phOveBSemmVmRKm3zHg78Y7+oGpyk+Zk8bjuPyymIbieEye0hX1+I6ML
 yE9xfKB7LES9q3s6hZjQ71C1xMk2H6cNEMhRNffp2qHMOWCFBr93hsKdoQKEn8f3aSt9
 Dkk00kRa69BFz/Fu86qBDN8rYDz5A47/gzi3wAzZyLx3vepCdWKNnL5CtqWZeT03JuGO
 p5M4s7Sd7nrgXYHehayd/htn3ZqfeSmjVM7nnRwMxBJeQs+umKBBe/jyDSiN8937p3UB
 AldQ==
X-Gm-Message-State: AOAM531f/AyElj92+y8mV8eZkvCflt/p6aXeW3CiysHJu/PWqmYld37u
 pJo68OGeMV/5l0lK9t6u9uaNcmSyv0Vb5UOGQvU=
X-Google-Smtp-Source: ABdhPJxIB3JlHeW4UZ/D+zMUiTEAzEBLtIsDbz7JEL234pTKEayGPfSsxV8E1mwQRKJ5d6MP5rT0Bw==
X-Received: by 2002:a05:6402:c90:: with SMTP id
 cm16mr4804474edb.170.1631214054058; 
 Thu, 09 Sep 2021 12:00:54 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id c17sm1514588edu.11.2021.09.09.12.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 12:00:53 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 4/7] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Thu,  9 Sep 2021 22:00:30 +0300
Message-Id: <20210909190033.1339448-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 09 Sep 2021 19:01:01 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 62870e8f36..f5fdc31fb9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -300,6 +300,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
+    if (riscv_has_ext(env, RVJ)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mmte    ", env->mmte);
+        switch (env->priv) {
+        case PRV_U:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmbase ",
+                         env->upmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmmask ",
+                         env->upmmask);
+            break;
+        case PRV_S:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmbase ",
+                         env->spmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmmask ",
+                         env->spmmask);
+            break;
+        case PRV_M:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmbase ",
+                         env->mpmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmmask ",
+                         env->mpmmask);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.30.2


