Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7FAD18153
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 22:02:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0T8j-0003jd-RJ; Mon, 14 Oct 2024 18:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1t0T8g-0003iR-LH
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 18:02:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1t0T8c-0006Tx-79
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 18:02:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so3522525f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1728943317; x=1729548117; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KX+TeoqTj4F6vMuRUJ01fObu2ASRAunxY4faVD0HXGE=;
 b=FWhuySjf1KyrXiHnmKHiSgKm9pil1IACunbmP7BrsRQU79Fl1rmeWbCDiu3T57mXZ9
 R9mbjyIoSTKWl3m4Xfqdn803jhpeCHGHbAOdSt5loYm5jv1sk/rXjdfMmtS7vawV+nxm
 XlG6dhc33ZpDTOkp8o8EH9dmRTAzK7qpQ/6x4imuF3eviWBzBnam8ncFdPHofW7+NEi/
 OHLfgeDLHZLcNTCLxuwN+rzJdqo5icF7N/gQdODzNDtDfMRdr1ENI1ojqN74VFg5GB9R
 LUwMCEaiT0+IuXE+11v5MSYwHkdknV/cMjwZQXpVmUMtjWkruNI+l4Edk7iARETHRvwi
 BWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728943317; x=1729548117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KX+TeoqTj4F6vMuRUJ01fObu2ASRAunxY4faVD0HXGE=;
 b=mi/XO4adeWlwbeStMmKuNAV1/mHcyj0/K2+fKnU5S3+tcfAbDpUZtePum0lLDwUxTS
 7tzrYIcD+SxzbggFkF5jYkDiyi/kynmkmOs8qnyOjguYe+Ors6MInLDnVzI05cDU6MXP
 bkyTbi5Y6wULs329+jQNw40MolmLOHD7xmG280TxqeP/5jySy2bvIGtySC1sideT8MJA
 X596jJrJFpliby0ojrlNxj3xO3GN2xdBksaAmP0qtKaMry49Gk42Hx+r7raiRjiKI8CM
 zj9HFQafgYEHZbO0aqwAfvE+1OER7GaWv/faiuXoDMJZRytWk5msWkKbWS8q/w52HKqx
 NCTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9RdTGdATvB9CDfuYH/q8k2lojeRVVNIERUD8i0SZ7bE5Ch75U4Tl4GM1gIS75Adbth5Y6nIOPebnK@nongnu.org
X-Gm-Message-State: AOJu0Yzvcxv2PZY1iwxDyYdyaV15qs4lmE25aiy0JjBN1WZmMBj9l2Mw
 ga0hIKFXbqkjf7HzjYuALAP3mZXkKrVzBPP14nMbeICUqHaJBDiUlOYjRcTE/E8=
X-Google-Smtp-Source: AGHT+IHHZV2QbkNq/QkxO3XXo5PgdlgpYtNOTqcP7Ua7C5fuji3kloWUhah7lBlNFYA2WKwy2JTU3Q==
X-Received: by 2002:a5d:530a:0:b0:37d:377d:c7b0 with SMTP id
 ffacd0b85a97d-37d5519d618mr9325291f8f.18.1728943316554; 
 Mon, 14 Oct 2024 15:01:56 -0700 (PDT)
Received: from paolo-laptop-amd.. ([2a0e:cb01:d3:f100:8971:afed:16dc:a06f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa7a09dsm22769f8f.23.2024.10.14.15.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 15:01:55 -0700 (PDT)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
Subject: [RFC v3 0/2] target/riscv: add endianness checks and atomicity
 guarantees.
Date: Mon, 14 Oct 2024 23:01:51 +0100
Message-ID: <20241014220153.196183-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wr1-x429.google.com
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

This version 3 of the patch adds endianness safety to both the optimizations
brought by the patch set.
It also adds some conditions that allow the __builtin_memcpy to be executed
on chunks of 16 bytes with guarantee of atomicity.

Changes from V2:
- patch 1:
  - add condition for the host not to be big endian.
- patch 2:
  - add condition for the host not to be big endian.
  - add condition for the host to support 16-byte atomic memory operations.
  - limit the large loads and stores to 16 byte chunks in order to guarantee
    atomicity on a larger range of processors.

Cc: Richard Handerson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Nathan Egge <negge@google.com>
Cc: Max Chou <max.chou@sifive.com>

Helene CHELIN (1):
  target/riscv: rvv: reduce the overhead for simple RISC-V vector
    unit-stride loads and stores

Paolo Savini (1):
  target/riscv: rvv: improve performance of RISC-V vector loads and
    stores on large amounts of data.

 target/riscv/vector_helper.c | 61 +++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

-- 
2.34.1

