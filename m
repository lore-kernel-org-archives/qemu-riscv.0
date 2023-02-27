Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIl-0005Ky-4F
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIf-0004s5-5Z
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:49 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIX-0005Af-TA
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:48 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u20so2790906pfm.7
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyCeX4bwIEzy4e7YtKlgTxEYjmitvX4LaioZWsLyP/4=;
 b=rNZ0GH8aMlSI7aKARZKSb/9/XbQu4UwWzNY6VQUM5Fb8LSaBKB6+kAH5GNH53hPLn7
 nHDB+SLwrkBLuKxOEzK+aVwp9RdXAvQDh7OfnPBxWOMiMvQAfsrvuabzIANAMTzWd+E4
 RlkvKlN9F0ql/zT8Q+Ti1fSZ95s//C73M/GLa1o4Dy08zHBLYINFDaSvPaRVxSY1knhA
 tuZ8BYNqAFEHqBXfoSkc8ko1lg3EYT4E2qlmN7laK12TnGSpRmzs61HAcv8y9gBLSxfa
 h04HLteuy5uMoWTGedFtgiLRk0iCR4s98BmOU1hAckoH3RQVh2ubH/Gr4N8BFZZ1qlXf
 QgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jyCeX4bwIEzy4e7YtKlgTxEYjmitvX4LaioZWsLyP/4=;
 b=HzBWTAnKrDeNhXKj+MwFbCOfKW8izOgRQcQ/FA7YDlrLMDBO7OtRinjnXPoRgx4+FY
 sxKXEpcF+Ogy3mcsqhvEC9pMJrefkWp/HqYbCUZZ9MkPmNSfvlJ2E55PDz/4VQA6TuJj
 yvo0+wWZX0zjwfxCv8pnmXcMcb04Xg73au5ed/65hrR0y5KKt/6/zTYrHnL2LDGWUJHp
 AHiOOaVkPMrAJ7wG1yR+vdXqLvVh9Rtx73rXzWbzarb2mrQnN/MHYh/1TvFDnMowF2Ha
 ek+uj7S0a539Gwh/sEUhvtVnZrauLYstkgSNh3UqLZC0kReNaTsN3sQr8bHNTH01R10H
 Y42w==
X-Gm-Message-State: AO0yUKWh9tpemMqHuwtNhl9fJkHWpPejt8liZfRfDYoTMLvAxUhRITaE
 JSwRDf69wuk1/fpZ3fHdRxF0AQ==
X-Google-Smtp-Source: AK7set+AGMHBvRaJd10ZN+qRSUq9A0zk/67aECI/xyyGol6VfnrOWvaw4m06tun2OHMVPGxjYJSm8w==
X-Received: by 2002:a05:6a00:f95:b0:5a8:d3d9:e03a with SMTP id
 ct21-20020a056a000f9500b005a8d3d9e03amr7973139pfb.0.1677476620649; 
 Sun, 26 Feb 2023 21:43:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 21/70] target/hppa: Avoid use of tcg_const_i32 throughout
Date: Sun, 26 Feb 2023 19:41:44 -1000
Message-Id: <20230227054233.390271-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:49 -0000

All uses were read-write, so replace with a new
allocation and initialization.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3ea50d0cec..6a3154ebc6 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -135,8 +135,6 @@
 #define tcg_gen_extract_reg  tcg_gen_extract_i64
 #define tcg_gen_sextract_reg tcg_gen_sextract_i64
 #define tcg_gen_extract2_reg tcg_gen_extract2_i64
-#define tcg_const_reg        tcg_const_i64
-#define tcg_const_local_reg  tcg_const_local_i64
 #define tcg_constant_reg     tcg_constant_i64
 #define tcg_gen_movcond_reg  tcg_gen_movcond_i64
 #define tcg_gen_add2_reg     tcg_gen_add2_i64
@@ -228,8 +226,6 @@
 #define tcg_gen_extract_reg  tcg_gen_extract_i32
 #define tcg_gen_sextract_reg tcg_gen_sextract_i32
 #define tcg_gen_extract2_reg tcg_gen_extract2_i32
-#define tcg_const_reg        tcg_const_i32
-#define tcg_const_local_reg  tcg_const_local_i32
 #define tcg_constant_reg     tcg_constant_i32
 #define tcg_gen_movcond_reg  tcg_gen_movcond_i32
 #define tcg_gen_add2_reg     tcg_gen_add2_i32
@@ -574,7 +570,9 @@ static TCGv_i32 load_frw_i32(unsigned rt)
 static TCGv_i32 load_frw0_i32(unsigned rt)
 {
     if (rt == 0) {
-        return tcg_const_i32(0);
+        TCGv_i32 ret = tcg_temp_new_i32();
+        tcg_gen_movi_i32(ret, 0);
+        return ret;
     } else {
         return load_frw_i32(rt);
     }
@@ -582,15 +580,15 @@ static TCGv_i32 load_frw0_i32(unsigned rt)
 
 static TCGv_i64 load_frw0_i64(unsigned rt)
 {
+    TCGv_i64 ret = tcg_temp_new_i64();
     if (rt == 0) {
-        return tcg_const_i64(0);
+        tcg_gen_movi_i64(ret, 0);
     } else {
-        TCGv_i64 ret = tcg_temp_new_i64();
         tcg_gen_ld32u_i64(ret, cpu_env,
                           offsetof(CPUHPPAState, fr[rt & 31])
                           + (rt & 32 ? LO_OFS : HI_OFS));
-        return ret;
     }
+    return ret;
 }
 
 static void save_frw_i32(unsigned rt, TCGv_i32 val)
@@ -613,7 +611,9 @@ static TCGv_i64 load_frd(unsigned rt)
 static TCGv_i64 load_frd0(unsigned rt)
 {
     if (rt == 0) {
-        return tcg_const_i64(0);
+        TCGv_i64 ret = tcg_temp_new_i64();
+        tcg_gen_movi_i64(ret, 0);
+        return ret;
     } else {
         return load_frd(rt);
     }
@@ -3330,7 +3330,8 @@ static bool do_depw_sar(DisasContext *ctx, unsigned rt, unsigned c,
     /* Convert big-endian bit numbering in SAR to left-shift.  */
     tcg_gen_xori_reg(shift, cpu_sar, TARGET_REGISTER_BITS - 1);
 
-    mask = tcg_const_reg(msb + (msb - 1));
+    mask = tcg_temp_new();
+    tcg_gen_movi_reg(mask, msb + (msb - 1));
     tcg_gen_and_reg(tmp, val, mask);
     if (rs) {
         tcg_gen_shl_reg(mask, mask, shift);
-- 
2.34.1


