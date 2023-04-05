Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvZV-0006oC-2S
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvZT-0006np-AY; Wed, 05 Apr 2023 01:20:35 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvZR-00063a-Bw; Wed, 05 Apr 2023 01:20:34 -0400
Received: by mail-ua1-x92a.google.com with SMTP id n17so24780596uaj.10;
 Tue, 04 Apr 2023 22:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbvXUpIKslFUkX6WsElfTfozFTsJEsZdtWpCAn2UCgA=;
 b=LWF4LmzEaUkKuuFI0EfH5a9Vo+Qa1I95Pp1Kecn7krKk/3bQSS0DWZz4YN29V2xSRz
 F44OMn/g/es7cn8dfR/9B1CIqUTli8jBzcY9850TyXKdu+ckQzM5zAcXGmAQW2pbkfYe
 3TNjUWlmYp99HRHpkLbmJd9ADc90RYgAgZUrcfXG01ZOxdCo4AAAaPKa2gG13L6FSkOk
 nFC2zJV9t56QmsRLwcv1k9/tGv2HzlUrOtDB+K9O5ZXJlAYueMEJ4IOtF1oUl8zL0ydE
 XP2zlwuY83tlvl+dQW20k5g1N6wtVdbWcmiBzogxYk1PaDSeAUMvF2CGmv1T5YmUk4AJ
 kj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbvXUpIKslFUkX6WsElfTfozFTsJEsZdtWpCAn2UCgA=;
 b=I2HREcAb41Z3XCAG2LG/IWti1gAKJ7U4P1LwtibyY9IwUDbXqAgmUaWtSHd8qgs6Sj
 ER1X8X3HW5/LYux1irViT71PiKdX4zdHxmjQ8peLKBOWxEpvMFssYvCV1DIam03/upNo
 JF57F1XX87kQ/2wFgQvpV6Cw1FUy98MtfDt6G09l9s2fShYj7BEmSJdxfgp3fLWHEYbc
 K4NzhQWFLw6Zj9MSl7V0888UjGcmQfUKCHFIVMJ/K0Cs3j5TfTXfgCvyQpWYVZoY1/FP
 b9WaFZ39tMNpuY0YJwq/GkQbqaFrooQE+2GHC97ZiHyIgJegCjCy2QY3nhhqWGiD56rB
 CVYQ==
X-Gm-Message-State: AAQBX9eowIIMuXVADVTL4/UpxfZVReGKB8Upye4Qco+/zamNRIMXeICk
 QRGiFWz9P/JWZwB9F0BodKNnM2WkO3XuKTh69Gg=
X-Google-Smtp-Source: AKy350bBX/lnsmHa1hIWQPIc+ij7suYiVkNg7nsWyJzS62U4dh+qc34MrxkNqKgXFiJjBCpvM9Ap4XH6kOXBwvisXBg=
X-Received: by 2002:a9f:305c:0:b0:68a:5c52:7f2b with SMTP id
 i28-20020a9f305c000000b0068a5c527f2bmr3307319uab.1.1680672031847; Tue, 04 Apr
 2023 22:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:20:05 +1000
Message-ID: <CAKmqyKPU_0+qfX9ybob4K9WjBiE9Ag2hU68W=YG+BvZ3-Robow@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] target/riscv: Remove check on RVH for
 riscv_cpu_set_virt_enabled
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:20:35 -0000

On Mon, Mar 27, 2023 at 6:12=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> In current implementation, riscv_cpu_set_virt_enabled is only called when
> RVH is enabled.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 62fd2c90f1..b286118a6b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -563,12 +563,9 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env)
>      return get_field(env->virt, VIRT_ONOFF);
>  }
>
> +/* This function can only be called to set virt when RVH is enabled */
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>  {
> -    if (!riscv_has_ext(env, RVH)) {
> -        return;
> -    }
> -
>      /* Flush the TLB on all virt mode changes. */
>      if (get_field(env->virt, VIRT_ONOFF) !=3D enable) {
>          tlb_flush(env_cpu(env));
> --
> 2.25.1
>
>

