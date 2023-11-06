Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394CC4167D
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:16:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxOh-0005vk-53; Mon, 06 Nov 2023 06:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxOf-0005t8-TW
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:03:57 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxOd-0003eY-7P
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:03:57 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so5576568e87.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268633; x=1699873433; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9nIh4jZ3rUpsBw4LSZSNiaZI1TuJJRNoEVBCo+5kN8=;
 b=EZIH/H0s97wWfUIPaXzcEEcqaaarDAJnoo8Gmvjoh4RpMpoL/YsHjrB0FprkKHYsxo
 uvcRgZ3prKQfXDsgFP6FOZ2UbCYtEc1k7XDlTVWW4X5FklABIMVb/oxLCJ9PsJcqrq5o
 Y+Wf5+4/QU/p7HXwdt9nmb3rL+q6mEkUNgtKtWXLiKVXCNo4QmV0UZG7dp7T5kbzJwzO
 z43nCYy7pgl9ss7FlhThUVeDW4IQOJVenHG28F72E886aNqOujy+wZCMTkjLpbp6Nd6Z
 auUeMhVAK4h14BrCY1Opnz+MQEH2xd6igDmeMGvUa4oJy07jbYIlxcQgjLm3L/xyY4uQ
 Ul+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268633; x=1699873433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9nIh4jZ3rUpsBw4LSZSNiaZI1TuJJRNoEVBCo+5kN8=;
 b=wLsGuR5ST1IZqYrPput/HFOlwdQ5xiHoMx9ws7WdrA/LtwmT0mOAF9SV54PEvXtLji
 9F5MpkmV0sGuybqJLmewnrwyBzoE20EkhZEANrf9r9ufuhcUpL2wIQe+YxhRdrb1FTeS
 iy1MJT9pz3zIkawuIPQ0/dd9qxd7KEh367Ozzmq0KUHdhNevC7ygzzeuUYKWGN6O3qUD
 U5b1fN/rIDOotPtGC1Y1RwaWZ10k1Txr0JjPoMuMiAtrX3Mhg8vIMg0TCGp/Roy0quY8
 v6mpgLKjTzPQTxreGTh8EFDjbeU8kuGiF3vH3cOuS2xxXHP/D3zIRfwxRlOrHMQ3LATm
 +Bbw==
X-Gm-Message-State: AOJu0YzbBNm0x+GsGKrz8m6Y0695ILz4a0kVNps2ILcwg1axXR41g1Ch
 +kEkSVgWKL7Yhf/wpSZMWc9DEA==
X-Google-Smtp-Source: AGHT+IExKZ0rki8Pzt9Fq9bSXa3p5OpCW6d2acd5GD6zgVvNcXpLdpP4uLK9kjEGGioQ4HTvFd820g==
X-Received: by 2002:ac2:51b0:0:b0:500:b7ed:105a with SMTP id
 f16-20020ac251b0000000b00500b7ed105amr19847445lfk.29.1699268633369; 
 Mon, 06 Nov 2023 03:03:53 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 p12-20020adfce0c000000b0032dc1fc84f2sm9188671wrn.46.2023.11.06.03.03.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:03:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 02/60] vl: constify default_list
Date: Mon,  6 Nov 2023 12:02:34 +0100
Message-ID: <20231106110336.358-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's not modified, let's make it const.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231030101529.105266-1-marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/vl.c b/system/vl.c
index ff76eb0d07..8c803228f4 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -194,7 +194,7 @@ static int default_sdcard = 1;
 static int default_vga = 1;
 static int default_net = 1;
 
-static struct {
+static const struct {
     const char *driver;
     int *flag;
 } default_list[] = {
-- 
2.41.0


