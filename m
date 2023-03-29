Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phc6i-0006NG-03
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 16:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6g-0006Mz-Nl
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:18 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6f-0007p8-5g
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 16:09:18 -0400
Received: by mail-oi1-x232.google.com with SMTP id l18so12527600oic.13
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dz94/NiXBxZeIT56JK2x9vttFdPys2crTli6oE6SiOg=;
 b=FmmisVVG3hyCfvUvV4pAuFQXPvICie6q4WHgTZvNiyM1r+J3C9K+mCKwW3hNjb2UU2
 pXqByfwMsMfYnqy5VfIu39YbzQ6v9ptzev1DmlsVmEyQt56CyIYY46/zbhT1ds1jZKiY
 r/azE7htY6zhtn4SvqfScU+r05IJxQMlNPQjEMeiN39J4a1Dh7mOgmvqyrE4PpIESuyb
 C52fAvS/QY96m5SPN1/jTXji159lRgEVACokGK2rkkCxhrjyLo7VZ2hd/LRpbDlDqkRf
 rG8lRLSCnV4tRpbcRaNo2U2hQFIm8/iSUrCH9Owfynj1F3sXyCXFTB4bpOyL08sUGVY0
 yc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dz94/NiXBxZeIT56JK2x9vttFdPys2crTli6oE6SiOg=;
 b=IDjYj7A4oRITUfrU4LLhStDvMyUKxkA+zNXuT6IWKbx16IXPa6qtQa5toY135Lrgoh
 +gZZg1XSl98Phz1z+8vHBtfe5Gqi6z/EixzOF9cT1NtiUrNxKx5TyH2smC26qg+sjP0G
 j2p5Pm0gVrc2L4RoC7BpEWeAxOLndl02z9HM8/nnwKDSrPeZI92JNoRxYWicAUe1g9Y8
 15DhyWzMMG2dqhtcesuu2b+36zwILQI76LkEIkzt1rFfaZBdXQf4lmvr6TFTxKCIznPK
 CYV5Uo4oqvbG8BqmAmTrw8SDwwE7ko0lNAgUa4jNDmZx5sK9QeHUoC+/wJPxTJ9Zl39B
 j/rg==
X-Gm-Message-State: AAQBX9fYHlepnWpI+rk0ZaEbjzY0RkhyoKZaiH75AIplGl9Q+aWddg48
 MFiMTlMZqeiLICFAZHt58RpcGo96dkGbs+hF8ik=
X-Google-Smtp-Source: AKy350ZyWKzR1rAuUy3KHUk8PUbwhnsrOLiyrxZKD2IE/UnOWqN4Qdk4jwojdojuRZE6PVAsofzSMw==
X-Received: by 2002:a05:6808:7ce:b0:387:50aa:5f3b with SMTP id
 f14-20020a05680807ce00b0038750aa5f3bmr1449628oij.6.1680120556081; 
 Wed, 29 Mar 2023 13:09:16 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 4/9] target/riscv: add PRIV_VERSION_LATEST
Date: Wed, 29 Mar 2023 17:08:51 -0300
Message-Id: <20230329200856.658733-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 20:09:18 -0000

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
index 75c3d4ed22..1743e9ede3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 }
 
 #if defined(TARGET_RISCV64)
@@ -349,7 +349,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -418,7 +418,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -431,7 +431,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02f26130d5..03b5cc2cf4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.39.2


