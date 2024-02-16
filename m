Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46EEC48BC4
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 16:39:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rb1Di-0001MJ-5D; Fri, 16 Feb 2024 11:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb1De-0001Gk-WE
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:37:47 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb1DV-00044Q-4I
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:37:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412345cca4eso9768915e9.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708101455; x=1708706255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=VrH/reiFDWQ2Db+w76f10YUdo6E5Rzi72ykbJ42OERHaUrnVwOxZpVCgnim0+hPHD4
 +/Z3UsrUA/2Ga+7Gk7wnW3asDUOx6LZ/5FwI9+dUhvW1hr2ujTpWynxgf73GdL/BAKiY
 dC6LdEE3elUO7VUQynx1DovYUHVUxF8Gs7ts07jJWJ8PwZidt2ZTTB0CqdkdqNSu1810
 MuD+e8OZqR/+pyMe7TNcBW5FIe0U8mbTiFfeL4FgFi1wsymP3gmfOTy3zw3nOKlw7j9P
 Xpe5ZTMxiqSPL9lZSMTqH5q23KFgeOpyf2AZu3KJJHwpXrLtfz4cbYgR2i2sTgON3GW5
 G9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101455; x=1708706255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=mXk8DFlFaA88AjzQXwXAANxZ172N3+4iemkVzBslVyyUcYKGvy1gDUBUse7o3Sck6r
 3kIWp8ne1nR9IF06Azb15g+lAfstcNJBr57/UKy6Sxe+erQYaKGBXatO8Kgywx7NCBGl
 GlFM5TopwK6246l/0etUF8bcEftRY/UzCosHhnURRecIvrBgKz7m22tk+97k5ySkv8e7
 OXkS+v2Juigt+kQUWpOXU/QZsI57mR332tIR1guxAVFpSf8wvIakoSfluiVYa/zkpg9z
 CulAB6LlClRAYMvmTN6shKb662ucmI1kbP1lU8FKtD6snLT7qplmX430yZbDzQC+6shS
 tWsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs2WSW10yDG8JtDdaGzxCIUAqEXsOjndNFntd32C+5yauH5AB4G5TZFhdZcMZEdUUma9y3SdlEdA2CO1bvwfIgIqpO+I8=
X-Gm-Message-State: AOJu0YxqJt5CTm04xy0nifEC7YxhCCLKxTJVGxQa8xOZ7y4OFa+cNygP
 EX2xqqFDPN6A9e5vkyzOv/XLrV6KV/eDke1VN+m8wl0nXisBMREF2mG9m9bgR50=
X-Google-Smtp-Source: AGHT+IHbea+OWnxnKrZho1OGEwLwx9hv1iLKoWJMfwMnWMGvbM4RAhZPfrc1zSZFlUVmELcVMPFm7A==
X-Received: by 2002:a05:600c:3591:b0:412:1d7d:6c5b with SMTP id
 p17-20020a05600c359100b004121d7d6c5bmr4016272wmq.10.1708101455308; 
 Fri, 16 Feb 2024 08:37:35 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bg22-20020a05600c3c9600b0040fc56712e8sm2881464wmb.17.2024.02.16.08.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:37:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3919D5F9E5;
 Fri, 16 Feb 2024 16:30:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 19/23] contrib/plugins: fix imatch
Date: Fri, 16 Feb 2024 16:30:21 +0000
Message-Id: <20240216163025.424857-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216163025.424857-1-alex.bennee@linaro.org>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
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

Message-Id: <20240103173349.398526-40-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


