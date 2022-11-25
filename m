Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyQzW-000232-W6
	for mharc-qemu-riscv@gnu.org; Fri, 25 Nov 2022 00:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyQzU-00022C-QO; Fri, 25 Nov 2022 00:11:08 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyQzT-0003aq-42; Fri, 25 Nov 2022 00:11:08 -0500
Received: by mail-vs1-xe32.google.com with SMTP id k67so3192255vsk.2;
 Thu, 24 Nov 2022 21:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cDWuCxUwnj7jGmhP9U5LDvLA2peEBm5pg8c+Bn5FWuI=;
 b=XFiJ28nPe/lPuxAEsz2YQSZrL/uwo+GcLFqeR17E7TEdvIp9crnc7CWldb/ZXDmWHv
 SgfAFCOsAr/DH44T7mzIVKwF/093iyXU1arxxMURStuQS8+zZAxbjGo1QsecJHKkuPHg
 EEZhA33cfuTeZz6N/eUrPwNqL0U2NTR4vEzAGeajbyFA1SUIdD2m/hlulwaxaY4bWVG7
 rFeebv5X5oBOrUt0Q6X7F1LDcpabzfjyEvV01U7R79CQMOaunU5VCvxWxavNqDK1c8g5
 Q/vOP3NhrN6yFxx1Bzjxfu/lHCQnw6CU5BAHWqfTB+oRhTetQtqAWZkwS2NIzDyllyKg
 4Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDWuCxUwnj7jGmhP9U5LDvLA2peEBm5pg8c+Bn5FWuI=;
 b=NXXqSPIg7il29i4nDyiJaqTTkxXnVwh3/1G+s8xc00WM4kWOESX4kUoNjyK9fXEizh
 OLuxT+IM5BiC+TMumJQziUQZs70L7kGLVfsYpHs02Sn6vdYIHlJvvVe0d1H+cva5AfYB
 RCygP+JcL4JW30wH5laU4D13r790P/AS7LGMY29ZygDmpzrYa8quPnLd1j0dvdFg5QRY
 FBK3GBV1uc0vB5Dr9+A+1TzbE8EK4G3uJx9FSvJZxUYJRpbifkRj86iqEoDkqz0D+BM7
 hF72nKSkZOcD1ZVQ31EV8P9SEIMBP7NgPzOLhUfSfUWq+Tsrv5cFcYJyhoiEn35aQ9OA
 KKqQ==
X-Gm-Message-State: ANoB5plkJy+V2Iw5SOTlvTgumeV+CgFMqvHJDWWdKQ14m7is+oWRHdim
 xNzKk1VmP/1Wyn4GumjqCo7ydoxTOYTRVMELRlI=
X-Google-Smtp-Source: AA0mqf7rTYrPKzf9C4ICV/MKaztVNn4XZxUvBFLpw3EAui2YkUd6NBa8gEcUudUIINPT8IuLYlCJ7+ajGx1iCuwWgDE=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr19325028vss.64.1669353065668; Thu, 24
 Nov 2022 21:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20221123090635.6574-1-jim.shu@sifive.com>
In-Reply-To: <20221123090635.6574-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 15:10:39 +1000
Message-ID: <CAKmqyKNggb-SdS24+dFUhLNZozmhLNaU9PY034p_LED8UqCOjw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: support cache-related PMU events in virtual
 mode
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 05:11:09 -0000

On Wed, Nov 23, 2022 at 7:07 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> let tlb_fill() function also increments PMU counter when it is from
> two-stage translation, so QEMU could also monitor these PMU events when
> CPU runs in VS/VU mode (like running guest OS).
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..a52a9b14d7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1248,6 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          }
>      }
>
> +    pmu_tlb_fill_incr_ctr(cpu, access_type);
>      if (riscv_cpu_virt_enabled(env) ||
>          ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
>           access_type != MMU_INST_FETCH)) {
> @@ -1311,7 +1312,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              }
>          }
>      } else {
> -        pmu_tlb_fill_incr_ctr(cpu, access_type);
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                     access_type, mmu_idx, true, false, false);
> --
> 2.17.1
>
>

