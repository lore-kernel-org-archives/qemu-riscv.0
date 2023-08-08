Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28BAEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8a-0000GC-TC; Mon, 07 Aug 2023 23:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8Z-0000Eu-Mm
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:59 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8R-0000AA-Ey
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:59 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bcf2fd5d69so1681755a34.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464310; x=1692069110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/1Q70p1UuDX1mGiWAQEKQh99p5UQv5WsxNgN2rwkIM=;
 b=C0+dy6oNAVmq7RvWPNsgdw2+Z+x2I0QLONAlaoObW5SCNpYIM5q/KPKgcGBOJ8sYbs
 xi76dGfz6fr3havnBdYJ4yno9zNAJrkVoe91XiQIdoasMM2zXX4uiU8iUSxqZSGH36Eq
 rxhHOtti/rEQ4c0+7W0b8xg+p66Zr8UzLSjG+2AmPyZCEINByCi3ilUCroAoBcpLS4kT
 aIqNccdW7kc+E6n/FmG+ezzOP4tbWPNE0Y5CxtH4uXqOtGFT+pRGsTSVGimmrtJ2JNbO
 jDLAgIOblHYZQFp0ifl8GL+nXtIfO9Yx6ESWAZktQtvmkoW9V1J4H9G3FWCEsfkYP3Rs
 pSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464310; x=1692069110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/1Q70p1UuDX1mGiWAQEKQh99p5UQv5WsxNgN2rwkIM=;
 b=LEs6D8zRNbUSGDt2BZzUE8EUnGA8LjE2nPqe0w+Sc8dXJ9MJMnanjd0tKGWlxUvIbu
 l29XB2baHrYIiOEMOnziQPaXDfsccCrTAk5V8RiN03ZoJxngiho7zapf0D/ga5ymUPu2
 nuDrBAoGS9czc+cRbYKxAf0fN9roQUO+lsES5j86RxgGyj4rxNprp/dnnXTQqflvvHAX
 9athiFsBpkfvWKIfDniaGbbhY7GC2deav7dSrNUA0Z9KgLHtx3pm77am5VsNME7dmHlj
 MWtXy/VcQYm0xLC7bQBAeFQV1Q4NKe0Ex6BafBkOZo/JVTj17YDTtU01J3Oz/E7qzuri
 xEfA==
X-Gm-Message-State: AOJu0YwIqzikDBPm3Rr/KTnkRMBmh588+CPYoO9tQdVaY0O4D9OcaKYb
 7fcE5mFHMQ6ldNqJK2jD7K0ckg==
X-Google-Smtp-Source: AGHT+IHMOZ22GyqTCAquvsdwLqz3RXPL8I3Oh1z7wBS2m4e8g7cw721vtqiDFjrg8SUvhh4h5V64uA==
X-Received: by 2002:a05:6358:9209:b0:135:51a5:4da0 with SMTP id
 d9-20020a056358920900b0013551a54da0mr14195172rwb.1.1691464309985; 
 Mon, 07 Aug 2023 20:11:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 06/24] target/openrisc: Use tcg_gen_negsetcond_*
Date: Mon,  7 Aug 2023 20:11:25 -0700
Message-Id: <20230808031143.50925-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a86360d4f5..7c6f80daf1 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -253,9 +253,8 @@ static void gen_mul(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 
     tcg_gen_muls2_tl(dest, cpu_sr_ov, srca, srcb);
     tcg_gen_sari_tl(t0, dest, TARGET_LONG_BITS - 1);
-    tcg_gen_setcond_tl(TCG_COND_NE, cpu_sr_ov, cpu_sr_ov, t0);
+    tcg_gen_negsetcond_tl(TCG_COND_NE, cpu_sr_ov, cpu_sr_ov, t0);
 
-    tcg_gen_neg_tl(cpu_sr_ov, cpu_sr_ov);
     gen_ove_ov(dc);
 }
 
@@ -309,9 +308,8 @@ static void gen_muld(DisasContext *dc, TCGv srca, TCGv srcb)
 
         tcg_gen_muls2_i64(cpu_mac, high, t1, t2);
         tcg_gen_sari_i64(t1, cpu_mac, 63);
-        tcg_gen_setcond_i64(TCG_COND_NE, t1, t1, high);
+        tcg_gen_negsetcond_i64(TCG_COND_NE, t1, t1, high);
         tcg_gen_trunc_i64_tl(cpu_sr_ov, t1);
-        tcg_gen_neg_tl(cpu_sr_ov, cpu_sr_ov);
 
         gen_ove_ov(dc);
     }
-- 
2.34.1


