Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1801C83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:11:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhL8-0007hn-Dw; Thu, 31 Aug 2023 09:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHD-0005AS-GV
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhH5-0006Ca-Ad
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:59:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso620300f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486789; x=1694091589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvarTMVyPJNAN8F64FPOFchFGECSfRITva9tLBVtfvs=;
 b=tCiZhZgxWgVafbd+FaSzuyf1rt70TG/lynt8nDP3x7UnEnDZVrw+OC0e1/C5vmTv0o
 bubLTtjaUmUIBCNstzaVdYZNDjWsQAy3OzStFWsXNPM7GiC0DmeJXTwwCoi7+8Z/I6EE
 C14f+4JblobPW69agfSbg3Hp24a77NT0nTVXtYWlZK9xkQW0EHHr0A8NKgCMsVYECWju
 yR12QRYHFbH/7sjadn17uN0ynMhuDuXTBqN0fI/dfMx2ejyNj1900y0CtjyPdjC+6VNa
 u1pjHShQJRP6mBiB3aLJRJhIavNx3IwEoomQCfn68N90f8kMlCvBqzK2fgWswPejmQxK
 ZDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486789; x=1694091589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvarTMVyPJNAN8F64FPOFchFGECSfRITva9tLBVtfvs=;
 b=Xh1m35Yq3POSjSlVoLfAVsnWYZ/JRiFHB9sRhdedJX3ogm4cUUq/IkDH6Ia/5KcK7+
 qzqyBuURrDxgeLl+UOZajvIMuEKg36pKgv+GEz+k6P4+v0Cpy3WxxaH0eJGf+WgvYgcd
 /bXeRP4pH/CAqXmTqkuPU1fw1MYFbHE3KuJ5YRl16iWqg+CtWWAabBuP0/kQRIBdyuJl
 pvnce4sZ+tN77JQVOI61SMqG+c+jwczMCfwvjmsYYn/+EQcovVjV+jOFoRnwDZ8qA+5W
 Jz9tDCe87z41WZ7pYHQkLwNCsLFyD87zAFOLqVB55rlfAG9IKO1fIk2Dr8wIlXEUTSHX
 r9IA==
X-Gm-Message-State: AOJu0YwO+hAfMceaINOWCHNveBXhZpAEkuaVocXtrAZrkUf62Dhnu5xG
 a/mHl74Ej7GtjBgYttL5m8vCMg==
X-Google-Smtp-Source: AGHT+IGNzAVZUwCrNq8F3piYC42JMowMIVEAnQJ9QCzN7DCDXfmtqAzZI1gGOE19bddFlEhJVQEsAg==
X-Received: by 2002:a05:6000:110a:b0:31a:e87e:103 with SMTP id
 z10-20020a056000110a00b0031ae87e0103mr3499071wrw.48.1693486789792; 
 Thu, 31 Aug 2023 05:59:49 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 x16-20020adfffd0000000b0031c8a43712asm2168289wrs.69.2023.08.31.05.59.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PULL 30/41] hw/sd: spelling fixes
Date: Thu, 31 Aug 2023 14:56:32 +0200
Message-ID: <20230831125646.67855-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

From: Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20230823065335.1919380-18-mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c    | 2 +-
 hw/sd/sdhci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 77a717d355..43c374e829 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1224,7 +1224,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    /* Block read commands (Classs 2) */
+    /* Block read commands (Class 2) */
     case 16:  /* CMD16:  SET_BLOCKLEN */
         switch (sd->state) {
         case sd_transfer_state:
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 362c2c86aa..5564765a9b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1811,7 +1811,7 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
          * on i.MX, but since it is not used by QEMU we do not care.
          *
          * We don't want to call sdhci_write(.., SDHC_TRNMOD, ...)
-         * here becuase it will result in a call to
+         * here because it will result in a call to
          * sdhci_send_command(s) which we don't want.
          *
          */
-- 
2.41.0


