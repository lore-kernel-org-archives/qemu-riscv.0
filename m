Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIg-000514-C0
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIU-0004bI-Kq
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:40 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIR-000572-LX
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:38 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5037564pjb.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
 b=bSky75kQNaokGkldwx9WxvHXxWcYAfLjGMAg8TIokjVgCOZfI+i0Zl1NjRRHy1Qfjf
 dIvY3HBlE/GwPhvXZXbZjfFpIgeIkRECH5l9Fnm8Pvtx8QZEeF9WdsEM3QUNGNdpYUhH
 80eGDpo2PZd2Q9m4jAmzxolaXBakM4raYLpmH4a4Az4eo3hQxFlsS6XeIxurRP4HtL0F
 40bTr/RbWi7wnpwEE9jLGxq+h2biZA0vcUkNTdCPfbR+YIBP5gPMmcOdoZDBKtLgywvc
 +PXGbNpXarxhDGMfcZCbMmsTHIybdqmubWbvavzexbCY7rkGvl5ZqfJDR5F3RG3Y45uK
 zGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
 b=INWFDYsGSnPPOFhwPpe88Ui7keV37sYoMq7CHupZVIoyYRq0J6HtbMt07DPQCNcGKW
 5wuHVKjk72Wpgbn1ymlBzwpCabFQl+Szgdy5MX8xveJ0HJKAlZLuve7CIjq30pTbrsA6
 73txcR7MzR9zbtethtvO1maQZXkCBUivRsfYjVrgDDbCP9XSKyQXk3iyQA0xrK+m5ROj
 tMpN0jEi8uTd8dEkPvQ2wREHdRCbWIhfOXUtmj/ORQBr45Co0aDjF7tld74Ei4Nk4U7U
 q4lV3Oll0paCzMt6jzrjmZV+K7ha+mFOt+aiHNwoIxpX357wKBoo9iGdLCrPMjkAk0Z5
 CKig==
X-Gm-Message-State: AO0yUKUP4cL7cpvlreBbWtNdtgBkPbvUYZwp5wR9gMbj4J8JCINom3cL
 6CKleNajUqTCjRIj/I4Uq4FArQ==
X-Google-Smtp-Source: AK7set/lA9y7f3mKs9mJcXHV1jIrRikf85XLZCw8yANO5NjWeQyhV3oqvAuB8FqQn2SIhQOo5MhYTQ==
X-Received: by 2002:a05:6a20:72a1:b0:cc:f47b:9e with SMTP id
 o33-20020a056a2072a100b000ccf47b009emr5782642pzk.10.1677476612483; 
 Sun, 26 Feb 2023 21:43:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 18/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_rvalue_pred
Date: Sun, 26 Feb 2023 19:41:41 -1000
Message-Id: <20230227054233.390271-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:44 -0000

The allocation is immediately followed by either tcg_gen_mov_i32
or gen_read_preg (which contains tcg_gen_mov_i32), so the zero
initialization is immediately discarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 760e499149..c0e6f2190c 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1889,7 +1889,7 @@ HexValue gen_rvalue_pred(Context *c, YYLTYPE *locp, HexValue *pred)
         bool is_dotnew = pred->is_dotnew;
         char predicate_id[2] = { pred->pred.id, '\0' };
         char *pred_str = (char *) &predicate_id;
-        *pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        *pred = gen_tmp(c, locp, 32, UNSIGNED);
         if (is_dotnew) {
             OUT(c, locp, "tcg_gen_mov_i32(", pred,
                 ", hex_new_pred_value[");
-- 
2.34.1


