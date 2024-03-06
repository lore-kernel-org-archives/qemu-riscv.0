Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A2C5475B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 17:09:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhulr-0006NT-IH; Wed, 06 Mar 2024 12:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rhulc-0006Jw-6M
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:09:23 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rhula-0004D3-M9
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:09:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1dd1d9daf02so23465955ad.1
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1709744956; x=1710349756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5jiD4ngO6RXGlAuwMlJfzGW+Jl5alSTBUPN7JW336io=;
 b=ba4BxUqHvkfyzWn3aiylDMzqnyX68GuEPCM0JycfeFXPFm1PA+vd4m+f9ERMiYSzhG
 GCnpe6twyUUt35h1sQx3RSeQfDp7wq9M6EbhxX15N6q2mc1Ae/kp2Vf57sQALZRlsH4/
 +jBFVZahJthjMgszkTbRkLzMM7odf150A06W3VlO3kzEDaGmcdmNa6EMB4cJb+fswBwe
 Ji2DdFdHiIUSHAva9HHmxDd8FS2Ysi22/pjXF+qlIWKno7tZrx5DQdVWe1TFOsR0nWBR
 Y479p30nAKLlJtV9RhDMW09DofuYmApqd+w0o/QxS/d2b1+q9LVNmMxuzsMhrugvQei+
 /9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709744956; x=1710349756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5jiD4ngO6RXGlAuwMlJfzGW+Jl5alSTBUPN7JW336io=;
 b=SGG4dM0xANHxi3eL7clU6rK+zTX1rKGmHnYrCb4qkJ59elkvWeLrfnNxQCJx924wDX
 JHFaGsqfPDnStyB1JY1qUNslj8OwmA82kMeDrMRG4M2iGNDx/5J6mSFOv9lgS2XMstqf
 2xNlroSrDSroHONpVmRWCDjwQDJR5FrZK92ck2+3Ec+keXG2VoVpTf0j4rnM8StPu2+t
 urGFslKGdzGCGF8oRh0TWhuSGlOM3xHJ+Rkt+8AleVywcp2fknJ0tQbc+kfhWDtzaSMK
 7K8wFjM6K8jiJqYqeTXXpZJlkvJB9pgsETD2ITOv9xnBnyDoG5tJMAIwaaxko+votm5L
 akEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTohJo4XL6b3IHxOKfle/T3VLSbn9thnKHKlwUtevv/das/xEaCRX8wiEd6mEufFPUzO+qqHDJYuPd7XaTYCdh8Vn4GjY=
X-Gm-Message-State: AOJu0YyAGNc+Ki8dSv1RkbNkCjt/18Q5KDr+rurKdcJkYkh0392qBJPV
 /30aT4bPn6z4uj5Ka5LMLXcxFrjzGV2pFvQIKhQ7dybJPp4gQtThRYZVUnhgzKc=
X-Google-Smtp-Source: AGHT+IEjeWFk+0aA0rZ/kWury4JfLVFI1pkLzpV/7Nl8aiYEBgafztfRDjMDpwN7eg0hPsQDRYWXUQ==
X-Received: by 2002:a17:902:d508:b0:1dc:f91b:5e96 with SMTP id
 b8-20020a170902d50800b001dcf91b5e96mr7080893plg.59.1709744955884; 
 Wed, 06 Mar 2024 09:09:15 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a170902e74800b001dd091cbc4esm7230076plf.181.2024.03.06.09.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:09:15 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 0/5] target/riscv: Support Zve32x and Zve64x extensions
Date: Thu,  7 Mar 2024 01:08:33 +0800
Message-ID: <20240306170855.24341-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x630.google.com
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

This patch series adds the support for Zve32x and Zvx64x and makes vector
registers visible in GDB if any of the V/Zve*/Zvk* extensions is enabled.

Jason Chien (5):
  target/riscv: Add support for Zve32x extension
  target/riscv: Expose Zve32x extension to users
  target/riscv: Add support for Zve64x extension
  target/riscv: Expose Zve64x extension to users
  target/riscv: Relax vector register check in RISCV gdbstub

 target/riscv/cpu.c                      |  4 +++
 target/riscv/cpu_cfg.h                  |  2 ++
 target/riscv/cpu_helper.c               |  2 +-
 target/riscv/csr.c                      |  2 +-
 target/riscv/gdbstub.c                  |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  4 +--
 target/riscv/tcg/tcg-cpu.c              | 33 ++++++++++++++-----------
 7 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.43.2


