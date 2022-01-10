Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n73nz-0003qB-5D
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 18:10:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n73nx-0003oy-8y; Mon, 10 Jan 2022 18:10:21 -0500
Received: from [2607:f8b0:4864:20::d36] (port=37743
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n73nv-0005cy-SF; Mon, 10 Jan 2022 18:10:21 -0500
Received: by mail-io1-xd36.google.com with SMTP id 19so19877246ioz.4;
 Mon, 10 Jan 2022 15:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i56dmiKFJTz7J+/29IVu7tJ1DviTvoTcjNMgMReords=;
 b=NISRuqHiFv5JvcDKDmKF2qp7N46SKxQSlEzzm7du49yfGeG7oR+jS3JZo3KVecwaNd
 +Ese/IqFOmACd4oIGTV5C0UtauHkpjzz4RtzXAQ3/1sAfZZtyQyjRZKv/jnolSjdO/Tu
 b4DFChNxUt9GS4sZI1oFm+8v/bf0QPHYTjdGt0NWkpP0L/zz75dTL+eM/JDGZqdBltST
 ktjTGb5o0xKaMT/uOx0bkwXzJvHCvcCg2QvbSRkxBT/3uATJ2f4dFxIk0x1GWEBKyeSM
 hoGvQVL9ZHFn2l+/RWoydIxVogRgyK82xFoskil3ksISXzQCQualWXMLePKucAFyVKci
 /S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i56dmiKFJTz7J+/29IVu7tJ1DviTvoTcjNMgMReords=;
 b=CF+nFApyDkjdVbPs+vPUG5n1D187e1XFLZqBd82a1PJ+BEQpnfMW69BTluJCEULiIA
 0tICrKhhYjZQ9LtwYLRikoi92C5u12GAYQVHmvAeZh+miEZRA4i1Ojp+8QYsCbduo5M7
 4WlODtmBG24PDEuMnCxR+rw4wzENrb7UzlJJCHqZFpEc8hlKlP9sIytXvN1qXNSwfYRF
 LycKPbvR1iOcsPpjnVtm/Ruy2YK+biqLEkmOivEZGnpZalrEcjKfZGpB/b5ZxAQF+MCt
 h3qOIlt3yKfJ9GuzOXnkixKzjIhwKCZM/y9WOmsx2RmvM3jNZVPcrSBNCrh9zn33ilSs
 5skQ==
X-Gm-Message-State: AOAM531wtW33+sbdN5W5n7sgE6E0Tg4K/p4QAcHpiPNDvaACxd40Uqt6
 fqf+DwBJriH0p6ErraAQNnV9AQmNMr44Lf/ABqE=
X-Google-Smtp-Source: ABdhPJwHQXu+ExB9DkfL21+E0aF1Eeg/9j8DWaYEDlnnIJKMSrfVOWFNGIJHNe3qZCFl/uFnjXBf4rw0fnIAd3GNZkk=
X-Received: by 2002:a02:6954:: with SMTP id e81mr93782jac.63.1641856218466;
 Mon, 10 Jan 2022 15:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-3-jiangyifei@huawei.com>
In-Reply-To: <20220110013831.1594-3-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 09:09:52 +1000
Message-ID: <CAKmqyKOOD-iRxX8aj7V2Vtfmi6=i9jCDT=0qgUvxX1j1DOOHXg@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] target/riscv: Add target/riscv/kvm.c to place
 the public kvm interface
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, 
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 23:10:21 -0000

On Mon, Jan 10, 2022 at 11:48 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Add target/riscv/kvm.c to place kvm_arch_* function needed by
> kvm/kvm-all.c. Meanwhile, add kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> ---
>  meson.build              |   2 +
>  target/riscv/kvm.c       | 133 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/meson.build |   1 +
>  3 files changed, 136 insertions(+)
>  create mode 100644 target/riscv/kvm.c
>
> diff --git a/meson.build b/meson.build
> index 53065e96ec..7eaec31a3a 100644
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

Can you add this as a separate commit at the end of the series?

That way we have implemented KVM support before we enable it for users.

Alistair

