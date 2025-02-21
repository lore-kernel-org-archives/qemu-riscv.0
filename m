Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEC8C021B3
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:53:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlVLG-0004fE-Ar; Fri, 21 Feb 2025 10:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tlVLD-0004eX-H3
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 10:53:27 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tlVLB-0004F2-MP
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 10:53:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe84so816145f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 07:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1740153203; x=1740758003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B3PN5npkU2fZGy+04m+tjR9ps6/ogxxXtP2BCPt3H5c=;
 b=cFzQRRi4N+eVrQ7W2LmelQh5uJmtjYhArB/vc1EIoCAyowIa2FMQ3WcHlMyTgQPrrN
 9xSAgdJojeJfyJIO6TdYIOXK9L3PCZRsNMAE2k1EX1sz1CxorNPzU8Pl9ui8ubjv9JAF
 5mtxs0WLyO2ycnbgVQ6G5FnIxwiRxx9CL/Fj1uBvXq+GwvT03QzD1NfQ7+16XnBIrStP
 v+6BaezCzXeUTD0eeSpJHZxUODQwKjVwNRjnsob2DV3dBBf+Of4+jTWz6Q0chb2cNjZz
 HVE5YYN6aTpO2PvEyAZUrpGOvvZki8YlFv1HzlJXefx01DrcxbaTFKRrL8WthSkOVpbB
 76DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740153203; x=1740758003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B3PN5npkU2fZGy+04m+tjR9ps6/ogxxXtP2BCPt3H5c=;
 b=IinjZMlllv8kt+ce1VjWKbp5TMePnS6abw+CGeuuOGhM40vyXwnb7L6vs5wPeVlyLQ
 i9hcAwl8MAJ0qCh6IhR4PKhdg4kSwP0rTgEVbii4Sv7rBpf553IDuxFnFi7kF99Z6kax
 dZhjBitcinXrtGKIpGWR/ovTf8eQFky9BtTyNWMbXyC5vYnipjHTxMMv/FEqFgy68ioq
 7xIy1jTWNGcO/qLl7xc2T78/I2w18BiIht/J27h5Am4FRdkmPbjqH73jU1sWX7z76dSE
 EqTkYr1q6plZPkXDnpfxoashXsjh5E/d06ty52ATfQrIFUHUu+OkvOJ7jRD9PPMzDSI1
 GC4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWKiVYC6uaiWOllN2B+E9CI0pnc80Oj7bWj7ylxhBudD3QB5yQjcZ01BKwum3kR/0vCpt13yQdaip4@nongnu.org
X-Gm-Message-State: AOJu0Yy/p7PM5PXNX4d+2jKRYoJwaaH5mcs+BP6NMZ02yQNtkj8qHSRI
 Ub9h19sDReI5v3VLEFv7D0intHW23WPeFSlg2bJx0C40PFVN+BTI63+nE7b6T0dVVIc+rhVnQD0
 Yu5gZGA==
X-Gm-Gg: ASbGnctiDDeex62xzw5aHHnnjbywFc/qGjMka0hYk4kqiLIqMlcQ5DmnLwQlsLw4iRj
 pGr9jp/if4AxVURw+0M9FGOmu9ujUNq2m3LLkp/HvajHSySei+1CqGmz8nzsVpoEjAAoXBFrn37
 ZU+vLIUrPnGoY/eCQGxHU2Y6HfHwTzGQoCMSJC4wpX+MjOCavTlC+Um/t/G1K+tS10k9Frc2IZY
 CJgyntO9Qh/qAytyhJWDZOWJiPJlSi0Du8/b2af9n+T67eTmnoQGr81SXNLFb8KmA6qXvEtqUku
 IEANCtjz8YzpFFGdPiW4CX0YJZoCc61gPFbWEBQsACs4
X-Google-Smtp-Source: AGHT+IEerJHl3bzS+gDiBw/erKq8HFLu3r9xjjDGSyr0cSX9FLyOFLWakAGwyFfwwkNstulFt3W8rQ==
X-Received: by 2002:a5d:64af:0:b0:38f:452f:9f89 with SMTP id
 ffacd0b85a97d-38f6f0ae2c4mr3715212f8f.50.1740153203292; 
 Fri, 21 Feb 2025 07:53:23 -0800 (PST)
Received: from paolo-laptop-amd.. ([2a0e:cb01:d3:f100:1f03:a9f0:23a0:9bda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa1esm23510035f8f.100.2025.02.21.07.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:53:22 -0800 (PST)
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
 Max Chou <max.chou@sifive.com>,
 Jeremy Bennett <jeremy.bennett@embecosm.com>,
 Craig Blackmore <craig.blackmore@embecosm.com>
Subject: [PATCH 0/1 v2] [RISC-V/RVV] optimize the memory probing for vector
 fault-only-first loads.
Date: Fri, 21 Feb 2025 15:53:19 +0000
Message-ID: <20250221155320.59159-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wr1-x42c.google.com
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

This version of the patch addresses the comments from the following review:

https://lore.kernel.org/all/2df9ae98-afb8-4647-be80-12540a1c4612@ventanamicro.com/

Previous version:

- v1: https://lore.kernel.org/all/20250129144435.82451-1-paolo.savini@embecosm.com/

The new version:

- fixes the "braod" typo in the comment.
- removes the "probe_size" variable in favour of "elems" that is already used
  for the same purpose.
- removes the duplication of the code calculating the page split and adds a
  separate "addr_i" variable for probing the memory without polluting "addr"
  used to perform the actual load.
- multiplies "elems" by "msize" when calling for the memory probing function so
  that we pass the number of bytes rather then the number of vector elements as
  that is what the probe function expects.

We also change the heading from RFC to PATCH.

I also take the opportunity to thanks Daniel Barboza for the review.

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
Cc: Jeremy Bennett <jeremy.bennett@embecosm.com>
Cc: Craig Blackmore <craig.blackmore@embecosm.com>

Paolo Savini (1):
  target/riscv: optimize the memory probing for vector fault-only-first
    loads.

 target/riscv/vector_helper.c | 91 ++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 35 deletions(-)

-- 
2.34.1

