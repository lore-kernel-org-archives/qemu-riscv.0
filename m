Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC02AC47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 16:17:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNxji-0006vt-IV; Thu, 11 Jan 2024 11:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNxjh-0006rS-1m
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 11:16:53 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNxje-0005Ud-Bo
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 11:16:52 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3376ead25e1so3637363f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 08:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704989807; x=1705594607;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sj8Uly2yaGtv9clttu6UtiQnu5whcmgxRjp0hzeYH8Y=;
 b=GRuqkPs7WWprtUmp2cWpZ9HrXokJYoGOqCdWsdFiobFzfLkTB3RhEI1evXp0e7GsQK
 iwI8bNz5mOFqjbh6boGi6FvjahyUlh/1tdXiiEMbREOAuyC0X3SKrTlSG7E+r/miKcXb
 WhodKKXED+vtc6kA0iKm+TUPcOVpRHQAaqJxaxcCe9J8FxCw0FIuK4af1dSY0elEBu7r
 0PEG0rMgbNO2feBZOaaaEOOfdjIKYYio3CtGr6p90QF2YzVeBc4LpTt3tLGdX4vy2leQ
 coKKfhJTnIlloEnM48RqfioJfjxfWLgPyYjOEkErgwxtE0KUYuR1cM8dbMdQxFpL2V6Y
 CzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704989807; x=1705594607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sj8Uly2yaGtv9clttu6UtiQnu5whcmgxRjp0hzeYH8Y=;
 b=PFO0TgvnXhW6q3YXxDO+IqO2akd876WpZw2lHR5rTQnjddOHgD5s+jMhmdD0WbrCl8
 EHFuXcyBlYM5usbF+Zb7pfBeoBhWNO68ZkTbIrql/GQtP8K4EwQZGMMnZ5jYM/v9J0U9
 Pygak2KUx1JNMHNNB6feqLjhNiRKGeWu5ncrmdtaA2QUlDP9jsgkCBdzNgTkeGWn6cYw
 MILsIEaHwL8DH8E6J3VJCkCgZyHha2in+qWXpB8awP6IYinyjn13VaCFYewf2i9APYJz
 WHJExW2rZyrSzDIrL2sRY1txrtC5INmQBQ7CT1ijISJyVH04TWQmYns+UwAlJEyEM//w
 FFTw==
X-Gm-Message-State: AOJu0YzNZO2eJWO5ZkOGI1bloyeXWa9AHH5Mx4X+oJKsCIY0D2k4ziUq
 2QpdqvP+RjjXyL4Bb/esaDYtWFT6SOC0xQ==
X-Google-Smtp-Source: AGHT+IHL1fTFW6+euR8/zNGEHo7MgvekyyPlDIJWqgWjZUgtbXGrx91RVkQsHKLxN3D0f5hF7lEASQ==
X-Received: by 2002:a5d:550b:0:b0:336:6143:b14c with SMTP id
 b11-20020a5d550b000000b003366143b14cmr744604wrv.33.1704989807412; 
 Thu, 11 Jan 2024 08:16:47 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b0033642a9a1eesm1553183wrs.21.2024.01.11.08.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 08:16:47 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 0/2] target/riscv: Add support for 'B' extension
Date: Thu, 11 Jan 2024 16:16:42 +0000
Message-ID: <20240111161644.33630-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Add support for the new (fast track) 'B' extension [1] this extension
uses the misa.B bit to indicate that the Zba, Zbb and Zbs extensions are
present.

Since this extension is not yet frozen it is exposed via the 'x-b' cpu
option. The validation logic is based on the new approach taken for the
'G' extension.

The specification handles backward compatability: The misa.B bit may be
set if Zba, Zbb and Zbs are present but in order to not break existing
systems the bit is not required to be set if they are present. As such
even though Zba, Zbb and Zbs default to on in QEMU this extension is not
enabled by default in any cpu.

Cheers,

Rob

[1] - https://github.com/riscv/riscv-b

Changes since V1:
- Rebased on master after latest riscv updates
- All patches have R-B tags
- Array formatting fix to make future diffs clean (Daniel)
- Dropped enabling for max CPU variant as misa.B is reserved until
  spec is at least frozen (Daniel & Drew)

Rob Bradford (2):
  target/riscv: Add infrastructure for 'B' MISA extension
  target/riscv: Add step to validate 'B' extension

 target/riscv/cpu.c         |  5 +++--
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 2 deletions(-)

-- 
2.43.0


