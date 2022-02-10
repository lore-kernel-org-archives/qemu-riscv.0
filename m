Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHzs0-00023Z-Gl
	for mharc-qemu-riscv@gnu.org; Wed, 09 Feb 2022 22:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHzry-00022x-K3; Wed, 09 Feb 2022 22:11:42 -0500
Received: from [2607:f8b0:4864:20::d33] (port=39546
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHzr8-0000GV-QP; Wed, 09 Feb 2022 22:10:52 -0500
Received: by mail-io1-xd33.google.com with SMTP id c188so5718063iof.6;
 Wed, 09 Feb 2022 19:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Hi/Hg8MZVewyscOvnt7jDWUCFlPbP4AQTFDFfTqW94=;
 b=oIcuxP5Q8cI3fExZ7DfbWUchIOUyjMdfvpBoYWJP7soW/Z8EaiwW1JXu4yCltCC3Qa
 5MlZjXzNGucASNluOdX4nBDs1LJmHuq+/8xlH7A2q38W8+EJfQze3oRv/6KNZ6JI7Kq1
 C7dZ/zzTO7VIP1UsR30czhr1neIzt4JU3uEb7a7kB4NTLa60m8uvjltka6tBdK7UzXMR
 KntELmy/3LDaX+7eSSvnRLkHMZTIiEJWSmuKiVVsiyWRybPHiCJ7j9KyObNWnnmihA/r
 Hhr90YoxnueO4CVDgtHFEnpuAqNirYrpMx/HospUAQ6PPNFy1gayZVurVM6fapq0hcjI
 /JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Hi/Hg8MZVewyscOvnt7jDWUCFlPbP4AQTFDFfTqW94=;
 b=aU0HPdG5Ri5WChNBubLnF90tgMbp1lxaTLiAvFm0XM+Q8KwtyCMsA0Xblvp9Z6cLNf
 t5wchKxoVchDl2zp4pkXBmprdeXHzkk1ht0MGOD0Pl7n6+GGFdP/+n7ipViTVbJ5Cn/G
 4gyyjN1O5yyLGkhViy781wOliSUeYTA/jO1lAdRhiD1KLoWmqjw2uxvHnOqXuyHDkNFK
 EunSgc+qq5zeBcsCTTGfW8tzyxIf22nz1DJEX+Msr07dLWGY9dIWMq8krpcl02Fwt/s3
 73yGe8ybHA3tJJhXaflvqGXpCB7rOPtRTqH4b9U0GX3nea9bvY8ubVZiVSQjcAjpHAbG
 2RrA==
X-Gm-Message-State: AOAM532Cf8KOg3EKtr/ujmm2JtYetDRbQifJRBiOLi7VCjFinZG/h/KX
 xZSLYRFl5XZkTqJHgqXAHHEdJqSDRWJ0FtD8UFc=
X-Google-Smtp-Source: ABdhPJzxZ5ZGlfes2EA/RkV78yYYjFzsYEF4mpVRgoPgs+5BlcQ3vPdJ4Pka8TqAOdlG2zuLwvL6T5NvMmQUcpcV4ng=
X-Received: by 2002:a05:6638:2609:: with SMTP id
 m9mr1394630jat.169.1644462632256; 
 Wed, 09 Feb 2022 19:10:32 -0800 (PST)
MIME-Version: 1.0
References: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
In-Reply-To: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Feb 2022 13:10:05 +1000
Message-ID: <CAKmqyKP8sQpr64qUpTgUa-JaSRCHJf5AgYntb0+6v1_C64Vjvg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: riscv: Update description of CPU
To: Yu Li <liyu.yukiteru@bytedance.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 10 Feb 2022 03:11:43 -0000

On Wed, Feb 9, 2022 at 1:49 AM Yu Li <liyu.yukiteru@bytedance.com> wrote:
>
> Since the hypervisor extension been non experimental and enabled for
> default CPU, the previous command is no longer available and the
> option `x-h=true` or `h=true` is also no longer required.
>
> Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>   docs/system/riscv/virt.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index fa016584bf..08ce3c4177 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
>   * 1 generic PCIe host bridge
>   * The fw_cfg device that allows a guest to obtain data from QEMU
>
> -Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
> -can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
> -enables the hypervisor extension for RV64.
> +The hypervisor extension has been enabled for the default CPU, so virtual
> +machines with hypervisor extension can simply be used without explicitly
> +declaring.
>
>   Hardware configuration information
>   ----------------------------------
> --
> 2.20.1
>

