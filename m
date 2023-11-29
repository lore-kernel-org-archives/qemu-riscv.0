Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B57CC4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 17:32:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8NzB-0008Vu-Qc; Wed, 29 Nov 2023 12:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1r8Nyt-0008Ah-Fh
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 12:04:18 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1r8Nyr-0002vh-0o
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 12:04:11 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cfc2d03b3aso30609515ad.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Nov 2023 09:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1701277446; x=1701882246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GHbV0I+QOlx/OHbttaWIvpuptP06zgPxIiK8T4xUKr8=;
 b=UWZ8HTpyeG8enxTTZVnFMovD422VvuoReVFXFWVB9uBwIFm64Mop1nFO/+d2SY/pFD
 4l8jHyRgxjZg+caXuYQLVcO4z0924GWBxfUKwVHXcFYVYX9OaBS8GKw4KZQoWkGDAW+q
 pSi0zkML0SyE1h/6JexRl8OWzOT0pEPu5800jADEV7+RH6gNa3FMsgMQGthUkfMYm1Qn
 ovbfrraLk2R0QRoaRHRWngjzQj0s7zY0INzsvclxQlx3EJP25s5Q67lElmPeLBsjN3do
 CASxkDqep2gk+knRYNtPyGmrTQdc1Ofrg0bJiO2qa6zb8uNtCL94ss2CUW/HDHfNYILu
 d97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701277446; x=1701882246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHbV0I+QOlx/OHbttaWIvpuptP06zgPxIiK8T4xUKr8=;
 b=lvDcwlzKocd+zLxQnN/tMbe8ageWuSG3eThQrbe6SDMfo6P85Ff/vNXOlzctlY+jcE
 K40c8KR2RlBGWfocO5zZz2KNDhebD5XFT8k5BsMVNfYGt9zeQ0oc82zM9pTGBZe7edQd
 gIUHMKATYrf9W9uY1kbG7Bi4WNmgZzPB/Ev2lGD0M8K78p8DeORNhJzQK8Zi9KFYCz35
 Lye7VXsT3dTIbimtaBC/vUJWpdJ0GAE2HwceL5csnn/kK9RxBNjDWj97fzC7zsGD+67T
 tnxfTEP6bSms9whJgvZVChLJLQrRmxkXbC20yOo30q1vOBWhTiUgPAobbsBSPYuzll2b
 JIYg==
X-Gm-Message-State: AOJu0YzcL7wk1pagiPjTksEzqoBMzFuFIKLYiEk1ySGylqe+B1wynk2a
 U1DALxlKU7xqgs7PrmgSexDaHw==
X-Google-Smtp-Source: AGHT+IGS72HbMSuocMS11YGVXLkTRyLrDuNhqa3kKuUeWl1xSfaLpl5JFUot3EDT67Lae2idsXwLBA==
X-Received: by 2002:a17:903:1d2:b0:1cf:ad61:7a67 with SMTP id
 e18-20020a17090301d200b001cfad617a67mr18396967plh.32.1701277445789; 
 Wed, 29 Nov 2023 09:04:05 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 p5-20020a170902eac500b001cfc6838e30sm6921383pld.308.2023.11.29.09.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:04:05 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>
Subject: [PATCH 0/2] Make vector whole-register move (vmv) depend on vtype
 register
Date: Thu, 30 Nov 2023 01:03:56 +0800
Message-Id: <20231129170400.21251-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The ratified v1.0 version of RISC-V V spec section 16.6 says that 
`The instructions operate as if EEW=SEW.`.

So the whole vector register move instructions depend on the vtype
register that means the implementation needs to be fixed to raise an
illegal-instruction exception when vtype.vill=1, as is the case with
most other vector instructions.

Reference:
- https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#whole-vector-register-move
- https://github.com/riscv/riscv-v-spec/commit/856fe5bd1cb135c39258e6ca941bf234ae63e1b1

Max Chou (2):
  target/riscv: Add vill check for whole vector register move
    instructions
  target/riscv: The whole vector register move instructions depend on
    vsew

 target/riscv/insn_trans/trans_rvv.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1


