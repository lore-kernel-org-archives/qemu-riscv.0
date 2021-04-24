Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la8z5-0004dS-0H
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la8z0-0004bY-4F; Fri, 23 Apr 2021 23:29:26 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:65372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la8yv-0000Iv-Mn; Fri, 23 Apr 2021 23:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619234961; x=1650770961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JibYDDe0G2kjwlZigzacAGKcZc6HxILmbRL3QjmnOY=;
 b=LgIszeRGKpiUlyHW0RO1XZNppsuCiZtQLBOVUxh0vXwoy0uvnhF4ui0f
 2E670MrNGeoqGJfpFV697yPQ0mJ1fazfXaLbUXDGcS0km4TE8VL4ur2xn
 2HkNDZF1EuNlSEBCWwi7oTDYYTR/UI0KU2vwZ7NxHy4hpUGNZzz+bFqsm
 xnVSabUR1phGlotQAEA1RwlCjH2qzWd1gt0rNmv0D31fWuxi6Gg/SJjE8
 E+axvozT/R1Yn37We22wnoCOu8NR/5Ezfm9ylAMqlnIi1eKXFow9sHbWr
 Rgm0xBUMWmvxcP6xKBpxxVYVyQAvYgMZN/czALkYpX9Xwutw1aN/K3b6y g==;
IronPort-SDR: S+2zHoJQsJ4pt1A1hMrXnC7/w8de/gzdlLr2GYk+u/VIfoBvqk/31Rr8uzeZFTmuPMINWbQ37i
 v35AEmh6Zfq9if0kmC5YUXY/CovOtmVkfcWSx8ANUvRHgECdAIX3AluDBP5P+Q+QnshzE9rYFj
 T2HFainAcUyvk07V/fILfhFsPPwUk//bc0/XfmtUZdAIoBE3B2Pw439TTZDAxBUxutHUf79Qh5
 XHIJltiTz0fxB+OVbjTPQMyKu1jyHEpqlcthUcyzw+hLzs1FOYFz7+kCrNSNUEsT8jujD3tpAt
 GLk=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="170655470"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:29:19 +0800
IronPort-SDR: tyxImuyYe837SX+QbuaS5JqFyxuXs7GXE3+oKvBm99iLj8N6YiuvbDUQpTMnxSYitlPJtlRQg5
 2No698yzNwOsi3WZWDy69xRkW3Xc5gFY7zqib1/ul2Pf+AozUSUEzLarayBS3hkoiydyaLGHwK
 AfHLkDyCt2R6TWuyHshqF4dfDB1YlAQQcmKmOls/jt8pX22Dcm3i/wkv58Ysflul5exxg5muRZ
 qNqdrfB3Hi2N86HR/3COGMKWHEgnHOTyavIIwppzDfp+qeQVHy0wZ4kRltxbKuYDHUbynq/PWL
 DKo7hbxjtno12cletgDTdg9J
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:09:52 -0700
IronPort-SDR: Mq3wK20DuYw9+nbGbzd9McGFDYx+q2AOKbfvR9DpBHHNvfCjMe9F5Sv2Zj5htQGRMeVZAZMz79
 pGAglkLGjBR1qdHkLCFnxWyccXwvwHFiyqhAA0JksENQrlx4wbMfQo3p27rygm/vq0GhmMxY5d
 +v0iG4qEBVhIAL1Xa3ePQeW5Q/zcmfQpaQF3uJwLmqdimU1h3yrDWusaAmpm7CSm7gO0Pzxsjr
 wtrXnGTrJY2Ehm7uMr2EGtSpa6DLOhEE18bJdUlMNUKfwfg8+RZ0NA9/+O9ZpaE9DmTxXCMUPe
 5As=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:28:45 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 01/10] target/riscv: Remove the hardcoded RVXLEN macro
Date: Sat, 24 Apr 2021 13:28:33 +1000
Message-Id: <a07bc0c6dc4958681b4f93cbc5d0acc31ed3344a.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 24 Apr 2021 03:29:26 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 6 ------
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index add734bbbd..7e879fb9ca 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -54,12 +54,6 @@
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-#if defined(TARGET_RISCV32)
-#define RVXLEN RV32
-#elif defined(TARGET_RISCV64)
-#define RVXLEN RV64
-#endif
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 #define RVI RV('I')
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 04ac03f8c9..3191fd0082 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -147,7 +147,11 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#if defined(TARGET_RISCV32)
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#elif defined(TARGET_RISCV64)
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-- 
2.31.1


