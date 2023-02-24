Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVc8Y-0001n3-OX
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 12:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8W-0001lt-PK
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:36 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8Q-0003nd-H8
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:36 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17264e9b575so270626fac.9
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve+oK6DIt6nul51LAxAHBdjaPLfE+Xv9z7OvakbVdd0=;
 b=okm+iGUUgEDgY4Mv1sq+XI/lnNpCTaHgk5iGMyQlSfisIpuB9sAstgCmvAibvuAyQe
 ZsFLCLyIhRdSsLlDuRGPjP6QkPjhzJF2DvG+kazTYJxrZyQ5IzdpJ8SUZM2frN4IFxQZ
 lyhwzEhdcrLO2hCI2YSopePhZ1TS8gW/WJgISD6oa1vNqVxSVZzxNVkVBT9L6NAiNth+
 r2SiOiFg92Se5kl6Q15S6pQD1IFMm5kNePHBnPRTapkawwRjUF+uGwNLnuGEK3oFRKrW
 EQbt+44f8XZyLzXvaMTHkZDSQZ1J1k13DbDNZEZ5kPItdTg+ferGsnidKWoE9PR3pcEH
 UUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve+oK6DIt6nul51LAxAHBdjaPLfE+Xv9z7OvakbVdd0=;
 b=CtwK/dGIzO10WuSk86tbxQi6m8h96ahnPBOtWXwLm1ti2aXU5MGm2xmCFwLGuc1XcL
 GA0pCwWiQbaqp+NHNQDkIroYaVWnbCZHeFnwBULuE6KB0FmyRAJSoJ/+gtx1sZn63KAQ
 9jV1vQIWU54xn5RVxYjR8uBSFdbwCCVhvzljv/lzyQCvm19HejhVUa37tbWJIH4usa8U
 PzYkhSdMB7GU2/vgXrWzQmiZsNcezxwQFB96Wc8vjwj3oQVUdhqtV24WO0QVZZfGrw5L
 VVo08ltKY73qgtpd4bzf++vxtSlnt5b4lbCfnpw6dIzhy82IgMBQZCZoX7QIO06lsUwE
 djHw==
X-Gm-Message-State: AO0yUKVZ/zwrXJIPo+tEL7CdHI8UfOf4mNoJG0k+n9w/4gPAPgSHPE6O
 dohE262DEX4E7wPXbc+flPRAxQ==
X-Google-Smtp-Source: AK7set9xjk/8+hw0TwdipQK3bdxo8IsNfFRW+V2+5LUXKN5CalhXyE5uz9FwvBhUORKjk4X2VEwG+Q==
X-Received: by 2002:a05:6870:20d:b0:172:c578:d798 with SMTP id
 j13-20020a056870020d00b00172c578d798mr266886oad.25.1677260729404; 
 Fri, 24 Feb 2023 09:45:29 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:28 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/4] target/riscv/csr.c: use env_archcpu() in ctr()
Date: Fri, 24 Feb 2023 14:45:17 -0300
Message-Id: <20230224174520.92490-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 17:45:37 -0000

We don't need to use env_cpu() and CPUState().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 75a540bfcb..3692617d13 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -108,8 +108,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
-- 
2.39.2


