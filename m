Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E45C5DF86
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 13:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwgCI-0005A9-1l; Wed, 19 Aug 2026 09:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wwgCG-00059p-BL
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 09:19:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wwgCE-0004qC-Kz
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 09:19:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso1666049a91.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787145549; x=1787750349; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iBbYixPr0Ux51WeoZy3YIxt8QwFzfvPD/E0ngL0ab2k=;
 b=I92paEaeFC+oBYShgV37Xj5isLFUtE3ODiiZbkUShWq6XQMaPHVzRJ4srIN9O3mrHF
 nZcd35Xy+ltLgw4JH0oxiyFilT6LEnCR7SS8sEE8ZV4ZykoZ3fGbiO4zcYqcLewLiEsU
 gjRIgfDxJpA8XsC2D5dDSt8t/JxT2JpsdtNS0fdUXu1HruKEA2E0Au1LR474adjjTcWj
 Wcx6fRWxGpoXGOoKrQy1f2Fb5QalkcsYelOcKM2JTVkmknW91ClRriLQP77N4Al9vEKF
 7xxAxXd0npoxXG6aQYCK/OZ56eS7HrpfR3Hn+IKOrDJeNRjwYEfBDnIr21PaoAhR1NJ8
 UUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787145549; x=1787750349;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iBbYixPr0Ux51WeoZy3YIxt8QwFzfvPD/E0ngL0ab2k=;
 b=jHi+zdz7qIChXY7xT3igOZ0NeGsKJSwiEUiT4ZDf1bHE9Jz0RezC+wBe8yR0zKDJhL
 f7R2IH9x603cuKfZse86B/9FzpInkccLnmzVigP76ywH4EpAfRABwhWC3rHqWAq+1vJF
 T5s7OnYDSP0CqZ3XaMCFGN3g0EDiZbiKb+MV+/2G8Ws/gDR1hw9PGDp7LeKVGPMPlAgn
 2bLyc1s6Pfo8tAUXxWnHK2iu8OZAbYjz7N9kDu1ddIde1UESJOWcgbCc/Rmu6Upl6NmK
 7P2HX53uNnA8MGlwE9qElu31XBOB4OrMLuaT1D+V/sEJUqVjq4vf+nRuG4njEQd3Xk3C
 VD8A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIb94EFskpAkhkBRSS3HRCJslpGxFmSWwO13fzjYS4IHrL90eH9eMd2FXIbixRUuM06rvgQVMHL8FF@nongnu.org
X-Gm-Message-State: AFuF++nxJBIUFp0FDPIjzdgBlLM25gWZaeZAbB7zo1PYdVrGO2Bm5go/
 oQtjNXnTLwl/2U9WePANCfBY1rPaInHgi98sgjqYBqYXFBGsgNN1NShe
X-Gm-Gg: AR+sD12T3OvAabSkzxEZ4uHNoO/QT/KAlodd+byruk1wTBbJp092X63KVQoeMSLM8Ig
 S3b+q63bakr1ILYuZbqu+Crn6uCYFUtEKB8Aib3STZxSqwPBdvZmr16Hrbtb0SrBbPc3Z+IVjI9
 qZIc8BJK8j5cQwXLhs0gDSSYieVSTgVY0sV3Y0g99ETQdyb1BAkD092QPAR8mxApPIaJ2ZPw6Q6
 nwvGXWVhCDzDa23Ilp9gVRWaO5zGYx4gwgriZe20fVV9dBrBSr9Ha/JdQO/Iha392b7LS9cJ3zf
 ljSNwKsnc1aFslaWqkyysBdJCFIaGl55JaCFMLNp/trOtj90aJAs9E+EjCZujDt+KKFZMlr9fTe
 qwpuPjpEsqNNbyugdaKGzzkQsvG1NLDNpB6Hl+S9tSEFiLA6f9XU5VI+7Qn62HhqP0x+vfeCw08
 XWB3cjaJyGwpeOh2cVUoS3rhZ4kqvDeABbzj2KIPcAD3P5jtWovDBBZGMqu5sCnySEC/BkeA==
X-Received: by 2002:a17:90b:5684:b0:395:5eec:b932 with SMTP id
 98e67ed59e1d1-39580f6b704mr9272133a91.11.1787145548898; 
 Wed, 19 Aug 2026 06:19:08 -0700 (PDT)
Received: from DESKTOP-DFGP8OG.lan ([156.226.169.41])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957fb12145sm2734387a91.4.2026.08.19.06.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 06:19:08 -0700 (PDT)
From: raoyi <rao232328@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 caojunze424 <caojunze424@gmail.com>,
 Bin Meng <bin.meng@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 raoyi <rao232328@gmail.com>
Subject: [PATCH v5 0/3] hw/timer: add K230 DW APB timer support
Date: Wed, 19 Aug 2026 21:18:56 +0800
Message-ID: <20260819131859.9583-1-rao232328@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=rao232328@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Add a DesignWare APB timer model to QEMU, wire it to the K230 board,
and provide qtest coverage for the timer behavior.

Changes in v5:
- Rename DW_APB_TIMER_CONTROL_INT to
  DW_APB_TIMER_CONTROL_INT_MASK.
- Fix the K230 timer clock frequency from 6.25 MHz to 50 MHz.
- Wrap the qtest commit message at about 70 characters per line.
- Register both K230 qtests directly under CONFIG_K230.

Testing:
- QEMU build passed in the Debian container.
- tests/qtest/k230-dwapb-timer-test: 8/8 passed.
- Mainline Linux 7.2.0-rc3 booted successfully.
- DW APB timer registered at 50 MHz; PLIC timer interrupt counts increased.

raoyi (3):
  hw/timer: add DesignWare APB timer model
  hw/riscv: add DesignWare APB timer to K230 board
  tests/qtest: add k230 dwapb timer test

 MAINTAINERS                         |   3 +
 hw/riscv/Kconfig                    |   1 +
 hw/riscv/k230.c                     |  33 ++-
 hw/timer/Kconfig                    |   4 +
 hw/timer/dw-apb-timer.c             | 376 ++++++++++++++++++++++++++++
 hw/timer/meson.build                |   1 +
 hw/timer/trace-events               |   8 +
 include/hw/riscv/k230.h             |   8 +
 include/hw/timer/dw-apb-timer.h     |  40 +++
 tests/qtest/k230-dwapb-timer-test.c | 274 ++++++++++++++++++++
 tests/qtest/meson.build             |   3 +-
 11 files changed, 747 insertions(+), 4 deletions(-)
 create mode 100644 hw/timer/dw-apb-timer.c
 create mode 100644 include/hw/timer/dw-apb-timer.h
 create mode 100644 tests/qtest/k230-dwapb-timer-test.c


base-commit: f893c46c3931b3684d235d221bf8b7844ddbf1d7
-- 
2.53.0

