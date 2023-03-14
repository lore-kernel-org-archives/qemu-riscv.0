Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7r2-0005kD-0R
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r0-0005js-On
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:26 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qz-0002qi-B7
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:26 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17711f56136so17950335fac.12
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=NVhY0krX+sAIZbPDXLRVgDkxHcdEalhTTWyH+e6xZUTt0VaH9EBR8/S84i1yG067L5
 1914s9b5RCpRddUpqVfFOViCLBcZ3CColq2gzuaTjowKFZUIUVHJKK+56mHmZ76fF+nQ
 VJ8KMAoigwkvKPmv1EKAuFGw5VD6S5C3UP1W/CNzCTVP5ltUvPjL1v52wx1m7KhHIv+p
 J2mABVtbdKtXGCIF0d9FTv3YaiLgwoFu6fEQO49i1lA1co9sDrtHy91WX5U8Jdq5Bu/a
 llQVg3e5etdi9rd4tl1J5s79g5SSqfdx5d9zkhwD8vQiD+LeZDSd29SWgOdv8/xieI5V
 dDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=11ZUq9e9520QgTEyf9sHnB4WAa6er3OZuKBQ0cG9d2rcWS5Of54dGST8qUtSsIUZ6u
 zzrVUGDsg9AAVW2p8LAHttV1ANty0q3DKOL0qFHodNOh8msa3r18GqknCtm22NK9cBcV
 Vvu7Qpbsumw+SLcn/FvkZBWkn3X0dt7Gey2S4dQq7EjSVrglyJLAMkf6p46ACsSzgcaF
 xzbbRF0m7pLcJ0tVmljKp3qZ4ARnehWhrd99YxryNHhqB2u6oqIz33WjEAJqMYfNE16G
 2PNf6oqETuFFYvvhPHWSvDgJQYuq5fx6srLyt2rJLVRE0ugBr0SIkcKWmQt30H4UDdc0
 /sXg==
X-Gm-Message-State: AO0yUKW+D8RqB7BocN8C1UG0ph6oGendjPdOb4ZYMP/uy8+jpdALA7Q7
 8HUJXh2FP5yAiXwAmmTMd2h8AA==
X-Google-Smtp-Source: AK7set/mc19q8UN02Hle/UuD600deeagzwb7KWE1EKmtLfKi+9lJ1QONzrqGmg8W3R75WkF/5KGpMQ==
X-Received: by 2002:a05:6871:6a2:b0:172:80f6:9368 with SMTP id
 l34-20020a05687106a200b0017280f69368mr13707231oao.22.1678812624737; 
 Tue, 14 Mar 2023 09:50:24 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 10/26] target/riscv/cpu.c: avoid set_misa() in
 validate_set_extensions()
Date: Tue, 14 Mar 2023 13:49:32 -0300
Message-Id: <20230314164948.539135-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:27 -0000

set_misa() will be tuned up to do more than it's already doing and it
will be redundant to what riscv_cpu_validate_set_extensions() does.

Note that we don't ever change env->misa_mlx in this function, so
set_misa() can be replaced by just assigning env->misa_ext and
env->misa_ext_mask to 'ext'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7b6e7b84b..36c55abda0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -949,7 +949,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly, setting env->misa_ext and
+ * misa_ext_mask in the end.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
@@ -1168,7 +1169,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVJ;
     }
 
-    set_misa(env, env->misa_mxl, ext);
+    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


