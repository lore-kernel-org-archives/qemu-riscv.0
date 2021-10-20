Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKxc-0002W4-Of
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKxa-0002Vh-Mq; Wed, 20 Oct 2021 19:25:26 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKxY-0004bQ-1s; Wed, 20 Oct 2021 19:25:25 -0400
Received: by mail-io1-xd2c.google.com with SMTP id s17so26646067ioa.13;
 Wed, 20 Oct 2021 16:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VF6qywzIaa9dZxoMAJ+jNDITWBxcCQIgUWRYh2CNTqw=;
 b=eA/OQcUx+guZwrDnBcj/2HzVi3EsYuBCNSvhgrZS9G5lb3ZsXNFssGbe4ADY8PipY7
 sPeBWvNr++cpxta7T7IzmqArPX6NNYJ1JrfWkGlF9GYhRlbKNIyIy8tqqYcB2jDJ2HBi
 fc0Lp1CZe2NUCpi9ZIeRuTg4L0Mrg18UjU4OpLNcEByN5zkb5Vf5UORRoDWC2XVUa8aO
 TYOSLeFIXKMxp2BnrRyKjfjoAftFSNHYWLhkZ5ftWI2hFxvaU8NhVMm0HX+8ngEqJNuD
 asAtT61yujRvDF2TYSkSPzhNYULDAtSWiVGi5c3If9lQi8U2dlKpFNTjRBRua1K6OQi6
 7JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VF6qywzIaa9dZxoMAJ+jNDITWBxcCQIgUWRYh2CNTqw=;
 b=socY3fyZg4UykBM1pN6o9NrpQkY5TSBuCLG3B+XZewzeSWIQ40R2cQDHxlTfTyhUGf
 Yi/77fInyFd7PcAsok/p0eIgn7gaNV0//OjqoXXE5FucuJZhocZpjtel9A8cNO/eKNaL
 kExgBe1fUmnYuv0e1YpOUL8LAiJq0rZkq9czRJdeCCcKc37e7onKnS5yQBQbV8Qx6oO3
 ZrduinpqSJLRWY7y4gveAFIoR6U/HVK58eMLD5S3RCzklcJtdsdGzTrtMdE11E7DofaE
 Qn183AncBIvGd76qic275UnguzF7YcFcz7qGMRcygKQkCEMeSLbA7WuhqGN/qqvTYI2E
 6wgg==
X-Gm-Message-State: AOAM530J5/AAXEIFh+SiMK9CbUi5j9bfXPMSrxeGZJO/fP43zoYZApwE
 wiPsV0qma7iwCp4K4SFg9CkQ5jS4dlw1SkDAmJQ=
X-Google-Smtp-Source: ABdhPJwHyiTl3oTfl9qeMLYRBIcHumc/by2hial384bnLA3pS3TWHgyACOOQtZ+Ys/lq7+SvQ+SqVtbxo64iJ/PYSzY=
X-Received: by 2002:a05:6602:2bf7:: with SMTP id
 d23mr1457960ioy.187.1634772322075; 
 Wed, 20 Oct 2021 16:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211016085428.3001501-1-frank.chang@sifive.com>
 <20211016085428.3001501-3-frank.chang@sifive.com>
In-Reply-To: <20211016085428.3001501-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:24:55 +1000
Message-ID: <CAKmqyKNwyuqFNrJJCun4_1tAOW6Jyq2tfSFDabBoVg6TW7PMAg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/riscv: change the api for RVF/RVD fmin/fmax
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:25:27 -0000

On Sat, Oct 16, 2021 at 6:55 PM <frank.chang@sifive.com> wrote:
>
> From: Chih-Min Chao <chihmin.chao@sifive.com>
>
> The sNaN propagation behavior has been changed since
> cd20cee7 in https://github.com/riscv/riscv-isa-manual.

It would be a good idea to justify why we are using the priv spec for
the version check.

>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/fpu_helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 8700516a14c..d62f4709002 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float32_minnum(frs1, frs2, &env->fp_status) :
> +                    float32_minimum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
>      float32 frs1 = check_nanbox_s(rs1);
>      float32 frs2 = check_nanbox_s(rs2);
> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> +                    float32_maxnum(frs1, frs2, &env->fp_status) :
> +                    float32_maximum_number(frs1, frs2, &env->fp_status));
>  }
>
>  uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
> @@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>
>  uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_minnum(frs1, frs2, &env->fp_status);
> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> +            float64_minnum(frs1, frs2, &env->fp_status) :
> +            float64_minimum_number(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>  {
> -    return float64_maxnum(frs1, frs2, &env->fp_status);
> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> +            float64_maxnum(frs1, frs2, &env->fp_status) :
> +            float64_maximum_number(frs1, frs2, &env->fp_status);
>  }
>
>  uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
> --
> 2.25.1
>
>

