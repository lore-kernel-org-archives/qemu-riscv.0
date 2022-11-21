Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1owv8n-0006y1-Rh
	for mharc-qemu-riscv@gnu.org; Sun, 20 Nov 2022 19:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owv8l-0006xi-5t; Sun, 20 Nov 2022 19:58:27 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owv8T-00038T-Cb; Sun, 20 Nov 2022 19:58:25 -0500
Received: by mail-ua1-x92c.google.com with SMTP id s16so973676uaq.12;
 Sun, 20 Nov 2022 16:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cljo0DK9nJn3h4zsdwNHSrSRcJv9iJ65L3L9BoON1Ts=;
 b=CLax/u4cNNL7/SJhShtQ0erTXgfZHSXCUW7vb7iQCmKEK9jFrD9ZJa/HDsXtGv813n
 7Xtk6LYlsWBEkOcjMB9QV496i4Nit+BWWhCaBAHCo3zS095nSPuSTeQ8u1PVqd9gS6rQ
 uPCh0SynhPuEnoULCRnd32CnJHMNCAjreZrbQB2y+wETSKjSIoGZ8HMuINQIkyyJ1Sxb
 4AWDvExA+38D4J3hLu64P0JaDSXwNgF4PqekLruATV8M11xO6v/iPE2H6yAdpeu7dKWe
 hF3D+b8US8//zYURXPc/G+CpmjjU7X+5E2jlQCXM1hFuz2UBZuhDkk3D1ESi08mWRlUh
 Rr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cljo0DK9nJn3h4zsdwNHSrSRcJv9iJ65L3L9BoON1Ts=;
 b=cQ7Dt69bOMpL3HfbdsCsz4NACsUqjY69XOp+E1xoRjQidIH4cbPSf28X7MSViyvhUR
 UIB8RKmMpHq9TT5QcIogcmqcQIoR1m/AafP0HgxnYiUkkq+M+bKjnpY258XlYOtJ1MY+
 TH29WlP1sQHWp+7I0QBeFAIEakbUSyuVIj9mXxiq7RYJClCl8awoaiUy/Zsk0CTGamL0
 mZbmYTkSMQTAQ92eTWEewHWg8mrQhFGYVpAzRCQCFcvcao1CPXWrrDr8drSanI+aHNcT
 D9WwIC4xevTG6bvtg0buDsZvA1H7REEusPKXNLWTKNaKjvTc8GOERK97CC+S3geVUQSO
 zLwA==
X-Gm-Message-State: ANoB5plSdragxud2i7J6zNCMYlGf3wRCFaeiExoe5/PIgNn/X4Zyodld
 VUGnQXWSdrnJI35k35PPnqBq6wrP+yX8nOo5TZI=
X-Google-Smtp-Source: AA0mqf5KxvUBONGSvXtcYz9TRYzxyXcFbc1xTSkKnxGlBrFnJHOQsn7Sf8YCdJIm0UuUB5L3mFn62sVQuRA6VmRcfZk=
X-Received: by 2002:a9f:3605:0:b0:3e5:cdde:61d7 with SMTP id
 r5-20020a9f3605000000b003e5cdde61d7mr8327120uad.23.1668992287923; Sun, 20 Nov
 2022 16:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 10:57:41 +1000
Message-ID: <CAKmqyKODj=z0nQ2YafQMzZUrj91kwGLM-v+FYiqD2QdkDnZuRA@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] target/riscv: add cfg properties for Zc* extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
X-List-Received-Date: Mon, 21 Nov 2022 00:58:27 -0000

On Fri, Nov 18, 2022 at 10:45 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension
> Add check for these properties
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  6 ++++++
>  2 files changed, 49 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 042fd541b4..1ab04ab246 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -805,6 +805,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>          }
>
> +        if (cpu->cfg.ext_c) {
> +            cpu->cfg.ext_zca = true;
> +            if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
> +                cpu->cfg.ext_zcf = true;
> +            }
> +            if (cpu->cfg.ext_d) {
> +                cpu->cfg.ext_zcd = true;
> +            }
> +        }
> +
> +        if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
> +            error_setg(errp, "Zcf extension is only relevant to RV32");
> +            return;
> +        }
> +
> +        if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
> +            error_setg(errp, "Zcf extension requires F extension");
> +            return;
> +        }
> +
> +        if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
> +            error_setg(errp, "Zcd extensionrequires D extension");
> +            return;
> +        }
> +
> +        if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
> +             cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
> +            error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
> +                             "extension");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
> +            error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
> +                             "Zcd extension");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "Zcmt extension requires Zicsr extension");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_zk) {
>              cpu->cfg.ext_zkn = true;
>              cpu->cfg.ext_zkr = true;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9bd539d77a..6e915b6937 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -434,6 +434,12 @@ struct RISCVCPUConfig {
>      bool ext_zbkc;
>      bool ext_zbkx;
>      bool ext_zbs;
> +    bool ext_zca;
> +    bool ext_zcb;
> +    bool ext_zcd;
> +    bool ext_zcf;
> +    bool ext_zcmp;
> +    bool ext_zcmt;
>      bool ext_zk;
>      bool ext_zkn;
>      bool ext_zknd;
> --
> 2.25.1
>
>

