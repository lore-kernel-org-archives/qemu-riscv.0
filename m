Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C044C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5DG-0006uj-F3; Wed, 03 Jan 2024 12:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL5D5-0006FX-5M
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:39:20 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL5Cw-0000dc-8A
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:39:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d894764e7so25111445e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303548; x=1704908348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjgnYFLBOv5uB2tWkg/kIZdJs8xT0wOiNJtUez299cQ=;
 b=W1qQNInEuA+Z2I8CU38mZRcMQ9lAXxekImthC6KfNg6T9pmsUqW591gAacpTuJc8dr
 /zs+EvWQy0Qu3cquBHgyFbpdgHcXe1G5YAFjPJgHPSCS5fLkPAei/+OBXo3UItHtG28l
 /gTFjebnnuO1J4+14JXiJDOaPgWVU7EOi7xjluJvN5GoETSNoGKh8q1jYn5oeoOXAZtw
 GabI1dRvoFzrQZEdWryPajahZNb6MnQyeTq7r2MyoOfu/65QRNgil9O7INVzDcBONGX4
 tIfkr+roUYtCBB0L7lZ/DVd4knWGI2ScoP/bcolVteT+nTLDOiBREUwbPk7cTXjCha6l
 PHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303548; x=1704908348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjgnYFLBOv5uB2tWkg/kIZdJs8xT0wOiNJtUez299cQ=;
 b=opz6Nwc7lEWJD7G2uM7JqwjZyQxFX0FXYG14w4RF589e1vAJBfgxA6YBcragtwkvSP
 avCY8iOpnrr8GE+CXBS054/pQRdbLBYyijcX1sO9f9CXdOK2SKiTev04/EqvK6wqjJsb
 kBItud2gwk/aLk5d77CMAOFPFrpBDLKSQ5nMx+msLTsXIRnEYrukpAGFDyiWuwqZGULK
 oIhYr720vk3f9IkWZvVRbnl730Lri4tvzIDePoip1YGfloHkOvyUdx+Eq1FFD9x0Zx0b
 bAJ0CT0iol7hp1zCQKe3I+wfkymWYVhjDNbr54rtWeJ7aPJgQdjAQik46qkXCVSka0T9
 nkSw==
X-Gm-Message-State: AOJu0Yyn48ozAavdwpYdGZDy8wRZqR+W7/Y+LSziCWEa+9eksvmA+qvN
 UWzCOJ6g2FiLkX099PbZeDsD6OI45zRhkQ==
X-Google-Smtp-Source: AGHT+IECwsD+EsV7hgtfvLIigahdUQBBQ70d0NAK/wXl9lkOBh690IpgKO7C8ioQ4D+awmSxFlPX5A==
X-Received: by 2002:a7b:cb92:0:b0:40d:38cd:ad5c with SMTP id
 m18-20020a7bcb92000000b0040d38cdad5cmr6656970wmi.263.1704303548411; 
 Wed, 03 Jan 2024 09:39:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b0040d604dea3bsm2972869wmq.4.2024.01.03.09.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:39:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 542725F9D4;
 Wed,  3 Jan 2024 17:33:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 39/43] contrib/plugins: fix imatch
Date: Wed,  3 Jan 2024 17:33:45 +0000
Message-Id: <20240103173349.398526-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
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

We can't directly save the ephemeral imatch from argv as that memory
will get recycled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 82dc2f584e2..f262e5555eb 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -199,7 +199,7 @@ static void parse_insn_match(char *match)
     if (!imatches) {
         imatches = g_ptr_array_new();
     }
-    g_ptr_array_add(imatches, match);
+    g_ptr_array_add(imatches, g_strdup(match));
 }
 
 static void parse_vaddr_match(char *match)
-- 
2.39.2


