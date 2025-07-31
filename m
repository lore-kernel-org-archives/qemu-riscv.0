Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA61C87FD3
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 21:41:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhb17-0003yc-2Z; Thu, 31 Jul 2025 17:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhap1-0008Lb-3s
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 17:28:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhaoz-0007qt-Cg
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 17:28:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4561514c7f0so8576305e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997296; x=1754602096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qedAVdAy4wYrPU2niKvQAW4tfkXTo6OF8J8DtoUxWSM=;
 b=kXBqqbZLW6Q0uyNdFS1a0awYQ+EF039G44WW1cDKB4teXwXwiF0gjmFJkhmVfYy+8w
 k0n4aLBSkfZwXjcnLzgOjGuMFq57degdQKQ0JtQOP0nnfW/QP7KtD9yC1xhDrUzVFSfW
 Z36zCuqLjSIxBznNnFiLO+duMNg0Hai/IKbh2VnfRU00kKmPNHlxEb4TwnlTuxisU1Ll
 K5eBHh0H2zjNoom/eA7P1WgrWhE2vqYSrCyCB7++F0ivrN3TWqLAOUPwL/U2VXOzSBco
 +umPPC4BM1w5d1PdQkcNqp4m3SngyvaHp2SlSU+pFL7fPTpuLJdgpzc1BJ9jlmpOBFsg
 xm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997296; x=1754602096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qedAVdAy4wYrPU2niKvQAW4tfkXTo6OF8J8DtoUxWSM=;
 b=pKa38an2qpi+yU9AGxEC4yyjjUZqPz5ZIzXTHIc+BAd83mUulxP2XFQ0rdGcFpgCf+
 Ptv+LTAtxTe0PNbdMoSHXMptAIgc2zqRKC+vJIn+1FSNNILT08m4u44YXyaWo+Kh/v1o
 F7sPKovjDHCCaDsF1z3HutSxyz0665Q6bPJ9ylIv6Oh7/wuRGrLMYiDZg6PPKbZSqx8S
 FBuroO5hLtAzrx+g0XKQrLt4lZIpmNYz4T38HCe1i2+QhUXl/qBBjbTGb9fIe/dEFVKJ
 eSePEFcpwXfIcE9uFyvOB0X2KxKRCG2BXAl+boRn7p9oVwUFXq+sZ2C1vVGgWk8OpQPr
 +auw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpYpYBPlgXJCU4WAoAXyIejRWjU8+QsY13wtZYE8u/ptwirpMSkAn/RJwLkUfzQgTAah4WvpSpwvVi@nongnu.org
X-Gm-Message-State: AOJu0YznpAl9zYETB92095gAjIGxs/QdfwebGE4UwGmZkwFEQW9PBPC9
 b5slChYVRHi5cUJHzmAmby2XLu5Yuv7tZSz9TePeyfbC9s5AnNAjKhzGFDDBboyo6dw=
X-Gm-Gg: ASbGncs2YlQzj/dGwKO7uRcqzG/ymjWl89bbB6uw4dHPLFkMT5KelEWB34FmeoXmYdP
 G7BPgjFPy8x/Yu4oly7OTNuNOsmyjwBgZ5XBxi3YTYIj/F3py8QBXsBGJ6dzlpWw0kTBSARqMr5
 8xqB1+L0LalGb+YMh4FXv9/OdXs5TQWae8wlpFNIX0OLxNs+t/B2bhLNu5SR6oOmOjjoCPKH5b1
 ogInjl7+94jsdEHA76qPFgIC0LkGztecNOUQTD1I+H/5OvkS/nu//7jfRLLIaDu/VO1xR2XRbUg
 4y8nCrhySMnkz3BrsfxO1cL3vMVZ/2Ki1Di5jOrUjSwmrQWalNiPcz5h72Ov0uvT0wkQNP86DVl
 S4KT/nRrQY35hnBMJlkJSSAe0Js0rLPZmwUekNYTaX9gnGI6FODNn5aQlP79gPxRVYO2niabT
X-Google-Smtp-Source: AGHT+IE7z98gzTCyEm3pvvEnpklU4sCrjTtja0bigZalzyJeNMHz9rT41IVPXNqSfCpurR0y7TWrsQ==
X-Received: by 2002:a05:6000:220d:b0:3b7:9b58:5b53 with SMTP id
 ffacd0b85a97d-3b8d349a9f3mr202932f8f.45.1753997295728; 
 Thu, 31 Jul 2025 14:28:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c467994sm3568218f8f.50.2025.07.31.14.28.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liwei1518@gmail.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 01/11] hw/sd/sdcard: Do not ignore errors in
 sd_cmd_to_sendingdata()
Date: Thu, 31 Jul 2025 23:27:56 +0200
Message-ID: <20250731212807.2706-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


