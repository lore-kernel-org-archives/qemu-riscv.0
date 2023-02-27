Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWI2-0002sg-Mm
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI1-0002pg-AU
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:09 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004nN-4v
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:08 -0500
Received: by mail-pg1-x529.google.com with SMTP id h31so2843327pgl.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
 b=eVymLw/jK+sSGk4aIbnExUx9TvZm0bM3vrf64rar+J3dm/GQxf77RGiOJ+CTdg5ovh
 7zwh/AJcYtfuQNcUzTCCrpj+0ucjBC+N7dMoZkGnBCdlJyxe0KmO+zQ59Mw565yfd1DM
 DCxuRkcDPXdPczjlN2RBDyLFBuWeF5FOq+xJkdzMs/OwcPMCm+/0xJWbuGbwf2a5k1BM
 +4pSR1isgEnR57qrWxCzv13KQwcxD7stjRM8jgxgBzonkgRdNCyIFMQ1cD7qh3LokyOZ
 LInpfJspBe9qZncTchZ/Zq3ura8l3eTS4b/b0QfXZJVV62G7SWdlMkvg+KXrmKY8+kIT
 b1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
 b=t776VPujI+Svj5VQevd65eGQ5gaOakMRJ6r/lQ1cMGZ+/lstFhRLQOUHPiYA0GhekQ
 USsFJ006wfxiORwlHZibKOMOXwrewf4Wo8fNjzzq+olrOcAvcmIFWvdeKKrR9P2TdGlG
 u/K/qOs1gW1kWa2GVBgdMGoPzktsAn+QMdeYNqzkdK8wwdleyYjuWxWb8PPw2uz4bDS3
 83Z7JEB+gQAGA97wFWEZr1IpCY0fxriZiTxA9/n8Nryg8z9G52Yl1XvTJ5AHA6uGiqf8
 IVep03UpFug+As12adZHKmQMtkBAEfANTlbVQRbE+8VgyI3WLfnvWGz6ai9ZdNKFod4t
 pR5w==
X-Gm-Message-State: AO0yUKXSp5tzyrEb94Q/K7uNrslPHEbU8j9vS2Hs+0hJwwy1eujyA1k7
 uq5ScRlfpY2P/qlc9ztp48Bl9A==
X-Google-Smtp-Source: AK7set9rm2jzI90qT1lsRb5B8K9V/SmYDp+HS7Shl/1uDJkLeqaHVOpEnNGw0WfEDwAlxeICcAsNlg==
X-Received: by 2002:aa7:9604:0:b0:5e0:1073:1f25 with SMTP id
 q4-20020aa79604000000b005e010731f25mr10677648pfg.7.1677476582559; 
 Sun, 26 Feb 2023 21:43:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 07/70] target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
Date: Sun, 26 Feb 2023 19:41:30 -1000
Message-Id: <20230227054233.390271-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:09 -0000

This hides the implicit initialization of a variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3ca60fb36b..92ab290106 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4206,8 +4206,9 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4284,8 +4285,9 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
-- 
2.34.1


