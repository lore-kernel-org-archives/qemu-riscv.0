Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH4JZ-0007CV-Bf
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 07:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH4JW-0007BC-Qm; Tue, 02 Mar 2021 07:39:47 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH4JT-0002db-Sa; Tue, 02 Mar 2021 07:39:45 -0500
Received: by mail-ej1-x631.google.com with SMTP id c10so8444143ejx.9;
 Tue, 02 Mar 2021 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+NWh4Tc/XdSn8Qq77mR5lZao8A1L6u/GyMsngJwmnRg=;
 b=PbqUTNj0IlJhbz/3QpXXpFh9vXNQ3ITD/0pcxTfHgT05Bxz+y1Oaqw1QkRG5Qzvjmb
 WkrNtGHh0XdHa2ldQh3ApsyBE1zAUI6WmvauJsA+uTmvygSRfcS8Dn98zRVgJoNWXP6m
 Bi5IFIu4sNhtyvQMk4fTvBTl2dRAXUXLvmDHhzeAizjzJMorxvYG7WT1C4uya4n6lLZ1
 Os9Xg6p9dv8sW9V6/wv+tFOKsDCzeVPU6AGMO8YBNUJPTuDxDCW6teI2NOQzeOu3c4CW
 vFCmeXrgEgYf6nCLZskICqxTjmo0ygrCCjAPjfMHiSX6KlMxaKCxoNSxiIlBbvRzuqJT
 lt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+NWh4Tc/XdSn8Qq77mR5lZao8A1L6u/GyMsngJwmnRg=;
 b=l0d9po5xLT94uBwn3xVk7+OH3xiC/jwBYKxQYNuoJ6G+R3cSWg287tssI+S/tKMYec
 jNYqWkvZHDMwiyLM8WLOwrQt+XomW8uwdLWlJY2bJA28zcu5m8WU77eaTwNP1ysXIaqY
 C/7vigN6STyXUnFAxKf5EBtrcFapGveoULcQM97ROvKxnWnRDfHUPZ40xi3nIrYEth68
 fRJxKGJHFUibVVo22XAGToe+KuFQFW6QbfACa/8hXzBew++ETGhInfG2goRkx5UMztU7
 p83+Gnfu5fvciXHMny4TuBV18ltFXucbirCBnJBleY/QqiYGQWRPi0qgOD6QP4KOi3Wt
 s0LQ==
X-Gm-Message-State: AOAM531QCmCk86ZJSIjlhM5smiQnwBWNDhhlYEcqXN7strNggrUP5gCy
 DSBTw2KAAgVlISZ8ZVNh4bk=
X-Google-Smtp-Source: ABdhPJwdfFS0KoLLRaQhkZqInpGBx6gBSD9fyMXCQ3s2rIsbKaIazRwsT71UAaLKdGkw5wHbA7mwkg==
X-Received: by 2002:a17:907:7014:: with SMTP id
 wr20mr20785096ejb.179.1614688780672; 
 Tue, 02 Mar 2021 04:39:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h12sm18068660edb.70.2021.03.02.04.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 04:39:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 16/17] cpu: Restrict cpu_paging_enabled /
 cpu_get_memory_mapping to sysemu
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210301215110.772346-1-f4bug@amsat.org>
 <20210301215110.772346-17-f4bug@amsat.org>
 <ca78ec13-44fb-723d-3cbc-c15105909dc9@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4cddc3f1-a560-3d3b-6a7b-6a87e3a69150@amsat.org>
Date: Tue, 2 Mar 2021 13:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ca78ec13-44fb-723d-3cbc-c15105909dc9@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 02 Mar 2021 12:39:47 -0000

On 3/2/21 1:34 PM, Claudio Fontana wrote:
> On 3/1/21 10:51 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/core/cpu.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 960846d2b64..d99d3c830dc 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -427,6 +427,8 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
>>  extern bool mttcg_enabled;
>>  #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
>>  
>> +#if !defined(CONFIG_USER_ONLY)
>> +
>>  /**
>>   * cpu_paging_enabled:
>>   * @cpu: The CPU whose state is to be inspected.
>> @@ -444,8 +446,6 @@ bool cpu_paging_enabled(const CPUState *cpu);
>>  void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
>>                              Error **errp);
>>  
>> -#if !defined(CONFIG_USER_ONLY)
>> -
>>  /**
>>   * cpu_write_elf64_note:
>>   * @f: pointer to a function that writes memory to a file
>>
> 
> Hi Philippe,
> 
> this is the only patch where I was able to find an issue.
> 
> Adding any #ifdef CONFIG_USER_ONLY in include/hw/core/cpu.h as far as I experienced, is basically wrong.

Note I'm not strictly "adding" it but moving it.

I agree CONFIG_USER_ONLY shouldn't be used in hw/ (and sent 3 series
to clean this the last days).

> Your use is not causing direct damage, but could be used as a precedent to introduce serious bugs.
> It was the case for me.
> 
> Is there some other header, only included by target-specific code, that you could place these?

I'll think about it, meanwhile we can also drop this patch, it is not
a requisite.

Thanks for your review,

Phil.

