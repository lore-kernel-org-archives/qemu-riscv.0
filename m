Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0266CA5FEC
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 18:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xD4Ui-0004lK-Az; Sat, 03 Oct 2026 14:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xD4Uh-0004kn-9e
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 14:29:59 -0400
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xD4Ue-0001si-1y
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 14:29:59 -0400
Received: by mail-ed2-x0c.google.com with SMTP id
 4fb4d7f45d1cf-6acb8b78d6cso708393a12.2
 for <qemu-riscv@nongnu.org>; Sat, 03 Oct 2026 11:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791052194; cv=none;
 d=google.com; s=arc-20260327;
 b=a1Pppil1wAFcTl/dpOOD3QWC+m158pTWZobiKpSfomMdVwazUmtJf9yRTpmwLMsv09
 SLlTVWjH6OpAFGbmel/pQbPJqoa2UCgVMzQgQTbJLXpfUq0GOmDtngbcVxYdPqWn7jEe
 6UuGiedGk3RXdn9U5bgb6tNzPPovRfiMi8fJdR647XUiC5HSWb6C29+0rhioUjNLCOOl
 fwx07iOa6JcFG9/3AFJOV9XWe15EGhAIyRC3JMF5/YHZejED+beVlszs89IeZMuvbB9L
 dTqz9grT9cf9RG51jQd4xFvBC7CL2Awbd/uGY19N1xYSMxeDgCXvEB35YAbO96iPHPm0
 wAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=aavMZIbZWpGlKktOrSx9tqWfG1KAdeRoEj+9e7gT4kc=;
 fh=+17tMTNq4I1VXCFtduKd2LoOhoRYNGV4ea7NP71mZ7o=;
 b=ZgrJWjeZd0DqG6JV5FrWIHAGEoTojdt6OaBRSFzdTPze03J1i80T90xs4wGEnNwD0Z
 RhvJx//zA65s6dUCoz2nI4HDUZtefyH4mM+rL7/ahHLjl6zAtWl3d5kJo0DFmwDhQx23
 GKd1Wu19U1MW/JK5fVcmQoKKbIoKaePpJgmdizruj2JiH/3LoPpZdLG7mpczKPtoWc6B
 Y/YBCnG9WG2Dcq31QBFuAS8z+u6vedjguXnk9JPbFi1dSLCie7Wz5Ou7EK+tBTA0ZLXL
 lJwjEhV1NLx5BSKldtW0asxju7rNmegZDxn+tUT1O49YXGiyje3gPTWk+bJLazpBMC7k
 ZF7w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791052194; x=1791656994; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aavMZIbZWpGlKktOrSx9tqWfG1KAdeRoEj+9e7gT4kc=;
 b=hRA57yCUfQ5DinjB09xrXylKb2snflMjTmnFKfuOCS4FadbkpATN7sxrJJcGIGAJpL
 KsURgGU6HS/kVsORgok9bERE/QzATtEQffBM9IeUAuDGJfL6NC8xeq9OVdHa93Nrt8/a
 QlMZsew7/LffVv7ljTNvxRmXn6XL6/SooYAaHs6sfy8amTGPRZ1YG9EoyJ60Gw+pVZ6J
 9IBDLty95/HbTgjiEYPyLWMY1lf1Hmpt7d05+1oh+eF6Y89MhLIAvT1CXhZb0/aqChH9
 VmJM1Wf7uz+exLjfVRWQL+HqqTXtwm7ObglTbbZmwBytI40ZMr3aR1C6vaEnvxO9DStn
 fLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791052194; x=1791656994;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aavMZIbZWpGlKktOrSx9tqWfG1KAdeRoEj+9e7gT4kc=;
 b=cjTvjIIaNEjpUwYmEswCAsoVBEvSCuiHwru7ZHIEAHC3HXF1q46XuUj/v7owllj8Fu
 WlIzU89XNTwgyHKGT6/Jles0oD3IAuI1rnQwLGaeWh0ptwKD2GEALd8Na71Wo0B6vr2U
 GtSmcMUu777nPR8zItRKcnU1nitrC+iM8kD09ufs3hjs3TGFe7HhLEM9qct7tRyK+g8u
 aNHUav9nUAeLRfI/yaodd3oIcIGNodJmoRhduC9YCUwcICoZ+LA2nA6yBgd2CopKSuw/
 e0Lgehol68SCRSucfSYcTQv0qdTvuE4hTVvdXzss+nl6knHlXnjnivDeGJWep9HYH+Yo
 JNPg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwx2qjOsLj04cC+TwQC/Jjmd5fAjfCwakMXcQ9VCnqHgyJuGsPINXT35LWxIcv2AK977W3V/zG6WxKi@nongnu.org
X-Gm-Message-State: AFq9FYIdwue+nv9E9S/OZGwbZRJt6GgjzNav7BAXUiv7U9OcMOXu1qjw
 AV4iAmdcnG3jb5CqOF84lCcc2fSWAxhLekNoyZiHeZHUy+/E96zkGbJxlHNwzcLnnJGH2GmRCbN
 snmI1QBe7q7tfEH+/VaPhTEXUwYU6Ht0=
X-Gm-Gg: AYBFou3OdZa0E2j1gINFm+uPQJqotGsRqTL+DRvEt+q+22qJ3umGGLxS8IFMCRTDTXb
 EcnNZZQA2Z6CtkQCg8IXPqpgqVKlcVZG5/pY+maINJeS7ZrfSzyr/ALtecAvvOROsAKRhd7VsWG
 nm+bcxvt419ueHrGiSlbE0jgewJvQ6/x483TS7ss3gzvM5XdxsJ5qGNgZIJYuBiQeXj3JvxwRTg
 4EdNbYK6Kp7YE+RHLPw4kFVtPLyOeiLErONrGC+7+xc6+6EnGs1E1K1h8Qzk5GRRW5occINkpQF
 c3mY9lBFc6VaFKjYhN7DGMGA9sqKkM3reA3brOAxN/FsiruVDEy/3GU=
X-Received: by 2002:a05:6402:350e:b0:6a9:aff5:c6d3 with SMTP id
 4fb4d7f45d1cf-6af9e30ea8dmr4925328a12.34.1791052193702; Sat, 03 Oct 2026
 11:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
 <ar_YVfWv9EWHKVD6@redhat.com>
 <CAE2XoE9o3o6KUZyvBgSqEL14ahVp1SmFAVp1j_C5K8pVE9dRog@mail.gmail.com>
 <ar_dK-_KUS3h2dkL@redhat.com>
In-Reply-To: <ar_dK-_KUS3h2dkL@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 4 Oct 2026 02:29:41 +0800
X-Gm-Features: AclHuK8Z7MbwXTglDsi4sJCplfH2M-0eQHDxRwJHWei-5kgnaGlr_fS09fPvkJk
Message-ID: <CAE2XoE-+3o9pwx=fdc0MYVUb58K1kxh4USmVBYjinu5PAz+UAw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:33::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0c.google.com
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

On Sat, Oct 3, 2026 at 12:35=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Sat, Oct 03, 2026 at 12:27:08AM +0800, Yonggang Luo wrote:
> > On Sat, Oct 3, 2026 at 12:14=E2=80=AFAM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > On Thu, Oct 01, 2026 at 11:56:13AM -0700, Pierrick Bouvier wrote:
> > > > On 10/1/2026 11:26 AM, Daniel P. Berrang=C3=A9 wrote:
> > > > > On Thu, Oct 01, 2026 at 11:08:17AM -0700, Pierrick Bouvier wrote:
> > > > >> On 10/1/2026 10:40 AM, Daniel P. Berrang=C3=A9 wrote:
> > > > >>> Even with the current per-target binaries there are countless
> > > > >>> devices linked in which are incompatible / not usable with
> > > > >>> certain machine types. A new multi-target binary with a union
> > > > >>> of all devices will just be a bigger example of a scenario that
> > > > >>> already has to be dealt with for today's binaries.
> > > > >>>
> > > > >>> So if we have that assumption that we don't need to do device
> > > > >>> filtering, at that point, a --target option doesn't have as
> > > > >>> big of a role to play. The machine type code knows what target(=
s)
> > > > >>> it wants (1 or 2 targets depending on if there are 32 + 64 bit
> > > > >>> varaints. The CPU model the user requests (if the CPU is not
> > > > >>> hardcoded by the machine), determines 32 bit vs 64 bit.
> > > > >>>
> > > > >>
> > > > >> How can we deduce this information (bitness or target for existi=
ng
> > > > >> machines/cpus)?
> > > > >
> > > > > It would require that we introduce a new field in MachineClass
> > > > > that returned that information about what target a machine is
> > > > > associated with.
> > > > >
> > > > > I note the SysEmuTarget covers both 32-bit and 64-bit variants.
> > > > >
> > > > > It might be better use QEMU_ARCH which correlates directly to
> > > > > the TCG targets, rather than the traditional binary target
> > > > > names ?
> > > > >
> > > > > Likely the CPU class would also want to declare its list of
> > > > > supported targets.
> > > > >
> > > >
> > > > QEMU_ARCH only represents base architectures, and not variant, so
> > > > SysEmuTarget is the right choice.
> > > >
> > > > So, we would need a list of SysEmuTarget for every cpu/machine that=
 is
> > > > target specific, since one could be available for variants of base =
arch?
> > >
> > > Ok
> > >
> > > > @Daniel: how do we deal with machines available for all targets lik=
e
> > > > null? We would need a way to ensure all machines/cpus are tagged
> > > > correctly, in an independent way from "available for all", without
> > > > having to repeat all existing SysEmuTarget.
> > >
> > > Or could the 'none' machine simply report '0xffffffff' for the
> > > list of targets so it includes everything today & in the future,
> > > or specialize "0" to mean everything ?
> > I think for is_avaible give a
> > bool target_is_any(const TargetInfo *ti)
> > {
> >     (void)ti;
> >     return true;
> > }
> > is enough. then we iterate the target list we will found every target
> > support for it.
>
> Yep, that would work.
>
>
> > > One idea I had was that when define the 'virt' class type we could
> > > have a way to identify whether it is linked into the traditional
> > > binaries, or linked into the multi-target binary, and from
> > > that choose what name to register it under. eg
> > >
> > >   "extern bool multi_target;"
> >
> > This idea already resolved,  see commit
> > https://gitlab.com/lygstate-qemu/qemu/-/commit/3342c04451bb21174e6bd53a=
7040e4929008b9d0
> > The idea is
> > bool target_combined_binary(void)
> > {
> >     return true;
> > }
> > for multi-target binary, and stub for single-target binary
> > for single-target binary
> > bool target_combined_binary(void)
> > {
> >     return false;
> > }
>
> Ok, yes, that works, even if that feels a bit like overkill
> vs a global variable !

Forget to tell, the overkill is intentionally,for multi-target binary
is we want to compat the future that qemu-system-$arch is symlink to
qemu-system,
then we will need

bool target_combined_binary(void)
{
    return program_name.ends("$arch");
}

>
> > > and have two .c files, one setting it 'true' and one 'false',
> > > and link each to the respective binaries. So we know statically
> > > before main() has even run, what mode this binary is intended
> > > to operate in.
> > >
> > > > Also, for compatibility with existing binaries, should we accept -M
> > > > $arch-virt also? I feel like it does not hurt and would make thing
> > > > simpler to switch between existing and new binary.
> > >
> > > Yes, that's another viable option. Always register '$arch-virt' and
> > > only register 'virt' for traditional binaries.
> > Oh, I see, for single-target binary, the "virt" is QOM name, and for
> > multi-target binary.
> > "$arch-virt" is the QOM name? So this series needs to consider this. ma=
de sense.
>
>
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

