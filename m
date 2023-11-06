Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFB8C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:09:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxT8-0006Tk-Fa; Mon, 06 Nov 2023 06:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxT7-0006RY-FY
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxT2-0005AU-Ol
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so32439515e9.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268906; x=1699873706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bC2TdykjktUVtXbtq0twsr6zjowOcVE1/YbXmtopUl4=;
 b=mHPVzGz0la7J3gPwaYN9JcS8YoNnrPxizKfKyAiyR8FBBwPBFkAK0LqLpL9vxM3x26
 skSRMcQv+VlS0LvrGI39tAE7O5SJtdp4myb9vGlTPR0AVpRt7FMUh5yrJFQb9qXccclB
 x4cfpaNZZuxegEseqrpLTMnHSyLdj3qhPWYVcbaLLNNsBYOE/KEm1VqC8qbTVg2CODwV
 4Blut9SNADfSFuiggogXH51r3oJzbq8jUnvVictKW2SbpaymwU79Yt5z3V0bc5uSGqG9
 l5HHDyi/ooSVGROYavcrVnHtpgI27YwG6TUcJiW+PIMpOedLp9/P6XVpiX5SWC489O5z
 xtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268906; x=1699873706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bC2TdykjktUVtXbtq0twsr6zjowOcVE1/YbXmtopUl4=;
 b=QxQfflrDz7FRbvNUTnpWHrBwV6VXvJXEeVY02c1bKVBWTMNkJWGSJQfjq2USUpcoxR
 BKg/QC4q0WkHQrFLPuuo8nrKBJsi+OPUlz9eZqq9D7CA9fc6RKyH0oBOGs2/AUaXT4Wk
 uLz4y/jbGfDQzTw6gcKg/ELOROvBGPQ8u95DZiJJGwTXXSiWDTaYOP0o0nyK9fZNLFbE
 qrdvN1EtObJGjyAUZ1HtvWT+KJE5WVfZZeYb1KYWNXcCTluXNfjtkmd9LbCYz4MK6DFx
 kUD/0QIRvAH6edYzGDAX2qD5yrdHUIA4jWJIybEXyXRQ12TIJ+eEiyE7uD1k9VtlKNqX
 kCkg==
X-Gm-Message-State: AOJu0Ywhlpgw9DlbC9XA/hyNw3dN/dXzCyjQJLDI8NUS++P6L3Vvef3I
 CjT71ni//2e7fJAqNmaB7AsYpA==
X-Google-Smtp-Source: AGHT+IHcL9WmfBoUy68GkAigOFElgUltPcHFMGDZ3RNZRT8AFGVHPWLoneY5rupalCL7WjqSCGEKUA==
X-Received: by 2002:a5d:62cd:0:b0:32c:c35c:2eea with SMTP id
 o13-20020a5d62cd000000b0032cc35c2eeamr17839736wrv.6.1699268906698; 
 Mon, 06 Nov 2023 03:08:26 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a056000180100b0031980783d78sm9136370wrh.54.2023.11.06.03.08.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:08:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PULL 42/60] hw/isa/i82378: Propagate error if PC_SPEAKER device
 creation failed
Date: Mon,  6 Nov 2023 12:03:14 +0100
Message-ID: <20231106110336.358-43-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

In commit 40f8214fcd ("hw/audio/pcspk: Inline pcspk_init()")
we neglected to give a change to the caller to handle failed
device creation cleanly. Respect the caller API contract and
propagate the error if creating the PC_SPEAKER device ever
failed. This avoid yet another bad API use to be taken as
example and copy / pasted all over the code base.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231020171509.87839-5-philmd@linaro.org>
---
 hw/isa/i82378.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 79ffbb52a0..203b92c264 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -105,7 +105,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     /* speaker */
     pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_set_link(OBJECT(pcspk), "pit", OBJECT(pit), &error_fatal);
-    isa_realize_and_unref(pcspk, isabus, &error_fatal);
+    if (!isa_realize_and_unref(pcspk, isabus, errp)) {
+        return;
+    }
 
     /* 2 82C37 (dma) */
     isa_create_simple(isabus, "i82374");
-- 
2.41.0


