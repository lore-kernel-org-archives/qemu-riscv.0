Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98174C47079
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:20:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNFkv-0001uo-Ag; Tue, 09 Jan 2024 12:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNFks-0001sH-UJ
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 12:19:10 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNFkq-0004wU-5p
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 12:19:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e4f71288bso9209035e9.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 09:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704820746; x=1705425546;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TbCumLLjYRCuAyIHcutRJ3p/VueAcKdHkiZb64FNRoo=;
 b=C+0ih+TXKmnygJgMLBAILDXrJg0UsnOIDtzONtEvE5h5B70Bx8NgNf8lVHPUOWk2eO
 KEC72NOVB2jqbQD+i16VyVBsH7ESl6l9CLECc2s/6PIefrDWBJprRZNTmpFPRL2oEvEy
 1cbPMoxbEtx0WqXyTY8vUzgM7JePDCVl2Y1+lDgzE9a0QuUUpmO+1VQjPJFTTEe3Uq3w
 Wn50jKGErBcWc8VP5pihEfZOqJNnMUHPUDyIwhmO0GoXPZ8mZ3ookkSXIWGhJxuNWpSq
 Kd+GfmK6IbmgvBbUeer0ZY1X8Or4TzZOdpocM8tu6+9GCvwlHg1jQwHlt/beskIohPB6
 UDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704820746; x=1705425546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbCumLLjYRCuAyIHcutRJ3p/VueAcKdHkiZb64FNRoo=;
 b=f6W0Bijaf0/k7S8/tk/p6nn4o28lcfwEduPsp28QmAIMDJLS6C9slzT53JxBkxE4kY
 0LWdn4asrPvK7vDiaF3m1y2ScmSgen60OKL2i7LnP5stNdMY2FzM9NIJz8O5WX4vIvq/
 B7uu98wXRaYXlCsJKM8fJ9mKJgkd15AZp2c37X2xELnLZmO1AGBWw5lD5INskUThKq8P
 w6g9TWooSfdN1UQw5DSvymk78eyX/RUU8Epk4LejEJBNzu+zIaoebUnHPwBuJmimcs05
 6l9s+8HFbgLV+9QHa094U1eXRe1Odv5/Pqi6Iu9ICS6YLGODh8pvYz+25Br3FWYqKsJw
 JKiA==
X-Gm-Message-State: AOJu0Yyz6uKXB8uaLeYCAu64mod6PTdWOfWTCeEdN3ug+JnjtsTuCaNq
 ZY3PB9A97uoC2olb1c2C3EcRevBaC53MCVSFJqnrnDBB4fWHYg==
X-Google-Smtp-Source: AGHT+IEE5T8PHcP2iom7puaFp2dzwp6v3Dz5FC3IYTUUgGSDAQqhq1fyNvRx403NSIpulg4HkOkiLA==
X-Received: by 2002:a7b:c38f:0:b0:40e:4e65:a6e0 with SMTP id
 s15-20020a7bc38f000000b0040e4e65a6e0mr496441wmj.5.1704820745891; 
 Tue, 09 Jan 2024 09:19:05 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 bg30-20020a05600c3c9e00b0040d62f89381sm4350308wmb.35.2024.01.09.09.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:19:05 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 0/3] target/riscv: Add support for 'B' extension
Date: Tue,  9 Jan 2024 17:07:34 +0000
Message-ID: <20240109171848.32237-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add support for the new (fast track) 'B' extension [1] this extension
uses the misa.B bit to indicate that the Zba, Zbb and Zbs extensions are
present.

Since this extension is not yet frozen it is exposed via the 'x-b' cpu
option. The validation logic is based on the new approach taken for the
'G' extension. [2]

The specification handles backward compatability: The misa.B bit may be
set if Zba, Zbb and Zbs are present but in order to not break existing
systems the bit is not required to be set if they are present. As such
even though Zba, Zbb and Zbs default to on in QEMU this extension is not
enabled by default in any cpu other than the 'max' variant.

Cheers,

Rob

[1] - https://github.com/riscv/riscv-b
[2] - https://patchew.org/QEMU/20231218125334.37184-1-dbarboza@ventanamicro.com/20231218125334.37184-16-dbarboza@ventanamicro.com/

Rob Bradford (3):
  target/riscv: Add infrastructure for 'B' MISA extension
  target/riscv: Add step to validate 'B' extension
  target/riscv: Enable 'B' extension on max CPU type

 target/riscv/cpu.c         |  5 +++--
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 37 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 40 insertions(+), 3 deletions(-)

-- 
2.43.0


