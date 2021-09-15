Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQP6j-0006Ys-4p
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP6g-0006W5-TK; Wed, 15 Sep 2021 03:13:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP6f-00033g-Aq; Wed, 15 Sep 2021 03:13:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so3953010wmq.1; 
 Wed, 15 Sep 2021 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mNwSu+kUspt5PCTCQfuHixpJsNS83pAKDHXHrua3Iu8=;
 b=Cekt8+9dK7QWjccTG5TVr7I4FwKjp6TfU0B3KGebhcl6DvbJ2RO7O9xZm2sSqlH1HZ
 xxC2B6Fl6KGbKZGXKWoP1EMzRYMN2KPQMVbOeYrF5KiCIuHpbQg2MBnZiWSJpc3+FPJe
 cFtQN47EXKrgF+XLR2bcH5dBFgdMaRxvgyEe4spZ/I72GpP1wHhqwLrcYOdPHwwtL96N
 MTHjS+/tq9XdDrC7UMohFdr52H+qEfaZtUA101q64NvZJYrnYybTZvAW7aaNPGNWTuaG
 ZmdrX3t2QCJ7l+kWEbtSXqH4CbcrZuHWZrbuYEuHlz6ecEf1tpEGzK47kYkVVSESCgu7
 oqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mNwSu+kUspt5PCTCQfuHixpJsNS83pAKDHXHrua3Iu8=;
 b=hOoytWJRCBwBz7sJol8r0MicbMkGKTmjkB/jw2UUAB6I4lilmIateouBMCautAp0C2
 O/yCgJxHZswVdOh3TXhnSy1amWEpy073mxaN93l4qh8/X31aT4+iQgB9EUqAdPzdvrFo
 jhWcA83M+yaCSlNSVa0MP0VNeNUQDjPg75xq9UEptLyqG3oFnzBv1hS7uGRviVU+qOxV
 PJmLiLEu7ZwMy7qzry4CHBYJuAmTbkMLp7zLX9o5XkxStbjxwNOog3P07h3tb/mZ9TQz
 hDX9jIXYeD00geYVfsQoTSoGmJwozzKqTphKZlxi6ak/evjbV9j3jX2yWuHCdh5InN63
 N/Wg==
X-Gm-Message-State: AOAM531ALDflB7zHiwvqSnSk4m41jRtT1uE6Klt2O4/lIVNNXjqGQLex
 GpbW7FTxuVjprYOeAz3VbDE=
X-Google-Smtp-Source: ABdhPJxKo4qpfw04dTQ9LK2HjwcGoHcR0UcEvrQA++39HCEggpmaMgqwRQ9B2A1KTEeO+RXfknFyIw==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr2776681wmq.97.1631689997660; 
 Wed, 15 Sep 2021 00:13:17 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k4sm3302188wmj.30.2021.09.15.00.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:13:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 09/53] target/avr: convert to use format_state instead
 of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
 <20210914142042.1655100-10-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e0ca8f7b-0e88-4548-1b24-2a3b79e56ad5@amsat.org>
Date: Wed, 15 Sep 2021 09:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-10-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:13:23 -0000

On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/avr/cpu.c | 57 ++++++++++++++++++++++++------------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index ea14175ca5..17ff21f8be 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -145,43 +145,44 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
>      return oc;
>  }
>  
> -static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +static void avr_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      AVRCPU *cpu = AVR_CPU(cs);
>      CPUAVRState *env = &cpu->env;
>      int i;
>  
> -    qemu_fprintf(f, "\n");
> -    qemu_fprintf(f, "PC:    %06x\n", env->pc_w * 2); /* PC points to words */
> -    qemu_fprintf(f, "SP:      %04x\n", env->sp);
> -    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
> -    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
> -    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
> -    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
> -    qemu_fprintf(f, "EIND:      %02x\n", env->eind >> 16);
> -    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
> -    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
> -    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
> -    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
> -                 env->sregI ? 'I' : '-',
> -                 env->sregT ? 'T' : '-',
> -                 env->sregH ? 'H' : '-',
> -                 env->sregS ? 'S' : '-',
> -                 env->sregV ? 'V' : '-',
> -                 env->sregN ? '-' : 'N', /* Zf has negative logic */
> -                 env->sregZ ? 'Z' : '-',
> -                 env->sregC ? 'I' : '-');
> -    qemu_fprintf(f, "SKIP:    %02x\n", env->skip);
> -
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

This would be g_string_append_c(buf, '\n') but in this particular case
it doesn't seem helpful so I'd directly remove it.

> +    /* PC points to words */
> +    g_string_append_printf(buf, "PC:    %06x\n", env->pc_w * 2);
> +    g_string_append_printf(buf, "SP:      %04x\n", env->sp);
> +    g_string_append_printf(buf, "rampD:     %02x\n", env->rampD >> 16);
> +    g_string_append_printf(buf, "rampX:     %02x\n", env->rampX >> 16);
> +    g_string_append_printf(buf, "rampY:     %02x\n", env->rampY >> 16);
> +    g_string_append_printf(buf, "rampZ:     %02x\n", env->rampZ >> 16);
> +    g_string_append_printf(buf, "EIND:      %02x\n", env->eind >> 16);
> +    g_string_append_printf(buf, "X:       %02x%02x\n", env->r[27], env->r[26]);
> +    g_string_append_printf(buf, "Y:       %02x%02x\n", env->r[29], env->r[28]);
> +    g_string_append_printf(buf, "Z:       %02x%02x\n", env->r[31], env->r[30]);
> +    g_string_append_printf(buf, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
> +                           env->sregI ? 'I' : '-',
> +                           env->sregT ? 'T' : '-',
> +                           env->sregH ? 'H' : '-',
> +                           env->sregS ? 'S' : '-',
> +                           env->sregV ? 'V' : '-',
> +                           env->sregN ? '-' : 'N', /* Zf has negative logic */
> +                           env->sregZ ? 'Z' : '-',
> +                           env->sregC ? 'I' : '-');
> +    g_string_append_printf(buf, "SKIP:    %02x\n", env->skip);
> +
> +    g_string_append_printf(buf, "\n");
>      for (i = 0; i < ARRAY_SIZE(env->r); i++) {
> -        qemu_fprintf(f, "R[%02d]:  %02x   ", i, env->r[i]);
> +        g_string_append_printf(buf, "R[%02d]:  %02x   ", i, env->r[i]);
>  
>          if ((i % 8) == 7) {
> -            qemu_fprintf(f, "\n");
> +            g_string_append_printf(buf, "\n");
>          }
>      }
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

Ditto (remove).

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  }

