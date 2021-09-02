Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLcl5-0005dJ-Fr
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 22:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLcl3-0005bf-HM; Wed, 01 Sep 2021 22:47:17 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLcl1-00032E-Td; Wed, 01 Sep 2021 22:47:17 -0400
Received: by mail-yb1-xb32.google.com with SMTP id n126so925371ybf.6;
 Wed, 01 Sep 2021 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=brhRemfDHzlCCPJ5OFn3TntGfjFg2CgLiycx0HSJb/Q=;
 b=ITQcJ5FoRdkO12d0CC7JeFP4qA+XZCkDL2Tqu1MaWZWfga3PVUtHdMsoU6Anxq2+5X
 QpTwVfBR9fyS+vwN77vzZcqw/xreFsyS041ulC23VFPsA6kDL9jUe1q85EWdY5yCPy54
 R/lWWtzIXVBWA7iWHUmgieONDrSUG3xfj2sHGVPt1r8snbczmLqDmwZLb9AALaHZ14YS
 Wp1qoukCnQzaPds229y0LCT0CDjLQPcJ7L/AZ9nhHIfoIDRnEqhGQpJ0NrTrmQBaSGJs
 JjhskAxpWXoLewUoBjh9l7pNfHUNeBsgDGPS1ttPFe0pIj6qowb2RlQrQMfA2prX72ld
 V5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=brhRemfDHzlCCPJ5OFn3TntGfjFg2CgLiycx0HSJb/Q=;
 b=bmZYRjNdHFmj5zAZl+4GJ+TwNkA2iR8+gl82hkBTkqkx+UyjGNCwPuwTSwzspytUqY
 K41GOdr1oePuZ1jOz9B/CNCC83f25+70FfholU5M6nBdelt5DARn/m7sOX69WjNwk1xP
 1bLPjWLznS2A9u6UkJUPvvNpbXqGEKTzbe5CykYtVKpCTrud8d4IAGZzJoHjWGOdQEAa
 0B9qm3w5TYjc3UUmE61NN2+qe7F0eHNS919vhoWJ9gNThSOr3qfK6PaEd/2kh61H+a/y
 y1EiLZ/WNCQBArcAL6h4/MGGWgQgoU1yPc1E30UMd6n2cO+cE7fKjJ1ntCZtxLSTuPO5
 nP5Q==
X-Gm-Message-State: AOAM531qmUUXsQ4JszyyLdL3VNCM1bQDib76KiinNaA/kqxn5Tgnn5n/
 YEfiqBuYfIEJr81OiWbIaJAVLUQSP92VUBVKC3QAWWOpfII=
X-Google-Smtp-Source: ABdhPJy9CPlzGaRUiSf9Afi2vvBATjXDTP+N2uzaGXGy+62vfjhoBPTq8+vBerputq34GQFvTK41JHUicmuuX4avBss=
X-Received: by 2002:a05:6902:100e:: with SMTP id
 w14mr1436852ybt.239.1630550834629; 
 Wed, 01 Sep 2021 19:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
 <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
 <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
 <e5f5e2b1-8fc5-31de-c927-1ae7545957f8@c-sky.com>
In-Reply-To: <e5f5e2b1-8fc5-31de-c927-1ae7545957f8@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Sep 2021 10:47:03 +0800
Message-ID: <CAEUhbmVCYZ2j6Vp0g4JjHf5XmTDFW+wm5PoT4MmMjUvrfGpkeA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix satp write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 02 Sep 2021 02:47:18 -0000

On Thu, Sep 2, 2021 at 10:44 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/9/2 =E4=B8=8A=E5=8D=889:59, Bin Meng wrote:
> > On Thu, Sep 2, 2021 at 9:02 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >>
> >> On 2021/9/1 =E4=B8=8B=E5=8D=889:05, Bin Meng wrote:
> >>> On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrot=
e:
> >>>> These variables should be target_ulong. If truncated to int,
> >>>> the bool conditions they indicate will be wrong.
> >>>>
> >>>> As satp is very important for Linux, this bug almost fails every boo=
t.
> >>> Could you please describe which Linux configuration is broken?
> >> I use the image from:
> >>
> >> https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/browse/=
output/images/
> >>
> >>>    I have
> >>> a 64-bit 5.10 kernel and it boots fine.
> >> The login is mostly OK for me. But the busybox can't run properly.
> > Which kernel version is this?
> 5.10.4
> > Could you please investigate and
> > indicate in the commit message?
> >
> > I just tested current qemu-system-riscv64 can boot to Ubuntu 20.04
> > distro user space.
>
> Very strange.  This will cause tlb_flush can't be called in this function=
.
>

Did your kernel enable asid?

Regards,
Bin

