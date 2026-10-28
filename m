Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997E60A2616
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v5s7hmFz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM8vf-00075o-KL; Wed, 28 Oct 2026 15:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xM8vB-0006xn-N0
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:02:55 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xM8v8-0003zP-Jk
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:02:48 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-679e6ab6471so2845d50.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 12:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793214165; cv=none;
 d=google.com; s=arc-20260327;
 b=Us18S0+V/B+EVf6IHyuLRBm1TWltxtur5xIzb562Mp9mO8E0lyiqODmVRcjyckadKS
 irM3z6BQX7m+kgZLciczHqo1+ebd9AKSf/8t3FPJl0eYle5W5H2Phkhgu8ZQ3QFmclMw
 hRn2wTY3MKlGbd+vkEjRNCKt/Cf2FA5OEDlASbDxkdE3lI9VESgd3N4HYcDx7Voo92Qg
 7kRgAK1y/FM5X22uZ2egiQ8ebkS6wb5rkRXO8VbspqGYuAw4W5wxuD/VZVw6wx+cmfI+
 vjhx8rGQDCOebmcTNDqiYhO5vXUQ011rRVIEyQu/JJDgk46sb8tqaNK8m7guuMPqTR8t
 KKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=SQLvMiCpiVOTd49aL7ZS4Hwkv6j4PcOfxzajO064Rk0=;
 fh=SAvokqCtQgjZdCvm2UqQ+tEBlaj+zu78VtCGtKqRUt4=;
 b=ocN47/1x8iM+3LAqX5ySlhQ5TpRkbfCgHqQRcRHrvcMBLP4HitgmfaP6C0aVxXbCQQ
 wPdcvjKChaxcN7Fn9q8hs/FTSsgedvlDjPalisv+El/LuykwYZ+NEmEQsQJtarvvfqtm
 q3KxraA4Vbzht/8bS5SvEuKHXnRcZ//wLB1TFyqZPv98MnfP2UalBWAEOtaMxKbfHa+t
 Xq0yCkm1lQJt9MxXbTzWwEjTFe38gwH6KhGcepMlo5UXIP5YTMUg/OEUspKicV1SqSR2
 NeaV1xovz2boOXfdeVoyZeGA2F6xFy0+FeEsAo8lsX5LIQyrrszUEWtgYdf3r6y35W7D
 IWpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793214165; x=1793818965; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SQLvMiCpiVOTd49aL7ZS4Hwkv6j4PcOfxzajO064Rk0=;
 b=v5s7hmFzdi6HeaoQlf1YSX9Jc5YJRjYYdGArxmz7dM580OQS16iSehNeJqKaZtFRz3
 LAHO7/NmQZB0sYlF2qxz2HIMkx1Awt0DwREf92OjJ5Ul8N7VpdHhgopxgRF3tLAJboLt
 mbZWLZtdvD9X9Rz8uerzsZvKcHyxhdk11zhoAPdTKXPFfDPhJMS73sffS3pJKq6X2lny
 THhGjjZcBRYpQI6PfIZnz06CtsVD6UJyJYlT+26mkSI56sxmlFrqlZvI24KDaYDanGPM
 pkX6sHaznCysutrhUb90z72JAzligRHEU/j5l2MpSQST3PfqhqcjM20f/rAFNgO3gywZ
 xx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793214165; x=1793818965;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SQLvMiCpiVOTd49aL7ZS4Hwkv6j4PcOfxzajO064Rk0=;
 b=f4F86Jamcp3bpkqB1sb6Inrh7XT7W7PFH3psxDuq6Afml4h3MSPaFjLG6fI55KL0Ws
 79c8NSxE+RXU8PWIQofudufjq8lcWJ1Z1SgvGz2Hw2gKZJM/nqqrTafJEAFxXEQvuRII
 55Dickc1Z33SKfIIUkqL5ujaf/i+Zdl9kzShuqVPbHE49T2PAbI7vX/7YkykVEgZHo2o
 axtp0oD/8frJrK3Di2p9PirYZzcO1sefLs7OGb3ofAARUgWi8xecJDysJ8SfvhsiOj8J
 1dcol3gYfaHn00om0DzaigiJL1sDhp3cde8xu/qjZ5PnP0l4jWJaqRqZHTbyn8lMxaKe
 R8KA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwBqovBt2S5N8/lJBI+nBkxcM7llrEZzzhpAN7bbVjTBD8eswOfF0pWx1s4beqmXLSlH6vv8dRHEvH@nongnu.org
X-Gm-Message-State: AFq9FYLmSKlegEQHrNcuOx1LNG5ajSqb8Qg1u1mJyuv4B0B3TWBj/ejw
 TEyZIzlh0t+odWrKXpgOSoZmkvMwfWdBKODvkJpyhtklz45q5eN09L1glvlY+2U5OpfvcTt/Wbo
 BF3zfnAkOn/j7ZsnOD3lK9Jb5+zMK8+o=
X-Gm-Gg: AYBFou00ZWL5oWwvTBLYiG2FiaHnSuUOM/DCCO6YBodEe9e0TQgJ9ABSd3wZW5W0uMy
 v5OW7GMb9tXiSQe16m985LgraZN7RN+lZWebjlHoRO0vYyRT31bCB9aw9vhEIw/cIeDr/taktTe
 HhrQrnZ84Xw1aPB+zSBkWDUn+0XaBBRVcOG0+NuibyUyOemYveDnc/ifuH+7uNMd1K3yz7w5JPY
 LSqXnJ5n1eqTorSdIIP0bmVU8DXVS3f8IDneVtE+ttZrDArxWNYmXjRD80C1S0klnA6+ZYiHggA
 y4HxPzQGtW10co65XW8I2VRcFbSjthgMsPZh99PJVqv74pIyrdhzctoGvm9eNxVEHJDu11aiXGU
 yqzuzCEJRWgU57q6NN5FyNiunzfW02taIWo3avyqJQ9sV7lhmDMkrdz/smA==
X-Received: by 2002:a05:690e:80c:20b0:679:9b4c:5baa with SMTP id
 956f58d0204a3-67a8d304c91mr233756d50.50.1793214165041; Wed, 28 Oct 2026
 12:02:45 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028063049.2530-1-luoyonggang@gmail.com>
 <20261028063049.2530-2-luoyonggang@gmail.com>
 <bc5bad6e-fbc2-44e1-a4b4-41bdfd41d33a@oss.qualcomm.com>
In-Reply-To: <bc5bad6e-fbc2-44e1-a4b4-41bdfd41d33a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 29 Oct 2026 03:02:31 +0800
X-Gm-Features: AclHuK-xtUx2DvtS0iezu4tyq4WmXhbo6cUKb6Cq1RIENkwqvf9N0UJisT-_IPg
Message-ID: <CAE2XoE_r3gZXzS+TFUd+GRs-8ZtCTajsJK0wJpTHNoXx_Cf3dA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] accel: register CPU parent for each target
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Weiwei Li <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=luoyonggang@gmail.com; helo=mail-yx1-xb12f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 2:25=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/27/2026 10:30 PM, Yonggang Luo wrote:
> > A multi-target binary registers one accel-$cpu_type parent per linked
> > target. accel-target.c is compiled once per target and calls
> > accel_register_cpu_type() with that target's target_arch and
> > CPU_RESOLVING_TYPE. A bool array keyed by SysEmuTarget records which
> > arch already registered. Targets that share one CPU_RESOLVING_TYPE
> > reuse the parent from the earlier arch.
> >
> > test-multi-target checks that each target's accel parent exists after
> > QOM init.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  accel/accel-common.c           | 31 ++++++++++++++++++++++++++++---
> >  accel/accel-internal.h         |  2 ++
> >  accel/accel-target.c           | 21 +++++++++++++++++++++
> >  accel/meson.build              |  1 +
> >  tests/unit/test-multi-target.c | 22 ++++++++++++++++++++++
> >  5 files changed, 74 insertions(+), 3 deletions(-)
> >  create mode 100644 accel/accel-target.c
> >
> > diff --git a/accel/accel-common.c b/accel/accel-common.c
> > index 00a400243f0..0d04b8c5749 100644
> > --- a/accel/accel-common.c
> > +++ b/accel/accel-common.c
> > @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] =3D {
> >
> >  DEFINE_TYPES(accel_types)
> >
> > -static void register_accel_target_type(void)
> > +static void register_accel_target_type(const char *cpu_type)
> >  {
> > -    g_autofree char *name =3D g_strconcat("accel-", target_cpu_type(),=
 NULL);
> > +    g_autofree char *name =3D g_strconcat("accel-", cpu_type, NULL);
> >      const TypeInfo accel_cpu_type =3D {
> >          .name =3D name,
> >          .parent =3D TYPE_OBJECT,
> > @@ -143,4 +143,29 @@ static void register_accel_target_type(void)
> >      type_register_static(&accel_cpu_type);
> >  }
> >
> > -type_init(register_accel_target_type);
> > +void accel_register_cpu_type(SysEmuTarget arch, const char *cpu_type)
> > +{
> > +    static bool accel_cpu_registered[SYS_EMU_TARGET__MAX];
> > +    static const char *accel_cpu_types[SYS_EMU_TARGET__MAX];
> > +
> > +    if (accel_cpu_registered[arch]) {
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * Keyed by target_arch. Targets that share CPU_RESOLVING_TYPE alr=
eady
> > +     * have a parent from an earlier target_arch.
> > +     */
> > +    for (int i =3D 0; i < SYS_EMU_TARGET__MAX; i++) {
> > +        if (accel_cpu_registered[i] &&
> > +            g_str_equal(accel_cpu_types[i], cpu_type)) {
> > +            accel_cpu_registered[arch] =3D true;
> > +            accel_cpu_types[arch] =3D cpu_type;
> > +            return;
> > +        }
> > +    }
> > +
> > +    accel_cpu_registered[arch] =3D true;
> > +    accel_cpu_types[arch] =3D cpu_type;
> > +    register_accel_target_type(cpu_type);
> > +}
>
> No need to do this, just move the whole type registration in
> accel-target.c and type will be present at runtime for all present target=
s.

The issue is that CPU_RESOLVING_TYPE is not unique for each
target_arch, you may not realize it.
for example:
arm/aarch64 sharing same
```
#define TYPE_ARM_CPU "arm-cpu"
#define CPU_RESOLVING_TYPE TYPE_ARM_CPU
```

And the same name can not be registered twice, that's why this
accel_register_cpu_type should be
in a global shared place. We need accel_cpu_registered/accel_cpu_types
for deduplication.

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

