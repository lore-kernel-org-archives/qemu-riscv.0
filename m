Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B26C79F8C
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:43:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4DtC-0008EM-Lm; Wed, 09 Sep 2026 04:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4DtA-0008Db-BW
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:40 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x4Dt8-0003I4-Or
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 04:42:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2d91ded8174so45570635ad.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788943356; x=1789548156; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BOfIqWgA7pka2B6DQz96MF5Lg2ukOaH404VNm1FKDGA=;
 b=JCvVjuur/qD9uFihXOJ5FiuPiEX2Pm4YSwbWpIalNzRdhpAvw8dibPOc/gf5wAd8Jh
 xL8xId1tegLvnymGHkqYebsl4VP/7GoEIOTZZ7GfBbwx4q9sw6EIsJ1+ugGQndVYz3/q
 Cv+PPMQEzQvOg4vF3wDx4SWqU2EwntNg1JWAWPX6564DmcrzXyTIccjKwUlluDTtGcwc
 CIi37tAGqOxezRYpCHMI6o3YxG6Pv6xKXfY8w8IUxTzPnSDbHMKg5Rk67rKQOpQiHNUh
 PsTwurHIoQV8Q84Rxf26FF4TFLMb2oUlk2IoJVdSAJMWLZvHkC0sMKv7oGu/LRIawHER
 Q61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788943356; x=1789548156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BOfIqWgA7pka2B6DQz96MF5Lg2ukOaH404VNm1FKDGA=;
 b=O/A3VoGsikiDDUbZmNWTDrgvKlLByMvPP/P5QlEFWfjhGWNvm3Y3DsbRL71WnsZXfl
 AW+7CPJ3zvdiKYNOHWWQoA5Nw3D7EpgHA7QLiZegFoiaShijmgAItXVjBkKJO7/S7nNB
 h9pxGCr+Lw6LeDWYQXBENNiMJ09wIrB2WCjMDvIGCN5g87+PeHm8G5PKrxqFLynj8Cq4
 eYH4J9mZZMs3lr1nS5EjILO92J/vxE0uVbWFsXy1t7rNQh0ZGVKB4OwR472x6qUUKojM
 Svc/op7o/LNkx6jn2F9ezvpRXFL5f7vDS+02BksmwDSDQ/aqeSH2AMH5TBc6Ayu4qTUh
 Rbgw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsnNZkmgU/G/TFuh+H5orVo4zRwYSiatNVScxWBPa+76TB9MU/WE5wehYbpG/twMeREBKjSpmQd9cl@nongnu.org
X-Gm-Message-State: AFuF++k1Dqr+AjZRKVC38aZlkWhHDERTKKFqfjXpGGNtxN3lIajX3NXs
 t2rshgFwV6ENXi1pR2CdIbV2hzRQXVhsAqEzENZ2zEJhWzmN0YMw/IAGMGKUZDr0ZFg=
X-Gm-Gg: AYBFou1c+vw5so66mElAoqBtVjoGqqNrsxdXtb+f5RnCFpS7KmMjwgCxs5Ua0ODj4M2
 gm6Pt09Px/bvuD66jqftjJhhPBBtQBWVroWxdQgGNqkGKYP6YaxpjfzTEl8jdrY6Z6DMY7KaG6U
 hUn0zEqpsCx2RJci+HJEoP2yFi3r5vZ6APsZ+lMr5z3WQ+K7FyHSAeoXb78SWFfOiGRxFliIcS/
 IhIWntANY24qOdigrTXzpcONKuzT5dBU+UxOVkYcEXFpJO5VaoeQJoZZHpBF++vLvI/0/q7gU57
 LBs9/y9WNWwOPr+7l623QXs7idFcYyEQBwDlwQOnCRzRUlF+Q5UvthjLN5lp2cBf8UoezHaZyli
 Xfyq+5lvOQ0Dhme2lDfFYd2TpxyL01lONAEPy0T/ZKXxpUGMvQ1Pdgakecr3i8nKG+1LBfkVXv/
 iEtl1szFILMQmbA7IFKSdWqPaRqzcE2h8OsSWOROEhrElEVX+A6IoOSwlj2HoRM5+lP2FCDRep+
 myTyV+xH1xxWDVMFKjM0ZB6/gURkbZx4cZkdsstff7Z879SDlF1JqRxMgTc4mQqNKKVauzYaA==
X-Received: by 2002:a17:903:3848:b0:2d9:56dd:f804 with SMTP id
 d9443c01a7336-2db125f00c7mr505328805ad.13.1788943356430; 
 Wed, 09 Sep 2026 01:42:36 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2db56c2a1f1sm38328225ad.78.2026.09.09.01.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 01:42:35 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 0/6] tests/tcg/riscv64: Add system mode rvv ld/st tests
Date: Wed,  9 Sep 2026 16:41:47 +0800
Message-ID: <20260909084154.223529-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
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

Hi Richard,

This patchset adds several rvv load/store tests with PMP permission
settings, as we discussed during your v1 submission.

While building the tests, I noticed that pmp_hart_has_privs has a scope
issue that yields unexpected results. This affects both the vector
fault-only-first load and vector unit-stride ld/st instructions.
I therefore attempted to correct pmp_hart_has_privs and
vext_ldst_us_notail, adding matching tests.

Hope these system mode tests and fixes can help you.

PS: I tried applying v2
<20260821040404.268123-1-richard.henderson@linaro.org> to the master and
riscv-to-apply.next branches, but both conflicted.

Thanks,
rnax

Based-on: <20260821040404.268123-1-richard.henderson@linaro.org>

Max Chou (6):
  target/riscv: Match PMP entries lying inside the checked range
  target/riscv: rvv: Probe unit-stride accesses by the first element
  tests/tcg/riscv64: Add vector masked fault-only-first PMP test
  tests/tcg/riscv64: Add vector unit-stride PMP test
  tests/tcg/riscv64: Add vector fault-only-first page probe test
  tests/tcg/riscv64: Add vector segment PMP region spanning test

 target/riscv/tcg/pmp.c                    |  31 +--
 target/riscv/tcg/vector_helper.c          |  45 +++-
 tests/tcg/riscv64/Makefile.softmmu-target |  38 +++
 tests/tcg/riscv64/rvv-ldst.inc            |  91 +++++++
 tests/tcg/riscv64/test-rvv-ldst-ff-page.S |  83 +++++++
 tests/tcg/riscv64/test-rvv-ldst-ff-pmp.S  | 259 ++++++++++++++++++++
 tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S | 141 +++++++++++
 tests/tcg/riscv64/test-rvv-ldst-us-pmp.S  | 281 ++++++++++++++++++++++
 8 files changed, 943 insertions(+), 26 deletions(-)
 create mode 100644 tests/tcg/riscv64/rvv-ldst.inc
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-ff-page.S
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-ff-pmp.S
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-seg-pmp.S
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-us-pmp.S

-- 
2.43.0


