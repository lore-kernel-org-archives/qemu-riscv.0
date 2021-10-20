Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md26W-00070Z-TX
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26V-0006uO-7j
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:23 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Q-00011j-Ts
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t21so7083615plr.6
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBSwvYrqDYoBvyXlKSM9sotJjdfK3T1QfOWZZldWl7E=;
 b=n50p56Wr/DPeCdE2xHU9kvyD4fD4SpTFnHDfOkke8NQr04Kd3bLwFci5X1q3zTRzpt
 qmIBiTcllto6mZoCe20soWOMCvenAnnG611pqYqeoC/IWW7jatfWyl6FHhyISJK4GnsZ
 3Bq2AwdmhmJdc+MtLixkWWnm/HJNPAGql2LjMT9ckY80zHShiKU7oX5LRIh09laKDDMU
 kc/uwSjsYbKZJ9KCLZ7bdD0CPJ4R42mjFTYNC3M1PjOe9Bouby575Ru5oWRwPGFAKkFD
 tiepJFRnymJ1nMaxe5RaQENxAX3eqpjxXVAF2fKf88N+tNTHDCq7dMxUAZw3FG+DUs1z
 rFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBSwvYrqDYoBvyXlKSM9sotJjdfK3T1QfOWZZldWl7E=;
 b=t/oN0/TcbIHXzSJYrpcb2WNw8BTStNFlXZOb2aq4v6aNgYj8PWI+GvMhVPUtitCWD1
 EffuKanP5NINH8YDAKS2ri8qRw2uOz7dMnks0oYfOqrCkjWJSfEhnDF6tPzhECQ0K8Hd
 o+v4qmOXxaULZb4lh4z64s+oyYKkT7ANVqWojGZ0Z11Z5KHB7opcZeio6fzl4fFB+oDH
 R6rLTX+LK43XV8R80WaL29ilzPf8KhKnGIw2GcsYRgX4Ko0FWdrg1fQT6CmD8BjLcegu
 ZYL1SEQQALvYbxB33oAs5hgvYoQtPYUdxHI6uDcxsrYs837EWB2VV7aBwU5IQIONCE4h
 8GKQ==
X-Gm-Message-State: AOAM531BbhxJ4hxf17Egt0fytC9rC3YNs2gPxM7TFhKW6nIbgEPaCQGj
 a/2SoJFEQxVwUSKWUb4dyVGnXg==
X-Google-Smtp-Source: ABdhPJz/t2pKMho+fAsp91uO14bamwi1hVFHTjMLtvKMibYYFQzjgVbRAvBej9iSLp747ash+7hcpg==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id
 r15-20020a170902be0f00b0013a095e0a51mr36293876pls.44.1634699835429; 
 Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v6 06/15] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Tue, 19 Oct 2021 20:17:00 -0700
Message-Id: <20211020031709.359469-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 03:17:23 -0000

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f730bd68d1..61fd82d41a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


