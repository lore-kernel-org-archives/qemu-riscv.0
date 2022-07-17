Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oD1Ji-0000ZV-7M
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jul 2022 06:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1oD1Ja-0000Tu-AJ; Sun, 17 Jul 2022 06:15:54 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1oD1JY-00031a-Uh; Sun, 17 Jul 2022 06:15:54 -0400
Received: by mail-ed1-x530.google.com with SMTP id g1so11648465edb.12;
 Sun, 17 Jul 2022 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UfOO/hTvys/TnKLNR+hGbVw+ktHc3Sj0N3kM8gYQ9zo=;
 b=U77SK8pZ5ibHY5NFl8xGqLC0I8JlrrT00af6VOlRDJDmLw0ANu3ImTwblARZB+f21G
 8y5W1RT1m2z7AG/swP905+iLuThjmZ+0L5z01KLycj6GVOvJur3nSbMgZ7nnUWh5Hp6n
 uPHZqH4ksyza+y1Q41wER5pkI+759UnnYdNzNKV2lSarFW+QNe5i/URcHM6Qf4lYeQav
 J4aYJswgUqf6l/6GdTROsvNYZ1DJaqZH1354A4vXZVNbln69XrIa3HgiuZcMvIIfEYip
 8cJ0EemVRUZBVObN/ML0vgi3uGLmQW2/4N32W7nfHVLCFVBVMaPescHKZBN/+c6MhzHa
 KM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfOO/hTvys/TnKLNR+hGbVw+ktHc3Sj0N3kM8gYQ9zo=;
 b=bAQmGVOup1BPXwI66sa4X48B1q3LmZ2eTnBrz6vuadfnurXlKcFpJO1NIA7Fd4t0Ql
 JWx7/IrTE2IFuh0ipKyD3enVQSNGDfF6x0n8tSnbjIR5CJ5lCdtQzqHFtEzm9Jnq+eY/
 4+9ClCmYEy12eXN3l4lPzXx1jv2bd7DJ4D81dPQJRiC/GNInFLujfKvYs1AOC/Ad/sc7
 9BgWI3XgV/5866SLi0PKCqezKkSdVaXFD9erzN1ULYLVWf5Rf/VtaTukFqz9cUZVWVct
 fVK7psT6uA7IXsl44hehgYowMJDyLWY/ZLu76QqvFoPL7pRyWQbRYwp/5c/AuTZ4G2Yd
 GKuw==
X-Gm-Message-State: AJIora8pru2ywxRv59EyshBBAzeoZtWsI/pFj9tZGd6TzWdFfY67rB0p
 rhn21SMa8hVq+W0CYQTjINA=
X-Google-Smtp-Source: AGRyM1u8chFR0JZKdVMxApaZUQzq0MdUMZlDfKcLXAV1JphV6xgi7OKZkwD51iMNRYp2mEXXxCCQsw==
X-Received: by 2002:a05:6402:2553:b0:43a:caa2:4956 with SMTP id
 l19-20020a056402255300b0043acaa24956mr29930275edb.406.1658052951206; 
 Sun, 17 Jul 2022 03:15:51 -0700 (PDT)
Received: from neptune.lab ([81.200.11.194])
 by smtp.googlemail.com with ESMTPSA id
 g21-20020a1709061e1500b00722f8d02928sm4249421ejj.174.2022.07.17.03.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 03:15:49 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/1] target/riscv: Fix typo and restore Pointer Masking
 functionality for RISC-V
Date: Sun, 17 Jul 2022 13:15:43 +0300
Message-Id: <20220717101543.478533-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220717101543.478533-1-space.monkey.delivers@gmail.com>
References: <20220717101543.478533-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 17 Jul 2022 10:15:55 -0000

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a94..86c19ea74e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -544,7 +544,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 
     tcg_gen_addi_tl(addr, src1, imm);
     if (ctx->pm_mask_enabled) {
-        tcg_gen_and_tl(addr, addr, pm_mask);
+        tcg_gen_andc_tl(addr, addr, pm_mask);
     } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
-- 
2.30.2


