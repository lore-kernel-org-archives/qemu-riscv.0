Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWO6-0006a5-4g
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0004gj-4A
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:48 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNO-0007dQ-7N
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8930845pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLbIXbv3c6J31oUDt+65MrM/+9+0ofz54UivRKjyGyw=;
 b=QnidWXv7ZWJNKObdzSVc0lCypHJDXCDp27/D8eTGG/43vIpHq9h8xYz5Pvyb7Sgpfc
 CgsW9z9S21qR5S94+z116PdZ94/XPR9hLg9Xmij0gCR/niXzntOmtudUBdaFA/D6XJzG
 arfAX+5CcuspWigeaZ3Q7g5cloXI6QZs9WO59jqOwDCqpXJNuwIYzfIJHXwiX8RlWM79
 48eWVM6ZqL/3nPce203Qdj0BFdXa6h1bv2XJdIJWHPbDiqL5m/9u/sGYiKVPWvsWafQn
 diivcANvMdEnNMfzJK0zvqhdss1oYge3ulX9kODNjk6uDp1xiv6Vx/QrpVUXAqbfNcKP
 tSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLbIXbv3c6J31oUDt+65MrM/+9+0ofz54UivRKjyGyw=;
 b=09nr0ZKLRIuu4NYWuwnCx137/v8a5nU0utAymSJ9jpkf5+JZWxSs10vPAYzpD5Ml9A
 N+EnWapC7SOTL9iB8265SPVLo3THhJCC49Pe4ElAI6KwHmZcn1EK4f+yBQTRrc1WEkgj
 nC8jyGN4Vnr1/uAXKF8CPnjqDxofgiqY1nVBB6NCKivQdXy2KbLi40HbKnHoUJkjK/Qf
 LyMdBpvyT95T0MJt2bqOFj6mZW2nD74nBe+CFccHK8qrx+UJZFz6DgfNpUL4OtWMH6Z6
 R9pcfq3GClvv3b5HHo4Q/twIW9HTd3mmvHflJ5JEeX9PTvqsgvLGBJzgsuHGaM6zu7t/
 6XJg==
X-Gm-Message-State: AO0yUKX5X9Nns2M3E1ltovkfn4+VWSfgfEBqsqlcpXNpkC+2hn5WMmeo
 AudS2ivkp/aHd6I0lFpW3qD13g==
X-Google-Smtp-Source: AK7set/0EhQGzx5sitd+o9Qgz3hVbAXreI/FQi2jQdsT8y5PkDGQomaVRp/t/t+6OlygEjoqOS+jcw==
X-Received: by 2002:a17:902:f604:b0:19d:297:f2fb with SMTP id
 n4-20020a170902f60400b0019d0297f2fbmr4327822plg.53.1677476917086; 
 Sun, 26 Feb 2023 21:48:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 65/70] target/xtensa: Use tcg_gen_subfi_i32 in translate_sll
Date: Sun, 26 Feb 2023 19:42:28 -1000
Message-Id: <20230227054233.390271-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:49 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 41b84082de..2903c73f8e 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2324,8 +2324,8 @@ static void translate_sll(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_shl_i32(arg[0].out, arg[1].in, dc->sar_m32);
     } else {
         TCGv_i64 v = tcg_temp_new_i64();
-        TCGv_i32 s = tcg_const_i32(32);
-        tcg_gen_sub_i32(s, s, cpu_SR[SAR]);
+        TCGv_i32 s = tcg_temp_new();
+        tcg_gen_subfi_i32(s, 32, cpu_SR[SAR]);
         tcg_gen_andi_i32(s, s, 0x3f);
         tcg_gen_extu_i32_i64(v, arg[1].in);
         gen_shift_reg(shl, s);
-- 
2.34.1


