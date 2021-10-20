Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hX-0004Cx-Ha
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hO-0003jL-8L; Wed, 20 Oct 2021 06:19:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hL-0002zy-6g; Wed, 20 Oct 2021 06:19:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id w19so24293776edd.2;
 Wed, 20 Oct 2021 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K05JcbwHzwcb6rZL7rDmh7yc1UsvDdWX5/9rOusuP/8=;
 b=ZBbofTOdvB8FzbwuA6BSGaomS1Klm+D2cNPeFZoH5VVmfJ1xZH3PVyyBQWbczmrguu
 scueBRDUU2nAAmufNKnxHJdiYuITAwUNEn6sqsENoL8hYDesHJSJ0vCgDj289CXHsKap
 63SPiCWjS5iDQ9KOvCutER40BAw7iTijdkUynoycqARHG7WMZW/SK/AY4bhUOjTPaNd3
 TqTmcKDHCUoSLcZq3dsRdxJZMVhmu4Ia5Z44kPZCcfUwFcNKn2+aSUtel6d7HZAw/yFA
 iphtiTkuicR++8EFbyUivarxonQs2qyvN8PhIqVyFZiHWhIvK4Iv9wR/3vU22S6hhT7F
 T3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K05JcbwHzwcb6rZL7rDmh7yc1UsvDdWX5/9rOusuP/8=;
 b=cPZFB00bCGeolvrI265G/hZHgTnYoKf8p1psCxa8d3GxWS0kK9np9zCfCNN+X9Omim
 IvHU1d9D995/AVHXevbXXGdaH0vrz6aggJ8BN9vYa7muHZ+QkGUOhaAk85it/EGkmSud
 dPkxwMYt0WPzE6F6KJzCJvwrkVmaSUXiQVZYGSPzirzoNnmNt/YSD36WcC3N7Neb2jRG
 GlU4TWQz/fErLYiARgdrN8Iae9ZLHI6oijUWuGcu7OoMR58rzNI009KuTCnZX27IgS5A
 yOqlQ/CaWVXtKCuQ6ViFOf64Lh1qV+E2Vzx9y0VRM8Rx8oy6BY6mG7tAmjcveB0oH3BM
 r1Zg==
X-Gm-Message-State: AOAM5310fFrlrASVtEKd8FYE17V98Az1me/Ff434m5vFsjY7lFoAVLdE
 jkJrUvsb8xK1S6up8S1wPvv7g0+TAwZmtEKOXgk=
X-Google-Smtp-Source: ABdhPJz8yt3IOoHqhNdQoDTzhPXVkbvQ8Ugovy73w+jPLnJrpVc2uaZQfrRc4KM5g2iyb/C1Nlpktw==
X-Received: by 2002:a05:6402:14d5:: with SMTP id
 f21mr30362493edx.268.1634725188299; 
 Wed, 20 Oct 2021 03:19:48 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:47 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v15 5/8] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Wed, 20 Oct 2021 13:19:32 +0300
Message-Id: <20211020101935.1369682-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:54 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 75e8b8ca83..7f9dde70b7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -295,6 +295,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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


