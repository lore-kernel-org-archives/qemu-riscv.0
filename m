Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D86AC02194
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:32:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQLG-0000Me-KQ; Fri, 07 Feb 2025 10:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKC-00083m-F9
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:27 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK6-0003xX-7i
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:23 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5dced61e5a3so4025143a12.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942276; x=1739547076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgN34HFjNsDM8vD8ylx4YNq6temrMo6Bfwlmv/QI6BI=;
 b=Hhts110rpdfD53pM2x8aBxsMRrtvw3A95Nt+5TOnjx1I6erYUU/6yjkq4uTPQKrPgz
 j7YUI5thE/4n2qSIQZHPUme6Iyw4E3qabnHKBqN8q8hI/OYB9bZE4CVbUKy6vGPtHRmN
 xrSOj0GEccvhTPwGOWUOVn4S/gqo20XxJzjTvkDAZ7zEFs0uvYyPW3aAFLaCUP0YCmfE
 mN/H9Kk2nI38P0FByFe8wrkMpbEiW5sU+YNtL0v5MD2Jil6dJUrJcdLt3VUlj9/WMwn0
 /f8jAMwFrbiCMvFNRSBXH5LAcyWolJAHIFwRceM2wYfiuulxUcRL56zFA8SqQ2j6bvrL
 GZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942276; x=1739547076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgN34HFjNsDM8vD8ylx4YNq6temrMo6Bfwlmv/QI6BI=;
 b=RP1C2yneskSJV+Jx2alus1jTszYO1RPJPZ8dxs21sOOGMQgPXoy+SuMN7lVmzZ2n3V
 KBQ9eaCxKKgZJvMLRyrPNNYDt9LhCIt5SKJ9c7KpwkVWdqua253gqa2HKBwL+hKgsFBg
 gqOwNMx2Nt9efkNnC6iEbznSpCpk+MjVL5hkxzDwnCh3IT8s/9XUCpGxMaz6yCHmZRyo
 Gcp5Bb9DDf0LIcbRBBvpBxILSn9y0wQi4/KmQHlWkHfr5TP9nAyjbgrZt/0z6owSfiM5
 1visy5Fqvgdf4llau+KPPBdbQTA/BaNjyHEk9V/g1h1YeaC452M/Kb/QWyH4u5+P65Mo
 a24g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/A0aIbm2NcSWHMoHu6DHny1XuRUhWiTPqc1CQbc4Z6RDAtDIbFeWpLohy0BuOK98R7qEfkU2MUalZ@nongnu.org
X-Gm-Message-State: AOJu0YweNLNbK52xv0HsEG3WHEJBYWPKV4D05/EfGBmjYR4qMb4Cm64x
 X1FxyDFMayTWEsqNPbVty2jgsi+WuJDFhkxVJM8DT/YnFI+dtnRJ89rbe6pjVTc=
X-Gm-Gg: ASbGncsWbPAzU2k9aKTc+Mh6S3Zs37iklnoL5m0DsIAEvZETZKZysKbRA3061kkmyVf
 Q3coREG4AOn8Ik6E2TWe7m5Q4LNpEyyW+GtV0es6LV0PHbNtUZ6egXu2kP1pWt3MHuWNUKoY2cX
 AyvEFi+GmAluu1/f0QWWeoAxdcHe0n5vxncUYbDz1PyGJ/UguBLBAbeSzAhWPZl855C17p9RnRD
 P64uU/RU7WZpW2dXW/Uv+ylgNNRJoDx1hirdQW6Qj1aqHKCOGV7kV0ZZon4IBPhFt5eL+zIllY/
 Yg9AdRVEfGa9u+Mm9g==
X-Google-Smtp-Source: AGHT+IEqzFUgykFDg+BzRAsgHxxxzwOjwd0iFxcy5saGCHYKMbqqCTZmszVdtqyx4yCd8hLnqX/+uw==
X-Received: by 2002:a05:6402:3903:b0:5dc:74f1:8a32 with SMTP id
 4fb4d7f45d1cf-5de458c49d5mr4466459a12.28.1738942274649; 
 Fri, 07 Feb 2025 07:31:14 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de46b7b480sm1366479a12.36.2025.02.07.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A48D95FA80;
 Fri,  7 Feb 2025 15:31:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Alexandre Iooss <erdnaxe@crans.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 03/17] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
Date: Fri,  7 Feb 2025 15:30:58 +0000
Message-Id: <20250207153112.3939799-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Until there are timers enabled the semantics of clock_step_next() will
fail. Since d524441a36 (system/qtest: properly feedback results of
clock_[step|set]) we will signal a FAIL if time doesn't advance.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/npcm7xx_timer-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
index 58f58c2f71..43711049ca 100644
--- a/tests/qtest/npcm7xx_timer-test.c
+++ b/tests/qtest/npcm7xx_timer-test.c
@@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer test_data)
     int i;
 
     tim_reset(td);
-    clock_step_next();
 
     tim_write_ticr(td, count);
     tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
-- 
2.39.5


