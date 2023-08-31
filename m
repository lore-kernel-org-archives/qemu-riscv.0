Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AB6C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:57:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhEm-0002au-W6; Thu, 31 Aug 2023 08:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEd-0002OE-2J
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEU-000587-5c
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc23eso7099095e9.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486626; x=1694091426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVa0NtnHK7rvI035uHhcp5vIA6pkk4dL+deBSQt+atY=;
 b=EDSohC7PA2zAbK5akzAukNSivCLGisvbINZHctfF65M0Qk3TJcnrEnXb8FYg7fnZhY
 DZKdy1fSsAA5V/ogs0nkmmfnCf/jarlJUhutRBNkaksVnMEdCtIrlRJmoeSwdUOpkwqs
 lpNl9w7dgDfiMLVPeMw7QbP+aOBilH/ZdTD4FG1n3P+UQI8ZyrkIfJU5dr8tcWKsjMYs
 pojw03rwh6OKTOOLiP81rgF2YpwZ8ZVUPfoD/C55uRa496WOKFYieihZMTDni4MEfUb1
 HnobqqGn5s76K6cgqnNd6/ESV7BmsMteofWEHMBqeumh3xqz7a8dK7ceYGx9dH0GAfmm
 vohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486626; x=1694091426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVa0NtnHK7rvI035uHhcp5vIA6pkk4dL+deBSQt+atY=;
 b=RaC+JspEBwNHBLaYq94nwSaaCCxU1K/hNHx4up3zcjdJuhbCACIHfnLBImDw/5OaFh
 4mUW6eC8hkhiX9izbF4/d4kWDzK6uZGRXF4nghRR6Lil8NbdwaaBcUNJB8xPjwMVrL3F
 MI3mrHCWnWnuPkCU3jUsUBCYuXBeU4ypbU9jtShaRCTwuC7uxcGRooxfr0nkerCCcZNS
 8BaHGJGi3Sezzds1XgXdu5fs+8pfatPHVVXY3WFiGP6iuwyx2AjZOJxSQAu2Lgz/9ioK
 cY9bY6VoSHMLc+N95cLLQTP46kc1IVhniPTmC+nkGuI8xLuO+xDj+gR+wBFOsRslytlP
 bmKw==
X-Gm-Message-State: AOJu0YwlvJuj4gjqkihyyn0c0OuOSG8guubEMP8jkwEP0yGKajiwYICu
 ogV4uzxlQvRH4FgRXkNJ5gAPcg==
X-Google-Smtp-Source: AGHT+IFs/y+DnSPTkRAMC9hcFQ2mqJ0x8sctw2FvRn9+gvLQso1aUOy7qOshQww20/qAlWHq4a8hZA==
X-Received: by 2002:a5d:6150:0:b0:319:6d3c:c5e5 with SMTP id
 y16-20020a5d6150000000b003196d3cc5e5mr3909177wrt.58.1693486626202; 
 Thu, 31 Aug 2023 05:57:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c299000b00400268671c6sm1911549wmd.13.2023.08.31.05.57.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/41] qemu/uri: Use QueryParams type definition
Date: Thu, 31 Aug 2023 14:56:05 +0200
Message-ID: <20230831125646.67855-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Follow QEMU CODING_STYLE, use the type definition,
making that prototype match the following two.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230605175647.88395-4-philmd@linaro.org>
---
 include/qemu/uri.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index b43f35a6a6..2875c51417 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -96,7 +96,7 @@ typedef struct QueryParams {
   QueryParam *p;       /* array of parameters */
 } QueryParams;
 
-struct QueryParams *query_params_new (int init_alloc);
+QueryParams *query_params_new (int init_alloc);
 extern QueryParams *query_params_parse (const char *query);
 extern void query_params_free (QueryParams *ps);
 
-- 
2.41.0


