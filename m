Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poN2K-0004F1-N0
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 07:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1poN2J-0004Ee-BD
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 07:28:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1poN2H-0006Qo-EX
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 07:28:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id kx14so5228973pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681730919; x=1684322919; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rZApmNWvWpBuSD5WvRrwwc2PGrgouZZVg+WrH/E2Gs=;
 b=v1tLNlJtERD3dCPtVRzHA8oL6RIEYYtIA7tnUDtYQeANOGD63DQ5895F1TC18qyXw+
 OHGWWXoUe/jxRuMfd2whwJOzjYEDZuoHNRufhW5cCgdJi7ahPbJMbputYb+5rTREtuJb
 vTLcur3yK6DYb81yyUGkLHH/raVcYQ3TX5FHMyp0ncC0kKyy/MaV8xDKeuuZX7/M2fP3
 bo20sY4laFd56BkoQzYBenP37FsfAIDqTxJfZfz+8W8uLbDsCmTDhttvkmQTYr9Rr886
 Vmb2uNWyAn1NZWfVTZwFL6KuA6xEg/o9ZfKjzw9aaD9HC55zZaDNTHaKQNmi29jnpVXC
 u3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681730919; x=1684322919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rZApmNWvWpBuSD5WvRrwwc2PGrgouZZVg+WrH/E2Gs=;
 b=lH4IcKxS0nQ8MWchJae5JjTGJ0MX8WzPI/sQwoY6ZPZ0HWh6j14IQvHjEzAO8oWecf
 fNzhP5MQCuaJcw/NCbpr7zSf/RBybY4Q/Fo/c06EsN/S1BYlPypSTXw+bTTrXWO9rXUb
 LPPscYmjd2kRjit6eqrPLrFtyLFaHwWS83Nb6g0T/eZoG3KmM7BTJCwxPhn4bFVKmozn
 QKwZI7H5GFT43EgNkorUsaEcxuA4g34LcKslTQq5TLrPoQjKBkRqnB9iX+j13ENfZNrA
 RfGFa8gBe5sVVqMcI1BxTCOXUMylfmZizSfO41h3CZDpgWiS5ImzI97F5h1D+zPjZZaT
 nbAQ==
X-Gm-Message-State: AAQBX9cCEdEjvTbgpzG2wYfXsN+62yvW1+FDPZetyC94ZnuVwQ97bibX
 +QvtLd8z3v6m8esK2JKfyPjgHyIustmUS0ljIHAfQQ==
X-Google-Smtp-Source: AKy350b6b9hM6abCrY4xxXPcaf4sgGxk6UXyjdWbzml1PXR8HieFSr/SKZtYp5D4kbf0yg9AxmQQV7ym9VWkFnDDgyQ=
X-Received: by 2002:a17:90a:f00c:b0:237:50b6:9838 with SMTP id
 bt12-20020a17090af00c00b0023750b69838mr15245682pjb.45.1681730919170; Mon, 17
 Apr 2023 04:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAECbVCt_+SCiUzv9cOR4KYC7BE_4TjRGqOndzDthUvara8OxMA@mail.gmail.com>
 <c021529c-67ce-fe7c-1acc-7753715c466f@ventanamicro.com>
 <CALw707opvnP59E3LFTNQVvWtNnSnaHaeStQvjaQOJ65gc_Gtgw@mail.gmail.com>
In-Reply-To: <CALw707opvnP59E3LFTNQVvWtNnSnaHaeStQvjaQOJ65gc_Gtgw@mail.gmail.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Mon, 17 Apr 2023 12:28:28 +0100
Message-ID: <CAECbVCu4SvPnzGvzixnn33v_ZhTR3Z_evxMGW08QztbAHhVUNQ@mail.gmail.com>
Subject: Re: KVM QEMU AIA support for RISCV guests
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, Jim Shu <jim.shu@sifive.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 anup@brainfault.org, 
 alistair.francis@wdc.com, Atish Kumar Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 11:28:43 -0000

Hi Youn-Xuan and Jim,

Thanks, that sounds great. Actually I am working on a PoC of CoVE
support in QEMU which requires AIA support.

I will wait for you to post the patches. Meanwhile It would be very
helpful if you can share the code if it's in a public fork. I can start
my work on top of that.

Thanks
Rajnesh

On Mon, Apr 17, 2023 at 11:13=E2=80=AFAM Jim Shu <jim.shu@sifive.com> wrote=
:
>
> Hi Rajnesh and Daniel,
>
> Recently, Yong-Xuan (yongxang.wang@sifive.com) has already implemented
> a series of QEMU v7.2-based patches for KVM-AIA and tested them on the
> QEMU riscv-virt machine.
> She plans to refine the patches and upstream them soon.
>
> Thanks,
> Jim Shu
>
>
> On Fri, Apr 14, 2023 at 8:40=E2=80=AFPM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> >
> >
> > On 4/14/23 08:35, Rajnesh Kanwal wrote:
> > > Hi All,
> > >
> > > I am starting to work on KVM-QEMU AIA support for RISCV guests to ext=
end
> > > kvm accel support added in [0]. This is just to confirm if anyone els=
e
> > > is actively
> > > working on it to avoid duplicate effort.
> >
> > I was going to look into it eventually, but now that you've started I'l=
l sit
> > back and help with reviews and testing and so on.
> >
> >
> > Thanks,
> >
> > Daniel
> >
> > >
> > > [0]: https://lists.nongnu.org/archive/html/qemu-riscv/2021-08/msg0011=
7.html
> > >
> > > Thanks,
> > > Rajnesh
> > >
> >

