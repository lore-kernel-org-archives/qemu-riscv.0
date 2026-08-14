Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA02C5DF67
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 09:25:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuo9y-0002X6-OF; Fri, 14 Aug 2026 05:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wuo9w-0002WR-GI
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 05:25:04 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wuo9u-0002yp-R8
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 05:25:04 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-81f3b227a4aso12204217b3.1
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 02:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786699501; cv=none;
 d=google.com; s=arc-20260327;
 b=GchbRAtpYVf7KF/BKcMT55d1JR5cAl5NI/i/U2Ry/Iu39RM5h3Fmlb4bRliNpFRW36
 Q00vNIKKPPGFFb4vb99ox8lngRymRNjdfepfQcEDPhNDrtPfZ4RQ4k82fIzlJt7WNh0+
 rBFZdGrncOfG7FxGXUwTayHoFIrzcJCt5nXChhgV87JhJPby9MC3VroAQClvHYzBdFSS
 2ttYzlLHDc99jCETonwzEpamf7cDH8J2CuKo7DLUL4031ZpR8cckSS5Z5mUgZV/2DQl7
 tYQ6DstKAfkKfx3tunGjz4V0N3gqdBX5wfWT5RjBA+RvkgeURqImPvE8I9HWtZ3/e9U6
 tQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=D6HXSRZ4cCxR5YTkKMmN9nEy6ALkYJE+zO23hmTEEM4=;
 fh=nCMrLkj/srddSpisZWCbRu5ecDe/JsTln/ZHoyEUtBo=;
 b=EvcFHbgNhHRcAU+n1eeWpkRQ+OATtMx9FUqzkT2U8TXqRAeHtdkBBQXhbjS5G9utn2
 CDAWu84w0RN72OgWbNRL/ak/LPNTfmIhtx2VkP9i/jQWUYo8YwzOlvIo52WpfgsdT9bF
 ooPzYBH1o66GSm+sgwNkXbElJ2dNoFvIZi1Wak089MqTW2zxf5pwO3RWQh15S7cJDlQ7
 Km1cHTQSF0pjJPJm+PQanXJ554u4iSb9qBaWpxpECbJ908xa7pAqogtGiR3MDaB+J06U
 c03raWzjc5FMv8ba+HD1Nnm9XtT//5SVHdZ73GPBhgUUIi95mxUa4O7pOeOPBeyeXsIT
 QP0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786699501; x=1787304301; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D6HXSRZ4cCxR5YTkKMmN9nEy6ALkYJE+zO23hmTEEM4=;
 b=KJqaC5bp9qD0PBEsq+1H5GBJa7JfuEli196MPGrBxwoZ2oGk7CZqApXgaH3umr3QM5
 eQBqIEd31TlcThb4tknaYyoIX2I8BQq1LZ5IfzX6b9daPobdzvA23fFarNrWRyxdijrj
 2ftab8Axs84sBTcIR49dPC/lMlcRpUBDC6LLDNCVP16EoIJhCitu0sGHiIms4BgK9Cub
 Lp710PpUFHmUvLkTeukrQ0lMc6NGUS6HzfyYfElA+8EzzGg1Si/2ESJ0amFDAt05Vvwl
 c4/MWWyem6GgssggY9gfDlGVnHCMPnnfHvFxXvDq8L44cFmsn6SMpCXQbM70XGFGQqUl
 fVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786699501; x=1787304301;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D6HXSRZ4cCxR5YTkKMmN9nEy6ALkYJE+zO23hmTEEM4=;
 b=PpbfQK/FA508lWTs7Axwm2V5yXF9YMl51WeY6YmFzPRJ1NenAiO1NiknBjI8vVR6+L
 TQjfW/omLDUhAbxtd/f7MUNvPn9TFblVftcVo2M4h8zmlqNdbXVUGd5TbbRbF/SehLJU
 qrKDQ857Wf7sPNcZ5fWf9duGAM1I7+evDfhYERYu9NNWgtbAojpxQAtyaQc/KxbkDJfI
 J6JrAsgS9671sWDuN6E8SQF7TVfCVj1NvDXdAXQml8sqAWN5cQYMnlba3DocOgSivUeU
 pLL95x++R9fz906tq6OX+sv/g1W7hQ818leadZe5TnxIY1HjSNQi+o15jjsCMVoSS7Gl
 dI9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLU/N/kKOUXnP7lJhfJZ8p6+v2ftEWUCM2nDuaiyVfLGTu1l6Vqh/bsDrXEo+pyXBQoQJWYFQuUEOm@nongnu.org
X-Gm-Message-State: AOJu0YzHj8gvw8cSBsbfHfzZ51ny51ahZv2ErgJWMZJDnBrrggaMC1qW
 iWwxxLGJQCVujVx0kGc1j9jkA/9CIFnF90R7ZPzqbk3QVH0lY4gV1+8eNs9saC5dNWT+UcPqH4p
 9y/dmE7/+ditUsqxtT+xWDqoHal7oPfE=
X-Gm-Gg: AR+sD10Kvk9W2aD2XbaWL2KumcHQPMqmixWlgXHarVgTUXE2MxjvtE/hMxW+U0RaDVA
 EQskmP0AtYvNvSsPhVmYTHS6AhuAZhPLRZmTvR8qeLaHLEfgSQWpR75JmDE9SB+4Mrba0RH4DAA
 KT54ljaFIuoJzJwr8OyqvSpA2g0CWOe3ET9DDiNBkg2Hp2FFLu7j1b1r7XPUHM+aO8Y93L8BTLs
 Y1TqpNteyCDpFR1q0J5JOFW+qkDlZVyRaixe3awe+d68zMFj/i3s1qO9ttNGZVNvbDLsO8riJuw
 2wCPmo7xY5LotMd13nTxnaqBCHVrdXldDkUITtecuQmx
X-Received: by 2002:a05:690c:60c7:b0:80f:8faa:b8e0 with SMTP id
 00721157ae682-8370ddc82e6mr17751877b3.8.1786699501477; Fri, 14 Aug 2026
 02:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
 <CAAW0U4azckLqyWEy=bGRH3Js8AOeW=rpN2+rgkhVStzC0Jv5mA@mail.gmail.com>
In-Reply-To: <CAAW0U4azckLqyWEy=bGRH3Js8AOeW=rpN2+rgkhVStzC0Jv5mA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 Aug 2026 17:24:50 +0800
X-Gm-Features: AUfX_mxP6UtELlxPE0AMyKHJxX5uJNxkOBR6ppA5gtvNjeXBGvIcYXjsGQ6Q-TU
Message-ID: <CAEUhbmU1LYzeQU39eOhd-S+WY6w7A--MOtmcG+cbTgeyCEMr9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/riscv: Add K230 DWC SSI Standard PIO support
To: Kangjie Huang <flamboyant.h.01@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Kangjie,

On Fri, Aug 14, 2026 at 1:02=E2=80=AFPM Kangjie Huang <flamboyant.h.01@gmai=
l.com> wrote:
>
> Kangjie Huang <flamboyant.h.01@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=
=889=E6=97=A5=E5=91=A8=E6=97=A5 02:30=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Testing:
> >
> > * Built qemu-system-riscv64 and the K230 DWC SSI qtest target.
> > * Ran all 14 K230 DWC SSI qtests, including Standard PIO modes, registe=
r
> >   contracts, interrupts and PLIC routing, and Standard SPI NOR reads.
> > * Standard 1-1-1 transfers were also exercised manually through the K23=
0
> >   SDK U-Boot and Linux SPI paths against the attached flash.
> > * git diff --check passed.
> > * checkpatch.pl reported no code errors; its MAINTAINERS coverage warni=
ngs
> >   are expected because this series does not modify MAINTAINERS.
> >
> > Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> > Suggested-by: Chao Liu <chao.liu@processmission.com>
> > Suggested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
>
> Hi Bin, Chao, and Anirudh,
>
>   Just to clarify, I added the Suggested-by tags in this patch based on t=
he
>  concrete suggestions during the v1v2 review. None of the tags was explic=
itly
>  provided by you. Sorry for any confusion this may have caused.
>
>   Thanks again for your suggestions. Looking forward to your reviews!
>

For review comments raised during a normal process to the *existing*
patches, the Suggested-by is usually not needed.

This tag is mainly used for *new* patches inspired from the review
process / discussion thread.

Regards,
Bin

