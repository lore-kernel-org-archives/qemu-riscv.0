Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtn-0006uu-NN
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtJ-0004z5-Ui
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtI-0002ON-B3
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id j1so14578847wrb.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299835; x=1683891835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zn52Ufb7DRbVaQ81Qm+6XQB/991khVVrBH6/wkfCyPw=;
 b=tct9DIzAzD/uENt4eA2Cqn0Fmd8KmINwv3jrPeu7YUoQLVUOVMPtzAs11P6KlHoEBq
 psbFabdJIBPWD8DQTUYlUO5bBp6p39SwcTmPc665VJgPvKHUuOW+CqMdp8GkU0XJ9oPj
 7ul9MXh2162cSexD4qFLsIoMAFyFaVC4ZBRwsAz1P016MjhKtLo95qBEvRVU3AP3CaKX
 nDJFB10/mTbU4jfLUWHkqxm0ZIcYbCSBiVXXCFptlpFk2L9542vlDyh/zh6bnFMuTR1J
 P0A7IWrKn80LU++ix5yPdWrYQtInz+oRSBp+3hDDaFa8/fwnedql3nDOcE9P+A5Y7Ev9
 z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299835; x=1683891835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zn52Ufb7DRbVaQ81Qm+6XQB/991khVVrBH6/wkfCyPw=;
 b=URqqyEmoo+SpDGU+h/Cn0dbI4kTbi1MyJe5GI1Z9TQQKq/xbI8g+7IhslJfkNE6dNU
 7awuIATfBOO6gOIXff+UDAqR47oPX4hwrrkaBGQPg2uu3iKQdE7DhvnDvcalX8G50DJa
 AQO5CR9rX2juPbVtd5n417UNVCoh9xsR7lL6eX9+8jWaN3Vr5LIRfsOPmfkGtVhcqWOE
 YAkTy+i/NdOeENKVIW/K8v3OM2x+r/c+lkn8jsyLa3CRIZYOIz8nbgnFDh+aJrEPsGEk
 /UPmuQjQovy7HcekEt1ZmO//ael7vizqa0AqdDn/bmSOVrm727ZPFgYvjOWeXpnl5ltf
 CW3w==
X-Gm-Message-State: AAQBX9feeWxsyb04aTX4NTDsSrpf1IoS6icHVPDKmAPUWDN+Bt7cxVmj
 4fugWQi7Ehwkr6ac8viGbXv4BA==
X-Google-Smtp-Source: AKy350Y7eOmOq9QKa+ymbWiAbGYqs2gUm360EMJFkcH6lpvLADPH9jRCJHxcCQB4Dt272SSs6fVbHg==
X-Received: by 2002:a5d:4902:0:b0:2c7:d575:e8a4 with SMTP id
 x2-20020a5d4902000000b002c7d575e8a4mr9580924wrq.65.1681299835563; 
 Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 22/25] target/riscv: Don't modify SUM with is_debug
Date: Wed, 12 Apr 2023 13:43:30 +0200
Message-Id: <20230412114333.118895-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Apr 2023 11:44:04 -0000

If we want to give the debugger a greater view of memory than
the cpu, we should simply disable the access check entirely,
not simply for this one corner case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-23-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6dc3fdf594..9a2b944990 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -823,7 +823,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx) || is_debug;
+    sum = mmuidx_sum(mmu_idx);
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.34.1


