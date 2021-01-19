Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1uz7-00084T-Bz
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 12:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uz5-00081y-Lu; Tue, 19 Jan 2021 12:40:03 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uz3-00014c-Rv; Tue, 19 Jan 2021 12:40:03 -0500
Received: by mail-io1-xd29.google.com with SMTP id d13so38008656ioy.4;
 Tue, 19 Jan 2021 09:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwfRk84adGXiRhGzAStt+44C95TAHAJOXxQTnlUHNgo=;
 b=WavgoIU8XSLuWv9GiN9eNMX1N2wmsuEUanPFbD77kSbSPZ4S0NGBCEGJP0QSQJAsj2
 az5c/v4LwBjntoZuS3EiTOHjbypBbW70Mf95D37FcpUp72stNjMpZ3F0yVFdTFk14uBa
 cdjN/TPT/uEtp69e3cm/fC8LmWo5O/Q++0jiwDZ1tFnVvuWeaQZB+WyQ1l+HfaxN25a7
 HwNYGC3aYkeLWQlxjHc51wEvwTQ9ZZUH96hjpHmReTRILge2cbvtc2J6rwPkb9ls8SQE
 MVaPrwaLZD6sjfLa4UkU2bgCQ3xk4lTp8Kt7fanSisgLJeF+8kVisSefb829xGCq/ET0
 RnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwfRk84adGXiRhGzAStt+44C95TAHAJOXxQTnlUHNgo=;
 b=UA+8+sDW1nGXN4j5EO4eZPA7mk/Fq8Gqts5tmr2vThH/3MCF+CWDVnfNBAtDwUkqec
 Vtzf6hjhojsj45RelyymLnVP7tFYWkBMzx1FRutWah4HSHHYQzGjABKwSB7J3oBIcBp/
 80NmflfwQ1A3nDNRcZxASfJZuIcRUy4xkKbR4kSFkGKxznJI8dpjFiRtD55i2DHDHJ78
 ejWwmo8vRndpiChD5jB8bclR8PUfomRcD3dugi2l2H01dZd0ja30aoR8qT20hqn8UYXw
 oz1QDlxclNy7uxChymRtS/xjdviVW2zy94OwPg2gOiWV5el8szlCW4BLqlONnS3dBrUr
 9DNQ==
X-Gm-Message-State: AOAM532wGAodnlmzj4NI+HbYFDEOGCP0Xgc1Eetmrea4O8AuAu9H5gIg
 edAD8hYr6v57vlJm0aCJUtaDp3l2yOmetZFeqnA=
X-Google-Smtp-Source: ABdhPJxJacEf3LSz/Iyl4/MmzEo81JIDEP/d/sjQX6Jg2QSY23XoxyUzlMpNp+MQ/fZ9AX/i7Cd5H0O91v00YLNkMh8=
X-Received: by 2002:a5e:850b:: with SMTP id i11mr3743605ioj.42.1611078000206; 
 Tue, 19 Jan 2021 09:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-10-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-10-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 09:39:33 -0800
Message-ID: <CAKmqyKPgo=Yk0kH=Ba7kzu5fGXJ+2c5VvOcXH5nqozZ97LXb-Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/72] target/riscv: rvv-1.0: add vlenb register
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Greentime Hu <greentime.hu@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2021 17:40:04 -0000

On Tue, Jan 12, 2021 at 1:40 AM <frank.chang@sifive.com> wrote:
>
> From: Greentime Hu <greentime.hu@sifive.com>
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 2538580a62a..fcc8fe5cdb4 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -63,6 +63,7 @@
>  #define CSR_VCSR            0x00f
>  #define CSR_VL              0xc20
>  #define CSR_VTYPE           0xc21
> +#define CSR_VLENB           0xc22
>
>  /* VCSR fields */
>  #define VCSR_VXSAT_SHIFT    0
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4ac1ed8cfa8..7a6554447af 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -272,6 +272,12 @@ static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>
> +static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env_archcpu(env)->cfg.vlen >> 3;
> +    return 0;
> +}
> +
>  static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->vl;
> @@ -1420,6 +1426,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
>      [CSR_VL] =                  { vs,   read_vl                             },
>      [CSR_VTYPE] =               { vs,   read_vtype                          },
> +    [CSR_VLENB] =               { vs,   read_vlenb                          },
>      /* User Timers and Counters */
>      [CSR_CYCLE] =               { ctr,  read_instret                        },
>      [CSR_INSTRET] =             { ctr,  read_instret                        },
> --
> 2.17.1
>
>

