Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTgO1-0002W0-9L
	for mharc-qemu-riscv@gnu.org; Sat, 17 Oct 2020 03:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kTgNr-0002K4-G9; Sat, 17 Oct 2020 03:12:07 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kTgNn-0003kH-NO; Sat, 17 Oct 2020 03:12:07 -0400
Received: by mail-lf1-x144.google.com with SMTP id b1so6248953lfp.11;
 Sat, 17 Oct 2020 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrQtqAjUROe7fmEpS/MuFCEtm0EhCZVesv3G9r8oUO8=;
 b=TpPNff02TOxLwWO6oL5lNcgUNqKVWKVMUPXF/A7L9FjENEzL0IzywwJb3pYTmsGJDZ
 FevJbwY5IzTdB6ijeiWxIJaGfs2aWDEqZXitPXq/XGGETf/KNmMl5aaSkFqxSuu+nUx1
 OK9lAnwP8QGA626SF3O1u/CfZnotOdb12r+87ITXYLdtlEzQqwgdbZJ9pO2jujxGxVLO
 e46CH1ts7erQBoNMXp/kXBuHg/FK0PkxJy7AnqMT+5SVR3cBElY9JlUvIXEQ0u3LsPcG
 JNwMPr7iF9MTtuUIOEjnX0hSNPN8uBnuaxi9VWEvztkx3HzMUWFWIxgwBDm2+PS6sSI+
 OueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrQtqAjUROe7fmEpS/MuFCEtm0EhCZVesv3G9r8oUO8=;
 b=qSflEEmrl5UftfcmlPHwwlPAqfIxZgZJnFfp81NXGriLf1ab4R4IzlazwoA5M+HgxH
 +4JlPXxMcNKPJ2EI6uQ8pGP/7zHudujpEtkh0ikeiaWs4Q5s8iHaJ+UfnKIrlmQsXd0f
 LWCmEmWVTCsFVShk1HDhuk+ePDBPjnaTlku56y5dyMqyXAHx+BhLufXcX2IpNxbPjVm1
 zur8QbHzHx0An2hqYqB52Y8PT3hDpAKxfj03w1ufImaAve0CK+lSzZoFbC/uXZ0baAEt
 y2Cd7r3vY2HfQZre2Z+RrPx5YQ99fMfxEaJkwS7Y5yKa25msB56jqqUIm0pDj4f0r/zq
 FKWg==
X-Gm-Message-State: AOAM5327H0nqUL8q1J39dOZxtTAYXealqKQaxLraMBrdFve9RrJJaZ/U
 74YlS4WUG6d8y9iPtmFzsuk=
X-Google-Smtp-Source: ABdhPJw3odaR8vKrk7K5H/ias+iFy1AuJt3spB3r2aOIl8zFfN6BNTCBTq8jdYpK008Y5XJ523a+hg==
X-Received: by 2002:a19:8c17:: with SMTP id o23mr2531938lfd.279.1602918722065; 
 Sat, 17 Oct 2020 00:12:02 -0700 (PDT)
Received: from neptune.lab ([46.39.229.194])
 by smtp.googlemail.com with ESMTPSA id 184sm1626905lfh.232.2020.10.17.00.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 00:12:01 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 3/5] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Sat, 17 Oct 2020 10:11:52 +0300
Message-Id: <20201017071154.20642-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201017071154.20642-1-space.monkey.delivers@gmail.com>
References: <20201017071154.20642-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Sat, 17 Oct 2020 07:12:08 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d63031eb08..5916ebe5c2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -255,6 +255,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
     }
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
+            assert(0 && "Unreachable");
+        }
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.20.1


