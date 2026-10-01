Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEDBCA5FC4
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 02:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC6D7-0003ku-DR; Wed, 30 Sep 2026 22:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xC6D5-0003kN-O1
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 22:07:47 -0400
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xC6D3-0000v2-TH
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 22:07:47 -0400
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6a605c198fdso9515959a12.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 19:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790820464; cv=none;
 d=google.com; s=arc-20260327;
 b=ooCsQlg3Jn6MDFekAOzQqK7BqGcqgBvwCXWYAsnTWR7NZpN/2FvZsflSwglOAy6Jw6
 7N2mqww1JoN3e6w/7jJdaBQvl1RT3MKQbsWQc0dzCEOdlVMgzcdbhcpXY8IvLK+mUHgt
 EvjsoTcPKniwryjkSSj/KC3IUPfYvdQGwEHuBLSzLItsqlq0T+C/4GmJaSI5ByYxgtiu
 7RZO/umEq4dVpLjCJpd9BlmoCOfvcBNI9sf1zniKDS9MTdW8hZ28K+Vckk6dR16eUxZC
 qZUY/Oa44QgUqA9vURoABxvx7Q5qJl+MeL/W3ws+Q1HpMp5CzSKtdeLxGYkniklDEhR/
 xa1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=iq3esjhG4aVafagvf/oWSo/6s5umcwYrzfq6e+nN6YA=;
 fh=Kn4RX9Tk9pejQuZcCuujkplSkoTG7rLYNuD/g3QZXc4=;
 b=CJzbVBuxCg2AIaFztGyz8UKz0rwg6Kqxv8Ddm5gYLkQoOnT0Yesttf3CnXjAMUaWVI
 o5h9mxT0sJEWbKAKijOVfrkybfltQYRMaXEsLB3vdTI+0MRt1fPo2fN52oWI3p/H/xi7
 Fw89vNSq5/wc6NdXHxUW013gEzuBddFat8mOfQ/W1ubX142DfG6E8JLXVgu29VyS+1dV
 CinlyrXuSyzRrav5rjJQdZ3M/O+euMMpOftxsw5GIMFWzSbrCYn/xDIP3nQSo8WGFJmT
 r52rp//+WxnYo53asNi3DT+CHb7H4dltUXt9I29Q3tOxVNoNt2aluh58BdUz14QHXwcQ
 fL+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790820464; x=1791425264; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iq3esjhG4aVafagvf/oWSo/6s5umcwYrzfq6e+nN6YA=;
 b=sw8rGU/dctpdLbvA9r3I0SFbZ7DP6XrxOy9WvsMEgrkVynGVYGvBOgUU36nmpjYnz1
 GVD82vpxDNYOr75gN/ovWsJ2pOKtW8EDSVdAD7g5aaj2OSM2sAWvLAeit6yHAFL29b3E
 2ld2B/kD4DeTDRfXAAycflndXJyn67mTxBVQ1i5bniOumRoVsi/HEAPpB7fYWKAK0Na1
 6RbM7ffYdbnkIoRPbN09UhB84Sd9YmNgSZzpGMSguiE0OmndOS98wZFAsK6x1UK/3SW2
 eyEaqCUireWt8gj/y5Ve5P2gH8q7ZpdIimgdtWzay7X2ssZEQgmnCA0TAZAoUIAkTPod
 5OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790820464; x=1791425264;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iq3esjhG4aVafagvf/oWSo/6s5umcwYrzfq6e+nN6YA=;
 b=kE1MEZIcAmILddKtseQcvRrtNIRGpDElELIQXodMamaBF4C6Nc5qTdJa5pdbkfl4H8
 Cc5MDMwRzU6Kf7l9N1yk83vqVH6iV6AGeLb4sVibRCBHEdYBF2b5vsvxEhrz9dIkGbIV
 lmKHhmPHRcNn8x6kzKkJbxmzVGfq2SpAl4dlagXjalyA4FjFMqcNmBtWRCYQub7uqBgJ
 0O9kPKlqMnWoJTHuId0seZRrHpKe9uIAvWwZmJ3nlmbvcZIJL7oBygkWLNkyR+qrlN9x
 mVxUrmJWpRvnw+jhca8ZjeyhnQ8VAfIvxfRgynd9krW8PqZYN2oEu0iZ/9m1uQbRSmXt
 kX7A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbxKbvsKiaiLXVAgr5Ml2GDJGn5NDWhGXTFb3ZLY1fOs4J12cNSxReO3YtOYRzPCUq0Gnc3eGEp3ex@nongnu.org
X-Gm-Message-State: AFq9FYKQdG0IsuLZ8yjehYNz1aRIXeVOSZM+CkGsZfS3/2amSYWTrjLQ
 3I0oUrEhAE8xjk7Onzm7pgbldWCWnbhmIDgfVI66z1QMs48uoM4pq3JsyzrXNGt6XlKmdW4O/MQ
 K/HJNvTYZ4gisLl8Y1vMeubO2YvGvgp8=
X-Gm-Gg: AYBFou3l0HLX0AFVi7PzhA6abvT8sUgVe+9C0UJ44wSyCMUEmTjwYb8dg7KT4t6km7z
 LLkvv1lZoatNDoz7qy0vVOyRCwX1vo93gWwTwPsqa0N1QOOoGQrEW7zHpqLa6ryX582wa/ISWSx
 6Bt786GlchmE5EJei8Wuk5NinVoEom23+occ7X0bpQCbRx6k4UI/ERrgGA6i4zRUD+7XYdh6UE5
 qUCKdw2rJPI68jx2vgNnx60CitDmXU0qYMdWjbfChXcNvOlETnPP2vIZr3hpkrrd2mwjq36IIZE
 SbHnFjwnOu1pGOExrpT0Dt2vyeKuG9WgDfsxLwRsCcArIB0FNzeFvTk=
X-Received: by 2002:a05:6402:4442:b0:6ab:373:54f9 with SMTP id
 4fb4d7f45d1cf-6ae1996cf19mr2256379a12.40.1790820463967; Wed, 30 Sep 2026
 19:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260926081551.29-1-luoyonggang@gmail.com>
 <20260926081551.29-2-luoyonggang@gmail.com>
 <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
In-Reply-To: <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 1 Oct 2026 10:07:31 +0800
X-Gm-Features: AclHuK_YhTQfAsWte1TerVMP62F1spamOd33K7zgFzLJQ-ObHmTnnRtITObfAsQ
Message-ID: <CAE2XoE8FM0JG4YWkNo=vLfTAfCHe0U56vYjG8FSJb6XhhJGhhg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabiano Rosas <farosas@suse.de>,
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

On Thu, Oct 1, 2026 at 2:19=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 9/26/26 1:15 AM, Yonggang Luo wrote:
> > - Add machine_class_set_name() so boards can keep a stable -M name
> >    when the QOM type is uniquified. machine_class_base_init still
> >    defaults the name to the QOM type without -machine.
> > - Document that MachineClass::name is the -M name, not the QOM type.
> > - Sort -M help by MachineClass::name so order matches the printed names
> >    when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >   hw/core/machine.c        |  6 ++++++
> >   include/hw/core/boards.h | 12 +++++++++++-
> >   system/vl.c              |  8 +++-----
> >   3 files changed, 20 insertions(+), 6 deletions(-)
> >
>
> First, I'm not opposed to this series, and if anyone wants to pull this,
> I'm ok with that decision. It's just unclear for me what will be
> direction after this step.
>
> If I understand correctly, the goal here is to allow to register
> multiple "virt" machines, while still having distinct QOM types behind
> the hood, which does no affect behavior of current binaries who have
> only a single "virt" type at most.



>
> That said, if we project in the future where we have a binary with
> multiple of those "virt" machines, how will the current series help? The
> situation we'll have is distinct QOM types, that all answer to the name
> "virt", so we have no way to select them individually.

https://gitlab.com/lygstate-qemu/qemu/-/blob/combined-binary-multi-targets/=
tests/qtest/machine-option-test.c?ref_type=3Dheads#L393

This is the tests example to demo this, and all tests are already passed
that in combine of a

multi_target_supported_targets =3D [
  'none-softmmu',

  'aarch64-softmmu',
  'arm-softmmu',
  'i386-softmmu',
  'microblaze-softmmu',
  'riscv32-softmmu',
  'riscv64-softmmu',
  'x86_64-softmmu',
]

I tried hard to get 'i386-softmmu' 'x86_64-softmmu' to work. As they are th=
e
most complicated targets. And now it works. so this patch series is fine.

>
> Slightly worse, find_machine() will just pick the first machine name
> virt, which is a non-deterministic order at the moment.
> https://gitlab.com/qemu-project/qemu/-/blob/master/system/vl.c?ref_type=
=3Dheads#L846
>
> A possible alternative could be to use ".is_available =3D target_X" on
> those virt types, which will ensure only one is effectively registered
> at runtime, thus, there is no ambiguity on name or who is the "virt"
> machine.
>
> Again, I'm ok if anyone wants to pull this.
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

