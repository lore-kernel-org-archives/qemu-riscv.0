Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgopu-0007rm-De
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopk-0007bN-Px; Sat, 30 Oct 2021 09:55:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopf-0000tC-2d; Sat, 30 Oct 2021 09:55:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id n18so8720521plc.2;
 Sat, 30 Oct 2021 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5qBDsm0HSeypgcWR5fXXbdqYJxVroc0DuPQz42Qsh4=;
 b=MzZYKSAjHgaQkcTHe2i79OBrO/X67nZmxpE2OhLUt16yPrLJGHPsWoEgDEK3u0jpCO
 Mce2Om6937iTJ7SsSkskP/5nqzwCqaBilJULctvxgdEaaWpLTAjJRnu/1rXfr4NOmPUv
 pfaA7zXhF8KfqvDLMFKWZ1cKNKbpv2mhgM7Z7uFHfvg6KJt40rPg0/L1E9BlEWq7LxyD
 D2Vnv/xy2TanM3zXyiSo+19vPnQDA6V+BZOei33mqaFIGMt6sIVPLeLlYNwKh6V0oKJV
 YyCWHLHPZV/P3iVkhrUdEIqNck5uF1BELmUvCPJMfi4ViRPSh+EZ+Fx5joU6wB/amZVL
 So9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+5qBDsm0HSeypgcWR5fXXbdqYJxVroc0DuPQz42Qsh4=;
 b=xGAyzYj53ozoj2tsxQPoQT4oDrlz+B2dmIN3LLwXHvpJgBR0a6Im+T1y40jvCv6Zhh
 FP/z2ZEqhYK/KFltYqvKnAWRdRPrzJftABBXVVlWoS0tnFCAyi1OsP4m2pIsmj1cUw6V
 CQK2tAGLdHx6Hcfz0fmByIhxjAfocR6aMHu8vkuXaoEpL9cNUWLu+AL1jj4tpMLCL89y
 GZ8wm901GmlfJ0ZBy1vjNwmwJKsw9RnYwMOTbv+nYA0du+Teawoxk+kCv+OBnBm6i8Qn
 v0Ew8GOvQ3aACYjnW7csaU9keR5UnhGjX/J2pMyCNHr25cWZ4GpIellqRKEqaUw1yp7f
 vl1Q==
X-Gm-Message-State: AOAM530JB/r9wPlmoGHlv42sE7QqnWu2JzFczOBLQdxIYX/4foQ22bVO
 NeZryv52hgfE5obFhODcIK3CnD4urlY=
X-Google-Smtp-Source: ABdhPJyn417d0jCPE6w3KMLQNfGQ4mV2NGzGrRV3NCkrfESiPaWDfG6HOjo3VLw+MuGkvoh+0lMBrg==
X-Received: by 2002:a17:90b:1e4a:: with SMTP id
 pi10mr18294138pjb.142.1635602135889; 
 Sat, 30 Oct 2021 06:55:35 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/7] target/riscv: cpu: Enable native debug feature on virt
 and sifive_u CPUs
Date: Sat, 30 Oct 2021 21:55:12 +0800
Message-Id: <20211030135513.18517-7-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Sat, 30 Oct 2021 13:55:47 -0000

Turn on native debug feature on virt and sifive_u CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: enable native debug feature on virt and sifive_u CPUs

 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6f69ef4f50..b4d3c58dea 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -153,6 +153,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
+    qdev_prop_set_bit(DEVICE(obj), "debug", true);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -160,6 +161,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "debug", true);
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -175,6 +177,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
+    qdev_prop_set_bit(DEVICE(obj), "debug", true);
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -182,6 +185,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "debug", true);
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
-- 
2.25.1


