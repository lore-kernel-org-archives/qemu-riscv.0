Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0Ge-0008Fm-IB
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gc-0008FS-WB
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:07 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gb-0002TN-Cg
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:06 -0500
Received: by mail-oi1-x22f.google.com with SMTP id s41so13090579oiw.13
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujomQRHGgwjDrFsnpBRurC6xFEUn7Ynnev0wZ4SoaIY=;
 b=MDUI6Bicf4vbL3rz/6F0vbCO0Dprf7NSlXklIo6ewHOmHgHdo1hHGiexXqw7HQEilG
 Sh6Cy+XpWyVvD3PQwME0ChOvqaSBRKN9fek0lUxJ10azp5m1Czmy8lIr70pdfQ73ds9U
 ++mHAxG42eY2M/YB/48QREhstARQPFLvRRDa2Wr4hZo2W8HA7B+jeGZf8bjCym6Cgyky
 mAODhXEDhm5F0+1EQmLWa9SUjGYmP9Gvi6sXv+pSSRU7F6+d/ktz00Vx+OTWZomSLdAT
 nFQGDU1HCvPpU2wjkn7ilTy8DSSNefVRkF86VgROW6o4BVJ0857TEUiOgcOjoGdDVCaT
 c7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujomQRHGgwjDrFsnpBRurC6xFEUn7Ynnev0wZ4SoaIY=;
 b=eTYPrQTlyX76os7BYt5oMUedNtJ7UH4UdQHLxNB6WPRI3M1AkItJgaPnsa3rNg3TCK
 Z7XWbPtloYvDmJowUTOzTDEZwjoiBLHphk8HumD/kO8IR2L4I9KyaYU7NGGw0RqlfxWr
 jSP8weGJE4NHHaHPjkifuIMjQBUfV7SRP7KIaWXAdjn4Q/dWVNP+AgfJDr/Tm5I31yD/
 hPg5FA1xMm4z/e8HAZZ98wlnVnveXlYsjkwjuOGrLZSQEPWXjcJsra2TzSMkYf36epif
 NdGnGadnU9MaJTINAguXkQtdGB8L5/gDPwAuh2ZeBlT5XTd6qiL6Ylg+ecVLmz+IBUbM
 EjGA==
X-Gm-Message-State: AO0yUKXlPtNfZVqTsAgEwKV0mSY95rKps+ZNmHYoPMRZvhlxhaWN2Qoh
 rruF31dD+aggOcDovOHL+sZUAA==
X-Google-Smtp-Source: AK7set9WVRRqcOUAcUScOCqvLmZ3/r9vw5ZI50hGM0lMOk88Thd53TBwu+rra8gK5FjcMmwugB72Pw==
X-Received: by 2002:aca:281a:0:b0:37f:8ad8:48b4 with SMTP id
 26-20020aca281a000000b0037f8ad848b4mr8134847oix.17.1678306804597; 
 Wed, 08 Mar 2023 12:20:04 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 11/17] target/riscv/cpu.c: move riscv_cpu_validate_v()
 up
Date: Wed,  8 Mar 2023 17:19:19 -0300
Message-Id: <20230308201925.258223-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Mar 2023 20:20:07 -0000

riscv_cpu_validate_set_extensions() will play a future role in
write_misa(). First we need to ensure that this function is validating
first and setting cfg values later. At this moment this is not the case
of the RVV validation.

Move RVV validation up. Leave the 'ext |= RVV' where it is - next patch
has plans for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4988fd4d4b..48838471b8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1111,6 +1111,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1165,12 +1173,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
         ext |= RVV;
     }
     if (cpu->cfg.ext_j) {
-- 
2.39.2


