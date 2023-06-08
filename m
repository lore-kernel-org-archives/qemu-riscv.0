Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D179C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 07:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q79zO-0002Dx-Tw; Thu, 08 Jun 2023 03:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q79zN-0002DV-Qp
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 03:23:21 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q79zM-0006b3-3c
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 03:23:21 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso270666fac.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686208998; x=1688800998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=21sD9xBO29Iew+5KewPYqM37mbZoTt9Gaa6v+lbuR9o=;
 b=XjAae7aFTKT+d4k5uFRIPQJvI2xokIRCwcWDKXzN+EEE7rErQyqgTBOcTD8Ajo18aA
 o+oe5gzNaKcRlMPITazgdST+l57TuP4rfCh0cxd8VLqkmaLiXwaa9q/f+LEKF8q80B3v
 YAgJFKKl0B/gfyImZZ8j0BqEotbUGYGuFX/T/aPZDfIDKZ0Iahz+8cSK8Inc1+5/ixWC
 LTQpX+bL+PcrCfnK0z40RSQEaseqz5QnoRvAoBZunauTWX0PJd9Xlq/BfEPbZcaqeRhe
 B+ExmiK+/LTKynnybbYWmj3dwz/SIxCV/AlkkztaP/XIlulpWYoN/26m8nWRYfIGBu8Y
 x6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686208998; x=1688800998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=21sD9xBO29Iew+5KewPYqM37mbZoTt9Gaa6v+lbuR9o=;
 b=Z6C3Dq2ROjxfG7IFKaPh5JvlMyDsJjprkT8gUCQypA1DGd5WFBG+o8wuDamhJQCVVG
 +uLGPvFQN056qu0bbH6e1TJIWWiD23Vo3TdO4WDSa2jiZCBhP4y4qPa1qYtd3KnFgIOK
 LgTOZOLuKdFar5ajqc7bTKLVH5uJw5oKMudqDia+ELEdMjLXqorTAwSK4j/iN3Ns5Z8r
 DsepSgumFNPWFi54j/A1DSlVfTtgeZQw9WNkHv17SQdbyhY9PXComY9zu80crhP4D6R/
 zCNBDd4ABSzOAHmRPWiP70TxsIOyu3rh9j73ak54Z02//m10jS/Uj3fc+hxdXyZiyAZO
 u51Q==
X-Gm-Message-State: AC+VfDyuiwLWHjLjgQTcKYhP+5RyQyOFqnwAss6Urb5BSooHuFJMUYbr
 534cZSSU6oIRlzFmNu7lkstttg==
X-Google-Smtp-Source: ACHHUZ7GkFwGAogvwdB21lC9iPhS05GOVOeJ8sLCdEDGrwtzJ+BI4mw1DM5oJbZLstf9zh9WkO0X3Q==
X-Received: by 2002:a05:6870:44c5:b0:19f:698f:56a1 with SMTP id
 t5-20020a05687044c500b0019f698f56a1mr7118679oai.15.1686208998466; 
 Thu, 08 Jun 2023 00:23:18 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 x144-20020a4a4196000000b0051134f333d3sm274293ooa.16.2023.06.08.00.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 00:23:18 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v4 0/4] target/riscv: Add Smrnmi support.
Date: Thu,  8 Jun 2023 00:23:10 -0700
Message-Id: <20230608072314.3561109-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=tommy.wu@sifive.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset added support for Smrnmi Extension in RISC-V.

There are four new CSRs and one new instruction added to allow NMI to be
resumable in RISC-V, which are:

=============================================================
  * mnscratch (0x740)
  * mnepc     (0x741)
  * mncause   (0x742)
  * mnstatus  (0x744)
=============================================================
  * mnret: To return from RNMI interrupt/exception handler.
=============================================================

RNMI also has higher priority than any other interrupts or exceptions
and cannot be disabled by software.

RNMI may be used to route to other devices such as Bus Error Unit or
Watchdog Timer in the future.

The interrupt/exception trap handler addresses of RNMI are
implementation defined.

Changelog:

v4 
* Fix some coding style issues.
( Thank Daniel for the suggestions. )

v3
* Update to the newest version of Smrnmi extension specification.

v2
  * split up the series into more commits for convenience of review.
  * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.

Tommy Wu (4):
  target/riscv: Add Smrnmi cpu extension.
  target/riscv: Add Smrnmi CSRs.
  target/riscv: Handle Smrnmi interrupt and exception.
  target/riscv: Add Smrnmi mnret instruction.

 hw/riscv/riscv_hart.c                         | 21 +++++
 include/hw/riscv/riscv_hart.h                 |  4 +
 target/riscv/cpu.c                            | 18 ++++
 target/riscv/cpu.h                            | 11 +++
 target/riscv/cpu_bits.h                       | 23 ++++++
 target/riscv/cpu_helper.c                     | 81 ++++++++++++++++--
 target/riscv/csr.c                            | 82 +++++++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 12 +++
 target/riscv/op_helper.c                      | 49 +++++++++++
 11 files changed, 300 insertions(+), 5 deletions(-)

-- 
2.31.1


