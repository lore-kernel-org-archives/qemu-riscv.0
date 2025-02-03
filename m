Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA4BC02192
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:49:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1texlQ-0000sY-FG; Mon, 03 Feb 2025 09:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlK-0000pH-Qy
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:49:23 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlH-0003HI-Jo
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:49:22 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaec111762bso375649366b.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738594148; x=1739198948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWETF7v5SQvqoJsQUou+WYUPWgAQpGGIidnYpzh2j4Q=;
 b=HNSm6bRdHGDDFxqkp3PlHuInutEPWBEk2K1Hfw+WbHURBlxDRcrnH+3RzDPKWdHb1F
 yWyZU5X/+R1SE65AsZQdIMvQYPJezx4R/3YkrZTl/fKVbX9KbeE3sLmie6ywPjtW27g8
 uFE9TRtiGIKGKj5GpOvoN1uPXwYrFBO5rYqPsj4IKAC1Tmp4xonvbQKgBWSW2K8VjBpy
 XZU+tKVV90FGp1s/Hb+jaf7b8+/l5IAACDaZGXWRpG8vlKuSg5SJ92tWdNvEI0pCJ3Uk
 kE6o1OHLBfjC+zMA1RwB6IwKXWoF+IPCSoJVQBa1j5+lWSU+jS1I5I7aYaG89WOeEwQI
 1iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594148; x=1739198948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWETF7v5SQvqoJsQUou+WYUPWgAQpGGIidnYpzh2j4Q=;
 b=t7OPKB5Gy08MbVwAymXDXiw9IyPq8818+jTFIWtROBm0FNjPO+XrZRZ90U4a59H94d
 UYJwPIt3mLEq0Xxjtvcc4dgpIJOEiqtx2ePHtd65r3Y6dloqGaImv6c7qrPgA46Cqu8o
 6ivPL/18ee0JCdWp6Re4e+fAOvRta1617UoRGbquGbmJoDLBI3Mkrn+qVWS2VUPtdyk0
 ZJahT0K/mpVbtRqRNUFpEbIf/P8M1Ky6bnGRGq3wmxI+kQ4QfBhCu/TBwMLJWuTJDCBv
 LfHU5jmn3u/VLg0U1QkysMZAy0azJvWf4cUp4u5H9t1azuZWyjhIIlGAn5sHP2tyOWVP
 S2mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/HBCeRCllwmXLDM+Jh49sBX06xAcLsxLJmAs1PuMaUdMFBS+8qVz0SsAV+0uCzWc9U6rbLNLOGzMy@nongnu.org
X-Gm-Message-State: AOJu0YykUJce15PQ9X17pY3vBI+f23Yet4P6976UWabHXNCvJEAgbSwc
 E6OrnINYiEzg3JSJb0q+1kZ7Opbo5jxIxciqWSSHFX7ZScLFJ7HScDtIj19Lrvo=
X-Gm-Gg: ASbGnctUKiCFcykTAJSPa36CjTMppUCop2M/H4QaTjh3ArLuUFzQeIABWfp6bWzQHXf
 O0kEo7s5S38+I+j87mTE14lnWMTcmhq8YKLGk9ECnBFeCOWWzXaYTHEVxPTIoIfVILMCFcTxU5q
 n4DG+YHuqaWMM0xRQb6702omxjoXVJArQDfwMK0tHL2qO2iHm4P2VGJwircvN7GUV/FmoKsx1Ny
 Cg1LDJ6LO1/eb1KNGv/TI9bqrJw28NHJXEyb2Mv9IPX5hjIAYz3ub4r9MJT6uPZcK7/yLiwaSZM
 yFeA2YDroGbmYvHbWA==
X-Google-Smtp-Source: AGHT+IHCBJbspYBJtSHjAYclL3HRGFlq9TESmSXnRpqM9nfvkyXmc3bXADWs6SZLLMr4H9qJqw87bw==
X-Received: by 2002:a17:907:6e92:b0:aae:8be7:ba07 with SMTP id
 a640c23a62f3a-ab6cfcdf5dfmr2398457766b.17.1738594147546; 
 Mon, 03 Feb 2025 06:49:07 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7106178ccsm412435466b.9.2025.02.03.06.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:49:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8209F60F1B;
 Mon,  3 Feb 2025 14:40:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-rust@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 18/18] plugins: fix -Werror=maybe-uninitialized false-positive
Date: Mon,  3 Feb 2025 14:40:48 +0000
Message-Id: <20250203144048.2131117-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../contrib/plugins/cache.c:638:9: error: ‘l2_cache’ may be used uninitialized [-Werror=maybe-uninitialized]
  638 |         append_stats_line(rep, l1_dmem_accesses, l1_dmisses,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Is a false-positive, since cores > 1, so the variable is set in the
above loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20250114104820.2613099-1-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 7baff86860..7cfd3df249 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -603,7 +603,7 @@ static int l2_cmp(gconstpointer a, gconstpointer b)
 static void log_stats(void)
 {
     int i;
-    Cache *icache, *dcache, *l2_cache;
+    Cache *icache, *dcache, *l2_cache = NULL;
 
     g_autoptr(GString) rep = g_string_new("core #, data accesses, data misses,"
                                           " dmiss rate, insn accesses,"
-- 
2.39.5


