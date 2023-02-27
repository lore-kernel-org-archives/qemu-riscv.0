Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW8G-0004s6-MR
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW75-0000MN-0o
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:52 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6z-0000gF-8i
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:48 -0500
Received: by mail-pl1-x634.google.com with SMTP id z2so5508265plf.12
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
 b=mCNFkg1KAEm6JAKFnd8Dj1uDhojomv3wDz7YeWWJxTZR56LZxsYGvCSSpTDNh//A+w
 6+ybr0XnCqwgrnapWtMr1nRSpuPRLsgTLnTad/ysGXM54NjZyTy8qMBFrQDsGSsmpOjg
 0JyerYruIwtvdMWjRMTe1kuTk72gBqKZJyP3JqXHzK7lAHicWuXA6JGGVdijfSMxlkMd
 3BHN4uLUS7k0IjusWqDcP/7oZhChoRF65UMmFWr9pb5NLifbXMNfrbKgaHZp7ANjVod4
 aDJSaNnGsGtX/ww+MPPVoHJYkIsNrPLb/ZZfme5yZ7MDmR18LsB/4ShqaFvPlNyaCpFn
 TGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
 b=2gI/148tB2zTlKxnkeVKnFY/a5Ia6ukpB8j6L3s0MhEQxMvRL7snqlUWThzrgAruJU
 xytW92PfvbfhHv6+DUxGJEwWKCfeOYU8eBLEEkQo0zB4ZHJEKpDeNzvye0U5Nchwifon
 zrULc3Xj1zUd6DT/mgAjrM47as+Qzw9Y6MU4VvE0nDzamxbWyouvSuKLm9SOwi2yVFYC
 x23B4E53pkXX+3aCNZ/8LACKXKfGrwM4qxFuVKzpmlvGbk++5nMsji4q9DDYTY6b2Unc
 E9ug250zOT5zL/5P/9FLEFAQoyGNYDAeoT3WmmmRdhQ/K0zLGYgBYTaSMwJuSes4PP2x
 cQXA==
X-Gm-Message-State: AO0yUKV8weGS29HQsANHbottMNVdEIZ26SOe2DwBSu8MJhEYBEEiPPQ+
 Kp1BeeWmGKU9iWoydYeAK7z/7Q==
X-Google-Smtp-Source: AK7set9YRmZ5/P5MlijVmSzd9iM2zPOk2StbY7weZLH3FndmWE3gZsYRHAn8TCOCgcIw/57QRe3XmQ==
X-Received: by 2002:a17:90b:4f8f:b0:234:190d:e636 with SMTP id
 qe15-20020a17090b4f8f00b00234190de636mr25563686pjb.8.1677475904448; 
 Sun, 26 Feb 2023 21:31:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 76/76] docs/devel/tcg-ops: Drop recommendation to free temps
Date: Sun, 26 Feb 2023 19:25:05 -1000
Message-Id: <20230227052505.352889-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:58 -0000

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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


