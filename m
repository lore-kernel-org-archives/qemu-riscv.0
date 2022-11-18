Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovvQm-0005Xb-15
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 02:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvQF-0005Qb-Cz
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 02:04:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvQB-0002BV-OL
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 02:04:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso3358124wms.4
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 23:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=utXhzwEiqB7KpE/tore07NskHKcYii5n6w26QQgjgoQ=;
 b=jXyiN/m2z8a4PfQqMRndRzA66OykXKtRAoJaS7AnV3mM9vaOKhDhVMWKsM4nauo1mw
 WkyJ3lDwUq1J8Hw0ifPvsBgtiV/TBs3YUaVDBMXFlZieP+2KrfNfVuqIxUxDT5qndQzm
 6UMDgTDp/cCF+hEUfvoXqmPamNP+QvYBGMDE84FP0vlzDfLbaeh0pRxyYEPqW5VFEiZU
 /Df3wBWbmEjgwo6obWfG3oAVtoejz0j4GfvpWhB2cHXdW6rLlmeY4DUScGgSomm3cVFo
 DpyX+qOdLqssgQUPVpCl6+8kcHacV43essfHdq7VOWRS6igCA2ZAQfBIQMy5+RirCb++
 Ce3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=utXhzwEiqB7KpE/tore07NskHKcYii5n6w26QQgjgoQ=;
 b=WAvOP1NhQfQpG/l2DU1gvEdyl0HbEeYQCe4lLOGH4clXU8VG+PkoMiR0YgdzDd0zMn
 Kf+IWjabcl8+IPAKQkVnpmgiwqVG4M+IRMxDUclCWEh86CkIHpgcdP5WgDb5zMD7wZuC
 7VXBs6y1Q6PZ+ef/jXs0xKd7hAn+X3XpWk+y4oe4fDLx35+dhOGtZaztpLjL6V6//EPv
 DlywicpAvr0A5FaDeTQ4cjoEsw5nt3BgzBd1dYDcnV4URa3n6RXt3x1j6SoJ2pKKoZrq
 QozCVUbmrsauYYYzI0XQDOTgLQEXW0B3b+lTlCHV7CNevncJfB50kT7B1sZJOclS+Otg
 BHxw==
X-Gm-Message-State: ANoB5pmPcm6sibM/jAVn3RpQ1KbX20ygRnOpGzYItixpN7shgwAaaTE+
 aRSQB1KvKbWONZlOCxVB1UhosQ==
X-Google-Smtp-Source: AA0mqf5UM9jiILINX851VdudMdtc59fpbjjUUnJIFE8KUhFePPEPlghyCcwXcF3VWgUZNYe+8lNqTw==
X-Received: by 2002:a05:600c:3d99:b0:3cf:cab4:a42b with SMTP id
 bi25-20020a05600c3d9900b003cfcab4a42bmr7494360wmb.36.1668755057922; 
 Thu, 17 Nov 2022 23:04:17 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 v11-20020adfebcb000000b002368424f89esm2796948wrn.67.2022.11.17.23.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:04:17 -0800 (PST)
Message-ID: <8b6ead5d-aba4-1ed0-d72f-3a3a5889f29c@linaro.org>
Date: Fri, 18 Nov 2022 08:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] hw/{misc, riscv}: pfsoc: add system controller as
 unimplemented
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20221112133414.262448-1-conor@kernel.org>
 <20221112133414.262448-4-conor@kernel.org> <Y3ZokxEWl64iIIp/@spud>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y3ZokxEWl64iIIp/@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Fri, 18 Nov 2022 07:04:34 -0000

On 17/11/22 18:00, Conor Dooley wrote:
> On Sat, Nov 12, 2022 at 01:34:15PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The system controller on PolarFire SoC is access via a mailbox. The
>> control registers for this mailbox lie in the "IOSCB" region & the
>> interrupt is cleared via write to the "SYSREG" region. It also has a
>> QSPI controller, usually connected to a flash chip, that is used for
>> storing FPGA bitstreams and used for In-Application Programming (IAP).
>>
>> Linux has an implementation of the system controller, through which the
>> hwrng is accessed, leading to load/store access faults.
>>
>> Add the QSPI as unimplemented and a very basic (effectively
>> unimplemented) version of the system controller's mailbox. Rather than
>> purely marking the regions as unimplemented, service the mailbox
>> requests by reporting failures and raising the interrupt so a guest can
>> better handle the lack of support.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   hw/misc/mchp_pfsoc_ioscb.c          | 59 ++++++++++++++++++++++++++++-
>>   hw/misc/mchp_pfsoc_sysreg.c         | 19 ++++++++--
>>   hw/riscv/microchip_pfsoc.c          |  6 +++
>>   include/hw/misc/mchp_pfsoc_ioscb.h  |  3 ++
>>   include/hw/misc/mchp_pfsoc_sysreg.h |  1 +
>>   include/hw/riscv/microchip_pfsoc.h  |  1 +
>>   6 files changed, 83 insertions(+), 6 deletions(-)


>> @@ -143,6 +149,45 @@ static const MemoryRegionOps mchp_pfsoc_io_calib_ddr_ops = {
>>       .endianness = DEVICE_LITTLE_ENDIAN,
>>   };
>>   
>> +#define SERVICES_SR 0x54
>> +
>> +static uint64_t mchp_pfsoc_ctrl_read(void *opaque, hwaddr offset,
>> +                                     unsigned size)
>> +{
>> +    MchpPfSoCIoscbState *s = opaque;
>> +    uint32_t val = 0;
>> +
>> +    switch (offset) {
>> +    case SERVICES_SR:
>> +        /*
>> +         * Although some services have no error codes, most do. All services
>> +         * that do implement errors, begin their error codes at 1. Treat all
>> +         * service requests as failures & return 1.
>> +         * See the "PolarFire® FPGA and PolarFire SoC FPGA System Services"
>> +         * user guide for more information on service error codes.
>> +         */
>> +        val = 1;
> 
> Another issue I just spotted here, this should not be returning 1, but
> rather 1 << 16. The status bits are 31:16 & I was just getting lucky
> b/c of something wrong with the Linux driver exercising it!

So your implementation expects 32-bit accesses, thus ...

>> +        qemu_irq_raise(s->irq);
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
>> +                      "(size %d, offset 0x%" HWADDR_PRIx ")\n",
>> +                      __func__, size, offset);
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +/*
>> + * use the dummy write, since we are always going to report a failed message
>> + * and therefore do not care what service is actually requested
>> + */
>> +static const MemoryRegionOps mchp_pfsoc_ctrl_ops = {
>> +    .read = mchp_pfsoc_ctrl_read,
>> +    .write = mchp_pfsoc_dummy_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,

... you might want to complete this with (at least):

         .impl.min_access_size = 4,

And eventually if this region is only accessible as 32-bit:

         .valid.min_access_size = 4,

>> +};


