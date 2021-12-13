Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwd8H-0002xE-QI
	for mharc-qemu-riscv@gnu.org; Sun, 12 Dec 2021 23:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwd8H-0002x6-3m
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:40:13 -0500
Received: from [2a00:1450:4864:20::42d] (port=44731
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwd8F-0007ra-CV
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:40:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t18so24864356wrg.11
 for <qemu-riscv@nongnu.org>; Sun, 12 Dec 2021 20:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zTiIr8OWSR3f3Ah/0/DftB635Ef64Tgir5ocWnSiAY=;
 b=TCT+vTZkBXE7Gs0pgBRaca4BXo2tH3YZRpnCoGTv6o//Dr8n/0h2WO2DmByWuvc2cx
 ANj8nIM2UcVgHOOPEbtNIUCgejfbCy9dbnOYsIw0yrZYPEteeXZ0eMTOd6C9M2l6UZ+h
 EHBtGFVpE/PXmQ5NrOiGHeCJATeiwxlDjh+MQfyKwVVJd7X7XNZMGsslFXkiDN560Dr+
 YhJS/p5bttAfskGQUXYF8dQBeBrg1kT12zLfaxvSwljwRycJLph9noVdP9KYWFer2vy1
 RDHcERDCyYBiFLHbVFzk2ctExVfrvOkg6tt8vVBqiAofp8T++KGnojzuP/o/BcU0+1ef
 +vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zTiIr8OWSR3f3Ah/0/DftB635Ef64Tgir5ocWnSiAY=;
 b=PXGbXWHLTH9a2NFlehcxOwZRPRAbSyyHC1HeepXtDHVQLksROZyY3vFJHP2dFEFdX7
 rv+3+iQbe/62Rv1DA0tfDpoN0vx2UVSJs82o5wgImldY6KsCW0FXpd6AVbLuExEnXaYU
 NMPX3Zpn+6BVjX+N4O9F6EFRZIoghXWCICuwlHym0ps+f7Ik8I996wg0fwxeedu6lUAo
 eeqjEmWIVj27AKll6EkXpID0SFgLCYb3tSB3UmaH/tExGZE4q64Sa4qRbKBXHn8dogtq
 O2CGrkGglCFV5IVYWU8BjTpeEmchK5iEWGeA8Sd1uEfucxx4RNXXC8IExP9GtqGj+dbc
 0Kyw==
X-Gm-Message-State: AOAM530obYqWNJF5UbCMgtHMtkq6ZUtk5n3k8lNK946s9VBJTh39FnCe
 i8GFTBexEaVnMWKgccgFLxiU6CThErEdy+r7dpFoLg==
X-Google-Smtp-Source: ABdhPJz+CpsBjjYfGUhCwCWmwSWsKTqLI5tgKCy66Psgn6elmT67fpv3TO2rfU3FXV2P1AwOlvjfVVsjgnGkFt3gYKI=
X-Received: by 2002:adf:d082:: with SMTP id y2mr30031299wrh.214.1639370410077; 
 Sun, 12 Dec 2021 20:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-12-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-12-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:09:58 +0530
Message-ID: <CAAhSdy1gYnsQo2LOWAOtjSa8BKoK7btmXfaig-+6vRTF2b0QXQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] target/riscv: Implement virtual time adjusting
 with vm state changing
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42d;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 13 Dec 2021 04:40:13 -0000

On Fri, Dec 10, 2021 at 3:38 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> We hope that virtual time adjusts with vm state changing. When a vm
> is stopped, guest virtual time should stop counting and kvm_timer
> should be stopped. When the vm is resumed, guest virtual time should
> continue to count and kvm_timer should be restored.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 802c076b22..be95dbc3f3 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -40,6 +40,7 @@
>  #include "kvm_riscv.h"
>  #include "sbi_ecall_interface.h"
>  #include "semihosting/console.h"
> +#include "sysemu/runstate.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -377,6 +378,17 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
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
> @@ -389,6 +401,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
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

