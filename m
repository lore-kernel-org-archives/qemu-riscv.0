Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8531CCA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCgb2-0004Pw-70; Fri, 02 Oct 2026 12:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCgav-0004OB-AT
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 12:58:49 -0400
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCgas-0000tV-H1
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 12:58:48 -0400
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6a60591ae54so149515a12.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 09:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960323; cv=none;
 d=google.com; s=arc-20260327;
 b=ZA/RRei+5S8wlNly3WNm+LH7M27n23uAQutGf1hZ6/GLDZJBhdfxnqGWc4pFxPcVfX
 4feH8KuBgnAqpPbL5zbYJc8IoAXuLy2IxT126l6CshcGKY+gxXQjyvALCbcxccke2WhA
 11RialZ313tUJAA3CWSDLhgmLilPVC5Hf/NdA3zpJqtCbfGbjjxRLqytjOZMRO9YYfZC
 yYltUAj0TBEW9NTqRGaW5xBN+pKd0lI3zZBQsrqOvO9DJu7exIP1bq7U1XZ3LZCaSwjy
 iLpivqld1TEU+jVIM3zJ/CROB+v7X0rAjSCFMIq6hUXnJYVMLrrucia8mclS5nKpdF8c
 +f1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=xP5DDHCMbAjbUs3xe/3crv71NDZ6i37Mh/QwccJb0iw=;
 fh=BcvnCN5CqhwjVrmOEfv/LPAh9g+N2P11hcZrXNhhmSg=;
 b=Zqo2wT7ksda9cJ5cAaWVHsAmf3EZSEM3knCeKe3T62KvOdR7gLp/jtISdW/aquhXIF
 aSMXDCuYtZ/Y8EFXpySLG7LM5DXLGmHTuNt455vcVWiuWiKnGVS+w3FEJH19tfNXc0Sp
 ev1+7F+XIwGVaXg64SbdvzXYqCsCVkyUdsjJZkK5N4sZFZ7v2Iz71ZLHOTjUSzKK53bl
 1Rrzbj6HbNYx9Gx3PKH4vkk0MJ/eekm8TMAdFIdS8kiv9UhXzSu1RxWW/WpCoMfNaUKg
 yEnulNI9INiZOGWA8uZA7HuYr0zaUNXH5liSwKce1QZuHuO0vWbrJIubKY0vGGjhL7hT
 lOCQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790960323; x=1791565123; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xP5DDHCMbAjbUs3xe/3crv71NDZ6i37Mh/QwccJb0iw=;
 b=OBkuXYHuP5IP6Q3QVpCgtBEUjLRnfdGlk3/WLm+p4Ypqb893firRw6ebsF4szQTixo
 aOs0uyK/hs03fNXyYN3PYDCjO/hQvojkWFzMQecUE4yRqW790nySpR4JW/6dNJB9yM4r
 YWj5eGj5OZHBrsIVIBhVSVbp+5e7ZPnpv4mt5bko+XwOkke8vUFrFU5Z3pBl8Tyk49cv
 qwQVlDCDlYzDCBAsxnEHK2wNPLEqZwqeKupWgiigQ5/ryZRwdFbLyHYLq0PcfOS2MQel
 uyNeQGR+tWRwJvuiy8lZMO6dwZPmOSutR4lG40wdm3DdBeg0TtAsJjIrghqui26rKnRe
 1YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790960323; x=1791565123;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xP5DDHCMbAjbUs3xe/3crv71NDZ6i37Mh/QwccJb0iw=;
 b=kBhRza1VwQ8fkrBBBZoLoDa7PwrXjr2EXaT0Dnjh6xVenip30bGqyo8pRmz+3dKt4V
 oYdnDajpN1HBCHSEcMYH+QsNs6VZiDbkB/MNE6/Ol57us7Z4DCPtkL8mBZtQ0dkHzyHF
 smBzJfjkPFcMAksDx2nxRiip3q3TCU9cLWfm7RUQuCPart3PYoyX+48OpMfzqFU3CTWV
 nxbAz8asKvVDMNw3SHLYSC9SxjSTw6dkysmrJJ+aZKElNMDg0kkzT2msGVg8AhDKPuBr
 nyhK+ozEKesjI1jyj7hMxhcYVv/iXfuN237FgwWISLeL8tkTCBym9y98DqEht5bfdHIx
 YuQA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzA+Rt26Uy7qJX9boJwXiiP1+bAFmsmxDXdeWYqHgpKitmdhl0P6HWcMicZymMxFfYy6d7KTL4vzv0E@nongnu.org
X-Gm-Message-State: AFq9FYJasPBA3GgR6XoNFAVz6BRgUe7JqBTrqVZbIsy1+EB0avXujQF1
 EvfLsvNWJEZbAopXFSba1VeOlCYrRJqzRI+I25q+3DoUUmfb5Htj7aSKZp1wBFRbQVg2nYDtbik
 otdCu47aGms42EnemXHZ5UXlrr/LRMk0=
X-Gm-Gg: AYBFou1AAlhDm65t46z+XArQabBjZAEYPwf7X++PdVe4I9Gq4BKerS/cGlErNhcuWcV
 S3ZGtWRy7dSpj9UMl4UMHd4Yfjec2tU2CbtukAYgYs8RrtcdmLY9c6ENuIQ0FKJ95HJXU5wipaT
 R4TuEfzGQ+TvWKphhVkv673vbzDprfEgBs2kUMz3Ty3FEl5iaz/juH9cmE1d7chHVmydWnyqNrx
 rzlirjlp7JabmRe4DMR2vTibFRt4FeDNsYDyLy684ZieO4cX100Nzv1Po6TMdWeut9jc+wUhn9c
 z/2+Zy9hQtlYyvH5dR4jOCjxygs3vW4ZYxcc7Gc4LO0RcjVLs3ccGaRYOO6beaQIXp4=
X-Received: by 2002:a05:6402:27c9:b0:6ab:6f77:c4eb with SMTP id
 4fb4d7f45d1cf-6af9e362590mr2151368a12.37.1790960323384; Fri, 02 Oct 2026
 09:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
 <CAE2XoE8MriyEEeRF3uDwWgnJWPHBieK_-pD1+k0tUjROWjDpWg@mail.gmail.com>
 <a9cba466-f442-4bbf-9154-3674b5f10882@oss.qualcomm.com>
 <ar_coT44h5-zJPVV@redhat.com>
 <CAE2XoE8Jg=WHDF1_pQ-K-Y6f_aE2N8y5_=aJSeC4A52HWFwEkA@mail.gmail.com>
 <ar_hNU0Y4BxXKHnv@redhat.com>
In-Reply-To: <ar_hNU0Y4BxXKHnv@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 3 Oct 2026 00:58:29 +0800
X-Gm-Features: AclHuK9oLDsuIH_-0tyf2D0IfUvd5pve5TCsKMnaTRuIfsSbB4TbL5MGHOTOL9s
Message-ID: <CAE2XoE8YbxQobHHhttKHQrEgrMg2Z1XePzwFDKB2g7E1yH1noQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 3, 2026 at 12:52=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Sat, Oct 03, 2026 at 12:43:19AM +0800, Yonggang Luo wrote:
> > On Sat, Oct 3, 2026 at 12:32=E2=80=AFAM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > "is_available" is probably a bit overkill as a mechanism for
> > > introspecting, when we just need to return a list of targets,
> > > Since we have that already we might as well use it initially
> > > though.
> >
> > I have experimented with x86_64/i386 arm/aarch64 riscv32/riscv64 so
> > that I can tell:
> > using is_available will be a better option. As we can use inherent the
> > is_available from
> > parent, if we just use a bit set like QEMU_ARCH_ARM, then that means we=
 need
> > specify it for every single machine. And if any customization is
> > needed, for example, depends
> > on KVM config or other accel config or any condition not just
> > QEMU_ARCH_*, then is_available
> > still needed, so I would insist is_available with a TargetInfo*
> > parameter, then all concern
> > will be addressed.
> >
> >
> >
> > >
> > > > >> Does it matches what you would expect?
> > > > >>
> > > > >> Also, for compatibility with existing binaries, should we accept=
 -M
> > > > >> $arch-virt also? I feel like it does not hurt and would make thi=
ng
> > > > >> simpler to switch between existing and new binary.
> > > > >
> > > > > Same reason -M $arch-virt, indeed like -M $arch:virt,  but $arch-=
virt
> > > > > would be even harder.
> > > > > Because "-" is a valid separator in machine names, ":" is not a v=
alid
> > > > > machine name.
> > > > > So without init QOM, we can not reliably identify "$arch-virt" be=
longs
> > > > > to which target.
> > > > >
> > > >
> > > > From the conversation above, Daniel and I are not in favor to have =
any
> > > > kind of parsing based on this string. So either we'll pick virt, or=
 the
> > > > real qom name, but not anything else.
> > >
> > > Yeah, I'm leaning more towards always exposing the $arch-virt names
> > > in all binaries, and also exposing 'virt' in the traditional
> > > binaries only.
> >
> > I have a question, do we expose the "$arch-virt" as a machine "name"
> > and expose "$arch-virt" as machine qom "typename";
> > or expose "virt" as a machine "name" and expose "$arch-virt" as
> > machine qom "typename".
>
> The human facing machine "name" is the important one.
>
> For the QOM typename, I don't really mind either way. If we can keep
> the QOM typename and human "name" matching that's nice, but if they
> differ, then it is not a big deal - your series has the patch to
> expose the QOM typename in QAPI 'MachineInfo' which addresses the
> only downside of them differing. So whatever approach works best when
> implementing the ideas...

Then it's clear, for
single-target binary:
"virt" as machine "name" and "virt" as qom "typename"
multi-target binary:
"virt" as machine "name" and "$arch-virt" as qom "typename"


So for humans, we still use the familiar "virt". And for libvirt and so on
they still can use the old way to talk with qemu-system-$arch.
And to talk with the new qemu-system, we have returned qom "typename"
for them, the libvirt and so
on needs to be updated(not a big deal) as the qemu-system is a new
thing. If no more new concern
I'll go this direction for this series.

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

