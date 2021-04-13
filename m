Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSXc-000790-Q0
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSXY-00076X-7F; Tue, 13 Apr 2021 19:33:53 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSXV-000448-K5; Tue, 13 Apr 2021 19:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356829; x=1649892829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=044lsgmoaLPrx3J3U90F2WvfqmCDKq+CkF8fQYONPbU=;
 b=gPBECveaIvaNLmX3bokduHXL1Ds+Q6vsxCoHUX0KMP2KAQxQLww/53FN
 ERrurmOCgsHrVw2uekyqvnHAKb9DtrXwyMv1iq6VGVftdIaxrdCN0rVR1
 a9HbImoltA+BnXojnGvkpgo5D/I5Rcycgnx7ODHShScJyAuM7RAXBjcpf
 v1DBmyCGwfDdccpYJqwLKnykaO00XUj3zhZbb395JlwrI90OfkcyNWSBA
 SvpwEJ+BMgwV49exXcmcUygtQI072xJmpJGkuya4oBluk+YxnZoAc3Vro
 31fc2mw9H+xJhTRhl14TjzWMfvFBHH4m4mC0uYop4N9WKo9w09uChYlHt Q==;
IronPort-SDR: cXbY5UwubKcrEBP26AR9qWxkcKl+aRHsP1HlUl0HBn27hA1JsFBcKvLbLihm9teTY8ekuqzH0o
 NuhyWLCzG4lZ8kb1ZjBJC8+x0/JXM2Lb4yYi2U1XHWQX+8uBwrkgwx+yaco/ZGJpAlqo+INBjQ
 tUlYgxOu2Ag2SeITYiG2YVY8dJcSkcPhYIXwIrjRhJhW19X6RRvEqtRpC5dwxEMQHSUaWTYdUW
 MtAF9ZmQRrGjXORFqoIDYkR4YXl4UxJvfmijIGMAQ6PLlOCUevY0ZOUBIGyt42ORRbybAmYS72
 GP8=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164258266"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:33:33 +0800
IronPort-SDR: kEbW0DqfENotjYJNPM003tU5rLYIiuJnM26yrBGeOk2tI+JH7qvXf+t5Mo8fHk0fKSg/FdgLRj
 oY3H9JlZ6XG/ijNqeOf+7cJ0lOOrWNUAcSmRNcsko26oaGTmeoqtYyXJVE9Ey3RGrhFjag0cYb
 K7vmOvzNXRAFsNmK6lyCjUWnlhh7mIcQCggggEypwcWub5iI1y+G1wYZEjn+pgVt2K6CPkZOn2
 E394xZ5UuDB4Y38v+xJhGfI4livIv7T9wkLqVLK6bO0stvEnuphY4bfFuscRR/mE4V3VjVD2S8
 UDmJUASNQUSeRHlfB12qCSop
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:12:54 -0700
IronPort-SDR: qTfIjjiwEATE/eNmoDYNxEkDjqQaFKuaqyI1yepECemBtwS27MayXmXJHlANj9p/QYOVinhVBY
 DKfS8D37xzhCzZQqjGqxO5TNEq1A9nmulDGmBYMvRf/yMkJY9Zd7OkE/l1I2Niuvx0r7Tj4gXQ
 xtnyg1VZS4j/AeHGRCDF11c9E3w7ktcf589BPLYDOnKP1MMaAKqpDpzVn9IB3TIPNwQE1t/u8O
 lOvbZ1S1+KMjuyemCQUcN4qykkniNDthH1hJSIYsTPuFh5r5IbYeZmAxaqveUfpWy4wt28zOaK
 Clg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:33:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/9] target/riscv: Remove the hardcoded RVXLEN macro
Date: Wed, 14 Apr 2021 09:33:16 +1000
Message-Id: <3eea7ff02e990d9d9cb906be9eb821eaf1ee5408.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 23:33:55 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h | 6 ------
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..ef838f5fbf 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -53,12 +53,6 @@
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
index 7d6ed80f6b..92c3195531 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -147,7 +147,11 @@ static void set_resetvec(CPURISCVState *env, int resetvec)
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


