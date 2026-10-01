Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC245CA5FC5
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 01:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC5j2-0003KT-CL; Wed, 30 Sep 2026 21:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xC5ik-0003IA-6v
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 21:36:27 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xC5ii-0006XY-EV
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 21:36:25 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 956f58d0204a3-67408b109e3so2813552d50.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 18:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790818583; cv=none;
 d=google.com; s=arc-20260327;
 b=W3+VOI9gLuWL0ITy8QE4XnUOjuakpMJpZ0K+ZqPVhZD0kADYlCxB4s+Q+G87Weydqw
 zvzRSgdqgk7NDbwGPL3rscIHC0AxerV3do+EL0Kgpw+swma9MagkEny0PNdbB20ueemF
 CX5MdBUkPH0JHttJzGu+CGkN3pQZI+tCL9V9C4G6JRXi63dQHNObAz6SbRvCQHn2n9IG
 7+TYQk2fWi15A+eQ6M9M477D15ofd6clBoLA4gH4s01hgS+OVIbTafR5RGkjyleGfwVj
 uySvCkC069e3KfEHOS/6er5Z8l5VAMGR57qSDCKmQ/T7mEMr24TBe7WXl7Di1+eNKgFS
 zEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=c5+WRzKeSa4ILuYSJKrW5kATAypTCy+ubYGDv/Vfxd4=;
 fh=hko9aOuFQ4svtASgPQq3H9D8maLRm7aYLhRL1KDll3w=;
 b=qonB6+vjqkKj6mOz4YOhRSjss5xksbFAMi/vBkw0KVkgdvvHsezXUNsUbEM8wrnFXf
 m9hwdZWOuaj7ultXagZm051T9hi8NFJY7JlJQZuFN61pRhiS6YHR8vXtS21ECoi7Kecc
 xWiAkNPuM82HiVyP8wx9nPPar8gnsdzJqdVof/lp5ghThGh9tdG/Dx4Y/qMtcFUVLvfz
 aEQeswUyMTOqz4ulAoc46zx3eWaac0Oa7qfG5IiW8C4dIegliwHwfZyNQvLdQ63by1tM
 lhcvA9/TV6yGvCIyYG6exP9vbOInemOPgoaz5/iCLCKctloOaLcJs+e8yCFJICdRS989
 ab0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790818583; x=1791423383; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=c5+WRzKeSa4ILuYSJKrW5kATAypTCy+ubYGDv/Vfxd4=;
 b=D5fnh5f/0qCsxXXg4sH+0cwo7LgYw69cMXhSmiN1zwR7X250WfovNZWTy/e1Elt/G8
 QPOvXWHm2coAXjyzeoedHhwUirUyhz5D+s+7boaPP3XhgHy29bQJy3RLVEVY6CDmc3W4
 QDkZ8XF4nyRjsNid7MjLVkhbwbXv8nbf+rx+Gr/blT5BdZY5s/6SYd6DGwJvwJg4GhKb
 IcEJYhe3mYSLZhB28gDnEefm/KElc3c/fyFtqL/ttKQqxi9YtpL9W8WK0DSI8TXTiM/f
 AWE1qry3Z/2tciss8eeBO8PKIfLt1H9rvU44H234+hZwHU8jDvZUVULmuduPBrcjcbdI
 q3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790818583; x=1791423383;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c5+WRzKeSa4ILuYSJKrW5kATAypTCy+ubYGDv/Vfxd4=;
 b=ooAmVPO0rrk3Awqj7HrtWhp/3eXAeTG5oR1pM2+pV3u8gr2udMyJemOuLvMNWZenJK
 ywBnAF2y4uLI67wr4orkcytxASUzn8kz0dSfbvw+KVeFpnS0Ji0CC3xVWYE2civXdXIv
 /y+OxMFAkUYOVPhWP00I/poi7uWMycoTX/r95ChVisgrw9UlWneP1WRiqCYbKl/VkZAo
 0t3EyFl+ftKeKcUfGHkzcL0V7PpCpwLYAjxiBDSGCqy0/Zel96tAC7bzvEotHNXHxuNp
 OM5piD72MV3MlPq52R3PvhtZr6Wvm46QjsGWzICK9M/EBObercieLWhhAfXcBQP6N2L8
 g0Qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqS5YoFXFpc1D1UDxrn3rB1/Ie03n9cudsIsljXVYS4TpJDGi7z+OQPYp8bgMKDTxWFJwHl5VUyDdl@nongnu.org
X-Gm-Message-State: AFq9FYK6q0FfO74MNZokTSMWKCuhwE0FM5btHs2WvHJnUB91c5UUDJvn
 bJFMfNLVV1DA1yc5PaEJNMXXmUxGhgRlc/w8CFLPwAEvJOoDEzi4B11EfTrbQZf1iZDM0laWiln
 fLXlVS5i7myHUUyQdjaqqqbPAjourbCgLUTMN5wImxw==
X-Gm-Gg: AYBFou1y0INu0V9JeighsNew5rXl0JMaPnJK/WrBnGBHJUBSWxlYzSdbCov4Oq13PGz
 BsTTnAqKZHN8EYMHRINDtIKdK2wRbLg8xQK5qhUolPKnjqjl6EDJ0gYqCHd7ZnwuA6wmZGnJdRR
 N9rAliv/FiRxYEBxcO3K+SLASl9Y5ltVzyMwADNh2hADXtvGXxv2c6Y4nMmJEkSnwewKzCtS8q9
 Nnf9xfoCYQuTIITuhbqK5G+gxPStqgAdIke3iYai2aGt+rflQqJDXAbY5Mf57AVK7fPdZwDdMIW
 W1ecYqdazqV7MYmAmYzawvZ9J/gYStazxEfQw/LG4souMN9ojqrJ0+3RtqN1EHPliB7Ak0BpcL3
 JWx724yY8mlei0ZAZG7PsPf5vnlv546JmADIT6RHmMg==
X-Received: by 2002:a05:690e:450c:20b0:674:19d3:f974 with SMTP id
 956f58d0204a3-67690e1a2demr492579d50.14.1790818582590; Wed, 30 Sep 2026
 18:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
 <20260904-atlantis_prcm-v3-1-8bf20795a381@oss.tenstorrent.com>
 <CACPK8Xdfq5_tTqCfQfwi3tLimbG5YNO8_H39TY67TArPV1Ls1w@mail.gmail.com>
 <CAEev2e-m1JU6qFQ71xHLxGEo1ju4RTEHZG7zGOmB+EWZN3kQWg@mail.gmail.com>
In-Reply-To: <CAEev2e-m1JU6qFQ71xHLxGEo1ju4RTEHZG7zGOmB+EWZN3kQWg@mail.gmail.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 30 Sep 2026 20:36:10 -0500
X-Gm-Features: AclHuK-pzfQSMN0nmmjnPGj5gSByYoCMolJXDUdHYel39IjgYbKs5utNwlAZDIA
Message-ID: <CAEev2e_DKv_bBHo6YFzMTG2QfRdPsnmhY3gfjUUUhghoSfeYng@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc: Add Tenstorrent Atlantis PRCM model
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx2-x0d.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, Sep 30, 2026 at 1:41=E2=80=AFPM Anirudh Srinivasan
<asrinivasan@oss.tenstorrent.com> wrote:
>
> On Wed, Sep 30, 2026 at 1:59=E2=80=AFAM Joel Stanley <joel@jms.id.au> wro=
te:
> >
> > On Sat, 5 Sept 2026 at 00:18, Anirudh Srinivasan
> > <asrinivasan@oss.tenstorrent.com> wrote:
> > >
> > > This device present in Tenstorrent Atlantis has registers that contro=
l
> > > clocks, reset and other misc functionality in the SoC. This commit ad=
ds
> > > models for the RCPU, HSIO, PCIE, MM and 2 DDR PRCMs.
> > >
> > > Co-developed-by: Portia Stephens <portias@oss.tenstorrent.com>
> > > Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > > ---
> > >  MAINTAINERS                        |   2 +
> > >  hw/misc/meson.build                |   1 +
> > >  hw/misc/trace-events               |   4 +
> > >  hw/misc/tt_atlantis_prcm.c         | 446 +++++++++++++++++++++++++++=
++++++++++
> > >  include/hw/misc/tt_atlantis_prcm.h |  51 +++++
> > >  5 files changed, 504 insertions(+)
> > >

> >
> > >
> > > +    }
> > > +
> > > +    if (data & PLL_EN) {
> > > +        s->regs[pll_reg_offset] |=3D BIT(PLL_LOCK_BIT);
> > > +    } else {
> > > +        s->regs[pll_reg_offset] &=3D ~BIT(PLL_LOCK_BIT);
> > > +    }
> > > +}
> > > +
> > > +static const MemoryRegionOps tt_atlantis_prcm_ops =3D {
> > > +    .read =3D tt_atlantis_prcm_read,
> > > +    .write =3D tt_atlantis_prcm_write,
> > > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > > +    .valid.min_access_size =3D 4,
> > > +    .valid.max_access_size =3D 4,
> > > +};
> > > +
> > > +static const MemoryRegionOps tt_atlantis_prcm_rcpu_ops =3D {
> > > +    .read =3D tt_atlantis_prcm_read,
> > > +    .write =3D tt_atlantis_prcm_rcpu_write,
> > > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > > +    .valid.min_access_size =3D 4,
> >
> > Are we sure? Do byte accesses trap on hardware?
>
> The spec defines that all the registers are 32-bit wide and uses word
> addressing. All software that's gonna be using this region also assume
> so and do read words only. Don't think it's worth accounting for this
> weird edge case.

On double checking, the hardware seems to allow byte reads, so I'll
update min_access_size to 1.

>
> >
> > > +    .valid.max_access_size =3D 4,
> > > +};
> > > +

