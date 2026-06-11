Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CDACD98D5
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 10:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXczt-0006Mw-AX; Thu, 11 Jun 2026 06:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wXczn-0006Ll-RT
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 06:50:49 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wXczl-0002XP-OW
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 06:50:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8424b6792efso2979053b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1781175043; x=1781779843; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rd+4cRtGN3SmQC/zhJnnLLKTs3tW0tLvUsOUlwiyHHM=;
 b=e1tSYPRFdcpTZ1J5hMJPdPbhH3otRM3QD9QXZ0TSnu0hfgXWhLDDm8renK6I1J0IMo
 3vER8tU5rX1B2BWoWEEdiy7j+8FoGgY74+PQNveaE+qAzBzb3uyHce/x1/yP5x7n6xo0
 4qS8nl1IpRCFmKOIM85p0jTZysbo2hJrvZNtwp8+DmrFwYb74BN/SBPJH2yWVBnu9HYY
 Z72T6IE+3yHh+GwkOYe+7mDw796kSoeBr5AaT77b5+Tjy7AHCY/GwfFFDI9QTDPz6g09
 MaaF4ZwE4mMs0VcV4/29RhKddGx+bcK+rmbmPP+3ATahv65crQGWRXnz9vWS8bIAxY8D
 FbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781175043; x=1781779843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rd+4cRtGN3SmQC/zhJnnLLKTs3tW0tLvUsOUlwiyHHM=;
 b=MVEjays3PvtJtDC5Anl9CzpIfefLPIkm2kJPRUrSx+vEoqxlqTyUl2rMFSNYZrX5hz
 KUpVAi8CF59P8vzji4TXQETvm8AbPq7bDeSo1pq7mJheBhH1CI8vPw8NAV7l4SQNTjms
 Zm1jIOHDdXhVPnfhgspGlz0jNuZfJPW0epKVPn/ZyDBa58it1xFcMeuE/DgTt6LDtkat
 ly6wdf5iKbNlaQ6Ld20LfPyE3+PVFde24KIHtfT1+FYYwRLVA5RphFfG8+JuCNi4pXRH
 h4ACbxKhB8L4OY99qIsf8X0Vh530xAdXepysRRKICui57JvrPIxfVKc93sEByFKOQxwx
 c1IQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AoXxu4OypC5jSKo1P848X5QDznD3eWieUaMT/qolTpcTqqQxkt6s5/8lrB5K94lGlyZMCUoA7AGoh@nongnu.org
X-Gm-Message-State: AOJu0YxvWQvSykX3Yr6qcDxDS5oV6lZwL6iynT2NpbRbL4pb2dGck+rc
 ChvrwMwg+mCIXJETFygnGycoKVa8xxBkPG39XNi11ZTUyrunuf7eD3a8YV9weRSg758=
X-Gm-Gg: Acq92OFVtm2glPAj5pd/ZnTeIva0vDNobVcoZU+pVRkptlQz+OpBUT22fu/GD16yYkS
 XeMQPygloPo1wW5z6wy5M51S8UhxOtByhFdYIlX3CeKA+WdLlrZ+2/2Vn74rjYhzKdNwpzFBYzz
 Jst3FLbXZWsNYiJnDr3Y5YzHLx4uGUrRAj8WF8z/NuI8VEtW0zg6iM0byMSd5iUk7T7UxmUPWob
 GL8YvRyR4gaQsQx9rbBEXGONYQ22pjwMQwiUOvnEfd2CGUVnwaQKtgkhvIAGGbozyabNhXYfSDi
 WF1caQrYgatW90JM+/3sQNOzjzYGJWHm/Q8X4CKjVFWVfo8pLYrxjHID1QXuLh52Yx6mS/Awi5p
 3aYDBj88gUBXlwI45qEL/GRW58aQ7kpj96hgAArJQpWJo7SRT0m7pJbGICVZ4z0GoVC509deq5p
 /ErlRsihbKV+aejPg2PgvuggrkJ/Wl+tgrmFyk7Kps1Xfcx1Fa3G8PW0swcW3xVqDddkrlM3Gc0
 ogI9hXItnNHG8/OTzZGlVpurJ9cmgKVxF7cww==
X-Received: by 2002:a05:6a00:6017:b0:81e:ef16:b288 with SMTP id
 d2e1a72fcca58-84336a9e365mr2590189b3a.22.1781175043455; 
 Thu, 11 Jun 2026 03:50:43 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-843383197e5sm1657818b3a.52.2026.06.11.03.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:50:42 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 0/2] target/riscv: Fix mstatus.FS dirty tracking for FP
 exception-raising instructions
Date: Thu, 11 Jun 2026 18:50:35 +0800
Message-ID: <20260611105037.157773-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42b.google.com
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

The RISC-V privileged architecture specification 3.1.6 defines
mstatus.FS that

  "The FS field encodes the status of the floating-point unit state,
   including the floating-point registers f0–f31 and the CSRs fcsr,
   frm, and fflags."

Any instruction that modifies this state must transition mstatus.FS
to dirty. In particular, fflags is part of the tracked state, so any
instruction that sets a new bit in fflags (e.g. raises a FP exception
flag — must set mstatus.FS to dirty).

But current implementation was failing to set mstatus.FS to dirty:

1. Scalar FP instructions that write integer registers (comparisons
   and FP-to-integer conversions):

Instructions such as FEQ.S, FLT.D, FLE.H, FCVT.W.S, FCVT.WU.D,
and FCVTMOD.W.D write their results to integer registers, so
mark_fs_dirty is correctly not called to set fs to dirty at
translation time. However, following scalar instructions may raise FP
exception flags:
- Comparisons: fle/fleq/flt/fltq/feq
  — raise NV on NaN operands
- FP-to-integer: fcvt.[w|wu|l|lu]/fcvtmod.w.d
  — raise NX on inexact or NV on out-of-range

2. Vector FP instructions (all arithmetic, comparison, conversion, and
   reduction operations in the V extension):

When a vector FP instruction raises a FP exception (e.g., vfdiv.vv
producing a divide-by-zero, or vmflt.vv comparing NaN values), it
modifies fflags — an FP CSR — but current implementation did not dirty
mstatus.FS.

This patchset fixes this issue by
1. Save float_exception_flags before the softfloat operation
2. Perform the operation
3. If any new exception bits are set, set fs to dirty

Max Chou (2):
  target/riscv: Set mstatus.FS dirty when scalar FP raises exceptions
  target/riscv: rvv: Set mstatus.FS dirty when vector FP raises
    exceptions

 target/riscv/cpu.h           |   1 +
 target/riscv/fpu_helper.c    | 157 +++++++++++++++++++----
 target/riscv/vector_helper.c | 241 +++++++++++++++++++----------------
 3 files changed, 258 insertions(+), 141 deletions(-)

-- 
2.43.7


