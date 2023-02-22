Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuE7-00079L-D8
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE4-00078k-GO
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:25 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE2-0004Kh-E7
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:24 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1722c48a773so7953034fac.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOJjQ+LYJii84tGGghSEtNkWZ701Sd54P2KPAADn0Ns=;
 b=du73QTC1s8erzOXaFLwbB6tAUZGQ8cBSvjvgDZb/BU3BUgJcw5bsig6oklO4LZulX1
 Po/liG+40zjc4ULXG2a/0pzm6JF11DAQpuNros8r79tIpQy3nK7yv8grmK37GKzm0JDR
 hPiMDeHlS5F9esOkH7/xrw/xSggfubWe6egynDpNu9Y8u3MUfgFgIno8y4qARJkVklxE
 3/GwZqbkgc5dZFuRdMpM0vrNXztxoFxzpvBSYvDeydzaIfjsMLC3jMFLntu3zkIv34AC
 8jptoo37t0+fs32YGXKmXUiiDMqh9Heq54zI+x4hWBYM+279eCZkK8Y3UbnXECyDBImr
 l2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOJjQ+LYJii84tGGghSEtNkWZ701Sd54P2KPAADn0Ns=;
 b=dJUlCzHMbqKO3+T5GcQJ+0tzE5bd0EEykT5QrPYg84X73JWd3x1m57OrqI1pPrRe9T
 nMEgCJuXvJJSfya2t1QGlDrjUYVawufvk43q+bEUlat47o2CQbxpS3UQfG/s4gFOieK+
 jL0uzvjGqLmF0o4ziqNMx9iRiZ0x6TQnneuQZ1shbO8aZsQxxHXYPVZGBIN7Dv0QXA1F
 ksLisZXd4hd9YGHinvjQr0BNwWZXSiN+BGWqmrNXvOXMHINMstZc4zWYJLibzvpraNYR
 /tw/cgFcXH+cQOwM6dGkX7y/cdOTJSJfMnQUaDmQ9z/arSFamER1AJmW9ZZYQCEVvXZR
 S75A==
X-Gm-Message-State: AO0yUKVyBZLQv0dT1WJlhyAgLGoVir/GlZO10k1KIezI53ZkRL0LlxD3
 laVtzrnc09xenN71WIcPh2nLHQ==
X-Google-Smtp-Source: AK7set9Os3DLBTYwLsmrpnpCVphGmHT48v3uJFc82cDhn6rpcV8TEyEgUGCmbLLGLjBSkUZOMEzg8Q==
X-Received: by 2002:a05:6871:1c5:b0:16e:676:bfea with SMTP id
 q5-20020a05687101c500b0016e0676bfeamr8930971oad.9.1677091941239; 
 Wed, 22 Feb 2023 10:52:21 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:20 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 01/10] target/riscv: introduce riscv_cpu_cfg()
Date: Wed, 22 Feb 2023 15:51:56 -0300
Message-Id: <20230222185205.355361-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:25 -0000

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..215423499e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -654,6 +654,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
+{
+    return &env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.2


