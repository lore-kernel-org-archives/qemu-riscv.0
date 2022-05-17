Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlUI-0005U4-Lo
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlUE-0005SU-OV; Mon, 16 May 2022 20:54:55 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:42514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlUB-0004Yd-0K; Mon, 16 May 2022 20:54:53 -0400
Received: by mail-io1-xd2c.google.com with SMTP id a10so17779386ioe.9;
 Mon, 16 May 2022 17:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8t1r/FYvJjOIbNCzKOcYVhvJMaQR5WwzeMFp792L68=;
 b=Gbg6R6pf/8os/t5TKSz26nwgT3grvNi7Mp10yIZCnaRJ6X2y50ZWVUuNf3Px2SfYSt
 0uhwYIv3jdLSELNhxXKXAvAQ+7+cMvlibBZeG+meDjkOzx95ZwPLendfRZrzaHHfsroO
 2jAs9C/Lhg0p6X4mAkZJhFL7Ji7Ow2N6TTYVbulUQOHjYh4Q7V204trARe4hebGxIPI+
 4OfYTJyl5bBR/JKHp7TAFFmoEpCID4y1rlCystVCiA0iwyp2Pd4EgVHi+J3CYXY9IZMs
 716pOgCvXh/Q+e0lrDwvqH3omYN0ZPgefIl8T94uuDFphfiqjsaPebnPR41o4eo/iLZX
 aXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8t1r/FYvJjOIbNCzKOcYVhvJMaQR5WwzeMFp792L68=;
 b=5HRJ5D7tcFv+Sr3BO4fUva4ax3/XFbG6QvNZPZq8vmjAUAllDGr/I4V6yAVjkrCWBQ
 o9+ClwKtkp6hyyWd+RKciEnn2ZL17wII5zb1oR1zxdSk5XszSKjOLjm7oUb7R5D0sf7W
 b+1L7Zggm6S31P4KyXFzN6q1TBv00a4DT20mv1ao0kUCpfcjI4TU7D7P42mu+5m7KsQw
 2jCKg/qQzWMgM+k0oglNvO6w3JElX/ff3Y1/X+4GoOj3T+wGCUI/MapW+lVJJhEVH3RF
 420FMVevxX2LkO0/HAjDoDyAqME8fcchH0wzWCqPXqE4JXfo3xygd36HuuA6weZlDHi2
 4A8w==
X-Gm-Message-State: AOAM5330j3zxdA1vMg9wGuoaa1YJIPYxV6q0JlJftqSkp9SvRz0Jp5dE
 zEeZW8me1grNGYu5nM9IyW0MtDU/i/x4OlsuDF0=
X-Google-Smtp-Source: ABdhPJwNahneLFBzCHmPX5ZgM84cQIld4UMlQt3C2GUIzra7tBsaTH2oY499r9rwZOVeA/xj5BigMTZvIpHXlpJ1Log=
X-Received: by 2002:a6b:e406:0:b0:657:baed:ec0b with SMTP id
 u6-20020a6be406000000b00657baedec0bmr9345386iog.27.1652748889585; Mon, 16 May
 2022 17:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
 <20220516033357.12371-2-liweiwei@iscas.ac.cn>
 <CAKmqyKNwjv1MwGqj7LP+jF5AKg8Cpvnwx5U8gKVASFRtCYFirQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNwjv1MwGqj7LP+jF5AKg8Cpvnwx5U8gKVASFRtCYFirQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:54:23 +1000
Message-ID: <CAKmqyKPrx3aEBjqcT4jOG3rfNfU7LCve3QywLVCBsCP-kLcr6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: disable zb* extensions by default
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:54:55 -0000

On Tue, May 17, 2022 at 10:33 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, May 16, 2022 at 1:34 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >
> >  - enable zb* extensions by default will make cpu types(such as sifive-u34) implicitly support zb* extensions
>
> Agh, this is a pain.
>
> Can you enable these by default for the base machines then? That way
> they will be enabled for the virt machine

Actually, come to think of it, we can probably just register the
riscv_cpu_properties for the base cpus. That way only those CPUs can
be configured by the user. Can you do that instead?

Alistair

>
> Alistair
>
> >
> > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> > ---
> >  target/riscv/cpu.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index b12f69c584..a3a17323e7 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -847,13 +847,13 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> >
> > -    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> > -    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> > -    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> > +    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, false),
> > +    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, false),
> > +    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, false),
> >      DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
> >      DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
> >      DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
> > -    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> > +    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, false),
> >      DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
> >      DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
> >      DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
> > --
> > 2.17.1
> >
> >

