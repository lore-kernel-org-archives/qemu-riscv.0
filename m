Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPKN-0001pT-Ey
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPKK-0001kV-JJ; Wed, 15 Sep 2021 03:27:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPKG-0006CD-SJ; Wed, 15 Sep 2021 03:27:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id t18so2334353wrb.0;
 Wed, 15 Sep 2021 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dlGA5An5g4mHXwL+BRG4hDu5H6xl9lr3S6q7qvPcvho=;
 b=EuF3Ue/xBpMnAJy6QwSDpI6k8DTctBQXJlDNtn4YecemQwfazwp+zOeV/wFbzS0ie/
 kGr00ixPtu1BnM89hG8+kNklDub9NSWQ1b1PcjWAtYSZ9+kEkdj8L0DIlF6kndJVRK5F
 3Urjf38SNbaL1Un0l3i7hrA3n2BuIEDF3rmZjn1Anp+hl3FbzZxG1o6gww7JoiphoF+v
 QPL7KW01dGO48KDyJ1xKfyi7KSph+M4JhJU+J7gRpdgMitobE/4fOnTu2G4dUD4eSyLH
 duTB9FnepifTdAcsd/GK1P8MEGe1CFfxMP3MR95GU6cAgFzkl/33wPqkYGbfp0YFovVs
 NHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dlGA5An5g4mHXwL+BRG4hDu5H6xl9lr3S6q7qvPcvho=;
 b=nOHAI36bNKA/SlpLEaxoIbEEHT5AWF0eEH9EA5k9nDRPp1dgrDGZ+JUibQjNpgCS9V
 4BzjfETejAOG+e7AkPn3rjb9kUD/5QdQFqvP0cKENNSvuVoU+f9oRYQ8UyDP4Kydkdl1
 AeQHeKeBczF1dM1rC6tEvfzsXfNPK/N2beHcYzpEu8GD83UOGgAD9Y0uYilsw2q7KSMd
 eCyx8LH5ybkzw2AtV45RAwWBoC+kpuJ6j3MsRsile4tCw9gRQf/HR97YXuKvoGZF1wHU
 jx2yAbLn38P9Qv9LtZEm7LxsEM+M5RylpcmK+Q/AFnJVBQK6IYg8lZl1c8WioQ9GzTkq
 i7Dg==
X-Gm-Message-State: AOAM533EVy6F5EmNgRnYxrPLHyPR6aF9FFqNSfmiCmfJFKs636DFADpL
 sNPuNfwmcWUVLxBubInukf8=
X-Google-Smtp-Source: ABdhPJxEMoJ9rplz4bScCjfxnHbPTrTCizcR9kAwYUw4z/nTrRN4zyfPbyJjDBP9w0IxwtQ/VapEZA==
X-Received: by 2002:a5d:5246:: with SMTP id k6mr3172395wrc.431.1631690842285; 
 Wed, 15 Sep 2021 00:27:22 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id c15sm13253799wrc.83.2021.09.15.00.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:27:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 25/53] target/sparc: convert to use format_state
 instead of dump_state
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
 <20210914142042.1655100-26-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb6eecbd-44e0-a0da-5ac1-df96e5d9efba@amsat.org>
Date: Wed, 15 Sep 2021 09:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-26-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:27:29 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/sparc/cpu.c | 85 +++++++++++++++++++++++++---------------------
>  target/sparc/cpu.h |  2 +-
>  2 files changed, 47 insertions(+), 40 deletions(-)
> 
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec74..9346a79239 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -597,11 +597,11 @@ void sparc_cpu_list(void)
>                  "fpu_version mmu_version nwindows\n");
>  }
>  
> -static void cpu_print_cc(FILE *f, uint32_t cc)
> +static void cpu_print_cc(GString *buf, uint32_t cc)

Rename as cpu_format_cc().

>  {
> -    qemu_fprintf(f, "%c%c%c%c", cc & PSR_NEG ? 'N' : '-',
> -                 cc & PSR_ZERO ? 'Z' : '-', cc & PSR_OVF ? 'V' : '-',
> -                 cc & PSR_CARRY ? 'C' : '-');
> +    g_string_append_printf(buf, "%c%c%c%c", cc & PSR_NEG ? 'N' : '-',
> +                           cc & PSR_ZERO ? 'Z' : '-', cc & PSR_OVF ? 'V' : '-',
> +                           cc & PSR_CARRY ? 'C' : '-');
>  }
>  
>  #ifdef TARGET_SPARC64
> @@ -610,34 +610,36 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
>  #define REGS_PER_LINE 8
>  #endif
>  
> -void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void sparc_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      SPARCCPU *cpu = SPARC_CPU(cs);
>      CPUSPARCState *env = &cpu->env;
>      int i, x;
>  
> -    qemu_fprintf(f, "pc: " TARGET_FMT_lx "  npc: " TARGET_FMT_lx "\n", env->pc,
> -                 env->npc);
> +    g_string_append_printf(buf,
> +                           "pc: " TARGET_FMT_lx "  npc: " TARGET_FMT_lx "\n",
> +                           env->pc, env->npc);
>  
>      for (i = 0; i < 8; i++) {
>          if (i % REGS_PER_LINE == 0) {
> -            qemu_fprintf(f, "%%g%d-%d:", i, i + REGS_PER_LINE - 1);
> +            g_string_append_printf(buf, "%%g%d-%d:", i, i + REGS_PER_LINE - 1);
>          }
> -        qemu_fprintf(f, " " TARGET_FMT_lx, env->gregs[i]);
> +        g_string_append_printf(buf, " " TARGET_FMT_lx, env->gregs[i]);
>          if (i % REGS_PER_LINE == REGS_PER_LINE - 1) {
> -            qemu_fprintf(f, "\n");
> +            g_string_append_printf(buf, "\n");

g_string_append_c()

>          }
>      }
>      for (x = 0; x < 3; x++) {
>          for (i = 0; i < 8; i++) {
>              if (i % REGS_PER_LINE == 0) {
> -                qemu_fprintf(f, "%%%c%d-%d: ",
> +                g_string_append_printf(buf, "%%%c%d-%d: ",
>                               x == 0 ? 'o' : (x == 1 ? 'l' : 'i'),
>                               i, i + REGS_PER_LINE - 1);
>              }
> -            qemu_fprintf(f, TARGET_FMT_lx " ", env->regwptr[i + x * 8]);
> +            g_string_append_printf(buf, TARGET_FMT_lx " ",
> +                                   env->regwptr[i + x * 8]);
>              if (i % REGS_PER_LINE == REGS_PER_LINE - 1) {
> -                qemu_fprintf(f, "\n");
> +                g_string_append_printf(buf, "\n");

g_string_append_c()

>              }
>          }
>      }
> @@ -645,42 +647,47 @@ void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      if (flags & CPU_DUMP_FPU) {
>          for (i = 0; i < TARGET_DPREGS; i++) {
>              if ((i & 3) == 0) {
> -                qemu_fprintf(f, "%%f%02d: ", i * 2);
> +                g_string_append_printf(buf, "%%f%02d: ", i * 2);
>              }
> -            qemu_fprintf(f, " %016" PRIx64, env->fpr[i].ll);
> +            g_string_append_printf(buf, " %016" PRIx64, env->fpr[i].ll);
>              if ((i & 3) == 3) {
> -                qemu_fprintf(f, "\n");
> +                g_string_append_printf(buf, "\n");

g_string_append_c()

>              }
>          }
>      }
>  
>  #ifdef TARGET_SPARC64
> -    qemu_fprintf(f, "pstate: %08x ccr: %02x (icc: ", env->pstate,
> +    g_string_append_printf(buf, "pstate: %08x ccr: %02x (icc: ", env->pstate,
>                   (unsigned)cpu_get_ccr(env));
> -    cpu_print_cc(f, cpu_get_ccr(env) << PSR_CARRY_SHIFT);
> -    qemu_fprintf(f, " xcc: ");
> -    cpu_print_cc(f, cpu_get_ccr(env) << (PSR_CARRY_SHIFT - 4));
> -    qemu_fprintf(f, ") asi: %02x tl: %d pil: %x gl: %d\n", env->asi, env->tl,
> -                 env->psrpil, env->gl);
> -    qemu_fprintf(f, "tbr: " TARGET_FMT_lx " hpstate: " TARGET_FMT_lx " htba: "
> -                 TARGET_FMT_lx "\n", env->tbr, env->hpstate, env->htba);
> -    qemu_fprintf(f, "cansave: %d canrestore: %d otherwin: %d wstate: %d "
> -                 "cleanwin: %d cwp: %d\n",
> -                 env->cansave, env->canrestore, env->otherwin, env->wstate,
> -                 env->cleanwin, env->nwindows - 1 - env->cwp);
> -    qemu_fprintf(f, "fsr: " TARGET_FMT_lx " y: " TARGET_FMT_lx " fprs: "
> -                 TARGET_FMT_lx "\n", env->fsr, env->y, env->fprs);
> +    cpu_print_cc(buf, cpu_get_ccr(env) << PSR_CARRY_SHIFT);
> +    g_string_append_printf(buf, " xcc: ");
> +    cpu_print_cc(buf, cpu_get_ccr(env) << (PSR_CARRY_SHIFT - 4));
> +    g_string_append_printf(buf, ") asi: %02x tl: %d pil: %x gl: %d\n",
> +                           env->asi, env->tl, env->psrpil, env->gl);
> +    g_string_append_printf(buf, "tbr: " TARGET_FMT_lx " hpstate: "
> +                           TARGET_FMT_lx " htba: " TARGET_FMT_lx "\n",
> +                           env->tbr, env->hpstate, env->htba);
> +    g_string_append_printf(buf, "cansave: %d canrestore: %d "
> +                           "otherwin: %d wstate: %d "
> +                           "cleanwin: %d cwp: %d\n",
> +                           env->cansave, env->canrestore,
> +                           env->otherwin, env->wstate,
> +                           env->cleanwin, env->nwindows - 1 - env->cwp);
> +    g_string_append_printf(buf, "fsr: " TARGET_FMT_lx " y: "
> +                           TARGET_FMT_lx " fprs: " TARGET_FMT_lx "\n",
> +                           env->fsr, env->y, env->fprs);
>  
>  #else
> -    qemu_fprintf(f, "psr: %08x (icc: ", cpu_get_psr(env));
> -    cpu_print_cc(f, cpu_get_psr(env));
> -    qemu_fprintf(f, " SPE: %c%c%c) wim: %08x\n", env->psrs ? 'S' : '-',
> -                 env->psrps ? 'P' : '-', env->psret ? 'E' : '-',
> -                 env->wim);
> -    qemu_fprintf(f, "fsr: " TARGET_FMT_lx " y: " TARGET_FMT_lx "\n",
> -                 env->fsr, env->y);
> +    g_string_append_printf(buf, "psr: %08x (icc: ", cpu_get_psr(env));
> +    cpu_print_cc(buf, cpu_get_psr(env));
> +    g_string_append_printf(buf, " SPE: %c%c%c) wim: %08x\n",
> +                           env->psrs ? 'S' : '-',
> +                           env->psrps ? 'P' : '-', env->psret ? 'E' : '-',
> +                           env->wim);
> +    g_string_append_printf(buf, "fsr: " TARGET_FMT_lx " y: " TARGET_FMT_lx "\n",
> +                           env->fsr, env->y);
>  #endif
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

We probably don't need this last newline anymore.

>  }
>  

