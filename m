Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1016FCD8CA8
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:44:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKit-00006R-SI; Mon, 15 Jun 2026 23:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKir-00005k-SK
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:44:21 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKip-0000jO-5a
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:44:21 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-68acf0a15b3so6209031a12.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781581457; cv=none;
 d=google.com; s=arc-20240605;
 b=g6KsM+8zkIbhZp85vnPE5HeoLW2d3lhs4Yw1It79MAB+j538kw3Qmy2QXk4J7Klghf
 TsDPvivvfQXs2BicDKTPu/fOzbR90cmODXumW1HQAsoqq87ATYiZppyAbs/x0JKL4RcB
 rHhHVxeguwUQyB9SynQQMOM3HRqGZY4pVj8m0aGyOkpkHT+SgR3Q01wtRueECmPURDtC
 B93jA3ZYWauidKisaDEP6pjhaa1wLSfb/Amw15c4JBE5CFz6ulDMLPMZ3ffNLhjedbhA
 29pAkZqweo4PDjdEgPKAEoLC3oiRLtx/V3kHxtsQhuBPteGg7dt544v5zOkxqcY41ebu
 8ZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hJDm1EoT0f1HlKtP6PspAMHEHdYnq5dfOmfvoJsPUYc=;
 fh=1Px95JIGOONeMXiF4wlm8C78nXHgx/YKwSraw6/8lLY=;
 b=Y2lLLYJ22r50b+26xTzW4k9F16c3CqvhW1z7eOQseNBwo1OcD5LkmXBJVB+UYN3gt+
 9JBiQ8XrQREB9bhgr7F/foRPE1rqLXvGmydw12imEzFtzKuML8J8jKLp+Uju31+QTIDb
 fRZJUvmIuNfAzz31cqveqmdEDHzCaBM9RwRpxNUYexZDuJfDO0E0/AOb+dcqsdmglMdu
 y85Z1aJy6xSuh52U8gtMtttQpdF7mU2gg2qxTKmNE0WItyN4P5qszNFRQqdfXsa8DjRG
 /leFvRBvrblWdPSM/uQ5LB+KkotVE4eniLwjhFyiehV8C+cx1e7pUoCvl7Q6oVM/cNFf
 Ko1g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781581457; x=1782186257; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJDm1EoT0f1HlKtP6PspAMHEHdYnq5dfOmfvoJsPUYc=;
 b=askRqcfwnE13lfnPi2HAipofBhqD/hWj8sB82GW5Gg308W+TmOynYO7hBN+lwxtb0U
 zejZjyaaes2c4MrRUoi0mdVeXCTvJtD9bdG83YAyzpr6zbM7hHDIN3hTDktU8G34G93e
 MG4zelQRmOewdbGom+yAdIsQSEN+COyGwgMBo8LOFTDYALP4B5c2hJQtnlkWmzq9yBMq
 t3DnhAOBcHIIdOhKS5s4udq3xWcJnN6/mxzBpQq/v40sI50m7SAgqZ3iXxCtZb8Z+C+6
 RVenBS5i+9DqKAH3Kev/vMUib8lMOBksSR+VO27Mnj6K6JrWpPKg8Kw4xLNZWRMGKS/l
 ffTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781581457; x=1782186257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hJDm1EoT0f1HlKtP6PspAMHEHdYnq5dfOmfvoJsPUYc=;
 b=lJD6bMNVugVuVbX3xvlEQw92gAvev8XjX6M15V/Ox9FaaMEVf1UXbMpCYTXWxKNc/8
 oaPH0i+RnOrGOBvsOgt19LqO63Y7R4vSHKm7eqq9Fic0xyH57tywcxSsP1kBVqG6tWcj
 2OK2j9g/Hnq2op65YhMmGdjPhZXCghkxkp4JgvHYic2l6D03V6Uaa/IvacvnDuHwh+JB
 a0ckS8DPoe/oTMigH1bNih9Asl6jy/mvyAgpgYBfGI9xZ2iw5hm3aV9HfGxC/HKDjtnk
 rmaNAQOc69V436LL43i9bwj1PgNIqtt4DJxMsgD4xCWFgPELJe7tUXxiP3dquXFyYnTy
 /NbQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8rmVejRrImKIeCimcvoqqRw0C5T+Y+9jOMisw4krAvDmwZ7SutiggstROvaGGkRhnY5T+wYvo07+io@nongnu.org
X-Gm-Message-State: AOJu0Yy738smifWQaZRPeDoYTLxxDXs+tljNYjI8Qq6UsxvCs2WM7pmA
 Og4/IHnhZw4/UVtgmLrGETuV2HQworQURf23ANNflpazrnZpcCE13gx2wyRl0kOTC6wVAlLMVtT
 Y85LLq6OMRM2ZNlk9fapU7KXTL0fjooo=
X-Gm-Gg: Acq92OF79cH+BFPrrzS9koPcM2q0XK+KsatVwuVXPwr1cheKrNVdVRV3zjDbSMxXHud
 YEwP0ymr5nObZ7VCL3CeoO3W7uPa11kB9mLzUzU6IMw4RF7cHx6vdirDX50XDNfZWFtDntvJfeH
 KLYegJX4tvHm0npMi+yYWNpU4yjdrzHq8KgL8/N7Qirf7KODD3bJcsq/8otkSH+bu/vfbdro2oF
 ZYJAUBW3qso886HIiW1e/JJZu88vfHm5yMqELqG5HL8gT1K8Tuzp1fYrKJKiNXGtPU14dDhAU9F
 fHUkAHn4sR2xGXbJmOIzxNIf4ni7B7rHy6Mvrg==
X-Received: by 2002:a05:6402:2350:b0:691:b158:b40c with SMTP id
 4fb4d7f45d1cf-6950877be80mr935871a12.7.1781581457438; Mon, 15 Jun 2026
 20:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
 <20260611123412.2135600-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260611123412.2135600-2-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:43:51 +1000
X-Gm-Features: AVVi8CeUMVwxFseqyxQK8Po8xmrXAraJKUG5D4BoOhVixR3EJCH91g6KR8wW0wc
Message-ID: <CAKmqyKPHYPqwPPt3T6M9CstuMMFWXmvD8Etjkfdnw8Af_RhQHg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target/riscv/cpu: add CPU unrealize callback
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 philmd@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 11, 2026 at 10:34=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Next patch is going to dynamically allocate debug trigger arrays during
> realize() time.  We need a way of freeing them during unrealize(), which
> doesn't exist at this moment.
>
> There's a lot going on in that patch already so we're adding the
> callback infrastructure beforehand.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 9 +++++++++
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c1b10cc7ef..5b2133d811 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1012,6 +1012,13 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>      mcc->parent_realize(dev, errp);
>  }
>
> +static void riscv_cpu_unrealize(DeviceState *dev)
> +{
> +    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
> +
> +    mcc->parent_unrealize(dev);
> +}
> +
>  bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu)
>  {
>      if (tcg_enabled()) {
> @@ -2667,6 +2674,8 @@ static void riscv_cpu_common_class_init(ObjectClass=
 *c, const void *data)
>
>      device_class_set_parent_realize(dc, riscv_cpu_realize,
>                                      &mcc->parent_realize);
> +    device_class_set_parent_unrealize(dc, riscv_cpu_unrealize,
> +                                      &mcc->parent_unrealize);
>
>      resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, N=
ULL,
>                                         &mcc->parent_phases);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c98652cd62..11cd710990 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -575,6 +575,7 @@ typedef struct RISCVCPUDef {
>  /**
>   * RISCVCPUClass:
>   * @parent_realize: The parent class' realize handler.
> + * @parent_unrealize: The parent class' unrealize handler.
>   * @parent_phases: The parent class' reset phase handlers.
>   *
>   * A RISCV CPU model.
> @@ -583,6 +584,7 @@ struct RISCVCPUClass {
>      CPUClass parent_class;
>
>      DeviceRealize parent_realize;
> +    DeviceUnrealize parent_unrealize;
>      ResettablePhases parent_phases;
>      RISCVCPUDef *def;
>  };
> --
> 2.43.0
>
>

