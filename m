Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A9CCA1009
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 14:04:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uto5D-00031i-SH; Wed, 03 Sep 2025 10:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uto59-0002yk-77
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 10:03:27 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uto51-0005rm-Ql
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 10:03:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-24c786130feso13331145ad.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756908198; x=1757512998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M3w8RPIf6POZ7C7KJr0+0dx8T0d/EoIA746DKMDQLsw=;
 b=nIZwuSrwSu4YG9UYMiM7N6ijmsDno+rBaYxs1lT1G8gfRwuk8BCYENlFzPZeAXA7PT
 2hn++B9YVXNMrqmr2P2pOx1U2QndYGd7hCYorpOZOW6S1uH0PbwJD4JIGidKjAiowjGD
 8jhQFvGGAzsmB8xGwuVhrMyTz/AqBboBhGl79LBTYdrU6B9xNYP7jgQySWDepYmbrVg5
 5OxWyfScyp9+GaAxQrae4VficgvTMxCx6keCtrVHlmmQgIPJ5CukiZfn/Bv2hgeqOlJy
 qRd4oUbs1iVBraRhKbSpxfM5EBmR3EADFOppfo6NDEeCkjAEabkf1OppKG0biZxiJWmn
 fEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756908198; x=1757512998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M3w8RPIf6POZ7C7KJr0+0dx8T0d/EoIA746DKMDQLsw=;
 b=nVOdGmkTOVNqiqN04zZTzhr6giwxvxDjK8xlvWqwjn6zhSxjzPREoX8mLFcvqpIOO1
 hFyW4t+Lj6TRcJnZGfVHCFv33tUghxqLQCK2Vc2O4R+bhRWk1MCD6pDlWvEc9vZEMTRC
 ogzjxFD8VKT31v6890kEEtWTqJDYvCNioRcS4j67gOiQHAXSmM8n4ptmmsgzyM5pAGcU
 itdB43Yo83h3Fb+SBEGMJ1TMpHCNmGuIqtsEXcTSUxk8wn23D6W3dYQx483OyEtF9Fai
 mhv6h2lnOBHlZJZq6QEeQT05qUpNUIUryC2bwYguf6FTka375RJakHsfBdByU18w815d
 dHSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJiMf7EtAvyRHi0WvPCHjmEOYRsRbjmGW9Tc8/IoLoCxU3G6DTKPm0gbJfNaPhR5yNgV0lEO78djPl@nongnu.org
X-Gm-Message-State: AOJu0YzhHzwWPdiYgscCVhkWVYYsrycIbTf7Zzd8Kcuq2S+heemz0v5z
 I1pRGSRZ9e3G+mMVPaKEoOyYo7sJUsTJJ+atrRKHGXR9pMozQb+/iWgWUkWhRSGoyNI=
X-Gm-Gg: ASbGncuQpzc3/szX8MGyubRl5aA49enxCgr2HTRa6pu/5guEVJhyGAtTOK1drd33o72
 SIICDO0hxV+pYPCowxQgacCJggH5RHa8fXeUqZt7G9D1uM1OM0P4TmLF/M/pREZGCAWP07u/VSC
 LjAUteHl9kF2uK1Kuy4E4pjO1Aazbr0Z7b/7tGuCk9eMOziIxaGMvgyMRbAsYFH2Hb7BYBD9q84
 AQdBgPD1fYrHjhr2Sr9uuiFEh9bOfyrhXFaDSJtTw3b/A26g5Vuz8pJgfhUYwQAnPaDf0KqVqdz
 OIkYwp+yqsOFhU38M8rNhr7mQOyJgtw4N1Aqhz3wKDLzYLT6Kr2Rf0CXcYwXC3dkjF9+TuhvAsB
 bZDY4xS+VvN3WrVWlvgCn9eZHJ7yAMaE8Tbwl96B3USwcLvGSwG0Gor02vzk3cdIOdfE=
X-Google-Smtp-Source: AGHT+IGmwPKj+NIB4ibRpFo+qrVCUgx3VQ4yjuv37nyVsu4JyUVD6hIv0tXX3cpri6qsihD+ULfZJw==
X-Received: by 2002:a17:903:298f:b0:24c:9c29:c9d1 with SMTP id
 d9443c01a7336-24c9c29cca0mr24237415ad.59.1756908196477; 
 Wed, 03 Sep 2025 07:03:16 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b14e1b097sm50720545ad.21.2025.09.03.07.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 07:03:16 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v3 0/3] Add Zvqdotq support
Date: Wed,  3 Sep 2025 22:03:05 +0800
Message-ID: <20250903140308.1705751-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62b.google.com
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

This patch series adds Zvqdotq support.

The isa spec of Zvqdotq extension is not ratified yet, so this patch series
is based on the latest draft of the spec (v0.0.2) and make the Zvqdotq
extension as an experimental extension.

The draft of the Zvqdotq isa spec:
https://github.com/riscv/riscv-dot-product

v3:
* Fix casting and simplify vs1/vs2 access (Thanks for Richard Henderson's
  suggestion)

v2:
* Remove unnecessary variable and mask (Thanks for Richard Henderson's
  suggestion)

Max Chou (3):
  target/riscv: Add Zvqdotq cfg property
  target/riscv: rvv: Add Zvqdotq support
  target/riscv: Expose Zvqdotq extension as a cpu property

 target/riscv/cpu.c                            |  2 +
 target/riscv/cpu_cfg_fields.h.inc             |  1 +
 target/riscv/helper.h                         | 10 +++
 target/riscv/insn32.decode                    |  9 +++
 target/riscv/insn_trans/trans_rvzvqdotq.c.inc | 61 +++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c                    |  5 ++
 target/riscv/translate.c                      |  1 +
 target/riscv/vector_helper.c                  | 57 +++++++++++++++++
 8 files changed, 146 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvqdotq.c.inc

--
2.39.3


