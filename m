Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D07C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 16:29:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzGVD-00012l-Ei; Wed, 26 Aug 2026 12:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wzGVB-00012A-Bu
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:29:25 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wzGV9-00031w-Ed
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:29:25 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66c70d73210so1666699d50.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 09:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787761762; cv=none;
 d=google.com; s=arc-20260327;
 b=Fxraq1mF4YUY7teL2kNgeSfk8+7h+ixHIvkKniiqqBi+OeFcakZre+gp3064uJVr8t
 XKCjjoN/a1RA+my/iO67GERoin6C3pzyOJDHHBKOuI34fIYKCQNqE1sNiz3xqXxKGM/L
 lxkL20qVWzdpNjYZ6bSzvKHXv8/B0ISM5wjtXju0P1ah3PNUWE4NkjA3pn3sJEzgjm2q
 XRJTgESNfxv4BXpM7qiQ3s6hiMBfO+wXvW02SgbbqcTAelyWWD1wc1aoKo36/ktGnHDV
 isbj9dTtX8n48dvakHSX55QtqDYVLPMRCoNwabKE3fpZIBN5dVTGXdYg8sXfx7cufKdW
 4IDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OXF1nfY1G02W5U3tqjZ+o1yJ/iYl9amwN0jQLypSbMY=;
 fh=QmFnJZPZyydk9zhQahJMtz312b9sznEL1CHiJjSE//c=;
 b=clHldAUL0e7m/cQHDGKTdyrXJ4HR/myEpIenBep+3dY7hlM1QZMUIvh+t2yc1/0BAL
 QOS5GduZphpEzqLHwxB3PW/bjz2XD3z4gZTfF0QIzuXfG33VokyUpv2POtKf5F5ZaTVP
 +UjYmHts7oNJ2dyk+QYXpHCLwD6OLOJwoH46RaNERFGvKkXmNCKVQgz9V7erJjKnx66K
 AyZgInk47eYKlRnwggwkmk+lqc8oCo2HWdCxNYIZChISF7Xo0iw7zY0OOcuqMZKGwb2o
 K0wIFwjZMJzo8RJgm0mGJfTx76aPKXQoMRfHEzR2qlcB3zaYU36d5htTiS0bjorVsFoX
 hEug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1787761762; x=1788366562; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OXF1nfY1G02W5U3tqjZ+o1yJ/iYl9amwN0jQLypSbMY=;
 b=BT4VNs21ZAwTdQ26YLxdNRAHFu4FrePWuTkF3ekRA/nm/20KyejFB/lwGMU3JsEQHh
 7LU7SyibE4XF92G2YAaWZ1Bera9HqvYCeosHQJy880PPaNgSw6p+MmAboJTmvPJkF1fi
 3731ppxxhJzPzuLfUW3Pu1lEEhjpa2yBFckfy9Fko3fy6wE2d1m/o1gHc2QZXWtBj8Td
 K0dgO7zSVMw8WstA+QzVrMgwZA8b8nAauAjNPT5oqzhvKtqJ9Rq2pohcfgmys+0vQS1H
 Sox8AUGThCAVuPyQA7vMHGog/eP+4YtpJTsZrPAbj3nY77zfna6EDSSmFfx8TSOqFGCH
 HpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787761762; x=1788366562;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OXF1nfY1G02W5U3tqjZ+o1yJ/iYl9amwN0jQLypSbMY=;
 b=T87lKItlYnvbMPqpsVcrA1M47xmmAYG9zmL2D7ZFwiEhUCP05cgvKQEpUpBXooyZjt
 4j7nhSY3OLGfXVKf1HNupOTiCl7A1TQ1hFH0bc9COWxkJUBmoC3KBDMsc15O7QHB6hZX
 SDoPdfoVXeyYuEesWvhFIw8qW+VDNkvwpIE1s1FGb3Azx9yyMv70Yxsn1YCKAur+u24Y
 Xtxg5ih7j3PKnGYDicsyzMudW5O1cvqI7TXalYRBuQbaqf5Nq4bUZ1H7tf7V5Jsn81IU
 jHFmsOHItk3Z38usGThz/EYvAh+1VAguTfAlP9XWzdBdpERuZyZCwgqKwceVyxO2aTe0
 DOWg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8mQLv8Mcte/6bjTtJaDoqwCOizKBb5MiyGY8wV3tucaogmDwKItzCIrtU2t1e/qNB2RQFiYVI6PcY@nongnu.org
X-Gm-Message-State: AFuF++kwf6OvIQ0rLjIUHzOYZFukDgzzCzysusLHUI5X4IqeqX7o7jTI
 DG9geOVHyb5LJxjmAOK3CY+50eF3LjBOFShjueX2OaB8I+Sh6I7wDni+mHXl+JottFFJSY0EOLV
 0f2yf1PRuZCuOOAObZK+e76IEAHl4DYbQ2vYfPW4beQ==
X-Gm-Gg: AR+sD11oSEzpZAhZSdoKLz9uRHP7x1wEWYRo7H5F5YfV8YY+EVKMx9kImx95StUEWal
 qIILumYrv/kf73lO4/1wzQVN92uIkBS0xTLjVd46zo6X+uK0isMlWCl1byEZ8+hJ/1eDTSuCrJu
 1E8Zi6WXOM4f2r6SrBjnfyS5g/vG8vLrB7Tn7IXFg+GABEtu20ljXALx6rr37la2ttkjN38CF8V
 FdsjHVM09DMISVfZZH+clpe/W0hmrujQ6GEJ1qPBXTXuxF6FahH0mgDAFzmOaTvvQ0jDdCSjXV0
 C+5qsvOo0JoKpUiy5fwBo6aS5GrHktAJpA46YEAzdmHZhXdVix9du/IP/eQJBPjEGWmO9WC2f2g
 =
X-Received: by 2002:a05:690e:e8a:b0:66c:d6f6:eaef with SMTP id
 956f58d0204a3-66d25694eeamr2972557d50.18.1787761761980; Wed, 26 Aug 2026
 09:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
 <20260825212326.1907-9-daniel.barboza@oss.qualcomm.com>
 <CAEev2e8fbPt04kcKh5a+ohXYtWPzC5-cD58gcMFS-NV3QQKwSw@mail.gmail.com>
 <f972ec37-676c-42d9-89f0-05879713f75c@oss.qualcomm.com>
In-Reply-To: <f972ec37-676c-42d9-89f0-05879713f75c@oss.qualcomm.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 26 Aug 2026 11:29:10 -0500
X-Gm-Features: AcwNN1VDmwUl_t559iDLSfTuuOH-Ai5b0m_W7oQ5Jnlq5bzum0ne7ggp9t0_Amw
Message-ID: <CAEev2e-+=F_q03SLPxudhArPJn5bu-mphentw_K_-R2kV1eKmw@mail.gmail.com>
Subject: Re: [PATCH 08/13] hw/riscv/fdt-common, virt.c,
 tt_atlantis.c: add create_fdt_uart()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Aug 26, 2026 at 10:05=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 8/26/2026 11:53 AM, Anirudh Srinivasan wrote:
> > Hi Daniel,
> >
> > On Tue, Aug 25, 2026 at 4:24=E2=80=AFPM Daniel Henrique Barboza
> > <daniel.barboza@oss.qualcomm.com> wrote:
> >>
> >> Add a common uart FDT helper to be used by 'virt' and 'tt-atlantis'.
> >>
> >> To accomodate both boards the helper is doing the following:
> >> - an 'additional_reg_props' flag is used to control whether we want
> >>    'reg-shift' and 'reg-io-width' elements added.  OpenSBI won't boot
> >>    with the tt-atlantis board without them, but 'virt' can't deal with
> >>    them being added unconditionally either.
> >> - an 'is_serial0' flag is added to control whether we need to set
> >>    additional properties related to the first serial.  This is require=
d
> >>    because the 'virt' board adds two uarts in the FDT.
> >>
> >> No FDT changes intended.
> >>
> >> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.co=
m>
> >> ---
> >>   hw/riscv/fdt-common.c         | 39 +++++++++++++++++++++++++++++++
> >>   hw/riscv/tt_atlantis.c        | 21 +----------------
> >>   hw/riscv/virt.c               | 44 +++++++--------------------------=
--
> >>   include/hw/riscv/fdt-common.h |  4 ++++
> >>   4 files changed, 52 insertions(+), 56 deletions(-)
> >>
> >> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> >> index f31cc9d3cc..b3f3af3762 100644
> >> --- a/hw/riscv/fdt-common.c
> >> +++ b/hw/riscv/fdt-common.c
> >> @@ -791,3 +791,42 @@ void create_fdt_socket_aclint(void *fdt, ACLINTFd=
tProps *props,
> >>           g_free(name);
> >>       }
> >>   }
> >> +
> >> +void create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
> >> +                     int uart_irq, int aia_type,
> >> +                     bool additional_reg_props, bool is_serial0,
> >> +                     uint32_t irq_mmio_phandle)
> >> +{
> >> +    g_autofree char *name =3D NULL;
> >> +
> >> +    name =3D g_strdup_printf("/soc/serial@%"HWADDR_PRIx, uart_mem->ba=
se);
> >> +    qemu_fdt_add_subnode(fdt, name);
> >> +    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
> >> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> >> +                                 2, uart_mem->base,
> >> +                                 2, uart_mem->size);
> >> +
> >> +    /*
> >> +     * The tt-atlantis board requires these extra props in the
> >> +     * DT, but adding them unconditionally will break OpenSBI
> >> +     * for 'virt'.
> >> +     */
> >> +    if (additional_reg_props) {
> >> +        qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
> >> +        qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
> >> +    }
> >
> > I think the issue is that atlantis uses a uart that has 32 bit
> > register spacing (0x0, 0x4, 0x8, 0xc....) rather than 8 bit spacing
> > (0x0, 0x1, 0x2...). So rather than "additional_reg_props", would a
> > name like "word_addressing" or "32_bit_spacing" make sense?
>
> Works for me.  I'll rename it in v2.

Thanks.

Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

>
> Thanks,
> Daniel
>
>
> >
> > Regards
> > Anirudh Srinivasan
>

