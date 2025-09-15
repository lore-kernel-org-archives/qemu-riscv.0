Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6DFCA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 04:17:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0eK-0005Aj-4i; Mon, 15 Sep 2025 00:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0eH-0005AS-SD
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 00:17:05 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0e5-0004Wy-J4
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 00:17:05 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso6448829a12.0
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 21:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757909807; x=1758514607; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XpGJCg2a2t5M7PP3jlt8OoFmTuzylEkyG3pmS234oI=;
 b=BWLe5I8x6pA/ddsw8SFO022q6G3kMK4ScpI3u3kPxbBA5zklUVidSJPZUbGjpEVIEU
 OfiZoH1YUhqiD0G/RATtCcy1mQgP2QyT6kOr4E+JjM4zfyKpKVCUKOViVllh3QJ2R2ju
 JMZaZl7XogB/H8ShugaGKqxcvEvOf9peF+FkearjEuxxqoDOS50kAjtSa4vXd+T88QU6
 QRb/2LkCuipMDpcQRPyGq3mOduoxCrIokMDSYitrMl/ngBE/oRnxWJUlekzo7qQcywHv
 28mA7+gw4xQ1qkv0l3wPZTERgXLVs9HvhUo/33MpKugKdjPyUD4Zg+PakpdeYNe3QGPW
 6zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757909807; x=1758514607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XpGJCg2a2t5M7PP3jlt8OoFmTuzylEkyG3pmS234oI=;
 b=hN9T2wAyLUrp/O1x3+927dGqATlBrnhKy5ItL9NathgiI1ukp4mGmgtnYtK/cnPI9Z
 7IYYfhChemFh+KROUR8Q2B5q22/muppTM+ED+SiuAC5hXFYPZ1n7DtZtucqpUq9nD74X
 c6wzGKgJ8wmoKSJx+S2Orv7RJgC38KQuJgkzJvqESxNs2WmLUgeYJvfL5Sc8L8EKBjBs
 diL7XIOFvLmnINK5eSr9IRNb1lsaeDeKX3sPpgsKlp3jspeDvpSGOv0Of4ab/EkrPRuz
 p3TCbV+JNWPifY1iJ3QlBRp6v7+aybvpkUrz3Qa+lZhvHxXWPBqWfBRTC/WvHAXL0leX
 pZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiQRa636pQlQii9p1HLjyIV+67h8pl8ZsM8tJR56S7P2XD3TDYvsTdXasgzW0ZYubyURgTutY9Dn9v@nongnu.org
X-Gm-Message-State: AOJu0YxtGwOP9uuJS/PyyT7arBH3kefyhqOYNvKImi9+7Vt3+qj8dwAU
 +zUkr6Cag4DRCW/78uMoMN1tVnhK9AleRJC1xIYQwTQLmGl09jl4ZndiTQzH52CX1ysm5N8JdYH
 ThOBbu0ok7p7WNXxQTq+jx10ZM690eLA=
X-Gm-Gg: ASbGncuryiGP/s3rsWNjPU0H1bNb/TtAI94KtAzWVoppRTkE67v9n+lk2ud+tDVhqYt
 u/k0yJBi5egvubEKFHUqWX7rf4O1rulIrT7TfbFrP1s1mFhGvbDDOJNENC3pxt6ePfiuofsyGoN
 8EEljRNOpi70GOf6DIFyfydoxyl9Q6x/+VBH2uI9NnLJfSHMQPQegqH2Tn2U9aV3F4ZCGqwWc4z
 EJZlPl2NZIS2LujEOkMGvAZnL1KMAkITHoykQ==
X-Google-Smtp-Source: AGHT+IEh+uxXyvTniXpZ+89hEOsRI3pW7LEjQh1UG9G/fNTs5I23ZVU44RRUdkk9Nb3ddqN7gKYszvbaIy0l0a3ny7c=
X-Received: by 2002:a17:907:cd0e:b0:b04:8d6c:507a with SMTP id
 a640c23a62f3a-b07c3877430mr1039383066b.50.1757909807028; Sun, 14 Sep 2025
 21:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250911-timers-v3-0-60508f640050@linux.alibaba.com>
 <20250911-timers-v3-2-60508f640050@linux.alibaba.com>
In-Reply-To: <20250911-timers-v3-2-60508f640050@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 14:16:20 +1000
X-Gm-Features: Ac12FXzQ-vp4DjNJAKcYA7_cZ3m24--FeD5ai1fGlj0ZeAfPf_mr4sP-KkObDdo
Message-ID: <CAKmqyKO8XdUO8uVn7RNeBxQc8yak+js1_ewTtO8R1T0ycGp=Lw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] migration: Add support for a variable-length array
 of UINT32 pointers
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 11, 2025 at 7:58=E2=80=AFPM TANG Tiancheng <lyndra@linux.alibab=
a.com> wrote:
>
> Add support for defining a vmstate field which is a variable-length array
> of pointers, and use this to define a VMSTATE_TIMER_PTR_VARRAY() which al=
lows
> a variable-length array of QEMUTimer* to be used by devices.
>
> Message-id: 20250909-timers-v1-0-7ee18a9d8f4b@linux.alibaba.com
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/migration/vmstate.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 1ff7bd9ac425ba67cd5ca7ad97bcf570f9e19abe..1cfddf31b54090f0f63380794=
092858b4bed8bcf 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -522,6 +522,16 @@ extern const VMStateInfo vmstate_info_qlist;
>      .offset     =3D vmstate_offset_array(_s, _f, _type*, _n),          \
>  }
>
> +#define VMSTATE_VARRAY_OF_POINTER_UINT32(_field, _state, _field_num, _ve=
rsion, _info, _type) { \
> +    .name       =3D (stringify(_field)),                                =
    \
> +    .version_id =3D (_version),                                         =
    \
> +    .num_offset =3D vmstate_offset_value(_state, _field_num, uint32_t), =
    \
> +    .info       =3D &(_info),                                           =
    \
> +    .size       =3D sizeof(_type),                                      =
    \
> +    .flags      =3D VMS_VARRAY_UINT32 | VMS_ARRAY_OF_POINTER | VMS_POINT=
ER, \
> +    .offset     =3D vmstate_offset_pointer(_state, _field, _type),      =
    \
> +}
> +
>  #define VMSTATE_STRUCT_SUB_ARRAY(_field, _state, _start, _num, _version,=
 _vmsd, _type) { \
>      .name       =3D (stringify(_field)),                                =
     \
>      .version_id =3D (_version),                                         =
     \
>
> --
> 2.43.0
>
>

