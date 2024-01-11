Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9938C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:30:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO4Uj-0006Kk-S0; Thu, 11 Jan 2024 18:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4Ue-0006GW-EE; Thu, 11 Jan 2024 18:29:48 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4Ub-0000BA-VQ; Thu, 11 Jan 2024 18:29:47 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dae7cc31151so4694942276.3; 
 Thu, 11 Jan 2024 15:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705015783; x=1705620583; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=du1IavJIWBdDP20xh4ONlQiRPjaJ1D2XqOF3jy6wAQc=;
 b=gKIMRs13kWlQ4vs3S8t4kk7qxtq4UwLE4uzY0qWVZI6d0rNziHmM2/hiK3ziM/ZyRY
 0zNrwiaN+PAgfbF/Bd/y2kuk0UW3dhcSQhCQobK1+vR0DFmfF4q4MSQSH9q3TppbfXii
 /HWikEaR4IXhX9VNG3jeuRcifd103i5/V2u07OjYjnlIv+hrlElTK9VMHwYGE3JTaNtx
 ZOpvqwZ6LTBa48z6l68UHcziF13CF2ExCeZGUcT0EaGHiFA0dJHT1qTCLh6SSo4wamOW
 Pcs+lcW7BM06T48ZtikG6EOfWy/4dJZsT0NYUJFl41umK4aBfoBItOvflXQKk7ut+WFV
 trmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705015783; x=1705620583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=du1IavJIWBdDP20xh4ONlQiRPjaJ1D2XqOF3jy6wAQc=;
 b=k9hZy0uMzxesx9OOicYO2BUF1opF3XXle2VUQokQ9BCskfMGtDRtRFA3byJ+0CDCSc
 4kFf67xGzFlU7KgNUuc+BMNA1YOQX0f+jxgGI4mJ/CrdTLzDeQjBuAXIWkh6jFD7PfOy
 0P2Tv+6s9vqfPjBfhvWmobB5z3hiSYDc/AeDEWZuCtrPFlj0N0l/oce+jT6xxNsfxqzd
 Tsv7A+2z9PP8wqDMxQVwobNPEhFBt69rJmQn2UI2ahGwn550sIUXwQgqudGdybohpB/2
 L84C/lESL7RjafdAGIIWFznBe3klgCZNA8cbPbam1dl/C2+JZabliLILk5DItlcV00Al
 Tq/g==
X-Gm-Message-State: AOJu0YzI4psroseyz1Az3zHT1xBxSt1aYE0h4H3M+S/EIUZM6ShICzwm
 Gc+g4B/8hujRNoxcqYm1zk+LfzbP+Q4NrNAHGmk=
X-Google-Smtp-Source: AGHT+IHBbOhzbyunGMknfXiMMQitbHDlBWritE8c6YY3dLnEUY/sdXf9eyO4l64E/4J5cTd0z270xybVnE8JxuI3mU4=
X-Received: by 2002:a25:dccf:0:b0:dbc:b48e:6426 with SMTP id
 y198-20020a25dccf000000b00dbcb48e6426mr2837ybe.110.1705015783478; Thu, 11 Jan
 2024 15:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-26-alex.bennee@linaro.org>
In-Reply-To: <20240103173349.398526-26-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:29:17 +1000
Message-ID: <CAKmqyKMLTLw37HzHhEdmQdd+WRYs603jm7w30k5HLNmZNYGacA@mail.gmail.com>
Subject: Re: [PATCH v2 25/43] target/riscv: Validate misa_mxl_max only once
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Rolnik <mrolnik@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 David Woodhouse <dwmw2@infradead.org>, Laurent Vivier <laurent@vivier.eu>, 
 Paolo Bonzini <pbonzini@redhat.com>, Brian Cain <bcain@quicinc.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=alistair23@gmail.com; helo=mail-yb1-xb34.google.com
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

On Thu, Jan 4, 2024 at 5:04=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> misa_mxl_max is now a class member and initialized only once for each
> class. This also moves the initialization of gdb_core_xml_file which
> will be referenced before realization in the future.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20231213-riscv-v7-4-a760156a337f@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 21 +++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c | 23 -----------------------
>  2 files changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2ab61df2217..b799f133604 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1247,6 +1247,26 @@ static const MISAExtInfo misa_ext_info_arr[] =3D {
>      MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>  };
>
> +static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
> +{
> +    CPUClass *cc =3D CPU_CLASS(mcc);
> +
> +    /* Validate that MISA_MXL is set properly. */
> +    switch (mcc->misa_mxl_max) {
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> +        break;
> +#endif
> +    case MXL_RV32:
> +        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static int riscv_validate_misa_info_idx(uint32_t bit)
>  {
>      int idx;
> @@ -1695,6 +1715,7 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
>
>      mcc->misa_mxl_max =3D (uint32_t)(uintptr_t)data;
> +    riscv_cpu_validate_misa_mxl(mcc);
>  }
>
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 7f6712c81a4..eb243e011ca 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -148,27 +148,6 @@ static void riscv_cpu_validate_misa_priv(CPURISCVSta=
te *env, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
> -{
> -    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
> -    CPUClass *cc =3D CPU_CLASS(mcc);
> -
> -    /* Validate that MISA_MXL is set properly. */
> -    switch (mcc->misa_mxl_max) {
> -#ifdef TARGET_RISCV64
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> -        break;
> -#endif
> -    case MXL_RV32:
> -        cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -}
> -
>  static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -676,8 +655,6 @@ static bool tcg_cpu_realize(CPUState *cs, Error **err=
p)
>          return false;
>      }
>
> -    riscv_cpu_validate_misa_mxl(cpu);
> -
>  #ifndef CONFIG_USER_ONLY
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
> --
> 2.39.2
>
>

