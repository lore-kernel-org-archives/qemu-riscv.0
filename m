Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDECC3064D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 18:05:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMtTR-00017e-4y; Thu, 27 Jun 2024 14:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMtTP-00017C-Jm
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 14:03:55 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMtTN-0001LX-SO
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 14:03:55 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70685ab8fb1so3925112b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2024 11:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719511432; x=1720116232; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DxICO0F0UJwA9kf7MHQo5KZWHjxvwUlAc5IoQOIpIPQ=;
 b=YfW1Bm5IFGEc6/qEGvzbAB7+KCNtI5GQRDFBwuJHeW6UzRgwOi1E2PY2sDXkZt+kjN
 Pcbsqf+yf4SyOuLVkqlFeCS8Fa9amEWThIKtXPx4BxB7/kXFjSK4mtt/bTKAqWnXG/xj
 Rs6cQa7ZmzkXZJAyjQmtvbzyFSI7wUoEi6y20yVgAKLHVloFlyqTH6ssu7/HTSvmtBf/
 x784qnzYxO9x0NOdJHW0Fhxcr+/37JA9ywfA3aPvELxc26bHma/GPA6QZtTW7NRQs1hv
 bLyGt8s5AkABsBnoHKK0hIh2V02ejCR/jF5OMlLPZk8uKZKxsZhxVS7TrusibanstEAn
 ZYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719511432; x=1720116232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DxICO0F0UJwA9kf7MHQo5KZWHjxvwUlAc5IoQOIpIPQ=;
 b=dKx5LWX+Qi7Xq3D32jPdbOsZMVCQfyQ4ObmergXn87npIPLSYi6/tmbHvvUWz5GbwS
 7UqS/2XB294e3afhtqvgOHpML4EUYd6tYM5WAoan0mv9z1bS5/BHQXFMqCCWvPjpjSeP
 5y9YU+zcIEw3/taSHyfMJv9O+GG+E4TVFgffGE4k3RfKWhNT4h0W3JMH43HCPyL7yxg8
 G3ylNPmdfWIYXgWdcXztjE+vR1A4zid5t1dpTo4ohUXxDUkj+2zcDbFqsKokZNgyBns9
 z9MXMRzGwqVavAzJNtFTSBfPc4yKVwh9y4u1qb0NMMeNhwGepdJ3jZOYVNV+ikm1fqM9
 nNcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfzs7iYt99FIzTGJiGUmyZD4q2Q4iP9+cdfSFF4eGY2Bjt/YhoMk+955GR3D2Z21mwMw2fzpJRKCaarDCCViZHt7FHsac=
X-Gm-Message-State: AOJu0Yx61ge5JqiiTTxDn+oRHwXmXDNjslrbRWfscr81+3tAsNHD5QBf
 jxBtKOvqp10gA/B3U0bBo5daMevEkj9aaA5OWH3XEDRNi4T4z1BiiKEvJ8uiZz8=
X-Google-Smtp-Source: AGHT+IEYKhu6juYqZWS/IjBBWxmc7Mm7kpR8o+6dr4QCIKxo2aEm9TBOxS7bwAxef7cgk1nOKlYMQQ==
X-Received: by 2002:a05:6a00:2fcc:b0:704:2f65:4996 with SMTP id
 d2e1a72fcca58-706745b45cemr13741508b3a.11.1719511431951; 
 Thu, 27 Jun 2024 11:03:51 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70803ecf764sm2170b3a.106.2024.06.27.11.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:03:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org
Subject: [PATCH 0/3] util: Add cpuinfo support for riscv
Date: Thu, 27 Jun 2024 11:03:47 -0700
Message-Id: <20240627180350.128575-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Do cpu feature detection in util, like other hosts.
Support the OpenBSD ucontext_t.
Support the Linux __riscv_hwprobe syscall.

r~

Richard Henderson (3):
  util/cpuinfo-riscv: Support host/cpuinfo.h for riscv
  util/cpuinfo-riscv: Support OpenBSD signal frame
  util/cpuinfo-riscv: Use linux __riscv_hwprobe syscall

 meson.build                       |   6 ++
 host/include/riscv/host/cpuinfo.h |  23 ++++++
 tcg/riscv/tcg-target.h            |  46 ++++++------
 util/cpuinfo-riscv.c              | 118 ++++++++++++++++++++++++++++++
 tcg/riscv/tcg-target.c.inc        |  84 ++-------------------
 util/meson.build                  |   2 +
 6 files changed, 178 insertions(+), 101 deletions(-)
 create mode 100644 host/include/riscv/host/cpuinfo.h
 create mode 100644 util/cpuinfo-riscv.c

-- 
2.34.1


