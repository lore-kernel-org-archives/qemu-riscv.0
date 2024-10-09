Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB14ECED628
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 23:10:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1syfnp-0006mY-Lz; Wed, 09 Oct 2024 19:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1syfnn-0006lZ-2z
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2024 19:09:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1syfnk-0000gr-Ub
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2024 19:09:06 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2e2887c3c50so302073a91.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Oct 2024 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728515343; x=1729120143;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F4xAck7ZT8Ovl6HOOBp7iHK6etT+iXqunvWzmMhI1cQ=;
 b=zsOLhHj/vzJNKcOak/g5MckDiFFz7R3EQZL4X8ZukepQXtfQQOwqxkAKTWKlyC36K9
 UUXh9N1LUU9W/ybR/CpGJTlLDsQC3JsoQ4KVAKMMV0OwNE+GUI8oVQUzS9SP3jHdfnLh
 Jm+M7XOzc4vrcwJSRWNKyUCJ1SdKacsEDMTQ8BO6GLYfHjRaeZHaRdSA4uYamiijIbf/
 ZtWIcA9daO2n39OgzUQ1Wc7/HAe0ZuG3r3lO5SmAW7MID/tbO7FUHwO0Rgptswh9yTfT
 5XgURxaqq/+WBOLFsvJswnvRfjUzwSoRuJbFa0mnP30dpHmqblY1EJsfX4JHH9y1SEBg
 2WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728515343; x=1729120143;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F4xAck7ZT8Ovl6HOOBp7iHK6etT+iXqunvWzmMhI1cQ=;
 b=q0Okukh6r4CbMlqzRzP53beeju9tXv6EbOyeqWGLSR9IeFKQgYN5IK7vPRYcBATMrf
 nwhsaY+LYON7TLKyYdY+mntkqUj2kd7ZKv33xLoM5tgE8l/rOwNImwm8JNIIdqnM7Xvm
 +Q5sxudB4p7MdivnfrT8qygMVFzueEx8sZUV6lG9gZ9r+sIgWXM2gh4lBrAqXSQwqxIC
 //CRodTZ4djkgjvHcjqMvGaf/BgclMvOhbY1PQKLWDcMq5Pmb+yIAAp5p/LMQ8YDV2Zt
 26ap10dAlb5+dE2uvE/wqIy2VJFXfnicDFFZkkx1s2Ms4NYE3HQm5QGSvo13JN37PNRQ
 /ZoQ==
X-Gm-Message-State: AOJu0Yy9vHJdEUfE1CW9hj1O2velSl7hiCWFpAq5QxQnNysMU9FbZXsf
 IEVSNo3VwcZBTxCLRsdsbqC6D6Mn1OPdUVuLEiIDPx11cb/Wi8K4JizafRUWBoQ=
X-Google-Smtp-Source: AGHT+IFEY75V2HiL37ApCU0lYqmptRWbz1zO3vdKX+/mWGqE5TqAyme8PDdB5BH3X+7bqNPH72/3Vw==
X-Received: by 2002:a17:90b:430f:b0:2e2:bd9a:4ff4 with SMTP id
 98e67ed59e1d1-2e2bd9a5225mr2748289a91.24.1728515343372; 
 Wed, 09 Oct 2024 16:09:03 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2a55f9855sm2271902a91.2.2024.10.09.16.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 16:09:03 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH RFC 00/10] Allow platform specific PMU event encoding
Date: Wed, 09 Oct 2024 16:08:58 -0700
Message-Id: <20241009-pmu_event_machine-v1-0-dcbd7a60e3ba@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAoNB2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwML3YLc0vjUstS8kvjcxOSMzLxU3SQL82RTC0MDk1QzQyWgvoKi1LT
 MCrCZ0UpBbs5KsbW1AHjGRytoAAAA
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: alexei.filippov@syntacore.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently, the pmu implementation is virt machine specific that
implements the SBI PMU encodings. In the future, individual machines
would want to implement their own custom event encodings as there
is no standard event encoding defined by the ISA. There is a performance
events TG which is working on defining standard set of events but not
encodings. That allows flexibility for platforms to choose whatever
encoding scheme they want. However, that means the generic pmu code
should be flexible enough to allow that in Qemu as well.

This series aims to solve that problem by first disassociating the
common pmu implementation and event encoding. The event encoding is
specific to a platform and should be defined in the platform specific
machine or cpu implementation. The newly defined callbacks can be invoked
from machine specific cpu implementation or machine code itself depending
on the requirement.

The first 5 patches in the series are generic improvements and cleanups
where as the last 5 actually implements the disassociation for the virt
machine. The current series can also be found at[2].

I recently found that Alexei has done a similar effort for SiFive FU740[1]
but the implementation differs from this one based on how the cpu callbacks
are invoked. For example, Alexei's series implements a single callback for
all the events and has defined machine specific counter read/write callbacks.
However, it just defaults to get_ticks() for every event. IMO, that is
confusing to the users unless we can actually emulate more generic events or
machine specific events.

I have separate callbacks for each type of events that we currently support
in Qemu (cycle, instruction, TLB events). Separate callbacks seems a better
approach to avoid ambiguity as we have very limited event capability in qemu.
I am open to converging them to one callback as well if we think we will
be extending set of events in the future.

Once we converge on the approaches, we can consolidate the patches
so that both SiFive FU740 and virt machine can use the same abstraction.

Cc: alexei.filippov@syntacore.com

[1] https://lore.kernel.org/all/20240910174747.148141-1-alexei.filippov@syntacore.com/T/
[2] https://github.com/atishp04/qemu/tree/b4/pmu_event_machine

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (10):
      target/riscv: Fix the hpmevent mask
      target/riscv: Introduce helper functions for pmu hashtable lookup
      target/riscv: Protect the hashtable modifications with a lock
      target/riscv: Use uint64 instead of uint as key
      target/riscv: Rename the PMU events
      target/riscv: Define PMU event related structures
      hw/riscv/virt.c : Disassociate virt PMU events
      target/riscv: Update event mapping hashtable for invalid events
      target/riscv : Use the new tlb fill event functions
      hw/riscv/virt.c: Generate the PMU node from the machine

 hw/riscv/virt.c           | 102 +++++++++++++++++++++++-
 target/riscv/cpu.h        |  52 ++++++++++--
 target/riscv/cpu_bits.h   |   4 +-
 target/riscv/cpu_helper.c |  21 ++---
 target/riscv/pmu.c        | 198 +++++++++++++++++++++-------------------------
 target/riscv/pmu.h        |   3 +-
 6 files changed, 246 insertions(+), 134 deletions(-)
---
base-commit: 19a9809808a51291008f72d051d0f9b3499fc223
change-id: 20241008-pmu_event_machine-b87c58104e61
--
Regards,
Atish patra


