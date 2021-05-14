Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhSxp-0002wO-Ni
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 04:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhSxn-0002w3-LW
 for qemu-riscv@nongnu.org; Fri, 14 May 2021 04:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhSxl-0001cs-A0
 for qemu-riscv@nongnu.org; Fri, 14 May 2021 04:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Fs3GU6DaSXGpo0a38oZ+0jyv8tLZi+P+hu5Cm5EraQ=;
 b=MB8MoZa3KvdrM0W9h7gaFm+Q0YS7F7Bzp8v7Rb7Ew0R9OaQy6XVEE5rxYcR/ZBPwTnV7w3
 A0MGkBnHGzpCpn/3kwcrIHXyqEgzUSQ6CRUk/aXKNa7ohLeRF42rJejgAyScf8ch7OKKm+
 S808gboq875db3CvUwBGRUrpdE0c43w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-yxRDo6z_NR2IHFLeIzCLJg-1; Fri, 14 May 2021 04:14:22 -0400
X-MC-Unique: yxRDo6z_NR2IHFLeIzCLJg-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so15979634edr.0
 for <qemu-riscv@nongnu.org>; Fri, 14 May 2021 01:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Fs3GU6DaSXGpo0a38oZ+0jyv8tLZi+P+hu5Cm5EraQ=;
 b=SwBeoiey6aLAILAFVWxgp0gepM5qt9hzC4wYsfXOVURwHPWZcsv8NTq3DoHvNDmwEz
 OOFFp41FMr5LtcozCl/XG9kgRLMMD201maTHfwPsT1AylSacP7jI2Q5wBkLt+nbrpQ7B
 haXKgZifWIvHE54nVXT6sNuHvNXAYjd5gWAgTdQFarJ0V1GE3C4FQ0tPwUfTAVWY7HpY
 G+TmuoBBjdFhOGM57RD6OG4KXb+kP/SYBxy6Z2gjV6oOI+1nxDmkjVhJTgdEH8k5av+p
 EzuxcgW4+x6mchYeV3yQrPT5vYQ61bxQvMwxfzniQkT3C6l+idIRFaYGAtIf6kmUUgVk
 hyxA==
X-Gm-Message-State: AOAM531FKkH8BVkN+6KWCQMyRs5ypa+0kP8ckR9xcBhPxHxw4otGfzH9
 bbrAsnB1kbtVROEobAv8RstZTJwr41MaMj+pk3B2XkwkPejtn4QxBNHsOOJdTcyCW3QWA6TK+5o
 ytLST4mtfLiTGJPQ=
X-Received: by 2002:aa7:d818:: with SMTP id v24mr10500522edq.290.1620980060978; 
 Fri, 14 May 2021 01:14:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjzatgqLYyvIZOsGFvGbJsvZlBl6qHQIt8mZTRRf4oRTubZPKjrmD24pGckWk8MTFjGy66Ag==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr10500492edq.290.1620980060733; 
 Fri, 14 May 2021 01:14:20 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c22sm3930173edy.59.2021.05.14.01.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:14:20 -0700 (PDT)
Subject: Re: [PATCH 06/10] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-7-philmd@redhat.com>
 <CAEUhbmX6mBKQK0ubfpYgeoqrjN7OSGoa6Nt7Gz+pDaU_Qw3gjw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f113d31-6c3d-eb5e-ceee-48e265e35876@redhat.com>
Date: Fri, 14 May 2021 10:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmX6mBKQK0ubfpYgeoqrjN7OSGoa6Nt7Gz+pDaU_Qw3gjw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 14 May 2021 08:14:28 -0000

On 5/14/21 4:47 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Fri, May 14, 2021 at 12:57 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
>> emulation") added a dependency on the SERIAL model, but forgot to
>> add the Kconfig selector. Fix that to solve when built the
>> MICROCHIP_PFSOC machine stand-alone:
>>
>>   /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function `mchp_pfsoc_mmuart_create':
>>   hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'
>>
>> Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulation")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Bin Meng <bin.meng@windriver.com>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  hw/riscv/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
>> index 86957ec7b06..b72a248809e 100644
>> --- a/hw/riscv/Kconfig
>> +++ b/hw/riscv/Kconfig
>> @@ -12,6 +12,7 @@ config MICROCHIP_PFSOC
>>      select SIFIVE_CLINT
>>      select SIFIVE_PDMA
>>      select SIFIVE_PLIC
>> +    select SERIAL
> 
> This dependency should be expressed by MCHP_PFSOC_MMUART in hw/char/Kconfig

Oh I missed this symbol, good catch!


