Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BDEC369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 09:45:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8FcK-0007cG-LP; Fri, 25 Apr 2025 05:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1u8FcF-0007Ue-Ml
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 05:45:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1u8FcD-00014C-Po
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 05:45:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ff784dc055so1915784a91.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1745574299; x=1746179099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xc6D1Kcyavm6Zaf+Pjisy1B0+BYE6/AfMyJmDB+WDd8=;
 b=ctLS04J/tNB1JSVTqmrFu3B/iTi987TJefI6AQisFu87BNyKxwownm1JyXgqvtRt5p
 zGhyg4xVmxIY2kpPSmr+roWnLjPiyQ/4Ft+tS6s1wQl+2NfOPjTrfGbVF0/HRntzDP7B
 EBT34MjwUXaIzj4gZm5O6IBm1+xCCqz4FlOYy2VWiOgCjPSgzVyqIbfJHcSl+5KM60ZX
 f592ZtkPKAKFt/lJqr/YmxtQhcMV9sXjeoCxyhhLC397Jiu8X5wpvo2ieGNlQC9OfQze
 u/PBViEJhKOG3pr56oOHfrZtGRvXuIp/b9ea9gdu4T561AeDV2KzdRgtQYuY3tXJddTL
 230Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574299; x=1746179099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xc6D1Kcyavm6Zaf+Pjisy1B0+BYE6/AfMyJmDB+WDd8=;
 b=lv+S6C+gExTQ1TbI7NuxlPOVxUtYxadqgattvQ13Ipkg4102Ft8zEx+Upp+UmEjnhc
 knjF/BecdpK8vvOC1jJL5cRgkZcWWHwawnp6oicIrAcHZPiaP/1CP6EcvFYNb9f+ra9F
 Wi4CnVJSX/enT73aFgcnaMRXsgWKenCf9FaUXV2ZwroYR+9DPLElZbiUL+sX0HPTqLJE
 +mTa4CPo4rmxHkHHISKLJkjPdDPuAja8USuqdOnBV7sYUXyhaW/q8TBIDdxFPgOJfPPq
 Y1s94Z46eSM6fPwJG+O9nQdLURTXIrM9uaPlR4rZwMrju7MjHEF+hhWcXsyUdNOIn2ch
 UObA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKbS9SzFGSzmi5X2MW9ewp0KveTp4bmFtjGHXKNo6RP9v249Xx1pXtsjWrLlyyZ1IorWax7JDZ8ozZ@nongnu.org
X-Gm-Message-State: AOJu0Ywdaz7HTCPwfa45kp3pfNwxLoBFvAL61mSG4EhQMFuGO7X95B59
 fuH0k9mB4AZW0yF5qC6gmvocMZHw6Ww1kQMoIi5S6zJ+e5mFD+QpFY0CTH3ZTL8=
X-Gm-Gg: ASbGncuOH6r7bwfU37adfvAGIvxmcOcVSPUmAHYdwI542hSijr+gan+SePccUSBQ/q+
 Oh9hni2qQ+q7PxDoXJXNYpsAGgezW+g4QL/aEyRnuJT2Plc6DC0FiGZ++D6JasspWs8pgtJJWYv
 T/cq/i9qOG/hJ4z2E8+QzjaB83gQCSbIU98p7Sdtpr42x0meDFjW4ug/08CwIyBMYOaXUVcKfvc
 80YpFxsri5lVEyZGDEt/3jBK5E68ivj6cfROSSpVDG9Qt2q97pbLEr/z+o2/Xv76EOUa1trqFxx
 M5YnNgkKnvYphSVoHdcU8NfMddX4C9xWNN9t1C3K64rWXAxMDdrkbHcjhhLp8z295VSp2TOk0Cy
 fFg0qYxoeIg==
X-Google-Smtp-Source: AGHT+IFZ2PikPOrV/Ibr3Rdbq5BcXSNgT1aNv+f4WyRVsPTyjcPpL+ufEpedk2UwErhnRLUFqcFCsQ==
X-Received: by 2002:a17:90b:524f:b0:2ff:4e90:3c55 with SMTP id
 98e67ed59e1d1-309f7e67d73mr2772386a91.27.1745574299444; 
 Fri, 25 Apr 2025 02:44:59 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.228.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f27e22dasm2288826a91.17.2025.04.25.02.44.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Apr 2025 02:44:59 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v2 0/2] Extend and configure PMP region count 
Date: Fri, 25 Apr 2025 17:44:50 +0800
Message-ID: <20250425094452.17013-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=jay.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The first patch extends the number of PMP regions supported up to 64,
following the RISC-V Privileged Specification (version >1.12), where
RV32 can have up to 64 PMP regions configured through 16 CSRs.

The second patch makes the PMP region count configurable via a new
CPU parameter `num-pmp-regions`. This allows platforms to adjust
the number of PMP regions without relying on a fixed default value.
If unspecified, the default remains 16 to preserve compatibility.

change log: 
  V2:
  * Rebase on riscv-to-apply.next

Jay Chang (2):
  target/riscv: Extend PMP region up to 64
  target/riscv: Make PMP region count configurable

 target/riscv/cpu.c                |  54 ++++++++++++-
 target/riscv/cpu.h                |   2 +-
 target/riscv/cpu_bits.h           |  60 ++++++++++++++
 target/riscv/cpu_cfg_fields.h.inc |   1 +
 target/riscv/csr.c                | 129 +++++++++++++++++++++++++++++-
 target/riscv/machine.c            |   3 +-
 target/riscv/pmp.c                |  28 ++++---
 7 files changed, 261 insertions(+), 16 deletions(-)

-- 
2.48.1


