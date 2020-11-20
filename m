Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kg9Da-0006u4-Ef
	for mharc-qemu-riscv@gnu.org; Fri, 20 Nov 2020 11:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kg9DY-0006r6-Q5; Fri, 20 Nov 2020 11:25:00 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kg9DV-00067k-J3; Fri, 20 Nov 2020 11:25:00 -0500
Received: by mail-pf1-x434.google.com with SMTP id 10so8331053pfp.5;
 Fri, 20 Nov 2020 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oIlBGux0NHQ0QgXRaRHRYv+1fIYxjg8pCsgUppiMSgg=;
 b=tT/IFJOIAjWRO0lnn+qQtsqMPCuNwLiVDf4GD0h+IwG5cVuWmYYAOvIETiN8jPn/L9
 GKOqZOkpvbcpH4xW8MWptfZySxYLv3cjd6t3Y3VAClEREczLo1vmRhWnrZucGNQH9zcM
 zF7aES1U9BW6VxUoAPJ0DCK3cG5fC3k+K3MY4hVwSQb0IQoYxpdT7hK659FaUaLPtkrU
 KmDnERNcCjCacBugrQxh2Q7aYlNMk2t2963ll0ippgcF7gaymmxa+bOAc747ng47UE3L
 QELkFP75sc2mrtQSn50J6Jpv9RJ3TwFiT9q/Bq1Aj+QTAPT9mX13tvL2A0eZP+G0b1ib
 o4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oIlBGux0NHQ0QgXRaRHRYv+1fIYxjg8pCsgUppiMSgg=;
 b=Zyd7cFzT8lN2BkAjYa379zRCVIZbv/fi4KJnjkIurOCPRhFAwRgQPQYFWp6Z/Ki/lr
 1/gBsbcM6h/CaXNdFzBLA/ApgcCLi1aSMUO2wBq3on9X5BHJQpihKNMzOPUW2W85oBbQ
 p0WEn8BLu8Lwvw3abOuZUXxrhH6Zuicvt3MKjHKPY1rOFcYivNVU0CqdCADdntern9Z4
 gFytvpralKh4NnvVp4F87pxgGKTAZBZmJdECYX7Qq6pW1OMAmtrulu0puCOxWpIqQO0T
 UFOy4BTQarB64SQ9HouKL9BZa28B+lU285t0vUbo73mP3DaLUxaQ2+P87ielfwJFAT8C
 oxDA==
X-Gm-Message-State: AOAM531QGWi1SxrgYJshrW00qxoX5s8Zbm84fENoa5Q5rES1uQsd84UD
 6PX4CGaOiGDmjg7VZsVHhLg=
X-Google-Smtp-Source: ABdhPJzgfNMuERVO0RcrmMY/BXPSjT4C9C21MHxN221I8AK4QjNfqmk7Z9lDbE3QzFDu835Qwp0WXw==
X-Received: by 2002:a63:4450:: with SMTP id t16mr17289795pgk.312.1605889495724; 
 Fri, 20 Nov 2020 08:24:55 -0800 (PST)
Received: from ?IPv6:2601:646:8e00:d1:6186:da9e:f87e:4f7c?
 ([2601:646:8e00:d1:6186:da9e:f87e:4f7c])
 by smtp.gmail.com with ESMTPSA id 92sm4553587pjv.32.2020.11.20.08.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:24:54 -0800 (PST)
Subject: Re: [RFC 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Kito Cheng <kito.cheng@sifive.com>, frank.chang@sifive.com
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-16-frank.chang@sifive.com>
 <CALLt3TgGATbAK5TFw-QBUFYTcC_CeAZ1AkMeeYuqgVxcyktT7g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <104fea2e-5c9a-8331-b9f5-4d5967651427@gmail.com>
Date: Fri, 20 Nov 2020 08:24:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CALLt3TgGATbAK5TFw-QBUFYTcC_CeAZ1AkMeeYuqgVxcyktT7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 20 Nov 2020 16:25:01 -0000



On 19/11/2020 7:02 pm, Kito Cheng wrote:
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 0bbfd7f4574..bc29e118c6d 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>           if (cpu->cfg.ext_h) {
>>               target_misa |= RVH;
>>           }
>> +        if (cpu->cfg.ext_b) {
>> +            target_misa |= RVB;
>> +        }
>>           if (cpu->cfg.ext_v) {
>>               target_misa |= RVV;
>>               if (!is_power_of_2(cpu->cfg.vlen)) {
>> @@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>>       DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>>       /* This is experimental so mark with 'x-' */
>> +    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, true),
> 
> I think the default value should be false?

Good catch, I missed that.

Yes it should be false.

Alistair

> 
>>       DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>>       DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>>       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> 

