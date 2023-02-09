Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQGWI-0005kb-Fr
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 18:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQGWG-0005hs-7S; Thu, 09 Feb 2023 18:40:00 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQGWE-0007zB-KT; Thu, 09 Feb 2023 18:39:59 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id t190so1809580vkb.13;
 Thu, 09 Feb 2023 15:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QxWQehmYBgDBl2n+cS2zVxGK5IMTsnfyhVvkD3u2YGg=;
 b=Z2RTPySJDxP1aQxLg7d8I3irp/le0qZbLcQ5F52SWBMjShl362UEZVq8aak6YVWXUs
 UHn3OkpKPSFQ2gLXj7myxpmBnwL+N21oABVGmrvsRU9wGj1QwSdLjRnt14aC1Kx3VD2e
 4qIOMg0YBHJjUHL0LMFG3Y4DR/o/iPFx7fMzS6HXGynQLLuHj5gqmVx/kg4rz+inb75d
 DgMQ75z8RosAvAs2f+adwsUFEAIXliTmBUTRCI/8cw9m21Rhoht7qMLWS4Da0qC+P1/K
 PecCXce5KVY9/1EX13OWU48v5j2nGdHZRkIFbMfaCjm8I4JdLgiFzSzC3A4AgMhLCvAT
 3whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxWQehmYBgDBl2n+cS2zVxGK5IMTsnfyhVvkD3u2YGg=;
 b=0z9bo03rlmWEcNIT/iDJPSIZBSwUZdTbB4KSF22xE/+2CUhl99daD+Z7oqAxfiF1L4
 T8dT2MXH4uVBor0MftWYgrBDiAOlI2hokJmW+xXQ4bdO6UNXtjXGS7IPvbKL/DkqcHUV
 jIGr1O1X2HMyDLzeDQkFkKWhMEUwZpCNpGi40NKTyxc65GklAl46yQIGdqqn2P+QxRhn
 ZH1pWMVYhnYHX35J2YtKQ1neyjIlNthxdeNVJtiuSyObYKblzbomV915vPyISTPT8Mtw
 o6KuMpGMsaV8xMIGcwmpf46dWgrVMQ25cC4SKDqzVJrHvRcbYfI5pSKFcxSRpOPSMu+f
 vcEA==
X-Gm-Message-State: AO0yUKXEGp5F36AOqMPE/whAZp1QMl+43zxTdHt1KQQCkWeeHCfOeqSR
 scT9i06uBwfiTI22h96Nix/8lxB/yu9f7J/uOhd6ZK040gfDug==
X-Google-Smtp-Source: AK7set9bfzcRD7qpxjhSPUR4Z8SdtRy/gzABremQoRAz+x4Lqa8cRq31IS6HAcQCr+F3Ec7rnih5HuSc5NFs8G4Mkp8=
X-Received: by 2002:a1f:2ac9:0:b0:3e5:7064:1bf9 with SMTP id
 q192-20020a1f2ac9000000b003e570641bf9mr2883529vkq.30.1675985997144; Thu, 09
 Feb 2023 15:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20230209055206.229392-1-hchauhan@ventanamicro.com>
In-Reply-To: <20230209055206.229392-1-hchauhan@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 09:39:30 +1000
Message-ID: <CAKmqyKPnrWorMTsA-dmPpVDJrZmBkGUdVCNmWzAEjDP7L7dQBw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 23:40:00 -0000

On Thu, Feb 9, 2023 at 3:53 PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> When MSECCFG.MML is set, after checking the address range in PMP if the
> asked permissions are not same as programmed in PMP, the default
> permissions are applied. This should only be the case when there
> is no matching address is found.
>
> This patch skips applying default rules when matching address range
> is found. It returns the index of the match PMP entry.
>
> fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index d85ad07caa..0dfdb35828 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                  }
>              }
>
> -            if ((privs & *allowed_privs) == privs) {
> -                ret = i;
> -            }
> +            /*
> +             * If matching address range was found, the protection bits
> +             * defined with PMP must be used. We shouldn't fallback on
> +             * finding default privileges.
> +             */
> +            ret = i;
>              break;
>          }
>      }
> --
> 2.39.1
>
>

