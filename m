Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMFvE-000652-9F
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFvC-000626-L0; Tue, 16 Mar 2021 16:04:06 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFvB-0003hF-5s; Tue, 16 Mar 2021 16:04:06 -0400
Received: by mail-qk1-x730.google.com with SMTP id s7so36603321qkg.4;
 Tue, 16 Mar 2021 13:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMlcB/wdYISo7LjEDU055JDp0VIz9sPVIfxI+BKaM5c=;
 b=F5H4YRYhwYG+x72ToMC1Cni/ObgOnzwdWeOG4PT3/l/kJyr/7n73zrzSA/0ezS4kfG
 Rxpfq39UiW2xHwmKHqB6vV+xqaclgvI9fKck8jXq4GYc4lXW9H1q9xrqaQPeT+uBXT0r
 25oHh6ibLT00jDJ3VorTdvAbevKYE0lGLUgp0shybUCjvO+K7YFHanAIeT9p13FdMa/o
 lQgNb5Pkq4f6V4Qvuib5odbSvFy2j2JW/3FUfiB7sca7Bt/qrHrKLj4mShdsiJTjf/O1
 LcpXb4fQP9K/lbXQMgbYUZ7CuCn+Z89RErjxfUJeteCrBAZ2AecHpPXXd3b/2/FNDccy
 K2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMlcB/wdYISo7LjEDU055JDp0VIz9sPVIfxI+BKaM5c=;
 b=qLn4EFwzXrK69vyeY7v/L0rpblKqlyoKMebrjA4xwpEw0CP4U5/GwnDn438YIYEnQJ
 vXApAH0SpjueZbYn2kGigRGXNTYniMnE3A3WlyYVHAQXRcBXGNCod1dMfw2WRIYQJfHv
 OqPhfmFYWL0+E04yv2AkVXy1bXBcWc2PrNt6HE6DYdIc7UWlASm+1G0DddNiJtUQ5+em
 ytUMt04j8JhDQZRNOgxE4QcS7pF0IyJupKRIiXAM/smXCcVh3sXRtdQhIxxu+xa/Aj5J
 O6VBl1adn6PMiXmSBD+Ax/ma5eUAZMGDS++hDEl8uCx45R7B8YioNchsRk68D+C9y4e8
 j8vw==
X-Gm-Message-State: AOAM531PggkrkfaouXqplYPhGaVQ80xBu/CTnekYPq0ze23fqk+JkHft
 QaSoll3s+UgAclEaPJ8qqh1IHIDV5HH155HV8Q0=
X-Google-Smtp-Source: ABdhPJy3Z9f17jnfNs0/zRnFcMcuAUw76AhPOzPqKBAYvNZAzglDbKQ1X/dBpmT/LjCP2+iimfAe6hDZTMbTmFAjw90=
X-Received: by 2002:a05:620a:13aa:: with SMTP id
 m10mr872354qki.164.1615925042560; 
 Tue, 16 Mar 2021 13:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <1613914370-17285-1-git-send-email-cwshu@andestech.com>
 <1613914370-17285-3-git-send-email-cwshu@andestech.com>
In-Reply-To: <1613914370-17285-3-git-send-email-cwshu@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:02:25 -0400
Message-ID: <CAKmqyKODi+WrX_P_Ca-_jHrtxARYTqat4jmNW+9Dc=UX2S-UOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: add log of PMP permission checking
To: Jim Shu <cwshu@andestech.com>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x730.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:04:06 -0000

On Sun, Feb 21, 2021 at 10:31 AM Jim Shu <cwshu@andestech.com> wrote:
>
> Like MMU translation, add qemu log of PMP permission checking for
> debugging.
>
> Signed-off-by: Jim Shu <cwshu@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f6ac63bf0e..c1ecb8a710 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -794,6 +794,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              if (ret == TRANSLATE_SUCCESS) {
>                  ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
>                                                 size, access_type, mode);
> +
> +                qemu_log_mask(CPU_LOG_MMU,
> +                              "%s PMP address=" TARGET_FMT_plx " ret %d prot"
> +                              " %d tlb_size " TARGET_FMT_lu "\n",
> +                              __func__, pa, ret, prot_pmp, tlb_size);
> +
>                  prot &= prot_pmp;
>              }
>
> @@ -821,6 +827,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          if (ret == TRANSLATE_SUCCESS) {
>              ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
>                                             size, access_type, mode);
> +
> +            qemu_log_mask(CPU_LOG_MMU,
> +                          "%s PMP address=" TARGET_FMT_plx " ret %d prot"
> +                          " %d tlb_size " TARGET_FMT_lu "\n",
> +                          __func__, pa, ret, prot_pmp, tlb_size);
> +
>              prot &= prot_pmp;
>          }
>      }
> --
> 2.30.1
>
>

