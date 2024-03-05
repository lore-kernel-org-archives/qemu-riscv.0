Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66450C54798
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 12:21:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhTlR-0001SF-Ro; Tue, 05 Mar 2024 07:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhTku-0008O1-JF
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:18:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhTks-0003DP-91
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:18:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412e6bdd454so12091165e9.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709641124; x=1710245924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ibtd8j2iIFl1RCVEa98L1O8fLydOmPGUu0P3W6zXxE=;
 b=fqsQLDin4//iDhHTmNzLHZWSFoi9GPkZjTQoJzl6JtwzLtLzp9yaZQOViT+8YKwx8N
 q/qLp9vDHKqSizcDzyj6eKxEkIekr2vWW2HgiLel5WQ69xw8spnaA7C7fkbIOrwkj1qy
 7dzIrTU+B0uUeHoAYfQ+wiaXPYbADnOARay9Nnz3dT1X6TydVyj5sbdQXx7E/UpyZzzd
 s7l8AjK5rcSb5BnAyJOf2cBt6OmzdPSZU+4X7JFb1wbQ13BhWy39IsVhQRmnfdXCmuP+
 3LR9C8fKcE7eY9YgW0MqQr2YkW5SHsEop7JXNT8WA0qyV+kbFP4Pft6eK2rgOLssTrlY
 0VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709641124; x=1710245924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ibtd8j2iIFl1RCVEa98L1O8fLydOmPGUu0P3W6zXxE=;
 b=N7I3YDP5ybxJQtv12Q1hYqF3qejjN7+L1mYoEk8tSgX7Y7ZNZH8D6WOWXCej5WguqW
 ICMKM8sdAaxsLZiQyNYHBOsloU9RBXB+t84E1B1oprqe1xJCLI8JamO3OUGQUIWARKYO
 KJIbjOcwge2cuz8JXVi3SGwgrHC4mAW6Tkd0cYsuJLA6/j3k7TKQbl2b6LB+YUPBD7HS
 xUQt6u/Y42inPzcP5BfCe6p03cPfYj9cgu6V9WaUnxnfJCtRZ2C9QZ3j20Xz5sf0+i8j
 u9mwRZ6TCQuRAaVUJtWmrEpi035weXwvGe6vj//QQVnL8KjCCePPSvUYXLIE7l8EMcu5
 2itg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ07m9hXpNdVKYkfsj4G6OyE14kppPYhTL9kpKW5+TGl6nCWlgNwsqnJYlQIm2vuDYSETmJS3DA0UFHgBlMEKj7peYveg=
X-Gm-Message-State: AOJu0YyLJA1Zt2hPTrEb5kUYPh9aUAiB6HbJSBQBsW4ZiCyNrO+XRFGj
 kTeg5E51Oj/FCpTXDWVuQL/Ig7NOJ9M/S7tfplTnv6YsYGkvlMZfNSmgI7twNKY=
X-Google-Smtp-Source: AGHT+IHt+GJyylRvf3ZnELcku1HmppBPkHdkuOG4oZm43grjxf4V+Db1DsOmEgWaKJydViUM5V9Y3w==
X-Received: by 2002:a05:600c:3148:b0:412:bf53:51b0 with SMTP id
 h8-20020a05600c314800b00412bf5351b0mr8992277wmo.20.1709641124182; 
 Tue, 05 Mar 2024 04:18:44 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b00412ebd587ebsm2115487wmo.3.2024.03.05.04.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:18:43 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F10295F9FF;
 Tue,  5 Mar 2024 12:10:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Brad Smith <brad@comstyle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Warner Losh <imp@bsdimp.com>, qemu-riscv@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 27/29] disas/hppa: honour show_opcodes
Date: Tue,  5 Mar 2024 12:10:03 +0000
Message-Id: <20240305121005.3528075-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 disas/hppa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/disas/hppa.c b/disas/hppa.c
index 22dce9b41bb..49e2231ae62 100644
--- a/disas/hppa.c
+++ b/disas/hppa.c
@@ -1972,9 +1972,11 @@ print_insn_hppa (bfd_vma memaddr, disassemble_info *info)
 
   insn = bfd_getb32 (buffer);
 
-  info->fprintf_func(info->stream, " %02x %02x %02x %02x   ",
-                (insn >> 24) & 0xff, (insn >> 16) & 0xff,
-                (insn >>  8) & 0xff, insn & 0xff);
+  if (info->show_opcodes) {
+      info->fprintf_func(info->stream, " %02x %02x %02x %02x   ",
+                         (insn >> 24) & 0xff, (insn >> 16) & 0xff,
+                         (insn >>  8) & 0xff, insn & 0xff);
+  }
 
   for (i = 0; i < NUMOPCODES; ++i)
     {
-- 
2.39.2


