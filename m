Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqeM-0005Xt-Fb
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeK-0005U8-NX
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:24 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeJ-0001c5-3G
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:24 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso5224489pjb.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=WaArnU1E7ZOhWIojKcRpPs4AK8dgp3ZqQAhObrBosPuDLj736WXHo0gQWGp6e8Ye/X
 HlbqXqSqNJf54J0UeqIc13WmgxQtm+EblEcEgb3BSDvbQgUGr2i9mBIGXqIkXYf49XLi
 aU+tdBVkKaPTRILkrD/5u04M590nS6MbHf8ko0UR2U5S8PpJJ+kQjU3+MgPGBqg+rbZl
 OeA53/hBmDiSKMh7NlC+savyPbVfbats7A4r3yKDF1qqM3jrR8xuuHLd3uuynCPoFGyS
 RP1G6MQC5KsQI+ilkDHamLJ3E60OX7zV1kPk+lGTly4P2EGoW2AyJmpOw7bmr9DKZ/h/
 qUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=TXcNa0IsjHTVOo1cZmqTUgPMS11Q6n/5Npg9idIRCNZloSTHhviDgR4VDL3kA5nAca
 fGY/JsYC7aavQn9WENRg2+q8RDxbp4gwOo7ODqTyXT2NQfAcvyassR7yMXrTednTnMCF
 iIu4Rzn+crRIzIdarXJNQ8CZv1lrvms3D4w/TDPWwXOKZm340lW/G2xgbbph3JPZNEJ6
 Gcw6KfzWT0E02h3prVVBqN6UdP1Jzw+9wO0cczpABimZlKs51Nv3TrXhSgC66Xm+kW4a
 /PvkI2Ng2/dr0LwtS8fSIt0cbr1ikmWQXcnUaRGLbPGD3mzfne2YiRMZcxDPelWcKEmd
 8umg==
X-Gm-Message-State: AO0yUKXXwY3Mt2lbjQK4uVLKeuY1Ze9glNPzaW3jwY27kHzfN7VbdWiN
 fusFUQ/FRK8Inh2utuLkPz05CQ==
X-Google-Smtp-Source: AK7set+tpkiz+jds5kR6jH2DSKpfpjbhjIX5YezLotwW7kP3QeGK4CSfVIAqCCMh4sSIRCrATlMsbA==
X-Received: by 2002:a17:902:ec86:b0:19a:e453:752b with SMTP id
 x6-20020a170902ec8600b0019ae453752bmr22130573plg.9.1677316522235; 
 Sat, 25 Feb 2023 01:15:22 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 19/76] target/avr: Drop R from trans_COM
Date: Fri, 24 Feb 2023 23:13:30 -1000
Message-Id: <20230225091427.1817156-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:25 -0000

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


