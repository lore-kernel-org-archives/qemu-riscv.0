Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF98C25B74
	for <qemu-riscv@archiver.kernel.org>; Sun,  2 Jun 2024 06:39:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sDesF-0005Yl-C6; Sun, 02 Jun 2024 02:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sDesE-0005YX-QI
 for qemu-riscv@nongnu.org; Sun, 02 Jun 2024 02:39:22 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sDesC-0002qf-Q4
 for qemu-riscv@nongnu.org; Sun, 02 Jun 2024 02:39:22 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52b840cfecdso3061574e87.3
 for <qemu-riscv@nongnu.org>; Sat, 01 Jun 2024 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717310358; x=1717915158;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veBUIKp4QyFIyRCP5s0efdhDjrubQVc8r9wefmDpjlc=;
 b=0YxcSTIvXkRElxSkGlWZXaRo9WWa/L8S4fJeBgvElMp5I+MrUBptWbNRNzt9Ogmm9o
 N/pxt9aekjyGLPteU3bW9159rhYAMi/jYblMQLNC96BHKEFMv4wAMxK1jERx2E+i0WMX
 nKifHOB7ZWc867/dR+v95yb7+3ctziCwErIQxGUDCK6TcROqRy53Fyl56R9A2IddbQo9
 Bcg95ZgVg6qC9f1xP0TLKzHIvcRbuCRYwCF6puHAL1NtzmAHY1Zr/UhYLMCn5iJC6wmw
 I84XndBVdrYKxodTIm1fLMl+sWjhtEVV51QWoqSzb3kBbqO1cg+kxxmNXMwd8ONMCFF1
 GDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717310358; x=1717915158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veBUIKp4QyFIyRCP5s0efdhDjrubQVc8r9wefmDpjlc=;
 b=PT5/I6q8MafTgg0sfe224aPCbcCUcMBSjsXFTYWGDDQAULYRIm51V0UD0itgEjIPxv
 3lm9WsEk/ib/BvQT54FR0xN5MBsHnf6Y+LtU6QV7MiARtTX6KguuM4c27535BuqZPyvh
 QsyLu80rs1wF/f1xs9w2A3NzyjHbamSVCr8r2HZ5AVucN1udqXz+/pKGo0VnzlhvSWaE
 WGkLyqsE2D+xgHaFjW09ogwAKrBqWzP0L+F+FFiVPPQ4cY+b4UdJr+WHO4+hhC9Hfbb0
 A4a9AWDjVQ2bTtp1quX+/mjnM/A7LIRIkJVjTphS7kKOhMaTDbGtjrxuVEsvrhR4NWX2
 lB7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWprh7Vb9VZ58sXmwvyElRQLGVoy2j0PQOi5WSXfkmBE0bgBi0SY2REkty92g9QeRPk/5cG36dEaM2ALzX6FH82SGmwM3w=
X-Gm-Message-State: AOJu0Yzxhmmm+tp27LdLIw7UgEGiTQyJ9x04G3XGu53nXaI+G1ldfxSo
 wyX4ZvG5CQWeFs5T9gaYU/ePQnCwgbrrraX63RWd4bfNHex69Xw5bcljCl08kDUZ9rEvWx8NvzM
 pgvaTtChNSKQSyqgZsFB0OwPKiCtXL3T8uQqSNw==
X-Google-Smtp-Source: AGHT+IGxBDUEzvezMfkXgPG9rOgfq/HAVQ9z9BFbI467c48MYRkicUJAxFsPfxHnfm5Fr29Hi9iwbURauHuIvZBEmZU=
X-Received: by 2002:ac2:5a4c:0:b0:529:ed29:dc94 with SMTP id
 2adb3069b0e04-52b896c7adcmr3834752e87.44.1717310357711; Sat, 01 Jun 2024
 23:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240217000134.3634191-1-atishp@rivosinc.com>
 <6ae5689d-d4d7-46b9-b1a6-3878a8bb83c7@ventanamicro.com>
In-Reply-To: <6ae5689d-d4d7-46b9-b1a6-3878a8bb83c7@ventanamicro.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 1 Jun 2024 23:39:06 -0700
Message-ID: <CAHBxVyE9PD2WmwTD7HnKvmj=sOOG-F4pJAsMLvPGR1_B=Sp9zg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] Add Counter delegation ISA extension support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Daniel,

On Sat, Jun 1, 2024 at 2:52=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi Atish,
>
>
> I see that Rajnesh sent some patches that were built on top of this
> work [1], and this series no longer applies neither to alistair's
> risc-to-apply.next nor to master.
>
> If you could send a rebased version of this series that would be great.
>
>

Yes. I am planning to send revised series for counter delegation,
Smcntrpmf and a few other miscellaneous fixes
soon.

> Thanks,
>
>
> Daniel
>
>
>
> [1] https://lore.kernel.org/qemu-riscv/20240529160950.132754-1-rkanwal@ri=
vosinc.com/
>
>
> On 2/16/24 21:01, Atish Patra wrote:
> > This series adds the counter delegation extension support. The counter
> > delegation ISA extension(Smcdeleg/Ssccfg) actually depends on multiple =
ISA
> > extensions.
> >
> > 1. S[m|s]csrind : The indirect CSR extension[1] which defines additiona=
l
> >     5 ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation=
 of
> >     RISC-V CSR address space.
> > 2. Smstateen: The stateen bit[60] controls the access to the registers
> >     indirectly via the above indirect registers.
> > 3. Smcdeleg/Ssccfg: The counter delegation extensions[2]
> >
> > The counter delegation extension allows Supervisor mode to program the
> > hpmevent and hpmcounters directly without needing the assistance from t=
he
> > M-mode via SBI calls. This results in a faster perf profiling and very
> > few traps. This extension also introduces a scountinhibit CSR which all=
ows
> > to stop/start any counter directly from the S-mode. As the counter
> > delegation extension potentially can have more than 100 CSRs, the speci=
ficaiton
> > leverages the indirect CSR extension to save the precious CSR address r=
ange.
> >
> > Due to the dependancy of these extensions, the following extensions mus=
t be
> > enabled to use the counter delegation feature in S-mode.
> >
> > "smstateen=3Dtrue,sscofpmf=3Dtrue,ssccfg=3Dtrue,smcdeleg=3Dtrue,smcsrin=
d=3Dtrue,sscsrind=3Dtrue"
> >
> > This makes the qemu command line quite tedious. In stead of that, I thi=
nk we
> > can enable these features by default if there is no objection.
> >
> > The first 2 patches decouple the indirect CSR usage from AIA implementa=
tion
> > while patch3 adds stateen bits validation for AIA.
> > The PATCH4 implements indirect CSR extensions while remaining patches
> > implement the counter delegation extensions.
> >
> > The Qemu patches can be found here:
> > https://github.com/atishp04/qemu/tree/counter_delegation_rfc
> >
> > The opensbi patch can be found here:
> > https://github.com/atishp04/opensbi/tree/counter_delegation_v1
> >
> > The Linux kernel patches can be found here:
> > https://github.com/atishp04/linux/tree/counter_delegation_rfc
> >
> > [1] https://github.com/riscv/riscv-indirect-csr-access
> > [2] https://github.com/riscv/riscv-smcdeleg-ssccfg
> >
> > Atish Patra (1):
> > target/riscv: Enable S*stateen bits for AIA
> >
> > Kaiwen Xue (7):
> > target/riscv: Add properties for Indirect CSR Access extension
> > target/riscv: Decouple AIA processing from xiselect and xireg
> > target/riscv: Support generic CSR indirect access
> > target/riscv: Add smcdeleg/ssccfg properties
> > target/riscv: Add counter delegation definitions
> > target/riscv: Add select value range check for counter delegation
> > target/riscv: Add counter delegation/configuration support
> >
> > target/riscv/cpu.c      |   8 +
> > target/riscv/cpu.h      |   1 +
> > target/riscv/cpu_bits.h |  34 +-
> > target/riscv/cpu_cfg.h  |   4 +
> > target/riscv/csr.c      | 713 +++++++++++++++++++++++++++++++++++++---
> > target/riscv/machine.c  |   1 +
> > 6 files changed, 722 insertions(+), 39 deletions(-)
> >
> > --
> > 2.34.1
> >

