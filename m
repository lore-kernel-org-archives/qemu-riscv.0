Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT4va-0005Dy-JS
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 12:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vZ-0005DJ-Hm
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:45 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vX-0000wS-TO
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:45 -0500
Received: by mail-pl1-x62d.google.com with SMTP id l5so255025plk.3
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 09:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNYI9dmX50T6dGo7VdQuyO6akiZafXJYK1pmz8lKKOc=;
 b=LZkODX28HuTrsCQ/i241FbzbJoMXs7xZ7PhankcvYCodN5KoGnzEeQtkOafy7u6aWB
 IMJ19q1rLlbwdIwJ2KBwNYlWc/C3R50V/I9y7a6mv9SjHWHU+eGBHvT9xmviagjmco+I
 CrIJ8uTzawrBbVRMHT1ussNrBzcUm7OweDYqEColbepyEkFBsLQ3BpXZm5CtCsqmyjeI
 2MBllWS5xVQ3y1IBSZLj4yilcRacJUGyoxX+dGjPlIxbXgvezN81JrxAREi7YE1ct2VE
 zZmrRvkxDo+4CE0xhTe2XffAtm5cgVASn83W9OJk5/sKv07KX9bw90c9H/Nid3MVUzC/
 8RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNYI9dmX50T6dGo7VdQuyO6akiZafXJYK1pmz8lKKOc=;
 b=SfZ+EOKMLndR2P2KjOfKA6AVp4vzhf9snR2VIoPJ4dTpsB7Iwu09X+7TVu/r90C87F
 A6wtKwJe+W5g/Qkk0NKjZiUfoSP2dLk/fCyBn1to1g3kzSxVpjH38O/YQNwoCYxQt2lC
 yVRwV/e6DhPlCBos0vYJ2HP00hGQhJPnPfLkC0XSCJ8dB8GE236ktpx5h0WngDhQGXAt
 16Z621lEjl9X04Q60iYkRHehv1NAqEpGPpZTNsYjl2pGlJCB6AqDoHIE7xk1wI6LDB45
 wijMEhJx7J3cQvmtikIoA5z2F05+dCEFe4+L2fBjHkh6jawt9WJ+6Ib8/BJ/emnc/jiG
 2n4g==
X-Gm-Message-State: AO0yUKVVT7I0iLcdVNsGAytgMZGsniArJOkTuzAVGp/TJt1V5IWyh9PF
 XOebibUwaHbkw+DAi0Ukqp+DVfQhTsal5H2w
X-Google-Smtp-Source: AK7set9WrULX4Ak0RER7PdY1Gf8r+4U7zvhUxrfLbbtGe9bIZowFstAhfPgHdk2+fUsLcxJOe4isFg==
X-Received: by 2002:a17:902:da8d:b0:19b:c37:25e7 with SMTP id
 j13-20020a170902da8d00b0019b0c3725e7mr5975009plx.66.1676656422172; 
 Fri, 17 Feb 2023 09:53:42 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b0019607547f29sm3392267plb.304.2023.02.17.09.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:41 -0800 (PST)
Subject: [PULL 8/9] target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()
Date: Fri, 17 Feb 2023 09:52:02 -0800
Message-Id: <20230217175203.19510-9-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 17:53:45 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

We have a RISCVCPU *cpu pointer available at the start of the function.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230210123836.506286-1-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ad8d82662c..3a9472a2ff 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -60,7 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
          * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
          * only when maxsz >= 8 bytes.
          */
-        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
+        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
         uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
-- 
2.39.0


