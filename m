Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623A606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Aqa7FbgG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKDci-00006f-DX; Fri, 23 Oct 2026 07:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xKDcd-0008Il-U0
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 07:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xKDca-0006Da-9p
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 07:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792755578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwZKJ1y9GJGdttliesnC6UNJffqn1NZdo/yH29SzxfQ=;
 b=Aqa7FbgG+y24GyAqMkXLrjublyxPemhdCvGAybNmKiR0JKJIM08rOFmhz8RUPT1S/oPtcE
 HvSEb2nUL8qJ9Ls9q2l3yzRH67H9Ig26L5X7U1MskK4yPoe81aDBWD8moPnxVR2Eb7K+dq
 zgiflRKszSi4EgaHr9Ory7liolUJzF8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-DZSa6LzTOyyUSDrjdMKikg-1; Fri, 23 Oct 2026 07:39:36 -0400
X-MC-Unique: DZSa6LzTOyyUSDrjdMKikg-1
X-Mimecast-MFC-AGG-ID: DZSa6LzTOyyUSDrjdMKikg_1792755576
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3ab868fe362so1354360a91.2
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 04:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792755576; x=1793360376;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BwZKJ1y9GJGdttliesnC6UNJffqn1NZdo/yH29SzxfQ=;
 b=kXosqK4psBaG9NGm9kX/gB5ulC2yaLOcl8RDzKQyv881XFoHCwRiTTd8nlHBqi5Sde
 01WpAyrr2H5xLl9f1BZAHturPLTqT6AlVvsqNWjfzO7B6qbZ1SF+SAmM/+r7fjuP6SAz
 /t+Pq1lY8uJGzG2HsNNv5RjV3AOOuehJkAB3k/SB+Wrtfc+Q58MQzi9l1+eML89jF6A3
 ZL8NSeIzb9PfghnY7uPEuDQIvLHyAGxQleram7fCOObtHIiQWID5IA+r7g8uMssGuCyz
 apu5zmq4W1wg+u7xCITZtv0TsLI0yaRz8heANEcvJ8fO8QEin81MbTZEEdvRHcOtfoqc
 mkHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfzSs8ruxl2MQEPuj7KN7BkJNj08SxfdQhpjc3r+pASE5FoLZClB4VXTDDrkxvTLg3FmGsUNVnSzOP@nongnu.org
X-Gm-Message-State: AFq9FYJwhSSONI+K0UWQDXQwrlaLB1Mdyt3pa1Dlt5UXKD+MfTqY3+yp
 Jp4CSlNi/NFtewCd6U1IIsmXGaQmwJq3DoqiCh8/ek4CJuDy/wUkmtRf/Swnsg0Fo1zYQc5omfG
 H9T8JlyN26cSMjyCSiKRPNoe2P9x7bhTeMkA1BEyS9Fsz4LKlYvxZVX77ohScsJGu5bupPGYK6L
 TBvolI7m5JPOqgLVex7Od+9sTmoRSzq4k=
X-Gm-Gg: AYBFou2xuIdrg6N4L+blpV/VCRRZ04/idYCz1stJe666sCBcy3xDKXAUfcIn4K7r1AJ
 ISQx/P/TphTUkCoJdN9GZNBkm2Ay2hsjrsbofxnqllpN4L+4CXf5BTP7ORUi/4TwviMcK9LGwyH
 NEPuxoutM0lbYdf/cQpWW2wbfCD7ctAmvGh9uRUZM/Hy78aNp0QAAY2tt+0HL/mEBl1MEcMBcIo
 VCts4Z6sw/WjpxCQZVSmQsssCMQHrZBN+vuaCACtw9qfa/w8y29Pojbi8zxow8lrnjBNdpeTK0z
 fg==
X-Received: by 2002:a17:90b:4d06:b0:3ac:ffb8:1809 with SMTP id
 98e67ed59e1d1-3adce45dd72mr1525538a91.39.1792755575330; 
 Fri, 23 Oct 2026 04:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4d06:b0:3ac:ffb8:1809 with SMTP id
 98e67ed59e1d1-3adce45dd72mr1525520a91.39.1792755574796; Fri, 23 Oct 2026
 04:39:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
 <20261020-qom-qapi-v7-54-431a86b02b58@redhat.com>
 <atsxLV5YZo8dr-8G@redhat.com>
In-Reply-To: <atsxLV5YZo8dr-8G@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 23 Oct 2026 15:39:22 +0400
X-Gm-Features: AclHuK9JciU6rOmPmxGP7LAL0cKom9fJOgwoGNnQZ4aTaCAv64YMDSwyPsEK5ck
Message-ID: <CAMxuvazd7G_NBOM_c6BxZn5PFSw=XQUHueHqBoQQfpzPPgi9qA@mail.gmail.com>
Subject: Re: [PATCH v7 54/65] qdev: adjust PciDevfn declared type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>, 
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, 
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
 Junjie Cao <junjie.cao@intel.com>, Anisa Su <anisa.su@samsung.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 linux-cxl@vger.kernel.org, 
 qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Sergio Lopez <slp@redhat.com>, 
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>, 
 Xianglai Li <lixianglai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org, 
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <graf@amazon.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, zhenwei pi <zhenwei.pi@linux.dev>, 
 Ani Sinha <anisinha@redhat.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Samuel Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>, 
 FangSheng Huang <FangSheng.Huang@amd.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Aditya Gupta <adityag@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Conor Dooley <conor@kernel.org>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>, Titus Rwantare <titusr@google.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, 
 Peter Xu <peterx@redhat.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Hendrik Brueckner <brueckner@linux.ibm.com>, xen-devel@lists.xenproject.org, 
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Fam Zheng <fam@euphon.net>, 
 Farhan Ali <alifm@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, 
 Tao Tang <tangtao1634@phytium.com.cn>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Jiri Pirko <jiri@resnulli.us>, Eric Auger <eric.auger@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Te3hpxCUxdVpB_sCoSu_5ayqWA3TSM-NBNGEDPfTB_k_1792755576
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.339,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Oct 23, 2026 at 2:04=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Oct 20, 2026 at 02:46:11PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > PciDevfn is a bit special, since it accepts integer and string as
> > setter, but only output integer as getter.
> >
> > Unfortunately, we can't declare an alternate str|int QAPI type for it,
> > since: branch 'string' can't be distinguished from 'integer'
> >
> > Rather than declaring it as "str", use the common type instead.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/core/qdev-properties-system.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties=
-system.c
> > index 5bfdfe1ab9d9..3381de1144d6 100644
> > --- a/hw/core/qdev-properties-system.c
> > +++ b/hw/core/qdev-properties-system.c
> > @@ -904,7 +904,8 @@ static char *print_pci_devfn(Object *obj, const Pro=
perty *prop)
> >  }
> >
> >  const PropertyInfo qdev_prop_pci_devfn =3D {
> > -    .type  =3D "str",
> > +    /* The formatted string accepted by the setter is a CLI convenienc=
e. */
>
> IIUC, this is not limited to the CLI, it will work anywhere the JSON
> syntax is permitted which is both CLI and QMP.
>
> libvirt uses this string syntax:
>
>   -device '{"driver":"pcie-root-port","port":9,"chassis":2,"id":"pci.2","=
bus":"pcie.0","multifunction":true,"addr":"0x1.0x1"}' \
>
> > +    .type  =3D "int32",
> >      .description =3D "Slot and optional function number, example: 06.0=
 or 06",
>
>
> Changing the type to 'int32', where 99% of usage is input only
> and string based, is pretty unpleasant. Even more so that the
> description doesn't even mention encoding dev+function as an
> integer.

This is purely a metadata change, the setter still accepts both str &
int, so I don't think this change blocks this series. But I agree we
could do better.

There are multiple options. We could keep declaring the property as
str instead. In this case, the getter should probably return a string
for consistency and correctness. This might surprise some existing
users though.

We could introduce new properties like `devfn-str` and `devfn-int`
that alias the same value.

We could also introduce a new structured QAPI type.

Markus, what's your take?

thanks

>
> >      .print =3D print_pci_devfn,
> >      .get   =3D qdev_propinfo_get_int32,
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


