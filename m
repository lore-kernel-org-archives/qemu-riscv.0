Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD54C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:44:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weVwl-00066d-VJ; Tue, 30 Jun 2026 06:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwe-000654-GQ
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwc-0004nd-CK
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:43:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c85b73ffb52so1470490a12.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1782816235; x=1783421035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pzi608LaWSUtrWTDOF/FS4C+oHsMg4cdyOtgq8i47qM=;
 b=mMN2JBAXFsjRHA88EVYLL8OjJ6eO5It9nyMHjyw7hJABvduDNd8VydZea4fQUZ2a+q
 WPTu13lwViTuZGjYQUTDCrhTpeJLKopfa261ep36cXGFzuNOIozRxEmp54lFm2xeiCU+
 CSyUHsEUjZvdYqrWvxTLe48rojuMDYoDYe9pg01lKujq0nS8vhn7+r7J6EWxAEUzWoHu
 2Ivu+0Vfxr85EH0cVWT1yfhHvKWSPhfuK5ikWwWHltOh17zzyTHkQRsbA/9OKh9EP6w7
 QtBEPnCZqrdtzEBM+Q+84OOGJJUSexr5Pn3hDqvsaX2EsnA8Zxa89zHBUhuLXpxUJuFT
 qUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782816235; x=1783421035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzi608LaWSUtrWTDOF/FS4C+oHsMg4cdyOtgq8i47qM=;
 b=HTIZHQaynrTwSc5K9rwRJjXS/WUcuy1IyWnpvjPtxcj7lcqlod4vXdpRXwXuaA8vSZ
 BI0TEWxZkfakYVoBxegadQ7oy2pjHj1zsh0cpz3AjMYB3rDP5WAyizeUfagsDWmysJ2o
 Kkvfiv1cG5FO2tiHb+3MleHzS8zzui8KbWTvhnYcbz2EmYRS0CWdMGIT9dGahFuB2leM
 lZPWJQsY5Fr1YwQyQgk3H7Ql8UxQw9dzzHhUbVJc5F8JFVCAohnU6Q3P07TVnYgAwqwG
 22nm1Bjx1IgtJDF4z99C1zFey7Q9W6KAldjTbAh08cTniUmVBymGCG9KbBveiogNFMtd
 SpdQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ85LEbwCZGekvvH1ffa0G/7wc5Jo2jiDuwBsQlMClEXztqW2zkgCZAQM+qOIgdopgjkPzCkK+dYGnOD@nongnu.org
X-Gm-Message-State: AOJu0Yw1qjltsJwU3gzjV8R9y0icZ9AXT3wKZ71nveKd76wucWHlzl/A
 x7f2SolR2Zw+ryEL4k5B47/P3mZq82mbIgQ20IW+hWEPvSWuF9mpZqB4bjBtoPkI39A=
X-Gm-Gg: AfdE7cnyAESlW2hLe9IZx0MOf13fCGj4njimho3epceshfxQY24t1/+dq1RW8LRUtsH
 dnkeHIxfeERxc0H1SlDlaFqi+MSQRDekQHQLMmzI1AYRoUI2OJcjMeu+LAZlThFYPxJtKso88m0
 kovlLMxaT3bERsHgCVkwLYLMmAds1rmS2DIj3vs/ZzqpIXfv6ve6jf1DqvJDea82zhudg+vbHgx
 5BvQlX5C8QShu2aYCo69SUfz61LAUY/XTjj2nUZaYUBKwiudvCXoA2REw28zKb4GerqDlCFcV+e
 qZf68nt0ndSD2ZZK/0/kBO/kfEVWxguIrVZnPhq1hsb09ZF14lOttDqe478zvIGHgwkZeAt5WC3
 64g52r3zOCM16ALQK0CE3HWr2axshNqeAkbDbyrMv5RnPTYxsKenT/hIzVC05ffpMsL9XRSjBkk
 z53glerfqam7Hzx9GkCOpmxflLI3Rr21us+A2YlBs=
X-Received: by 2002:a05:6a21:495:b0:3bf:9944:a8d8 with SMTP id
 adf61e73a8af0-3bfc527fa3cmr2673472637.34.1782816235431; 
 Tue, 30 Jun 2026 03:43:55 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbf95be56sm1274745a12.16.2026.06.30.03.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 03:43:54 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 0/5] Support the true Zicclsm extension
Date: Tue, 30 Jun 2026 18:43:45 +0800
Message-ID: <20260630104350.748267-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Support the true Zicclsm extension so that we can trap misaligned accesses
when Zicclsm is disabled.

To enable/disable Zicclsm, simply set zicclsm=[true|false], e.g.:
  -cpu rv64,zicclsm=[true|false]

QEMU will raise a misaligned load/store exception when executing misaligned
load/store instructions if Zicclsm is disabled.

Changelog:
  v3:
    * Enable Zicclsm for the compatible CPUs.
    * Rebase to the latest riscv-to-apply.next.
  v2:
    * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
    * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
      vector load/store whole register instructions.

Frank Chang (5):
  target/riscv: Add Zicclsm CPU option
  target/riscv: Support raising misaligned exceptions for scalar
    loads/stores
  target/riscv: Support raising misaligned exceptions for vector
    loads/stores
  target/riscv: Enable Zicclsm for the compatible CPUs
  target/riscv: Update Zicclsm ISA string and expose it as a CPU
    property

 target/riscv/cpu.c                      |  9 +++-
 target/riscv/cpu_cfg_fields.h.inc       |  2 +
 target/riscv/insn_trans/trans_rvi.c.inc |  6 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++--
 target/riscv/vector_helper.c            | 65 +++++++++++++++++++------
 5 files changed, 81 insertions(+), 19 deletions(-)

--
2.43.0


