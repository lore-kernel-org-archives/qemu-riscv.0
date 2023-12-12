Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59414C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:35:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1z1-0000Cq-8z; Tue, 12 Dec 2023 07:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1yr-0008Ro-Qy
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:22 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1yo-00072U-1e
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:21 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a1f8a1e9637so547045966b.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384516; x=1702989316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=my60g7IAHtC+Xh4NyAr8rtLaKcoTnKLvvJwkWl2gbFo=;
 b=V5UI/R/l1ngYEGNCHAHqPeIzA9erqqgRQa3WtWRzE9De1qotyYYSIr1c/PL5zJe4dw
 Z517BpE2HLg19yJpLlDjrq63DnrfpiKRX12HNILM8qSiOSgywQK/8kbE82wlfzGV34ex
 P1VCfvZbNcNGYdciI20U2jW6XMVSMoWzRElIZkS45eTrCCcCZ8B2q0dtt3CTJhrjex9M
 xUvwb0Q2GYugc2cQ7WviTxMFnypBqUNJLxZgek2cUqVW37dC8NdxTs1Vmi/L1NNj3cB1
 V+PG/sp5Qg08nuuJ7aasj0SgcXZp6EcrWbI5f0gZIDLAWm/aTPjmyifoFEExPHFe4mUb
 nB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384516; x=1702989316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=my60g7IAHtC+Xh4NyAr8rtLaKcoTnKLvvJwkWl2gbFo=;
 b=lTxDvV/OYMI4LQ1TATlWZw2WfCmUChV/cXBVoYdq0b2NcIopNZ6xLmUEsOSRK80CNn
 UrPXzY/ArcnyYNYszhHjY86WpjgN6XNNiEhEEltGfn1pwqGekryE5azQkiXcCVzwLszD
 D++4MpJj+YE0T55MkO7oC0UPkWXsgZAXMesdOM6yNts+Lo90I/6m9KRyHQcGvENBDVxJ
 ld/qWpeDpp8woqFpHzumQQHpeqkYt5XQIVN/ZeAWfzm7VvDG6S26TQKInDyummScsuMB
 fB7UHlDeeC30N2Qlc4GyBtJHOi81/+ETnUXC0MMx/wcJ5XxlVyrJ/x9aBXqqzJ21mMD8
 OARQ==
X-Gm-Message-State: AOJu0Yxa2zot6HpzaHN8eQwqTPna7JcLKiw6xWTyljU8OFBqgmQG7ckq
 C31FaLvoq6bCyoBCLyyOz0+v7A==
X-Google-Smtp-Source: AGHT+IHg6SmT2GhDFp4PTORsgElZmax2WEunLBgmWsjFP5qNYK4wg1Y/VLxqjo9Fr/AZEmMcrounvQ==
X-Received: by 2002:a17:907:6887:b0:a1d:b773:ae8b with SMTP id
 qy7-20020a170907688700b00a1db773ae8bmr7213392ejc.17.1702384516222; 
 Tue, 12 Dec 2023 04:35:16 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 vh9-20020a170907d38900b00a1d18c142eesm6233817ejc.59.2023.12.12.04.35.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 10/23] target/i386: Include missing 'exec/exec-all.h' header
Date: Tue, 12 Dec 2023 13:33:46 +0100
Message-ID: <20231212123401.37493-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

The XRSTOR instruction ends calling tlb_flush(), declared
in "exec/exec-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4430d3d380..3bb018fbae 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
-- 
2.41.0


