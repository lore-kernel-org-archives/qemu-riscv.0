Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMeH-0004dB-UP
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMe2-0004Y5-E1; Tue, 10 May 2022 05:59:11 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMe0-0005wG-FS; Tue, 10 May 2022 05:59:06 -0400
Received: by mail-io1-xd33.google.com with SMTP id o190so17971827iof.10;
 Tue, 10 May 2022 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjBwT8VXXzRvpJvLuntdlZ95BHsv2r4WD7cf6lAzP2g=;
 b=VC1QJm4/pKzHs9kyWyJdAT2hb1BgMVMQWQfsHPeIXumz/YbAeIndQz8SXJRhHU/EMz
 ptM9N38jn+t+C1dTEEO8L3LBUBWaIuxWZ3jkYdcT2XGSMXtGY4OqcHq7SSqqM24R3J7H
 ZlIBup3aPHwqtZlKxiVU/HsGD7Dcp1J2fFhaMrcFaCgcY8uEDznPEEZrh2409/gV8iKC
 XVbBfK3fqygXED5SUJU8O7Mm68nfGsXkSNQ3cKBK+J5hdDm5w0296zbbRqsz/iRwKKBK
 b2Qk5wTVbPZeybROxXCM48hdnWPs5wh/2PRR+hecOag3wQpTlmEWreshwMiTunTs8ylr
 D69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjBwT8VXXzRvpJvLuntdlZ95BHsv2r4WD7cf6lAzP2g=;
 b=Xd5PpwoDctDD1HcFEJIa4soC3R+kZR1m/BDHZ3jXrR8OlWhMlIC0d6H+rP08biS7d4
 s225slbdVN8qiLfNq0ByIQXLnS7shXWORRG1obTNn80y/9365WBWF1big0g6/TMi7jB1
 76AZBiYcvB390+O81TMMUJa+YYHFiNFdO82wv8Jp66HWZsEXLVxD5CjOg7BTG7XXB9sq
 yV4B9lJMegtagy+6anXVhJh/fjtEUx+8wVKC12Fso2PE+Oi0U+SN33OdMmMvr4QtZxxr
 GxwdofgqSehjSq0eUPC+phsWk7vqN+IrIGug7gV+tdCCqdnX71kLeaFqKjygnzVE7fwV
 i7DA==
X-Gm-Message-State: AOAM531tetPBzQROGltfSGxMr0qwoY6Q8RIDWt4A+KCFe8AamlDhmHAe
 /FjgU8QD9LpCQzygDfvCgsG0R6oZo9oWIxpuuDk=
X-Google-Smtp-Source: ABdhPJxVuKkCiz/TiAtbWw6q5Wj+EDnHRCqrVTqZx0D5Hq5O8WcImuqHHZ7inLHxw3eGGUcUzjebQn6IquGnxFq0DMg=
X-Received: by 2002:a05:6638:190a:b0:32b:95b7:4e64 with SMTP id
 p10-20020a056638190a00b0032b95b74e64mr9163482jal.212.1652176742966; Tue, 10
 May 2022 02:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-12@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-12@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 11:58:36 +0200
Message-ID: <CAKmqyKPJq4TSJtFGb2uHP5pmPY5BPWZkxLncFwU1FG8LZGJWpw@mail.gmail.com>
Subject: Re: [PATCH qemu v14 12/15] target/riscv: rvv: Add tail agnostic for
 vector reduction instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 10 May 2022 09:59:13 -0000

On Tue, May 3, 2022 at 9:30 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f67ec1f249..a319cda969 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4537,6 +4537,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>  {                                                         \
>      uint32_t vm = vext_vm(desc);                          \
>      uint32_t vl = env->vl;                                \
> +    uint32_t esz = sizeof(TD);                            \
> +    uint32_t vlenb = simd_maxsz(desc);                    \
> +    uint32_t vta = vext_vta(desc);                        \
>      uint32_t i;                                           \
>      TD s1 =  *((TD *)vs1 + HD(0));                        \
>                                                            \
> @@ -4549,6 +4552,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>      }                                                     \
>      *((TD *)vd + HD(0)) = s1;                             \
>      env->vstart = 0;                                      \
> +    /* set tail elements to 1s */                         \
> +    vext_set_elems_1s(vd, vta, esz, vlenb);               \
>  }
>
>  /* vd[0] = sum(vs1[0], vs2[*]) */
> @@ -4618,6 +4623,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
>  {                                                          \
>      uint32_t vm = vext_vm(desc);                           \
>      uint32_t vl = env->vl;                                 \
> +    uint32_t esz = sizeof(TD);                             \
> +    uint32_t vlenb = simd_maxsz(desc);                     \
> +    uint32_t vta = vext_vta(desc);                         \
>      uint32_t i;                                            \
>      TD s1 =  *((TD *)vs1 + HD(0));                         \
>                                                             \
> @@ -4630,6 +4638,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
>      }                                                      \
>      *((TD *)vd + HD(0)) = s1;                              \
>      env->vstart = 0;                                       \
> +    /* set tail elements to 1s */                          \
> +    vext_set_elems_1s(vd, vta, esz, vlenb);                \
>  }
>
>  /* Unordered sum */
> @@ -4654,6 +4664,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
>  {
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
> +    uint32_t esz = sizeof(uint32_t);
> +    uint32_t vlenb = simd_maxsz(desc);
> +    uint32_t vta = vext_vta(desc);
>      uint32_t i;
>      uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
>
> @@ -4667,6 +4680,8 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
>      }
>      *((uint32_t *)vd + H4(0)) = s1;
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, esz, vlenb);
>  }
>
>  void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
> @@ -4674,6 +4689,9 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
>  {
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
> +    uint32_t esz = sizeof(uint64_t);
> +    uint32_t vlenb = simd_maxsz(desc);
> +    uint32_t vta = vext_vta(desc);
>      uint32_t i;
>      uint64_t s1 =  *((uint64_t *)vs1);
>
> @@ -4687,6 +4705,8 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
>      }
>      *((uint64_t *)vd) = s1;
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, esz, vlenb);
>  }
>
>  /*
> --
> 2.34.2
>
>

