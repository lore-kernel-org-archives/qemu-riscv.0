Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRJ9Q-00046G-Aw
	for mharc-qemu-riscv@gnu.org; Tue, 30 Mar 2021 14:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRJ9O-00045i-Fc; Tue, 30 Mar 2021 14:31:38 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRJ9M-0001HY-7c; Tue, 30 Mar 2021 14:31:38 -0400
Received: by mail-io1-xd33.google.com with SMTP id k8so17431367iop.12;
 Tue, 30 Mar 2021 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P5lvodlfjOEMsb+7eRByD3mHHLNIcnXzYOny6e9pEeU=;
 b=W+zm+DpXf5FdIPGXXtNBfLxkJKBS7zKSe1il8HRYbP7hfbANj/MxEYDwSVoZa8kA5K
 SpXSfwsEqhq5ySKZOs3NmvlrwMBZXRPnnz9H4NGos//TZdpaV/EmVxY/fAXU8qPtJ2zQ
 vCR3SrU5zxmR/IXZ3hDvYe7Tu7rbMU6l1/RwDMeAauzkRwlTbICHQIL0j+wHwKmGJ5eN
 b0U1kjbfcbHyB+PjJFtC3jC9dVHvmjqkUcrc1P5lNqM9n8NDkkmkmV3SRhHA9RFmkND5
 RKH9zo9hGx5jp9AwREWghVNcfu7NwKQvCeH2Vn7burxxf4VPiGXT+DzrrJ2MaxRpg0Om
 9yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P5lvodlfjOEMsb+7eRByD3mHHLNIcnXzYOny6e9pEeU=;
 b=pmUR64pyg36Bt0d8jZoXPo0of1vSCB2SogIYLee3byYyZomqao7Pv4G5WEIuRT/wI/
 j2RarVP8OsanQcaPJb0U8q/0kLNXZ1SDK7BVXDptywPJo4rNoqFjl4fFUdh7uqMiMnlE
 rztxDlopH1XpZkWAzA8D33uavAcO1Qs1ztLGEFTE+eYMXZGXfuUYgLBJU3mblAieKE0F
 l0TW2L0GaDwkDiM/d4lLSwx6Ja/p1u7x4sQGSTYDkKHgqnEmos2EbsKh6vODZdebpj5x
 14TMghclWJKH33Ye7+f9r2KZgmMcDPOk1ERPJ/An4fst2NFmzMTyGU07dqI+3U4cToGO
 u2Zg==
X-Gm-Message-State: AOAM5305CR/nIfRMft5Z5Ypaee0xeGMvzMpGcV2P61rcee9zT30Pqp9A
 549GU/5SV0S3joEKVjVD7mpc11E7dm2iXdJaTcM=
X-Google-Smtp-Source: ABdhPJwVqdnmXjt0suFA6C/s6R/kvKCcfMx+iLCvrrMz/cKw7+eiRwrQQjs8VTTbaIyQTxnKzrv5+9YrmCS+ubSaz9Y=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr25656477iom.118.1617129094717; 
 Tue, 30 Mar 2021 11:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210329033844.11878-1-dylan@andestech.com>
In-Reply-To: <20210329033844.11878-1-dylan@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Mar 2021 14:29:26 -0400
Message-ID: <CAKmqyKMokXk78ChtvL7oJmtwAj0EQ6kHRWhaYePDOhmX6+3KwA@mail.gmail.com>
Subject: Re: [PATCH V4] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>, x5710999x@gmail.com, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 30 Mar 2021 18:31:38 -0000

On Sun, Mar 28, 2021 at 11:39 PM Dylan Jhong <dylan@andestech.com> wrote:
>
> Use target_ulong to instead of uint64_t on reset vector address
> to adapt on both 32/64 machine.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 5 +++--
>  target/riscv/cpu.h | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b..268945d8a9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
>      env->features |= (1ULL << feature);
>  }
>
> -static void set_resetvec(CPURISCVState *env, int resetvec)
> +static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
>      env->resetvec = resetvec;
> @@ -554,7 +554,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> -    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +    DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec,
> +        DEFAULT_RSTVEC, qdev_prop_uint64, target_ulong),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..d9d7891666 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -303,7 +303,7 @@ struct RISCVCPU {
>          uint16_t elen;
>          bool mmu;
>          bool pmp;
> -        uint64_t resetvec;
> +        target_ulong resetvec;
>      } cfg;
>  };
>
> --
> 2.17.1
>
>

