Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwdAK-0003OI-H6
	for mharc-qemu-riscv@gnu.org; Sun, 12 Dec 2021 23:42:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwdAJ-0003M7-Dl
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:42:19 -0500
Received: from [2a00:1450:4864:20::335] (port=42506
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwdAC-0001ny-Lr
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:42:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so10829405wmd.1
 for <qemu-riscv@nongnu.org>; Sun, 12 Dec 2021 20:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xqCJCFenZgSfOUl/R4/U5gUMa3ys+XwRbdFxwDxzVI=;
 b=v+4+5tDc+1I7MKA8DsmriXHI5GHQNcgvZkDy3QRlLzvN8Xyt2LOhd0jeygmuzoP35o
 AqWE+PkcZtfGODyckJ71I+X6J/y04K9zdKlkxzF1mw50sTuCW2gnqsn3IdfXAjv7QmwN
 CL9BT8dfmdIXMZoZjbenzI4xFEZTlyNM/2oyktf1Y12NybkdIGxXCOHTachQYkggQe/V
 +3spzsQBs/5d4iFGxfiw3NKxBIrPDAgYk1w9AzDy7BPXH2/ZREk5JFkr0H15t3Q5Exix
 jNMLcGdTwbLeRS4szddE1C0v+75SGngsCoOAbKv3co1AiZ7tAjT9E0D6d2FekoNC0LFd
 aCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xqCJCFenZgSfOUl/R4/U5gUMa3ys+XwRbdFxwDxzVI=;
 b=t+ZZGNLgEcTxFw7asEyom8+8dyDo3cwoEGh0Qdc1uNvaQfj5vNlpCQnUriudAMCEE5
 hl4Z45X4xuXyF41lWLWKbv5davmvVWGxarotDJcv7xG9F7igDl/xTxGvzcS6eUgGKXat
 wpxg//12se9r1k+02sZSf6urPVkeViIM5sA3YA3zbWQOkDVvOelRVkeaC9R9RIW1YiyQ
 +aorDg+V0Yw6FlJVKTNOOYvDbMKOKV1V0mMiGmhcXHjcRs9CI/VrgVY3r6cNdeRJEjNS
 7pIl1b36MBQn7qUj4yfmgVpUPE8y7QLvGPRmvjY4iYjEBEI+QBNN6yQP2wx1Uy16qWiZ
 YswA==
X-Gm-Message-State: AOAM531dM2aKz8JQzRgR/T+GpOEZO2KTsCBL+CBL7sx9mJPVN4F1R6Bv
 OX3R/LVi4J+czaU5ghc7htFl4Xf/C0Bio5kvyhJScg==
X-Google-Smtp-Source: ABdhPJzorqtXGn5jowXDbWdLBNKLpCk/IlBNYlbHqTEuTlQaxIoYUzbl/nmKUQFFbSTBgGYotftzdwkI6SaDQ5MVD+U=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr34740152wmb.137.1639370531176; 
 Sun, 12 Dec 2021 20:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-13-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:12:00 +0530
Message-ID: <CAAhSdy34UorkvYVi7vUUifBh_TRvrQZW4c7uy1nQrj0UNMKGbg@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Mon, 13 Dec 2021 04:42:19 -0000

On Fri, Dec 10, 2021 at 3:38 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add virtual time context description to vmstate_kvmtimer. After cpu being
> loaded, virtual time context is updated to KVM.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/machine.c | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ad8248ebfd..f46443c316 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,10 +164,42 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +

Remove extra newline from here.

> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (kvm_enabled()) {
> +        env->kvm_timer_dirty = true;
> +    }
> +    return 0;
> +}
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
> +    .post_load = cpu_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -218,6 +250,7 @@ const VMStateDescription vmstate_riscv_cpu = {
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
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

