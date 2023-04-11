Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5gJ-0002vX-BK
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5gG-0002ux-6w; Tue, 11 Apr 2023 00:32:32 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5gE-00045Y-Gz; Tue, 11 Apr 2023 00:32:31 -0400
Received: by mail-vs1-xe34.google.com with SMTP id x11so3215336vsq.2;
 Mon, 10 Apr 2023 21:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187549; x=1683779549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTsUBbwht7wpTeyHyR3d+/0Kwx/GsUcuqqsMnKLQHFA=;
 b=DuS9NiFPb2Wi+5nq+p391XlVwPSDJOgZSYHqUr1a5rDMj1ZZMazDt7qutFRftsVEIK
 T191fqnWUleR5zoxJp1SXIg3xNSrt0L+R1wghc41AtXa5nE+VCl/09ig86TArnsy+au9
 aW2Pfzf0l7NJts4mldhA8fuTmzZ6vhnzxA6v6Rvhf8ghAf2quzcpTJASzQHBL2ErnA/2
 kCRPs1ln3EW+X5CDCtcuVdlgfAfgITWWfIe8dnZJl6DVUwn0z+kqyxOed2HynAozPsuJ
 4AqYwxGXKRB7K90e03mww7pnCGnniKfik969VFOZQmEGngL1kNFSccKgExcU3ORVoxZD
 59yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187549; x=1683779549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTsUBbwht7wpTeyHyR3d+/0Kwx/GsUcuqqsMnKLQHFA=;
 b=QBRnT8DqQ8lIl6wx8ywtxBoE4MvPADqV9SweUx/nPNTldA2wyykA347gvUPC9gwvLO
 +q2PHZA2mAIAXHBOi70OWNRQEyzSoCKtoeNmwsATtB5HNSu9JkkOO8idVb9grfqHqs8D
 2NGWIxqr8ofg2xta6lf3FATSOPdnOqauiA855zkUldkeTmvTKiOXjtW1FQWqPgC/aGWp
 OdJX8+Xmbvbn+bcMxja7RLsvXL5iFw3jcnwoNEE3Ms9aG1YKVabe4qNi3OKnc+PxtO2n
 5YuCBQNyC64jCfK92puACdvd06laufgxCoZ6dV0GBmX9bBAi7E/76pYQu825K7i3tpCB
 lnNg==
X-Gm-Message-State: AAQBX9eoBW3OU4f4QyyS+vAZVCvOCYXIyHNBHPusk8p6XWdf0Saa4W8m
 rA37YH4/fA5PsfCcUA6oYDJVLzZ4YAcF+L2czeU=
X-Google-Smtp-Source: AKy350b+pqOZbhUkqGBnLSnXJCffc6otux44oRy8MXo/AwkHQs2yi5wWGft9YqIdqfqkU1WMdE3FfoV6Q1jwYF2n8FU=
X-Received: by 2002:a67:c81c:0:b0:42c:33ab:97fd with SMTP id
 u28-20020a67c81c000000b0042c33ab97fdmr6342613vsk.3.1681187548871; Mon, 10 Apr
 2023 21:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-24-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-24-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:32:02 +1000
Message-ID: <CAKmqyKPX1xEafnf32W+L3qT2gXxhEHT+=HCNhtXgRtwH4cMp+A@mail.gmail.com>
Subject: Re: [PATCH v6 23/25] target/riscv: Merge checks for reserved pte flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 04:32:33 -0000

On Sat, Mar 25, 2023 at 10:35=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 850817edfd..82a7c5f9dd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -976,14 +976,14 @@ restart:
>          /* Reserved without Svpbmt. */
>          return TRANSLATE_FAIL;
>      }
> -    if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D PTE_W) {
> -        /* Reserved leaf PTE flags: PTE_W */
> -        return TRANSLATE_FAIL;
> -    }
> -    if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D (PTE_W | PTE_X)) {
> -        /* Reserved leaf PTE flags: PTE_W + PTE_X */
> +
> +    /* Check for reserved combinations of RWX flags. */
> +    switch (pte & (PTE_R | PTE_W | PTE_X)) {
> +    case PTE_W:
> +    case PTE_W | PTE_X:
>          return TRANSLATE_FAIL;
>      }
> +
>      if ((pte & PTE_U) &&
>          ((mode !=3D PRV_U) && (!sum || access_type =3D=3D MMU_INST_FETCH=
))) {
>          /*
> --
> 2.34.1
>
>

