Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p39h2-0001lF-Bc
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 00:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p39h0-0001kj-6T; Thu, 08 Dec 2022 00:43:34 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p39gy-0002FW-MA; Thu, 08 Dec 2022 00:43:33 -0500
Received: by mail-vs1-xe31.google.com with SMTP id 128so512630vsz.12;
 Wed, 07 Dec 2022 21:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1zoId/LSkJyvk3mDzuouTOGpECZBDRpZm0kKm87iEBM=;
 b=aiihWZnsibJo7ypKwjCkqxE+xvl2NNRmwBz8aitKdxnlIQ3PxB8smmZr1xua0DF7fM
 HwOqRkTge0s5lQC/E6Hh+1JG+iqxhd+wH/BiYNQjVhgCX5h3wQ3nnJsD4xxfuScBP+uo
 eVdZ/3gFsc9AkTRh/evCYEQ3basPl6k/sNMvcKVdFLpRonIY3jyoQL1QCf0TEDBhsY+z
 2K5uZNXdguOY4xT8CPrnqlVE0lehXQ27L4EDzLPtOqIeAdxIeH15TU3Bd+DLHxl4Amp+
 OC03apHUSeIP8oG3WcALzfMS4sKEl380xuRL7H0k24iJ8PRe2y3M8S+EZ7Fe9vC4U7Xf
 jjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1zoId/LSkJyvk3mDzuouTOGpECZBDRpZm0kKm87iEBM=;
 b=xdTX3V2Rn5DHXt7Lo2bID1Xmb2r11tHZWksZaa1wwI3RvyzvNWjU7BQVKJf0uRVl/I
 w8IqRWUbvaHqDn6SUeg0FecJdS4mlNMTrWn6YRMjIZeX5WifoK/HbV2eEQoU0wAqthAW
 TqI1gwu9zbP9udEX5DMgs4mkgppMNFUbbM4NUFVRag8da3M3eUANbIVBfmwwGSTR04P0
 j3EK/RfBKlzYucZKmju9tGKcDrGVC9yMNEpPEmBJsZB0yp8eUcKerHkSS+5AoK55A3VO
 AApaS3K7Cg0IVBsB57+BwaB8deagxoHkYVnoy+UsREW/WDct+hQpbrItEby/j4rLZKj3
 9icQ==
X-Gm-Message-State: ANoB5pmb0k6kwRz+u9hB/HeM1yCHvulEEpXrwSEdvcHwvNo+3sBKyciD
 yM1Zdn6oOkTAbv8fg1GxlvnkDKimBFCH6DtjNj4=
X-Google-Smtp-Source: AA0mqf67JV+jJ3BXQHz9ugE8QWP4Os8drcjLN5D6xj6jcQj/t/FDk/vMLck3b/aTNUr2IYerxSGTutILFoJNyl+aOdo=
X-Received: by 2002:a67:d009:0:b0:3b1:4aad:9c47 with SMTP id
 r9-20020a67d009000000b003b14aad9c47mr7022382vsi.73.1670478211199; Wed, 07 Dec
 2022 21:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20221207090037.281452-1-bmeng@tinylab.org>
 <20221207090037.281452-2-bmeng@tinylab.org>
In-Reply-To: <20221207090037.281452-2-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Dec 2022 15:43:04 +1000
Message-ID: <CAKmqyKOE63U4qn=uCKSX6jwzWowE9=Uc1PUJSq9gUHRpev+=XA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Clear mstatus.MPRV when leaving M-mode
 for priv spec 1.12+
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 05:43:34 -0000

On Wed, Dec 7, 2022 at 7:11 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Since priv spec v1.12, MRET and SRET now clear mstatus.MPRV when
> leaving M-mode.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Applied to riscv-to-apply.next

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

