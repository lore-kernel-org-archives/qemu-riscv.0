Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193BAC4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnjG-0003y6-Cg; Mon, 11 Dec 2023 16:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjE-0003lm-J0
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:16 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnjB-0005iP-TN
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:16 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54c7744a93fso7010241a12.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329732; x=1702934532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7TvOpmG5rK7v745EjgOtFzUovndqFqHJ7siX/q7POg=;
 b=hi7ZzLs9h3Jmk3qs6RFjnqPsvSBo0s8N3jXyQK6sb52lpka5dN6bAEqcj9jdjdY8lc
 sTAdw9/6niBSc+XH1rfWblE9uMReqIegjhaJnUD/PgByvkERtcZ9g6/NKrQLcXj6iKR0
 DNQkgcf1YjsoWCVQb509GmL8z/eyDhAxVlILH4OVC6CdVxQA4UvQzfIfROlKkofb9r32
 f/5dMPHhPMtC8up6t5EOn4v3n9FlTUP/Oa32C8j49SFC3EdgqXno9U6JcXFaty8reTUB
 1L3PB9BIMlcSTQ1xjgugYyyaA05e0I42zF3JUrYZCobb8/nyvJpFyPiizH7FY4pSfQEq
 9gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329732; x=1702934532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7TvOpmG5rK7v745EjgOtFzUovndqFqHJ7siX/q7POg=;
 b=GHZFLz1b0ps9Ua1gTAvxALQ6Esv7SZTBI9JPv730kyq5ZOdigPzkQGcovkjnejiBCp
 qasLGsLaiE1zLuAE34xN+JkY+Ux8jAP+eSzQpC7Q7ze34yE4Ge33ijqRSdkJ8Q9s6b3a
 ez40yFbwuLgNDhg7rP6zoYGbp0q8bLWdqkH3tVwnbE1lhlzNFyyifk778rOzvZCwzNVN
 6hLctxctFZwhFqkgYeEvhLNJ6eGu7TZtAmeNgQRtas/lLTi2csxK9SUh3gwWXPuv44AJ
 6nU+sf6sBNh7GsQ92FPBukrmnaacI8vcRoQFVssW/k+sbK4nfRc+dgrT+l8OvhV2qqbB
 8sXw==
X-Gm-Message-State: AOJu0YxTP1hwegB+M1t173JGKxy++FI+qImPAyxvq7Yh05PfK+2xAUvF
 9Nb8E1kXqvIcgUhXR6sEqh3zyjgPPvqP6UrnLyjNYg==
X-Google-Smtp-Source: AGHT+IEirH0rnV+3IGN0xpftLFBW4PiAjAsuBq2ngsAqGUtyYJ6TUXvHpTZu4rTks7zjOTQhAO1Agw==
X-Received: by 2002:a50:9999:0:b0:54b:1a4c:8709 with SMTP id
 m25-20020a509999000000b0054b1a4c8709mr2882786edb.2.1702329732623; 
 Mon, 11 Dec 2023 13:22:12 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056402090600b0054c9211021csm3952454edz.69.2023.12.11.13.22.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:22:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/24] exec/cpu-all: Remove unused headers
Date: Mon, 11 Dec 2023 22:19:52 +0100
Message-ID: <20231211212003.21686-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

Nothing is required from the "qemu/thread.h" and
"hw/core/cpu.h" headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a7b5737d3..b1e293a08f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,8 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/thread.h"
-#include "hw/core/cpu.h"
 #include "qemu/rcu.h"
 
 /* some important defines:
-- 
2.41.0


