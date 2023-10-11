Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB552CD6E7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 15:35:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqbE6-00034V-Sp; Wed, 11 Oct 2023 11:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qqbE2-00030s-FT
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 11:34:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qqbE0-0000ui-Lc
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 11:34:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40651a726acso64805505e9.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697038452; x=1697643252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhDVrRocRAbQ/g0EQox0gU29iJloD5blhZKMSXpYCTw=;
 b=HCdJnQoe4cvd52YOZOY7wEL8eWriFnGNQSZBckGH36pl+6v0bnFjfqanSI6CHUZJdk
 RRL7i31vUz4molsUnoCOV1Ejr/ABGgF4qFL8s39VJwbbqD024hIBRVX+iZwLNcjYEfit
 VVB2sfFy2Aff3ITLO3as8QVtj53flkMITa3XeIZODuusNac8FKxaWppr6B4PzNpkAsBo
 yycRg6OjzOKVQIJdwzhKunOmWGf7CY5v55gRMQQ948ZtdsQtmKAiFOxYfkL7tVCQhVtO
 Oq4JCJaoC0x0yjdA252mzG6ipl8DZcjf5uPyX48zzjCKgFFNrPxIg7v0rI4KENPbZ5Vh
 k5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697038452; x=1697643252;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HhDVrRocRAbQ/g0EQox0gU29iJloD5blhZKMSXpYCTw=;
 b=FZNV/nvmo5DAvlS73GS552tGCsZ7hQk7sOphvjQjIioGCj3dj+REtc28tIoV8W9k8x
 owAyVPYEWc4c5EpzSmGfzEa5drc6aQ3bXWmA+zp0Cc4oJpvSKiSNAtPPdxWE7mXQ2o81
 XwdExEAF2n8WqbfWVnS0a9bznuDCdeLpK5CJazcfLyUU5TAlpZUJKFHkBDSSnkLiMbWb
 NjR55GwhUl+ZYyzjUFpgVnzG709p68eR2+YuL2kjtlql0eK6l4rrXWQw7omt3s4SYnve
 yJ6jaxZM5JtZHBQ0o86wUASPnq3R3tTwcIcdxH6F47OwgBLhICFqFf8sZIGecAlyRh32
 HNgQ==
X-Gm-Message-State: AOJu0YzvH0fm5WEzBhPp1EMnDBTNkwVjOXapHmpaaJlnapYXiP40N+QC
 f0IhSge5IrtF+y8qLWLYHjPoqw==
X-Google-Smtp-Source: AGHT+IGvzHGGNBNE6SdVWhU/xIFKDVF8wyrsJZXOabOv4b3+yGDMAGzce6RvSnb3ZVST1HUccEB0Ig==
X-Received: by 2002:a1c:ed02:0:b0:401:38dc:891c with SMTP id
 l2-20020a1ced02000000b0040138dc891cmr18292007wmh.5.1697038452547; 
 Wed, 11 Oct 2023 08:34:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a7bcd98000000b004064741f855sm17078003wmj.47.2023.10.11.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 08:34:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9701A1FFBB;
 Wed, 11 Oct 2023 16:34:11 +0100 (BST)
References: <20231011070335.14398-1-akihiko.odaki@daynix.com>
 <20231011070335.14398-2-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v9 01/23] target/riscv: Move MISA limits to class
Date: Wed, 11 Oct 2023 16:23:15 +0100
In-reply-to: <20231011070335.14398-2-akihiko.odaki@daynix.com>
Message-ID: <871qe1p40c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> MISA limits are common for all instances of a RISC-V CPU class so they
> are better put into class.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/riscv/cpu-qom.h   |   2 +
>  target/riscv/cpu.h       |   2 -
>  hw/riscv/boot.c          |   2 +-
>  target/riscv/cpu.c       | 212 +++++++++++++++++++++++++++------------
>  target/riscv/csr.c       |   3 +-
>  target/riscv/gdbstub.c   |  12 ++-
>  target/riscv/machine.c   |  11 +-
>  target/riscv/translate.c |   3 +-
>  8 files changed, 167 insertions(+), 80 deletions(-)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 04af50983e..266a07f5be 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -67,5 +67,7 @@ struct RISCVCPUClass {
>      /*< public >*/
>      DeviceRealize parent_realize;
>      ResettablePhases parent_phases;
> +    uint32_t misa_mxl_max;  /* max mxl for this cpu */
> +    uint32_t misa_ext_mask; /* max ext for this cpu */
>  };
>  #endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ef9cf21c0c..9f9cb6cd2a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -155,9 +155,7 @@ struct CPUArchState {
>=20=20
>      /* RISCVMXL, but uint32_t for vmstate migration */
>      uint32_t misa_mxl;      /* current mxl */
> -    uint32_t misa_mxl_max;  /* max mxl for this cpu */
>      uint32_t misa_ext;      /* current extensions */
> -    uint32_t misa_ext_mask; /* max ext for this cpu */
>      uint32_t xl;            /* current xlen */
>=20=20
>      /* 128-bit helpers upper part return value */
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..b7cf08f479 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,7 @@
>=20=20
>  bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
> +    return RISCV_CPU_GET_CLASS(&harts->harts[0])->misa_mxl_max =3D=3D
>  MXL_RV32;

I'm going to defer to the RISCV maintainers here. While I agree the
class is a good place for these parameters that are shared across
multiple vCPUS there is a cost to RISCV_CPU_GET_CLASS() casting.

You might notice we have this comment in include/hw/core/cpu.h:

  /*
   * The class checkers bring in CPU_GET_CLASS() which is potentially
   * expensive given the eventual call to
   * object_class_dynamic_cast_assert(). Because of this the CPUState
   * has a cached value for the class in cs->cc which is set up in
   * cpu_exec_realizefn() for use in hot code paths.
   */
  typedef struct CPUClass CPUClass;
  DECLARE_CLASS_CHECKERS(CPUClass, CPU,
                         TYPE_CPU)

However I think you need to check the assumption that you will never see
multiple cores with different RISCV properties.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

