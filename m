Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHtvq-0002mF-RI
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 14:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHtvp-0002ln-5R; Thu, 04 Mar 2021 14:46:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHtvm-0001HV-It; Thu, 04 Mar 2021 14:46:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j2so16121347wrx.9;
 Thu, 04 Mar 2021 11:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t276LUinFqdo3UZ05DHKy95/FXYpuFynT6Qlz+DIzoA=;
 b=IBM3qGDjAp6Y43GT8RuOPXswxLMlTX13skt/D9AqMo9eI/Mx1S8Ksjl4nFHRfFSL86
 i06NIzE0f25e2X1JurUZwWmvWVseSi4XXG314vY7aWS+wdnrXHEM8/SxkthOZ5YTme+U
 fYlOjnf3bxJ72q+izvXbW4Q/haIaYoDX1PlR2WUoBjMhq3KFtEg/K/yovK15pPP98nFb
 WUYf1h11coSybMRF1/InwkY6H0s1DI60LV/bx1TdDS04FbuJnP13bo2emwtdlbSTKTJe
 NOQTY/KwP6I2VBscAmyzXkDt6L1gkhSprvBe9Lp7QPKsIGMwUQIQXzlfkakOH63QjfFf
 k1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t276LUinFqdo3UZ05DHKy95/FXYpuFynT6Qlz+DIzoA=;
 b=oBOOE2V/JSc831HeaNLWpxQhvZcyS0iqHgl6QQpmF8tIr5epSKcXvpdL9YQUmmx/Yk
 GBLDXQkYxj3CANfBlirMMsp9iXI6jjUSBEeq1E87TNb0bYfim7sRm37TwCxoqt6hhEpS
 ychMiTqBVLaRpfpirojM4gymcIO8kx8Bw5rANqgucVrhEkifJpsysC89gdzvXoX1D9L4
 yKl0iZ/W5mbY5ZhEMetSh87nqJ7kn7qCcp/W2ORLB/htjGk1UrH/V9xryBKx464dtTC0
 HpTFA8c0syygQzyS17+je8CLryp656lKnVYZaWTPS1qHwqHVIuRKnNj74mB0knGqKYz9
 ms4A==
X-Gm-Message-State: AOAM531Qerl+QcU/6wVd3WPrZAjQOcAhza8F1gIEa1NQmJOMKMMvx0/z
 GtF/zQ4PHJX+xGhOqdke6Bw=
X-Google-Smtp-Source: ABdhPJzuOv+iV476B/IIsEpBxciH11svCwJSOzkl+9CGn1Dkqq5TPLk4DqUoVzEOr5EG4TYAXEcREg==
X-Received: by 2002:a05:6000:1081:: with SMTP id
 y1mr5532805wrw.347.1614887199500; 
 Thu, 04 Mar 2021 11:46:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm740189wmc.33.2021.03.04.11.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:46:38 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH 6/7] cpu: Move CPUClass::has_work() to TCGCPUOps
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302102737.1031287-1-f4bug@amsat.org>
 <20210302102737.1031287-7-f4bug@amsat.org>
 <dfda927b-8937-afe2-f853-5c9817499c4a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <421b6c9e-9128-bf09-bf3e-b04101b6f11d@amsat.org>
Date: Thu, 4 Mar 2021 20:46:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dfda927b-8937-afe2-f853-5c9817499c4a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 04 Mar 2021 19:46:45 -0000

On 3/4/21 7:15 AM, Thomas Huth wrote:
> On 02/03/2021 11.27, Philippe Mathieu-Daudé wrote:
>> We can only check if a vCPU has work with TCG.
>> Restrict the has_work() handler to TCG by moving it to
>> the TCGCPUOps structure, and adapt all the targets.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> RFC: PPC target incomplete
>> ---
> [...]
>> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
>> index 00330ba07de..3110867c3a3 100644
>> --- a/hw/core/cpu.c
>> +++ b/hw/core/cpu.c
>> @@ -261,11 +261,6 @@ static void cpu_common_reset(DeviceState *dev)
>>       }
>>   }
>>   -static bool cpu_common_has_work(CPUState *cs)
>> -{
>> -    return false;
>> -}
>> -
>>   ObjectClass *cpu_class_by_name(const char *typename, const char
>> *cpu_model)
>>   {
>>       CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
>> @@ -397,7 +392,6 @@ static void cpu_class_init(ObjectClass *klass,
>> void *data)
>>         k->parse_features = cpu_common_parse_features;
>>       k->get_arch_id = cpu_common_get_arch_id;
>> -    k->has_work = cpu_common_has_work;
>>       k->get_paging_enabled = cpu_common_get_paging_enabled;
>>       k->get_memory_mapping = cpu_common_get_memory_mapping;
>>       k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
> 
> cpu_common_has_work() is gone without replacement? Can you be sure that
> the pointer in tcg_ops is always initialized?

Oops... Good catch :)

