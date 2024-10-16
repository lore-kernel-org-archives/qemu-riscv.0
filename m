Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB5AD2A541
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:31:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t19kJ-0002d6-GD; Wed, 16 Oct 2024 15:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kH-0002c2-5B
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:45 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kF-0003nB-36
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:44 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20caea61132so1382405ad.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729107101; x=1729711901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvIR58QCYBZMdE3s9ffnpI9HyypOXKW1og1THMmS8H4=;
 b=sczu2XQRktIWGXsR/C41ysMqwPqaagx3wrv7+2w5+xNhUeBEvUc/n7anFEhnQrmtBu
 49mUvtf3sDVcYBSlZGR2IkpPgyWu+e/hVzUT1L8qiXAHcfZj4CzmAgbzPrZT2wiepVd8
 A1w4hbt/vLtUMPxHREdPLDQSb7tMztB3PmfTSssRfbdR28nk/p0Gcxu5PQ97wFbJIyYB
 /Na/78JT0CNPyHckDJoBgA8jN77/dD2kE2m04BD4APQ6raLMLbjO/hopsgY52tFDUw1c
 plt5ZpQ2Fdfpwsh8NGJhmqqXMcnkeezXnpKNMJd2lRR17uHS/H8DqRT/1Je5n6YVcksL
 V+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729107101; x=1729711901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvIR58QCYBZMdE3s9ffnpI9HyypOXKW1og1THMmS8H4=;
 b=sJo1RqkIrVwImv3ZdiV2sgppFPhtXo0WcI7MV3tUA7iJeQZr0cCqMqmgR5Kq/8PFJM
 oFg9SystC5mypdmwR/1yQ7xmsPltshO9NxPGeNSF0eYSZZLQKmjQIRIwA+7iRiqmnMYm
 Krjl0XlpIevOnmnsNcsdlYTpOkCC9y6JPciPAxCt1E9AoznlHCpEx4LcosoUgWtXIkhU
 +42sBUn/40YMpdEPVnsUSydDP1ZvJb4pNXG+31rM8jk5aSGn5fcYfo4Hq1mdVp6Y49Wa
 qYVZvHMtNtT0c9TqNW3WCulWyuHk1RaExf7moxsHPZfYMws/Dg8ADQfHCiQMBKe9Gc2w
 pcAQ==
X-Gm-Message-State: AOJu0YyMGI2JTYuS6SrwZ4Z0pMnXwanDJbHq3nLmQLu3eqQmmtnrpy0w
 uBhg6n7C8RFgxS14FxIVPc71KZc33usC5qXen9lHOavQoDcn6eQYIzc7dd3HHjA=
X-Google-Smtp-Source: AGHT+IEa9223NNXktfkxq0Z5eqB9S6GT6hutGy0qNFA+BErBbqacWWwUDuYtv32o8zvGxYNjyj6DCw==
X-Received: by 2002:a17:903:22c7:b0:20c:9062:fb88 with SMTP id
 d9443c01a7336-20cbb1a983dmr235631805ad.1.1729107101463; 
 Wed, 16 Oct 2024 12:31:41 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1804b6b1sm32323945ad.189.2024.10.16.12.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:31:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 zhiwei_liu@linux.alibaba.com
Subject: [PATCH v6 00/14] tcg/riscv: Add support for vector
Date: Wed, 16 Oct 2024 12:31:26 -0700
Message-ID: <20241016193140.2206352-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Introduce support for the RISC-V vector extension in the TCG backend.

v5: https://lore.kernel.org/qemu-devel/20241007025700.47259-1-zhiwei_liu@linux.alibaba.com/

Changes for v6:
  - Fix problem with TB overflow restart wrt the constant pool.
  - Fix vsetivli disassembly.
  - Change set_vtype to precompute all instructions.
  - Extract one element before comparison in tcg_out_dupi_vec.
  - Extract one element before comparison in tcg_target_const_match.
  - Drop 'vm' parameter from most tcg_out_opc_* functions.
  - Add tcg_out_opc_vv_vi and accept K constants for operations
    which have .v.i instructions.
  - Do not expand cmp_vec early.
  - Fix expansion of rotls_vec.

I've tested this on cfarm95, a banana pi bpi-f3 with 256-bit rvv-1.0,
with qemu-aarch64 and some vectorized test cases.

Barring further comment, I plan to include this in a PR at the
end of the week.


r~


Huang Shiyuan (1):
  tcg/riscv: Add basic support for vector

Richard Henderson (3):
  tcg: Reset data_gen_ptr correctly
  disas/riscv: Fix vsetivli disassembly
  tcg/riscv: Accept constant first argument to sub_vec

TANG Tiancheng (10):
  util: Add RISC-V vector extension probe in cpuinfo
  tcg/riscv: Implement vector mov/dup{m/i}
  tcg/riscv: Add support for basic vector opcodes
  tcg/riscv: Implement vector cmp/cmpsel ops
  tcg/riscv: Implement vector neg ops
  tcg/riscv: Implement vector sat/mul ops
  tcg/riscv: Implement vector min/max ops
  tcg/riscv: Implement vector shi/s/v ops
  tcg/riscv: Implement vector roti/v/x ops
  tcg/riscv: Enable native vector support for TCG host

 disas/riscv.h                     |   2 +-
 host/include/riscv/host/cpuinfo.h |   2 +
 include/tcg/tcg.h                 |   6 +
 tcg/riscv/tcg-target-con-set.h    |   9 +
 tcg/riscv/tcg-target-con-str.h    |   3 +
 tcg/riscv/tcg-target.h            |  78 ++-
 tcg/riscv/tcg-target.opc.h        |  12 +
 disas/riscv.c                     |   2 +-
 tcg/tcg.c                         |   2 +-
 util/cpuinfo-riscv.c              |  24 +-
 tcg/riscv/tcg-target.c.inc        | 994 +++++++++++++++++++++++++++---
 11 files changed, 1011 insertions(+), 123 deletions(-)
 create mode 100644 tcg/riscv/tcg-target.opc.h

-- 
2.43.0


