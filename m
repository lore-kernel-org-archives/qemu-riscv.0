Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQJLx-0000Uk-56
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 21:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQJLv-0000UK-KB; Thu, 09 Feb 2023 21:41:31 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQJLt-00046C-29; Thu, 09 Feb 2023 21:41:31 -0500
Received: by mail-ua1-x934.google.com with SMTP id ch22so726117uab.9;
 Thu, 09 Feb 2023 18:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TW1zvOzFc23f/2L0lUrFaxWIlPTjKa142u5zcZd33C8=;
 b=RdElEOAKCziYCfjk6KFpKsUM04O+3+konLa3kl9JEovYjPqfmH4iUL9WqI7UD7Maqt
 5LbH//9cNAYKHnd8PCXS/eCemahN+t6ThPSejOtZgsfpHnBIyaBREYazm+96ql/T4Vob
 yr8O/jjbm/5refcwe6w0YCJYxxmRuXZb4DZAg6tWlsarfMesynP+bmxdqNMDnl4QJd5o
 LxdmAeoeUfMJvKpU+D7h+JhPZIbmAZWB0haQ6QvmXS7ybd4rCw3E++Pu2QCTxH3zJQor
 kjaREXF8fBzPj69RfZAHr99/IntNKgJBBFhPmZFaUz6QbLBEAw35GqoaVejbO5ItewSk
 JWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TW1zvOzFc23f/2L0lUrFaxWIlPTjKa142u5zcZd33C8=;
 b=PQAuY7kGovFMi65TXQOx95zccXs/PcHPsRPbFbZ9H95wVh1YI0ojeSbofXJxGeKJkG
 lbZ7HM+AiAs0FtNJmn+6LySCk0dCWdLrEyJAQGXDfQSVm5/xGCQh7mr8d84OkdU59hjD
 cjXFlF8oj55Lvy4bzHm4OXu7Vrwj9ANXdaS6M2ST7wzxaHLsptB6eXMMxh7oQKeriPzx
 pVEJPx7/VibQ/njbsQck+tXIzfIYktc0XfhCrfUpxedTDN7xuV9VjaN17XHm18c0YIWK
 IJm/DSj0sCDyjHtMxNUOXGDv686xWykVsFHDEgGMJeyhvQomrypV5VVvTAp6p5w0mTj3
 96/w==
X-Gm-Message-State: AO0yUKVg7oCYGObklvajcNQTwyhCpNkLq1iv/yK2bEkPNhLPJc7g3WRJ
 pNRbU5IvMGOAS8JqmsOua9rovZNXGiDQhp7JBQM=
X-Google-Smtp-Source: AK7set+Tzy1D/eUXZEr6kPnJV3fPXjnFY9U24IY/918GK6HTIVmgB87py98xMBx3szhFEaOPGP0XMNgHORAWXCDY2eQ=
X-Received: by 2002:ab0:3449:0:b0:686:3ae:58bc with SMTP id
 a9-20020ab03449000000b0068603ae58bcmr2522061uaq.39.1675996886542; Thu, 09 Feb
 2023 18:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20230209055206.229392-1-hchauhan@ventanamicro.com>
In-Reply-To: <20230209055206.229392-1-hchauhan@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 12:41:00 +1000
Message-ID: <CAKmqyKMOBj4Q5Wb_ERK3i7kigSy9kCOsKiXFOhOtJ_x0VMAp8w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 02:41:31 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

