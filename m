Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FF6C3DA7E
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sYRc6-0004iE-1r; Mon, 29 Jul 2024 10:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sYRc4-0004Zb-5u
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 10:44:36 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sYRbu-0008Qs-2b
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 10:44:35 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7d2a9a23d9so357139666b.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2024 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722264264; x=1722869064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pge7513nKBshjtyBdFZgBKyCSQ2SDh37JkBFhtHAoCg=;
 b=Z2CEoM92tEPrgbCv3G50GCaNNquDrhaqb4Z0df7ZkDIsSxjJ0ETU21NAsdmg+nILnL
 gVxhZnsv3UI+F/J508GHpeIHpAb989zcwmX1YaWL3CiKt4+TiMvu9USOw9a0OgZMthrY
 8mTAspm3gqmGpJ9s9OnUxAa7uw/3TNUZy9URbE7UgA6we/4K/snleCP1FGMqLpQf0iqm
 wKR2i6BvKfmNB1cIWULU/wV3GMMDuKd8GXgoaBeHSnQHLNR8ufHS1dxlH9Pwl8wNOoVW
 vCE8yQkTzabAwJr+1DHmHt/2hwi6UlugfNKHVf30pt/oFK6qKgtzIj1PV90gsOtCvqZY
 pO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722264264; x=1722869064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pge7513nKBshjtyBdFZgBKyCSQ2SDh37JkBFhtHAoCg=;
 b=WbLahzU6UyNksXFIg9I4HM0apRqqH/Mv1Jmvwwc9eCqoIcB1kag0y9JaO1pbrxlIyf
 pRbPxkVHHlnrk28EmlH5tSO5AdZ0Eh71ZzUFMtsvGJ0lx5BwZwp1z4lL58B2AAdn7nAx
 dnkzLqptYLNGP3mOcz7tn7gd2bNVG+zBI/8iDVdVXa1kNaa6Te9BnObULG4a0OTou656
 n8kPxIJYyxBuldKF4w8pvK/QiHIPNNgsphcsv2ffpwmi227N0zt9eQq+5cuT72wDSzpI
 HCRxcS6nN+6tEjGDow0D5XxWCv5hCTPQZhs0aqX2lz9BeJS3pQNMkis03OZwt0yLH6hk
 WFbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGjViGPmSKMkMSNP3G1Tcdlagx6twnpHWkBnxPk1yYyMean3MEBnftVTEh1uyfOifEG79opkMs6bN2zGLbzdwEfrBIf0s=
X-Gm-Message-State: AOJu0YxKybvgLjxpaMvWHPoLiMuKfpaRlarWxfkadenJJ6ukLwWirs2o
 rwQXr1E48MTAETdc+5pe2b6pj4Vv5cr7sAd6z4I4gXvDtBP3rdPDM65DwDUmNkA=
X-Google-Smtp-Source: AGHT+IEsWFJLPqGVDsePmlOLfsx8ltOW1GIOJELld/RlChVzU5ZaLow5qjhWmwCesZntknV+adzZ2Q==
X-Received: by 2002:a17:907:96a0:b0:a72:7da4:267c with SMTP id
 a640c23a62f3a-a7d3ffa612bmr624237466b.12.1722264264369; 
 Mon, 29 Jul 2024 07:44:24 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23f62sm521017766b.16.2024.07.29.07.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 07:44:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2B5B55FA0F;
 Mon, 29 Jul 2024 15:44:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Song Gao <gaosong@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 11/14] contrib/plugins/cache.c: Remove redundant check of
 l2_access
Date: Mon, 29 Jul 2024 15:44:11 +0100
Message-Id: <20240729144414.830369-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In append_stats_line(), we have an expression
   l2_access ? l2_miss_rate : 0.0
But this is inside an if (l2_access && l2_misses) { ... } block,
so Coverity points out that the false part of the ?: is dead code.

Remove the unnecessary test.

Resolves: Coverity CID 1522458
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240725164851.1930964-1-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index c5c8ac75a9..512ef6776b 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -558,7 +558,7 @@ static void append_stats_line(GString *line,
                                "  %-12" PRIu64 " %-11" PRIu64 " %10.4lf%%",
                                l2_access,
                                l2_misses,
-                               l2_access ? l2_miss_rate : 0.0);
+                               l2_miss_rate);
     }
 
     g_string_append(line, "\n");
-- 
2.39.2


