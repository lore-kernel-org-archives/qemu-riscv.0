Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D56C3DA4B
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 15:48:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU6sy-0006yx-OL; Wed, 17 Jul 2024 11:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1sU6fN-00036y-7m
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 11:34:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1sU6fL-0004lu-6b
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 11:34:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so601887f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1721230441; x=1721835241; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+ZTCTDtsPvM+z8F1C+LwAra8ZB+wrMRdsWgS+nPMOA=;
 b=RgpFrWQP4W+LzsYwVUVCzcL/++lUCShRIhaF3QPqgolDm4e4+VsIkhbRQfXXtC2nh6
 4lIeQgLxkCZlhO959fBPV7/+DV09vZFKC0KGXAs1NU5ZDf6xVfBfxGdw2f5lFemGR+rd
 BD61Uq25W4GY9lciHwA4e4Aqx0z1L+JSCE9fE021YMAGOUDtgGffqFLQ/zlLrwKVixID
 du0V7kulsbXIaDlsxugAuVs1yaibeB16A5EVgd1TkfOrbCu2SeHzP5mbCQnua+dlN8GS
 FiPVG13FKEbfrszUxzQQMgFBAXBTGbPuthMevscbXuqm6kmF4/U4ZbwGR2tJzBwvCEG4
 lbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721230441; x=1721835241;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+ZTCTDtsPvM+z8F1C+LwAra8ZB+wrMRdsWgS+nPMOA=;
 b=SRSusQlwB9AJcuroOJH5qrJ9x3Le1x8+MTG8MLZ8ksammMVqoqi1lWH1wkf+lFvZfA
 +tE9DNM5MokRv1CO5lO37Y6wqMIWoSlIwKQexZXEJrgII2dw1Mz7h+JiXJCX88DDOSeQ
 GVhwCHEC/N7f4TUyIPGhdPqHz8g01YSP8DwgXarGXHquSYwGdgBA8KYEfHcNVTdKbUJH
 0GZ7TvMpdEwMIhDAMSgEduMhftYD6UYps3+qwjPsSB+6xjGjcd51c13qpKntShSwGrlC
 XFLX4yBHX4QVQBjdqzQ0UI+GOAGXAVGNnRJcP3IiHPVSE934o3YALfI7m60ytXqG9Mio
 RUlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeutZaLJPhOa5OsXwbxONCdloKyAKVoRuLSlPIqHMDlneEKuP9nQ8vTOlwHSfzCbwNPvIxQFPKurCEMzjLLn8a+YJd6m0=
X-Gm-Message-State: AOJu0Yzz19/lqSL8y6mae1ZrpEff/4fzdUTP/Y8ARDdj/3P1A9p33EM+
 Jpzu2ox+3PT0HE2qsMCF3LZcIDQxWRfC0NAS5cbUwwekGmao1HiDMIBhCfTEXOw=
X-Google-Smtp-Source: AGHT+IHlmlrvBECmCgQko/Z3tK7w4ct4kXB4pUFWvsoYAfOA6HmKLwKBhnwzMphNQh1JWP1GgJBdLw==
X-Received: by 2002:a5d:6dad:0:b0:365:aec0:e191 with SMTP id
 ffacd0b85a97d-3682753bd5dmr4877115f8f.21.1721230441002; 
 Wed, 17 Jul 2024 08:34:01 -0700 (PDT)
Received: from paolo-ThinkPad-T490.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c779839bsm2369475e9.7.2024.07.17.08.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:34:00 -0700 (PDT)
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
 Helene Chelin <helene.chelin@embecosm.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC 0/2] Improve the performance of unit-stride RVV ld/st on
Date: Wed, 17 Jul 2024 16:30:38 +0100
Message-Id: <20240717153040.11073-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Jul 2024 11:48:06 -0400
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

This series of patches builds on top of Max Chou's patches:

https://lore.kernel.org/all/20240613175122.1299212-1-max.chou@sifive.com/

The aim of these patches is to improve the performance of QEMU emulation
of RVV unit-stride load and store instructions in the following cases

1. when the data being loaded/stored per iteration amounts to 8 bytes or less.
2. when the vector length is 16 bytes (VLEN=128) and there is no grouping of the
   vector registers (LMUL=1).
3. when the data being loaded/stored per iteration is more than 64 bytes.

In the first two cases the optimization consists of avoiding the
overhead of probing the RAM of the host machine and perform a simple loop
load/store on the data grouped in chunks of as many bytes as possible (8,4,2 or 1).

The third case is optimized by calling the __builtin_memcpy function on
data chuncks of 128 bytes and 256 bytes per time.

These patches on top of Max Chou's patches have been tested with SPEC
CPU 2017 and achieve an average reduction of 13% of the time needed by
QEMU for running the benchmarks compared with the master branch of QEMU.

You can find the source code being developed here: https://github.com/embecosm/rise-rvv-tcg-qemu
and regular updates and more statistics about the patch here: https://github.com/embecosm/rise-rvv-tcg-qemu-reports

Changes:
- patch 1:
  - Modify vext_ldst_us to run the simple loop load/store if we
    are in one of the two cases above.
- patch 2:
  - Modify vext_group_ldst_host to use __builtin_memcpy for data sizes
    of 128 bits and above.

Cc: Richard Handerson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Max Chou <max.chou@sifive.com>

Helene CHELIN (1):
  target/riscv: rvv: reduce the overhead for simple RISC-V vector
    unit-stride loads and stores

Paolo Savini (1):
  target/riscv: rvv: improve performance of RISC-V vector loads and
    stores on large amounts of data.

 target/riscv/vector_helper.c | 63 +++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

-- 
2.17.1


