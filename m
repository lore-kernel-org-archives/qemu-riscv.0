Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7255FCDB465
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 10:12:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtPzW-0005o7-1W; Thu, 19 Oct 2023 06:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qtPzN-0005kj-Dm
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 06:10:50 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qtPzL-0007ll-0e
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 06:10:48 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6cd09f51fe0so815566a34.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Oct 2023 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697710245; x=1698315045;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0hRCeRwfxj5e4fBp30kQZNEm7sQqD61LbWIJSIn+lc=;
 b=P3O3uJDIcpxzYF9mWQ7Tajwn6DyA/aGW89osVWH0Q8NtAUWnEI852bpVjddNS/Jje9
 1hVe3UHR9CHJifRTSiya+koaynl0hSILfZM+iVz4zqlnmV/O+gPgyphUy/NvbdB03y5+
 qF5wRdZGyea1KtFYW6/P18gq1n8gMpifUPVdSI61UbQZwLx2TEN+canLeCdAvNInQXs4
 MdOF+FRZ8mBE+2YEUN24HToyGURtSyTWGbY1w674o0Wn1qgg5YWOxaByIGh/RMbcmTqe
 TBeaCB9ZusE5Qp+hVwg2NAjNWdypugBOOr5VhIJIey0tqCAJ4R/d7vQwNuR52QUa13a3
 F/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697710245; x=1698315045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0hRCeRwfxj5e4fBp30kQZNEm7sQqD61LbWIJSIn+lc=;
 b=H2wK/OyrKo3S638R6mTX7yZz5NH9qYhFsFOilg5P6zx2iVj+87AGCENmQBV6Ks8tOQ
 gCX06S5KkSr0tADU2e/T3hlarMiJ6BjNH6VQK3dmzcfiAJ6Sz4ZJqB48DJEd3zNwopWo
 P317j8UDxo3zuzxLO8V75XrrQHhmIhQC+UMaolTZj5SxqFEyL8UGvramaK5kv9CNgi9U
 TkRojz23Yy44Fx0MxkiSCjCUdeT9/EGjWRypAeq04gDf7SMGTEYbGlRAXqDAtQCXHz+/
 HlwifGR9Rquc7KNMIW5j1NiaZ79xzK03mbfOTko89YROxgUZYnhZLuk2BFiF05WOkPVC
 1jMA==
X-Gm-Message-State: AOJu0YzLMxBMrGI2dcOb5CW1oNkMd+Q+iECBKuyxWepxf5cHrIETsm93
 wSNjoMsWMBN0kJmdJcNX9qFwmQ==
X-Google-Smtp-Source: AGHT+IFgAkcHRtr/PTAAy1bhXy74CtpA25XPNe6ctsLfqwMHM4OK4ot0DMsijw7yqzTzH/1PMOQYWQ==
X-Received: by 2002:a05:6830:1093:b0:6c4:897a:31d0 with SMTP id
 y19-20020a056830109300b006c4897a31d0mr1860118oto.24.1697710245457; 
 Thu, 19 Oct 2023 03:10:45 -0700 (PDT)
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with UTF8SMTPSA id
 f4-20020a625104000000b0066a4e561beesm5107199pfb.173.2023.10.19.03.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 03:10:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v5 2/6] hw/riscv: Use misa_mxl instead of misa_mxl_max
Date: Thu, 19 Oct 2023 19:10:24 +0900
Message-ID: <20231019101030.128431-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019101030.128431-1-akihiko.odaki@daynix.com>
References: <20231019101030.128431-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::32c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

The effective MXL value matters when booting.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/riscv/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 52bf8e67de..dad3f6e7b1 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -36,7 +36,7 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
+    return harts->harts[0].env.misa_mxl == MXL_RV32;
 }
 
 /*
-- 
2.42.0


