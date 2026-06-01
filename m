Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04892CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:01:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtq2-0000Ba-K3; Mon, 01 Jun 2026 00:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtq0-00009N-P2
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:01:16 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtpx-0004CJ-FK
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:01:16 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-68c19f1f3ceso3732206a12.2
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 21:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286470; cv=none;
 d=google.com; s=arc-20240605;
 b=kdHyNongeFGXJSuupLvfwefZvj0XgtvGiXqOaXodMFFuAk1IYbrE7ILNkis6r58Sdo
 QpOswNlKPeV9DV7FuplfDiGixTlFJp9PMbkECTpLW3x8PJEyJnDy92gMAMk5SqXLWHHA
 YTdE2jxYu7tY+NV9ZVACjxSoM+S4uKsDXTgibvoBFsq8DziNHW/SgrgJGNhmMvvwe0PU
 CgNlPJ7UJC1r/N5xXvcU9FFszAS3n/T4s/rmfm8wlHaGhOJOJd6j2oxVFcfZAegu1Ul+
 ab7VNeC+GHKhm2h7KPOcF3djEmPhDwuBv5BgsUpyz/cu4bH8C7n4YJRT9K9MXF2h29Uy
 VWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Fb5KtcFXKjmTcRcYKLVlIMnXag4z2d2SS3kv89v/MbQ=;
 fh=XhnbjTPnm6wjpsEQe1KzWnbybr6pXxSkCDpwihyHsBs=;
 b=LZ0/zHGNZmbCuSjqzatrVCfH9gWjOIRBrkXOl20dMdN0OS9VuAgR6pobpqs9/Vou0j
 lQjgUXW+f2sNWpAA3/6tYCeEybUM5/gffLk1BcNhlwxL5VzjwfuEUhnlZ8yqUCPfbisF
 oqDPP+Uis5nE/J4iDt2UOJzTCif7O34BaL0BGRQneC0oAh+nqqcUDLNMqpKPg9WQXpxV
 hlFhK7F+yCCI+EyH9vhxB2Njlm/xXP09vIuFXkNeN5U7Rt5rfvTvMZ+vwWRfOg3ETEtp
 SqfnZ/DxNZnFNPoV3O1iho6vm1VrLQ8N1wk7wpDE15du9aa7TxDwzXaBfAFLmu5QoJV6
 4t8w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286470; x=1780891270; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fb5KtcFXKjmTcRcYKLVlIMnXag4z2d2SS3kv89v/MbQ=;
 b=HhiqjZbamDI8/RgQmV9HPEsijIgl1t4HAQFaGGjDQzlIVmNpipypb2YjPVq2T7AgUy
 7V6Iagt5VWjwi0cHSNnMAU04dxKMWmHhzHQId0nI1CQZDV/lu470AHIYGKqMcxK1XSow
 uGKx/rsSh61BwaUbwjry7DJl7vRGV0VndBQjOYugwxWQtU3BHH/1M8bRHXZDYfvg430j
 YUURpE8r5AIwDkwE4KAIQc6TtDe+Y/i2Pmj2SW0dojUyOUpdPwwKM935ewZ2jzj/FUfZ
 RJHS/7e1lfLqtToINuuEKiR9UF9SZxz6lzpMu1Y2JJVZFYFNKz2d1srJuNfDk3+wi8Gy
 UL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286470; x=1780891270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fb5KtcFXKjmTcRcYKLVlIMnXag4z2d2SS3kv89v/MbQ=;
 b=RmKoyQIUcL4Vs2LoTqGgY5kSRTz8PENPS8zgWq9H/C+qv51m5V3z59VQQWKxJqjMwg
 GwFR0aRGjlZSWlbADMTyNDsNK6aH6eFt/w1es2AnIqQeeCF+nVenVb401SZcsI+HVlWy
 DrmfY/a2m9FzKJJSEU6oEJ1Wlvk5S8olofuLpoas5WCJxvx1tGFjgNAZeeh7//geIuX1
 MIQZn7K6H86YZzY+XcCDNzFONv/my942NUYxQebsjJH/B8RTIYzfCipfo9H/XwZrtfL2
 HNTn3NWXa9m2uer3DT9N+2Y2GaS7TMs/Q/EbdeB2fkHrL7qyghJUy1dKYojvJfO7Ep4o
 bWDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+F6CNvL1HjsGQjcNshSturIBGYrHsU5xSI8eYpHrM3cb9rA+abU2lvnXgjJQrkFBhLNAFpVK6ZG11H@nongnu.org
X-Gm-Message-State: AOJu0YzEtS0ln99R8WyJHjS4MU1N3sc3N9/6WUwXmj5uNvCqLhU+H5oe
 aNIlZ8KTIFfkz8IQ0iK87/ZvExxmIcZV4WYJqoXIxx0Be33pejBfG/57+i2c4iJN0acJ50W4y+i
 +Mnh0jbk6Mo50gXgU12rcuKJCzq+6voE=
X-Gm-Gg: Acq92OHeyY6A01qpA9+XKQyo27RgmX5mVwH3WvI811ugcoBfx2jrhRWlVRtWqvh22AT
 3QqdBJvdiocTYuIcedviumLR5+VpgBfvdGD805d4ESKbAnxkuSI3bCzLcAV8myv/8ldJFNuP1ag
 O5eoi6/zMU0GtV/WnUpS0I6/M9Qj4PKyKiL99LOJyYmAZ6nwh3wT7NUevEi2ZQj2gzuM049GDsE
 gAtRdCr7+KDMHqsvzyn4r0uj5nJGfl0JaXwef4FJXUyJMou94zUwLt8UC/ko4b8XRD/3XXURLtc
 fhUQqB7nrL+s4PAcQkZEO5vBtelAYyfJbRMeGDmeJfx0Yr+t
X-Received: by 2002:a17:907:783:b0:bd9:aa4d:c6b5 with SMTP id
 a640c23a62f3a-beaaf90de10mr539107766b.9.1780286470044; Sun, 31 May 2026
 21:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-10-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-10-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 14:00:43 +1000
X-Gm-Features: AVHnY4LkDE1nweUS6wX1oPC-XfeEWW36GWT6MisBoUmIgxx4NSAWNkWcfkJsixc
Message-ID: <CAKmqyKOUUJ_DKWmqe279z7HVJMWOYFimZBtbuY-F=e+3PkLLbg@mail.gmail.com>
Subject: Re: [PATCH v11 09/12] target/riscv: Add big-endian CPU configuration
 field and reset logic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
>
> Add a big_endian field to RISCVCPUConfig and wire it into the CPU
> reset path. When cfg.big_endian is set, riscv_cpu_reset_hold()
> writes 1 into the MSTATUS MBE/SBE/UBE fields using set_field();
> otherwise it writes 0. This makes the reset value deterministic on
> both cold and warm reset.
>
> This models fixed-endian harts, not mixed-endian implementations where
> the guest can toggle MBE/SBE/UBE at runtime. The MBE/SBE/UBE bits are
> not included in the writable mask of any mstatus/mstatush/sstatus CSR
> write path (unchanged by this series), so the value chosen at reset is
> effectively hardwired per section 3.1.6.5 of the RISC-V Privileged
> Specification.
>
> The user-facing property and documentation are added in a later patch,
> once the full endianness support is in place.
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_cfg_fields.h.inc | 1 +
>  target/riscv/cpu.c                | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fie=
lds.h.inc
> index 734fa079f28..9eb47af0a76 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -157,6 +157,7 @@ BOOL_FIELD(ext_xmipscmov)
>  BOOL_FIELD(ext_xmipslsp)
>  BOOL_FIELD(ext_xlrbr)
>
> +BOOL_FIELD(big_endian)
>  BOOL_FIELD(mmu)
>  BOOL_FIELD(pmp)
>  BOOL_FIELD(debug)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 52f143f1cd4..fef424f2bf9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -739,6 +739,13 @@ static void riscv_cpu_reset_hold(Object *obj, ResetT=
ype type)
>              env->mstatus =3D set_field(env->mstatus, MSTATUS_MDT, 1);
>          }
>      }
> +    /*
> +     * Model fixed-endian harts: MBE/SBE/UBE are initialized from the
> +     * CPU configuration and are intentionally not writable via status C=
SRs.
> +     */
> +    env->mstatus =3D set_field(env->mstatus, MSTATUS_MBE, cpu->cfg.big_e=
ndian);
> +    env->mstatus =3D set_field(env->mstatus, MSTATUS_SBE, cpu->cfg.big_e=
ndian);
> +    env->mstatus =3D set_field(env->mstatus, MSTATUS_UBE, cpu->cfg.big_e=
ndian);
>      env->mcause =3D 0;
>      env->miclaim =3D MIP_SGEIP;
>      env->pc =3D env->resetvec;
> --
> 2.53.0
>
>

