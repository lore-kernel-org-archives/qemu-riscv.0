Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQP29-0008I3-Uh
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP28-0008E3-Ik; Wed, 15 Sep 2021 03:08:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP26-0007XJ-SH; Wed, 15 Sep 2021 03:08:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id i23so2204487wrb.2;
 Wed, 15 Sep 2021 00:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TTa9uo2TCajZE3FSNA8UqaFzyWQGAg5xP5gbL7bXik8=;
 b=KbiIMy5huJJ2hiLsdFfK7lEdFPnjyUKgRmgjhcxLRmz6KeYD4H9zWOZbf6LTBzHG9O
 2eeKSiiJirJax8toCGlfNaMYloQQ/qcGn2X/JfWerB1JqEuWjx50BQae1Bw9AzjVvl7l
 rIBVgCIIc4zzsUWpsSHTa7twlG9hRkS06sL7BHyQlADPGvLGNGDkzDhg6vsOVPmz0hS0
 WXnSpwuzZJwh17rM7RZoY2iw46cY2TiZXRg0gcyGomeL+ghOeh9bWR9s4j2wxYD7jbqF
 KbZueIZTB+5HJe1wZRAKv80iuZeKM15bendU51ZcZLO3fNhSKbsjMBMYOr3UEdwIFgmK
 kZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TTa9uo2TCajZE3FSNA8UqaFzyWQGAg5xP5gbL7bXik8=;
 b=M0HDH7M0IVUzsZDUa+X5WW21i4AIE3rcnitm2mck9nxezP2vr+8Ew3G7PGXq4kit9F
 LfvmtsJDgnmubOl558cQgOQX0u897mP9n4zOxij1C49q3VVlMpmuR4TMiJ6gzs9qplE7
 S8yVblYmT6sNLYBVMnvZ5LvnVntzhIkgYKl6cLPO2PcYWbRX5SjOB4h9F+0C3QETi5K4
 5o27euBaxuAqTLMVk3d4JWdIMYS2VeAUPCqWkSWMopys/mnZCAvkWBgTr7DQY1+Ex6f2
 Vzfowx8d8i0zo/XAF2d1gmtsDjJsc/npBiHCiUPJNYbxVV8ltQ83eSwjuQ06Kn/+sCOE
 Er/A==
X-Gm-Message-State: AOAM533fiBR4v/xquBBQ1NyLEuKqB4CMUPAF6FBq6hK4ygubuiN/LbCO
 telZLlN+BF7M2tKUbXpNSHQ=
X-Google-Smtp-Source: ABdhPJzomwuw4m77MS7fU+5UEPdy6VfPolqjbEqS6+la/iP9Zuw6/MKEgXXhKa5+Gkcw5V0+pFaaRg==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr3278648wrr.92.1631689716042; 
 Wed, 15 Sep 2021 00:08:36 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q11sm3342323wmc.41.2021.09.15.00.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:08:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 18/53] target/nios2: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
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
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-19-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75599bfa-3a95-0dc9-dca9-de894e7c0e75@amsat.org>
Date: Wed, 15 Sep 2021 09:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-19-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:08:41 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/nios2/cpu.c       |  2 +-
>  target/nios2/cpu.h       |  2 +-
>  target/nios2/translate.c | 20 ++++++++++----------
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 5e37defef8..cbf15fb1c9 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -241,7 +241,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
>  
>      cc->class_by_name = nios2_cpu_class_by_name;
>      cc->has_work = nios2_cpu_has_work;
> -    cc->dump_state = nios2_cpu_dump_state;
> +    cc->format_state = nios2_cpu_format_state;
>      cc->set_pc = nios2_cpu_set_pc;
>      cc->disas_set_info = nios2_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 2ab82fdc71..3b16cd1f3c 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -195,7 +195,7 @@ void nios2_tcg_init(void);
>  void nios2_cpu_do_interrupt(CPUState *cs);
>  int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
>  void dump_mmu(CPUNios2State *env);
> -void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> +void nios2_cpu_format_state(CPUState *cpu, GString *buf, int flags);
>  hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                     MMUAccessType access_type,
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 08d7ac5398..a5f0f56e1a 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -855,7 +855,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>      translator_loop(&nios2_tr_ops, &dc.base, cs, tb, max_insns);
>  }
>  
> -void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void nios2_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      Nios2CPU *cpu = NIOS2_CPU(cs);
>      CPUNios2State *env = &cpu->env;
> @@ -865,22 +865,22 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>          return;
>      }
>  
> -    qemu_fprintf(f, "IN: PC=%x %s\n",
> -                 env->regs[R_PC], lookup_symbol(env->regs[R_PC]));
> +    g_string_append_printf(buf, "IN: PC=%x %s\n",
> +                           env->regs[R_PC], lookup_symbol(env->regs[R_PC]));

Note 1:

Interesting to call lookup_symbol() in dump_state(). Other targets
could do that too, but even better doing this in cpu_format_state().

Note 2:

format_state() doesn't belong to translate.c IMO and should be moved
to cpu.c.

Anyhow, unrelated to your patch, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

