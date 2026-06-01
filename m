Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88753CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:06:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtu7-0001zI-3x; Mon, 01 Jun 2026 00:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtsA-0001LQ-UX
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:03:30 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTts8-0004x8-Kt
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:03:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-68cc6c7df99so1987149a12.1
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 21:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286607; cv=none;
 d=google.com; s=arc-20240605;
 b=kcRn8eno3zvJ58Foh3MVfsPhNHzTfdWYOkoLEITCdizI0Yyfd8LHp3d96e8ZZjytqa
 svIwG3Y4Cw4q2xxBX5JRjjPeK1/I5t6dr8v4bOdaqFb7+bTLIeJKalSGAEa8lIX7FUuD
 7lHm5fJVvgxT+FBK7slDoHucT8F32OgZEQUc41H0utgtHbT1P9sJKsYE68H340DUgMIb
 Ms33B2VqZwartZKdRjhExsPTAhsq258DjWcLENUo53IZhJatiQHo1CrklCu/D/eZ7K8R
 LABgYB43JzAy00Bol/5W5AT71Mg+H1ReA1t4Gi9bWxgip+XIxIH6MYhH5reSUYUGwB3I
 cMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5lQ2CRJVJRF3dAw5O0Gz8GXOHNbsk01cV0af47qhLwk=;
 fh=WGb6oMEsDXpqSBFS8EdtxD5ejcgXOztVS/nk9fwTAY4=;
 b=VKSKt2ijmWboayTeKKYHHdG2QvQtzfVTBmTSMpmodwnY2vXn6K1CZvjz9+Np4gh8oh
 qYytlAmNxjGG7K+G3JLeP0Ziu8jJi6cT9V2ZJCAAm2uPVgBR+jpHTEMfq8sXnXMdWwnH
 vE6THLKteWTgD2YmFrv3Wlup99lD18dTEKLdycX9zPgjv7qYZGmfOekLPGIsoTMm6ceP
 EDkCp+SNljLrRPT2aOas0QSGtmaxzKBkoVpUQ4aU/2P4QIw5w/PHobdDpzUgJQR+8qHP
 6wvXAnOMr8u4lqEg3yxkFZkOcl96H74uLh29SJRhKrfdM9H+6xtuOqiU8q1G/A2hVtkK
 lb/g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286607; x=1780891407; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lQ2CRJVJRF3dAw5O0Gz8GXOHNbsk01cV0af47qhLwk=;
 b=mXYysfgR5eVNWlwSfxWwYPky7Tqx2Rk5i2kmBZxRBJMyn2o6p8KhmO5jiKTxVCehn+
 Edcr00XuQjeWC2PUHBWEPiq8lv5tIWMJ08YRV6vQcWiNVN6U9JlpcIWY69cLpyH/NY6z
 m4I//8qQsru3AbAx8KwTrbO6ebzG8+u9TtHjBmxPxXaMWo2XrXxWQz9GrlV2+k0XbR5b
 keCBpAYVKkW05nyvjUXwahnwuWo9Y2ylyMPtHQf6WJxXYdEsImnovhpW+fMex9nKI7rq
 zhhhx35yN7AW4Xpg4+eTk3VisABqJjsCYxgkIUeHzrJec4vWbg6FyM6yONSoJ5M+ROBb
 zS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286607; x=1780891407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5lQ2CRJVJRF3dAw5O0Gz8GXOHNbsk01cV0af47qhLwk=;
 b=aQce9DuqwFQCbprAOPky7Zvs81jCpxe0ypFXbhTjic05opxQQeV80jFDMCOdE3F9ST
 2eulSD0x/z5oNCgui28tDeEDwfZYazZ214IGM16doMhrhDHPd6hu2LIMzr83J3YsCCEJ
 LImcvGWIt1l/vhRwaqjIu74EO+0kEaz3O2EKtBsUEh84OTus1fxV162/N7FxxdwFcQxD
 PLndXu017IpaNBK6j5Ol/YOdCg/tW7p3ugIhkxSBa40J0an4xbvkKZ2FglwkfvEltFIM
 vCbe7Sqa8q+buzEJ1iG/IXk0GRU243PkZA+t3y02X4k2tdGSMACFD0HM0QFRz80n6JZW
 S5rg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NwBbxJ1HKcPvSM4Whu7zvlNXkTD7cyorc2QuB7dDxofzS5cRZqRjLughn3OwHDLS39bPOFaUtl45Q@nongnu.org
X-Gm-Message-State: AOJu0Yw1iEDoWxrydg50+M2NM9TRSpuBd+k77vHs7QohbgkHSCVjcP7S
 SI0wPoAtZexl2WjHRsiDipy7qrv0c6WfLo2dEAgP/Nuw3aXreppbKVvgi2faB71B0DvICncXtwG
 26xzha2RFt2qBmo1VCb7zuNFIcaHAVYs=
X-Gm-Gg: Acq92OHaHQpURFqjADW0C1U+4guEDEBxbpEU6fAo7geaOhnqOofLvUCerB/uRfU1vKl
 7LD/1n10O3a7VVcqjf1k+DdWW35rOpb90tewz/G7NHRWZZ64PAlEv0VJkWU7gv/X1LSRnFRn/oJ
 q35Vmm0CrMvZb9rh8A/hRUkcVO4XRMyfUhEW5Nj22/fkBDKRB5/C92q7yElmomXphuEq2jZ3gin
 b5hO2jJCNzHcu9VtDtcEVqrPY4pfttkaQEROcU60eeGGAjSyZGwyXyGQUX95YVMNx6T93Zg/y/L
 0sdMY/l3embC7YJHHAYKqBSCv2QxzyJMZTJnCe5U0TXb6xTc
X-Received: by 2002:a17:907:a602:b0:baa:6847:af9 with SMTP id
 a640c23a62f3a-beab77be12amr510988066b.28.1780286606581; Sun, 31 May 2026
 21:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-12-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-12-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 14:02:59 +1000
X-Gm-Features: AVHnY4LcqcVJNdKzsuknIFw-jdRx16Y57eOcd_XPbwd-_hkrM48hzcfU0yb9WbI
Message-ID: <CAKmqyKO1_uSgjGTXA1u+DgJisv0apyQuuSxcp9yDKeZPBZMsvQ@mail.gmail.com>
Subject: Re: [PATCH v11 11/12] target/riscv: Expose and document the CPU
 'big-endian' property
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
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
>
> Now that the full big-endian data path is in place (runtime MSTATUS
> bits, boot code, and page-table walks), expose the "big-endian"
> property to users via DEFINE_PROP_BOOL and document it in
> docs/system/target-riscv.rst.
>
> Document that the property models fixed-endian hardware: it selects
> harts whose MBE/SBE/UBE fields are fixed to 1, and it does not model
> a mixed-endian implementation where software can toggle those bits at
> runtime.
>
> The property can be enabled from the command line, e.g.:
>
>     -cpu <cpu>,big-endian=3Don
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/target-riscv.rst | 29 +++++++++++++++++++++++++++++
>  target/riscv/cpu.c           |  1 +
>  2 files changed, 30 insertions(+)
>
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 3ad5d1ddafb..afd86ca2ba1 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -95,3 +95,32 @@ the images they need.
>  * ``-bios <file>``
>
>  Tells QEMU to load the specified file as the firmware.
> +
> +RISC-V CPU endianness
> +---------------------
> +
> +The RISC-V ISA specifies that instruction fetches are always little-endi=
an,
> +while data accesses can be either little-endian or big-endian under cont=
rol
> +of the MSTATUS ``MBE``/``SBE``/``UBE`` bits (see section 3.1.6.5, "Memor=
y
> +Endianness", in the RISC-V Privileged Specification).
> +
> +QEMU implements the full data-endianness behaviour described by those bi=
ts.
> +In addition, the RISC-V CPU object exposes a ``big-endian`` boolean prop=
erty
> +which models a big-endian-only hardware implementation, where the
> +``MBE``/``SBE``/``UBE`` bits are hardwired to 1. When the property is se=
t,
> +the CPU is reset with all three bits initialised to 1, so the guest star=
ts
> +executing in big-endian data mode from the reset vector. The property is=
 a
> +static, per-CPU hardware configuration option and is not meant to be tog=
gled
> +at runtime.
> +
> +The property does not model a mixed-endian implementation where software=
 can
> +toggle ``MBE``/``SBE``/``UBE`` at runtime. QEMU's RISC-V CPUs treat thes=
e
> +fields as fixed by the CPU configuration: they are reset to 0 by default=
 and
> +to 1 when ``big-endian`` is enabled.
> +
> +The property can be enabled from the command line, for example::
> +
> +    -cpu <cpu>,big-endian=3Don
> +
> +No upstream CPU model currently defaults to big-endian; the property is
> +provided so that big-endian-only RISC-V CPU variants can be modelled.
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fef424f2bf9..c8a41c57a57 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2520,6 +2520,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_ru=
les[] =3D {
>
>  static const Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> +    DEFINE_PROP_BOOL("big-endian", RISCVCPU, cfg.big_endian, false),
>
>      {.name =3D "pmu-mask", .info =3D &prop_pmu_mask},
>      {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */
> --
> 2.53.0
>
>

