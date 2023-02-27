Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIi-00059f-2l
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIW-0004d9-Rd
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:47 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIV-0004yo-0V
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso945026pjb.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCx3V9E9EGBx0xOadAkXFFn5kP53awpB2DH7f1fkm6M=;
 b=o6xly6XMScfYjIqZw7WagdWsOewMn5SLZnFg2CKnYAuyzbr25ryXyoVQfP0eqAA6XU
 BMRefkjgAe04OwNdZePMap/WEXkSsaZcCL3G08hZdM0CzvOe3fMJktuvvF2v568bQYkt
 Dz1/bMCcLoVaTsnDVJO82BDLdUrsye8Fn633SVTbFhWhEIvu8OvYJ1Eg11Zd52qq7iKZ
 DpsoKivez69WGEzl1CJVqtTL2KvPS0175Y/Mhelgd3x5+eKdYTsrViYuJPvvCPn3NFPD
 7/SbOOJ2UTHLZYokvyvDOFP0WDGhCvjUBFSf2heGD9X3ohDiC4r68wDd3jecvA8OAnep
 HzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCx3V9E9EGBx0xOadAkXFFn5kP53awpB2DH7f1fkm6M=;
 b=31adeXRJRDmfW9blme90Ffzyn5V35AJhXf4QzI+WiBVB/S+axHKC9fohJ9F+TZkwTq
 pv3ToOqFELQ3QjW48L7KY2iHRPyZnJ63wu5ALmuqCsHV0kYiLj9jd722G4fJA0jRkQJ5
 Iw/UYYf6owmM/tlWqGdm2C6qOC3hn0nW8VtYpzzGANbJfs+BTVAfDWI0xkNaX4wj9Hev
 0qMniZyloGZcGyzHfFOsHredsk35UwYoG0S/4mrEjI1UZ9+Bf6ZYUVD4z2s05p4YeGF3
 lJwKlresyevB7I4v+pBvbyZ6/auV//asQzjABe2Qdy2is0yHBVb4I4FNl3uUoqkl7wqn
 FC9g==
X-Gm-Message-State: AO0yUKUJYmhKTrdjbXn41GkdTeIt4WscjwNGa6lLj9b7jjqOPizJMV4D
 vHcDTmPU9adec537tjpG5S+w/w==
X-Google-Smtp-Source: AK7set+Q+eUxTFuA5z78oJqWLZAGE/XIlG5+bEhlQRwvNvPTWdtXHdsbf8Z7ka6W2fZv8CWb8Ya4BQ==
X-Received: by 2002:a05:6a20:2d9a:b0:cb:77f0:9a27 with SMTP id
 bf26-20020a056a202d9a00b000cb77f09a27mr19496594pzb.24.1677476618083; 
 Sun, 26 Feb 2023 21:43:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 20/70] target/hppa: Avoid tcg_const_i64 in trans_fid_f
Date: Sun, 26 Feb 2023 19:41:43 -1000
Message-Id: <20230227054233.390271-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:47 -0000

Use a C test instead of a pre-processor test for the id.
Use tcg_constant_i64 instead of tcg_const_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index cb4fd1fd62..3ea50d0cec 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -3547,12 +3547,16 @@ static void gen_fcpy_f(TCGv_i32 dst, TCGv_env unused, TCGv_i32 src)
 
 static bool trans_fid_f(DisasContext *ctx, arg_fid_f *a)
 {
+    uint64_t ret;
+
+    if (TARGET_REGISTER_BITS == 64) {
+        ret = 0x13080000000000ULL; /* PA8700 (PCX-W2) */
+    } else {
+        ret = 0x0f080000000000ULL; /* PA7300LC (PCX-L2) */
+    }
+
     nullify_over(ctx);
-#if TARGET_REGISTER_BITS == 64
-    save_frd(0, tcg_const_i64(0x13080000000000ULL)); /* PA8700 (PCX-W2) */
-#else
-    save_frd(0, tcg_const_i64(0x0f080000000000ULL)); /* PA7300LC (PCX-L2) */
-#endif
+    save_frd(0, tcg_constant_i64(ret));
     return nullify_end(ctx);
 }
 
-- 
2.34.1


