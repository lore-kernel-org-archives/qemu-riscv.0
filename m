Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502EAC7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 03:39:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2OIU-0004fq-Dz; Thu, 25 May 2023 23:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2OIR-0004dR-Us; Thu, 25 May 2023 23:39:21 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2OIO-0002fR-Kn; Thu, 25 May 2023 23:39:18 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4393c074161so52717137.2; 
 Thu, 25 May 2023 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685072353; x=1687664353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4ElARsdP9e2ua0HpYVlWI/UYyjsG2/u1B9dl5j8YGE=;
 b=cRPx9kvyB/ebgtV6Usn5Gd34e5hX0Rn8PWs0eZxp87k5jUYwCtjq/segmCi7QNLKeK
 UaooFsJffHJElttD/DFooBS3I/vFcShAJgo2olWcLmbB9Z+bPT2kfm5yA3lDVXGSvF3b
 MwRMCoPufFHyKULzt24zH8XqLAd7sHxqlveFd4RGU810IzrN/bLd3AUP8LVTjGTVa0O8
 U7hCkpqbnNCr898FSd/RBCEM0mrcR6WYBLdlkFsgSgaQhgpe5obBSTudkwlKKQcZmBT+
 mn62wqKsKcU03S9wRLFa7vH1USaCoUrzVWhqEXDTVWNMUW9r9pZwHQbBfvpGnK3zpYk9
 ihZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685072353; x=1687664353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4ElARsdP9e2ua0HpYVlWI/UYyjsG2/u1B9dl5j8YGE=;
 b=bc2zBRh2oczi4ZabJfxcyUZYXBhC/w5jYQ4McYA80gFnxxSJ9gqCuolzolN/UIINf8
 mYXnv1ud1P169+2hsYRQOuZ8fEKW9r7iCJU3gUxLCvi7fFcLo6nJ/b2feAxc0yKX5HRP
 ILgdrYVfVBJKLrFFsT6++SlQz8+KvNVl5t/D7FkwxmNFGa+gp0mCQ9gLRiooB00uQXtc
 0v0pj/c8bDAukV/w3dmNGkO/yN0y5oKup5/g3dCrOjKN0vd8WrYGvdnHdLuGjBYhAYp/
 rdf+W5LpYOW50vG+goMISj9htIRw1tThsCjhXZOQ2ucZbI0JpOT3JbWlPd+qidqTmuCT
 2Egg==
X-Gm-Message-State: AC+VfDwJjriuw3olX+8RXIL8F2JD3FBD35OkViWre6fmCi+BEBbfNp6c
 Ah7d41a/Y8LaOcCVxx+VMGhJ+P27ak7ZmmgZ0FU=
X-Google-Smtp-Source: ACHHUZ4r4ZAID44qKlw8rE8kNwiCPIz5KfoVYqrnqc5W3VIouGeQl16Es0rb7fJ+OEI6NxPs38XQu4+f6giNnH+aIK4=
X-Received: by 2002:a67:f750:0:b0:41f:5a31:8b17 with SMTP id
 w16-20020a67f750000000b0041f5a318b17mr132328vso.2.1685072353298; Thu, 25 May
 2023 20:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 13:38:47 +1000
Message-ID: <CAKmqyKMOzVPxJ8N+xZzJbchUoXZ-DSe62XijthbXors1py2e6A@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/riscv: Add support for PC-relative
 translation
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, May 24, 2023 at 12:15=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> This patchset tries to add support for PC-relative translation.
>
> The existence of CF_PCREL can improve performance with the guest
> kernel's address space randomization.  Each guest process maps libc.so
> (et al) at a different virtual address, and this allows those
> translations to be shared.
>
> And support of PC-relative translation is the precondition to support
> pointer mask for instruction.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-pcrel-upstream-v2
>
> v2:
>  * rebase on upstream and add pc-relative translation for Zc* instruction=
s
>
> Weiwei Li (7):
>   target/riscv: Fix target address to update badaddr
>   target/riscv: Introduce cur_insn_len into DisasContext
>   target/riscv: Change gen_goto_tb to work on displacements
>   target/riscv: Change gen_set_pc_imm to gen_update_pc
>   target/riscv: Use true diff for gen_pc_plus_diff
>   target/riscv: Enable PC-relative translation
>   target/riscv: Remove pc_succ_insn from DisasContext

Thanks for the patches.

Do you mind rebasing on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Alistair

>
>  target/riscv/cpu.c                            | 31 ++++--
>  .../riscv/insn_trans/trans_privileged.c.inc   |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc       | 43 ++++++---
>  target/riscv/insn_trans/trans_rvv.c.inc       |  4 +-
>  target/riscv/insn_trans/trans_rvzawrs.c.inc   |  2 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc     | 10 +-
>  target/riscv/insn_trans/trans_xthead.c.inc    |  2 +-
>  target/riscv/translate.c                      | 94 ++++++++++++-------
>  8 files changed, 123 insertions(+), 65 deletions(-)
>
> --
> 2.25.1
>
>

