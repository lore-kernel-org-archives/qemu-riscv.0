Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6Qp-00081H-B0
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6Qn-0007yv-N2; Mon, 23 Jan 2023 18:40:53 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6Qk-0006Yp-8e; Mon, 23 Jan 2023 18:40:52 -0500
Received: by mail-vs1-xe31.google.com with SMTP id 3so14782332vsq.7;
 Mon, 23 Jan 2023 15:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrFU+/OI+aEuW4W7C8WpwgZ0Ws3ulVSH/LvVMTN7BHk=;
 b=gu18tjrFHZJQ9CQeWMi+eLoBpjSP+E+EntRSt0u6GVVoLScqSTnHrmacd7IP1Xesmx
 Ah5FxYFfCTriMwFBcOeCJoe0QlExtSzEdGkZ1TdV44+sx45H0eXYRjhSTtzY/w0rZXHJ
 5s/cp0PkuplgE0IVloGoVT0khYm8jrsAOqdolECyOFohxyqc9zRFl6lI+tD4ZCo7y57e
 TfHn3/HpgcCwmfZZ3pjbb0DDS0iSQnoZ7d+olMEG7/4i0iIFEti9SKnsgicH/irHV5yN
 u8nzLKC8YXaDnwZrskWSVtjPXPQxpY+cMdVZz/pEYPG91rqwmYpbUtOeBaAbsZ15OvPp
 JHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrFU+/OI+aEuW4W7C8WpwgZ0Ws3ulVSH/LvVMTN7BHk=;
 b=2zXa8mYq00FL1Vr9amQw9uWyVzZ8rluftNMrgkrBBoRuYxXg5rhmaNuBj/BbiDZpa+
 6rCKrAAVsNXfCVaQIhQbA//QgPaKFDhnZ8xMDSPD0u2zvXUPWEbFtZM8uqYzUV2S0zG+
 Gpznd9CfS5WSCmAIrlGqzI9HIgsRKGLnNNSPeYGHILWp92/8EptrD4gR3AvRXDu7hRhL
 TwX7r6gwTzHEjoHb80k4xEt6so21z7PLhkv3R9JNJiuWiP3Ke7HvO5kmYqlFze7UhfT9
 lSZX4gMZkaMijxFuFse70dskFyXQ1Ocmlx0EE/vLJjxHwDq+1giEJjr3+HAbBDIA9LYF
 uf+A==
X-Gm-Message-State: AFqh2koX6jFSlcVFhKDqzu5LBGAZDA9L9AMASB7uGm1N4HcXk5+3q7hu
 a0iSw4zz5bHV/8/MxP3nPFKrFgbIZUH72trMc0M=
X-Google-Smtp-Source: AMrXdXsTTnBfYd0Lorcr0FHqDhuoZEdeM030tmDP3nLkiAuPfzKORgmaio9+cy488ktbj6dLH04uH5IUL6UD19Ol0Vc=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr3500977vsl.10.1674517248007; Mon, 23
 Jan 2023 15:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-16-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-16-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:40:22 +1000
Message-ID: <CAKmqyKNCisHs+MQbuwqsQAp=ouRuvnTkkaT+oRexu2JgdZy+Ng@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] target/riscv: add a MAINTAINERS entry for
 XThead* extension support
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 23 Jan 2023 23:40:54 -0000

On Sat, Dec 24, 2022 at 4:09 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> The XThead* extensions are maintained by T-Head and VRULL.
> Adding a point of contact from both companies.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b270eb8e5b..38f3ab3772 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -294,6 +294,14 @@ F: include/hw/riscv/
>  F: linux-user/host/riscv32/
>  F: linux-user/host/riscv64/
>
> +RISC-V XThead* extensions
> +M: Christoph Muellner <christoph.muellner@vrull.eu>
> +M: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: target/riscv/insn_trans/trans_xthead.c.inc
> +F: target/riscv/xthead*.decode
> +
>  RISC-V XVentanaCondOps extension
>  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
>  L: qemu-riscv@nongnu.org
> --
> 2.38.1
>
>

