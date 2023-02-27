Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIn-0005Py-MX
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIm-0005Nq-1o
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:56 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIi-0005Gp-El
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:55 -0500
Received: by mail-pg1-x532.google.com with SMTP id h31so2844003pgl.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCxesrIpTbTxRzaqZYaMu9uuGA6eHqItNDhI0BRycuU=;
 b=l+cUrSbutYZtb1yNDz9VpYy+7RnrJuM779Qjay6GlDr4fZ1CmFmafG/8/twcwjxgQ5
 pPc3dgCBdBKqGj5JiD1fTt7FOdcr7S2PPEAt3AC2wxv2SCMNU1iIpe6QQ9fi44Sww/ZD
 J4l5QpO4BFCEdO5aXCbeCvIsFSvZ+uA0MT1wkSutLw9qkkBKH2eO8cgfo/Sm101iYJZ9
 CQuvC/6/+sz5GYzmgqikvLP451k9fXCbYBLoeUWJIdAW9U6Cx3AQwn99Hz/Fwr/STElX
 n3VlQmBBGlPPFl7SdnJwuCxG7Bb8oP0ePJCQL+ityr3u5T/lMD7FOZ565hKDgXp17pdu
 R1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCxesrIpTbTxRzaqZYaMu9uuGA6eHqItNDhI0BRycuU=;
 b=FArqKHobayLFv+xypgXx3TALWmr/ggv79UDXWRM01wpIPe+AJhUJYI7VvNTCOmrxFD
 DYzRewjIZxkaLBwkE4EhLqGNAlAZg1oftwWtOZSYVbAsAmm6Q2DO8UF4E0OftV+SYR5R
 Z9UXWSU21w8xmGieD/o4lDYgWUejX74xU8XnxE4G8EO5Z7CSa6q9TbjbmjOr13ROdw2f
 iTPl9ciY7nwvjNmzkw+sjyC4wSvh8qHs9XtxHYo++/FyLBbSqVMl8YjMBaEajKtU/YAU
 xFKZykiHYNn39C1WQuY+PIX3sZME6cisg2wMmt965Sm0CEnwwS2z8ggiuEXPH6rw362n
 vQ3g==
X-Gm-Message-State: AO0yUKW/BIEv6mkU134opLsvrx137LunejBcdXfy9ksPDCy3AvQmjbEL
 pZfRWIWg0DBwb5g25zAIgkq7jQ==
X-Google-Smtp-Source: AK7set81k26dX67OHA/6ferdYh6DgQNY0UAi/kprRMt507IMXYtIVxKnTMsg2IieNomEfYMuAZf56A==
X-Received: by 2002:a05:6a00:47:b0:5cd:d766:8a2b with SMTP id
 i7-20020a056a00004700b005cdd7668a2bmr18700523pfk.6.1677476630933; 
 Sun, 26 Feb 2023 21:43:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 25/70] target/m68k: Use tcg_constant_i32 in gen_ea_mode
Date: Sun, 26 Feb 2023 19:41:48 -1000
Message-Id: <20230227054233.390271-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:56 -0000

Return a constant for an immediate input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 7a87811427..7435e51acc 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -924,7 +924,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
             default:
                 g_assert_not_reached();
             }
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         default:
             return NULL_QREG;
         }
-- 
2.34.1


