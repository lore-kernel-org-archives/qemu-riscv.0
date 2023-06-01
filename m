Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE6C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 23:03:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4rKS-0005CP-K1; Thu, 01 Jun 2023 19:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4rKS-0005CE-1d; Thu, 01 Jun 2023 19:03:36 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4rKP-0000V7-Lp; Thu, 01 Jun 2023 19:03:35 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4393e3951ecso366124137.2; 
 Thu, 01 Jun 2023 16:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685660612; x=1688252612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GsJCUBcjeYjCImvFt2yEgzH45sZb1I//HbDAVqWWfRM=;
 b=OGR2J52pWgLw7KxoudXdcNpZMdWyzyLcl56hljyz6JIHfyNefynZKtAAa1Q85kslq4
 rKE7VKPexU58XD+Gxpcrs5DZ7JEupTRimI1+rPyHmemH+JfXUXPgXWTi+q8PnqXYgW8o
 lVYKb9BpRU5EVzjDjW+xzuMdAycxob2URjWBd/C17iLrouSThMVe0hfkqdjIGEHUEI6/
 gPLIgYLLYiCnTJ3vhDOdBJhGUFvjimjjLET5o7ikJsSWfvcx805azmYBkGkJVpKzG8Ju
 So8RrM5yieUE9l4e5ldbVG+pz4uGe5UelyZXsQBReUSZmjNZ9gal2bZn92222kmWOSJi
 BkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685660612; x=1688252612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GsJCUBcjeYjCImvFt2yEgzH45sZb1I//HbDAVqWWfRM=;
 b=J1txYp/Sod3uIqURV7QyDwoUWETAZw3a2YYQzwxmncb+wgZWj9+TXB+IC/TEnN8a1S
 MkrfAwlz3PstUbnz2sIDlbH9ueNeA81eu1DEF7DnaiJNpWFdoiT6GHC11knEVZZeJ8Ep
 YbFmo7wStVM5xxFewyvVTfuu8vpO0/zoMH5UlR0fYpriJbUVgY93wWAOKNNPJBUi2UAb
 iWc8Db/V7R6QoGFOrnVDhPpm0HQ5Gkd2SyM5mO9LKMCjI8c8R1WwXGY4+uYzCaa8DU6X
 SNqON5icGakmmIhddvs7BTD1OPkwmXQBXbNjkQRQZQ096QpvbwWWu5OCj1lVwipG2IZC
 CCxQ==
X-Gm-Message-State: AC+VfDxm7w6MpclCdu1dhpy+mzxMijzxFuAzAPO8vPGAWY45F8krbH6i
 ha0xyKvG4LepuOyP3zd3EMJBL8bCNjqdT4807Ik=
X-Google-Smtp-Source: ACHHUZ6dIbZMZuGdSqVkFd0p1W58RIG/yAs0+P962VSKQiWgLdkxVVJtNzq6wzjjCC6IWlVjrSKLA12j8bGm23FJk1s=
X-Received: by 2002:a67:f7d5:0:b0:436:4dda:ee63 with SMTP id
 a21-20020a67f7d5000000b004364ddaee63mr4763900vsp.0.1685660611949; Thu, 01 Jun
 2023 16:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-3-liweiwei@iscas.ac.cn>
 <CAKmqyKPmXXoVdSndTF+aF7A-3PqVrnw-NFG26sQQicxybwWpQA@mail.gmail.com>
 <18e4da39-cbd4-aa60-7628-7105a788b6e8@iscas.ac.cn>
In-Reply-To: <18e4da39-cbd4-aa60-7628-7105a788b6e8@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 09:03:05 +1000
Message-ID: <CAKmqyKMP0aX=_3ffQXSNQ0pWCjeXEF+h=QgPbL80=0J8v_gOrA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Remove check on mode for MPRV
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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

On Thu, Jun 1, 2023 at 4:43=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/6/1 13:27, Alistair Francis wrote:
> > On Mon, May 29, 2023 at 10:19=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.c=
n> wrote:
> >> Normally, MPRV can be set to 1 only in M mode (It will be cleared
> >> when returning to lower-privilege mode by MRET/SRET).
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> ---
> >>   target/riscv/cpu_helper.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index bd892c05d4..45baf95c77 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -44,7 +44,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ife=
tch)
> >>       if (!ifetch) {
> >>           uint64_t status =3D env->mstatus;
> >>
> >> -        if (mode =3D=3D PRV_M && get_field(status, MSTATUS_MPRV)) {
> >> +        if (get_field(status, MSTATUS_MPRV)) {
> > The original check is correct though, why remove it?
>
> Yeah. As described in the commit message, I think MPRV can only be set
> to 1 in M mode normally

That's true. I do feel that keeping the check makes the code easier to
follow. Otherwise future developers need to check to see how MPRV can
be set. The current code is explicit and obviously follows the spec.

For a performance gain I think it's worth making the trade off, but it
doesn't sound like we really get any gain here.

Alistair

>
> which means check on MPRV is enough in this case. So I remove the check
> on mode here.
>
> Regards,
>
> Weiwei Li
>
> >
> > Alistair
> >
> >>               mode =3D get_field(env->mstatus, MSTATUS_MPP);
> >>               virt =3D get_field(env->mstatus, MSTATUS_MPV) &&
> >>                      (mode !=3D PRV_M);
> >> --
> >> 2.25.1
> >>
> >>
>

