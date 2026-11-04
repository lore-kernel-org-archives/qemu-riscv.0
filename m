Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D66089028
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=SNHQ/vCD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgsl-0002H1-9B; Wed, 04 Nov 2026 14:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsO-0002Be-K6
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:28 -0500
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsI-0002IT-Ss
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:27 -0500
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-36d6765756fso988714eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821338; x=1794426138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MRf63BKlzN9Q6T6SVbmpGWS97iFmtemTAut14L0mwiU=;
 b=SNHQ/vCDQyEYJo/kEzZtL9vadsEd/oBehOkN/ABn4Ue6uBlfIM1R581F6q14+aYsZv
 TbPGeOATZREjp6YIPW87SvTh22aGHQl2P450YfYxUT9V6cq6DHERF8eBn/OablHvKpip
 6hnLiddQu82MuQcVLU5IW/yJTIVBQqY6gIfueA7wQajmB5LYL24m5yzr0M41CzlrGBxW
 A6gmd4PyTKeVvgRhabHy4Wf11wYBp40pgo24vK2+VXYqVj/8V5ZDeHI85kVdH+qS7nQ+
 F+q3YE+ujuiJM873y5LpqepSpdG55A5DY5XzahkBIp42jCfH/Af2zr7upLmOZ81755IF
 grGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821338; x=1794426138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MRf63BKlzN9Q6T6SVbmpGWS97iFmtemTAut14L0mwiU=;
 b=nSo0tVD935zmG8cObdqk8UfDg1FLO57rgdyIRlsPnsrBZBDIVrvfLCM4fiMpnxJE5e
 mQIohGdIfVitQmbpFs+iEYp55bh500+JwMVJ0xLmnIPqYEvzMPm4ao4k2ZlkrOpmYo23
 7jH7Lq+pvvnUTeqjUKdqhzqWPXK8veaz9R5tTbvhmW96g120Kkm2BEtK067T74Rpzb6U
 m/7VtzdTwti5jyRbm94jjcbcFr+6QCpoWgWD/CP5m/xYHXJzuoec+vah6sSgOaxury6x
 yUwR3exJAfmRJ/7T/p25rJu2U//DVK5C7y2shogha90EFXURnj8orCH4sDMxRweZjOVD
 /JGA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTwAmzcf3JZ9noBphuSC6r8tuKfsKgfl84zQ9EiE2sRoIU92dd3mqZenmheWKGQJZSUCV5tc1Y6gTD@nongnu.org
X-Gm-Message-State: APuU4Z/ysO/yrQKhrSBE7by3He5xaE6ls2bqw1PZnC4IeTnA+bKax+cL
 bn+gVHySs+5OGNDV1Tq4eIm3tUoOM0kkJmjcjmy3ULtu3RXDjVrfDSg491MecuXui9g=
X-Gm-Gg: AYBFou2JsAO7zqHbASyJqrLQyHCTq+lMvfHkNWYoDlTe0TB+7v8uW3mTQJx66cjAhWe
 EiBbAoPR5VzY6wBQAMUb3RRWd5wp4s3KkqT6AlwEngAnnnIzVsrnp33UJnbC28qjuv4PW1dlveL
 ZHN3/bYw0pEil2bgLiQW9CnTNYLUr/SqCCFFoSCsiciD0yJgu6+GJrltSkdz5r+Mxua/wBxuxB0
 kHHLo4h1kYxE0QGLpH+jHW1rahxlXBFE+SmgrS5llnzG/aAeKBB11+JYIWFTHvif9dNZ2KjNphH
 M+N7+mxqxz6e/xh07diob4RZI+rNySzKlg1Nx4lSd1zq+wwlSVZDXEdowcSgmRzbBl63xqyKNJg
 mu5au/zJJohPaEIG/ANhbEh4gyLcpcScnJUZj9KOrsbEYL4/49RwZvWtUSBXN/xOHvcI+HtXDlL
 V6gAyRsgotRZa3HORdLR7gHbXCf8rgBOAPI5xsEiTznJE6XsQgkax9IXf+zSdEtZCNDiVJALerL
 jmqOPvwI6FMESk+it9rrLucp8G7Qd/5MSho63LQxJ29utSoIZnfeYeITpwGYiZdezAMh8V4Kprk
 PWhJhiYEwEzHobt4RqyQ7yudx2fp2UnXQrnK6XXhemzgHKEavUFzAiQze5TGHerhWCufDiB0uyw
 e0ge9KkAbY8UJBQaGxllJRwIPXmYM
X-Received: by 2002:a05:7300:d0a5:b0:36a:1b23:a1cd with SMTP id
 5a478bee46e88-36a4239359bmr23479815eec.9.1793821337810; 
 Wed, 04 Nov 2026 11:42:17 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:17 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 00/38] target/riscv: Add Zvdota/Zvbdota families of
 dot-product extensions
Date: Thu,  5 Nov 2026 03:41:15 +0800
Message-ID: <20261104194155.679241-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1330.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This RFC patchset introduces the Zvdota/Zvbdota families of dot-product
extensions based on the ISA specification
(https://github.com/riscv/riscv-isa-manual/pull/2618 v1.0 commit: 570e32e)
- Zvdota: Zvqwdota8i/Zvqwdota16i/Zvfwdota16bf/Zvfqwdota8f
- Zvbdota: Zvqwbdota8i/Zvqwbdota16i/Zvfwbdota16bf/Zvfqwbdota8f/Zvfbdota32f

This RFC patchset assigns the Zvdota/Zvbdota cpu properties as the
experimental cpu isa extension properties. These experimental cpu isa
extension properties will be replaced after the Zvdota/Zvbdota isa
specification is ratified.

The toolchains support Zvdota/Zvbdota families extensions:
 - LLVM (after 23.1.0)
   - Support v0.2 Zvdota/Zvbdota extensions
     - https://releases.llvm.org/23.1.0/docs/RISCVUsage.html
   - llvm/llvm-project#196467, commit d25ec4b84487, merged 2026-05-27.
     - https://github.com/llvm/llvm-project/pull/196467
 - GCC (reviewing)
   - Upstream patchset: <20261014093604.829234-3-jiawei@iscas.ac.cn>

References:
 - riscv-isa-manual PR: https://github.com/riscv/riscv-isa-manual/pull/2618

rnax

Max Chou (38):
  fpu/softfloat: Support OCP(Open Compute Project) OFP8 checking
    functions
  target/riscv: Introduce riscv_init_fp_status
  target/riscv: rvv: Introduce RVBNA algorithm for Zvdota/Zvbdota
    extensions
  target/riscv: Add cfg property for Zvqwdota8i extension
  target/riscv: Add implied rules for Zvqwdota8i extension
  target/riscv: rvv: Implement Zvqwdota8i instructions
  disas/riscv: Support Zvqwdota8i extension
  target/riscv: Add Zvqwdota16i cpu property
  target/riscv: Add Zvqwdota16i dependency imply rule
  target/riscv: rvv: Implement Zvqwdota16i instructions
  target/riscv: Add cfg property for Zvfwdota16bf extension
  target/riscv: Add implied rules for Zvfwdota16bf extension
  target/riscv: rvv: Implement Zvfwdota16bf instruction
  disas/riscv: Support Zvfwdota16bf extension
  target/riscv: Add cfg property for Zvfqwdota8f extension
  target/riscv: Add implied rules for Zvfqwdota8f extension
  target/riscv: rvv: Implement Zvfqwdota8f instructions
  disas/riscv: Support Zvfqwdota8f extension
  target/riscv: Add cfg property for Zvqwbdota8i extension
  target/riscv: Add implied rules for Zvqwbdota8i extension
  target/riscv: rvv: Implement Zvqwbdota8i instructions
  disas/riscv: Support Zvqwbdota8i extension
  target/riscv: Add cfg property for Zvqwbdota16i extension
  target/riscv: Add implied rules for Zvqwbdota16i extension
  target/riscv: rvv: Implement Zvqwbdota16i instructions
  target/riscv: Add cfg property for Zvfwbdota16bf extension
  target/riscv: Add implied rules for Zvfwbdota16bf extension
  target/riscv: rvv: Implement Zvfwbdota16bf instruction
  disas/riscv: Support Zvfwbdota16bf extension
  target/riscv: Add cfg property for Zvfqwbdota8f extension
  target/riscv: Add implied rules for Zvfqwbdota8f extension
  target/riscv: rvv: Implement Zvfqwbdota8f instructions
  disas/riscv: Support Zvfqwbdota8f extension
  target/riscv: Add cfg property for Zvfbdota32f extension
  target/riscv: Add implied rules for Zvfbdota32f extension
  target/riscv: rvv: Implement Zvfbdota32f instructions
  disas/riscv: Support Zvfbdota32f extension
  tests/tcg/riscv64: Add test for Zvdota/Zvbdota extensions

 MAINTAINERS                                 |   6 +
 disas/riscv-op.c.inc                        |  12 +
 disas/riscv.c                               |  26 ++
 disas/riscv.h                               |   2 +
 fpu/softfloat-specialize.c.inc              |  55 +++
 include/fpu/softfloat.h                     |  70 ++++
 target/riscv/cpu.c                          | 121 +++++-
 target/riscv/cpu_cfg_fields.h.inc           |   9 +
 target/riscv/helper.h                       |  28 ++
 target/riscv/insn32.decode                  |  25 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 305 ++++++++++++++
 target/riscv/tcg/meson.build                |   2 +-
 target/riscv/tcg/rvbna.c                    | 185 +++++++++
 target/riscv/tcg/rvbna.h                    |  40 ++
 target/riscv/tcg/tcg-cpu.c                  |  45 +++
 target/riscv/tcg/vector_helper.c            | 424 +++++++++++++++++++-
 tests/tcg/riscv64/system/meson.build        |  12 +
 tests/tcg/riscv64/test-zvdota.S             | 343 ++++++++++++++++
 18 files changed, 1703 insertions(+), 7 deletions(-)
 create mode 100644 target/riscv/tcg/rvbna.c
 create mode 100644 target/riscv/tcg/rvbna.h
 create mode 100644 tests/tcg/riscv64/test-zvdota.S

-- 
2.56.0


