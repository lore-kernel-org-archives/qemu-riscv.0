Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C6ECCA462
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 07:48:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHcfO-0007hs-DG; Fri, 16 Oct 2026 03:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHcfH-0007gZ-Tn
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 03:47:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHcfD-0004BE-Ua
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 03:47:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so4126876a12.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 00:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136858; cv=none;
 d=google.com; s=arc-20260327;
 b=WPbmK2LvKyN4fxiQlbTkMNK91f2GqnTUJWCpzb5l+weFv1NMHjlCjG6bWBr7VBY3Kx
 hsFV1Rd7kbty5xPiHzfPYA0ul/FRoZWhA3rcNIa+xRE+Wp0NssM2CUzFwECRpMhqISMb
 C96QGVVOD86zbuyrDz2+gg90QuabfkHs5Bl91gKUfP/NIqBAdw+tsltKQWN5q8beP8gG
 dG45m2wPjKKUb2DjtmqdVUDF9qNO9936g9H2B8jn+R2Djv4MOh2zm0cyyFvpQceoQOlh
 z2BvEphfa5WKj7wDiLttwGlYcdO8jpe2c/SBUyGIw+hOYn8Jbo+QWEM/n0DQWgRxIIfh
 okEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=srAuSQr6+iSCtJhUw4J2OCKggwuluEEaJwvUk6BuSYI=;
 fh=6vA6lfHacbzpP3oaIiYZurmgsH1myyDoDrty9KDg7/c=;
 b=KRpFmH6qqABSpJDJagV9O9ircq5ZKyT8DH2JzNtLvKE1KbHxnTOdxXfpccShiwcYhZ
 EH1gCFQ3zQUDLjzMuNeBhSJOMIHPrZGpy/GbvbG60Y/W92tXqV6WmUbYLRJEuMSxxaIi
 IA7tsOdpk8TVxSOMD2TjlE50gqXo++c2FNWJLLFZOt5nVrPb07zLpIhJxvynNKhkDgau
 RgMboAFpJN2iqXmO2B40Xh6v1+OeUiQN0FBJysYYwfiQgsjwpWBdX7TiYZliYYyyehpN
 GtocKLE5XQc81KFAKWmVpPR1vXRfSvb+VtaLeSizapf16Zo2pRbS8ZjypsQRqcAR6EO/
 dd+w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792136858; x=1792741658; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=srAuSQr6+iSCtJhUw4J2OCKggwuluEEaJwvUk6BuSYI=;
 b=d03pINP7N4OoI7M9dGjrVAOHy58e9Lx35UWWKr6iFo6l242DWl5q7gbEtFUGf/8ppE
 Mi8XNz00+PoNutbBPGh/1Z+89fy9NFbh+LexIkG3cwpeJ9NjrZQS4U68FM3gG9eu7po2
 DtUd1g8tBJTlh/g7TehWaMOfg08xKWfoOPvLOpN/EIbiHWklI2u6Qu5ewg0pdbfHghGO
 cyNmin6rrXrLT0lWLUMquRg1rJB7fPm6imRGqAHWPKeYUSql/azl4N0bBCLs/hlrRahU
 DfUjZPbaR7BX2hAXroUTumWqAuImNWPSKN9QiPLlmDONUEIfE7xpBVFs9i1gEjEcDw66
 buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792136858; x=1792741658;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=srAuSQr6+iSCtJhUw4J2OCKggwuluEEaJwvUk6BuSYI=;
 b=KoS/yNWq4OW+vzPzsWfaZWl956SzJkOX+se7sV3ObeQx8XQArOn8xj7tHJl9u9Nmph
 VOaa+VpwBpt2bM3K8Llnf4qZkB9jhKiJgST8JpVEw+worNLkCXs/oPAslwO4hMDeI17A
 YQP/7bS1HizghXWwdhKgHamvdi+uWmpXWLMOklSW0i6+cPI85iToVdUxsiTWdEnJT7SJ
 MhZ7PHRBX2SUnkVNrOaZyVAqtnnwHSVnK4/5fgwufWpzWnaS/hkRFRp0sJiV+D51AkYV
 bxL9wxxFHM9Yx32Fq7H4JAjhK23o7lwIqO9znq7MOW53SuBMgLO9fnzNKhlbH/Zuc3pL
 nqPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqr2RQNWho0qNidM5a8D/M/vQ4vBO2cjxeURFvWVKYWW30opv9u2beRNpc2sKox/Kop66+/BYhlvBb@nongnu.org
X-Gm-Message-State: AFq9FYIv4sH5nyl2y0YJ7HoVuCqON0RXfkVtam8rhXKVqL5Qb++qN7ZJ
 DHoEFc4kWtAUrqTAeRcq+dn04FMO7CpITuKVsumL4A6iYoFSIBFuZtC7dTDkR5TjogC7SfCCfQL
 rfXJadmeunW1LbeMDTQf8R+cRj/iEqJY=
X-Gm-Gg: AYBFou3nl/nzls9VHNFoo9rvW9StFHdWnfzYJnhLgqvcGrHPLjcLgcwaVlvWdZKuHVZ
 BZJV+JONIngltbYNdkQmpfC+lb/txuW8r9RxHrww/357rlDnTr5+YV/T6oBMFQyshxcQaQm8TlA
 vCL6x2ZfIiW9UQOOPjgbpYApZAD4g4gyZQqau6PPHTnrNtXl+0fg/hvFDZ241Ru5bgl7LEKqgVX
 jt3+vzuTfOwtJUm4EmkfyVJ3ULwSWqL0NuZ6SykAp8Vba7h4/PZM5mIlvvLpq8dvlP6X81aZNAI
 0wrNmLEYxWPm+mkJY+ScPWogkZrfIfZvfOHea5f8LFTNBAarK7eE5Cc=
X-Received: by 2002:a05:6402:1ccf:b0:6aa:b341:3f9a with SMTP id
 4fb4d7f45d1cf-6b17c28f210mr16510987a12.39.1792136857665; Fri, 16 Oct 2026
 00:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261014094224.1976-1-luoyonggang@gmail.com>
 <8f2da1a8-25fa-4773-a9f0-1da56c0d29d4@oss.qualcomm.com>
In-Reply-To: <8f2da1a8-25fa-4773-a9f0-1da56c0d29d4@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 16 Oct 2026 15:47:25 +0800
X-Gm-Features: AclHuK961PcyDjAqx7lE3pGkFXe3kzF7S4W5Wqbv6ZxBAtsQQWgQ686oeQ4dxRI
Message-ID: <CAE2XoE-0B9nc9T_Mn8+HU1h_tKscJYKX1biZ=Lf+p+aMmuxKvg@mail.gmail.com>
Subject: Re: [PATCH 16/34] hw/virtio/virtio-mem: Avoid call to target_info()
 in class_init
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-s390x@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 David Hildenbrand <david@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <laurent@vivier.eu>, 
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x534.google.com
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

On Thu, Oct 15, 2026 at 1:22=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/14/2026 2:41 AM, Yonggang Luo wrote:
> > Done by merge virtio_mem_legacy_guests_properties into virtio_mem_prope=
rties.
> > As we already have vmem->unplugged_inaccessible handle in virtio_mem_de=
vice_realize
> > So we can reject the wrong option in virtio_mem_device_realize, then th=
e call
> > target_info() in class_init no need anymore.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  hw/virtio/virtio-mem.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> > index a4110d61312..81e2192c2fb 100644
> > --- a/hw/virtio/virtio-mem.c
> > +++ b/hw/virtio/virtio-mem.c
> > @@ -879,7 +879,11 @@ static void virtio_mem_device_realize(DeviceState =
*dev, Error **errp)
> >              break;
> >          }
> >      } else {
> > -        vmem->unplugged_inaccessible =3D ON_OFF_AUTO_ON;
> > +        if (vmem->unplugged_inaccessible !=3D ON_OFF_AUTO_ON) {
> > +            error_setg(errp, "'%s' must be 'on' on non-x86 targets",
> > +                       VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP);
> > +            return;
> > +        }
> >      }
> >
> >      if (vmem->dynamic_memslots &&
> > @@ -1568,9 +1572,6 @@ static const Property virtio_mem_properties[] =3D=
 {
> >                       early_migration, true),
> >      DEFINE_PROP_BOOL(VIRTIO_MEM_DYNAMIC_MEMSLOTS_PROP, VirtIOMEM,
> >                       dynamic_memslots, false),
> > -};
> > -
> > -static const Property virtio_mem_legacy_guests_properties[] =3D {
> >      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, Vi=
rtIOMEM,
> >                              unplugged_inaccessible, ON_OFF_AUTO_ON),
> >  };
> > @@ -1635,9 +1636,6 @@ static void virtio_mem_class_init(ObjectClass *kl=
ass, const void *data)
> >      RamDiscardSourceClass *rdsc =3D RAM_DISCARD_SOURCE_CLASS(klass);
> >
> >      device_class_set_props(dc, virtio_mem_properties);
> > -    if (virtio_mem_has_legacy_guests()) {
> > -        device_class_set_props(dc, virtio_mem_legacy_guests_properties=
);
> > -    }
> >      dc->vmsd =3D &vmstate_virtio_mem;
> >
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>
> Not sure what happened with the sending, but it seems like this series
> has been split in two threads.

I accidentally broke the sending procedure, till I found it's too
late, what I am confused about is why when I recover to send
the rest, it's not in the same threads. I am using git-publish.


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

