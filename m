Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mEPfJ-0002es-1Y
	for mharc-qemu-riscv@gnu.org; Fri, 13 Aug 2021 01:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEPfG-0002eD-T3; Fri, 13 Aug 2021 01:23:31 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEPfF-0001cf-Cv; Fri, 13 Aug 2021 01:23:30 -0400
Received: by mail-io1-xd29.google.com with SMTP id r72so11690567iod.6;
 Thu, 12 Aug 2021 22:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XmHUaft2EOprVPVVbSoMGqjzfiaDUCJL7guujVz29tU=;
 b=DU51W2DAwwJYgC0fqQpzacBY1MVgIEyAxnEsnKPw4dv9sx3AKmQz2D36XUZFF7pBED
 TOZzW2+a9q8jrnoZyKvZzl7NHc3U1RsRlHZNVFTry2qRuYrtc8qQCld6L51TG3G9KLz9
 iyo1KdKTysInQoR2LV2Q7NXNrdhxHyq5YnEN7c/CUbaXlDG+HhWrNCxtqe5QXmRpzzNt
 xdeDU8z+aKFUPLqMt5EE0Ro1nV1qXx8Zt4u5Is6fwYaCFvqiVVo9Qe+YhR+21F7MPek3
 0RRUXFTJcRnzUrHaHOXn1/RUg2/XR9IYs1BVhf+Iy2iXv7RIjoy8paTcEWFc2taFJFAY
 ZpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XmHUaft2EOprVPVVbSoMGqjzfiaDUCJL7guujVz29tU=;
 b=ulYI09lyvV7rfYEF4vP3QRlkb9dZcDMGTlXCMqJ7tsrIxvy1QNIr8ClYQs6P/GV38k
 xKUxviH9JKLnVe9fxnSg5z+A7qoN3IF5fPLYpdnTKlNGwIpepxvJ7Vzj8u+/sSVd5YtA
 ZrHdtOani1DVsHWYbV30NgFZyXtymp37Iw02Evw+oY50Zjz1zzYAwo3ZzvJhRU6zqJ65
 r/H3NADM2+oKXSfLX5o/X0QDmPGcoJmh7dEiAlxQwik4RoQU6UH4YQH+JWZ7UFdh/Uuo
 uaZb45BMBQwh9E88BpBgyOd2ToG9LyC9aHwSsVIDozxO0s6No+h6PRFVHNrB9pt827ZX
 NeDw==
X-Gm-Message-State: AOAM531u1CZNgARW3EpmL1L2xtUkMnk3n/xtCGlJ3T96z5qOVs7tUTSS
 +75bR4oAvV/JP7J/Hn9+knpJ7lul35X1IrQgqBg=
X-Google-Smtp-Source: ABdhPJzTi58xxbm3oDiigIc4gXYAfGNodf838oMIJBI3M59qv/Sy0fgzbp4WLIkquPp0KCO+OdSa37nf0k/kiAvg9C8=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr567634jak.91.1628832207963; 
 Thu, 12 Aug 2021 22:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-4-ruinland@andestech.com>
 <CAEUhbmU=PN0K+jQzYsbw+0WK6C6w85t2tNGhW0uHJMgfeKvCfw@mail.gmail.com>
 <SG2PR03MB4263ED48818608B30AE3C801D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
 <CAEUhbmXqR0COjJEE5vOvydc06FMtxXnJB-bwsf1v_6+yATPmPA@mail.gmail.com>
In-Reply-To: <CAEUhbmXqR0COjJEE5vOvydc06FMtxXnJB-bwsf1v_6+yATPmPA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 15:23:02 +1000
Message-ID: <CAKmqyKOM1FEaeeWssCBzxT9YeuEODHkPUFDdsj+g5oQzVvyuVg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/4] Adding Andes AX25 and A25 CPU model
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>, 
 =?UTF-8?B?RHlsYW4gRGFpLVJvbmcgSmhvbmco6Y2+5bKx6J6NKQ==?= <dylan@andestech.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 13 Aug 2021 05:23:31 -0000

On Fri, Aug 6, 2021 at 7:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 2:12 PM Ruinland Chuan-Tzu Tsa(=E8=94=A1=E5=82=B3=
=E8=B3=87)
> <ruinland@andestech.com> wrote:
> >
> > Hi Bin and Alistair,
> >
> > >> Adding Andes AX25 and A25 CPU model into cpu.h and cpu.c without
> >
> > > The latest RISC-V core from Andes is AX45 and A45. Should we just
> > > support the latest one?
> >
> > Maybe we can have them all ?
> > AX25 and A25 is still in production, and we still have new clients usin=
g these CPU models.
> >
>
> Does AX25 and AX45 have any significant difference?

My hope is that the way the custom CSRs are implemented means that the
Andes CPUs can be self contained. That way QEMU can support whatever
Andes upstreams and it shouldn't add a maintenance burden on anyone
else.

Starting with a AX25 is fine with me. Whatever Andes is willing to
upstream, maintain and test works for me.

Alistair

>
> Regards,
> Bin
>

