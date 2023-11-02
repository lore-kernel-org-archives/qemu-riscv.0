Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA61DC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 03:01:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyNxK-0002wt-PE; Wed, 01 Nov 2023 23:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyNxH-0002v2-Fl; Wed, 01 Nov 2023 23:01:11 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyNxF-0005Kl-D0; Wed, 01 Nov 2023 23:01:11 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-49ab0641e77so215900e0c.0; 
 Wed, 01 Nov 2023 20:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698894067; x=1699498867; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QE1JTpxPptsJmfv4PFmultWcDNCdEDYqnkxTl47kjN0=;
 b=Dmtim8JAg9us9Mp3ncGFRPWu6ixqqDdG8EapEqWuqE0/8bIpckKLjVmT919+6MDjBs
 uFr9HKA8n77RfqOZNWueV5ZU+ArEUEG2veFbhIo118dK+I2JwEpe6J7zHgkYKl20ntos
 vul21tst5TlKGldPvt4ecHmjqXSmH7XXF7OlHfCYy1wJmEdKd7b6it6SE29bhVqfr87T
 KW4aGPQGELkcaICNJZMwumyw9Qog8VpkKrJAjUn4kixn9LPfiIaoAYQ+andCUwY20Sq/
 9rxioY29+C4Nz1wPDqHxCLl7rsF7lfIcWWX16fGgRG3gER/md9yLtMY/cyV/2HW2/C5b
 zZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698894067; x=1699498867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QE1JTpxPptsJmfv4PFmultWcDNCdEDYqnkxTl47kjN0=;
 b=pbsGPBf01Ja9ho+MwngniHcmmS2t+LMlLF+YdVkuZ9S2fAo3ecnlolAczJETU6OCCs
 Qr1iv9uSDvNKdc6OrvTKGzLpveloNPuDjfJtjxWha3D57klm0rsrfoWPRJdAGB4/sGi8
 QLdsOyjcnHQoD3ZLu+E26t8PNVpE9fUbp1PBfMWhNgQBB5EsYmNgr2BU/CLYy5nFxzi6
 i76Z1mt4GGy29Wy7HIbTRHd9QD9KW7lpfj4MLqA23C8XDoCqqwYtWmX6u8Wmdkv/ObYC
 Fb0sl4+CPNF7yjitHsIRhFMcO2S2NSjkMqvJKbOplsH8yTecMlgZlye0VUACoV4ZIHs6
 sR2Q==
X-Gm-Message-State: AOJu0Yya4n7WVey1ZNfv5hrspLxE1dNnBUZJiOttedUxqkpw08o4xQBa
 Co5GFjAPfMWA8jUHBFOxxiagLJEWjzUpRSSoDJs=
X-Google-Smtp-Source: AGHT+IHOMnczb6qSFizI9Cx076L3KE9x5vhwAGQ+79TFO2NFcI+4BNlrJFEHdci47bfOGt23VIrHkpWAkKHBX4i/HR8=
X-Received: by 2002:a1f:b695:0:b0:49c:b45:6cba with SMTP id
 g143-20020a1fb695000000b0049c0b456cbamr16186896vkf.12.1698894067252; Wed, 01
 Nov 2023 20:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-7-dbarboza@ventanamicro.com>
 <17601513-f256-4179-bab8-1fec38f9cdc6@ventanamicro.com>
 <be6f45ce-43c8-455e-a0f1-2b196ce080c2@ventanamicro.com>
In-Reply-To: <be6f45ce-43c8-455e-a0f1-2b196ce080c2@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 13:00:39 +1000
Message-ID: <CAKmqyKP7xzZ9Sx=-Lbx2Ob0qCfB7Z+JO944FQ2TQ+49mqo0q_Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] target/riscv/tcg: add user flag for profile
 support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Oct 31, 2023 at 3:19=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 10/30/23 10:28, Daniel Henrique Barboza wrote:
> >
> >
> > On 10/28/23 05:54, Daniel Henrique Barboza wrote:
> >> The TCG emulation implements all the extensions described in the
> >> RVA22U64 profile, both mandatory and optional. The mandatory extension=
s
> >> will be enabled via the profile flag. We'll leave the optional
> >> extensions to be enabled by hand.
> >>
> >> Given that this is the first profile we're implementing in TCG we'll
> >> need some ground work first:
> >>
> >> - all profiles declared in riscv_profiles[] will be exposed to users.
> >> TCG is the main accelerator we're considering when adding profile
> >> support in QEMU, so for now it's safe to assume that all profiles in
> >> riscv_profiles[] will be relevant to TCG;
> >>
> >> - we'll not support user profile settings for vendor CPUs. The flags
> >> will still be exposed but users won't be able to change them. The idea
> >> is that vendor CPUs in the future can enable profiles internally in
> >> their cpu_init() functions, showing to the external world that the CPU
> >> supports a certain profile. But users won't be able to enable/disable
> >> it;
> >>
> >> - Setting a profile to 'true' means 'enable all mandatory extensions o=
f
> >> this profile, setting it to 'false' means 'do not enable all mandatory
> >> extensions for this profile'. This is the same semantics used by RVG.
> >> Regular left-to-right option order will determine the resulting CPU
> >> configuration, i.e. the following QEMU command line:
> >>
> >> -cpu rv64,zicbom=3Dfalse,zifencei=3Dfalse,rva22u64=3Dtrue
> >>
> >> Enables all rva22u64 mandatory extensions, including 'zicbom' and
> >> 'zifencei', while this other command line:
> >>
> >> -cpu rv64,rva22u64=3Dtrue,zicbom=3Dfalse,zifencei=3Dfalse
> >>
> >> Enables all mandatory rva22u64 extensions, and then disable both zicbo=
m
> >> and zifencei.
> >>
> >> For now we'll handle multi-letter extensions only. MISA extensions nee=
d
> >> additional steps that we'll take care later.
> >>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>   target/riscv/tcg/tcg-cpu.c | 63 ++++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 63 insertions(+)
> >>
> >> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> >> index 65d59bc984..5fdec8f04e 100644
> >> --- a/target/riscv/tcg/tcg-cpu.c
> >> +++ b/target/riscv/tcg/tcg-cpu.c
> >> @@ -783,6 +783,67 @@ static void riscv_cpu_add_misa_properties(Object =
*cpu_obj)
> >>       }
> >>   }
> >> +static void cpu_set_profile(Object *obj, Visitor *v, const char *name=
,
> >> +                            void *opaque, Error **errp)
> >> +{
> >> +    RISCVCPUProfile *profile =3D opaque;
> >> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> >> +    bool value;
> >> +    int i, ext_offset;
> >> +
> >> +    if (object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) =3D=3D NULL)=
 {
> >> +        error_setg(errp, "Profile %s only available for generic CPUs"=
,
> >> +                   profile->name);
> >> +        return;
> >> +    }
> >> +
> >> +    if (cpu->env.misa_mxl !=3D MXL_RV64) {
> >> +        error_setg(errp, "Profile %s only available for 64 bit CPUs",
> >> +                   profile->name);
> >> +        return;
> >> +    }
> >> +
> >> +    if (!visit_type_bool(v, name, &value, errp)) {
> >> +        return;
> >> +    }
> >> +
> >> +    profile->user_set =3D true;
> >> +    profile->enabled =3D value;
> >> +
> >> +    if (!profile->enabled) {
> >> +        return;
> >> +    }
> >
> > My idea here was to prevent the following from disabling default rv64
> > extensions:
> >
> > -cpu rv64,rva22u64=3Dfalse

I think that's the right approach

> >
> > And yeah, this is a niche (I'll refrain from using the word I really wa=
nted) use
> > of the profile extension, but we should keep in mind that setting a def=
ault 'false'
> > option to 'false' shouldn't make changes in the CPU.
> >
> > But now if I do this:
> >
> > -cpu rv64,rva22u64=3Dtrue (...) -cpu rv64,rva22u64=3Dfalse
> >
> > This will enable the profile in rv64 regardless of setting it to 'false=
' later
> > on. Which is also a weird mechanic. One way of solving this would be to=
 postpone

Urgh, that is odd.

> > profile enable/disable to realize()/finalize(), but then we're back to =
the problem
> > we had in v2 where, for multiple profiles, we can't tell the order in w=
hich the
> > user enabled/disabled them in the command line during realize().

Are the properties not just set in order automatically? So we end up
with the property being set by the last one?

> >
> > Let me think a bit about it.
>
> To be honest, all the debate around this feature is due to rv64 having de=
fault
> extensions and users doing non-orthodox stuff with the flag that will cro=
p
> rv64 defaults, resulting in something that we don't know what this is.

Ok, just to summarise.

The idea is that having a CPU with nothing enabled makes it easy to
then enable features based on what extensions have been enabled. That
way if a profile is false, we can just ignore it. The result is the
features are disabled as that is the default state.

>
> And what aggravates the issue is that, ATM, we don't have any other CPU a=
side
> from rv64 (and max) to use profiles on.
>
> The RVA22U64 profile spec mentions: "RV64I is the mandatory base ISA for =
RVA22U64".
> So we have a base. And we should base profiles around the base, not on a =
CPU that
> has existing default values.

That is only a base for RVA22U64 though. Aren't there embedded
profiles that might use rv64e as a base? What about RV32 as well?

>
> I'll add the 'rv64i' CPU in v7. This will be a bare-bones CPU that will o=
nly have
> RVI enabled by default. Profile support will be based on top of this CPU,=
 making
> enable/disable profiles a trivial matter since we have a fixed minimal ba=
se. This
> will give users a stable way of using profiles.
>
> As long as we have the rv64i CPU I'll start not caring for what happens w=
ith
> '-cpu rv64,rva22u64=3Dfalse' - users are free to use profiles in rv64 if =
they want,

What does happen with -cpu rv64,rva22u64=3Dfalse though?

I feel like this doesn't really address the problem

> but the feature is designed around rv64i.

One other thought it to create a CPU per extension. So the actual CPU
is rva22u64. That way it is easy for users to enable/disable features
on top of the extension and we don't have to worry about the complex
true/false operations for extensions

>
> I'll also throw a bone for all CPUs and add 'rva22u64' as an internal fla=
g for
> everybody, including vendor CPUs, that will reflect whether the CPU compl=
ies with
> the profile. query-cpu-model-expansion can expose this flag, allowing the=
 tooling
> to have an easier time verifying if a profile is implemented or not.

Great!

Alistair

>
>
> Thanks,
>
>
> Daniel
>
>
> >
> >
> > Daniel
> >
> >> +
> >> +    for (i =3D 0; profile->ext_offsets[i] !=3D RISCV_PROFILE_EXT_LIST=
_END; i++) {
> >> +        ext_offset =3D profile->ext_offsets[i];
> >> +
> >> +        g_hash_table_insert(multi_ext_user_opts,
> >> +                            GUINT_TO_POINTER(ext_offset),
> >> +                            (gpointer)profile->enabled);
> >> +        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
> >> +    }
> >> +}
> >> +
> >> +static void cpu_get_profile(Object *obj, Visitor *v, const char *name=
,
> >> +                            void *opaque, Error **errp)
> >> +{
> >> +    RISCVCPUProfile *profile =3D opaque;
> >> +    bool value =3D profile->enabled;
> >> +
> >> +    visit_type_bool(v, name, &value, errp);
> >> +}
> >> +
> >> +static void riscv_cpu_add_profiles(Object *cpu_obj)
> >> +{
> >> +    for (int i =3D 0; riscv_profiles[i] !=3D NULL; i++) {
> >> +        const RISCVCPUProfile *profile =3D riscv_profiles[i];
> >> +
> >> +        object_property_add(cpu_obj, profile->name, "bool",
> >> +                            cpu_get_profile, cpu_set_profile,
> >> +                            NULL, (void *)profile);
> >> +    }
> >> +}
> >> +
> >>   static bool cpu_ext_is_deprecated(const char *ext_name)
> >>   {
> >>       return isupper(ext_name[0]);
> >> @@ -906,6 +967,8 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
> >>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts=
);
> >> +    riscv_cpu_add_profiles(obj);
> >> +
> >>       for (Property *prop =3D riscv_cpu_options; prop && prop->name; p=
rop++) {
> >>           qdev_property_add_static(DEVICE(obj), prop);
> >>       }
>

