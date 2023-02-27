Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6W-0006Vu-Fj
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5a-0003DU-9j
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:19 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5Y-0000OK-MZ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:17 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u5so2134354plq.7
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=sb+cdnbYsOXgn8MD7Pzyjou0dbcOJ6CQcx+rfjPxAQP/dUd5Mv5R+jTjMsYx2nee7t
 ruA8Ohas6ptT3YroJF0m97t5clvLSotWXkWElrGlMM8iQVfSdoEdp2U3+++1K0YYFBGP
 0tkR6oAMS+KjaMuoyxRC18LNqfaZrNvs+oYOYiJyxqL6ZNo4brXKAnERH+MiMhypEEAi
 rDOS7P9PgVefPFAPPIBObDLZIU2hqziB53qQX8rNrBeIo89U2KFwewRssXL5fC1CXl2V
 BPwA4DVyRg0Zwti0K1Y7RN4vYuSzvJYzQg5zbS3ltY7f9JBQd7VnuL1ZFWwHHP/Edtxy
 R/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=lYQUFPdevdor7JxCSwIuLCFGfBxqUz0SaEbKjWBBQ+0Gpt0kIt8BezksieEyRmXAo1
 REed03AojJE8pAVkXatsqv7fkkR3EQJw53/L9lw98KoHBZ2zYO7OdsuUqQm5+CHALQPa
 7iMSF+m6MimoMtTRHHhycLnI6kgyB/5QxDQ3wx0MdQnp1aiExLIbadiTOKAVrf9WiU1d
 2SuJYDr+tEHuEnpPUyE6p6J3HytEsgDXNxqUzNoZyDxQVg2xV15KZQaw/dUlD++mEa7+
 9lwiiSOUJ6Ytb0SMgUUtC+SRdSfnCGYsb5oKZdFkv+rpa9Nxfu6fFBjaLXTMHR8m6WLt
 PUMA==
X-Gm-Message-State: AO0yUKXf1S2srdTwNzky6VpqXGnQIMlhkJczP4rfZbsY13GFdUc0gJNu
 aB4JRu8ojWQGfofUvJXSVyJxFw==
X-Google-Smtp-Source: AK7set/Rdc5VZgmgmU9jB8t7rEYssvLCmI/KxHBaUxyOshBJl5njJaR6fUk0BgIigoi2zKcq8UPNBw==
X-Received: by 2002:a17:90a:e7cc:b0:230:86de:f390 with SMTP id
 kb12-20020a17090ae7cc00b0023086def390mr24155960pjb.42.1677475815415; 
 Sun, 26 Feb 2023 21:30:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 45/76] target/mips: Fix trans_mult_acc return
Date: Sun, 26 Feb 2023 19:24:34 -1000
Message-Id: <20230227052505.352889-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:26 -0000

Success from trans_* subroutines should be true.

Fixes: 5fa38eedbd ("target/mips: Convert Vr54xx MACC* opcodes to decodetree")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 3e2c98f2c6..a7d241e4e7 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -53,7 +53,7 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 
-    return false;
+    return true;
 }
 
 TRANS(MACC,     trans_mult_acc, gen_helper_macc);
-- 
2.34.1


