Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E775AD11101
	for <qemu-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 15:09:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t7c6s-0000XP-UN; Sun, 03 Nov 2024 10:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6F-0008Kv-EB
 for qemu-riscv@nongnu.org; Sun, 03 Nov 2024 10:01:08 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c69-0006XU-Pw
 for qemu-riscv@nongnu.org; Sun, 03 Nov 2024 10:01:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a99fa009adcso232359966b.0
 for <qemu-riscv@nongnu.org>; Sun, 03 Nov 2024 07:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730646058; x=1731250858;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35ml+LQzgDz+d7Jvf+nOL9CBpkJtC3faqN+iRSaqfrI=;
 b=D0YxtMEgLAJlr8Oy0cE62y+Oq+Hb8qO3hRweeJ77QmHg5oihSpKVe6PSmUcuhvTmGl
 KegAjswZ31dVP+vTqEeSVr5Pu6NGObOfOilJg/bBlisdS2OOLPrfftVgig6zX2025bMm
 zfpA09k6mbYU+kcmNM8P3dw83yXu2uvMxF+xRtVIQ/AhgNjH3qHGLkEwQgV5ocRnZYtQ
 0CN3TvPx7o2xBrP1cxUQfzqYlTuK2M6Axvbdi8v2cBdUHzEqNod3PIZpI29Bf5r5PoxO
 9TOyr/gtcReJ/Qt6AhNTmnMgMKSDlPe0yeuqPC0/3Bqbc4FFSErFtbaY2CHKFG3WbLXF
 KhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730646058; x=1731250858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35ml+LQzgDz+d7Jvf+nOL9CBpkJtC3faqN+iRSaqfrI=;
 b=ic26GrtLnylE3IkfmkfpVvNiMLgp7sUnQO/nTWofEQo/nYbtayBB6RMFP39paf6jes
 Flr2lfUM3LDBgqP+dEjyfqS5quy0cvHGYEFru1Nnh/f/MHCKdvL09zAQ5YcloaoGMeDU
 A/QJbteFPVBRj0eqlr4/aEv+oWQ/ZmISVDOGSvpekT9orBKwDIIWpT3iu29AXvWMqQiK
 vE0xmzLFVKVLiLa56rUMz7oY6hSBrVhojPq+/LKSUQv0lAsbONBuJzFML+1Cc5zOTz/M
 KXo8BLJH5VdsZTXRCwdoqvskZRglECvMEXcBzrHV/KAztKMf9KAkLbzMaG3V5JwfWUSS
 gdyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXknIf8VazOIiy2Rn6a4deaw8n1broHBmiPkZWwwE/qkkyHkj9l76lCOMGOzjFwZhEjgiuM61mVaxD5@nongnu.org
X-Gm-Message-State: AOJu0YykbU4tQ0UFdN6txK7B6XB0ZxLmiN8QaYwPO68jyLq4ug72KPuk
 E/oc1FtfxzaHlpHF7g9ZVbUg8bMwpKfBk9e8d+nKQzeuxugsBWKG0krysvOmgQ==
X-Google-Smtp-Source: AGHT+IHbv0WpIIfwfwDwE8MhnZ/kdm9934FavYLzRdGpj2v5Z15tKaaE+8IR4ebaxUpxzvlB1GCYkA==
X-Received: by 2002:a05:6402:1d88:b0:5ce:af08:a2cd with SMTP id
 4fb4d7f45d1cf-5ceb9384a91mr9605608a12.33.1730646058315; 
 Sun, 03 Nov 2024 07:00:58 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5664350esm431536666b.159.2024.11.03.07.00.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 03 Nov 2024 07:00:57 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Sun,  3 Nov 2024 16:00:27 +0100
Message-Id: <20241103150037.48194-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241103150037.48194-1-phil@philjordan.eu>
References: <20241103150037.48194-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::635;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e88b5738cb..fa8b8e858f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -505,6 +505,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -512,6 +513,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2587,6 +2589,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.3 (Apple Git-145)


