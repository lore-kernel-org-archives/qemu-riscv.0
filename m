Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA13C5478C
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 17:04:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reeNk-0004SC-Bl; Mon, 26 Feb 2024 12:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeNS-0004BJ-U6
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 12:02:55 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeNI-0000mL-N3
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 12:02:53 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so3343623e87.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Feb 2024 09:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708966962; x=1709571762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=LlPaXiaWdyY1Tt53Va3b5t2Kw/bagc37MDyNOhd8xxypQETVZMGJGnSDJ187mPXQb5
 1MKrhcV6t1K0Tj3RaUF6cteSLDSDjsa4nj7W4cxyq4rDTcenSHAKWeFfmKucHyNXy2sS
 uKp32orca98/bx0zItGLhVgwAPJ+pEqJ9u9mxqfDQq8y7MHR7JIsLPWSGeI3N9Czcpjj
 +ZVt5tpUEwcIJMrBMbP/jggmN/Ns3vyxBQtq4XPQBu3EagCyTIPkRRb2DZFSyK0b8LLR
 5Fm2ixtbe9svcVnzSsyWLG1FgM0kkfhrgv3q0p0r5d8KEJR2H6cJeZ7EnyRcAOJhX/kA
 4yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966962; x=1709571762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=DETqKwlmdHiB2WWz/+FW1OifrRkRli0xxNtRdT7oyUJCTCAZSu/0A3JlJkm4WBcOx3
 DDPvE9/LQvBMJXPZvL7qc/JfgugxF4fI/X188wBV2lZ+5wG8jWvHSB0rxtN0cj+4x9JY
 RIuxeZ1WQjfQx4GAboyG4qfgqlxgoBq12TjbKBBW2U+G7JwKWXgTdgtYRLga/sHFORup
 GD1faTsLPQpA2YhOO8pBonhbo79R96FHLS4DUinCq5V2FIL8BnG2xvemnWtzVqPbNUdJ
 KSoFdY63fyLdCEsSb9iPvqvzVBQb7ZjcsatDbD5th3ubqD6AsOTvhMytMKCy9XdIwqS/
 bGjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrtsbMhMLXzidlZve9EvWbNXDsFb9+4xhqla472j3V4PF7fyiWsCbdB6Y5Ndjq9BDfw4k3Ymvnu8DABsmqyKwZgdjua8s=
X-Gm-Message-State: AOJu0Yz0nhp03tusNRhlZgRXZO5oR55aNdwfkem3ppTE0LEOj2sZ7nBj
 DdwhLMy0DjqRSiYZCcI+dOQ+hvnOMNjosN/IN2zjIl5dQuhnbWp9/ZzlsWcSKQI=
X-Google-Smtp-Source: AGHT+IEwVu9Vs9v1UsJhn/jHYC1+ql7nxmwglqPw3ApuKGdW0/lPYfZjzOEUqd50h5T9eTNz7uq3Qg==
X-Received: by 2002:ac2:46fc:0:b0:512:e25b:2e77 with SMTP id
 q28-20020ac246fc000000b00512e25b2e77mr4427967lfo.44.1708966962565; 
 Mon, 26 Feb 2024 09:02:42 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c379900b004129051a8f7sm12280385wmr.41.2024.02.26.09.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:02:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F06095F930;
 Mon, 26 Feb 2024 16:56:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-riscv@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Brian Cain <bcain@quicinc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 23/27] contrib/plugins: fix imatch
Date: Mon, 26 Feb 2024 16:56:42 +0000
Message-Id: <20240226165646.425600-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226165646.425600-1-alex.bennee@linaro.org>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x131.google.com
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


