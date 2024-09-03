Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E9CD3430
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 06:15:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slMo4-0004We-Qn; Tue, 03 Sep 2024 02:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1slMo2-0004UD-Er
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 02:14:22 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1slMo0-0002Dy-Ac
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 02:14:22 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7141e20e31cso4037385b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 02 Sep 2024 23:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1725344057; x=1725948857; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BsDUiz5IMMsh8VBD+lmtXUJuv3SkFc/yhWliEOAa+Bg=;
 b=aqgYWDSdMQoq60ZG4JrN+1aUVmMP++2lxbqhbjkkJS3cEg3YwtaVcbXmfUge2zDVan
 XubWqd2ulpGbk1H/MSohMDxeOUqoIinhAcHKTQVvjM3/aexYWHiew/vRU3k45qKSoV8g
 yBsiUiARvtsgz7DNwGmqLwiY+myUte2GIE3u5JKPmDbmRUe1mxlS/ZH1d9yZkpFhtrfq
 /t3t4vxp1bUquklx3q1tBKO6k3tsZ050tdSScQ0dBf7ulggG5NTOx6tBFVVCNC2mBgRg
 Y96823/9lx0ygxWfhRP4KWzsNHRMq4AKqrWYICZUsyLbqCLSDKoLVCGof9jvVdFXTEJp
 i4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725344057; x=1725948857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BsDUiz5IMMsh8VBD+lmtXUJuv3SkFc/yhWliEOAa+Bg=;
 b=MOOqpUOYEmepKWPqok+ZeRUFPA3MZQQfOR+HjhBOaoQkNJhPqNuVWq6/QTG37mEhmI
 aJIySRs8Jv2ZaLDRczplN7MI5s/dpYV4+3tc1s2L93bUPnApnNHO6gGCUz144RtsrRRp
 i2Q7PslumZsYEF0H3WtP3QKft3SAYkAng0wTuVm24GD5cSmFhs5Oig/sHi4j0z0tFJt8
 ySz7FRh6Tn1oiSKCHqwcG5iJIJ9WZXYuvDVl3qEAl8LH+qKLCxjHSV6qS7bfqTOhyrZM
 UqyFTa/kpxGIjuVipwqBfVi7OY0l672MESCahdh3878yIlsVSk4LOiJZ12k33ztmHRFB
 YiWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW1217HbKjkG/R+u7u6RL7bzMrqIapAOBbORizbBgjVfusm4ApVFjqtlLqJYOt5oLr7E7wBU+YKY06@nongnu.org
X-Gm-Message-State: AOJu0YzuTKZaQdrlddpAlQ7zyVb+OPA4TmmYmVc6kyVyT3LfNguAk0o0
 sp+X8iSSQQ9t7fiVh13eRbP188hnmkmphxxDgdatNpHgmQaY6nMcPm+iGnsSqpE=
X-Google-Smtp-Source: AGHT+IHkML8FKJRpnsyFLoo9i6OCuL0pw59U/73eDl4IqhJ1mgtlhkxpfPAsbigcOTPTw/kkNho//g==
X-Received: by 2002:a05:6a20:3d88:b0:1ce:f588:28b0 with SMTP id
 adf61e73a8af0-1cef5882b1dmr3363876637.13.1725344057562; 
 Mon, 02 Sep 2024 23:14:17 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20524c16145sm60467145ad.98.2024.09.02.23.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 23:14:16 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH 0/5] Introduce svukte ISA extension
Date: Tue,  3 Sep 2024 14:17:52 +0800
Message-Id: <20240903061757.1114957-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x429.google.com
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

Refer to the draft of svukte extension from:
https://github.com/riscv/riscv-isa-manual/pull/1564

Svukte provides a means to make user-mode accesses to supervisor memory
raise page faults in constant time, mitigating attacks that attempt to
discover the supervisor software's address-space layout.

base-commit: 8d0a03f689bff16c93df311fdd724c2736d28556

* Add svukte extension

Fea.Wang (5):
  target/riscv: Add svukte extension capability variable
  target/riscv: Support senvcfg[UKTE] bit when svukte extension is
    enabled
  target/riscv: Support hstatus[HUKTE] bit when svukte extension is
    enabled
  target/riscv: Check memory access to meet svuket rule
  target/riscv: Expose svukte ISA extension

 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu_bits.h   |  2 ++
 target/riscv/cpu_cfg.h    |  1 +
 target/riscv/cpu_helper.c | 55 +++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c        |  7 +++++
 5 files changed, 67 insertions(+)

-- 
2.34.1


