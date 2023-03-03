Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zu-0001OO-R5
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zj-0000AA-0D
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:27 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zg-00087N-Oy
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:26 -0500
Received: by mail-pg1-x533.google.com with SMTP id d6so1032525pgu.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832943;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUkOCCts2DVch5VnVOvAOKGqLYUpNhJBdp+jfQXvKAo=;
 b=tmIWCJb8VV8xbWmoVFdDJkEGHEp68cFRkn8ADAUYqnS0HPcz1XOl2ip+0Uw7DC/K8O
 6LvQsj8g/CHAg3He7/vTjogQLFBynHw459zJ2+3iSxDrIbRVvZEX9Uq1Ir26AoPp8lGn
 IunKxt+9KCqQc2hkLvuZ1XmU8Dc3v+iBr1fQFv2vFZEbRKsFyru7GeFojYzaEAneuUJR
 17cQwhSB9WanwP4gzTtnrz9zvuAGz59/yKu0mzQOQTc0kBn9mPzU+U4Xlwn9a+iX0S3q
 F+H+kJsLRbMPSt/Wa64TCRp7hKtYR6KzPTUXlBX1XSJR1cbuIM25pTrrxsPz5wMmPX3h
 ywIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832943;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUkOCCts2DVch5VnVOvAOKGqLYUpNhJBdp+jfQXvKAo=;
 b=fAFmdKIi7gvwrPn4fV+AhBNRap46bf+p9REKA+Ot9wS4eytMYVoWuMWUhglUzqxQTo
 3+5jr0m5qFJy6y+NYvwrnTABC22+1A9mDpooD4B0hzoOGFglRDvIHaHi9y/AtU1UGhcm
 zYb1ZhHBE4smGXMh5bqiu1uWjv8brJYPl+Zkar7xdsP/AOudXyElTQpz115Op6KfKteh
 3ycYwLlOuH/Hz/Np3V7OzNHd1v4ff+AQBaN2Yzej2Dl7hWFMyhX5ntmREN64y3MqLOu/
 jGlDfOoJauJZjStLLXRYQowjvXgduN1GZD+DUz1awlBjYOQ+Si3KY3an9N4Mw6XH6YKL
 ROpg==
X-Gm-Message-State: AO0yUKXxbUSwEkUe/9AoTQNM2wc1L2PeRRxV/CcAhu4XU5FHPbC5FvE6
 Hi9QB4qsMAnleGjS0rdHyJvKKATJ+/RYN8Nu
X-Google-Smtp-Source: AK7set+GtcCiGFWS5DSNlwLaPAuQAQKHCq5nbBpEa9VB2lJKgOJWWlPM+Jra5hX+kCW+rtSCLbQ8IQ==
X-Received: by 2002:aa7:8f3d:0:b0:5a9:bcf7:ea75 with SMTP id
 y29-20020aa78f3d000000b005a9bcf7ea75mr1310363pfr.10.1677832943043; 
 Fri, 03 Mar 2023 00:42:23 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 t13-20020aa7938d000000b0058837da69edsm1019540pfe.128.2023.03.03.00.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:22 -0800 (PST)
Subject: [PULL 49/59] target/riscv: Fix the relationship of PBMTE/STCE fields
 between menvcfg and henvcfg
Date: Fri,  3 Mar 2023 00:37:30 -0800
Message-Id: <20230303083740.12817-50-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:27 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

henvcfg.PBMTE/STCE are read-only zero if menvcfg.PBMTE/STCE are zero.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230224040852.37109-3-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b20b00a9a7..b86c1aa6fa 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1956,7 +1956,11 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    *val = env->henvcfg;
+    /*
+     * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
+     * henvcfg.stce is read_only 0 when menvcfg.stce = 0
+     */
+    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
     return RISCV_EXCP_NONE;
 }
 
@@ -1972,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
     }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
-        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
+        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
     }
 
     env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
@@ -1990,14 +1994,15 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
         return ret;
     }
 
-    *val = env->henvcfg >> 32;
+    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
+                            env->menvcfg)) >> 32;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
+    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
     uint64_t valh = (uint64_t)val << 32;
     RISCVException ret;
 
-- 
2.39.2


