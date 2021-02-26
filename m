Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTew-0005CU-P0
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTev-00059H-8I
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:17 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTet-0000MT-Nk
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:17 -0500
Received: by mail-pf1-x42e.google.com with SMTP id b145so5325503pfb.4
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Oj6zdFic6NGpQV/DS08Hb8h3hPvrSha1nmKRgxJUgjk=;
 b=IFN84pTzpOU+RjHHdPYNNMgcUxkplIWFTGQN2+Rsn3JJSwSib3umTLJeyHvQ5vGrhS
 y9XX/Mpk2c4zz0moA3f+/ewArs0v2dxLnJdfpUYYS6JxhdsnvKIZH+Gl2gKMDF1MXhdE
 FKKBTywkMK0LFnTfM6SUq1yMGYqW4wFZQPPKqUtDO5RmSF51GHKCYfoQofGf23itc37n
 Vwn+7ofaMv5ef+k3Gfq7wVuq7rMVtP8sh9ohQ2xj3jht5uA3iFCe00JuU8LIxejORvj2
 n36MOrOCV2eJ6rQk/rAQ0E4IAzuNu/Gy0plFIyi0N1iTPcSAWDv9jKHEqpGcAOjmFaIa
 5vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Oj6zdFic6NGpQV/DS08Hb8h3hPvrSha1nmKRgxJUgjk=;
 b=rtQOwLyLUnFvqT9/1b3PNap6sasaIz7UickeC/ULuxy0SAWJy3ahngfJ41eOSJ9DQb
 nwmKkzRGUOjPmzhMQYarJZTwIr+oEUiFJLXMj+aKhRPnPJ7e5RNu8HfLQ8vOtGzg8Ath
 YP6X/1gkYtO3o0kKeMg84a/hko/Nlx1/ndbeprHJL7PiwjerUB9ydOkzItfha8RuU9vj
 RgVCmHVQ4zYFaHgzk1VJz2XMeOasPumR2wta91ihgYWTyHUfdVX/IWOWirk1s785CP0f
 HzZGQPNXWTqjyHwjVW14k13oRsN3Xa0t691T6Qdwkdq1OIXkeJZacqDYaj44Brn+joud
 79Ng==
X-Gm-Message-State: AOAM533eI4N6Eeoo9Bhvrl04d8pILu4vRNWdaoDGvb6W3FRExJ8lTnwt
 vffzrXUDBxPBXS2S1QNFMOtH0islDYdRuA==
X-Google-Smtp-Source: ABdhPJy6S6FUxjIOofUEAc8tj3b1e5QIZqjDq7NTAs9W1I+Qxrg6S0MIxAkkI/kckVXKJO+un1MT8w==
X-Received: by 2002:a63:4922:: with SMTP id w34mr991133pga.423.1614309554442; 
 Thu, 25 Feb 2021 19:19:14 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:14 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 02/75] target/riscv: Use FIELD_EX32() to extract wd field
Date: Fri, 26 Feb 2021 11:17:46 +0800
Message-Id: <20210226031902.23656-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 26 Feb 2021 03:19:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..bc3f212ceac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


