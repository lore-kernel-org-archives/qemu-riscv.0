Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD32C83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 09:02:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbdZJ-00040I-Ca; Thu, 31 Aug 2023 05:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qbdZE-0003zQ-Vw
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 05:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qbdZA-00077u-Pj
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 05:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693472531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFxY6jEvHJCryW5f1S47Of0s/GN9d09biA1VDvRj7WE=;
 b=I1609FxgzCeZaMscMHG8iAG6tKWlyVtjwasklwb9zYyfU24moF1JDMfjl4fHSj6wDvEmFM
 8DKl63slaqCr0W/8qO+qgNPV+6OphHilGm5QEiq8g565t2UKDqtFXcpUgrmgrmAcKwoJBk
 OcCa2lDg1QxYFM9mIaKR0sgvuSmOyss=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-1wGYqT9pO_KJN8Z55rJN9A-1; Thu, 31 Aug 2023 05:02:10 -0400
X-MC-Unique: 1wGYqT9pO_KJN8Z55rJN9A-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-52c03bb5327so448903a12.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 02:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693472529; x=1694077329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NC2DazyaP/wuw++05qPLMfoOTSxXfaGBP7yIljDNAIM=;
 b=ZjpRZXpP1BQiSTcK8D9Oh8DT6fDoRHxxgx4hmYqAnG07e6X5bBkhQRzfrWSFoWUtjy
 P+gcDljpYYlMXEWWcmXxY3Y12bWsL35s5jYEPY4Q3Phhyka/znPcO3pzRbyW9ls7VC9d
 75w/Uv419nMOnLt+BlTyoXQyzTzQ949whOjWWYJhWR+Sel6ZG2gTnssjTWtDX1Kf8wwa
 D+Iq9rtpRa3AX2y3rRHYhDA7CilKPfq5SL2oeGUW+NxBh5V0H3Oj4o40+U9C6DrAGL+t
 WAkO5Mardxsx9RHhqyh+CTO3n2xz7GO6GSKzOWDfOzdbxnPcfzRpRUrct+NCzeAEx7Iu
 Plog==
X-Gm-Message-State: AOJu0YxlS21Z5qRRMvRpqvlA9Hv/N85FOsUYim/x0TojPfxfplkpF4Hs
 HFK4+z4CdoDjwVNYV8tqdv0qbTvyYEpcfbvOs7kXHsSBRgDFSHp5kwXjx+InaePutU/MArRCfDs
 cJwnlW0Us5AD+c+M=
X-Received: by 2002:aa7:c6ce:0:b0:51e:362d:b172 with SMTP id
 b14-20020aa7c6ce000000b0051e362db172mr3267168eds.32.1693472528951; 
 Thu, 31 Aug 2023 02:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTNen8iVVU2KPxjnIi+8a1lLWDkgvT5oB8U2L1Xi1tUWGf4/KhF4xVi70yoKO1acZIhu1voA==
X-Received: by 2002:aa7:c6ce:0:b0:51e:362d:b172 with SMTP id
 b14-20020aa7c6ce000000b0051e362db172mr3267102eds.32.1693472527928; 
 Thu, 31 Aug 2023 02:02:07 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 x2-20020aa7dac2000000b005272523b162sm539053eds.69.2023.08.31.02.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 02:02:07 -0700 (PDT)
Date: Thu, 31 Aug 2023 11:02:05 +0200
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
Message-ID: <20230831110205.27447fac@imammedo.users.ipa.redhat.com>
In-Reply-To: <a5a61f17-6792-fd53-e48b-aa9ab8fae803@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
 <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
 <5f26299e-f1e0-a2ab-db83-87011fe524d5@redhat.com>
 <20230828164637.52c2b5b0@imammedo.users.ipa.redhat.com>
 <6e637717-b739-3ee8-ac12-a339ea5fb166@redhat.com>
 <20230829110308.5282936f@imammedo.users.ipa.redhat.com>
 <a5a61f17-6792-fd53-e48b-aa9ab8fae803@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Wed, 30 Aug 2023 17:34:12 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
>=20
> On 8/29/23 19:03, Igor Mammedov wrote:
> > On Tue, 29 Aug 2023 16:28:45 +1000
> > Gavin Shan <gshan@redhat.com> wrote: =20
> >> On 8/29/23 00:46, Igor Mammedov wrote: =20
> >>> On Mon, 31 Jul 2023 15:07:30 +1000
> >>> Gavin Shan <gshan@redhat.com> wrote: =20
> >>>> On 7/27/23 19:00, Igor Mammedov wrote: =20
> >>>>> On Thu, 27 Jul 2023 15:16:18 +1000
> >>>>> Gavin Shan <gshan@redhat.com> wrote:
> >>>>>        =20
> >>>>>> On 7/27/23 09:08, Richard Henderson wrote: =20
> >>>>>>> On 7/25/23 17:32, Gavin Shan wrote: =20
> >>>>>>>> -static const char *q800_machine_valid_cpu_types[] =3D {
> >>>>>>>> +static const char * const q800_machine_valid_cpu_types[] =3D {
> >>>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M68K_CPU_TYPE_NAME("m68040"),
> >>>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
> >>>>>>>>    =C2=A0 };
> >>>>>>>> +static const char * const q800_machine_valid_cpu_models[] =3D {
> >>>>>>>> +=C2=A0=C2=A0=C2=A0 "m68040",
> >>>>>>>> +=C2=A0=C2=A0=C2=A0 NULL
> >>>>>>>> +}; =20
> >>>>>>>
> >>>>>>> I really don't like this replication.
> >>>>>>>           =20
> >>>>>>
> >>>>>> Right, it's going to be lots of replications, but gives much flexi=
bility.
> >>>>>> There are 21 targets and we don't have fixed pattern for the mappi=
ng between
> >>>>>> CPU model name and CPU typename. I'm summarizing the used patterns=
 like below.
> >>>>>>
> >>>>>>       1 All CPU model names are mappinged to fixed CPU typename; =
=20
> >>>>>
> >>>>>            plainly spelled it would be: cpu_model name ignored and
> >>>>>            a cpu type is returned anyways.
> >>>>>
> >>>>> I'd make this hard error right away, as "junk in =3D> error out"
> >>>>> it's clearly user error. I think we don't even have to follow
> >>>>> deprecation process for that.
> >>>>>        =20
> >>>>
> >>>> Right, It's not expected behavior to map ambiguous CPU model names t=
o
> >>>> the fixed CPU typename. =20
> >>>
> >>> to be nice we can deprecate those and then later remove.
> >>> (while deprecating make those targets accept typenames)
> >>>     =20
> >>
> >> Lets put it aside for now and revisit it later, so that we can focus o=
n
> >> the conversion from the CPU type name to the CPU model name for now.
> >> =20
> >>>>    =20
> >>>>>>       2 CPU model name is same to CPU typename;
> >>>>>>       3 CPU model name is alias to CPU typename;
> >>>>>>       4 CPU model name is prefix of CPU typename; =20
> >>>>>
> >>>>> and some more:
> >>>>>        5. cpu model names aren't names at all sometimes, and some o=
ther
> >>>>>           CPU property is used. (ppc)
> >>>>> This one I'd prefer to get rid of and ppc handling more consistent
> >>>>> with other targets, which would need PPC folks to persuaded to drop
> >>>>> PVR lookup.
> >>>>>        =20
> >>>>
> >>>> I put this into class 3, meaning the PVRs are regarded as aliases to=
 CPU
> >>>> typenames. =20
> >>>
> >>> with PPC using 'true' aliases, -cpu input is lost after it's translat=
ed into typename.
> >>> (same for alpha)
> >>>
> >>> it also adds an extra fun with 'max' cpu model but that boils down to=
 above statement.
> >>> (same for
> >>>     * sh4
> >>>     * cris(in user mode only, but you are making sysemu extension, so=
 it doesn't count)
> >>> )
> >>> For this class of aliases reverse translation won't yield the same
> >>> result as used -cpu. The only option you have is to store -cpu cpu_mo=
del
> >>> somewhere (use qemu_opts??, and then fetch it later to print in error=
 message)
> >>>
> >>> x86 has 'aliases' as well, but in reality it creates distinct cpu typ=
es
> >>> for each 'alias', so it's possible to do reverse translation.
> >>>     =20
> >>
> >> It's true that '-cpu input' gets lost in these cases. However, the CPU=
 type
> >> name instead of the CPU model name is printed in the error message whe=
n the
> >> CPU type is validated in hw/core/machine.c::machine_run_board_init(). =
It looks
> >> good to me to print the CPU type name instead of the model name there.=
 =20
> >=20
> > It's the same confusing whether it's type or cpumodel it it doesn't mat=
ch
> > user provided value.
> >  =20
>=20
> I tend to agree that it's misleading to print the CPU type name in the
> error message in hw/core/machine.c::machine_run_board_init(), where the C=
PU
> type is validated. qemu_opts may be too heavy for this. It eventually tur=
ns
> to a machine's property if @machine_opts_dict is the best place to store
> '-cpu input'. Besides, it doesn't fit for another case very well, where
> current_machine->cpu_type =3D machine_class->default_cpu_type if '-cpu in=
put'
> isn't provided by user.
>=20
> For simplicity, how about to add MachineState::cpu_model? It's initialize=
d to
> cpu_model_from_type(machine_class->default_cpu_type) in qemu_init(), or
> g_strdump(model_pieces[0) in parse_cpu_option().

I'd prefer not bringing cpu_model back to device models
(Machine in this case) after getting rid of it.


> >> Another error message is printed when the CPU model specified in '-cpu=
 input'
> >> isn't valid. The CPU model has been printed and it looks good either.
> >>
> >>     # qemu-system-aarch64 -M virt -cpu aaa
> >>     qemu-system-aarch64: unable to find CPU model 'aaa'
> >>
> >> Are there other cases I missed where we need to print the CPU model na=
me, which
> >> is specified by user through '-cpu input'?
> >> =20
> >>>>>>
> >>>>>>       Target         Categories    suffix-of-CPU-typename
> >>>>>>       -------------------------------------------------------
> >>>>>>       alpha          -234          -alpha-cpu
> >>>>>>       arm            ---4          -arm-cpu
> >>>>>>       avr            -2--
> >>>>>>       cris           --34          -cris-cpu
> >>>>>>       hexagon        ---4          -hexagon-cpu
> >>>>>>       hppa           1---
> >>>>>>       i386           ---4          -i386-cpu
> >>>>>>       loongarch      -2-4          -loongarch-cpu
> >>>>>>       m68k           ---4          -m68k-cpu
> >>>>>>       microblaze     1---
> >>>>>>       mips           ---4          -mips64-cpu  -mips-cpu
> >>>>>>       nios2          1---
> >>>>>>       openrisc       ---4          -or1k-cpu
> >>>>>>       ppc            --34          -powerpc64-cpu  -powerpc-cpu
> >>>>>>       riscv          ---4          -riscv-cpu
> >>>>>>       rx             -2-4          -rx-cpu
> >>>>>>       s390x          ---4          -s390x-cpu
> >>>>>>       sh4            --34          -superh-cpu
> >>>>>>       sparc          -2-- =20
> >>>
> >>> it's case 4
> >>>     =20
> >>
> >> Yes.
> >> =20
> >>>>>>       tricore        ---4          -tricore-cpu
> >>>>>>       xtensa         ---4          -xtensa-cpu
> >>>>>>
> >>>>>> There are several options as below. Please let me know which one o=
r something
> >>>>>> else is the best.
> >>>>>>
> >>>>>> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] =
to track
> >>>>>> the valid CPU typenames and CPU model names.
> >>>>>>
> >>>>>> (b) Introduce CPUClass::model_name_by_typename(). Every target has=
 their own
> >>>>>> implementation to convert CPU typename to CPU model name. The CPU =
model name
> >>>>>> is parsed from mc->valid_cpu_types[i].
> >>>>>>
> >>>>>>         char *CPUClass::model_by_typename(const char *typename);
> >>>>>>
> >>>>>> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->=
valid_cpu_models
> >>>>>> because the CPU type check is currently needed by target arm/m68k/=
riscv where we
> >>>>>> do have fixed pattern to convert CPU model names to CPU typenames.=
 The CPU typename
> >>>>>> is comprised of CPU model name and suffix. However, it won't be wo=
rking when the CPU
> >>>>>> type check is required by other target where we have patterns othe=
r than this. =20
> >>>>>
> >>>>> none of above is really good, that's why I was objecting to introdu=
cing
> >>>>> reverse type->name mapping. That ends up with increased amount junk=
,
> >>>>> and it's not because your patches are bad, but because you are tryi=
ng
> >>>>> to deal with cpu model names (which is a historically evolved mess)=
.
> >>>>> The best from engineering POV would be replacing CPU models with
> >>>>> type names.
> >>>>>
> >>>>> Even though it's a bit radical, I very much prefer replacing
> >>>>> cpu_model names with '-cpu type'usage directly. Making it
> >>>>> consistent with -device/other interfaces and coincidentally that
> >>>>> obsoletes need in reverse name mapping.
> >>>>>
> >>>>> It's painful for end users who will need to change configs/scripts,
> >>>>> but it's one time job. Additionally from QEMU pov, codebase
> >>>>> will be less messy =3D> more maintainable which benefits not only
> >>>>> developers but end-users in the end.
> >>>>>        =20
> >>>>
> >>>> I have to clarify the type->model mapping has been existing since th=
e
> >>>> model->type mapping was introduced with the help of CPU_RESOLVING_TY=
PE.
> >>>> I mean the logic has been existing since the existence of CPU_RESOLV=
ING_TYPE,
> >>>> even the code wasn't there.
> >>>>
> >>>> I'm not sure about the idea to switch to '-cpu <cpu-type-name>' sinc=
e
> >>>> it was rejected by Peter Maydell before. Hope Peter can double confi=
rm
> >>>> for this. For me, the shorter name is beneficial. For example, users
> >>>> needn't to have '-cpu host-arm-cpu' for '-cpu host'.
> >>>>
> >>>>    =20
> >>>>> [rant:
> >>>>> It's the same story repeating over and over, when it comes to
> >>>>> changing QEMU CLI, which hits resistance wall. But with QEMU
> >>>>> deprecation process we've changed CLI behavior before,
> >>>>> despite of that world didn't cease to exist and users
> >>>>> have adapted to new QEMU and arguably QEMU became a tiny
> >>>>> bit more maintainable since we don't have to deal some
> >>>>> legacy behavior.
> >>>>> ]
> >>>>>        =20
> >>>>
> >>>> I need more context about 'deprecation process' here. My understandi=
ng
> >>>> is both CPU typename and model name will be accepted for a fixed per=
iod
> >>>> of time. However, a warning message will be given to indicate that t=
he
> >>>> model name will be obsoleted soon. Eventually, we switch to CPU type=
name
> >>>> completely. Please correct me if there are anything wrong. =20
> >>>
> >>> yep, that's the gist of deprecation in this case.
> >>>     =20
> >>
> >> Ok. Thanks for your confirm.
> >>      =20
> >>>>> Another idea back in the days was (as a compromise),
> >>>>>     1. keep using keep valid_cpu_types
> >>>>>     2. instead of introducing yet another way to do reverse mapping=
,
> >>>>>        clean/generalize/make it work everywhere list_cpus (which
> >>>>>        already does that mapping) and then use that to do your thin=
g.
> >>>>>        It will have drawbacks you've listed above, but hopefully
> >>>>>        that will clean up and reuse existing list_cpus.
> >>>>>        (only this time, I'd build it around  query-cpu-model-expans=
ion,
> >>>>>         which output is used by generic list_cpus)
> >>>>>        [and here I'm asking to rewrite directly unrelated QEMU part=
 yet again]
> >>>>>        =20
> >>>>
> >>>> I'm afraid that list_cpus() is hard to be reused. All available CPU =
model names
> >>>> are listed by list_cpus(). mc->valid_cpu_types[] are just part of th=
em and variable
> >>>> on basis of boards. Generally speaking, we need a function to do rev=
erse things
> >>>> as to CPUClass::class_by_name(). So I would suggest to introduce CPU=
Class::model_from_type(),
> >>>> as below. Could you please suggest if it sounds reasonable to you?
> >>>>
> >>>> - CPUClass::class_by_name() is modified to
> >>>>      char *CPUClass::model_to_type(const char *model)
> >>>>
> >>>> - char *CPUClass::type_to_model(const char *type)
> >>>>
> >>>> - CPUClass::type_to_model() is used in cpu_list() for every target w=
hen CPU
> >>>>      model name, fetched from CPU type name, is printed in xxx_cpu_l=
ist_entry()
> >>>>
> >>>> - CPUClass::type_to_model() is reused in hw/core/machine.c to get th=
e CPU
> >>>>      model name from CPU type names in mc->valid_cpu_types[]. =20
> >>>
> >>> instead of per target hooks (which are atm mostly open-coded in sever=
al places)
> >>> how about adding generic handler for cases 2,4:
> >>>     cpu_type_to_model(typename)
> >>>        cpu_suffix =3D re'-*-cpu'
> >>>        if (class_exists(typename - cpu_suffix))
> >>>            return typename - cpu_suffix
> >>>        else if (class_exists(typename))
> >>>            return typename
> >>>        explode
> >>>
> >>> that should work for translating valid_cpus typenames to cpumodel nam=
es
> >>> and once that in place cleanup all open-coded translations with it tr=
ee-wide
> >>>
> >>> you can find those easily by:
> >>> git grep _CPU_TYPE_SUFFIX
> >>> git grep query_cpu_definitions
> >>>     =20
> >>
> >> Thanks for the advice. I think it's enough for now since the CPU type
> >> invalidation is currently done for arm/mips/riscv for now. On these
> >> targets, the CPU type name is always the combination of the CPU model
> >> name and suffix. I will add helper qemu/cpu.c::cpu_model_by_name() =20
> >=20
> > cpu_model_from_type() would be describe what function does better.
> >  =20
>=20
> Agreed, thanks.
>=20
> >> as you suggested. Note that, the suffix can be gained by ("-" CPU_RESO=
LVING_TYPE)
> >>
> >> Yes, the newly added helper cpu_model_by_name() needs to be applied
> >> to targets where query_cpu_definitions and cpu_list are defined. =20
>=20
> Thanks,
> Gavin
>=20


