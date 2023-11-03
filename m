Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90931C0018A
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:11:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0R1-00042j-1U; Fri, 03 Nov 2023 16:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qu-0003fl-34
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qk-0006wp-FC
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso17898055e9.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041968; x=1699646768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPpQxgdh5VY8ZdTdWSvmFC1MKBcKGy7bnnvLXL/ucsM=;
 b=KDnV+bJy98NMeaD2/vPwIv6wBUiQnmbpfVQNDo9HSI3R0sjOADsZ8hNr7jhEA747RD
 UGiV/FnL58s0fDdq/Y2WMmxULLIbfL67nIjuGdu8ketbTNKiUPVBmMUo7PiNTw4pQ8m6
 arMDW7jF4P1FMN16dTSYaqKB52saFNa4Gqz/9+cFDxT0pNRNTINhoDL5ScbsmrPbYJVg
 90Y+YUbW6hM7WRB2vwJm93nLeLi55w38eN6pPbJh8DVx18DCkwITDEiu63nF/4Ktzufi
 0X6JY0tmWOOdx9gFdcB5wc5H8h3OHEBnVFSJiI8z2dSCV0n7HCgmi1r+/bgaoE1wAlpH
 kIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041968; x=1699646768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zPpQxgdh5VY8ZdTdWSvmFC1MKBcKGy7bnnvLXL/ucsM=;
 b=klLUKWfudnMKlrv3VRtsBrKyPT7jdLnufv0VV1TC8pH/8giz1wjH14vXracKcCTSO+
 ogoxRw1r/CCeigIeYwrcqQ9JgSB8bu+diiJbEdJFH7BcpZ0EFB/lWNTuUggkvJujmUkS
 kg+4zlMDBlj0qM81bC7fFlXzV0WC5NjVbslS3Wvt+0KI7opqc97mybRCmPFRSCZbqTk4
 vifBOEAJ6wFaJLjujibGs+ua1Y+FgqXNpuUFSm8i0T/IAOy7IHKVgZedBMyqUa30PlYr
 ej62hZw2Yyc1E0TqkX+Ln6c4vbhWOcARf/yzpoGWJ3615ARL2RfgsnH0KWWGmrfBF5Tq
 QnRA==
X-Gm-Message-State: AOJu0YyvCXtnrbxOVMgKOo2S1RbbvCkgjYs/Ih1mDLRu1EGM/ncY6U/s
 ACKbcN5uhowGB1OWnx2hNuNy4w==
X-Google-Smtp-Source: AGHT+IFM6OAclTpVDoEZyTprZJQoEXhkGB6ua3u5lqTYwFGwh/I4TJMtwA3MFg4FbK9OCEpY9OrlBA==
X-Received: by 2002:a05:600c:4445:b0:405:3251:47a1 with SMTP id
 v5-20020a05600c444500b00405325147a1mr17614556wmn.40.1699041968086; 
 Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b00405c7591b09sm3572232wmq.35.2023.11.03.13.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:06:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BEB5965758;
 Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 28/29] plugins: disable lockstep plugin on windows
Date: Fri,  3 Nov 2023 19:59:55 +0000
Message-Id: <20231103195956.1998255-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Greg Manning <gmanning@rapitasystems.com>

The lockstep plugin uses unix sockets and would require a different
communication mechanism to work on Windows.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-4-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 751fa38619..1783750cf6 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -17,7 +17,13 @@ NAMES += execlog
 NAMES += hotblocks
 NAMES += hotpages
 NAMES += howvec
+
+# The lockstep example communicates using unix sockets,
+# and can't be easily made to work on windows.
+ifneq ($(CONFIG_WIN32),y)
 NAMES += lockstep
+endif
+
 NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
-- 
2.39.2


