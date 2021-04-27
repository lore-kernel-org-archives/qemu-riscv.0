Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbVqg-0006GD-Af
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 18:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqe-0006Cj-5G; Tue, 27 Apr 2021 18:06:28 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqc-0002gm-6H; Tue, 27 Apr 2021 18:06:27 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t4so8338843ejo.0;
 Tue, 27 Apr 2021 15:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5tnfyh15+1Hzqs2BbpAsHKgrqdCLD3z3hF5NAd03tM=;
 b=S2Wx8WWW2OAr9xcdhR3wtjLBzqLk5RmrIOCYwtG7YP2jwcbHyGKp9sNBSQUcBwkwQh
 AZ5VXm8Sy+BuKqqeUcFTqDTUk234X09am8WO3aJrf8TdXfM8mlQ3OHsWF+hxKH2ZCeQl
 pzuVlxbf/OgZzchyfoTB6s1MH+Hr5e+9a7q75E65Ndmu3FO+WY9ze5aLOJBC1X0rPUgB
 snccrh0okxsstYrky0XmiVPL/6Ft89TtCT4+XcJaXzPLOh0Q6+yVFlsj41CuJTy/OQD2
 Zq32f74hKhbNAMOqkJcv7ptYlRop0Zcb3sLfQopgB3Xw28BAZ6gaak8kgeRvC4ic7pW8
 mfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5tnfyh15+1Hzqs2BbpAsHKgrqdCLD3z3hF5NAd03tM=;
 b=gy5kjhAelE8Bo6q4itrlevROEI/obNH5U1mZwsvQ+xIFZ7sf77Ikp+agqcAD2gsOZ4
 FAGOb48OfXzl+onQweKDO0AFUgBm9jDri7ELw/bnI03DG/H+4fceHGxArhxQzhICBsXF
 YXpIlnOkor/xxJX55xqiIYz2devWqh4R57F14FJ0s59qpk2CaP+GUPBCMmvEf2O4y8SN
 u+z+ta4J77tl7s0mzOc3CrEngX+hSex3KxvXkYefscH+woi/wRtlnyv57fWb19XSaZra
 IJmvwwLMI3oAdATM4LCHJgHVRqI55o5OWvw+L4v3eUQVTjw1EhL0lvGVnKr4XZov5MZh
 keog==
X-Gm-Message-State: AOAM531xI+/3VNQSl3Abgkub4p0XIJgv7LvizC9gpjFjAERwiRgZnwbq
 Hnshuy4ecJmg6WSwLoAqx29vNFoo+FRz74Y8aDMlRYhP
X-Google-Smtp-Source: ABdhPJxeAr6TqoD2k48/VRSr1na7NS4HI+t4uI2eEGG4jYWgVFWV7nH6jD62G02I3MinZVLWnVARng==
X-Received: by 2002:a17:906:4d02:: with SMTP id
 r2mr13725591eju.464.1619561184587; 
 Tue, 27 Apr 2021 15:06:24 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id r10sm640049ejd.112.2021.04.27.15.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 15:06:24 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 3/6] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Wed, 28 Apr 2021 01:06:12 +0300
Message-Id: <20210427220615.12763-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
References: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Tue, 27 Apr 2021 22:06:28 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c04911ec05..0682410f5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -287,6 +287,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
+            g_assert_not_reached();
+        }
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.20.1


