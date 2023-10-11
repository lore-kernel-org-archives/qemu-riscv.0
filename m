Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA0DCD98EE
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 16:06:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqbip-000309-BP; Wed, 11 Oct 2023 12:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qqbin-0002yj-Bm
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 12:06:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qqbil-0007uq-3i
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 12:06:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4065dea9a33so322655e9.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697040361; x=1697645161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASYAPTyOatoJjamphJuEcePh6lp0NsWZ3hpTdyaK6Zs=;
 b=I9vxDACx1rmsqFse6LQxW8jub/0L8HBqNxjRsobvZVbOK7gU8a5C83ZGio+BwZkv4g
 k9C+rO27DYtg2vm6NDsNrpfNWQE8HmD5PGVWxpgCjP+D0bLZJ21N3HPABvXQHk+ZXwbJ
 eLqEgSKzN3tB4ezI1/npgq8sFFmr/9wJSEXsGb3XhyjLSd1Z34Lg0q5b78vBGI5aIQ9m
 q/wB1Bt/pKnXF26pAlQa3qB/ez1tmR4voNmZDwrEnBDX1mWudVOtX/Lo/cEMWeHXck3p
 FJpF8SsAu1uToXmo1dbho5lPy4TLV398AzED3ywsla7Td5f4+VLgf0nB1mNZt49TCfyT
 A3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697040361; x=1697645161;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ASYAPTyOatoJjamphJuEcePh6lp0NsWZ3hpTdyaK6Zs=;
 b=j3N8y/G/wCcJpkWFPSasmCUJ+C6IB1wY7Q+WoxCKGgJD2JRQ71/cGWKP/SqFb1yzwo
 DP71MZy5pReQTJB3eeRR/d2yYAE9czzGUl7hVENQYIkjKIuPEE/x7AHzxUWZDLD3j8QH
 G3RpNpQ/eGBhqBcHj7/hT7mDLx1jBXaiUuFec8RZaetJC7PLeReOqbBec/kjQ8NNRpjh
 iCu8QcqnecbHjVGzKlboaEYla0eVKzIA5T/N06MbwIAEIPddZ/SIp56nY+IOGiEGStaT
 GJeV8piETzj61+lBTzHqYEOhIifEHnHxwJwc9Omk6LqBSb1MO5bCbtqfxhhr68flTLFn
 x5VA==
X-Gm-Message-State: AOJu0Yzb73jjBCY2BYX54w5i2L5YY5bOryWLcBtGnccli+RN3fbrqeOh
 e/7/O9zFQh21u6sm0VRx1v4eZg==
X-Google-Smtp-Source: AGHT+IF+RvwVx8KC/vDL3paiXacfmqmFE0Z8u38GiUqeEb7xeG7LI7vgBCVfc1XMp5EIkIHMb86XNA==
X-Received: by 2002:a1c:6a07:0:b0:405:4f78:e128 with SMTP id
 f7-20020a1c6a07000000b004054f78e128mr20024952wmc.4.1697040361203; 
 Wed, 11 Oct 2023 09:06:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a05600c450300b0040747010f8csm11206285wmo.40.2023.10.11.09.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 09:06:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6503E1FFBB;
 Wed, 11 Oct 2023 17:06:00 +0100 (BST)
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
Date: Wed, 11 Oct 2023 17:04:00 +0100
In-reply-to: <20231011070335.14398-2-akihiko.odaki@daynix.com>
Message-ID: <87il7dnnyv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
<snip>
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
>      riscv_cpu_add_user_properties(obj);
>  }

You don't actually need env here, although only picked up by one
compiler:

  ../target/riscv/cpu.c: In function =E2=80=98riscv_host_cpu_init=E2=80=99:
  ../target/riscv/cpu.c:673:20: error: unused variable =E2=80=98env=E2=80=
=99 [-Werror=3Dunused-variable]
    673 |     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
        |                    ^~~
  ../target/riscv/cpu.c: At top level:
  ../target/riscv/cpu.c:2337:31: error: lvalue required as unary =E2=80=98&=
=E2=80=99 operand
   2337 |         .class_data =3D (void *)&(class_data_value)              =
 \
        |                               ^
  ../target/riscv/cpu.c:2368:5: note: in expansion of macro =E2=80=98DEFINE=
_CPU=E2=80=99
   2368 |     DEFINE_CPU(TYPE_RISCV_CPU_HOST,
        |     ^~~~~~~~~~
  cc1: all warnings being treated as errors

https://gitlab.com/stsquad/qemu/-/jobs/5271601075

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

