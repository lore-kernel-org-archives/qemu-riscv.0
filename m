Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPPU-0004Xl-Kc
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPL-0004Ec-Qz
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:39 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPJ-00039W-Lb
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:39 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 bg38-20020a056820082600b005421db6ed5bso1939318oob.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740036; x=1684332036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2uGLi6+ovBWUdoc3kQpi9p838CiXRKVkHH6lHuOuZ54=;
 b=GQCTuXhVQ7pxZEOBV6eBUwhfBrOX50FYJmrpANLR1aAAsVvbMwSFxW2H6VfRIbptMg
 Zqfhk62BggHr3Dou/ctv+4IrzV1JkkFmwGbalZEFU+OrqEXJzFoeIsiRjXHbbWqwIeoQ
 pUZasavthx0ieGFjqiyGTsBhao9iNNsTp38K9ISEiSj+uTcBrBtFdcD8aRuxu/sHR6QG
 KFLhr9FtMtzF25j9FKxQcQfXhfkpv6Dyb60CqKDZCatCBxU7533Pz0OhpcVvVAV2bL0A
 Dfimy8FBtPxHWk5BSAgd6MVoJwrA0lTCYzMXI6lzTeA/Aocv+qegfEOj0iNmVmVBX8r5
 rGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740036; x=1684332036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2uGLi6+ovBWUdoc3kQpi9p838CiXRKVkHH6lHuOuZ54=;
 b=i21zTjan1d9Y7HDnzx0XM8LOIB7hGiNwYyghFuNZbw0ZEmU8Q16XP1jOOwnE2NI6d3
 KxUxJ8ZKeR/zxkQiWQnskSansnRJfed/IucM6XN5jxhRKeM7mChw0i35Lox1lVMcv4Gh
 ZG7aZfULu7wAGxsS3rvhouxxCAc4krvce4hHmO5ExcII6ao8WYFsaxgZ2XdfVT15oH8N
 C1CBWDe9s/xn/IsT3sGanbkRArh6y+resMfF6xgXqlSLVAxhbGIg4keMCj4b4bFodKu3
 qTbUJaLzoznPSQRvcnIfj7Pei+wzNnKHEV4e7WbhtLIr8r+hl0JxRJUXbFzRz/kYGewb
 LD9w==
X-Gm-Message-State: AAQBX9fdvfy89mCg1bbMQ2L71tq7uw0tvnw/Mme1hHqgFfJGt2RiNp9w
 oeQJlOy0KPLGt7GhI3uGXggppw==
X-Google-Smtp-Source: AKy350b+O5+SEuT/yvD8/03rWz2muJ+xLxguYw5a6dt68gmvJOxSxwwAdObGKc4AAFGSyM6TqA9xwg==
X-Received: by 2002:a4a:2c86:0:b0:546:3872:f394 with SMTP id
 o128-20020a4a2c86000000b005463872f394mr2307816ooo.3.1681740035939; 
 Mon, 17 Apr 2023 07:00:35 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 04/12] target/riscv: add PRIV_VERSION_LATEST
Date: Mon, 17 Apr 2023 11:00:05 -0300
Message-Id: <20230417140013.58893-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 14:00:40 -0000

All these generic CPUs are using the latest priv available, at this
moment PRIV_VERSION_1_12_0:

- riscv_any_cpu_init()
- rv32_base_cpu_init()
- rv64_base_cpu_init()
- rv128_base_cpu_init()

Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
make it easier to update everything at once when a new priv version is
available.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bec60fe585..dd35cf378f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -345,7 +345,7 @@ static void riscv_any_cpu_init(Object *obj)
         VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 }
 
 #if defined(TARGET_RISCV64)
@@ -356,7 +356,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -425,7 +425,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -438,7 +438,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..15423585d0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -61,6 +61,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.39.2


