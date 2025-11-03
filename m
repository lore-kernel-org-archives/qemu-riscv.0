Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D0DCCF9FE
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 03:38:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vFlOA-00064D-Fd; Sun, 02 Nov 2025 22:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vFlNv-00062g-GD
 for qemu-riscv@nongnu.org; Sun, 02 Nov 2025 22:37:37 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vFlNs-0000Cp-Cc
 for qemu-riscv@nongnu.org; Sun, 02 Nov 2025 22:37:35 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-340299fe579so4112209a91.2
 for <qemu-riscv@nongnu.org>; Sun, 02 Nov 2025 19:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762141049; x=1762745849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=db+Ekq9ZlQ6OwPFUrOw9iSwB7ZjdaVlv1TkkdVkABH8=;
 b=HizgSWAutZE+TSnCwbR0Ma3okv6dMBLymPDdoJlHyO3bTQIC7K5jMoa4W+T+WMkh1q
 aMxDrmX+G6CjxBNQKCwDXYiwR4lsIcC5JTz0+zhVty1dnqdIT2VhFTFl5+6t0l0ltp3K
 uJxvpBorZ0W06Vz7rDMBHi1SI9CCg+SoDKK97NWxOuMsa5S4hafIlUTthKAfyr89ieZx
 Ylc4nXB4dw1fcgLhKmW5EMaN/uJXi313kZ0TjDR4rSqBXgHSr3zgnA/VkClHty5pOLgC
 x05uTSjKZaRdWPDEfvYXXMvLCwQgYyxZcJ9uf3lnCXVzbjRIe7kmOArTNFm32sifE/Kf
 k39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762141049; x=1762745849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=db+Ekq9ZlQ6OwPFUrOw9iSwB7ZjdaVlv1TkkdVkABH8=;
 b=HguKvvtbUwoCXDpvSaaGiqdY6gGxoQiF8UtKADKicYuZWQLI87Wizld7juEmi0Palo
 ebtY++tbot9cLgTv7o8x/dTzHGspf0Ft4+A2t8pbnLMUT+ixDtXr1QtLeUwlOVY9yhHX
 ZETX0YTHDdU1jfc43SQYbddxHBY6DtqFbAUwJgiEolHOfGC79nDNBr79MfjP9y2X3o63
 sAwbNMnNobLTg590YtYeikYSTqgIr5Wjz5UoxnQfelqWTg2lIrEN7oj69DLKIPywsErv
 W3DaCqM/sxrpRBH5t3orOvq6O/c5kOLoKKuy+xE4ZKqRXdY78AyoRz8BeKzTxlAmHNtN
 XCbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ryLXWSoSL//Neh16/5tfj7sGPDiOB1CmeChXEcWH4Nj2mQesSaDhY37PB/Ac5J5Tn/1d2Lcr/Wjw@nongnu.org
X-Gm-Message-State: AOJu0YzB3bw/MXX5K3qZuss7l5gdkjdODeBlOWTPhl+GT6J2FI2Dic3G
 2biAGurC4J3uJlJcjZ49Levr/5LOHov/TnQOZJdsi8BaFB9KxDQZJb7o
X-Gm-Gg: ASbGncswibCat5h1UObk0fji9pjY56cIf92xtDcLWtUYJXhPOGms4btJmXtdAFlu0RQ
 5JJ79m61Ht9tP7s+EIDIJhezPc0MfjTQRuTu30tn3nMNd7tPWIkeBceDcZ4v29YSGWM02rgXwWk
 6tSeVOjg15gCQz1XH7pO92zdhOYI+gR7I1eUaEPojcYTptZpUXI53LFFbSaMWXUECX+DpeStE4Y
 RotAfjJr2u61qQCRa7x+/rm9lS1CUYa/chRp+3l+OQq48SWbg8TJHviCEl2shBDK5wQdY0cze9M
 Gv6si5loYsPF8st4K+tC8m7bXHxrWQGmoqYwV152j6iylg4FNHys4fDhwhAZ3XvoP6aik1FB0Gx
 2mO4fpX3B/ClUchCdcdN6X4Qs+x2eNvFvLHoN9OrB1zLD24F6qi24l49U3WUKiUD8Sbo8vdW1gY
 iGLDwye2QNRy6LucVb6nWyLCU7gVjFBRtanRK3rh15f5GzTf69rQBNRc/gx16D5FHwpK7eWSW0Q
 imm3aMe9rAdy0epgeaUj7gEZj6RSA==
X-Google-Smtp-Source: AGHT+IHsvlUHpKRjTGM/vIv3BOmn5V6UGnSPZizxxUaD3UT5t+oMKQJMSVRKf4L8VyNB/NLRwF00Kw==
X-Received: by 2002:a17:90b:2583:b0:340:7972:a617 with SMTP id
 98e67ed59e1d1-3408306e83fmr13999548a91.18.1762141049101; 
 Sun, 02 Nov 2025 19:37:29 -0800 (PST)
Received: from toolbx.alistair23.me
 (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net.
 [2403:580b:97e8:0:82ce:f179:8a79:69f4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-340a460ed24sm7939641a91.16.2025.11.02.19.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 19:37:28 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: qemu-devel@nongnu.org, anjo@rev.ng, philmd@linaro.org, palmer@dabbelt.com,
 dbarboza@ventanamicro.com, atishp@rivosinc.com
Cc: alistair23@gmail.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 0/8] single-binary: Make riscv cpu.h target partially
 independent
Date: Mon,  3 Nov 2025 13:37:05 +1000
Message-ID: <20251103033713.904455-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

This is the first 8 patches (one of which has been removed) from Anton's
series [1], plus an extra cleanup patch at the end.

This addresses the comments I had about Anton's changes to
riscv_pmu_ctr_get_fixed_counters_val().

Besides my new patch and removing a patch the actual changes are
limited, so I have kept all of the Reviewed-by tags.

1: https://patchew.org/QEMU/20251027181831.27016-1-anjo@rev.ng/

Alistair Francis (1):
  target/riscv: Remove upper_half from
    riscv_pmu_ctr_get_fixed_counters_val

Anton Johansson (7):
  target/riscv: Fix size of trivial CPUArchState fields
  target/riscv: Fix size of mhartid
  target/riscv: Bugfix make bit 62 read-only 0 for sireg* cfg CSR read
  target/riscv: Combine mhpmevent and mhpmeventh
  target/riscv: Combine mcyclecfg and mcyclecfgh
  target/riscv: Combine minstretcfg and minstretcfgh
  target/riscv: Combine mhpmcounter and mhpmcounterh

 target/riscv/cpu.h         | 106 +++++++++---------
 target/riscv/cpu_helper.c  |   2 +-
 target/riscv/csr.c         | 221 ++++++++++++++++---------------------
 target/riscv/machine.c     |  99 ++++++++---------
 target/riscv/pmu.c         | 150 ++++++-------------------
 target/riscv/tcg/tcg-cpu.c |   2 +-
 6 files changed, 227 insertions(+), 353 deletions(-)

-- 
2.51.1


