Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCC3C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4ak1-0000AG-Pw; Thu, 01 Jun 2023 01:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4ajz-00008O-Qd; Thu, 01 Jun 2023 01:20:51 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4ajk-000256-B2; Thu, 01 Jun 2023 01:20:51 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-45c6c5ea666so7339e0c.0; 
 Wed, 31 May 2023 22:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685596832; x=1688188832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLc+U5XsiZO/G+/SxnZUwX0Ue8+wmmphS9cElaB/BPk=;
 b=P1jDBgqxHvTVtSMEF4Ii0aTYa3mgu0sBk1T3QQr3B2+JivJml1FZ2qJPaakPDWBMGV
 A1lVa90d1qwqHUuROLiHcnOhC313lkK7AaJaYywhNVlffIY1qDv0VvzizqvFu8nd9WEC
 Mc2zOBmbXQcoiWxJuKVFWNaE/23p7HB9u9xfnmW96+uaLKsWZLUfZWVDmG2OYMfDm4tE
 oe63t/p0LpR4PzewO52GukBF86KTEFepngG1Cx+43QhRwFME+k/GmIGsMkG++4ht4BoT
 9grpLU1CqQvYHL8CGW+Ajyy1xTWN3qXCo8QyDicDE/9SjbboU1yFK03tQiZbR5WFmSkh
 H0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685596832; x=1688188832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TLc+U5XsiZO/G+/SxnZUwX0Ue8+wmmphS9cElaB/BPk=;
 b=j6t+AzwDypI8Vr3bLww8st5Drgo8drJ15DDegDt+ZNxoq87JA7coj6mrJJVMTFeKZm
 0KFt3nv7Dft3XsbDWzYqjAWT+0rEQ7gN9sdVRHI9ReMc/ZajXQ6Pcw7dMtZj7oLICn6J
 6P9Xo0NvGGl//uLCmArMn0MQlvUQfGe/c/6H5NUUVyqBdZkMItI8QdkbE/9I4LEQ8EDA
 gSAFYE9tt/8gSJEOF+oV/YKyhcdVFZh741fYX04gM2VmChknZjlwb30xBuA3058GdJ9E
 +nQwjocqvvST6qme1yXYXRGZtDLv3QQoGCEg4yXIk+eDG7MZDRpgGjTfFknlX3xbDW1X
 tiWw==
X-Gm-Message-State: AC+VfDwGHGOhY8MjbTH4AzU2s1IfSANrdnm8DOThIpyhdzPLTaaa2mWf
 USRPZ3ITYtGvN/8Ffqlw9yy9SwsOPpwysDLmsDspBbP/Ekc=
X-Google-Smtp-Source: ACHHUZ5nFrSiV3wKrvfdp+Qv1vAIObVyVMQP5l3uxyUKYYT3MuX42rzP8OYhcjifIyTplqffYPHQtB0fZ+iJK79Ulcs=
X-Received: by 2002:a1f:41d5:0:b0:457:5285:2fff with SMTP id
 o204-20020a1f41d5000000b0045752852fffmr522283vka.7.1685596831479; Wed, 31 May
 2023 22:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230526072124.298466-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230526072124.298466-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:20:05 +1000
Message-ID: <CAKmqyKMiZ0EydRGFniq6obPPtwuhHozvaAO-R7nwMgExSMqqqA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] target/riscv: Add support for PC-relative
 translation
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

On Fri, May 26, 2023 at 5:24=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
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
> https://github.com/plctlab/plct-qemu/tree/plct-pcrel-upstream-v3
>
> v3:
>  * rebase on riscv-to-apply.next
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

Thanks!

Applied to riscv-to-apply.next

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

