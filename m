Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3shL-0004kY-5I
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jun 2022 01:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3shH-0004kG-Nl; Wed, 22 Jun 2022 01:14:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3shB-00035I-Nj; Wed, 22 Jun 2022 01:14:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so15655454pjz.1; 
 Tue, 21 Jun 2022 22:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4XLK9dcDIYhTZNcDLNB2EF1PidZ4r4v64k0Cuy8YQdM=;
 b=LbQKRa7OOw0uKsSFxgEipjrJCjEpq6rnFYP/8dFBCS6V91YQWug46tHrY308VtDfSd
 elmC2QnW8MrT2/rIxRZVvogEEkQTXCqG5dlbLOppcSzAM3HXX69zZc5J6VuGJG8FP37t
 XKVD0KzEZmfVAVZHsqhVHciaIhaez39VbuaX8c5O9ecr0gckw+g09La+bCv2lsqIzz1/
 hvI/shdGqHO/FOJxlrMa4PGtO9BgXnyiwz/mxQ19R5By8C06/HfmthSQMiubx4HVMcel
 tfbggRiIS8CDYzHT1mXKDxor2YvFWtaELL0qelzT3zg7vrhjtVa40L/sR3D58w4tW/6N
 bOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XLK9dcDIYhTZNcDLNB2EF1PidZ4r4v64k0Cuy8YQdM=;
 b=WxA1CSOwjuYpiTfEByBw7gm7lMqBf6sbqk+5GUhHjCGlXj5IWd8I1n0npmuaLobexP
 lDe59JdbYFREs/GxUReKsRwdLKzN6N6/N8ndo6RsIxtrI1FyznHjVV/bAo/phqAJqAjX
 +SRnkxdeD4QQuicLvpTD1UH+ed79aJ+jJIFSQ3gUwhn1WIg8TwXBoPenhuUj/r0FwFHR
 dRBHJnTJo32VsjzxqdBhqptq3sliB5u8E4yna2x9lhn8wbyNKaBCDkJNyWrv2HLw7zYR
 bV31cB9+k+KUVssSWhollXNqVJkn9MbApzH8uJK+2mKnAQr3Y5t/fcISwTBm639eTcRC
 Yrjg==
X-Gm-Message-State: AJIora90T2N91l9JE/nwuG6ssx1IUGToBeRBcIQ+U+vNlwJaIktlyF88
 ETN+WnaJ78GGQhOnQ5+ENEIxAsWocghiB/NMVLY=
X-Google-Smtp-Source: AGRyM1v91ubKJDqEdoQhEWe232Pv0i4erzDMTkao1TrrDjvi+dZJPFALPzerNmr38+grTWfwSWmpucj+uUt2SJ2dYcE=
X-Received: by 2002:a17:902:bc4c:b0:16a:4849:ddbe with SMTP id
 t12-20020a170902bc4c00b0016a4849ddbemr1650312plz.25.1655874856242; Tue, 21
 Jun 2022 22:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-5-qemu@ben.fluff.org>
 <CAKmqyKMWz7qgYXjHJLTHbMMkW=Amv0CZqTBg72iHW2Ntx0+HYg@mail.gmail.com>
 <20220621105442.6aghfhqgrx546hlm@hetzy.fluff.org>
In-Reply-To: <20220621105442.6aghfhqgrx546hlm@hetzy.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Jun 2022 15:13:49 +1000
Message-ID: <CAKmqyKN157x-kYFuqss=5svk8hz5SwT3oJcvanwO-v=q7630NA@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jun 2022 05:14:37 -0000

On Tue, Jun 21, 2022 at 8:54 PM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> On Mon, Jun 20, 2022 at 04:47:44PM +1000, Alistair Francis wrote:
> > On Sun, Jun 19, 2022 at 6:14 AM Ben Dooks <qemu@ben.fluff.org> wrote:
> > >
> > > Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
> > > the code.
> > >
> > > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> >
> > Do you mind updating the other machines as well?
>
> I can do, I was wondering if anyone had a good guide how to use cocci
> to do it automatiically as I have been finding it really difficult to
> work out how to automate API changes.

I don't have any tips unfortunately

Alistair

>
> --
> Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/
>
> Large Hadron Colada: A large Pina Colada that makes the universe disappear.
>

