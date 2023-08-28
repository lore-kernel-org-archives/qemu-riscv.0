Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE9C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadVy-0001Ju-8f; Mon, 28 Aug 2023 10:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qadVw-0001Jh-EY
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qadVt-0007OW-Ge
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693234004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+mQvhABfTxoyhLnRG4HTwdd1Na4/mvZ9OTyY0NtpP8=;
 b=W9Dblo6blBuU//qI8vL7zTVN5AaeX8+OgM3x2HRYhPGxyvxjF9w5bED6HUxSkXtkB09JzQ
 RmcocSN4Sv13Q01k3FMd10NkrjkTmPSwvH/N8GRWV0EZ0C9bhWcmvtj/4OyWNyeBTpNh29
 j4FjnKz6tFHzhU5vl4sRHak487V5qlI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-LbBHgbe0N5mW0E1dKZ1iuQ-1; Mon, 28 Aug 2023 10:46:42 -0400
X-MC-Unique: LbBHgbe0N5mW0E1dKZ1iuQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-52a06f5f4e2so2673793a12.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234001; x=1693838801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=la0wXIW9eKdFxskg3EnYaYaGDCPF1pneIYfeY+4dcZ0=;
 b=Me0bll7clO2Fm1jyuomkyg/o6tQkwzrGKV5Okr7R4jFCAm0OAWDJIfgsv6+8lkL6dq
 4gV+GFADbC3AKuMhhEoTFCu9I00qBE+J0OvolGmv1H32EH9wwwOgsv18BAU5/Rxb7Tns
 MNSu+e5uPbaLQIayJoXKPwL6cCJVQsjaFF1E1S0+2vG2xx4BlWTSAfMkk0bLXEPVVXQD
 88o0sSOPR4J3TI5AAraiL/pafr0kJD3FfKCrW4LGA3ySX4ABfEx34DpmftFaTROF8n3R
 AHKxcpejYQJerg6DNn3HYm/hbzo1KN/lQm3/De0JVK3HF4yKQSW9E+MDuK+vE/j1lijz
 TVNw==
X-Gm-Message-State: AOJu0YztH5agwgjLT1p5RDTHkKmMQtW3OV00vsdp9GS3hLoIrxBY2/NL
 FJsWDc0MqZYt2FPbvh422xmduq22tHig08toi+JWOWl5IPWKyBYqjfo3lATfmg08O6NqGuh22Jd
 0TglaOklTrU2KqWA=
X-Received: by 2002:aa7:d397:0:b0:522:cb97:f196 with SMTP id
 x23-20020aa7d397000000b00522cb97f196mr21255458edq.36.1693234001080; 
 Mon, 28 Aug 2023 07:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgk9PxOGdwnRyQ4yOWU5l6+eh//VImg7lkpR9gypn7FRAAG5Z90IIOYGc8nmnnwppyoq3HJg==
X-Received: by 2002:aa7:d397:0:b0:522:cb97:f196 with SMTP id
 x23-20020aa7d397000000b00522cb97f196mr21255427edq.36.1693234000707; 
 Mon, 28 Aug 2023 07:46:40 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 v10-20020aa7d80a000000b005233deb30aesm4479916edq.10.2023.08.28.07.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 07:46:39 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:46:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
Message-ID: <20230828164637.52c2b5b0@imammedo.users.ipa.redhat.com>
In-Reply-To: <5f26299e-f1e0-a2ab-db83-87011fe524d5@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
 <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
 <5f26299e-f1e0-a2ab-db83-87011fe524d5@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, 31 Jul 2023 15:07:30 +1000
Gavin Shan <gshan@redhat.com> wrote:

> On 7/27/23 19:00, Igor Mammedov wrote:
> > On Thu, 27 Jul 2023 15:16:18 +1000
> > Gavin Shan <gshan@redhat.com> wrote:
> >  =20
> >> On 7/27/23 09:08, Richard Henderson wrote: =20
> >>> On 7/25/23 17:32, Gavin Shan wrote: =20
> >>>> -static const char *q800_machine_valid_cpu_types[] =3D {
> >>>> +static const char * const q800_machine_valid_cpu_types[] =3D {
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M68K_CPU_TYPE_NAME("m68040"),
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
> >>>>  =C2=A0 };
> >>>> +static const char * const q800_machine_valid_cpu_models[] =3D {
> >>>> +=C2=A0=C2=A0=C2=A0 "m68040",
> >>>> +=C2=A0=C2=A0=C2=A0 NULL
> >>>> +}; =20
> >>>
> >>> I really don't like this replication.
> >>>     =20
> >>
> >> Right, it's going to be lots of replications, but gives much flexibili=
ty.
> >> There are 21 targets and we don't have fixed pattern for the mapping b=
etween
> >> CPU model name and CPU typename. I'm summarizing the used patterns lik=
e below.
> >>
> >>     1 All CPU model names are mappinged to fixed CPU typename; =20
> >=20
> >          plainly spelled it would be: cpu_model name ignored and
> >          a cpu type is returned anyways.
> >=20
> > I'd make this hard error right away, as "junk in =3D> error out"
> > it's clearly user error. I think we don't even have to follow
> > deprecation process for that.
> >  =20
>=20
> Right, It's not expected behavior to map ambiguous CPU model names to
> the fixed CPU typename.

to be nice we can deprecate those and then later remove.
(while deprecating make those targets accept typenames)

>=20
> >>     2 CPU model name is same to CPU typename;
> >>     3 CPU model name is alias to CPU typename;
> >>     4 CPU model name is prefix of CPU typename; =20
> >=20
> > and some more:
> >      5. cpu model names aren't names at all sometimes, and some other
> >         CPU property is used. (ppc)
> > This one I'd prefer to get rid of and ppc handling more consistent
> > with other targets, which would need PPC folks to persuaded to drop
> > PVR lookup.
> >  =20
>=20
> I put this into class 3, meaning the PVRs are regarded as aliases to CPU
> typenames.

with PPC using 'true' aliases, -cpu input is lost after it's translated int=
o typename.
(same for alpha)

it also adds an extra fun with 'max' cpu model but that boils down to above=
 statement.
(same for
  * sh4
  * cris(in user mode only, but you are making sysemu extension, so it does=
n't count)
)
For this class of aliases reverse translation won't yield the same
result as used -cpu. The only option you have is to store -cpu cpu_model
somewhere (use qemu_opts??, and then fetch it later to print in error messa=
ge)

x86 has 'aliases' as well, but in reality it creates distinct cpu types
for each 'alias', so it's possible to do reverse translation.

> >>
> >>     Target         Categories    suffix-of-CPU-typename
> >>     -------------------------------------------------------
> >>     alpha          -234          -alpha-cpu
> >>     arm            ---4          -arm-cpu
> >>     avr            -2--
> >>     cris           --34          -cris-cpu
> >>     hexagon        ---4          -hexagon-cpu
> >>     hppa           1---
> >>     i386           ---4          -i386-cpu
> >>     loongarch      -2-4          -loongarch-cpu
> >>     m68k           ---4          -m68k-cpu
> >>     microblaze     1---
> >>     mips           ---4          -mips64-cpu  -mips-cpu
> >>     nios2          1---
> >>     openrisc       ---4          -or1k-cpu
> >>     ppc            --34          -powerpc64-cpu  -powerpc-cpu
> >>     riscv          ---4          -riscv-cpu
> >>     rx             -2-4          -rx-cpu
> >>     s390x          ---4          -s390x-cpu
> >>     sh4            --34          -superh-cpu
> >>     sparc          -2--

it's case 4

> >>     tricore        ---4          -tricore-cpu
> >>     xtensa         ---4          -xtensa-cpu
> >>
> >> There are several options as below. Please let me know which one or so=
mething
> >> else is the best.
> >>
> >> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] to t=
rack
> >> the valid CPU typenames and CPU model names.
> >>
> >> (b) Introduce CPUClass::model_name_by_typename(). Every target has the=
ir own
> >> implementation to convert CPU typename to CPU model name. The CPU mode=
l name
> >> is parsed from mc->valid_cpu_types[i].
> >>
> >>       char *CPUClass::model_by_typename(const char *typename);
> >>
> >> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->vali=
d_cpu_models
> >> because the CPU type check is currently needed by target arm/m68k/risc=
v where we
> >> do have fixed pattern to convert CPU model names to CPU typenames. The=
 CPU typename
> >> is comprised of CPU model name and suffix. However, it won't be workin=
g when the CPU
> >> type check is required by other target where we have patterns other th=
an this. =20
> >=20
> > none of above is really good, that's why I was objecting to introducing
> > reverse type->name mapping. That ends up with increased amount junk,
> > and it's not because your patches are bad, but because you are trying
> > to deal with cpu model names (which is a historically evolved mess).
> > The best from engineering POV would be replacing CPU models with
> > type names.
> >=20
> > Even though it's a bit radical, I very much prefer replacing
> > cpu_model names with '-cpu type'usage directly. Making it
> > consistent with -device/other interfaces and coincidentally that
> > obsoletes need in reverse name mapping.
> >=20
> > It's painful for end users who will need to change configs/scripts,
> > but it's one time job. Additionally from QEMU pov, codebase
> > will be less messy =3D> more maintainable which benefits not only
> > developers but end-users in the end.
> >  =20
>=20
> I have to clarify the type->model mapping has been existing since the
> model->type mapping was introduced with the help of CPU_RESOLVING_TYPE.
> I mean the logic has been existing since the existence of CPU_RESOLVING_T=
YPE,
> even the code wasn't there.
>=20
> I'm not sure about the idea to switch to '-cpu <cpu-type-name>' since
> it was rejected by Peter Maydell before. Hope Peter can double confirm
> for this. For me, the shorter name is beneficial. For example, users
> needn't to have '-cpu host-arm-cpu' for '-cpu host'.
>=20
>=20
> > [rant:
> > It's the same story repeating over and over, when it comes to
> > changing QEMU CLI, which hits resistance wall. But with QEMU
> > deprecation process we've changed CLI behavior before,
> > despite of that world didn't cease to exist and users
> > have adapted to new QEMU and arguably QEMU became a tiny
> > bit more maintainable since we don't have to deal some
> > legacy behavior.
> > ]
> >  =20
>=20
> I need more context about 'deprecation process' here. My understanding
> is both CPU typename and model name will be accepted for a fixed period
> of time. However, a warning message will be given to indicate that the
> model name will be obsoleted soon. Eventually, we switch to CPU typename
> completely. Please correct me if there are anything wrong.

yep, that's the gist of deprecation in this case.=20
=20
> > Another idea back in the days was (as a compromise),
> >   1. keep using keep valid_cpu_types
> >   2. instead of introducing yet another way to do reverse mapping,
> >      clean/generalize/make it work everywhere list_cpus (which
> >      already does that mapping) and then use that to do your thing.
> >      It will have drawbacks you've listed above, but hopefully
> >      that will clean up and reuse existing list_cpus.
> >      (only this time, I'd build it around  query-cpu-model-expansion,
> >       which output is used by generic list_cpus)
> >      [and here I'm asking to rewrite directly unrelated QEMU part yet a=
gain]
> >  =20
>=20
> I'm afraid that list_cpus() is hard to be reused. All available CPU model=
 names
> are listed by list_cpus(). mc->valid_cpu_types[] are just part of them an=
d variable
> on basis of boards. Generally speaking, we need a function to do reverse =
things
> as to CPUClass::class_by_name(). So I would suggest to introduce CPUClass=
::model_from_type(),
> as below. Could you please suggest if it sounds reasonable to you?
>=20
> - CPUClass::class_by_name() is modified to
>    char *CPUClass::model_to_type(const char *model)
>=20
> - char *CPUClass::type_to_model(const char *type)
>=20
> - CPUClass::type_to_model() is used in cpu_list() for every target when C=
PU
>    model name, fetched from CPU type name, is printed in xxx_cpu_list_ent=
ry()
>=20
> - CPUClass::type_to_model() is reused in hw/core/machine.c to get the CPU
>    model name from CPU type names in mc->valid_cpu_types[].

instead of per target hooks (which are atm mostly open-coded in several pla=
ces)
how about adding generic handler for cases 2,4:
  cpu_type_to_model(typename)
     cpu_suffix =3D re'-*-cpu'
     if (class_exists(typename - cpu_suffix))
         return typename - cpu_suffix
     else if (class_exists(typename))
         return typename
     explode

that should work for translating valid_cpus typenames to cpumodel names
and once that in place cleanup all open-coded translations with it tree-wid=
e

you can find those easily by:
git grep _CPU_TYPE_SUFFIX
git grep query_cpu_definitions

>=20
> Thanks,
> Gavin
>=20


