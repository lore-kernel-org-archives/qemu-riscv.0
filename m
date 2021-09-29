Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVWBW-0003Xa-RM
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 05:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mVWBU-0003QP-4h; Wed, 29 Sep 2021 05:47:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mVWBS-0004Yp-Fy; Wed, 29 Sep 2021 05:47:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so4708501wmb.3; 
 Wed, 29 Sep 2021 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZI2Hu+ZftE7Whv6CnKpagIlJ+8EMYBZVdV52vtfoTQ=;
 b=Km5BuIfQm1rR+omMofQ1dNw8Pn4ui1AG0FqQs/q59ZKvWPdKaEOsvGbbr3zK6/mE0+
 dERNphRSuPFOtmh1YJp33iDbRYfXIgD7/fn9f5YXHOKpH65MOCtfh4g5CGi6MqwJbpUB
 6i0SBPglLxSZ2dpNY/rQmFgbbI0WDWFztYQrwVj2EJ2Fvp3TdmDnqH1GFjsD8b1riPN/
 tKzaRSFNLIxGHqxIhUwvuz/02uoB8UB10jKUIcjjNojyV+X/iqWFN4T/diP0tIRwuS2q
 BqOr3gQyDV1Oqsig4+X1rq/GkeYbRdKDq4afoAs0kaPrOhBIEyPXj7G6SUi0CKLyIkVs
 hZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZI2Hu+ZftE7Whv6CnKpagIlJ+8EMYBZVdV52vtfoTQ=;
 b=MWf4UHviAdhOFpsdmc+GZoDKHu/3Yr+SIQnxzEnk5pBwX9hAHprRqirYLnxjl0DZHB
 xt4LKjlG7+7wDrIVyjEBUHpXxUMRSbm/Ya8/llzoIIMDnUthonqFD2ItpvrW1jug76Zs
 yrX7vFqKi29pt3YZYGajdRJwl4K3RlzEAtunFUmywxArIPgOiIwf+gr2jBAfLxzvMUif
 LXznLnV5mgPYz6urssNXz5gn4JwHHd1DsaUeoQovHKfYM+3ST/uFj9EHIeJI0MFarJJw
 KbOaTz/Eoh7VEfIto60M8hCrZHx65odHn+9L+qqxaPRGyjA+T4hOKYyXndN3idiEAQl4
 nZZw==
X-Gm-Message-State: AOAM531qOGB0frNZPObiX11AVt/U3P87daFmN6mj/2PFnhguud2eq4Zm
 gGl4fVjw6XjVmYmhZg/AjljPM6T3cVAv1LYs+b1K/nz1rOM=
X-Google-Smtp-Source: ABdhPJx39kN+wbwkdjdtIA+n5e9FyxqTtBps/C1zY8EXAxetoPlFcLhcdsZqq6B75NsZbtLtr33Ab2mU0Y56zbkcu/0=
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr968098wmh.119.1632908844007; 
 Wed, 29 Sep 2021 02:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
In-Reply-To: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 29 Sep 2021 17:47:12 +0800
Message-ID: <CAEUhbmVq9Jy9AvkzPvTb-FSLnu5h7wK+RaKdJ7gfU0pjqt6tPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/riscv: shakti_c: Mark as not user creatable
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 29 Sep 2021 09:47:28 -0000

On Wed, Sep 29, 2021 at 7:30 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Mark the shakti_c machine as not user creatable.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/shakti_c.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 2f084d3c8d..e7cd3bdfb4 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -150,6 +150,12 @@ static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->realize = shakti_c_soc_state_realize;
> +    /* Reasons:

nits: the multi-line comment format should use:

/*
 *
 */

> +     *     - Creates CPUS in riscv_hart_realize(), and can create unintended
> +     *       CPUs
> +     *     - Uses serial_hds in realize function, thus can't be used twice
> +     */
> +    dc->user_creatable = false;
>  }
>
>  static void shakti_c_soc_instance_init(Object *obj)


Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

