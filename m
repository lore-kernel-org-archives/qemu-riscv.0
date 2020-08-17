Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7jQC-0001mf-6u
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 13:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7jQA-0001mJ-TZ; Mon, 17 Aug 2020 13:59:46 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:43177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7jQ9-0000Xf-6p; Mon, 17 Aug 2020 13:59:46 -0400
Received: by mail-il1-x144.google.com with SMTP id e11so7335234ils.10;
 Mon, 17 Aug 2020 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uCaym5yllGtxBKdP9XNiXAqKEbI4fYlvrnbla8AIZbY=;
 b=IED7aJCmyNpCZ1qaeRIIijyFMzkxveXyOxwkvalgLqvkop0AbuA0ytB8/Kd4UnNDLK
 WHZqV2I8g+FLMd/cU6IKugEAxukcKpXr85qFhP8PIHX+xDZpL9Pi2+3jzkJqY6Odzbyk
 PTKeqD6DRRq1PRwR+2apYR1VSM7fvep0e/lbu/osezsBbT6pSCNHdM4kvhwmCNTflOMh
 aSmbQnQ52tj/IWnYCfFKrtkKaZasTkYHjfqfd/TMQ7Ezjgr7rR+NAD8qsQ7ew3FhS9hA
 unbg6DR3bj8HfDJjoqrxkAsQvN2IftmO4ssTjyPiTV9Mifx5eqJJMdkm+pGUpQgs72yn
 YPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCaym5yllGtxBKdP9XNiXAqKEbI4fYlvrnbla8AIZbY=;
 b=p9J4Acr0JI0VDldU/ohFnUw8GTcgzJnV18MH3gALQBfJpRs74+JKMQL+a4P3mUyXJo
 llCtb3gXNRhqzkUK0qBq4uqrU5RKI0sLqqG6lNBOxErOEey151faIJdUGUf1yQrXHQJA
 hDzm/7LhcTbnPF4j3IkcS157x1ihkVAz+ldHAaJ4xe8+fLStPALY6U1enV+S64Kv54As
 lIyUdsUpCcXCN1mBdd/hyYiOJfME+Drll7t7OqqtIFj9VMMy7o8G81JCOciEuuon47qX
 UjIgcg6qcna2pDhvfnEe3LBnXtWCN4jUOZRs/XRP5FVoNjW0ZqiKYyt9DD9/XgKuvOm0
 kQXA==
X-Gm-Message-State: AOAM5337swbmasynoMMUbRAxQfiLk8VQYiWluqlOBYpN4G/QFpi7nb5h
 VAvX5IVs9YVFa0MnCprj0Xyn3Op2dpo5AQpYagc=
X-Google-Smtp-Source: ABdhPJy6Z4CTSBS0sp5Asab3Z/s9cG4YmYG07ovvCT5PqZGNwf32CvEh/SS3kiKXmiYYA/oN/cPWOnpraWK1uttB11Q=
X-Received: by 2002:a05:6e02:ef3:: with SMTP id
 j19mr15538784ilk.227.1597687183879; 
 Mon, 17 Aug 2020 10:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <1597423256-14847-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1597423256-14847-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Aug 2020 10:49:12 -0700
Message-ID: <CAKmqyKN4p_msMBUNQ5XCBL7EV2H3-UDo6bEpAVWqAidaE5cNeQ@mail.gmail.com>
Subject: Re: [PATCH 01/18] target/riscv: cpu: Add a new 'resetvec' property
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 17 Aug 2020 17:59:47 -0000

On Fri, Aug 14, 2020 at 9:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Currently the reset vector address is hard-coded in a RISC-V CPU's
> instance_init() routine. In a real world we can have 2 exact same
> CPUs except for the reset vector address, which is pretty common in
> the RISC-V core IP licensing business.
>
> Normally reset vector address is a configurable parameter. Let's
> create a 64-bit property to store the reset vector address which
> covers both 32-bit and 64-bit CPUs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.c | 1 +
>  target/riscv/cpu.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 228b9bd..8067a26 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -518,6 +518,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a804a5d..d34bcfa 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -291,6 +291,7 @@ typedef struct RISCVCPU {
>          uint16_t elen;
>          bool mmu;
>          bool pmp;
> +        uint64_t resetvec;
>      } cfg;
>  } RISCVCPU;
>
> --
> 2.7.4
>
>

