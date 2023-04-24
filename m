Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp2e-0002Cd-8L
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0b-0006F7-4L
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0H-0005Lz-Sy
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso25588715e9.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315078; x=1684907078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
 b=yoEw3zDY0foIEusVR8XPn1czPjOqYt0FlfxOlDHu/7lLIXoCvJGMkvOOY1kPxOza3r
 vf6f7Cy5PUo9K3vcDxbUGLllgOCePFNf1ygpwUrIvS9iNIzMebgUl7KVjDC/MOuLD1uu
 clkKcLhTozayONu84y3uPCt8pl8jPifTCkoUWNDZgupGfyAcu7bMozj6ozW0Scg1ob0c
 9tqrezJtxWHaII5Fc9xZp+4881AovhSlKue2cjvyhaVVZSExZg4k6ToYmnar7IMb1R2w
 Gxdlr0/Hg9lY1HHvbiUDRtMae68PyJEVVNYweOoGm3SVVWMmUg4H3xaNL1BzHW0/orX4
 Un2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315078; x=1684907078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
 b=ayG+54xOdL97CqpUf5L2JnCO2ZwBN/zSA06fM/fIn+iME11NEeOlKvxf0fqHnpO2dc
 TKmONdPTX4+eXpgztFuwm0srt6z4oPYcJuhCz6FNPuy9dUSlSHT36Iw/dRZQKHHC8X7d
 6liQ8J30ap07hGUYfQLVWFhELLZOacPc2TMOtGOu0OrH0imAsQ6IpwgnSrV61UzsxH0y
 P1/wXLphJQMr5FiBEPKj95cP/m+XY6RxMkY4zUMtECZ8t0gMG1kbI4biWF2NRnWmMhWz
 KEqnKIEeez1vd8+aNIhRiWJ3JegMl1tQLUSOa+iQAbiQMA2lbMdqQ2oOVtvD01lsizTF
 6syg==
X-Gm-Message-State: AAQBX9f8TUZzvQW95wniI9N9qg4P2L4bdoET9w4UppjiTYhFxqZU9oR2
 SBmYYGpZiGXtW3xGrx4m+W5Guw==
X-Google-Smtp-Source: AKy350aICtNkHgOSrD1FmdAwsCcMNFqw0zkdTgXMf4A+OWDyjei2FJlk3s0X+7bMcP9+2NvBQDFBvQ==
X-Received: by 2002:a05:600c:2309:b0:3ed:f5b5:37fc with SMTP id
 9-20020a05600c230900b003edf5b537fcmr6650896wmo.1.1682315078064; 
 Sun, 23 Apr 2023 22:44:38 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 54/57] tcg/ppc: Remove unused constraints A, B, C, D
Date: Mon, 24 Apr 2023 06:41:02 +0100
Message-Id: <20230424054105.1579315-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:45:21 -0000

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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


