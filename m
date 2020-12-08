Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlFn-00089U-8i
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlFe-000854-BW; Tue, 08 Dec 2020 17:14:30 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlFZ-0006XB-TP; Tue, 08 Dec 2020 17:14:30 -0500
Received: by mail-io1-xd42.google.com with SMTP id d9so100790iob.6;
 Tue, 08 Dec 2020 14:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDhpagymtzefWB/r5VG7ra2ZItwjDxoOaj88vM8lSpI=;
 b=adGqN+ZpghBajeFeRhtFx0ax7BS/LkHFIdwKeAM/RHXsWoXGNnUz8ZGllSSV+vCDgl
 6/9giI894+si87qHAT4cCqwIOhk5+8FduLyNNVwvZ0OJh1iIXMF+w6CPil5i0wm33U1z
 wz1oGKfNzC60mb6ynMq12+Px24H146uiAgNetslNE3nJ5YZLgacM5Epdr7zMqN2dnnY0
 J0Zc4nnrnJyl9XukXY7KEYbpdT90UhiO36Y36TLdBJZpQyfu6mOEhRRf3+f3vg1PQziY
 ERKib6Zjvg189Z/Kp50um5pxo7Nm2Pg7EVT5cBxkwVjlw8SSf4yTD6HglUdXc5g6KFGd
 x0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDhpagymtzefWB/r5VG7ra2ZItwjDxoOaj88vM8lSpI=;
 b=YZSGxi1luVgWZLtFafg0oJ5TukqCjw1GQPWlvB2evKtnaUq1U3Af3y8x7gvquadd/6
 aK57zKeQa5Pe3eSsmcoLR2z+8gUQ93SRIkPfwQaSfy2sJoaEjI5kW5S+a1aE5bFtTTwm
 hNBPdocqdmhoYWZgURGVk/sXI21Fbl2k4zcdEmJfIkEQ2pOpZNPevNVK3njHWNX1G5Co
 k+CN3/zPq5y9P2W16V5kMG6s5W1LoMOfjS9Ijacf+4BefNl5lq5m9UnYmm73R4fVlDt6
 EdEuikOtngYGx+QvjoTNvJ1Z8+LblmpvSAc+KmIxSTztMrHJW4is1AjawECz5Av70Jqm
 ZX7w==
X-Gm-Message-State: AOAM532QDWrx+JY/V9ryRRW13iH2fPwSFJeQ2KY/8s0RApVUSflXCmci
 sk4fozsX/51vSMCT6dFoDBsNjp971Gcfjh2hQ/M=
X-Google-Smtp-Source: ABdhPJxaoNHS+3cxjoivZFinPoi/B19lNAFgA0xdURtMwzg4Zm45evCCCE49Hz9dImEMzTZCna0lA1oW/PQKBc9OqpI=
X-Received: by 2002:a02:5148:: with SMTP id s69mr29004326jaa.8.1607465662194; 
 Tue, 08 Dec 2020 14:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20201203124703.168-1-jiangyifei@huawei.com>
 <20201203124703.168-4-jiangyifei@huawei.com>
In-Reply-To: <20201203124703.168-4-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Dec 2020 14:13:56 -0800
Message-ID: <CAKmqyKNE1JU3KJscNfg78dGW9Avs2nvTVt-qr417g5noTbCAYQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 03/15] target/riscv: Implement function
 kvm_arch_init_vcpu
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 "dengkai (A)" <dengkai1@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
X-List-Received-Date: Tue, 08 Dec 2020 22:14:32 -0000

On Thu, Dec 3, 2020 at 4:55 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get isa info from kvm while kvm init.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/kvm.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 8c386d9acf..86660ba81b 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,18 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>
> +static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
> +{
> +    __u64 id = KVM_REG_RISCV | type | idx;
> +
> +#if defined(TARGET_RISCV32)
> +    id |= KVM_REG_SIZE_U32;
> +#elif defined(TARGET_RISCV64)
> +    id |= KVM_REG_SIZE_U64;
> +#endif

There is a series on list (I'll send a v2 out later today) that starts
to remove these #ifdef for the RISC-V XLEN. Next time you rebase it
would be great if you can use that and hopefully remove this.

Alistair

> +    return id;
> +}
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
> @@ -79,7 +91,20 @@ void kvm_arch_init_irq_routing(KVMState *s)
>
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
> -    return 0;
> +    int ret = 0;
> +    target_ulong isa;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    __u64 id;
> +
> +    id = kvm_riscv_reg_id(KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa = isa;
> +
> +    return ret;
>  }
>
>  int kvm_arch_msi_data_to_gsi(uint32_t data)
> --
> 2.19.1
>
>

