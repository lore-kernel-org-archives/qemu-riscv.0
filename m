Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44718C02190
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 14:45:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1td9J7-000195-Fe; Wed, 29 Jan 2025 09:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1td9J5-00015P-2d
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2025 09:44:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1td9J3-0001Qw-3h
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2025 09:44:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso47187935e9.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Jan 2025 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1738161879; x=1738766679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ca02c4HTyov26OWTopwnjJQjAi+Im0reN1N4mz+OyIs=;
 b=O28WJEfFHnYVjvfEyHyPTlRrvy1qEv1Tjm83CC8Mm53i52dbAHSgG/40fUT+MQfDrB
 d0kpgqHjscXMuUwCKeyyUKwHZjx4y6zn9N0hdYZZNDp9fV81jbYbuEC2K0CZRoaRc4yp
 flozJQHObw8WZGeahNhwYygVTFa0RN2B2KCHSdpg4i98R2+0YK+ah3DZGe4hVlPUqiTp
 f+7XzHqQza1D0WpbiW+Q5GS7iZFrrASYu1ZpAkdnpkL2IQt9vcIwr/Ryu2J8mgm5z/+o
 FK/ODSWvSaosEPg/BbaEP4on4aXsl88Kqemg64kEfddKLvz+Xf2kC6xVJ2eIDToQd2qL
 0Qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738161879; x=1738766679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ca02c4HTyov26OWTopwnjJQjAi+Im0reN1N4mz+OyIs=;
 b=OULn1lm/HD5DfWbrfLSejSFadj1pDzVy0HzTIMHkuWm8L4r1OTkpOLoGmZsnZXQIwA
 bDF6zVruFPtOVC1Ucwjfe3zmUujjHLeKQ+nC6A0O5pDpmZzfwoHACnZxPBVtFak3tTVj
 vYAG0mmb9MlLH8MNupk0dOwyLleNJ7CeNHfWOkxbXLWPjE1B3GQO7vNnpLHnaHwM4Xq8
 nZVZZ+Fz/jIC/Wj+/oIHhCNvIgn0uoEgt6+9mxGR9bSZ647RjVkb1uEwidD4pDhiV909
 y6l4KKPZR9M2OPgaoZlsKYOO0J7cWHpQxn0mvmMjQyAbMZNLHNuWBEE98cVsUojQO0QR
 ga2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2hrLLQXZPhWLC2iyqSTyUiPFpG07niXdF8ZnjFa5NexnnqgN7seIiQ+mITkz7ZShSBOgRN97almCw@nongnu.org
X-Gm-Message-State: AOJu0YxWXmRFovRya60ODjcSndOL4zBbdB4PWA3brInGHBGQ/8YZsrFM
 dVRxvlnKw4Z72yo2zB/wLx1Tg+Y+dNDhHRJD+BqZGKZLh/QQckBebZQ1jnd4kYw=
X-Gm-Gg: ASbGncv3Hn3MybsD/0sccSjt2mTRHkjB5DlRBhO3Tt884xJk9GHGTTw2H+wUGEzOVdK
 8u5/yUFcHzw1dG4YwW1TVtI0B/YaB52fEpGjEQSG+1PjmMV7onODxstjYQBE9z7pl+Z7OiOguzo
 jypQ/OH9WNJxrFOre5MMA87BPEFSctV3vmfRyc5WQAd2LYszD0+pfN8HBeQHB+kYDykc4vfDXop
 92uQCeb6t6qwJ4yDIsxB4McCvCUFiYNjs6tGtgY+pXeTkU2aieroFD6iqM1OeilM0NgDplsLyQm
 TdFqgWzkZruyqNYOsbeGlCaHVIoplchJjPS1U4fuilP1D7f6IQWd1tyW
X-Google-Smtp-Source: AGHT+IF/s1UIWbzRIkUXnMdAp9m6tetxuwrKb5P+HtZ24GxHS7BmY/GExsWu6A7RoIZHdgGfrMeBig==
X-Received: by 2002:a05:600c:470e:b0:431:52f5:f48d with SMTP id
 5b1f17b1804b1-438dc436f30mr31159225e9.31.1738161878706; 
 Wed, 29 Jan 2025 06:44:38 -0800 (PST)
Received: from paolo-laptop-amd.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc51df6sm24665255e9.38.2025.01.29.06.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 06:44:38 -0800 (PST)
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
Subject: [RFC 0/1 v1] target/riscv: optimize the memory probing for vector
 fault-only-first loads.
Date: Wed, 29 Jan 2025 14:44:34 +0000
Message-ID: <20250129144435.82451-1-paolo.savini@embecosm.com>
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

This patch aims at optimizing the helper function that emulates the
fault-only-first load instructions of the RISC-V vector extension.

The current patch removes redundant memory probing from the common execution
path where we don't get exceptions.
The previous version of this emulation always probed the memory with an
element-wise loop over the memory area covered by the load operation and updated
the vl parameter with the element index causing the exception (if any exception
happened).

In this patch we do a probe of the whole memory area covered by the load
instruction and only if a flag other than a watchpoint flag is raised we do
the element-wise probing to find the index of the element causing the exception.

As stated in the standard we don't change vl for watchpoints otherwise the
debug watchpoint events might be lost.

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

