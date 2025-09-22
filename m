Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA4CAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:39:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d10-0004uk-3F; Mon, 22 Sep 2025 05:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czy-0002ZA-Bk
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czI-0000hS-3Q
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45f31adf368so29198615e9.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533849; x=1759138649; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+a3CcA7uLenSBTz2VMDBFRvLVHxH8fqsvjG7VIzS+i8=;
 b=slf88DH95zqEECNUrRazB52Lmp233bhb3NvOSOT1VGZiC85DbYfwDBp1g/HefOPaGq
 naJiwha6eI/I8WBSTo11XSsWMH4yFQ15/mZDoXbW+lokAs+uD0wEuWUtjs47v9uamL3/
 0fOlAPKvsxpmBf/u9VFx9yAyCo7ZUweLyRbcibNnORX7qGYAXIYG+saSHqucqL3k1u1/
 6FnHOn7Rd3IC0r7zYe0btLOsPDrYPhE0y+mfy76uiY3lNzk7Yk/m1N9xkP/MUsSCXFYW
 18nYAWx/8KLEI6RvXdkswsqeyyIWIHCsyBLSZFGU7KInWSUHrPgBRIy7k33fb0iQn0A2
 Pfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533849; x=1759138649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+a3CcA7uLenSBTz2VMDBFRvLVHxH8fqsvjG7VIzS+i8=;
 b=HAkjB7mn9nf6vT7xztBCMBmDs3/7i4K9/tR1lBjigPKdG+o5QkR0RrwFnj1aBuPowT
 GxfjtNWM39HMvalwtSe8lBtPH6FKo4ioNGZY0nYe7MnwIxGarisTpEiL5aCfKJu2hSu5
 Mw+lrh/wouYXdy3PVmQSYlXLP9cGDc3ScqkVrX+ipJ40JK5lZmhzi9ejyTmTZqHX9vUf
 IvE3DF60yoslsGxrF+ky5JHRcR2RyDPKhR7OACiwXgJo5pV0z+rXFtqnic+x3v2Cp+nt
 3AcWTb6Rbh+dbm6JxcjvPyoF3ZwyppHHaMO6GYFjkTZdesBsoNb28BInkdTD4/W1ixUY
 LPGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIHUjAL12eGhZ9x6ybz7Je3SyFwncVew6A21hDkk+X9MD3IJ0EE05Ak2SP+ekn0YuOBgxUzzxuorgM@nongnu.org
X-Gm-Message-State: AOJu0Yx2H1a7i2+p8kTIhZaz/tlnCYl1SErzJSPobhSpYEoq/xPbZbJX
 LmnwNV+BDGOrZQqa0o3wfm6+FAy4HHDrg3v099deTXpnyCOWOSswCiXg96XrwklIlAM=
X-Gm-Gg: ASbGnctryUfdn3ZVul3nuxnKVXJ79Lu3X6FmWBz4rgc1NUl0U7CC4+ZWKeOG5FSabc7
 8znvYnPU3S6jNa57yrk8t5z1nLX6WQlmqy8B61TR24q8mPBvXFNfNEJ8i4HjVb2e7K4TQpfh0VL
 pqWYooIWucY2qXlsCym9MDlWfjHMipbexjZD9b8bXJwB1qSZkK8dhn7PNJxooI54p+kW58peSn9
 nEj95RifIBx4zyiK3fxTF6jC4/wSpau8oi/3sn5ANNsga3jLplIu5pn3ZKL3mhztRd18mC1OsM1
 l/CnSqlr9OeS6IHWVXk9vWqvjJ1XHG+U4RHvVu76ZaUrzQqKR/COUCN/jAilG1qq2t0cdfF776X
 CNGZMCvrL8dIbnhas8FbY1PTEjvxGvaBCWQ==
X-Google-Smtp-Source: AGHT+IG3ndmsjU4bbWOAnoNWNzTnJGA31mG1EG0SJnedwU7MQSfWvmNHUqcLH2HPNn1H1Dx3vzcDVg==
X-Received: by 2002:a05:6000:2c06:b0:3ec:d78d:8fcc with SMTP id
 ffacd0b85a97d-3ee7e1059d7mr10967822f8f.14.1758533848798; 
 Mon, 22 Sep 2025 02:37:28 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f61703b206sm8925031f8f.6.2025.09.22.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15CBF5FA1B;
 Mon, 22 Sep 2025 10:37:13 +0100 (BST)
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
Subject: [PATCH 16/25] contrib/plugins/execlog: Explicitly check for
 qemu_plugin_read_register() failure
Date: Mon, 22 Sep 2025 10:37:01 +0100
Message-ID: <20250922093711.2768983-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In insn_check_regs() we don't explicitly check whether
qemu_plugin_read_register() failed, which confuses Coverity into
thinking that sz can be -1 in the memcmp().  In fact the assertion
that sz == reg->last->len means this can't happen, but it's clearer
to both humans and Coverity if we explicitly assert that sz > 0, as
we already do in init_vcpu_register().

Coverity: CID 1611901, 1611902
Fixes: af6e4e0a22c1 ("contrib/plugins: extend execlog to track register changes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250710144543.1187715-1-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/execlog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 06ec76d6e9a..811f3203199 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -95,6 +95,7 @@ static void insn_check_regs(CPU *cpu)
 
         g_byte_array_set_size(reg->new, 0);
         sz = qemu_plugin_read_register(reg->handle, reg->new);
+        g_assert(sz > 0);
         g_assert(sz == reg->last->len);
 
         if (memcmp(reg->last->data, reg->new->data, sz)) {
-- 
2.47.3


