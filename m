Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md4A9-0004sK-Nz
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 01:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1md4A7-0004s0-IL; Wed, 20 Oct 2021 01:29:15 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:46952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1md4A4-0000cQ-Sx; Wed, 20 Oct 2021 01:29:15 -0400
Received: by mail-il1-x12e.google.com with SMTP id w10so20773425ilc.13;
 Tue, 19 Oct 2021 22:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qxcmrzz4ItFdZDjpn59T9wdpGJ+IZN0rWSgZn8U7bRo=;
 b=b5yYh5oTjJAxJAalVOM/T4ju2oRVehQPeWz8hjfC400EAoxsjXlG/Ixk69T9OGbBls
 MdwQ2E4dCo3lqXz5ovdGwjfTqLWJkfiTQ6Z2X3wgEFo/uSI648f5pGgYMml4jROQT+H0
 ZqI7dNmiXWWLMxaHyAxFlNeUtcEb6flNOL8KlDAT1js5Y7xiB3pz4nLyJ1IKl0KXXUL+
 Fe4Q//zKQWjnlfr8nEcsTF6AGlhz7Kksn1yMa/QpySOTCZw8YYPrTk+sdbEE4sUAzv8o
 Wq3Hn/XYKt6uYuvMydrIu30uBCj3GmkXyMMxDuKYTfhWRJY+2HBW8VqfkekPtD5FNaPQ
 JHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qxcmrzz4ItFdZDjpn59T9wdpGJ+IZN0rWSgZn8U7bRo=;
 b=jyDFYVm/tIfoY2AkgbsnwKcNPacYzLdqGvrcmRDaWxlQU4lwHW/2uJTbW8HInBYjHk
 f1fvGTZxWBfd9I8T3VC6xl77w4EEgecM4uI5aPpx6d4A6dbaT5up1t/eiTYkqkA7azAo
 3Zu+X/J12svTtFRYtl510ew+w0yQIThADJn0NNiclVtTTL2KE9zPD9mvzJtp0TGOmBOl
 fLqUUQQc29zmHv08Z+22VqFbL0yPw0+M/eAKIrT4NXly67xga4By0SD+BOeZsngq+YVH
 gMbEl95Nyn0+59KwCptUrH5MAbPEep7Av69PO+qSWO04YMZDwZc+734HUPbv0t1EiweM
 4Xzg==
X-Gm-Message-State: AOAM533dOC9SsibkWC/O82jMFXjiOuMt0qJ/LeyLqc5qc001Gj5ZSxff
 4bCdF/lQSuhNWQpdjcicKZJTUmuNuYa+ztFtl/Y=
X-Google-Smtp-Source: ABdhPJzk8zOebbqpu9G0y57mWF9+XSQeJvfSpJdipeIv/g2/yhVAwJyXf4rsdQreIhxAKcmP0KAkgzkSYLmh5MrMpZQ=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr22260435ilv.290.1634707750312; 
 Tue, 19 Oct 2021 22:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <c6d6ca26-aa14-8950-2aef-2f92803036c6@c-sky.com>
 <3938e703-3000-a11a-a3e6-4a1ffd0e5601@c-sky.com>
In-Reply-To: <3938e703-3000-a11a-a3e6-4a1ffd0e5601@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 15:28:44 +1000
Message-ID: <CAKmqyKPTGSKL_oHKOFacO1=YAQx5VBjbbWE0S8rpBfwhpT_nyg@mail.gmail.com>
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 05:29:15 -0000

On Mon, Oct 18, 2021 at 7:37 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Hi Alistair,
>
> Sorry for the  send error.  And I have a question about this patch set.

Hello Zhiwei,

>
> Firstly, I totally support the vector v1.0 upstream.

Great!

>
> The concern is how to deal with the v0.7.1 code on QEMU. There are some
> products based on the vector v0.7.1,
> such as D1 SOC from Allwinner and  Xuantie CPU  from Alibaba. The Linux
> and GCC upstream for D1 is working in progress,
> and eventually these projects will support v0.7.1 in some way, probably
> as "x-thead-v" (the "thead" stands for Alibaba T-Head).

Yep, so QEMU's stance is to only support the latest version of a draft
specification. Once a specification moves from draft to frozen we will
also only support the frozen spec.

I understand that there is hardware with the v0.7.1 of the vector
extension. But in QEMU we don't have the resources for RISC-V to
maintain multiple sets of draft extensions. Especially the vector
extension, which is very different between v0.7.1 and v1.0 (see the 78
patches in this series).

I realise this is disappointing for companies and people who have
invested in v0.7.1 in QEMU, and I hope it doesn't put anyone off
upstream work. Having the v0.7.1 even for a short period of time has
been helpful for the vector extension development and related
software/tools.

>
> Maybe we can
>
> 1. Drop the v0.7.1 support permanently.
>
> 2. Drop the v0.7.1  temporarily and add  it  back later.

If in the future there is broad community support for v0.7.1 and we
can get some more QEMU resources for RISC-V we can re-evaluate v0.7.1
support. But for the time being it will just be dropped.

There are a few QEMU releases with v0.7.1 support, so you can use
those for development. The v0.7.1 has received a few bug fixes in the
upstream code base which will be beneficial for those using it.

Sorry about that

Alistair

>
> 3. Do some compatible work for v0.7.1 in the v1.0 patch set.
>
> Look forward to your idea. Thanks very much.
>
> Best Regards,
> Zhiwei
>
> On 2021/10/18 =E4=B8=8B=E5=8D=885:01, LIU Zhiwei wrote:
> > Hi Alistair,
> >
> > There is some products based on the vector v0.7.1, such as D1 SOC from
> > Allwinner and  Xuantie CPU  And we have spent a lot of work to
> > support  vector  on QEMU.
> >
> >
> >
> > Allwinner
> >
> >

