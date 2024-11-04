Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CBD1BDFF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 21:53:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t850i-0007mK-Gg; Mon, 04 Nov 2024 16:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1t850f-0007l1-Gp
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 16:53:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1t850c-00010L-W1
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 16:53:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso3234221f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730757192; x=1731361992;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2aAbjKU6qGxQLMueknUqeWxHp+LgIOIR1Asu9kPE/pI=;
 b=Xh8CZz0wKdWEPwoi0aPVqCbLQlhNyAlKx78mmDgP9bUqSRC4LZkeJji748PE2XZF8R
 pfW8FJkGZWGM2633Z8fyZm84C06hJowPlzqddBpkipwpc4Ey8a0uvrKQq32vly3bDnAy
 dr9VDZhlvNMb3cKwGwJ2ylTXGJ8Fo1pa5wopW+gkdNVuQEGtar2OTe/2flrYdajahXPw
 GQ2RFhJupyU53LONbGQiF44OG2SzEjludugl49teLmJGd83jlcprEOZs5FsRvJ6SVGFA
 JwSD4mz8G/S1vmhzhU+XNbw+UbuPJMljGe3S1b0qU84zsYD8W2uFmIZB+mkgLa0QP0uL
 ZcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730757192; x=1731361992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2aAbjKU6qGxQLMueknUqeWxHp+LgIOIR1Asu9kPE/pI=;
 b=EG+IOpBrBTbYDdG7TNfyPRbEZi18GBVTUr1oDYEEgsoYHt+YztOudiCNQNmXmwEZK4
 zav/uic3sb/3Odg7vWxqS3lS++MhaMK0q7ADyz2ZJjYVwTQcwqjCH496UWAFDaZpNhvK
 nwkxT3NitwHxm++BUi0l3Fw+52oG8lVnm31sCBykHXQ+uyQsaCQFPDigssDC+jfWNXnM
 OqWylJNi4N/V5qAqNAMJMYgwuP8FUuSo0Hu6VXiGiMSqeEDnI2MPk9od8iP3EqZJx4UR
 UahxMEp1pAiC+CE5+DLxVBdYfVsOtDMyDaD71BO5VXKe5Ex+aK5TH4/sPs7R064bMKYV
 pVyQ==
X-Gm-Message-State: AOJu0YxysFEVUC8bi+7+iym9qLQiOQz8zKe5QK8DtmS8vo/PFhroi44R
 bkEr4CVJTdbAjYBFyuOJjAeelW3xzy+0XwWgduzJwRPBBSw5clsme1qAfjZL7dN3tJuqjCCm0SX
 2
X-Google-Smtp-Source: AGHT+IHBypiajSDIuGdK36uoyiZjS04vvGBHf6lx+CcLspmYTBuHAlGFtP35VkJpH4dxs1nsxZOj7w==
X-Received: by 2002:a05:6000:dd0:b0:374:c3e4:d6de with SMTP id
 ffacd0b85a97d-380611e484bmr26387304f8f.41.1730757192432; 
 Mon, 04 Nov 2024 13:53:12 -0800 (PST)
Received: from rkanwal-XPS-15-9520.Home
 ([2a02:c7c:7527:ee00:8a3a:7719:aa26:21cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432a26a6da1sm1537595e9.0.2024.11.04.13.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 13:53:12 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 tech-control-transfer-records@lists.riscv.org, jason.chien@sifive.com,
 frank.chang@sifive.com
Subject: [PATCH v3 0/6] target/riscv: Add support for Control Transfer
 Records Ext.
Date: Mon,  4 Nov 2024 21:51:04 +0000
Message-Id: <20241104-b4-ctr_upstream_v3-v3-0-32fd3c48205f@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241029-b4-ctr_upstream_v3-7ab764c68bf1
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x42a.google.com
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

This series enables Control Transfer Records extension support on riscv=0D
platform. This extension is similar to Arch LBR in x86 and BRBE in ARM.=0D
The Extension has been stable and this series is based on v1.0_rc6 [0]=0D
=0D
CTR extension depends on both the implementation of S-mode and Sscsrind=0D
extension v1.0.0 [1]. CTR access ctrsource, ctrtartget and ctrdata CSRs usi=
ng=0D
sscsrind extension.=0D
=0D
The series is based on Smcdeleg/Ssccfg counter delegation extension [2]=0D
patches [3]. CTR itself doesn't depend on counter delegation support. This=
=0D
rebase is basically to include the Smcsrind patches.=0D
=0D
Here is the link to a quick start guide [4] to setup and run a basic perf d=
emo=0D
on Linux to use CTR Ext.=0D
=0D
Qemu patches can be found here:=0D
https://github.com/rajnesh-kanwal/qemu/tree/b4/ctr_upstream_v3=0D
=0D
Opensbi patch can be found here:=0D
https://github.com/rajnesh-kanwal/opensbi/tree/ctr_upstream_v2=0D
=0D
Linux kernel patches can be found here:=0D
https://github.com/rajnesh-kanwal/linux/tree/b4/ctr_upstream_v2=0D
=0D
[0]: https://github.com/riscv/riscv-control-transfer-records/releases/tag/v=
1.0_rc6=0D
[1]: https://github.com/riscvarchive/riscv-indirect-csr-access/releases/tag=
/v1.0.0=0D
[2]: https://github.com/riscvarchive/riscv-smcdeleg-ssccfg/releases/tag/v1.=
0.0=0D
[3]: https://lore.kernel.org/all/20240217000134.3634191-1-atishp@rivosinc.c=
om/=0D
[4]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on=
-QEMU-RISC%E2%80%90V-Virt-machine=0D
=0D
Changelog:=0D
v3: Improvements based on Jason Chien and Frank Chang's feedback.=0D
  - Created single set of MACROs for CTR CSRs in cpu_bit.h=0D
  - Some fixes in riscv_ctr_add_entry.=0D
  - Return zero for vs/sireg4-6 for CTR 0x200 to 0x2ff range.=0D
  - Improved extension dependency check.=0D
  - Fixed invalid ctrctl csr selection bug in riscv_ctr_freeze.=0D
  - Added implied rules for Smctr and Ssctr.=0D
  - Added missing SMSTATEEN0_CTR bit in mstateen0 and hstateen0 write ops.=
=0D
  - Some more cosmetic changes.=0D
=0D
v2: Lots of improvements based on Jason Chien's feedback including:=0D
  - Added CTR recording for cm.jalt, cm.jt, cm.popret, cm.popretz.=0D
  - Fixed and added more CTR extension enable checks.=0D
  - Fixed CTR CSR predicate functions.=0D
  - Fixed external trap xTE bit checks.=0D
  - One fix in freeze function for VS-mode.=0D
  - Lots of minor code improvements.=0D
  - Added checks in sctrclr instruction helper.=0D
  - https://lore.kernel.org/qemu-riscv/20240619152708.135991-1-rkanwal@rivo=
sinc.com/=0D
=0D
v1:=0D
  - https://lore.kernel.org/qemu-riscv/20240529160950.132754-1-rkanwal@rivo=
sinc.com/=0D
=0D
---=0D
Rajnesh Kanwal (6):=0D
      target/riscv: Remove obsolete sfence.vm instruction=0D
      target/riscv: Add Control Transfer Records CSR definitions.=0D
      target/riscv: Add support for Control Transfer Records extension CSRs=
.=0D
      target/riscv: Add support to record CTR entries.=0D
      target/riscv: Add CTR sctrclr instruction.=0D
      target/riscv: Add support to access ctrsource, ctrtarget, ctrdata reg=
s.=0D
=0D
 target/riscv/cpu.c                             |  26 ++-=0D
 target/riscv/cpu.h                             |  13 ++=0D
 target/riscv/cpu_bits.h                        |  94 ++++++++=0D
 target/riscv/cpu_cfg.h                         |   2 +=0D
 target/riscv/cpu_helper.c                      | 266 +++++++++++++++++++++=
+=0D
 target/riscv/csr.c                             | 294 +++++++++++++++++++++=
+++-=0D
 target/riscv/helper.h                          |   9 +-=0D
 target/riscv/insn32.decode                     |   2 +-=0D
 target/riscv/insn_trans/trans_privileged.c.inc |  22 +-=0D
 target/riscv/insn_trans/trans_rvi.c.inc        |  31 +++=0D
 target/riscv/insn_trans/trans_rvzce.c.inc      |  20 ++=0D
 target/riscv/op_helper.c                       | 155 ++++++++++++-=0D
 target/riscv/tcg/tcg-cpu.c                     |  11 +=0D
 target/riscv/translate.c                       |  10 +=0D
 14 files changed, 941 insertions(+), 14 deletions(-)=0D
---=0D
base-commit: 27dec0a099f70f309d89b43122409aeb003d5702=0D
change-id: 20241029-b4-ctr_upstream_v3-7ab764c68bf1=0D
-- =0D
Regards,=0D
Rajnesh Kanwal=0D
=0D

