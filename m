Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC74606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gvJ7H61f
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMiUm-0001jc-Kj; Fri, 30 Oct 2026 05:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xMiUV-0001fa-GX
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 05:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xMiUR-0005qL-TE
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 05:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793350895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0kKp64FY09dUFk/LW6vDgxjLXPXjA/VzYL6OdfGV/k=;
 b=gvJ7H61fY4RduLqJJQWL3r6RBY+/CITq+SQXuAB/M9g4boXl5cd3IJ9HaDpEHM/7bcMGDq
 zuWw8LBVFUXwvxk4GNq1Otg+8m9WcgZN46bdZgyEkBzysX8aMIctFzOIFMOE6dTocRkhzq
 aQ+02lPkj5HM9TJHueCVNHkE56gpr3o=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-gsh0hvIKNdaVoYvIlxjisw-1; Fri, 30 Oct 2026 05:01:33 -0400
X-MC-Unique: gsh0hvIKNdaVoYvIlxjisw-1
X-Mimecast-MFC-AGG-ID: gsh0hvIKNdaVoYvIlxjisw_1793350892
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2e9821ca96fso9427605ad.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 02:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793350892; x=1793955692;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=z0kKp64FY09dUFk/LW6vDgxjLXPXjA/VzYL6OdfGV/k=;
 b=cfSi3dWKJRchdrv4AUaH0HrLlrRF0jiC4QiqXfPGXamNDu7och/aaSetjH/logt7/r
 w3u247Dq5lfQpfeo31kjrQ598GFt75vy24AhV+uvlMM2UIQ/hVjXmItTDRMfDPg5qy+Z
 3S94SoAswGkT+55aN4qSfBRQL9Vhm03kPj6Ndjx3n/qdEBBF6nF9AVK0W269WCURq854
 RFZgwHFKIp1gpMML9xeW7zOH7Abo9yMGr9Io/im0HjIHDiW4a102Bt9nKj++LdK0Rr6k
 xy87oicDxOQ8kipoWOwTqiIiZMUtjcZGMQ3gQmesD0e0TIiuK3k8YuXH912+KItAT4Gu
 QtaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8Xw1d6NXy85AGHaMUpz3jpPtKkcN+96MPUx7guDwQE3EiCafCMTBlipVQPUZN+Hh6m5a/2muUPU0T@nongnu.org
X-Gm-Message-State: AFq9FYIwiEbHll4rtCbgmjWx6WoLyelVzybeG8i559LnZG2GSl7BawEM
 fQLUNtVFkaqze+G0jz45riXs/cI4iWZGRwImZCd47RTYKJmOeGkHriuPfjWVUSbtFrx9Qxbpz5I
 T8lUswQjwqJF/XPcD3ulEgEKXHICSf7jiz7Cey3N1aYqX+SEADH1eu5ydRCDyl5BiteRvCyEizI
 d1UIEC9N/VKU2YrBbXNtD07vl5w1rGDVo=
X-Gm-Gg: AYBFou0Wumzl8sEOAv5XtzjizCxQ2m8SfYsrH1i3mReweuwJRXr4cvprApa72VOpIuG
 aJC54rAklfE08WIF49Jjk5RckDrRBG2ZFAm1kqcTLYtBzr0WXnbTPPXi+KJBqzc2uar1D9bkUWO
 +RrGH9GswTdIvnRg606PoJBVnbqvxsgbaHqWJMpJKFZTzxwUIDjQj/y6fgY+b/ZpHf8ZWk5OtP4
 996yGfdqt4rVyfc5U/5WnFUiMOGBEEKtayXYMQ/gtfHR4OhUvb/3H+k2yLEB3MywYwAWMAa54qC
 cg==
X-Received: by 2002:a17:90b:4d05:b0:3ad:c482:ae93 with SMTP id
 98e67ed59e1d1-3ae897f55f1mr1344484a91.27.1793350891386; 
 Fri, 30 Oct 2026 02:01:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4d05:b0:3ad:c482:ae93 with SMTP id
 98e67ed59e1d1-3ae897f55f1mr1344360a91.27.1793350890250; Fri, 30 Oct 2026
 02:01:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
 <20261020-qom-qapi-v7-38-431a86b02b58@redhat.com>
 <87y0bfa81j.fsf@pond.sub.org>
In-Reply-To: <87y0bfa81j.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 30 Oct 2026 13:01:17 +0400
X-Gm-Features: AclHuK98dJOvD1KtoAB9Z7J96maRIl_qDeI5itEWow68bU5XOo3fY2yUQSfcL4E
Message-ID: <CAMxuvaya+Tihnwjf8JNjhmhBMwE7XpTF8zPL7tbfb8DFiAV62g@mail.gmail.com>
Subject: Re: [PATCH v7 38/65] qom: convert scalar properties to QAPI-aware
 registration
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
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
X-Mimecast-MFC-PROC-ID: WrpDoaajhwpEEd-HDThSfo_CG7vxY4NNeVW9n6pxYzk_1793350892
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Oct 30, 2026 at 12:48=E2=80=AFPM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> How did you create this patch?  It looks almost mechanical.

Repeated grep / multi-cursor in zed iirc

>
> It misses a few conversions, almost certainly in code added since you
> made this patch.  I can take care of them.

Not surprising after several months.

> [...]
>
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 1d91667fb880..bc178482b309 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -24,6 +24,7 @@
> >  #include "qemu/config-file.h"
> >  #include "qemu/error-report.h"
> >  #include "qapi/error.h"
> > +#include "qapi/qapi-builtin-type-infos.h"
> >  #include "hw/pci/msi.h"
> >  #include "hw/pci/msix.h"
> >  #include "hw/s390x/adapter.h"
>
> Not needed; we already include "qapi/qapi-type-infos-common.h".
>
> [...]
>
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 6d421b990cef..64228a620e69 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -26,6 +26,7 @@
> >
> >  #include "qemu/osdep.h"
> >  #include "qapi/error.h"
> > +#include "qapi/qapi-builtin-type-infos.h"
> >  #include "qapi/visitor.h"
> >  #include "hw/pci/pci.h"
> >  #include "migration/vmstate.h"
>
> Missing:
>
>                                        PM_REG_FIELD(acpi_pci_hotplug.root=
),
>                                        object_property_allow_set_link,
>                                        OBJ_PROP_LINK_STRONG);
>    -    object_class_property_add(oc, ACPI_PM_PROP_GPE0_BLK, "uint32",
>    +    object_class_property_add_qapi(oc, ACPI_PM_PROP_GPE0_BLK, &uint32=
_type_info,
>                                   ich9_pm_get_gpe0_blk,
>                                   NULL, NULL, NULL);
>         object_class_property_add_uint8_ptr(oc, ACPI_PM_PROP_S3_DISABLED,
>
> [...]
>
> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > index cca37202ffb2..7b4fd933a8fb 100644
> > --- a/hw/xen/xen-pvh-common.c
> > +++ b/hw/xen/xen-pvh-common.c
> > @@ -9,6 +9,7 @@
> >  #include "qemu/osdep.h"
> >  #include "qemu/error-report.h"
> >  #include "qemu/units.h"
> > +#include "qapi/qapi-builtin-type-infos.h"
> >  #include "qapi/visitor.h"
> >  #include "hw/core/boards.h"
> >  #include "hw/core/irq.h"
> > @@ -413,7 +414,7 @@ void xen_pvh_class_setup_common_props(XenPVHMachine=
Class *xpc)
> >
> >  #define OC_MEMMAP_PROP_BASE(c, prop_name, name)                       =
    \
> >  do {                                                                  =
    \
> > -    object_class_property_add(c, prop_name "-base", "uint64_t",       =
    \
> > +    object_class_property_add_qapi(c, prop_name "-base", &uint64_type_=
info,\
> >                                xen_pvh_get_ ## name ## _base,          =
    \
> >                                xen_pvh_set_ ## name ## _base, NULL, NUL=
L); \
> >      object_class_property_set_description(oc, prop_name "-base",      =
    \
> > @@ -422,7 +423,7 @@ do {                                               =
                       \
> >
> >  #define OC_MEMMAP_PROP_SIZE(c, prop_name, name)                       =
    \
> >  do {                                                                  =
    \
> > -    object_class_property_add(c, prop_name "-size", "uint64_t",       =
    \
> > +    object_class_property_add_qapi(c, prop_name "-size", &size_type_in=
fo, \
> >                                xen_pvh_get_ ## name ## _size,          =
    \
> >                                xen_pvh_set_ ## name ## _size, NULL, NUL=
L); \
> >      object_class_property_set_description(oc, prop_name "-size",      =
    \
>
> Use of &size_type_info is not mechanical.  Better to be as mechanical as
> possible in such a huge patch.

yes, I thought I splitted those appart - I missed some apparently

>
> [...]
>
> > diff --git a/qom/object.c b/qom/object.c
> > index cc113c0810e7..9f9a2abfa08d 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -22,10 +22,10 @@
> >  #include "qapi/string-output-visitor.h"
> >  #include "qapi/qobject-input-visitor.h"
> >  #include "qapi/forward-visitor.h"
> > +#include "qapi/qapi-builtin-type-infos.h"
> >  #include "qapi/qapi-builtin-visit.h"
> >  #include "qapi/compat-policy.h"
> >  #include "qobject/qdict.h"
> > -#include "qobject/qjson.h"
>
> The deletion doesn't belong.
>
> >  #include "qemu/id.h"
> >  #include "qapi/qmp/qerror.h"
> >  #include "trace.h"
> > @@ -2449,7 +2449,7 @@ object_property_add_str(Object *obj, const char *=
name,
> >      prop->get =3D get;
> >      prop->set =3D set;
> >
> > -    return object_property_add(obj, name, "string",
> > +    return object_property_add_qapi(obj, name, &str_type_info,
> >                                 get ? property_get_str : NULL,
> >                                 set ? property_set_str : NULL,
> >                                 property_release_data,
> > @@ -2467,7 +2467,7 @@ object_class_property_add_str(ObjectClass *klass,=
 const char *name,
> >      prop->get =3D get;
> >      prop->set =3D set;
> >
> > -    return object_class_property_add(klass, name, "string",
> > +    return object_class_property_add_qapi(klass, name, &str_type_info,
> >                                       get ? property_get_str : NULL,
> >                                       set ? property_set_str : NULL,
> >                                       NULL,
> > @@ -2519,7 +2519,7 @@ object_property_add_bool(Object *obj, const char =
*name,
> >      prop->get =3D get;
> >      prop->set =3D set;
> >
> > -    return object_property_add(obj, name, "bool",
> > +    return object_property_add_qapi(obj, name, &bool_type_info,
> >                                 get ? property_get_bool : NULL,
> >                                 set ? property_set_bool : NULL,
> >                                 property_release_data,
> > @@ -2536,7 +2536,7 @@ object_class_property_add_bool(ObjectClass *klass=
, const char *name,
> >      prop->get =3D get;
> >      prop->set =3D set;
> >
> > -    return object_class_property_add(klass, name, "bool",
> > +    return object_class_property_add_qapi(klass, name, &bool_type_info=
,
> >                                       get ? property_get_bool : NULL,
> >                                       set ? property_set_bool : NULL,
> >                                       NULL,
>
> Missing:
>
>    @@ -2929,7 +2930,7 @@ object_class_property_add_bool_ptr(ObjectClass *=
klass, const char *name,
>             setter =3D property_class_set_bool_ptr;
>         }
>
>    -    return object_class_property_add(klass, name, "bool",
>    +    return object_class_property_add_qapi(klass, name, &bool_type_inf=
o,
>                                          getter, setter, NULL, (void *)of=
fset);
>     }

Yes, new APIs I missed in updated version

>
> > @@ -2945,8 +2945,8 @@ object_property_add_uint8_ptr(Object *obj, const =
char *name,
> >          setter =3D property_set_uint8_ptr;
> >      }
> >
> > -    return object_property_add(obj, name, "uint8",
> > -                               getter, setter, NULL, (void *)v);
> > +    return object_property_add_qapi(obj, name, &uint8_type_info,
> > +                                    getter, setter, NULL, (void *)v);
> >  }
> >
> >  ObjectProperty *
>
> Missing:
>
>    @@ -2969,7 +2970,7 @@ object_class_property_add_uint8_ptr(ObjectClass =
*klass, const char *name,
>             setter =3D property_class_set_uint8_ptr;
>         }
>
>    -    return object_class_property_add(klass, name, "uint8",
>    +    return object_class_property_add_qapi(klass, name, &uint8_type_in=
fo,
>                                          getter, setter, NULL, (void *)of=
fset);
>     }
>
> > @@ -2986,8 +2986,8 @@ object_class_static_property_add_uint8_ptr(Object=
Class *klass,
> >          setter =3D property_set_uint8_ptr;
> >      }
> >
> > -    return object_class_property_add(klass, name, "uint8",
> > -                                     getter, setter, NULL, (void *)v);
> > +    return object_class_property_add_qapi(klass, name, &uint8_type_inf=
o,
> > +                                          getter, setter, NULL, (void =
*)v);
> >  }
> >
> >  ObjectProperty *
> > @@ -3006,8 +3006,8 @@ object_property_add_uint16_ptr(Object *obj, const=
 char *name,
> >          setter =3D property_set_uint16_ptr;
> >      }
> >
> > -    return object_property_add(obj, name, "uint16",
> > -                               getter, setter, NULL, (void *)v);
> > +    return object_property_add_qapi(obj, name, &uint16_type_info,
> > +                                    getter, setter, NULL, (void *)v);
> >  }
> >
> >  ObjectProperty *
>
> Missing:
>
>    @@ -3030,7 +3031,7 @@ object_class_property_add_uint16_ptr(ObjectClass=
 *klass, const char *name,
>             setter =3D property_class_set_uint16_ptr;
>         }
>
>    -    return object_class_property_add(klass, name, "uint16",
>    +    return object_class_property_add_qapi(klass, name, &uint16_type_i=
nfo,
>                                          getter, setter, NULL, (void *)of=
fset);
>     }
>
> > @@ -3047,8 +3047,8 @@ object_class_static_property_add_uint16_ptr(Objec=
tClass *klass,
> >          setter =3D property_set_uint16_ptr;
> >      }
> >
> > -    return object_class_property_add(klass, name, "uint16",
> > -                                     getter, setter, NULL, (void *)v);
> > +    return object_class_property_add_qapi(klass, name, &uint16_type_in=
fo,
> > +                                          getter, setter, NULL, (void =
*)v);
> >  }
> >
> >  ObjectProperty *
> > @@ -3067,8 +3067,8 @@ object_property_add_uint32_ptr(Object *obj, const=
 char *name,
> >          setter =3D property_set_uint32_ptr;
> >      }
> >
> > -    return object_property_add(obj, name, "uint32",
> > -                               getter, setter, NULL, (void *)v);
> > +    return object_property_add_qapi(obj, name, &uint32_type_info,
> > +                                    getter, setter, NULL, (void *)v);
> >  }
> >
> >  ObjectProperty *
>
> Missing:
>
>    @@ -3091,7 +3092,7 @@ object_class_property_add_uint32_ptr(ObjectClass=
 *klass, const char *name,
>             setter =3D property_class_set_uint32_ptr;
>         }
>
>    -    return object_class_property_add(klass, name, "uint32",
>    +    return object_class_property_add_qapi(klass, name, &uint32_type_i=
nfo,
>                                          getter, setter, NULL, (void *)of=
fset);
>     }
>
> > @@ -3108,8 +3108,8 @@ object_class_static_property_add_uint32_ptr(Objec=
tClass *klass,
> >          setter =3D property_set_uint32_ptr;
> >      }
> >
> > -    return object_class_property_add(klass, name, "uint32",
> > -                                     getter, setter, NULL, (void *)v);
> > +    return object_class_property_add_qapi(klass, name, &uint32_type_in=
fo,
> > +                                          getter, setter, NULL, (void =
*)v);
> >  }
> >
> >  ObjectProperty *
> > @@ -3128,8 +3128,8 @@ object_property_add_uint64_ptr(Object *obj, const=
 char *name,
> >          setter =3D property_set_uint64_ptr;
> >      }
> >
> > -    return object_property_add(obj, name, "uint64",
> > -                               getter, setter, NULL, (void *)v);
> > +    return object_property_add_qapi(obj, name, &uint64_type_info,
> > +                                    getter, setter, NULL, (void *)v);
> >  }
> >
> >  ObjectProperty *
>
> Missing:
>
>    @@ -3152,7 +3153,7 @@ object_class_property_add_uint64_ptr(ObjectClass=
 *klass, const char *name,
>             setter =3D property_class_set_uint64_ptr;
>         }
>
>    -    return object_class_property_add(klass, name, "uint64",
>    +    return object_class_property_add_qapi(klass, name, &uint64_type_i=
nfo,
>                                          getter, setter, NULL, (void *)of=
fset);
>     }
>
> > @@ -3169,8 +3169,8 @@ object_class_static_property_add_uint64_ptr(Objec=
tClass *klass,
> >          setter =3D property_set_uint64_ptr;
> >      }
> >
> > -    return object_class_property_add(klass, name, "uint64",
> > -                                     getter, setter, NULL, (void *)v);
> > +    return object_class_property_add_qapi(klass, name, &uint64_type_in=
fo,
> > +                                          getter, setter, NULL, (void =
*)v);
> >  }
> >
> >  typedef struct {
>
> [...]
>
> > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > index b2c7260c80a4..3a36fa4d0b95 100644
> > --- a/target/i386/sev.c
> > +++ b/target/i386/sev.c
> > @@ -3266,7 +3266,7 @@ sev_snp_guest_class_init(ObjectClass *oc, const v=
oid *data)
> >      x86_klass->adjust_cpuid_features =3D sev_snp_adjust_cpuid_features=
;
> >      x86_klass->kvm_type =3D sev_snp_kvm_type;
> >
> > -    object_class_property_add(oc, "policy", "uint64",
> > +    object_class_property_add_qapi(oc, "policy", &uint64_type_info,
> >                                sev_snp_guest_get_policy,
> >                                sev_snp_guest_set_policy, NULL, NULL);
> >      object_class_property_add_str(oc, "guest-visible-workarounds",
>
> Missing:
>
>    @@ -3290,7 +3290,7 @@ sev_snp_guest_class_init(ObjectClass *oc, const =
void *data)
>         object_class_property_add_bool(oc, "secure-tsc",
>                                       sev_snp_guest_get_secure_tsc,
>                                       sev_snp_guest_set_secure_tsc);
>    -    object_class_property_add(oc, "tsc-frequency", "uint32",
>    +    object_class_property_add_qapi(oc, "tsc-frequency", &uint32_type_=
info,
>                                   sev_snp_guest_get_tsc_frequency,
>                                   sev_snp_guest_set_tsc_frequency, NULL, =
NULL);
>     }
>
> [...]
>

Are you working on v8 or should I start rebasing?


