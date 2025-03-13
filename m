Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632DEC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:40:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tshqi-0006it-Kx; Thu, 13 Mar 2025 08:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tshqd-0006hy-Qt
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:39:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tshqX-0002zb-3N
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 08:39:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso8149635e9.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1741869569; x=1742474369; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aAvyRn48a7ZTQotFDe13Sewn7nxKlzZEGo5p22G6j8M=;
 b=GdAveYTCCWTMC9iw85Vi1dhYqZ9WcScVnP2Fx2NCqH3l2i/bq4anEhW8njSIrrGdbt
 CoKcTW6Hk6sWfIUmMMst4gqfQzTo+bnraRWncxJkwsBJEvaqFcYi9OMYZuwTTqnaaUkn
 rdGnhixPPzB2GIL/IF1Alp1jWUZCQEf49fUDHr4zf6i2Xnk7JYdsvNdlvVswwPdLSh8z
 wdgbS+3L6FI3BIlmhTNW/O70Q30xf3S09g9R6n4x8H6fPADDc0Fh9YhY/O4+dz7tkv2j
 JyUScrV8Y8dF+Xgm5ukdmPOdl6U4yEIlQigAQLrIodAq1CLDvon6zqPWibBN29HYHWeX
 VoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741869569; x=1742474369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aAvyRn48a7ZTQotFDe13Sewn7nxKlzZEGo5p22G6j8M=;
 b=PuUsHJRIoykwfFw4we+Mz62lhVrRRb2/NyUdgMQt7MkT7mDY1J2YudvqbXTyYi8m/c
 qwgWEZnR31GVVqmuG4g5GCohH6y7u1UsVZTTJnzyjqf2IdpPOgpxU7TH2EWaL7Kq+ov2
 HFJ98uG8zYFPny8Kq0TAOV7R9m0beDJOYUO3bM4NXo/5ZfzKJvaqFG91lOkAJzQIxeNw
 lxIuWTjUdznUOpLWasAbRHMKjRnNIAROeh6b87EDid4G1kr5E5HK+RDsI06rI9jAwIWB
 XHWE4yRIGj2z6xREepo/lOyZdgA+/pbrtO2nRoqeMbVld/olwshPc8GTeNgVSaaak03U
 M1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIn75j3ZRiSBf5MQCTqpPqZI5i0W2LmvB29fcoTUC8co44Nfa7lFeVuPKyVDhSsi3XhAZLKxObnMkh@nongnu.org
X-Gm-Message-State: AOJu0YwsJE0A+q7jSEkOwz9/3TFsBGP5gJ7VCXK/V9n/7Zg2DRI37/3Z
 yMIx+KZr0DCBPOzNkr93MUntFew7pnIrXlM+Xq+p205o1/9VarxQq6kzohicWp4=
X-Gm-Gg: ASbGnctP5DzGA1CTXPaTz3gca1+8PcTicnEeMqwL38EtYrqIbRmj698YsIubBVHcgl3
 Zv46Jh58lYIkL40A7vj5Wya5dPhkRHFPU/gPMdLlssg6Qgz1zoZoR1V4zxRQ07gICCJmLsoZAiO
 nm84wMcRV55UeorOo01iz2/ZOdKACv/0bCcVxarp2VVaY7ayft8DsYNp7HzLEKEvaMnS3P5KPPg
 jDys18CtgiPSSwYeZo14cicDBpm59JfAwoWtAON5azUN99nfJjv+ToM4vZaomgBVHQHnspvwPub
 8U4jeod86ZvHUIrf97msv52lcJyVZVmWUylSkxxNnQkFknrHLr2V6kh4t046h0H4WZAhsN0YW3G
 szlGrV/djIQ==
X-Google-Smtp-Source: AGHT+IGmmANvKKyvbGmAa8TJmmYHZFqtndRshJVddX40du45pVK7nmKteOcJ/et78r4yIc2tS2fCHA==
X-Received: by 2002:a05:600c:4ed1:b0:43c:e7ae:4bc9 with SMTP id
 5b1f17b1804b1-43ce7ae4df2mr158545335e9.1.1741869568962; 
 Thu, 13 Mar 2025 05:39:28 -0700 (PDT)
Received: from paolo-laptop-amd.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5ccasm52092665e9.26.2025.03.13.05.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 05:39:28 -0700 (PDT)
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
Subject: [PATCH 0/1 v2] [RISC-V/RVV] use a single function to probe memory.
Date: Thu, 13 Mar 2025 12:39:25 +0000
Message-ID: <20250313123926.374878-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Previous version:

- v1: https://lore.kernel.org/all/20250221162036.61521-1-paolo.savini@embecosm.com/

Add reviewer information and rebase on top of riscv-to-apply.next branch.

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
  [RISC-V/RVV] Expand the probe_pages helper function to handle probe
    flags.

 target/riscv/vector_helper.c | 57 +++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 20 deletions(-)

-- 
2.34.1

