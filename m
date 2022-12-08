Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p38Me-0007mW-20
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 23:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p38Mb-0007mD-Ti; Wed, 07 Dec 2022 23:18:25 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p38Ma-0007nA-C9; Wed, 07 Dec 2022 23:18:25 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id t5so407631vsh.8;
 Wed, 07 Dec 2022 20:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RlMf9rGuHZ16LLvx2ikQSiMbHWxcqc5L7k0LK8zBdiM=;
 b=eTNkxdkgODfZ5/QUkvYGV9L2KCirjP8/A1mrGU5hp9jyvEkY5DsFJC2ybPJhuX1Lbx
 2RJ0z0u2c9pBrF4TMXpIY5i8InIzTV6z+AifpsAyucf1/CxfO71bROBSErFPiV0XUMBt
 m+SARn3uu0h2J4v5VgGntBZsFmYETWWM3wKcudSxbbY1bRsxFnv0Hs0RSXA0gDt3T8Me
 IUbqsIoZQLJsA9Jg39HS6QM3RQ237v64ft3kyOukrIm+c6dhjnwbqJzpNL8dkzYA5gDJ
 dlpj7z1mQMxHJeIeqyJZJDoYSLHg29CHpgN6+sm1IfOaaj+atyGX1MtxPb1lwGYqmX7I
 GBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RlMf9rGuHZ16LLvx2ikQSiMbHWxcqc5L7k0LK8zBdiM=;
 b=NmPOcNJvnVcGEcsG84OwUBh8FyQH3HYxopzwCxiNbB9KKrYdaeTmrxWczIFK0oIgwx
 KZCOPqgENQ4+rXGfgccf2WHWJOfmVBjQ2dglu1ac7p8bQ8rpHnCWNdMsoqB42Lis86D8
 0uMr5Moztb3TQ9ECfKoxWF9lZWBKNu4KHb0YxDAJ1louu8QZkCtuyItdZSPgBJk09Qv7
 3ZnYZD5fr6BZhNd5+DSfPhoTjUGHEAejSnYGC3oqIHiy4W5z5HjxSE0X+EJdWiS0YsvW
 lKvY0HgsAlXz7kk6tamssOlPAnCZJhdr0kS696kFvGL1ybxADTRcNxzU9NpgtqSdDL9D
 s9Uw==
X-Gm-Message-State: ANoB5pksdYexQZK6bs57+ftgJ84cc1+LwTHMJ672NSCPcMbtr/pHTLBB
 pXu9kZEEvAbT8o/iGojWhFCaTfCSHrhK2zv6rXY7mBNk+Ac=
X-Google-Smtp-Source: AA0mqf51FmfSRh6YL7JXlC8iCyI927KJKGhJDTaAmFbSWS0znmXJWGIZuAKx0+wGtQSS9B2o4x7LhNwe/rFnW4tZXqc=
X-Received: by 2002:a67:d009:0:b0:3b1:4aad:9c47 with SMTP id
 r9-20020a67d009000000b003b14aad9c47mr6967677vsi.73.1670473102989; Wed, 07 Dec
 2022 20:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20221207090037.281452-1-bmeng@tinylab.org>
 <20221207090037.281452-2-bmeng@tinylab.org>
In-Reply-To: <20221207090037.281452-2-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Dec 2022 14:17:56 +1000
Message-ID: <CAKmqyKMeNgcWWGCag9D7TNjmEm_QBfcL04wadP-BjreiscK1ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Clear mstatus.MPRV when leaving M-mode
 for priv spec 1.12+
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 04:18:26 -0000

On Wed, Dec 7, 2022 at 7:11 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Since priv spec v1.12, MRET and SRET now clear mstatus.MPRV when
> leaving M-mode.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  target/riscv/op_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index a047d38152..878bcb03b8 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -154,6 +154,9 @@ target_ulong helper_sret(CPURISCVState *env)
>                          get_field(mstatus, MSTATUS_SPIE));
>      mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> +    if (env->priv_ver >= PRIV_VERSION_1_12_0) {
> +        mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
> +    }
>      env->mstatus = mstatus;
>
>      if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
> @@ -203,6 +206,9 @@ target_ulong helper_mret(CPURISCVState *env)
>      mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
>      mstatus = set_field(mstatus, MSTATUS_MPV, 0);
> +    if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
> +        mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
> +    }
>      env->mstatus = mstatus;
>      riscv_cpu_set_mode(env, prev_priv);
>
> --
> 2.34.1
>
>

