Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOK-0000WT-Tf
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNX-00054I-Dg
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:51 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0007W2-5A
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id i5so3877223pla.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2rLxWiBoXc5cqrNuTYk7pclm25I7T2ovSFzBdL97lE=;
 b=HoQXU/BHAs6fJkA+lfnWc1mmXt62N7ZgQsed1Bajm4nRrhAYV/PsLXEMKtTfU4h6J4
 icjplpZu5VVYRLF6OioHGNAt6vjPlSYyP0V/1uc4zN+6NPPdU7YtbLQLubX48+V6AAvy
 lzZDFiZR4q/48aAvXH2gIh0sGIJMU1Xua1HK8EVDRrrT7uJbvadMRWp/EnvCazFo8ZRh
 1TjbWUzAhPNcKnHgMju/TYQlrRlNqxIpw5JUk5o3wehkHy36u/7qQQVEDsESu6vTXXFt
 UKucsp8odwj/ju1VZNq4iR0OVJ/CvTdQu/LIqhpETc07iK7zrFpNEMhmmgKIpEbaLAhv
 RKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2rLxWiBoXc5cqrNuTYk7pclm25I7T2ovSFzBdL97lE=;
 b=epi/ZZsu3nc9Q+olUGHWfJuHzMlFF9bcEVz1/QM2prhV/7aPghjrOWV7LGk1RFw6D5
 fJaglToi7cf/ZJMf5fUhITTFCmlmbhv0F1Op72vUlYqKM2GJ+S2iJ64GswxtdUqkygsJ
 cfJnqly/WefZHfP7UvCrP8mAG+TxyBcxs3NAlFx0XkqhbsEivfUKvtpPjMBzxImInMK8
 JwAPfcJKhkY5FM1sbqAjImDjUe6LFj2yGUs/3b785EgXRHOhEBkjoF8HH1TtraSFRCtw
 nnWvvAiBLlGYjTc11KI0UpVMb1XXHKmYUFvJaZT0VXtoVA+O8mWhlX+VdHSEbRjqHRaD
 4OIA==
X-Gm-Message-State: AO0yUKUd4dn7/3jtIXG7AuaGJ0PEw/JjogMEJFfFX4qCJU9PZXdILmLf
 kK5OmDc9JoHNQEzBu9qYYv25hA==
X-Google-Smtp-Source: AK7set+U80p2zY/7h/wIcpOXA0FGD/90henyfodEgvv6xYHvsSjmEdkB4dGUxIZIrNp/WzrUioq5rA==
X-Received: by 2002:a17:902:ce81:b0:19d:181f:511 with SMTP id
 f1-20020a170902ce8100b0019d181f0511mr2158458plg.30.1677476924766; 
 Sun, 26 Feb 2023 21:48:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 68/70] tcg: Replace tcg_const_i64 in tcg-op.c
Date: Sun, 26 Feb 2023 19:42:31 -1000
Message-Id: <20230227054233.390271-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:52 -0000

These three instances got missed in previous conversion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 53e96b5b69..9753b08f6c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1547,9 +1547,7 @@ void tcg_gen_muli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (is_power_of_2(arg2)) {
         tcg_gen_shli_i64(ret, arg1, ctz64(arg2));
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_mul_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_mul_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1946,9 +1944,7 @@ void tcg_gen_clzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
         tcg_temp_free_i32(t);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_clz_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_clz_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -2000,9 +1996,7 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_ctpop_i64(ret, t);
         tcg_temp_free_i64(t);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_ctz_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_ctz_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
-- 
2.34.1


