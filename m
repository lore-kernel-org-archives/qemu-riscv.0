Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPQs-0001O6-2B
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPQh-0001Lg-3L; Wed, 15 Sep 2021 03:34:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPQf-0003Zr-D8; Wed, 15 Sep 2021 03:34:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id y132so1381126wmc.1;
 Wed, 15 Sep 2021 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/fnaAOh9p4p4wc129sOXgPIxvFnAnZYJvtoB3c8uF9k=;
 b=Ee0E7i9/CLXT3s/wHkSIGvqoE3nPYVxCL0dd8m7srTteWQ6iqEH9DSH1Ayt4yH06hZ
 P/53yMCRl1lZ5nidPzNHips2d0CNKkZ/ir6tn7xRHdDR2hNwSsyIBQJ2ND1I/fRvdBW7
 NtnBvHswfFjQBQGS6iwjJnYhqNr+OJFnnIIkpFg/3Ut7CK9Ba3JJAWhfA13bioAZJHJS
 yccWbIRKYGR+UUasJZrNVznXEKM1K3Fp8Eu/2cW0w/SzKzcYGX+UwqwlG2bmY4OaRQ4a
 6p42G31yu/MgJFy1nMprRNT62Me0McDXt//TlzJU2HkholRAdqwgAiUVK3oEBdcUTMxc
 BDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/fnaAOh9p4p4wc129sOXgPIxvFnAnZYJvtoB3c8uF9k=;
 b=DFBITmtvSfTlRk6gNAgqcq7f7DiJYGqLJm9j2jxPlodoGzX95WJL9XobnAJeS5ljcF
 hawEe0/fJSwofh/fGvxEQFGc6wwpDIV39vwin3INabZjGpU49AUq66u1KA9G2ktAMv1I
 4i8+5sAuyPcpE5C2IwWhfRNpKHyenO2kcjtigiFWgccuisxgnxQTK05I/5Mn1FklmRLr
 yVKXaP+vgXiFKOwJ/nAo671isa/5ctrcCubBuqWHj33aloySwtQDSNOD1X+XioMJtIVY
 lS3x9ryZ+hTvGl4fnD7mmSaqWfRaCip0/jvl7qUizBEoIawo2CKtLeqkY5bU4BAcjS6i
 FH0Q==
X-Gm-Message-State: AOAM532//YBW+DNBKhmN/HI2irOBHIVwMcoNYOsn3e02i/9DA+/+Tn6E
 myYstDWouqa1zYXUjXjuBwk=
X-Google-Smtp-Source: ABdhPJyCTlxmuD7rWTLJwH1adpYsfO3LLn8q9FCWuFm/4JqqqqXqg/qXd0Um+RZmTPhrubIbz8E7aQ==
X-Received: by 2002:a1c:403:: with SMTP id 3mr2853133wme.161.1631691238156;
 Wed, 15 Sep 2021 00:33:58 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id v28sm12754903wrv.93.2021.09.15.00.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:33:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 10/53] target/cris: convert to use format_state instead
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
 <20210914142042.1655100-11-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eecfb79d-6e49-4e6e-df11-f54dad16f4f1@amsat.org>
Date: Wed, 15 Sep 2021 09:33:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-11-berrange@redhat.com>
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
X-List-Received-Date: Wed, 15 Sep 2021 07:34:11 -0000

On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/cris/cpu.c       |  2 +-
>  target/cris/cpu.h       |  2 +-
>  target/cris/translate.c | 33 +++++++++++++++++----------------
>  3 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 70932b1f8c..5159cf6528 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -295,7 +295,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>  
>      cc->class_by_name = cris_cpu_class_by_name;
>      cc->has_work = cris_cpu_has_work;
> -    cc->dump_state = cris_cpu_dump_state;
> +    cc->format_state = cris_cpu_format_state;
>      cc->set_pc = cris_cpu_set_pc;
>      cc->gdb_read_register = cris_cpu_gdb_read_register;
>      cc->gdb_write_register = cris_cpu_gdb_write_register;
> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index d3b6492909..908cb051da 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -191,7 +191,7 @@ void cris_cpu_do_interrupt(CPUState *cpu);
>  void crisv10_cpu_do_interrupt(CPUState *cpu);
>  bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  
> -void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
> +void cris_cpu_format_state(CPUState *cs, GString *buf, int flags);
>  
>  hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index a84b753349..6098693186 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -3307,7 +3307,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>      translator_loop(&cris_tr_ops, &dc.base, cs, tb, max_insns);
>  }
>  
> -void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void cris_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      CRISCPU *cpu = CRIS_CPU(cs);
>      CPUCRISState *env = &cpu->env;
> @@ -3326,40 +3326,41 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>          regnames = regnames_v32;
>      }
>  
> -    qemu_fprintf(f, "PC=%x CCS=%x btaken=%d btarget=%x\n"
> -                 "cc_op=%d cc_src=%d cc_dest=%d cc_result=%x cc_mask=%x\n",
> -                 env->pc, env->pregs[PR_CCS], env->btaken, env->btarget,
> -                 env->cc_op,
> -                 env->cc_src, env->cc_dest, env->cc_result, env->cc_mask);
> +    g_string_append_printf(buf, "PC=%x CCS=%x btaken=%d btarget=%x\n"
> +                           "cc_op=%d cc_src=%d cc_dest=%d cc_result=%x "
> +                           "cc_mask=%x\n",
> +                           env->pc, env->pregs[PR_CCS], env->btaken,
> +                           env->btarget, env->cc_op, env->cc_src,
> +                           env->cc_dest, env->cc_result, env->cc_mask);
>  
>  
>      for (i = 0; i < 16; i++) {
> -        qemu_fprintf(f, "%s=%8.8x ", regnames[i], env->regs[i]);
> +        g_string_append_printf(buf, "%s=%8.8x ", regnames[i], env->regs[i]);
>          if ((i + 1) % 4 == 0) {
> -            qemu_fprintf(f, "\n");
> +            g_string_append_printf(buf, "\n");

g_string_append_c() (various).

>          }
>      }
> -    qemu_fprintf(f, "\nspecial regs:\n");
> +    g_string_append_printf(buf, "\nspecial regs:\n");
>      for (i = 0; i < 16; i++) {
> -        qemu_fprintf(f, "%s=%8.8x ", pregnames[i], env->pregs[i]);
> +        g_string_append_printf(buf, "%s=%8.8x ", pregnames[i], env->pregs[i]);
>          if ((i + 1) % 4 == 0) {
> -            qemu_fprintf(f, "\n");
> +            g_string_append_printf(buf, "\n");
>          }
>      }
>      if (env->pregs[PR_VR] >= 32) {
>          uint32_t srs = env->pregs[PR_SRS];
> -        qemu_fprintf(f, "\nsupport function regs bank %x:\n", srs);
> +        g_string_append_printf(buf, "\nsupport function regs bank %x:\n", srs);
>          if (srs < ARRAY_SIZE(env->sregs)) {
>              for (i = 0; i < 16; i++) {
> -                qemu_fprintf(f, "s%2.2d=%8.8x ",
> -                             i, env->sregs[srs][i]);
> +                g_string_append_printf(buf, "s%2.2d=%8.8x ",
> +                                       i, env->sregs[srs][i]);
>                  if ((i + 1) % 4 == 0) {
> -                    qemu_fprintf(f, "\n");
> +                    g_string_append_printf(buf, "\n");
>                  }
>              }
>          }
>      }
> -    qemu_fprintf(f, "\n\n");
> +    g_string_append_printf(buf, "\n\n");
>  
>  }
>  
> 

