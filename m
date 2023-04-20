Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQTt-0008CJ-6T
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTi-00082Y-6w
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:25 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTg-00072H-JN
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:21 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 bv13-20020a0568201b0d00b0053e3ccf739cso458552oob.10
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982479; x=1684574479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4z5nSP6wx63l1Rp9Hr9zkEzifzCs+qe4SgWrFzg7RYU=;
 b=Je7Kxa0m5zB+6JIGgBIxIpfzd6XVwoxQg0tMNWXtLvupMzAcaD048trfhp5ikBTasH
 f3eqhyF0fa6RYQFv/3aRTeK699nVid3CXUpFRBsSrLbJG9IQN9WysqMvQdQ2BKLyYgJ3
 TpNZl9n4QGID+QbD+76gYQ9DOhXZC42zAg1U/F5ctpqpBiWkb/+MaDTv5fYf7vd9D9bf
 geWZ+cDq34s61+dcUk2wp4kl53SEEgH2JMgvLrgtKD6zSezgTjY61TCIe/skKkru8hX1
 BuKbKlvOjuu4Eb/8G16tHbi17+DuBAt0S5dRqVOPZZ1oaTCYMjl+5FVhIgrCpxr0KJ/Y
 stBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982479; x=1684574479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4z5nSP6wx63l1Rp9Hr9zkEzifzCs+qe4SgWrFzg7RYU=;
 b=XvH5sLwT3W+7p01WSwqU9T1K3KR88vFjbe2IoMmbgnDjHTe3bMGwVIy1ATWIvIW8sX
 hwbst9gSpn/tUMQvUEDdjerH5SJBXz7VelkjfFH5FiTZdy4qw5Mzrzq6ayJ8GsH3YmI8
 pv27bfHbIQbFBhRfTj0bYEGAt9bmyFX/E5ffsSnciYrzV9Sgw+UdWKr2p52XwjNNW3m8
 6gxPEjv7Py1R2dfGknXAewpKUzih2FAYPSlwiRhdBqMqWSjRIbowWyALWkq88uuxur/4
 x1wiLiz0bMEjm9FhYBHelZNnbvucd5h0c6nCBRqdAdKtBUFQgH/KoLRD7R7AO4WWBRso
 p9GQ==
X-Gm-Message-State: AAQBX9eC7np3Qw0MMb4mOgEQvK2Ecdzd7H1Z1KFQSltWVzjGpb9h4kcE
 uWbjA0hJVpn5c65xzdM0l5PyO8PTnHlvfz3/9dI=
X-Google-Smtp-Source: AKy350ZXHXw3Cr54XDJ0MkBa7Rj9rk/QGT60uVITuoRVadltGhav1UF7ebOXiDidC2880niBAiWlEg==
X-Received: by 2002:a4a:4f06:0:b0:546:47de:cdd with SMTP id
 c6-20020a4a4f06000000b0054647de0cddmr537854oob.2.1681982479371; 
 Thu, 20 Apr 2023 02:21:19 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH RESEND v7 04/12] target/riscv: add PRIV_VERSION_LATEST
Date: Thu, 20 Apr 2023 06:20:52 -0300
Message-Id: <20230420092100.177464-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2d.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:25 -0000

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
2.40.0


