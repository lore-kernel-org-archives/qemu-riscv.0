Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1s-0008Ah-K7
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1V-0007KO-3o
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:05 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1T-0007Cs-AJ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:04 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8836835pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=haYDju3Oq0TFDt054lTRvhpdyhG8zQrYLQgWvStwosYWTF7DfYk1IxrgEN56G8Ay3w
 YUW2gID5JRO1+LtFd5OVvVUjd0UqENyltlH8lLIEfOplJccS5zqyLaP1LhVpF5dUNDoY
 j5SRjKrK3z0+yP0BmVioTx3RNjwNU8aC5WTkmYp6VXdOXcyndO0yDRm4NzbxP/tRqrkl
 1r0Jo/KJ0IcahaTmeQtwD4x3ALtjXryAboDgthVJLy7eWtPFRUniWYaBgNaF0yQJ/ceT
 glgsE/HfF2HdhbHCCgV5TZOq0OfgDDMv81QpEvGg8HCEE/bImdlOeCn07NwiFjxE+3Ui
 /KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=adQJELmePE4W4u117wQX3Mcl1JiVX1waeXaJmA43J1hNWN+DYwt0MTP5iRYxNXX9mK
 SS+43Vo98zs7Vipo9QZr+K5Tf7DA1mSaLVdIZM1c+qZXfSpJhsnLyFomA14h54kqgO5i
 A/Se0OwgadKWc/FQkGMbyI6H2EkvGKB2v43xqA7wh/pHeDvkZOjahoyunf2zvgrFaTEb
 E5MvQVUofIrXZC5RA0H86BQNFIjYI817uUi4ESRskKs8VAKgLKKPDKdbly+YxKh8vsi5
 yND7xqnLDB45m0yaJlPvJJVZJ84u+wD5Zb811xxokxcXDFgcSaBvbv/4ITtQ8vHWh+HR
 yYFg==
X-Gm-Message-State: AO0yUKW5WNd+a3Z3H/nP9nBzDo/fX7b1mWT4VPfi5yRQ3Rjn7FNFOaKc
 MQ6o10cA0RWvL2/MbitbqKIgXA==
X-Google-Smtp-Source: AK7set8W9RMQUbuGHkBa56ZwzlcEiqGNtkhXoZukDkPODsPLd3E2bHNArOowCSYWauG4+C5x1+noIw==
X-Received: by 2002:a17:902:d4c4:b0:19d:6f7:70d2 with SMTP id
 o4-20020a170902d4c400b0019d06f770d2mr2969392plg.50.1677475562632; 
 Sun, 26 Feb 2023 21:26:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 19/76] target/avr: Drop R from trans_COM
Date: Sun, 26 Feb 2023 19:24:08 -1000
Message-Id: <20230227052505.352889-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:08 -0000

This variable is not used, only allocated and freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e7f0e2bbe3..4f8112c3e6 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -670,7 +670,6 @@ static bool trans_EOR(DisasContext *ctx, arg_EOR *a)
 static bool trans_COM(DisasContext *ctx, arg_COM *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv R = tcg_temp_new_i32();
 
     tcg_gen_xori_tl(Rd, Rd, 0xff);
 
@@ -678,9 +677,6 @@ static bool trans_COM(DisasContext *ctx, arg_COM *a)
     tcg_gen_movi_tl(cpu_Cf, 1); /* Cf = 1 */
     tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
     gen_ZNSf(Rd);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
-- 
2.34.1


