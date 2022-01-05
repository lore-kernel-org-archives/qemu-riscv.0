Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EOr-0004Ge-45
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EOo-00048l-SM; Wed, 05 Jan 2022 17:04:50 -0500
Received: from [2607:f8b0:4864:20::d36] (port=44711
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EOm-0006K1-3V; Wed, 05 Jan 2022 17:04:50 -0500
Received: by mail-io1-xd36.google.com with SMTP id h23so790645iol.11;
 Wed, 05 Jan 2022 14:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zm6hq7hdTHha4uq0ZX23dBVJPJI05eLjkVtrtmDeGKU=;
 b=D7AjArZ1OD/OfOcakflZMiChjBF78hJMhN5Kz+SdMcORQM5kz4ZH43poi++XRmaYfw
 34EzVTrBD3G3SGOQnSpXJrgl9Wruuh6Aa43Gq7qjUk6bukIPukXmNCGNh9JIhiBHRcTN
 UFkBgzMawNH4RI3PFBieMGyiBF2cLLg04ucgFNM+INos1XN6EfxvHaEYI+pQRQRwVeLQ
 hXO++Rqf2gF7NFMKrZLwYDiF8dAmzJSPfq8Psj4FM73toA11ch9ioBDP3AG44kKepmtX
 hjp8+ipHnMrvfabURMhmcKTfFf6dWnHatnjiYiBnoNYq2eNaVEW57HkN2JS0zfJsf0lA
 xTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zm6hq7hdTHha4uq0ZX23dBVJPJI05eLjkVtrtmDeGKU=;
 b=yqt1q+in3fLbZsbdtJ0853iHX8F4ukBw0Df0UsHsfPoeAIU1hi/iCGSaa6CthcXt9t
 bhx9JmTlTesr5HEwBFWIPcBgxx1voIK4gurCV8Rowks5LtUIlhE89ybJjuzEt+lHCnOv
 5CW/IQdsZ4Wc2hFcw10v18hdYhWiHWwCEFnbUCUykNvOprqhY3IlZ5OJxVsvY1hfYdDS
 zpEYHqym7633ocC7kmGXNs+JC1dwEfEb22ugMTq0twBfL2FbBBh8f0hq+YVy+PCJ2a7r
 MkZW2T6PAtqamngMT/QYOFNWKoFqXFvSHEBEqw3K9+iZNUrHNKVHMYasgzBvDzt/29Tb
 G7DQ==
X-Gm-Message-State: AOAM533TlgMQNbk5Nmm+LOywezj9Em9HCJEeFNU/RUHgU0Z/O1qauyhu
 Dthwzv/Ao9/mW/cPMKLpJMrSE+UuSXsXIC0o1Fg=
X-Google-Smtp-Source: ABdhPJy3d/D66OUGPIk5j3YmZLVa9IC9mu9NfLTOqB44PEuZ0wOMV0+yv9NdUxR2M1BgfOgxXzK53qfgK02BQrW6XzI=
X-Received: by 2002:a05:6602:1487:: with SMTP id
 a7mr26307777iow.57.1641420286640; 
 Wed, 05 Jan 2022 14:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-12-jiangyifei@huawei.com>
In-Reply-To: <20211220130919.413-12-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 08:04:20 +1000
Message-ID: <CAKmqyKO8qvAY=jPC1BnjXqy5=Lakxg7+OkznGQqBhLAJr4r9FA@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] target/riscv: Implement virtual time adjusting
 with vm state changing
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
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
X-List-Received-Date: Wed, 05 Jan 2022 22:04:51 -0000

On Tue, Dec 21, 2021 at 3:45 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> We hope that virtual time adjusts with vm state changing. When a vm
> is stopped, guest virtual time should stop counting and kvm_timer
> should be stopped. When the vm is resumed, guest virtual time should
> continue to count and kvm_timer should be restored.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 3c20ec5ad3..6c0306bd2b 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -42,6 +42,7 @@
>  #include "chardev/char-fe.h"
>  #include "semihosting/console.h"
>  #include "migration/migration.h"
> +#include "sysemu/runstate.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -378,6 +379,17 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
>      return cpu->cpu_index;
>  }
>
> +static void kvm_riscv_vm_state_change(void *opaque, bool running, RunState state)
> +{
> +    CPUState *cs = opaque;
> +
> +    if (running) {
> +        kvm_riscv_put_regs_timer(cs);
> +    } else {
> +        kvm_riscv_get_regs_timer(cs);
> +    }
> +}
> +
>  void kvm_arch_init_irq_routing(KVMState *s)
>  {
>  }
> @@ -390,6 +402,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      CPURISCVState *env = &cpu->env;
>      uint64_t id;
>
> +    qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
> +
>      id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
>      ret = kvm_get_one_reg(cs, id, &isa);
>      if (ret) {
> --
> 2.19.1
>
>

