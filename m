Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAlzM-00079u-VX
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 01:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAlzJ-00079a-Cn; Mon, 11 Jul 2022 01:29:41 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAlzF-0003CI-Qj; Mon, 11 Jul 2022 01:29:40 -0400
Received: by mail-pg1-x536.google.com with SMTP id bf13so3811892pgb.11;
 Sun, 10 Jul 2022 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9H396+VUVaxNH7pJQTtc0cl6v9wma008IKJWE/uc/xw=;
 b=NARNUKRLiRXC3pcNjTqbv09uvG039ceAwmnWKFDQDkWpjTUkr+Y7VcsJCn90oBtH6U
 LNCoYPrOxrS4Fs8pF9pUTW840uMnHZ47Y8vg/e45nCl8C1ZMkbvsxA2EkMeLtGQivpeq
 po2p0x2BcI1p3cfjzbg0uYafqn72SXD0oTcTxepQLhaUlfFDxXq+buX03d5dj5nzHMNo
 Vi6pQybXchScQLq4uBEZaqCLzUEnxV4e8WPWOmzKK5aORlpRqGNNIWw2aI6xyZwSqoBz
 ClhMSHSZDCgGS882CrlU6D/zcPgXapiRGjVP/7bOlITfAhTIKm//ONsPuWM48knKWY1c
 7Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9H396+VUVaxNH7pJQTtc0cl6v9wma008IKJWE/uc/xw=;
 b=i2rA9WV/cmGjF9zcvlJBJOE+U7d0agVSbsbk7KGsbbG2iCpgM/RG2qO+WZDyeF1YYE
 rdrWvcFGzw+ATy+niQyigwqmc1/xSknB/GxNk+sbXSYfxAzYwIEhvoZHBNNYueOGvPxD
 mVPrEKMNHCnJZz4sR/TrBDYWfgoUE+HBxMmBy/U7jKnKmaI0UfpXrPAAgAHLMJmejo10
 X/O2B/6dzzxTa/0eEwwycg60IuB0606QsWRigj2zfeeu62R8mFBPPJzORnBZ6nLqHOLr
 DEXgV0K1FQuxtwymq/uAyL/H1tu8i2Vt/aGylPZT+E0M2gsVoHC274PT2NyEJEVOEIJU
 Ec/w==
X-Gm-Message-State: AJIora8lPKgdXxsm8PTjU2/wxb4WBrSTrKtkb8wKutSLz7j0+QrZvHYH
 WzoUfSn9bFYkkvOPpNPZNGklc1I8dlcczpsHrUo=
X-Google-Smtp-Source: AGRyM1vxTeBkTIRJbKKSfY/kiDMJ+zMlaW7NC1kp9iMtYeHmDZ5wdAGW6z6rGtaJWLA961hL1XBPnFFZV0VsKYvnChM=
X-Received: by 2002:a05:6a00:1303:b0:528:2ed8:7e86 with SMTP id
 j3-20020a056a00130300b005282ed87e86mr16559532pfu.4.1657517372866; Sun, 10 Jul
 2022 22:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710082400.29224-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 15:29:06 +1000
Message-ID: <CAKmqyKO6gss1cQ_pC0qr-Zx1vv3uJOodDyHyPD3V+ZdfCihHkw@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/riscv: add check for supported privilege modes
 conbinations
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Mon, 11 Jul 2022 05:29:42 -0000

On Sun, Jul 10, 2022 at 6:25 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - There are 3 suggested privilege modes conbinations listed in the spec:
> 1) M, 2) M, U 3) M, S, U
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1bb3973806..0dad6906bc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -636,6 +636,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> +        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
> +            error_setg(errp,
> +                       "Setting S extension without U extension is illegal");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>              error_setg(errp, "F extension requires Zicsr");
>              return;
> --
> 2.17.1
>
>

