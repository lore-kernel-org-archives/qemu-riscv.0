Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onAPF-0006ea-UK
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 23:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAPE-0006eL-Ry; Mon, 24 Oct 2022 23:15:08 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAPD-0005Vz-7M; Mon, 24 Oct 2022 23:15:08 -0400
Received: by mail-pl1-x634.google.com with SMTP id io19so5160921plb.8;
 Mon, 24 Oct 2022 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9wIZ78HQDMvz1jZS1CHa6ZYxTI/ZdHrNsmpcXQDgKHA=;
 b=Lo0pnKx6HPTVB5TDWseVwdEWKIZsOUV6MZsF4/t6k44kzl1NSC3RITOVYJ4mBI5ptv
 12VfpAvd7/UIB0y70RzUwmIOjUA3fmH8/cs7QtH8oAsZLmSeLI9wHlU0pB0186kAeHFw
 N6UzNAY0T8Q+gawjDd6y9pgl6f2c4EeD9dcuZa9manksmHzYWBDqjjhFsJ43LxmXDGoo
 9igB+sr1Awb54neVtfqR+OP6/fKPJH3/8YnFJQd2ANdeJbepW/PestQNC6vYoAURAdUN
 XOpi4rBjXfBVy3P521Id1AIeLuP92foTTFOVxZ1CwRUHTgeQnazgQ+av/YfTg6ORdrPt
 7RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wIZ78HQDMvz1jZS1CHa6ZYxTI/ZdHrNsmpcXQDgKHA=;
 b=4P6vU+Pd5NTP90o376nEGEkd6Obuf8XooGoIBNwYhfGUiGK5e8IN9b0MHOo7bjhGlz
 gNuE6QKA9Mb/BT+hwPbSTs/wF3p2TWBHZ3jBl2bs8sIAzmnvFGMmZxzls8OGGWPvV9MO
 s97yE7qPNWUEG0wAUD355rFZe7N0gojP+UT4R+/P6TyXxXv2pEJgtoVpBNHFzoxtkqwr
 C+IUqMCB29wUBr8vAA7dy8m1vsry6e1iPj7WANOuiLKvLvGCSPkNZ6fLytlcWxxCLciq
 2kHXipK8tnTmCGqpoRX0g2G7aMy8gCFtbJhj9sssjHH6paHM6QFxB7HcLd3ssVHX2BGg
 jzjg==
X-Gm-Message-State: ACrzQf2ACSDVdy7CiSQ1kp1FbXctQ8RLO35Gq3iirz5A8pwqblU+BnsK
 9/1MURxsfvlx/LdRKJgkBR5Ijt+xMAceTLKAhRQ=
X-Google-Smtp-Source: AMsMyM78/4a6w7nv4OE7MSLW8efah4QZ44+75dDqshxIHvNQ0sVJaZJLenD0hk9K1/gNZ4hYA9exxqdpSoY3ONdua7I=
X-Received: by 2002:a17:903:32cd:b0:185:5421:a5d6 with SMTP id
 i13-20020a17090332cd00b001855421a5d6mr36815644plr.99.1666667704396; Mon, 24
 Oct 2022 20:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
 <20220930012345.5248-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20220930012345.5248-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 13:14:37 +1000
Message-ID: <CAKmqyKNWTyzS9Zb4ipS6fscf_W2E3fFJPVnOLiPuU4RnpUZW5w@mail.gmail.com>
Subject: Re: [RFC 1/8] target/riscv: add cfg properties for Zc* extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 03:15:09 -0000

On Fri, Sep 30, 2022 at 11:28 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension
> Add check for these properties
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 24 ++++++++++++++++++++++++
>  target/riscv/cpu.h |  6 ++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b29c88b9f0..7da3de1725 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -782,6 +782,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>          }
>
> +        if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
> +            error_setg(errp, "Zcf is only relevant to RV32");
> +            return;
> +        }
> +
> +        if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
> +             cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
> +            error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt require Zca extension");
> +            return;
> +        }
> +
> +        if ((((env->misa_ext & RVD) && (env->misa_ext & RVC)) ||
> +             cpu->cfg.ext_zcd) && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
> +            error_setg(errp,
> +                       "Zcmp/Zcmt are incompatible with Zcd, which is "
> +                       "included when C and D extensions are both present");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "Zcmt extension requires Zicsr");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_zk) {
>              cpu->cfg.ext_zkn = true;
>              cpu->cfg.ext_zkr = true;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b131fa8c8e..db3eca1d8a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -428,6 +428,12 @@ struct RISCVCPUConfig {
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

