Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GW-0008CN-Tg
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GU-0008BO-SR
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:58 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GT-0002WL-4x
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:58 -0500
Received: by mail-oi1-x22b.google.com with SMTP id bg11so3837oib.5
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EOXcDW6p8G+IFiiDat3ZFWdJNRQpAX4f1N5sF8hvvc=;
 b=IuC0kCJ24+ac4L5/SUOeAwRGablw1XckDfK3j2SSr50eY1tQiCpcC+0OeldEL8gY4M
 RV6XpcMJb0G7b/0WiVNmBvaL6wX0fXRGeuYmgqBYl2cM8L+pUcwHTP1Whc+WwRczp2AT
 fKvi+3eLNkAJmueCUquIITxgjYwNYt5U2Asv5WFa8kyrTQxrnzBWPtb+dxdsZkD/1Ud2
 /+a8A9KjTuS4keBjVF+jBj9B00t2FNEYY23gcQEFhli881GbPOYSSlG12nUTGq1CZU83
 mQBamcecXvC1+dxIFoCXEgLhc+mBGwKIWwkOieeU/mncSsqmI7xwARC80nujdzVrgrw9
 tOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7EOXcDW6p8G+IFiiDat3ZFWdJNRQpAX4f1N5sF8hvvc=;
 b=vOaxrDz+kjDAqAYpBbx3H5XcODxa6llfWTxcebjIjGks/19K7r5aJzO8qAn56GvuTX
 vFW6gzm3SaTdYTHh3tSUUOyDeuvv8jaGkZQTVjw4Pf1gQqxcNaxAE/WP7Lf4DOrm4uaw
 5ZqCDfqzhlkOvTcXpF98aU82WBYfyRTxw0aD61B+5Y8ieJyGVLSHUHpAfMpl16H2ssna
 hD7JTwNLFdgPwbrWEkLht4Ibe5meLZMgScVPyXcK5M9PK14+Vizzl3so9etqmvtYZ8IO
 O9x5I8mFH5jWmEKmfImidLglCGa5CxapxYhVBTZ66Oor3PYK2j0/ypYL2miM78qp79Zi
 KQDQ==
X-Gm-Message-State: AO0yUKVvP2gTK5X9BSF6Mm/qqEgmRWmRf3i8WvQXKpmXkK+myPeKt8fw
 jUOrA6AWNY6/xEe7AczUkr5E9ZQS7UWMMbafvSs=
X-Google-Smtp-Source: AK7set+D60PNp69ssW60Ouq5ifbn+94wPGlFFmDCE9OmX/l2pXMEKYJXvzHheYedmsaC7iby0RE5AA==
X-Received: by 2002:a05:6808:2382:b0:37a:2bf0:501b with SMTP id
 bp2-20020a056808238200b0037a2bf0501bmr12961775oib.9.1678306795931; 
 Wed, 08 Mar 2023 12:19:55 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 08/17] target/riscv/cpu.c: avoid set_misa() in
 validate_set_extensions()
Date: Wed,  8 Mar 2023 17:19:16 -0300
Message-Id: <20230308201925.258223-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:59 -0000

set_misa() will be tuned up to do more than it's already doing and it
will be redundant to what riscv_cpu_validate_set_extensions() does.

Note that we don't ever change env->misa_mlx in this function, so
set_misa() can be replaced by just assigning env->misa_ext and
env->misa_ext_mask to 'ext'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 499738d2dd..dc6e444219 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1153,7 +1153,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVJ;
     }
 
-    set_misa(env, env->misa_mxl, ext);
+    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


