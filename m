Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D842C87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 14:59:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiweP-0001zD-7O; Mon, 04 Aug 2025 10:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKU-0008LR-7l
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKS-0008SQ-36
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so30699235e9.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314454; x=1754919254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZbjtSmF6ZWjfUQZTrYLzt0ZYaYEB6I6pvnD2hn9dPM=;
 b=MRPskb8LicaE6cL0lIv0UNrfFQYLmsFJCDiGGg0YXo1iL+RpVbODEvbQ7TuJiCFOmh
 CqujHMyxEtoaM+DcHeiHTrfSdQbjW9BoufZjlyTutGpZa5bEXnCaAvybpeTRhisyS5mA
 SmgapqVe0+d3H0Nmusr9OiaAGlu4Zt481lkkvWT3+PTyPhM4IW2/QLk77AUvGTydtfyi
 4EtZ/mJNFlXeFssY/mdXE+1kVawMSn9u8DSgo0c7kuP7aIXiVxDo08mnbrP/yaQNVJK3
 3hI2BwDrVf6xrMl0xruqrUmw6uqVLTxW3Pul2vR3VeLDwcMPlG7a4L2mC8IhpYxf1FfO
 M/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314454; x=1754919254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZbjtSmF6ZWjfUQZTrYLzt0ZYaYEB6I6pvnD2hn9dPM=;
 b=aMKJx6ddQwzKul9SUIUVItxROPorUIVoBw6A5Pay9U0hcIj1fDkkeIqeAZUZesQsln
 8neL9IegStrdIYpb8AC/Nuu6yoVS+x1mMhPZD2si+j8PB7QKZ51q92XIW3P7Q0rH8h6B
 RK4Jx3KAzBB2RX6VlzcNGpxcbf4x1cw0aaamo7yLdrLcAZdys++Gz+Bh+Xr4R+BWz5Ho
 1ebWD5hyYERERlYj4Ru4UTOr1svoCAGc2ITHC1DQ2wobWL4UoVtFsJmWRfs4XZTNnc0w
 jjlTaFPggqvsREn91U/yTnsZSGr34HUMnB7SoycWA0H5a84KAzANsET5cAUUBRWlwq/8
 REBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUur7CFIGWR2h822OsXLX0t1wKib935JX3M1338dOm0DA39V9Zp/XxPyHT9t6jGy8cgLUdSa92hf64g@nongnu.org
X-Gm-Message-State: AOJu0YzaNjRs5xiGhu1srXPNHITXrflWZ/q5HeQZx13TXYh4sEMAvPaA
 7JultiyZAAIv0iJp6MpqdbE8YSP+3cxIb0En1YBWA75qcdPa191H18y9cw5lS+74Nxw=
X-Gm-Gg: ASbGncvIFvN77aVbld4Laj5ymgSvSR2NU+Am0AKKArTflAd4nd5jTe4CvmDfz4xCU/R
 qQeh7IWrllI+jDP6glNcWv95zQ7pUJ3AiDM3RaWqPAJw9HoQoBTiLbm5oCgC5bxrrLKEGp7hDRx
 OZDjrgLbZc/hbyQNvuf+A3aj7chmZy9/7nH57eBWkSsxxTaifkfhoAsJ2Fp6KrHinn7VMYzXdrI
 CSpb9S36NESmDE1bRKTOrqxG0CKVXgF/upqHQVEBouyGAVYr1zZN1mebZJTRiOdE/LDP0sfihU2
 B23Ed+KSZdtaPK+VyeXv+TOFqOCYUUYijw9dleX96bz4PD9XRb3GUa0i2A3m8hlBcprYDK/7dz9
 igZaUOhOfN9qIlQknZcjV8zMGehCKwsdAP+xFbVSGpizdz577pcjgkRolOJTvZAwLWufwoY9M
X-Google-Smtp-Source: AGHT+IF+XPF0EQE1z5obvK+ihX+21dvbso16ncrGbbEJzbYnMubDcip1F8zCBGsJO05x1208PyG4tA==
X-Received: by 2002:a05:600c:4997:b0:456:fc1:c26d with SMTP id
 5b1f17b1804b1-458b7d12c2amr55818465e9.2.1754314453701; 
 Mon, 04 Aug 2025 06:34:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b866392csm61858595e9.2.2025.08.04.06.34.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-10.1 v2 01/11] hw/sd/sdcard: Do not ignore errors in
 sd_cmd_to_sendingdata()
Date: Mon,  4 Aug 2025 15:33:55 +0200
Message-ID: <20250804133406.17456-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
References: <20250804133406.17456-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Unfortunately when adding sd_cmd_to_sendingdata() in commit
f486bf7d109 we neglected to return any possible error. Fix.

Fixes: f486bf7d109 ("hw/sd/sdcard: Introduce sd_cmd_to_sendingdata and sd_generic_read_byte")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index c275fdda2d0..0bb385268ed 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1305,7 +1305,7 @@ static sd_rsp_type_t sd_cmd_to_sendingdata(SDState *sd, SDRequest req,
                                            const void *data, size_t size)
 {
     if (sd->state != sd_transfer_state) {
-        sd_invalid_state_for_cmd(sd, req);
+        return sd_invalid_state_for_cmd(sd, req);
     }
 
     sd->state = sd_sendingdata_state;
-- 
2.49.0


