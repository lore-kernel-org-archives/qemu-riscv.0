Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01008C54E60
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 17:57:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkpKO-0005KA-21; Thu, 14 Mar 2024 13:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkpKM-0005K2-M7
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:57:14 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkpKK-0005Ud-Rd
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 13:57:14 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5e152c757a5so776341a12.2
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710439031; x=1711043831; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7hyKsjWHskg9HSXsz6d1NnXw7JjoL/fAJk+aT+aqdy8=;
 b=iAUFtOp9kNaczN0dOUM6aQmYmy4OH0aeRfet77zVUAzZx9ZlYVZQQUEfU3ka5KD4B7
 9EYdso4gDkaOZjVaH/Yxqlhr5kuW0WG+kxlbPiRHVu8ms10E+dwz6gIEeSfioDn2SdYM
 yQ8CQY/FrNgUyhalS+3FCQwoSzryRX8m01TQPFZCagOeqU4uAVOoF10vE1sz9uMMDnNP
 CkU3LH4LiMny3lRIL8PF05NNhbFL5dym0YliqDgfeVljlM3Pab7XCxXPqxotsVj+tJ1V
 iD/qNvlGWKA7NiHflTcDL8/Na1AhRB3ZwY1xIU4kKDv3mDt2e5PlemYWkxmVjee2BkD8
 igNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710439031; x=1711043831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7hyKsjWHskg9HSXsz6d1NnXw7JjoL/fAJk+aT+aqdy8=;
 b=PJUr5QrlTOjcVUdXzGMMTvgjUa3jIQvAoycBq0zjwLcE0BK8FoHmE2ULL+lY08B5Zv
 WjCs1HF2eB5GEvxrU8nsHlreWGCQ+AQpcOf0vP6FzI/L6Fe3c5ZlqjkHlrJYdfKchrUk
 F2vLsHfzPyKxQYwvUtVCUGRzeNZS0U0iqoQ6DCERGrkbSYnHpwlG+kiBakXmTXUNklri
 N6TCPtAROwApGUUgPRVbfFC3RVF9GxlryX6o69zIrPh4y269MPDbvpFS2vxgcFXGlVym
 8e609WsDjHkKJphxZu/7lsLcsVSzeUYoeHM9QMyoTaBzt2oRNMy68HYCnOQnKaY5fYCE
 WGTA==
X-Gm-Message-State: AOJu0Ywctt2apKpeJwH90cfw9/6b7vPZe87HroYP3P7xGILPdbvfTOeZ
 UfnZUjMW2nCyWajHsN+PYzjhSFlH3V1UMLCETCaCFysDPivA/+dGwCs8BDr40so=
X-Google-Smtp-Source: AGHT+IESdAcljBGLOHjhzkjl66Y9neuEPQ6kv9RlRM5xdLvIiUqLr1sBHuWPyKeGmNjlvWYcKHnaSw==
X-Received: by 2002:a17:902:d54a:b0:1dd:7da:e0a9 with SMTP id
 z10-20020a170902d54a00b001dd07dae0a9mr843811plf.69.1710439031137; 
 Thu, 14 Mar 2024 10:57:11 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b001db717d2dbbsm1991776pla.210.2024.03.14.10.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:57:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for 9.0 v15 00/10] target/riscv: vector fixes
Date: Thu, 14 Mar 2024 14:56:54 -0300
Message-ID: <20240314175704.478276-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x535.google.com
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

Hi,

The series was renamed to reflect that at this point we're fixing more
things than just vstart management.

In this new version a couple fixes were added:

- patch 3 (new) fixes the memcpy endianess in 'vmvr_v', as suggested by
  Richard;

- patch 5 (new) fixes ldst_whole insns to now clear vstart in all cases.
  The fix was proposed by Max.

Another notable change was made in patch 6 (patch 4 from v14). We're not
doing early exits in helpers that are gated by vstart_eq_zero. This was
found to cause side-effects with insns that wants to send faults if vl =
0, and for the rest it becomes a moot check since vstart is granted to
be zero beforehand.

Series based on master.

Patches missing acks: 3, 4, 5

Changes from v14:
- patch 3 (new):
  - make 'vmvr_v' big endian compliant
- patch 5 (new):
  - make ldst_whole insns clear vstart in all code paths
- patch 6 (patch 4 from v14):
  - do not add early exits on helpers that are gated with vstart_eq_zero
- v14 link: https://lore.kernel.org/qemu-riscv/20240313220141.427730-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (9):
  target/riscv/vector_helper.c: set vstart = 0 in GEN_VEXT_VSLIDEUP_VX()
  trans_rvv.c.inc: set vstart = 0 in int scalar move insns
  target/riscv/vector_helper.c: fix 'vmvr_v' memcpy endianess
  target/riscv: always clear vstart in whole vec move insns
  target/riscv: always clear vstart for ldst_whole insns
  target/riscv/vector_helpers: do early exit when vstart >= vl
  target/riscv: remove 'over' brconds from vector trans
  trans_rvv.c.inc: remove redundant mark_vs_dirty() calls
  target/riscv/vector_helper.c: optimize loops in ldst helpers

Ivan Klokov (1):
  target/riscv: enable 'vstart_eq_zero' in the end of insns

 target/riscv/insn_trans/trans_rvbf16.c.inc |  18 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 244 ++++++---------------
 target/riscv/insn_trans/trans_rvvk.c.inc   |  30 +--
 target/riscv/translate.c                   |   6 +
 target/riscv/vcrypto_helper.c              |  32 +++
 target/riscv/vector_helper.c               |  93 +++++++-
 target/riscv/vector_internals.c            |   4 +
 target/riscv/vector_internals.h            |   9 +
 8 files changed, 220 insertions(+), 216 deletions(-)

-- 
2.44.0


