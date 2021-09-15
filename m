Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQQkl-0004Fj-Tp
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 04:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQki-0004EK-U0; Wed, 15 Sep 2021 04:58:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQkh-0008Vi-6L; Wed, 15 Sep 2021 04:58:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4177596wmb.2; 
 Wed, 15 Sep 2021 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eZFL7i8c9qKc9reRulcEYtlBt/zONQyoe4tTRCz55rg=;
 b=NGF3v66UbleUAkyU1K3sl8VO5FVVkJSbBfc259zvkwIEQnIxA6T4aay+QmkOFp3kF1
 3x/qjKol9/9gqEMHPMV24fNDeKtsWCgqOApGV/B9uCk3d0yaauIiXhlJ8vvHPcKN5VwB
 dEBIkhdewRIYWghEoxwYi/gAJegYb8CVxGcpXc8pMveY6fVYrKEZB/FBQ0ev6o/wsqo/
 1fipKwBuQkFWgvtCd+Kcj3GJ2Ffy9fcOcBb4FxWdxiYnLUs2juE/IbaMSZhpBuLukX2E
 zBvepx2yOw+VSY+SzxJ5r/8cB+nRZq962Sp6TIrBxC7p3vmiSxwlL8VpKESgBxELmnsp
 dzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eZFL7i8c9qKc9reRulcEYtlBt/zONQyoe4tTRCz55rg=;
 b=Tz8kTsTEcjSxg1nH9f5O8jk6d62IitYIWrp1sZNWJJaBM5E15bbiDjMJwMgqf0dXVo
 pn+TV3SyLopXIa3GwvCHcP0MO4LHQ/nwtRVQaALqALwwZcMnbsF686R2CMNv+J6RnJk2
 XcT93b+RrGIoqMXh7xOb9nf4Mr93b18T8kt3d/J5CQ6uz6P56YpqxaSzD/ZAHKG2F8Ov
 c/S15MXzhrGFOhFIRDlyEn/MOItgYjClpTjtkslb9zJDMeKPvSpxfaOeOhW1fLmdrpXv
 GAXyB7mu3az8P2qjf1KKYWc5TZ/uiLu6+bgJ5n2d+lelzloRlFVv7I5L0BFkJAYJvW5B
 S12A==
X-Gm-Message-State: AOAM533Jcd1khH9LMpWxHiSVbjQ4B8U4XEKPM7DaZi8rurzwUvd/NUXq
 VqrAG0+IkZ0gLHLvI+NfHHk=
X-Google-Smtp-Source: ABdhPJzW6quBDSPMhbODLSz+WuFicKOsnHLvQdN3Q76pBlwej9qYgs/hLAqV6KPsFD3MenADpSgDZA==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr1090662wms.119.1631696324437; 
 Wed, 15 Sep 2021 01:58:44 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id f3sm3481989wmj.28.2021.09.15.01.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 01:58:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 09/53] target/avr: convert to use format_state instead
 of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-10-berrange@redhat.com>
 <e0ca8f7b-0e88-4548-1b24-2a3b79e56ad5@amsat.org>
 <YUGzkcTjgsTjO5PQ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a2cd1f48-2f9b-4c9c-b44c-1a1e45835f2e@amsat.org>
Date: Wed, 15 Sep 2021 10:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUGzkcTjgsTjO5PQ@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
X-List-Received-Date: Wed, 15 Sep 2021 08:58:50 -0000

On 9/15/21 10:49 AM, Daniel P. Berrangé wrote:
> On Wed, Sep 15, 2021 at 09:13:14AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>  target/avr/cpu.c | 57 ++++++++++++++++++++++++------------------------
>>>  1 file changed, 29 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
>>> index ea14175ca5..17ff21f8be 100644
>>> --- a/target/avr/cpu.c
>>> +++ b/target/avr/cpu.c
>>> @@ -145,43 +145,44 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
>>>      return oc;
>>>  }
>>>  
>>> -static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>> +static void avr_cpu_format_state(CPUState *cs, GString *buf, int flags)
>>>  {
>>>      AVRCPU *cpu = AVR_CPU(cs);
>>>      CPUAVRState *env = &cpu->env;
>>>      int i;
>>>  
>>> -    qemu_fprintf(f, "\n");
>>> -    qemu_fprintf(f, "PC:    %06x\n", env->pc_w * 2); /* PC points to words */
>>> -    qemu_fprintf(f, "SP:      %04x\n", env->sp);
>>> -    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
>>> -    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
>>> -    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
>>> -    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
>>> -    qemu_fprintf(f, "EIND:      %02x\n", env->eind >> 16);
>>> -    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
>>> -    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
>>> -    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
>>> -    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
>>> -                 env->sregI ? 'I' : '-',
>>> -                 env->sregT ? 'T' : '-',
>>> -                 env->sregH ? 'H' : '-',
>>> -                 env->sregS ? 'S' : '-',
>>> -                 env->sregV ? 'V' : '-',
>>> -                 env->sregN ? '-' : 'N', /* Zf has negative logic */
>>> -                 env->sregZ ? 'Z' : '-',
>>> -                 env->sregC ? 'I' : '-');
>>> -    qemu_fprintf(f, "SKIP:    %02x\n", env->skip);
>>> -
>>> -    qemu_fprintf(f, "\n");
>>> +    g_string_append_printf(buf, "\n");
>>
>> This would be g_string_append_c(buf, '\n') but in this particular case
>> it doesn't seem helpful so I'd directly remove it.
> 
> I don't want to change output format of the commands, with exception of
> error reporting, as this is intended to be just refactoring patch, not
> a cleanup patch.

I misread cpu_dump_state(), I thought it was already appending
a newline, but it is not:

@@ -106,6 +106,21 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
     if (cc->dump_state) {
         cpu_synchronize_state(cpu);
         cc->dump_state(cpu, f, flags);
+    } else if (cc->format_state) {
+        g_autoptr(GString) buf = g_string_new("");
+        cpu_synchronize_state(cpu);
+        cc->format_state(cpu, buf, flags);
+        qemu_fprintf(f, "%s", buf->str);

So we are fine.
> I'm not convinced it is worth special casing single byte strings to
> use g_string_append_c either really.

OK. R-b stands ;)

