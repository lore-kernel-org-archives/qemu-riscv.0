Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPM5-0004CC-TD
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPM3-00046X-IY; Wed, 15 Sep 2021 03:29:15 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPM0-0007df-7X; Wed, 15 Sep 2021 03:29:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id s24so1334506wmh.4;
 Wed, 15 Sep 2021 00:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VfiJVJq46tkxiFrMZTV7JvkkDaMHW2oU2cMz0XkGMt0=;
 b=Ac8xndbHo5A4gho5O1S2ts0ycHm8G6hS6YlCtIvdGn7CIBkQV0l0R/oQxCOg7RcSEZ
 AEeOE0myKPc16FQ+MRGB6TBx0uifhKcx+CwaQ4C8c1SuujdqqTI0FCyT+xIxIiA5zkdr
 O7qAqSGOZ/Nyw+aMCbNvfQBp+KkcOJLvqyKu+qwG/Ypj+hNEG0dlV1rVxFLl+iYZMUS+
 62syQJf8XcWU5p0HNTtHML3w8bHgR9QNb6uA9WObyQh2ZIaauVwbn7mIIhHc6rlbMRyi
 MZTdhJh10IGSVIu1lGDKgxsqBL3KxBnAkhmaLDhn5SSby44Z9Sp7D5JrA5lvhAt1QK+r
 TiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VfiJVJq46tkxiFrMZTV7JvkkDaMHW2oU2cMz0XkGMt0=;
 b=iP1s6NT94ImX4qt7WhrpWpO4m7aDBur5x+ZQFiXsbNM1OxyK0mbwuDd6zgj+Uuts9B
 8DVKOWjp24c2UKVe658YCpm1CLKTFTFzGWFuhYPYp2hKTPiRkEpNS0GzfoWWuc/0dld0
 Ksynh3uZzWOe4mEyWOmgyBl/ZN9uCGFvwueDxaRykve2URG/hWuAEPLoTq4SUD2Z9Q5R
 draK6Mua62PjSukhS56Y//0ZN70S+LKu9nsQuCNpaN0Y3VSiRHe+ijK75MYflNCI4Rq2
 6jGrqhPNs63Jr36SQsHsbC9cE3UYw75W9UNPQWwoo+Pz72afuhGCerShZZXL7zK8yUC/
 PTfw==
X-Gm-Message-State: AOAM5334+chhW4yju7RH2defDxeeT2vCVoJ+QCh1jua0jzXORRVeDSw/
 B/ZYTpr4PkBctaWLDIPd7vg=
X-Google-Smtp-Source: ABdhPJzH7CHMFcc+K9iLXDfzCQcZj0FD0EC7+Xx0gEPwk5zV74ACHySlwPoeHNJLm5GIfuZAaAWK+g==
X-Received: by 2002:a7b:c107:: with SMTP id w7mr2889508wmi.91.1631690949332;
 Wed, 15 Sep 2021 00:29:09 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id n4sm13146397wra.37.2021.09.15.00.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:29:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 26/53] target/tricore: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-27-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e48dabea-99c4-5ff6-92c2-262487b87ca5@amsat.org>
Date: Wed, 15 Sep 2021 09:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-27-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
X-List-Received-Date: Wed, 15 Sep 2021 07:29:16 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/tricore/cpu.c       |  2 +-
>  target/tricore/cpu.h       |  2 +-
>  target/tricore/translate.c | 24 ++++++++++++------------
>  3 files changed, 14 insertions(+), 14 deletions(-)

> -void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void tricore_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      TriCoreCPU *cpu = TRICORE_CPU(cs);
>      CPUTriCoreState *env = &cpu->env;
> @@ -95,26 +95,26 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  
>      psw = psw_read(env);
>  
> -    qemu_fprintf(f, "PC: " TARGET_FMT_lx, env->PC);
> -    qemu_fprintf(f, " PSW: " TARGET_FMT_lx, psw);
> -    qemu_fprintf(f, " ICR: " TARGET_FMT_lx, env->ICR);
> -    qemu_fprintf(f, "\nPCXI: " TARGET_FMT_lx, env->PCXI);
> -    qemu_fprintf(f, " FCX: " TARGET_FMT_lx, env->FCX);
> -    qemu_fprintf(f, " LCX: " TARGET_FMT_lx, env->LCX);
> +    g_string_append_printf(buf, "PC: " TARGET_FMT_lx, env->PC);
> +    g_string_append_printf(buf, " PSW: " TARGET_FMT_lx, psw);
> +    g_string_append_printf(buf, " ICR: " TARGET_FMT_lx, env->ICR);
> +    g_string_append_printf(buf, "\nPCXI: " TARGET_FMT_lx, env->PCXI);
> +    g_string_append_printf(buf, " FCX: " TARGET_FMT_lx, env->FCX);
> +    g_string_append_printf(buf, " LCX: " TARGET_FMT_lx, env->LCX);
>  
>      for (i = 0; i < 16; ++i) {
>          if ((i & 3) == 0) {
> -            qemu_fprintf(f, "\nGPR A%02d:", i);
> +            g_string_append_printf(buf, "\nGPR A%02d:", i);
>          }
> -        qemu_fprintf(f, " " TARGET_FMT_lx, env->gpr_a[i]);
> +        g_string_append_printf(buf, " " TARGET_FMT_lx, env->gpr_a[i]);
>      }
>      for (i = 0; i < 16; ++i) {
>          if ((i & 3) == 0) {
> -            qemu_fprintf(f, "\nGPR D%02d:", i);
> +            g_string_append_printf(buf, "\nGPR D%02d:", i);
>          }
> -        qemu_fprintf(f, " " TARGET_FMT_lx, env->gpr_d[i]);
> +        g_string_append_printf(buf, " " TARGET_FMT_lx, env->gpr_d[i]);
>      }
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

g_string_append_c(), otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  }
>  
>  /*
> 

