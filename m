Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6EBCAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:43:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d0d-0003X1-TE; Mon, 22 Sep 2025 05:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czF-00028b-Hn
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz3-0000c9-WE
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45f2b062b86so26893015e9.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533833; x=1759138633; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tABHb0SIUKkh6uzz0t7I0iXZ4IfcRn4F5NgGsBOTZrw=;
 b=Khl+jliPAIywrHBFL75d+hjNd6bWBdoDKxzkPYuizrb/jOPBhdiSSkW8NoPfbYDjIs
 CkfRdZkbGAEj2nJD6Dy/TP9tqFXfO36kUDWjm7j2sO4WDoNWhq2gMENGw/i0XL+t/RIT
 ER9HKiTH8mw/wTiMdYMQR95a+pVxbontKvNdhe3kv1DPARgs1ku0hE2EkQX0qsxv+JDk
 lOblMQ7ssKYgzNL6hEyXLGlRsaRMuMYMl4bP8CC1izsli7XqTJZsi0WG0vSc+dT3c2Ow
 Fyt6rlrggwXSmeC1dTgnv+BLus7SOxaffy+dC2MK0c0PXYxINDhVQefhksjVWkTN4R/M
 edPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533833; x=1759138633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tABHb0SIUKkh6uzz0t7I0iXZ4IfcRn4F5NgGsBOTZrw=;
 b=OOu3lCfGx9ztFskULs3PkiPeMwU0gBtGmHULoaKRui9yqxAUClrBl9AupIaxmias66
 A7+x26tCd0GWXjWeLxnKwk/IY/9i5mafnUoD1N3ZkPjtlTMT6RKg/IUlt1UhpTZ7SQug
 dA1HOCvpdbJoZJjmMkXDyr5fQxZRDwdCU21HyBpGZGGTC+YbmfMlvvdcw739PvlFcwAe
 n46yBX4+srQlcCoLS4apsMoOaLphU5kg89I4yAPHNW5WsxFfi9LbU5BOeKvL1JngsHGJ
 OBOpCZ9acYafKpHYPOYHNP3xcDY5Vw9WKZpkrDnK30o6373q3pQL7/O0/mnWKwDTrPrz
 k38Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm+xtozTb6sM4EyNOSA73b/W2Mp/5F+qXlslQ9c8G59Tuk9tDxgPhLLs5h12WNAfx96SmvLzrDwAa1@nongnu.org
X-Gm-Message-State: AOJu0Yxt2PlJMqHUX3mqkZawFWLGaUSg8pE8OAoOPH7scofWX9XYuvkQ
 gx0SsMCTl8FxeNulaaT8zMd0D7zLPAd8HghiD5VbM9BpD1sOy94yjhlYqUr+pk6Ojn4=
X-Gm-Gg: ASbGnctn5hdU8mVLdred7e/SgRJ5TPnvZyf6dxV3n4uVAYoLLmpH9n+f8wfVHD5N0T4
 uqFEWQ6aFKE7XVnlx5H8kO2TeVcSdkVdy6yDO9dvlk2GCBqbbvT25JCtfaRBT1HRvCbcSFOy+Z0
 +p3EzUdReoNPtgxOH8uTy+CygQlLxP56311Jg9FRqEnJ9CzcdLtwh7AGiUDXvJj3NJL3fuEBaJM
 VKeRrGCy53b00PyJ9MbcJcA+8JODpMiZj6DJS9UxMJGj7RSsEvw5ARLPAlZ7V8Zlh6XNvtyPdH5
 MzPiqZ42usja7ogNPfw/GmJmqj4xvfvrsyGwiq1uHrMxM3Uz4JBdrCU9nmmLONpehHM+3hjNbd9
 0XwV7JEFuBwMj55aUPqn3n1o=
X-Google-Smtp-Source: AGHT+IGKYLCqTBbnTaHG0WoqROvB3mb3XtAIclhYxe32fQ7dUvSfxGOnGECyX9UUbZkMBeFeQmxJtQ==
X-Received: by 2002:a05:600c:1c0a:b0:45c:8e6d:a45f with SMTP id
 5b1f17b1804b1-467ee3057e3mr113776025e9.5.1758533833241; 
 Mon, 22 Sep 2025 02:37:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d14d212sm259930315e9.12.2025.09.22.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 987D25F8B9;
 Mon, 22 Sep 2025 10:37:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 01/25] docs/devel: fix typo in code-provenance.rst
Date: Mon, 22 Sep 2025 10:36:46 +0100
Message-ID: <20250922093711.2768983-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/code-provenance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/code-provenance.rst b/docs/devel/code-provenance.rst
index b5aae2e2532..af5d7349e12 100644
--- a/docs/devel/code-provenance.rst
+++ b/docs/devel/code-provenance.rst
@@ -331,7 +331,7 @@ ChatGPT, Anthropic's Claude, and Meta's Code Llama, and code/content
 generation agents which are built on top of such tools.
 
 This policy may evolve as AI tools mature and the legal situation is
-clarifed. In the meanwhile, requests for exceptions to this policy will be
+clarified. In the meanwhile, requests for exceptions to this policy will be
 evaluated by the QEMU project on a case by case basis. To be granted an
 exception, a contributor will need to demonstrate clarity of the license and
 copyright status for the tool's output in relation to its training model and
-- 
2.47.3


