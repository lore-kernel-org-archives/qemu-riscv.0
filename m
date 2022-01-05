Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EUm-0004hG-LV
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EUh-0004cK-Po; Wed, 05 Jan 2022 17:10:55 -0500
Received: from [2607:f8b0:4864:20::d36] (port=39569
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EUf-0003bl-Kt; Wed, 05 Jan 2022 17:10:55 -0500
Received: by mail-io1-xd36.google.com with SMTP id y11so840553iod.6;
 Wed, 05 Jan 2022 14:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KyuB6cgvbx47LTafWGeD98t194U7V3pi7OOl+mXsMkU=;
 b=HW8qzzmLZrWDmjiHRFwd1oh+9YLaimXzS3P5AZFYnDx/8doksy8ALEqVW/JXIe3Cy2
 BYhpPpnHI9JmdSM0Zh0d5dTaQeX8nqVLPBdDQZRQ5evdiwps8oXgoKc8o2WRFAq0Gi04
 jOe2mweTVWBXElnb6ZfgjGMHcE1qd116xRRYVIe3KEr5oaif1qbhgvKNAqBIoj3l8q2b
 jCsysHVX1pu41DkiolUC2xlrPxU1eGLz5e0yfRXiZxPQbbbKQfy2Pc5hGC/tE2U3TAHj
 q4VLcfDpPDDm7L6k0g5aQ+iXgREMbrVdR1+9L0UtMiBj01Jid/milNQ6/ZEI9MSQuvnq
 jPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KyuB6cgvbx47LTafWGeD98t194U7V3pi7OOl+mXsMkU=;
 b=3Q9lwCAd8rUa8cXoeqppAAdkDH9txmM0m7EdLuU9kYUsDzE07a4X6mK9AcC7pI+ZEc
 nIRoO8AgBnast0DVqzWQjVVVbit8ct4NIJMjMZEP+pA89FP3mWk6cNbP/PfzRycoPj2n
 wRNN6mHKURYziM851OEqD7ecg5oRc8tgqNoMbfeu/28m+FP39KWYhJoZDP/Nayv3Yjmy
 PxC63YF9h21dHZ0v0Rdj6tEVOo2wDubUDzdJXhotz5714tY+/JvjEB6+fjFbWLG5Oa/c
 YEpXG6UwCaVvsB/oSv0M0yamcgF1xywyNd8ZzFN69EsQjVhJKkojKfiEO2t6TYodttSk
 4oVA==
X-Gm-Message-State: AOAM5304GPB7l+1kDcANMYmZnxXYP3TGqJfPsHFy19lQM5Sviw2C0CRR
 29BradzHErzBCrQV0Gfvr17ujGXR6gB7msZxY9w=
X-Google-Smtp-Source: ABdhPJxjH3Zp0UKsJFtPiPHOb+NU7fdX3IdNXLI5VjGFAJUEOziruEeObtWqofCzvBBK5cY1pgMKmOxonVLFcNFYcfg=
X-Received: by 2002:a5d:8f88:: with SMTP id l8mr26717419iol.91.1641420652505; 
 Wed, 05 Jan 2022 14:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-13-jiangyifei@huawei.com>
In-Reply-To: <20211220130919.413-13-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 08:10:26 +1000
Message-ID: <CAKmqyKNq9WJbx2CWL8qPatg7Gc3BckU=v94p+HgKiJ1W5-YPNg@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] target/riscv: Support virtual time context
 synchronization
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
X-List-Received-Date: Wed, 05 Jan 2022 22:10:57 -0000

On Tue, Dec 21, 2021 at 2:44 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Add virtual time context description to vmstate_kvmtimer. After cpu being
> loaded, virtual time context is updated to KVM.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/machine.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ad8248ebfd..95eb82792a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,6 +164,35 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    env->kvm_timer_dirty = true;
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .post_load = cpu_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> @@ -218,6 +247,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_hyper,
>          &vmstate_vector,
>          &vmstate_pointermasking,
> +        &vmstate_kvmtimer,
>          NULL
>      }
>  };
> --
> 2.19.1
>
>

