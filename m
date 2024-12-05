Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAEE77170
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 11:35:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJA7n-0006Ys-AU; Thu, 05 Dec 2024 06:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tJA7l-0006YJ-Jm
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 06:34:25 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tJA7j-0001SZ-Dv
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 06:34:25 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so8573835e9.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 03:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733398461; x=1734003261;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nv1vpHtk0UcIr6O/YrgJ4uG9ob6CZl8SJNdDvidA6ac=;
 b=GY79S3q8JlFkirL/O/0ubJBWKlLC3aK7THKgoqj0Ijeh8TLgf9nVDTpnalxC/PBNyM
 GZKRl7qzgrx//gvvEg72eAo1GKwmH1qOktuJ8WEAtOnyof2QlkhKD2bzrSFTfxWY9M2e
 +Evada0l8t5K7UXmG7Cm/JUV64P+j/kuqFtkM31JgK+fF6ciy7oPP+W2eHAJGgje5eiR
 NJ6aMWdZtvpQJCNmGWL2B4qVJpe3ue/8OvopPrc0X85k0G1DNYudTNlamzqf5PFU1nJT
 MebcTsPfz3ZJ58nHAK9JubVePWMtN2V8bkQl4AH/GU+iguhbGJiFDUQKMLZyasHhNqNi
 ZHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733398461; x=1734003261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nv1vpHtk0UcIr6O/YrgJ4uG9ob6CZl8SJNdDvidA6ac=;
 b=GpDIiTL5WKrGxBPnx5IlL9GnVxOWnoVytdQVef1UeGwXAqqiYpc/DY7jkcS00jhkcM
 unbXUVj55d0LQhHLjgpC2WRJbJVRKFJfPKpEacl/MpLZzrjqG2P00H0gtgQ8rHN1LKK4
 IVaEdVu/j/U9B2lW1mmJl3yygWblHyHFd+UMX6Y4v9ZoT8Qf0II37g7sA4fEtRQ6+s7X
 evlRWaS4iTi2TyRzWjILB8O/Nle1as5z8pKFunx9gr9YTBXf0S3ck5a4U844eY347vqz
 ue+wM5COwSzozMqKsXaB/IRefnAorNjF4ycZGlW9i6TlKhHLLxXVMq4wRyAF/6WcWgyn
 ywZw==
X-Gm-Message-State: AOJu0YzSM/x94Fm+QefgvoRBftDTlJ61/HYIUimDWuJlLloDMNaUg7wy
 yxlXkzMapZTkvIKvecUJdCER/1CoPuUY2T90oIWPqKWurmuFN3F3idQj3xw6i79bxmx8ElozIn9
 2qLsYag==
X-Gm-Gg: ASbGnctypfA+LTH81v06qCQxn+v7n2iXLUxv6YxONO56ToByVsKQ+2B6VdL/oYG0y4j
 avlQmPCDPAocaIT+T8nyFmEE9YC626EOxALns8K3Px4PgJTM9Thz1GDqqmzCtNqVQZEGHPyU5Ez
 XBQwMzeeH5+rj5zwVyxyQr0TBSuYqiV4vtr8nUO7iAwd32LiFaSZuWBST1UVjpZvrwpkRdC1C6+
 LRx8gDwVDdCFlrEVK1HUIKaTxzwY95IXjM4fHudaQzdRybKBM7HeZaOUhgxyujOyhz20F6MMyRd
 5yGMaA==
X-Google-Smtp-Source: AGHT+IEBVmlhOJYuGQjr9LXB5uW8PutRVN/TlBFsrye1g6J4KQVC7T4+8l1aLbpgdHoUTmOIxQC6qg==
X-Received: by 2002:a05:600c:4ecf:b0:434:a26c:8291 with SMTP id
 5b1f17b1804b1-434d0a0e2c0mr92166705e9.24.1733398460680; 
 Thu, 05 Dec 2024 03:34:20 -0800 (PST)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com ([137.59.223.84])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527395csm57943255e9.17.2024.12.05.03.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 03:34:20 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 jason.chien@sifive.com, frank.chang@sifive.com,
 richard.henderson@linaro.org
Subject: [PATCH v5 0/7] target/riscv: Add support for Control Transfer
 Records Ext.
Date: Thu,  5 Dec 2024 16:34:05 +0500
Message-Id: <20241205-b4-ctr_upstream_v3-v5-0-60b993aa567d@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241029-b4-ctr_upstream_v3-7ab764c68bf1
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
https://github.com/rajnesh-kanwal/qemu/tree/b4/ctr_upstream_v5=0D
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
[3]: https://lore.kernel.org/qemu-riscv/20241203-counter_delegation-v4-0-c1=
2a89baed86@rivosinc.com/=0D
[4]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on=
-QEMU-RISC%E2%80%90V-Virt-machine=0D
=0D
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>=0D
---=0D
Changelog:=0D
v5: Improvements based on Richard Henderson's feedback.=0D
  - Fixed code gen logic to use gen_update_pc() instead of=0D
    tcg_constant_tl().=0D
  - Some function renaming.=0D
  - Rebased onto v4 of counter delegation series.=0D
=0D
v4: Improvements based on Richard Henderson's feedback.=0D
  - Refactored CTR related code generation to move more code into=0D
    translation side and avoid unnecessary code execution in generated=0D
    code.=0D
  - Added missing code in machine.c to migrate the new state.=0D
  - https://lore.kernel.org/r/20241204-b4-ctr_upstream_v3-v4-0-d3ce6bef9432=
@rivosinc.com=0D
=0D
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
  - https://lore.kernel.org/qemu-riscv/20241104-b4-ctr_upstream_v3-v3-0-32f=
d3c48205f@rivosinc.com/=0D
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
Rajnesh Kanwal (7):=0D
      target/riscv: Remove obsolete sfence.vm instruction=0D
      target/riscv: Add Control Transfer Records CSR definitions.=0D
      target/riscv: Add support for Control Transfer Records extension CSRs=
.=0D
      target/riscv: Add support to record CTR entries.=0D
      target/riscv: Add CTR sctrclr instruction.=0D
      target/riscv: Add support to access ctrsource, ctrtarget, ctrdata reg=
s.=0D
      target/riscv: machine: Add Control Transfer Record state description=
=0D
=0D
 target/riscv/cpu.c                             |  26 ++-=0D
 target/riscv/cpu.h                             |  13 ++=0D
 target/riscv/cpu_bits.h                        |  94 ++++++++=0D
 target/riscv/cpu_cfg.h                         |   2 +=0D
 target/riscv/cpu_helper.c                      | 266 +++++++++++++++++++++=
+=0D
 target/riscv/csr.c                             | 294 +++++++++++++++++++++=
+++-=0D
 target/riscv/helper.h                          |   2 +=0D
 target/riscv/insn32.decode                     |   2 +-=0D
 target/riscv/insn_trans/trans_privileged.c.inc |  18 +-=0D
 target/riscv/insn_trans/trans_rvi.c.inc        |  75 +++++++=0D
 target/riscv/insn_trans/trans_rvzce.c.inc      |  21 ++=0D
 target/riscv/machine.c                         |  25 +++=0D
 target/riscv/op_helper.c                       |  48 ++++=0D
 target/riscv/tcg/tcg-cpu.c                     |  11 +=0D
 target/riscv/translate.c                       |  46 ++++=0D
 15 files changed, 935 insertions(+), 8 deletions(-)=0D
---=0D
base-commit: 685c44c5d40b6796e4a88c0335f7ae01cb7a2121=0D
change-id: 20241029-b4-ctr_upstream_v3-7ab764c68bf1=0D
-- =0D
Best Regards,=0D
Rajnesh Kanwal=0D
=0D

