Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEQ-0000S4-3N
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDW-0004Ai-FM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:30 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDT-00038i-WF
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:29 -0500
Received: by mail-pf1-x430.google.com with SMTP id z11so2801956pfh.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
 b=uxkyGAqaf12UHiHxe3ytgXuVwauNSoeV73dDe/22eNUs07Acfbr404tGEIUEUQjGUn
 t/qGcJKeCZhu5S45SKD/pZ6M4GNAS/tnxaqq963ch68wJSv3t6R0dukh72teYLYxjg+Q
 FqFchbIX0LpcYy0S7SNiPt71AULxsN3mLdtSx/DqAygVsZoIQR5JJlXRJOM12aBe35hv
 Au0uiwaxc4RQnp8e+d1EoUfJzFuO6eUQUNKni7LyeM2psYWZG6by/r3PkPw4DBsQ7pgv
 Sr9hYIiBriB8iW218B5IUlHVfrxKJ3sjQwvlcebm/+9RKBh5CbxoQGhANOJ9FAhkWlFN
 JnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
 b=I0jIk71AGlGqKo/gdM/wxW/dOJAoaQ4gVuZD92AtRvLsnrzccwvXATYPcOlFHitiB+
 ZWPdRJQABuCxb/Mq9Wo3VKtqF0IfR5x5Bt+MxkjcrsypTzYi5G0bt1PFEB5ddVcakqKj
 2whsajEhbBl8YCr4kVY277TU8mFofCaJDLmTTWtsLcJEVXcEimgpj5HowzmXnS67/qQ2
 kf15e7VCi9SfmgSriBD6nB5jD//AGLZu7kR1jKmAcz/6cY+c7Eo6k2tu63OgarPg7pwt
 Veb9JJ1mGdT7VdD6yo09dC15Ei3w/0rdCVBVBd+aYzTnJDyZJXmJLzNETVGZYQt+iex0
 L58g==
X-Gm-Message-State: AO0yUKVE9VcPktCTtgYmErwnBIgvFdYfXGDl6rHqz0Ok89T5OaTMdQDx
 sjhSux16/7kARhxu6wxTZuM46w==
X-Google-Smtp-Source: AK7set/1gCW3n8mOXezHmixcne4QEMrLyFAZVq6meEFSJGUgKNzrSwddhx/Xy/q5F72lEpmlsmI7bw==
X-Received: by 2002:aa7:9e1b:0:b0:5a8:8535:18b with SMTP id
 y27-20020aa79e1b000000b005a88535018bmr20937619pfq.11.1677476304392; 
 Sun, 26 Feb 2023 21:38:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 29/31] exec/gen-icount: Don't use tcg_temp_local_new_i32
Date: Sun, 26 Feb 2023 19:36:59 -1000
Message-Id: <20230227053701.368744-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:32 -0000

Since tcg_temp_new_i32 is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 4d8b1f9ae5..733a2fb228 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -17,13 +17,7 @@ static inline void gen_io_start(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count;
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        count = tcg_temp_local_new_i32();
-    } else {
-        count = tcg_temp_new_i32();
-    }
+    TCGv_i32 count = tcg_temp_new_i32();
 
     tcg_gen_ld_i32(count, cpu_env,
                    offsetof(ArchCPU, neg.icount_decr.u32) -
-- 
2.34.1


