Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26007C54764
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcLsa-0000SG-V3; Tue, 20 Feb 2024 03:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsX-0000Ma-A7
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 03:53:29 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsU-0008EC-32
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 03:53:29 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-512a65cd2c7so3257150e87.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 00:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419204; x=1709024004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvdV9IUyScfXO/aRp9jIGXOMeWvG9ot2GraQaMTkQfY=;
 b=dzV2vMc+QOtvV4BfBPrvWTL0rxE2c/3icEwOm4Eb3FH6vRY8mHK7xCWxbPr9GP3+iL
 L2YfUb1SmyEiHeE9Ow7NznSHyAW9pBrVIakFC3riGnWz4n2xwKKX6ojhPx3FNut7zh3M
 Dfrf1hMejt8KL+yR4erlSq/vjeWw+zGDerrAaSyfiIKA4rs7fQit4RjYxzuT6BQzM90l
 ku/04+CzZMRPw2gcLQR1f+/EiRZR9Vnxh5/Fy2Wg8LfqFGGdmsGLWE/6vdwD1+gA0zxL
 k/eX2V4hUANz2nlM0KRtZVcVPmQbUsMPLlcIRD/L2Z3HCppa/FwaNxGYO0LF2a5tM7D/
 aaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419204; x=1709024004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MvdV9IUyScfXO/aRp9jIGXOMeWvG9ot2GraQaMTkQfY=;
 b=GNjgwF3mFXD/KoiSybpzaOLKmwa17rTdlJRP8eoMeUGAQ2kJw0+HfilCpf9ME4KTvI
 wWOlMdp3rse8FmDgojTJk3QlJcrGxxs/jibAwEqFWqWHva5fJbKCmAnYDePy66ruDQQy
 +dPQuhcKu3nJJkn1UgErJ47yW8/jrWLqQQ9lKeOJPNfo4FrzxAI/aul1chVn375pAYgA
 XzPbskroh4AqWuMCIgnUO/A9tO8bJpH1lTKGts4UHOdiVv05cSmLKpvLx8O1oqMOXibX
 FrNuxrhO+AFyrHm0JLDBHtqvFM+KW+10fpTW7BXMptjTWSLT2d9CnayEedmiJloMeXRs
 jUZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBv/jOqSGKQOZLfpBYUNZ930hZUKWM1abfB9XlkDJvtDQoCXmPM1u4JYPPgm9t5tvuUYXZ+IGpEh/4g8lo/+WhU56vmn0=
X-Gm-Message-State: AOJu0YykyrMBD/KqJJCm9P0ox15mhCVzdFBQOcbNwSDDG19RyaAVGSwh
 dPSJ7zLxEXvgMz3OfzPctWbviE/IB1gOyCEfLk2E/nzM5upx+KL4FX1MeH2wsaA=
X-Google-Smtp-Source: AGHT+IEbySSjHls8NAbeQTB2ZfhggNPAIhoEucwffA6V5Q2r6kGdNic7nNDc9SWPtQ5Y0X9uH6FaMg==
X-Received: by 2002:ac2:5dee:0:b0:512:a987:13ee with SMTP id
 z14-20020ac25dee000000b00512a98713eemr4549873lfq.50.1708419204300; 
 Tue, 20 Feb 2024 00:53:24 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:24 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v1 13/21] hw/riscv/virt.h: correct typos
Date: Tue, 20 Feb 2024 10:52:20 +0200
Message-Id: <c391076e9958561b3294ba922e69e38d36b8a9b5.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lf1-x12f.google.com
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

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 include/hw/riscv/virt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index f89790fd58..3db839160f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -144,13 +144,13 @@ uint32_t imsic_num_bits(uint32_t count);
 #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
 #if VIRT_IMSIC_GROUP_MAX_SIZE < \
     IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
-#error "Can't accomodate single IMSIC group in address space"
+#error "Can't accommodate single IMSIC group in address space"
 #endif
 
 #define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
                                         VIRT_IMSIC_GROUP_MAX_SIZE)
 #if 0x4000000 < VIRT_IMSIC_MAX_SIZE
-#error "Can't accomodate all IMSIC groups in address space"
+#error "Can't accommodate all IMSIC groups in address space"
 #endif
 
 #endif
-- 
γαῖα πυρί μιχθήτω


