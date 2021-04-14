Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWo3v-00055I-Bu
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 18:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWo3t-00054m-El; Wed, 14 Apr 2021 18:32:41 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWo3q-0001Ny-GH; Wed, 14 Apr 2021 18:32:41 -0400
Received: by mail-io1-xd30.google.com with SMTP id b10so22248230iot.4;
 Wed, 14 Apr 2021 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DnWpmyuBcVLMh+o254nNZjs/ViGAgPIT2BWu82a9qds=;
 b=VBQkmczcFZIy8vNoASuNLjaR7Mqq4uAMvQbmVI31prjpKqnoQ8DYYWS/Vr64FewoaJ
 t+5Z8Vez2c/GrpehDiF/LLnGO3ELLsNVQDb8JmfBoO5DZ38ECyWeAFHhkde39wCh1dAV
 8KFjbXmGMdDMMWu8b6fIseMYcUJyTpPnzuXdfZI8bBiEJUp5EnsCaSzRonsSp34GSTFt
 cGOjTskLLPCkEeZ91Vqyq0es38h+7I2VVq6+ZICZXMXFtp2+ZfJt55x1yl6tlqS2BiRw
 COmM3IEw/1lV4CpM9RR+oeBMxF+so8nr2YMSAg5tmBdAwYVKUDDvIY7eXfHoYLeOYAFt
 M2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DnWpmyuBcVLMh+o254nNZjs/ViGAgPIT2BWu82a9qds=;
 b=cQ0ul0YAAWbfzrTdADtY5oWAgTRvIqv6t+CiFuLSMS7JgHjmXDdoHmUKVyqdJsVeW+
 hKA2kx3rrlXhy68y1sQC4DAwdiHdyyBk7TTzwBo3mfP61Cljw5E6NjJmHiqMZuE4dGRM
 cNE/b6xfLd7G77Q0rFNxx/3B+V/oCccHOGfAp87dumhL41zX2eczO/GJ4IVxn94R/NrS
 Jh13smQkG+ciYQjOOi7TloLRRJ/NYfDUpyeh+w8volYoznPmaTmA//iubbD1QzA9R8z6
 RJkZftM4I5b6j28HZOqU0reTbfzF870f5XVmnTUs2u9DlIqngZ+LMCaOGYDfjaQpwmO1
 4WLA==
X-Gm-Message-State: AOAM532oAhOZY530/BiguCuZ4T8nHxeehn19wUUv+4t+cfbOLkgPCpC3
 7Vh/C5gjXMsE1LWCMG6ZnuAqJKqFgB7w+03Iv+A=
X-Google-Smtp-Source: ABdhPJzlHwyWvinrhm2Yv5H+jUvhG4+4quL/QYdBBVc8w8nMH9ycirhBlndVFnE//9LtCOb91HnQ1eLdgxpG+hRYNFc=
X-Received: by 2002:a05:6638:1211:: with SMTP id
 n17mr198838jas.26.1618439556144; 
 Wed, 14 Apr 2021 15:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-4-jiangyifei@huawei.com>
In-Reply-To: <20210412065246.1853-4-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:32:09 +1000
Message-ID: <CAKmqyKN-eiDw3Ufo1QyLg5ELP-JY+aq3Bi1cPJVf8gQtsu+qkw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 fanliang@huawei.com, "Wubin (H)" <wu.wubin@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 22:32:41 -0000

On Mon, Apr 12, 2021 at 4:53 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
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
> index 687dd4b621..0d924be33f 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,18 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>
> +static __u64 kvm_riscv_reg_id(CPURISCVState *env, __u64 type, __u64 idx)
> +{
> +    __u64 id = KVM_REG_RISCV | type | idx;

Can you use uint64_t instead of __u64?

Once that is fixed:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        id |= KVM_REG_SIZE_U32;
> +    } else {
> +        id |= KVM_REG_SIZE_U64;
> +    }
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
> +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa = isa | RVXLEN;
> +
> +    return ret;
>  }
>
>  int kvm_arch_msi_data_to_gsi(uint32_t data)
> --
> 2.19.1
>
>

