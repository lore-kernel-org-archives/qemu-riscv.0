Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49FBC5478C
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 14:49:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reyis-0000ek-DY; Tue, 27 Feb 2024 09:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reyhM-0006cH-0x
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 09:44:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reygU-00028u-HZ
 for qemu-riscv@nongnu.org; Tue, 27 Feb 2024 09:44:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41298159608so22069825e9.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Feb 2024 06:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709045033; x=1709649833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c62pHsDpP+3tvJg69QO5ZTVqtvkEN32UvVvL0uQMeec=;
 b=gux/cNeg+v7mVG2tl8fdvCfEUd+40DjhSjPe55bcJZR1PmnnNBkXG8m86VIEaHlA99
 8LHz93oMUPlUXeGH0fZUroex7HZQLG9Wci0Wqu1o2fAgnaCbtCcGwR0frNCfJTwvFrBr
 SCNTlQnaqKLm5FpqQ83LZoW8qrz9taomLAFTazKs9gsXiPyd/RNiOZgmh7uthdhnyPQZ
 8arceJrYNjccNMeqcZSiAPHk96ulz6GpJNCAxhnWhaEMp6HQjXk45I7wuAATuPqeXkuu
 0Rph/kuBHJi9ilAjzKVw5WrHBH7nkLmT1Dej5qN18NwxV3qBe2xvq4jX4V7zY8iVu1at
 8gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709045033; x=1709649833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c62pHsDpP+3tvJg69QO5ZTVqtvkEN32UvVvL0uQMeec=;
 b=XT8uQ/Gyc1YOPE4dUmGWCXgDSl7/3PBZaEoNDhRMudvBPkqsm4u5iWvqFOoJqyJniq
 CngPsNFszJbDbqjld3Wr2/0Fr0G2rHw/JVrSWrTOKIlyP0ooXg194RZjJgYpI6Oq65pW
 gMh1Xjml+WcRVYjxpRlNtR1ydFmN6vUk/qaNNLJU3OM0tQG34jsQ8GxVNf+Uu3keWpgF
 aWNDr/GZWNe5/YIYm7Ps7TBDc+LLlkjeg4GL7ycPqy5cSrgQr83k9bIn98xRdsZCrNaW
 OMlwQBA7HcfsPP87489Nc5e9+A6suZUWNXvCEfwPa5eKP/3JKHQdEz+drQ7lJPqUeTh0
 MvVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ5Dscvfh1O3rIdvVEndpLxAgbe15AU48i+OedgGrSmECAKcU0PFMCXvGA3lrtQtE8cmNWOPrjloWpm12Lpn1zCLTnojo=
X-Gm-Message-State: AOJu0YzMcosDJfQavzKjFGgrUoTpTMwfTL7benhyTb4+P+aPkuC8ToKV
 15mDiRFnNg4yhrKBlQVR2a71Wj8L2cm9I6xihTR77viYmTlKDDmhgOjhWSH/jq0=
X-Google-Smtp-Source: AGHT+IHhQzcJcS6r5wz7jaaCY5J2GMmsAy5/oYXqiRSw/8YTNKf+gmGm1vmh654hwDpiAMXWd3BOow==
X-Received: by 2002:a05:600c:4f01:b0:412:afed:5cdd with SMTP id
 l1-20020a05600c4f0100b00412afed5cddmr1067554wmq.11.1709045033287; 
 Tue, 27 Feb 2024 06:43:53 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 w10-20020adff9ca000000b0033d1b760125sm11684409wrr.92.2024.02.27.06.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 06:43:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3B4925F930;
 Tue, 27 Feb 2024 14:43:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-arm@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Michael Rolnik <mrolnik@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-s390x@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 29/29] docs/devel: plugins can trigger a tb flush
Date: Tue, 27 Feb 2024 14:43:35 +0000
Message-Id: <20240227144335.1196131-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227144335.1196131-1-alex.bennee@linaro.org>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

When scoreboards need to be reallocated.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213094009.150349-8-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/multi-thread-tcg.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 7302c3bf534..1420789fff3 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -109,6 +109,7 @@ including:
   - debugging operations (breakpoint insertion/removal)
   - some CPU helper functions
   - linux-user spawning its first thread
+  - operations related to TCG Plugins
 
 This is done with the async_safe_run_on_cpu() mechanism to ensure all
 vCPUs are quiescent when changes are being made to shared global
-- 
2.39.2


