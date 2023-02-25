Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjq-0000Yf-Vl
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqje-0007rh-FY
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:54 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjb-0003Uf-Ao
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:54 -0500
Received: by mail-pf1-x434.google.com with SMTP id cp12so96256pfb.5
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBIK42bUcbYw07ufb58LbL1DVkfWS6Zfg0rOY806rL4=;
 b=lcTOThPT/nK5u6u8s59JXGw4mqU/4nxsTBY0i2/GlYotooWtMHFLFyEA8MWmSuaiJB
 O/rzyZgQcU5rNi+ccqFudlEZY4HO+iuIOk+sph9icOgoPNm5RqmgzuN2yoXEUojnUbod
 5v71EOi6nW7OG59ZKD9wpe9yNkjISbrUce6bUdIm8pOx9f+nUtwaQKM3s5qYqKHPyVKD
 r42nvZwGxhXefVbFlgu14PBDBs8l6LmN23caj+ZosnyNEI5CEGinfGsVMkKOPpSX4rQS
 /OhmbCUajjdjKGONBVic4i9cXB/Av3nT8/vF2YWY/SY/GqWpFJrNLMlk2oCXiMTZbyR4
 tSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBIK42bUcbYw07ufb58LbL1DVkfWS6Zfg0rOY806rL4=;
 b=AfcP0sS0/0qIIb3ReHPO7eY+bUtf9DQ5XwbJaHowJdETUH5nCyTVX95u8UvuAJJkya
 FcPHSF3T2zYqfRq5o8HR5C/GPvy8S48gxqIxVhgPxuLskUy6O1uxlK6gfsYRZY/GmVfa
 gCTYn1XUmnemzYlGALE9fDo9DX+DYIraXuGDn9+Q8tS3yncW0H4Uf8f1McV25VvYv1nD
 mmKsdyqPk+eKPYu3htQZwt7YCTyU6Rkl2CBquhLr/DYSxrZFQVw1FgGAFTcsZX7zBRBk
 nL/UmwePi+lIbGkG0k5J9CPTRFebiA0SOPp/xDpshqwot0iQFf4QsdInk+eRQL3LxpCF
 4pEQ==
X-Gm-Message-State: AO0yUKXQsL+7HKSv1VPksutJvyi8JKKOaigP1T1pq9FjvYA1Xfhc11bT
 V7Tr2BCRv26f0nIdYMgTJmBqZg==
X-Google-Smtp-Source: AK7set8kGtP9KdXDVbvlM8ZNoLQVLlzVn+WLkfzW69q8w3ApQ+zq6eEmuFU/Y6keEf1vsW6o3Pid/w==
X-Received: by 2002:a62:1ad1:0:b0:5a8:bdae:caa7 with SMTP id
 a200-20020a621ad1000000b005a8bdaecaa7mr17178472pfa.14.1677316850312; 
 Sat, 25 Feb 2023 01:20:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 76/76] docs/devel/tcg-ops: Drop recommendation to free temps
Date: Fri, 24 Feb 2023 23:14:27 -1000
Message-Id: <20230225091427.1817156-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:54 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 561c416574..f3f451b77f 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -951,10 +951,6 @@ Recommended coding rules for best performance
   often modified, e.g. the integer registers and the condition
   codes. TCG will be able to use host registers to store them.
 
-- Free temporaries when they are no longer used (``tcg_temp_free``).
-  Since ``tcg_const_x`` also creates a temporary, you should free it
-  after it is used.
-
 - Don't hesitate to use helpers for complicated or seldom used guest
   instructions. There is little performance advantage in using TCG to
   implement guest instructions taking more than about twenty TCG
-- 
2.34.1


