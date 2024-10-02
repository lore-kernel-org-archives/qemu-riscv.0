Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C36CF6D2C
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 13:58:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1svzr9-0007JF-QZ; Wed, 02 Oct 2024 09:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1svzqv-0007Eo-UL
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2024 09:57:17 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1svzqt-0003Wa-JD
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2024 09:57:17 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53997328633so4801879e87.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Oct 2024 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1727877432; x=1728482232; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W2qnYyllQATbKabq15eZV8KBacEwjWblY8OQUHuJ92s=;
 b=Yk+Ho58GTr9HzpKLb31aWYz3AY3RXj/65hfDkepjQ4laja7gsKfh7ahEE0TVBO39Um
 Um6hDDKdWdkeyhIgL9egPeALz1Z80RuJH+AJnIhXyXaJWIsRaWYUV2WXxVJX+6kiKB9F
 TB0mno4RhaaqE6Iv3YfmpfU2vPf9zFFeD1++fAqri5bDJTpYjl2tSFGxj2+hbJWDRcoJ
 kmSMps1zyfh1UpXhupJa5yvFW9pLmY/H9fSLgdDQVbrjxHef30C3zro8vfhCvl6sYBGz
 opoFQ6pPekNk5uV/s473WPI+QLhWbwKCaT5yPDK7k4+RDK4lf0G3u7fLV7M2yO99ZqGX
 c7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727877432; x=1728482232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W2qnYyllQATbKabq15eZV8KBacEwjWblY8OQUHuJ92s=;
 b=T7EP3S1zbM3bbdad50lXj+cj9/tfTL1ANjqWqJ2jh7kHqKigvIDV87xucfJzvAHMfG
 +pWkKCdQvH61Y5c0f/vUBaw7W1fXnErCPsRl27omckUX/w2Cw4owMsVpF8HDDox/vSEU
 KMFIOIb/AZhyaitE7pnmKHN36so9R3iZthXfK+yKrcVESHdjCqME4YKfR7pQYFvOnTVO
 3UM97vxVwkubjiDrcvGs9UJ6du/dqjo3PuAw5WjeRBqk5mAFjlojfH7MfPKMD12LDie1
 SYoENQHUkLo/bgeMRQtfidKpVFWwAna+8EM6+lXEw8xX0REFuUKokHMgrzI7yS0gy30d
 HnSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/qvljcmqYqhj8CnTePX5q6zCWLDr0oYvRHQqP1lJw76UykQLH5UQ+MKmmhbMZZGq3sG9cVG2FIkWs@nongnu.org
X-Gm-Message-State: AOJu0YxewH3YnDo3NK0hVvLXhn/rMkubESRdn3WYiPgn4KsMjzlJQwiF
 bmGZbBFW+DcoPL/tUpP9uCMQAQppKucbLKqLA77s3xZrAWn60hh0njl94RMNUZA=
X-Google-Smtp-Source: AGHT+IGLBequ+PB+kzbbB5UlSsfsWZ6bUSYQUpdeza6js8WJKS38eNl+Vh61jFmqnJrWTaiSq2Xtgw==
X-Received: by 2002:a05:6512:b9c:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-539a067ae19mr3027015e87.28.1727877431690; 
 Wed, 02 Oct 2024 06:57:11 -0700 (PDT)
Received: from paolo-laptop-amd.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm869975266b.222.2024.10.02.06.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 06:57:11 -0700 (PDT)
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
 Max Chou <max.chou@sifive.com>
Subject: [RFC v2 0/2] target/riscv: use a simplified loop to emulate rvv
 loads/stores only in user mode.
Date: Wed,  2 Oct 2024 14:57:06 +0100
Message-ID: <20241002135708.99146-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=paolo.savini@embecosm.com; helo=mail-lf1-x12d.google.com
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

The new version of the patch addresses the suggestion given by Richard Handerson
here:

https://patchew.org/QEMU/20240717153040.11073-1-paolo.savini@embecosm.com/20240717153040.11073-2-paolo.savini@embecosm.com/#aff5f930-d291-4ff5-8f24-53291059d59a@linaro.org

about the ineffectiveness of the optimization of the load/store loop for small
vector and data sizes when QEMU is in system mode.

Changes:
- Wrap the optimization of simple RISC-V vector unit-stride loads and stores into a user mode configuration directive.

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

Helene CHELIN (1):
  target/riscv: rvv: reduce the overhead for simple RISC-V vector
    unit-stride loads and stores

Paolo Savini (1):
  target/riscv: use a simplified loop to emulate rvv loads/stores only in user mode.

 target/riscv/vector_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1


