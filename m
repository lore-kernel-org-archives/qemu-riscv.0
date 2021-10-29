Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgTlT-0001yW-Of
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 11:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlS-0001u7-H2; Fri, 29 Oct 2021 11:25:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlR-0007MI-51; Fri, 29 Oct 2021 11:25:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id p18so3757451plf.13;
 Fri, 29 Oct 2021 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3mrX6SeJJuh0QwI+Ut5jGI+r+F+q9vasPZ82cT0utmo=;
 b=W4ZTYEgrW32iRQ6jgmvyQbEoKgX7kBl8Q+afzMHhbFbaGnQlAPTXFS0kaXzalTWOEq
 /Mxnd+BsRDWib0xz9Yt3BPrcKQpUxJBE5sPaNMQ+TgTyWqUDEbi6yrYHYBjm+Wb3hFzL
 DVmfKvXfzzxE23J3HHJQH2GMKTGWX0H0WzqUKvvc55WnyUEYKrWZLoqLrQV3U/L5P91W
 pSfIXAFWVnSOXzu8zbH58jJLVZYX/iKLfsxos558M6NP1c0hte2mo5YK7Mut25DF/G8q
 fp8+b1Ug1o6y81G3KYucDoyi/grWglKMQ6DX7ZDkyAbAla6vh8l4AMoMnV1gEqQprMpu
 4XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mrX6SeJJuh0QwI+Ut5jGI+r+F+q9vasPZ82cT0utmo=;
 b=ekMgGvVToElXjb1nadG+Y5Nw/O8RgFlXPPBC/BhN+dk42p8L8YOZ7nmQ/p+xwHG3qh
 BCcxOAGs/Q8v8UaOaPvyI6ZvzuVwJ9P4TL0OLGrusvUiiYOT1iYGA0fd4eWEW9Ed22H+
 yhiHswwe8ZlSS6IdXpHMHz6WkXwoqpqJqmH+dmi5ke9x5CBtmVg2m13eFDeP0g5ayGZJ
 S0pZp8+ATI1jweSktwzQHoXL5U/YRiH6bOUzRZXWmcRnSwQJDA8RYIqOmhFSnCl8IHW+
 q2Emxgb8L8VQgipUvAZ4JSJF7esVe7nZQxRYNhZLs90Kzxjv8oG+pwnHgnCsx4+iney5
 f6KA==
X-Gm-Message-State: AOAM530EgjHcIq9tUaJwWQhUlQx4tCUP21zRKTv7k7YTfY4ZVb5j6vCF
 6yJMf3Mu7KxTh0wH2BSOfdw=
X-Google-Smtp-Source: ABdhPJzhU36joh5hH6SlbngnaNM0YBkEEpVSOxXIVvU4+2szdv+7KXQyztm22oOwHI64OXxelakAXg==
X-Received: by 2002:a17:90a:2c02:: with SMTP id
 m2mr12195850pjd.109.1635521151573; 
 Fri, 29 Oct 2021 08:25:51 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id q12sm6645790pfk.65.2021.10.29.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 08:25:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 3/5] target/riscv: Add a config option for native debug
Date: Fri, 29 Oct 2021 23:25:33 +0800
Message-Id: <20211029152535.2055096-4-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029152535.2055096-1-bin.meng@windriver.com>
References: <20211029152535.2055096-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 15:25:55 -0000

Add a config option to enable support for native M-mode debug.
This is enabled by default and can be disabled with 'debug=false'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 457adde952..5787d1598c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -74,6 +74,7 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
+    RISCV_FEATURE_DEBUG,
     RISCV_FEATURE_MISA
 };
 
@@ -314,6 +315,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool debug;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eface73e7d..3a2fa97098 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -439,6 +439,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.debug) {
+        set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -619,6 +623,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
 
-- 
2.25.1


