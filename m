Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Vd-0000dR-F8
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UQ-0006IJ-CL
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003DI-Jp
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so1512916f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097269; x=1685689269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
 b=IS7A/Ip7RvcI+Z4JlTn8WJLzDB8hjw5wKc7iazR4nwKVKRs5qePmUwnXUkgQZH70W4
 nMiQptVLxtQ+uUv5PKBKorC9MRvKNBkkZqlmtz2c3RTAyfUFVtcJPGssNaUZD2fGQ3Cf
 BTNNj6Rt/Q9ELQVERE2nCCaMS32WjOTbKXJ4LzjGkvuDs0oS1lLxb+8/N2p+Y4vZ1W5H
 9QSbQOISXearExRsVNY+zKBeHjprdcmwww7sHP9DLpi4X8oxv1n0d7zyb/2vBiOwkDIk
 /R09SPCV/f7n06NxQmnynembpHL9lXD5gv6GAISITD1x47DD6xk2S12/zsE+K2SSwiPk
 5eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097269; x=1685689269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
 b=K2VPpVVb7NQiBF8PCI5q507U0u0K5gGbTJTeRIG1D4RxK0OoIE7LNyfZmq/hTTvsi7
 TLoeVU9ZOyCBQeWPZVEVugxQzXMxOC9MRam6q4Skl1RGXd8+fD9Ob1Mr3OtfgD5Hn0vr
 IWq56+L+yM+mjSZKBcDCT4SSMmnl/dY5qet1aY6l5zpVE/ywIin0uZXn+QITiUXQ85O2
 pM5UTcungnbqMafe0Epry31dpJAQQw46q/y/GWGJts1AUTfHf99+z8eLxp0u2B7Z4JlQ
 iD+3pQdjPJaNkZk1H5m2MxGRgHs3kfYHS7V3sVa5KoJYdAq3qgkmcAf6O5T1R1oqsVeu
 oDCw==
X-Gm-Message-State: AC+VfDyQkx3+eZ8MFFBSITPN91f6w6ZzIxYf+PUNPb4EynEYk2+whKV8
 gZ5cKWEYqVv6JDuFug22ShxxRw==
X-Google-Smtp-Source: ACHHUZ4LLK2D9LkpQI1o+8MzCDGxWKGUnAKFFHMkU5j+lCKOdj9iBsT4EZ1ZHsOEv3+b+PNNhtDDZA==
X-Received: by 2002:a05:6000:10a:b0:2ef:baa1:f3fc with SMTP id
 o10-20020a056000010a00b002efbaa1f3fcmr12032057wrx.19.1683097268700; 
 Wed, 03 May 2023 00:01:08 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 50/54] tcg/ppc: Remove unused constraints A, B, C, D
Date: Wed,  3 May 2023 07:57:25 +0100
Message-Id: <20230503065729.1745843-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:01:28 -0000

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1


