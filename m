Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mc9wn-0001jc-Al
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wl-0001eW-KM; Sun, 17 Oct 2021 13:27:43 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mc9wj-0003Et-RK; Sun, 17 Oct 2021 13:27:43 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z20so61233360edc.13;
 Sun, 17 Oct 2021 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K05JcbwHzwcb6rZL7rDmh7yc1UsvDdWX5/9rOusuP/8=;
 b=ZdakGVSEFZAMCKfWbWOyw3ALus3Lg6vBTumrBpaGpZEC3ruTXHaMj5+NYLvyKaTPJm
 kQzuONfffgBd+NWVJm71Y8jCZQIw9tl19Osge/9uHrN/3UHjoLwX7dm0iSNZTazerfOK
 q2SO9hul2ivN3sEDlZdlUCjPTEjDpIFov789KV8aRlCX7o45BO8NDrkz1skeQZEpR9FG
 7mbFeAnyji3/fBFdSSNvVfRItVrFKSWdFC+Kv9qLiHNSqyPSafnwLIdHGSGUAjvJ92YW
 ohJLlv6s0+Ya47zwn4iCosR2v+CMkWO8WonRURFleHrWbJY9xjlmyJCqAofslca152c0
 vMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K05JcbwHzwcb6rZL7rDmh7yc1UsvDdWX5/9rOusuP/8=;
 b=mLJaVojdFbsg3lMrZ+h+W2MCdbJCMhO8RpS1JjTG0JNqUha3v7q2obiOwcPpgXAR5f
 P1yvJyuoS0LouMvVeHXPVbpzR0fE3SIJBtWWj3vSWTvNwiT6fl0QvEG9m2+ouLhyJum9
 ottEdn/GOO3halWNc1SiWceiBPN9lEyvrXwjkOqQKKp6TVfBj3tzvxHCItS8oc+gL+OL
 n3Ff0lLIRrqOdrOU/irZQyutQ5kerr0j6yv0B5dp36T5eq7gYaRu6ilTUuQgSbYeKfm0
 vk2hW5XrBsDaVaHFwEAEKpBvsOjuZZw9MDR+EM3DX7iCvtwOPo29GIaZ5lf+oe5NPdar
 tZ3Q==
X-Gm-Message-State: AOAM531xNP1ELyqo7uR1s8vZmZ4FQO5npB3cqbASOxvozLS2hzqSUgUm
 sTxop/P1FxxrmHNFtpC0RfVXORhlNOUMcWAI4es=
X-Google-Smtp-Source: ABdhPJz0AQO+RzURrDueDGXfcRM4Imp+xaSwu9aCZJcMHcUjNAPfvINSR9WKh3VHdDEjSfJuz2WTTA==
X-Received: by 2002:a05:6402:370:: with SMTP id
 s16mr33219010edw.1.1634491660131; 
 Sun, 17 Oct 2021 10:27:40 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id v19sm7989814ejx.26.2021.10.17.10.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 10:27:39 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v14 5/8] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Sun, 17 Oct 2021 20:27:25 +0300
Message-Id: <20211017172728.759687-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 17:27:44 -0000

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


