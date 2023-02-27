Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW2b-0001s8-5j
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000ZN-C0
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2J-0007zx-I0
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:57 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so5043394pjp.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=YDnEChFGZP6yT99BLe5B2vrbT8rKkEDDJPm8gI44g6SZllPaJM38yCofbRlDlqNfcH
 mixQ2IGdye33oYHp5P3JMms82cCJewRSMm/nt+KPhMKPBHbk6WIHTxUKT9Fn6y5XbfpW
 qsmBQtq0WVhdohU4OZyUEJHHV9ZKmjjtxVn+v7FmMoScQSMrCCptgdiE22v2qmfjDwN2
 Bo0CMCkF4vTWFOfH5ZOFwlarujWzykrDKuCh+ObjTTm8VFrdNqscp/qdpy7zUoObXis/
 yGj+PUTdOaO/X+pGyCYIqNseU+MuzRCAVT7q4EorFjceSIdAy7/LZNNaT7clv1kGS0vz
 GGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=qx/Ep5pOslZQ52kBMdjYcNuWZsyJ0nwUGS73XrqdFuu7+aYj6m2px9QGwy+MFlNQq2
 1ew9q7AvJag1exfiwT0w4UiB3/muTw1ZM+MC4h5CzaVAGfRXemnT9JEg4rgUOsx+IvKH
 qhzso3sdkPbQ4SNTLGa2X53AiXv0ESwB0r/LuEcl19eydiNODzhNyi4Y0SFg+v/OQ7Fu
 Txju0TYHNb1dz0jTxH9FPXdLJZK739eofjDMD6TUjUcUo1dAWm3WjJdGeX5G6iZXXa6t
 wjA7B6zI00SazV0s4Q6OF8tuNLW9HQdz5eXWbu5CoX6QsrWevSieqCBiTqXh9RdC61bv
 BkSg==
X-Gm-Message-State: AO0yUKWlxhZTp0cIjx9P5FmsJMlvNtjvkCJ6Sl72zvLBXm9LNwy1MeGz
 ZRWcY6RGJQWlDlv6Ac5qmnPaWQ==
X-Google-Smtp-Source: AK7set9sf89/GmYsKQ0+GRLBZqTeq5m4AsjpeaWHUeGlTtarBYrCQpSwqG3kh37yxeOj+e9Ym0BYIg==
X-Received: by 2002:a17:903:5d0:b0:19c:f096:bbef with SMTP id
 kf16-20020a17090305d000b0019cf096bbefmr5658932plb.49.1677475614022; 
 Sun, 26 Feb 2023 21:26:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 38/76] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
Date: Sun, 26 Feb 2023 19:24:27 -1000
Message-Id: <20230227052505.352889-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:27:03 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mips16e_translate.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 918b15d55c..602f5f0c02 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -280,9 +280,6 @@ static void gen_mips16_save(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, -framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_mips16_restore(DisasContext *ctx,
@@ -386,9 +383,6 @@ static void gen_mips16_restore(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.34.1


