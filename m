Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC979EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 02:33:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK8cg-0003vb-95; Thu, 13 Jul 2023 22:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK8ce-0003sg-58; Thu, 13 Jul 2023 22:33:32 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK8cc-0002nS-Om; Thu, 13 Jul 2023 22:33:31 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4438f623370so582704137.3; 
 Thu, 13 Jul 2023 19:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689302009; x=1691894009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGRniExqQC6zYFPnDBU4gori67Idx3tWnRYJj8sOyr0=;
 b=eeZWE+7mdQPLGwtqPqDx1JQwXWmTKKpQjz9c8zziWbDB6LgFXc8LA6BiWQJ3X+vMnN
 p8nUOa6mtvRF32Wr7IIM3z5mwW1lHNyEovw+H+B0PJdhLfsa2WMnwvsXQs3b5HsL+1lw
 vtJPdw9zyetxVlLacQkq6jhYwSxDWcdgkZ3nitipjCBTbqn7ykQvZwr+LUZcxW6ojjc5
 THepF68/BIoI/kr50wO+AtAefNtebBRvFaXsTvTcw/dRPRklE/wwYJJ0lgC39CN1m9a/
 guOqVG+eweQI5OTMOMptzHDIOsZ689PVNDiE/8bzFjj7G35c6coptjuompWcLNSeukSH
 V+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689302009; x=1691894009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cGRniExqQC6zYFPnDBU4gori67Idx3tWnRYJj8sOyr0=;
 b=lbwpNwiJLfoBrEk94IUVLhSU+uW9rC6YQYx/XNH7toT6CkvwaiiOHlPpY8rdp/74wF
 6MOiKrvXmHlEgftKrayvdsqNDi/CeTtD5LwTKaecV2nrv2k2/PRpQo0P721nAVT+8BdE
 eCO3DplOP2lHNWI8R+xu1qq8jtRVmVSMRpH9buqaxpxA9PFG4NG64s8+wQy9aNe7nquT
 w/mSft4dsMyQd7ByjMn3IeLfHo3uiP8GZd4KS/WckILMAL21kjiT+KwjMQp40waCDU8D
 HQ31EbOzNGD8bOLQhi0vLCPQsghK6K3hrME6YaqFPSV4X9TnGPSWuuNHx7cNCH2HOchh
 Aj5A==
X-Gm-Message-State: ABy/qLZ7F4J5ILbRdqthv4BuT2JIOf6CmapoMaeRaIpY6NSWluySHuyA
 3WpQl3pg9DrA8cRmzyjBmq2Tf53He+1vZw5l3y0=
X-Google-Smtp-Source: APBJJlFx80ki/W/6s/33saOED39SjlDuBe4PBIsCmG+wQp9L3FdUjcB6cEY410nITqJxptQlPXY5tAAo6sNaHA5jk0M=
X-Received: by 2002:a05:6102:34c2:b0:443:67a0:fb79 with SMTP id
 a2-20020a05610234c200b0044367a0fb79mr2212960vst.21.1689302009033; Thu, 13 Jul
 2023 19:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230712143728.383528-1-dbarboza@ventanamicro.com>
 <b0ecaf6e-4639-bc29-fdc5-60a064986352@tls.msk.ru>
In-Reply-To: <b0ecaf6e-4639-bc29-fdc5-60a064986352@tls.msk.ru>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 12:33:03 +1000
Message-ID: <CAKmqyKPBEWRSAcwyeF5SQ7NR00ka7u_hyDgX5yREuP6xuvy6TA@mail.gmail.com>
Subject: Re: [PATCH] docs/system/target-riscv.rst: tidy CPU firmware section
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Thu, Jul 13, 2023 at 4:47=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:
>
> 12.07.2023 17:37, Daniel Henrique Barboza wrote:
> > This is how the content of the "RISC-V CPU firmware" section is
> > displayed after the html is generated:
> >
> > "When using the sifive_u or virt machine there are three different
> > firmware boot options: 1. -bios default - This is the default behaviour
> > if no -bios option is included. (...) 3. -bios <file> - Tells QEMU to
> > load the specified file as the firmware."
> >
> > It's all in the same paragraph, in a numbered list, and no special
> > formatting for the options.
> >
> > Tidy it a bit by adding line breaks between items and its description.
> > Remove the numbered list. And apply formatting for the options cited in
> > the middle of the text.
> >
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
> I'll pick this up for trivial-patches, but since it's the only patch ther=
e
> now, it's IMHO better to apply it together with other riscv changes if
> there will be any for 8.1.  So let's pick it to both trees and the first
> to apply wins.

Sounds good to me!

Applied to riscv-to-apply.next

Alistair

>
> Thanks,
>
> /mjt
>
>

