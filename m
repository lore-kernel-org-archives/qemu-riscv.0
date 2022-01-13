Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7rw0-0001oR-Eg
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 23:42:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7rvx-0001nt-9s
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 23:41:57 -0500
Received: from [2a00:1450:4864:20::32e] (port=38519
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7rvv-0007yy-Vh
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 23:41:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso4685914wmc.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 20:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRgjIPZAMfyNauGGHIKOX091JCYAgZevyPfFhtUJQts=;
 b=Rn4+emlflINHAHBiSJ3Gzd6GT/de+VWv1au7GWk8b6OrMoecsjCkN7c2+18t9vc79g
 7/bhYYKnUbclewXy8OEZ2KoO7zxZurf+4JJrLx9x4uaDDYYrUAM1m56vbxB/gB+PxRQE
 HZkeZyGPq+n/OKrDrWG/sUMFsEJzVyYJBdn7TY9KsBwwrfn4BuXazF9bR9Ktitc2dbij
 E0YYlNoJBPpEsqvZvlsHm4bYM3TFrgtrE2RT4OE0MDnUnRSinq+7ohA5qBgkYzX5ycVx
 9icDwH5VvCF/25c11L298V7PN4DF/vIQXmRLI29BDg8DTAXerFFqkrDzA86+HG/4eOMg
 Vd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRgjIPZAMfyNauGGHIKOX091JCYAgZevyPfFhtUJQts=;
 b=1riujkZZuPgW5g/vGRxMUwbxFivV7X3bbYJDC929UFSMOHzg+wBZGHMWHhG5s0/wEV
 UPIZIkkWZQsNQwu/GF0HaNmCdeqSFbhBR/eHMeg0IHj+mAFHCzaDiYGpKzXAYdDpmw5l
 1hyTf2bVE2S7ja9O9gA+4t/hH+DkfQAvNCP4dX4g+7W41zijz3YUYmDF+k1KqSvg3ola
 ipkGAyYOuW67FeBQz4LFrqDDYaXQVr9aNEg48IHBRu8KH4JRDcWwxu3aCfSQBrKSuWRy
 lPyCM7ZHYzG6X4f2KrrptEYgPRoOWCtaLalXLvPgxeShLpHkphy1xOdagmcr+ABG3vEv
 5ZQA==
X-Gm-Message-State: AOAM530Z1ky+XzCe6+bCwPTzyxzjOf4vPc2YmnQAkW8wJ+9+djETr5Az
 H6OrHr1szvTXoGR7VU38kNX7pK7QpGWVAVDax44ANg==
X-Google-Smtp-Source: ABdhPJwq/inlKzSq75AY+T0EiU9ZxyChPaiKkzBbfN+RsyzMC//uRd8wWeOw7uPjcUk1dOIBM5ntx6MYREPqrrRjUC4=
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr9159071wmh.176.1642048913903; 
 Wed, 12 Jan 2022 20:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20220112081329.1835-1-jiangyifei@huawei.com>
 <20220112081329.1835-14-jiangyifei@huawei.com>
In-Reply-To: <20220112081329.1835-14-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 10:11:41 +0530
Message-ID: <CAAhSdy2oOiiJ=ogzP4+StyvJpqaa-zjPGqKA2hy2T3JcCO7jCA@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] target/riscv: enable riscv kvm accel
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jan 2022 04:41:57 -0000

On Wed, Jan 12, 2022 at 1:44 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add riscv kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..06a5476254 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -90,6 +90,8 @@ elif cpu in ['ppc', 'ppc64']
>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
>  elif cpu in ['mips', 'mips64']
>    kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
> +elif cpu in ['riscv']
> +  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
>  else
>    kvm_targets = []
>  endif
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

