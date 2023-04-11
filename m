Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5fM-0001JD-Tr
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5fJ-00017x-Rc; Tue, 11 Apr 2023 00:31:34 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5fI-0003q8-FA; Tue, 11 Apr 2023 00:31:33 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id b26so6332789vsa.11;
 Mon, 10 Apr 2023 21:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187491; x=1683779491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nLl3QJFcnBi6L9ok4tZsX56DjYo8jYSH+h5ay/+Q7E=;
 b=H7tE/YmF0Ygse+DYr3rzyDCvCWYU1xjSdQamAOs87QgzKEZgaxDKX6d+r5DSTr0b3F
 08KPw6Xaqw82l23woTusGnEXfBFQYSsotepok2mwGbJisqaVyppxMeFI8ZwkcPoaavNB
 utTycoMmmwh7C9Lw68ZcyOkuJqXFsZ65QrXXJXJKWmX+VgpWDcZWQAhnfdYxONmjNClt
 tJjBXkVhqz3usVuQpv5naFjh33tCe0abXa2nItXYQQ3KXsG2Y5uo9h/PPjDwZvohVNKb
 oXrVZSKhRBroK2E3XOFj3OseIrlH2UpNg9qpyKksmS9cPaekECcEn/hJH3W2w4FNkowk
 8IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187491; x=1683779491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nLl3QJFcnBi6L9ok4tZsX56DjYo8jYSH+h5ay/+Q7E=;
 b=lZHaVSQGw0bcJroFVEDEhWBYa7WgYfuDynYwDw6m0CpJwrB3upqpIlTBHCC8AmGCJu
 7laxUT53pTiPB/XAaf+b9K2L0mm37Dbl4N7q16i0N2rCsmZ86otkl/dv5MmMU1NtEfam
 /lilzW67Y0o7rf00IU5CWh+WPSZhjiy/xWWh4PcMti3YYyyDaItzUVu2WoDalyv2UQ2J
 7tnb/ZaXSR+8cegSA1mexS+eAA/PH48k7wao0V8ZMVc2eK3SCLNSRz7qkW4loASP3Pyq
 j0D5zqc63yaQZWfNC7Y+UkCpbollIm5ZXYHI34BfJsJ1uBcVCgJtBTq/4jiSMN5xhGHZ
 dGkA==
X-Gm-Message-State: AAQBX9f5+eynwVza9TEJ1dskmMUaYYM8ALLZ3NVxSXdB305qgwssRDlj
 A93tTIjA222wEyYhUp3qzEdRTvBL50PWSVPVyqHYI6JTleQ=
X-Google-Smtp-Source: AKy350bWIaQ4iR1suTE6ra6m2E6OA06GWILrZvzpw93zATg3CqrsN/dZz0OgyIlxZgnODIa1L8A8Sfpy8rRknMLflCk=
X-Received: by 2002:a67:d38d:0:b0:425:8e57:7bfd with SMTP id
 b13-20020a67d38d000000b004258e577bfdmr7664409vsj.3.1681187491244; Mon, 10 Apr
 2023 21:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-23-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-23-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:31:05 +1000
Message-ID: <CAKmqyKNi2hJ5_WnATerK+YcZ1pre24U+PjBUTg9iP1WgaxgJSw@mail.gmail.com>
Subject: Re: [PATCH v6 22/25] target/riscv: Don't modify SUM with is_debug
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 04:31:35 -0000

On Sat, Mar 25, 2023 at 9:55=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If we want to give the debugger a greater view of memory than
> the cpu, we should simply disable the access check entirely,
> not simply for this one corner case.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b26840e46c..850817edfd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -837,7 +837,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>          }
>          widened =3D 2;
>      }
> -    sum =3D mmuidx_sum(mmu_idx) || is_debug;
> +    sum =3D mmuidx_sum(mmu_idx);
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels =3D 2; ptidxbits =3D 10; ptesize =3D 4; break;
> --
> 2.34.1
>
>

