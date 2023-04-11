Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2T3-0005qI-6c
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Se-0004x7-QO
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sc-0000ne-3t
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:16 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso1469187pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=lTKt+itCjKNifxk7EQUs9xlVFhZ7sChSGzBy97f4HCVIG7myhJaKfztzuoouLfE6aw
 NJ0T9AJkFqi5RGF7N9eiVzRYx7W3CpzTN4F7tpX0CFBRiJB7LlJSuQyJJrRncdMj+ePL
 tqyHW2vxZD+rt3Wkk4oYN7VCWDwnbBr/4YuSF3rljD8jaV+mtd9zU+4nzCTzCkAQ57bX
 dn/iR1zsr9UJiKtvy9CjinIA6xrrf7KWhexJc3PPcbjSc+uZEVZuBdi/UZ8lT07KHjqe
 r64w7L7MKyw8Xh8dEq7PhwNtZ5eYeP8Y3ViL5csx0KVLTqVjvo524xn7D6xCSlW0dxNh
 Ym0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=diqkHMdY9sy7s7d/FVpvMDj7LxqH0cloC6XvFiu/emdt+zFy39jakN+00zfz+dF88J
 NArOWVZsWWp4R4W9qn9ClsGUF1tLOiyq7aQYUo/3ZMtQ991suQgnnnolFp3cbnZvG5iS
 K+yDldqnFxSRrtHrl1W5SUrTIYUJ5tNRztC0qqXZfaCEuYOb+ZObxXwsx/pKVsi5rBwm
 UOrXmTNHL5KM+T0qtMINuqHpxGaWRx7fQ80fQsZTA32FLSRYOwFO2f0JvLzTeoaFRv5B
 zAG8TQzsnW+sqM+m8P68cy2Nh4qhrOI2RZJ/ScBq6uptQEhLTtVyRubwp3A5DFEB7oQ9
 wReQ==
X-Gm-Message-State: AAQBX9fN5hAy3rcqcNpRfZcF6L0JqENHGRtOnTWoWVsfmkDdesHnythC
 /6yGzBh/IVu5f9BRzJaKw5gyHw==
X-Google-Smtp-Source: AKy350ZneI6VWk4ExEUQfLB4UaWsGOpPtTgzh5MPTYgH968KaqM1KqZhrfsWW64zZ2khqVlDGMWpsg==
X-Received: by 2002:a05:6a20:4282:b0:db:c5c:e0a3 with SMTP id
 o2-20020a056a20428200b000db0c5ce0a3mr20633728pzj.10.1681175172674; 
 Mon, 10 Apr 2023 18:06:12 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 19/54] tcg: Clear TCGLabelQemuLdst on allocation
Date: Mon, 10 Apr 2023 18:04:37 -0700
Message-Id: <20230411010512.5375-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:20 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-ldst.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 6c6848d034..403cbb0f06 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -72,6 +72,7 @@ static inline TCGLabelQemuLdst *new_ldst_label(TCGContext *s)
 {
     TCGLabelQemuLdst *l = tcg_malloc(sizeof(*l));
 
+    memset(l, 0, sizeof(*l));
     QSIMPLEQ_INSERT_TAIL(&s->ldst_labels, l, next);
 
     return l;
-- 
2.34.1


