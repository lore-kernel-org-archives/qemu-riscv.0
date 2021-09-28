Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVILa-0003jv-Lo
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 15:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILX-0003hl-Jw; Tue, 28 Sep 2021 15:00:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILV-0000xH-VB; Tue, 28 Sep 2021 15:00:55 -0400
Received: by mail-ed1-x533.google.com with SMTP id y35so35998676ede.3;
 Tue, 28 Sep 2021 12:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fO8aa2sV8iMxV/AzgVSYDRyiG5WOPHtn9d9hvhYwksI=;
 b=TxRtXRiDFkhlsZewfktMoKsdHtDtpRNzdeVMRsdC6FbZiajqV8Yx2GvtH6rzdyjPh0
 XsB8T2hNQ+bNybyfi/P085nqsqarPC51j/+WPTFmPcuRlyINrc2oU7g+tvMpq1TMNfNr
 DmcmG2pDmSY2CQyZhqtx6Pi9MWZ2SHDiPybfp6iZLa2jyH7tFfgMHdu+EuZxOur5jH9r
 acrKMFx3cQWKq/5p+eL61kfoHWUyL6uRZb20hxoXk/UEEqtrkpVCHOGbo8YtG6Ug84zl
 XQESbOPCVpkQ7VqiyMxWdfXF+3/3TipfLNCpZ189/yXfC56B2tG2rBkfobKJRubJfP0a
 r7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fO8aa2sV8iMxV/AzgVSYDRyiG5WOPHtn9d9hvhYwksI=;
 b=ildDl7v/XOnHj48EJ+VH8YKXgCqKGAajCvR4GatCVjFUouHTwEUXXJ6PeaB9zwt/Es
 8HKvgxwuE7mSrlH86/7rdRAWxhJsbTt8+KqNKFcmWJkvTPiejyhRT5x+IA+pZA/+0K4v
 SMeanc6bjgULdPolOJsSAIYpgnHibWULh70y+0pzIx3P0fUfUkUF3slM/ogGzquVpohz
 foR2aV13tLRohXBj9Yo61Mq/Ju20fE2+kxkn3OPEB0Xw9XDslXpPwEKOvcvnoFfIzwtl
 KOfFQADDUQKVn+Ay4zxTyKraAnEKcbrBkV91AdFMMfapy4lhMTXhi2phQZfVuwJzXDKI
 HZNA==
X-Gm-Message-State: AOAM530lsIV5EJB66RE3uL43nOq2+4T4916XmP5xvvJ6/ZEyEW0Ik+sy
 W/vsPNId6zwcNUGJ5U/UZk4=
X-Google-Smtp-Source: ABdhPJzbE4H8c3hOO9ctIPJqkQ5fssV9nZsmlg81ZAl03xJm3lceza5Ym6qaiYqjoJVeV4vt9lswbA==
X-Received: by 2002:a17:906:7ac4:: with SMTP id
 k4mr7915552ejo.430.1632855652113; 
 Tue, 28 Sep 2021 12:00:52 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:51 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v12 4/7] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Tue, 28 Sep 2021 22:00:33 +0300
Message-Id: <20210928190036.4114438-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 19:00:57 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a95df559d..911cd02ea4 100644
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


