Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6UpL-0000x1-Qh
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 05:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6UpJ-0000wY-Rw
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 05:53:57 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6UpI-0007xf-87
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 05:53:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id n20so11728484ejh.0
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=leRoeg2JyyWwrLYxvKN6D5nxyvTtDm+03xFPfnxHWR4=;
 b=ms7piSkEX5wizNMNMlbSgpYSab9FfhqiVGRsXM5mE/GVxTg/5BGbvBfd/gd0gIfmdj
 wrOh+2WluZkMVoZctrDC6hg//DgHrgl3WmkO3O9h4Py9HpzTxIRChKL5ahbv+VOfgQYQ
 lrW9QOH7pGiI/TtRM/18a77QyHyGl+2Dv4AUqyNrI/ddGfsLapyxkMrKsx8k5+WYJ+nK
 qzzmZ9z2kQAggG43wiw8r7L+c8QJsd7UBCivff1IqXoQ+S8c9T4I43knKFQZsgBNOb6S
 RWb2PrzYkviqf5WV/MhP5gLU816RRhcMByZLeRoeZ9aXvtuL8g/ZL++wwAbaEHr5QU1U
 Hl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=leRoeg2JyyWwrLYxvKN6D5nxyvTtDm+03xFPfnxHWR4=;
 b=2lQuV17w8ohy0hQUQJ/bPp25YBCDhrX8XZSVxqQ1SLJcPLe9l4POrbY5IqcAg6EE+s
 CBoA9vGaBub8wh/N+n6c9coTmXyVTvRSvRTQQisIaFV1Xqc+Fg+eXh0zWQ36eJeaqccu
 mV8wGxtpP5mpAGI12C7g9UWxbDQcNzUIiS/ccaqS6CsxaHGoOs3K1XHTeLblOu140MgZ
 OduSujrL9DvkuvBpqdzem9TVYcR2yBbvwyKC2rgttdahax/uFDaWH0Bb0IlyyHJORpGP
 rRdzPkJiFdmiHaJOHdYwp3V4kKJR4zQZBS6y0Qq5zoYEtH581bxJNpmjQkaC4AMIrmDL
 m0DQ==
X-Gm-Message-State: ANoB5pmNHyUPJm76u7SC4GjygjZIsHJNwbawAsJ4A1ly+u/cFVGnQRGC
 ngwADrrLiDmdu7SYXn7xUskmhQ==
X-Google-Smtp-Source: AA0mqf5YPVaNbwfFuzorPX7/yxAlszOcV9I9je+uBLG7I0M+RJRx6nQefI9DTP8E9CbPFQQ28dwSmg==
X-Received: by 2002:a17:906:c24f:b0:7c0:c316:6abf with SMTP id
 bl15-20020a170906c24f00b007c0c3166abfmr31269378ejb.50.1671274434740; 
 Sat, 17 Dec 2022 02:53:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05640204c600b004702caff4f6sm1844637edw.73.2022.12.17.02.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 02:53:54 -0800 (PST)
Message-ID: <a7b1a878-7a59-128c-9523-cdcc497526c2@linaro.org>
Date: Sat, 17 Dec 2022 11:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 07/10] target/ppc/internal: Restrict MMU declarations to
 sysemu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-8-philmd@linaro.org>
 <112ddce1-ffc4-d50b-9cc8-72578faba11d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <112ddce1-ffc4-d50b-9cc8-72578faba11d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 10:53:58 -0000

On 17/12/22 01:38, Richard Henderson wrote:
> On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/ppc/internal.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>> index 337a362205..901bae6d39 100644
>> --- a/target/ppc/internal.h
>> +++ b/target/ppc/internal.h
>> @@ -242,9 +242,12 @@ static inline int 
>> prot_for_access_type(MMUAccessType access_type)
>>       g_assert_not_reached();
>>   }
>> +#ifndef CONFIG_USER_ONLY
>> +
>>   /* PowerPC MMU emulation */
>>   typedef struct mmu_ctx_t mmu_ctx_t;
>> +
>>   bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>>                         hwaddr *raddrp, int *psizep, int *protp,
>>                         int mmu_idx, bool guest_visible);
>> @@ -266,6 +269,8 @@ struct mmu_ctx_t {
>>       int nx;                        /* Non-execute area          */
>>   };
>> +#endif /* !CONFIG_USER_ONLY */
> 
> Eh.  I suppose.

I forgot the justification:

'''
The 'hwaddr' type is only available / meaningful on system emulation.
'''

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!


