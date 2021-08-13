Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mELRR-0002gF-E5
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 20:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELRP-0002ee-Au; Thu, 12 Aug 2021 20:52:55 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELRN-0004ua-MW; Thu, 12 Aug 2021 20:52:55 -0400
Received: by mail-il1-x12a.google.com with SMTP id k3so9108914ilu.2;
 Thu, 12 Aug 2021 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgCLtd4XEqu36l6wN1FQLF9Wv498wnwHYFD+X0t0D8w=;
 b=R57luwf8guvA5D40r/qAJvZn9m48OWH3h42U8swJf9NSEqRbSw6Wad0IySS+1K+COD
 VG48opba/LFvrWLwM+Jk2fpF89qmAXcBrXoXlMxSJlwb8G6m/vDnaF1bIgyXMPAU+URM
 xaHZHapox6fZ6B3QcjPtttkj4inorWELowaR5I8UwCnJs5GM21eKrc1XvADrQqyBQnGY
 hKXCWk7lL6gZkaEe1DOVwsW6TM1L3hmR/qutK2XXYXMSu7+ESrj2HXePShYxizVheFW5
 /ue8cFDLXcN8zDDKO/5AMC8/aITIfzbg5t/tKxnZt+iu+dUAdWyXYstFX8LmYRh6I6Q9
 xSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgCLtd4XEqu36l6wN1FQLF9Wv498wnwHYFD+X0t0D8w=;
 b=RgOTAjfSAzMHw0eBOnVohCpXEmFxot0wu03ZWK7a9nadUaEMZ3Jw4N+xdJsXVY0bXj
 jOdzFhNq09LLPvdMHJtsJumKSN99BXP4U1nI7AiuzMXwSSBKKkGWcx25QMZ3NXpmmCbq
 ovW5/V7uqwpfYvBlXeTTaqd31GDtpC+Ch09ZQM2RboNdNJ+jFWLOsQfGnOgi/F7iohL/
 fSXFECpLP/LheWNax4yzBa8J75IZ0h/dJ18P5/lmyP7tnrfJNfrssmIXIwtj5DZHxxOF
 dFGMZcbO0fCMq0XnHkuS/mvEJoD6Xqd2ROVt6EyeY9MXKStFUHq+nU1GU3Yyxj45Ga+v
 BhUA==
X-Gm-Message-State: AOAM5313iJtwKCHxuN4ajmDzWmBjSJ3EFItb8sTgmgcCT7FuiGx8HEgg
 5frJsV9Voc3I5hxmrNUmU5mztLTkeu/uicAwy/0=
X-Google-Smtp-Source: ABdhPJy6SFVFHd/Bk8OFHhPghdrLGyS/Ibxt+vQXdMIOZlemjNNXzQ3Lq01oOpfNnwYudK3T9cm+tHG9ho9rH6EcUeM=
X-Received: by 2002:a92:8707:: with SMTP id m7mr880285ild.177.1628815970985;
 Thu, 12 Aug 2021 17:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210811144612.68674-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210811144612.68674-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 10:52:25 +1000
Message-ID: <CAKmqyKPxDPY2KxwQmQYRq7ot7TTOq6P35Z9_VkiGmFdq+YtqBw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Don't wrongly override isa version
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Fri, 13 Aug 2021 00:52:55 -0000

On Thu, Aug 12, 2021 at 12:46 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> For some cpu, the isa version has already been set in cpu init function.
> Thus only override the isa version when isa version is not set, or
> users set different isa version explicitly by cpu parameters.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..1a2b03d579 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      RISCVCPU *cpu = RISCV_CPU(dev);
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> -    int priv_version = PRIV_VERSION_1_11_0;
> -    int bext_version = BEXT_VERSION_0_93_0;
> -    int vext_version = VEXT_VERSION_0_07_1;
> +    int priv_version = 0;
>      target_ulong target_misa = env->misa;
>      Error *local_err = NULL;
>
> @@ -417,9 +415,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> -    set_priv_version(env, priv_version);
> -    set_bext_version(env, bext_version);
> -    set_vext_version(env, vext_version);
> +    if (priv_version) {
> +        set_priv_version(env, priv_version);
> +    } else if (!env->priv_ver) {
> +        set_priv_version(env, PRIV_VERSION_1_11_0);
> +    }
>
>      if (cpu->cfg.mmu) {
>          set_feature(env, RISCV_FEATURE_MMU);
> @@ -497,6 +497,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              target_misa |= RVH;
>          }
>          if (cpu->cfg.ext_b) {
> +            int bext_version = BEXT_VERSION_0_93_0;
>              target_misa |= RVB;
>
>              if (cpu->cfg.bext_spec) {
> @@ -515,6 +516,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              set_bext_version(env, bext_version);
>          }
>          if (cpu->cfg.ext_v) {
> +            int vext_version = VEXT_VERSION_0_07_1;
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
>                  error_setg(errp,
> --
> 2.25.1
>
>

