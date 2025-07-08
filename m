Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D27C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:43:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZG4e-0000Id-CL; Tue, 08 Jul 2025 17:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uZEor-0002NB-JP
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 16:21:52 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uZEom-00078c-H7
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 16:21:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4323138f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752006089; x=1752610889; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQg1U2+XoupD+/uBBR/2LcQOzOJ+N0JH7NogmEfGDEc=;
 b=t5PWxfDthr1m11bVTQxNwynBqqraI2nr5n+U9Hb1g+gPiQ9uKMUC0Lsxf3OxXPJM++
 4mVigaf1jo7etiswgqFL8ySMt5PTIgxcGEnicYZtBx5wcgq/lktNtfzUhofkvHoRvSLz
 VZSGtdJ74smm7IMSRBNYFebUkkgvP8kN9Xe1BwFdQcyXa+DWmo1nzCPjUQZ1Ye9/6/Fc
 Hr2o2NUsaMCL7B5dk648p1skTK12GWYA6oA7fwnuo1cv3Ka3fG+9mNGXuVqJC0ZTOBuX
 hKBG5cLcoAUP2KffBGuq+voAgiANKsUqXzpmX82vepvKNHCY0IDNY2a3nU3S6yCbXidV
 kU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752006089; x=1752610889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQg1U2+XoupD+/uBBR/2LcQOzOJ+N0JH7NogmEfGDEc=;
 b=TuIFqSmyPH3Dpq4VgF2Gm/1PMJgolJOcgWRKnEJnDefGlcX/N3bO9+tpZsezRDpMcW
 AGIGLxN8qPG4Nwqt4BEANE/45puTlvPPCAafHV0XF8+Llap6A0eKsDsaR3P0Kh4GbaBb
 oXe3Fiog55xn/QFYTwzajU45xeucfh4X3t093jfCg4hp1AZTqcsIMh9BGxhtk5bFOHtU
 84w2ku3A/Wov1YJ3/dUzrNo2wWjnA4Sgot3TkVOR9lq2l4m/GhLZke2sa9FFlSDoHsoG
 BlsjWvHXkXu9PMIe9QEIWKoKw9lUAYMJD8Ih7d/ObWl6mEMAphvVAr8DnEFUY3MQXmvY
 0JEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvpK00wFhS2kSfowIVrliZ+itY7bMEXuozOjrt/ANsijj78y8FdB9QRSGxJslYaEuMzxZq6TNyTXms@nongnu.org
X-Gm-Message-State: AOJu0YxkoMBXDWo2RF3AdTifegGKJ/UF8jIWDSwvi9cobiGj5/LRV5Km
 w+16Urw1dtjJyqBRdNGSDC30UMtJOdxsYrzoJGFJiQpHKWuUYHxOqZw2RIBzHK5FN168yGuybws
 xb1M/hUWSY0lLef6IjUquAImRoIpjUhKUEdm4Be20mOlWKQ8wQ90DITzbFw==
X-Gm-Gg: ASbGnctDdauz8tqRfCJptngbd/lju4msSxIDg/SWmefyC2J+bBWXRTGeyL71Lp50eCt
 ps8NZmeM5i1VCxTo7+PaWqOeAAPCHaKVnqa1bcnztev3rXVd1v+ckUose0UoUTde57g10/dRUvl
 rP52kVv4K+Ea9C4dwoHbl4izqfszok/hQX/DvGwviVZZw=
X-Google-Smtp-Source: AGHT+IFburVw1hizbvDQxzPtEKA3nIQ0IPJ+hY3ga2jm7Z6oOpeaBfxiuSgcvxj26gViSd07j+qiqF33I8IeE4IO2NU=
X-Received: by 2002:a05:6402:50ce:b0:607:f431:33f8 with SMTP id
 4fb4d7f45d1cf-60fd6d90e62mr13233911a12.24.1751978888019; Tue, 08 Jul 2025
 05:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707172009.3884-10-philmd@linaro.org>
 <64700490-e94b-405e-92cf-2ffc25537aea@linaro.org>
In-Reply-To: <64700490-e94b-405e-92cf-2ffc25537aea@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 8 Jul 2025 15:47:41 +0300
X-Gm-Features: Ac12FXw5KF01xgndAvFeGd4-CQpBdvD1kuXl_DZa5g30WQyZgUwgRlY7_b-Qf9k
Message-ID: <CAAjaMXZjFjDp6aSRVmJ4kZ_a13Hyg579nM743D0XatQoYR9cFg@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v6 09/14] hw/virtio: Build various files once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, 
 qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

On Tue, Jul 8, 2025 at 1:17=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> (Forgot to Cc Manos)
>
> On 7/7/25 19:20, Philippe Mathieu-Daud=C3=A9 wrote:
> > Now than various VirtIO files don't use target specific
> > API anymore, we can move them to the system_ss[] source
> > set to build them once.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   hw/virtio/virtio-config-io.c |  1 -
> >   hw/block/meson.build         |  6 ++++--
> >   hw/virtio/meson.build        | 20 +++++++++++---------
> >   3 files changed, 15 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-config-io.c b/hw/virtio/virtio-config-io.=
c
> > index ad78e0b9bc5..f58d90b6e31 100644
> > --- a/hw/virtio/virtio-config-io.c
> > +++ b/hw/virtio/virtio-config-io.c
> > @@ -11,7 +11,6 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "hw/virtio/virtio.h"
> > -#include "cpu.h"
> >
> >   uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
> >   {
> > diff --git a/hw/block/meson.build b/hw/block/meson.build
> > index 655704471a5..43ed296cf47 100644
> > --- a/hw/block/meson.build
> > +++ b/hw/block/meson.build
> > @@ -13,7 +13,9 @@ system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: fil=
es('m25p80_sfdp.c'))
> >   system_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
> >   system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
> >
> > -specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.=
c', 'virtio-blk-common.c'))
> > -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-u=
ser-blk.c', 'virtio-blk-common.c'))
> > +specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.=
c'))
> > +system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk-co=
mmon.c'))
> > +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-u=
ser-blk.c'))
> > +system_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('virtio-bl=
k-common.c'))
> >
> >   subdir('dataplane')
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index 164f6fd995a..3ea7b3cec83 100644
> > --- a/hw/virtio/meson.build
> > +++ b/hw/virtio/meson.build
> > @@ -1,6 +1,7 @@
> >   system_virtio_ss =3D ss.source_set()
> >   system_virtio_ss.add(files('virtio-bus.c'))
> >   system_virtio_ss.add(files('iothread-vq-mapping.c'))
> > +system_virtio_ss.add(files('virtio-config-io.c'))
> >   system_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virti=
o-pci.c'))
> >   system_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virt=
io-mmio.c'))
> >   system_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('vi=
rtio-crypto.c'))
> > @@ -10,11 +11,11 @@ system_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV',=
 if_true: files('vdpa-dev.c')
> >
> >   specific_virtio_ss =3D ss.source_set()
> >   specific_virtio_ss.add(files('virtio.c'))
> > -specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
> > +specific_virtio_ss.add(files('virtio-qmp.c'))
> >
> >   if have_vhost
> >     system_virtio_ss.add(files('vhost.c'))
> > -  specific_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c')=
)
> > +  system_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
> >     if have_vhost_user
> >       # fixme - this really should be generic
> >       specific_virtio_ss.add(files('vhost-user.c'))
> > @@ -43,22 +44,22 @@ if have_vhost
> >     endif
> >     if have_vhost_vdpa
> >       system_virtio_ss.add(files('vhost-vdpa.c'))
> > -    specific_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
> > +    system_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
> >     endif
> >   else
> >     system_virtio_ss.add(files('vhost-stub.c'))
> >   endif
> > +system_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('=
vhost-user-vsock.c'))
> > +system_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio=
-rng.c'))
> >
> >   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files(=
'virtio-balloon.c'))
> >   specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('=
vhost-user-fs.c'))
> >   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('vi=
rtio-pmem.c'))
> >   specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vh=
ost-vsock.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files=
('vhost-user-vsock.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virt=
io-rng.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('vir=
tio-nsm.c', 'cbor-helpers.c'), libcbor])
> >   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('vir=
tio-mem.c'))
> > -specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files(=
'vhost-user-scmi.c'))
> > -specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_=
SCMI'], if_true: files('vhost-user-scmi-pci.c'))
> > +system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: files('virtio=
-nsm.c'))
> > +system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('cbor-=
helpers.c'), libcbor])
> > +system_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('v=
host-user-scmi.c'))
> >
> >   virtio_pci_ss =3D ss.source_set()
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-v=
sock-pci.c'))
> > @@ -67,6 +68,7 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_t=
rue: files('vhost-user-blk-
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vho=
st-user-scsi-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-sc=
si-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost=
-user-fs-pci.c'))
> > +virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhos=
t-user-scmi-pci.c'))
> >
> >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virti=
o-crypto-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('v=
irtio-input-host-pci.c'))
> > @@ -85,7 +87,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true:=
 files('virtio-mem-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa=
-dev-pci.c'))
> >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MD', if_true: files('virtio-md=
-pci.c'))
> >
> > -specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_=
pci_ss)
> > +system_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pc=
i_ss)
> >
> >   system_ss.add_all(when: 'CONFIG_VIRTIO', if_true: system_virtio_ss)
> >   system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
>

