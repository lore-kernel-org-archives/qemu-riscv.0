Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liHHw-0006vP-SC
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 09:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1liEhy-0003h2-9S; Sun, 16 May 2021 07:13:18 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1liEhv-0000z4-9T; Sun, 16 May 2021 07:13:17 -0400
Received: from [192.168.1.6] (b2b-109-90-5-113.unitymedia.biz [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4FADA20775;
 Sun, 16 May 2021 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1621163586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRdW3gislWrJzT0HUA2jVFKtCojm7XIvG12VM86NA4o=;
 b=n+nfn83kTiyPsM93vtkzm2/zcSZ87oddm/myf5uY0z97wz3YqHVYNpV2R5vn5DVHr1wl8h
 WCNPi8Hx5PAKt6JbW8Uz5+ee/cl3/FSwE4/rUMWlel5Bs4uaRqBkWh0+Y6yl0NTn1b9HrH
 7eH0WeLAc4EA6gdjvvkShgS8A9kjDgI=
Subject: Re: [PATCH 2/2] QOMify sifive_uart model
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@greensocs.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, mark.burton@greensocs.com, 
 marcandre.lureau@redhat.com, palmer@dabbelt.com, pbonzini@redhat.com,
 alistair.francis@wdc.com, luc.michel@greensocs.com
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
 <20210504153456.927083-3-lukas.juenger@greensocs.com>
 <8471d630-72c1-aef0-a0cf-9f0417334c08@amsat.org>
From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>
Message-ID: <4891435d-2cc2-2109-3fa9-cd826cd23f2b@greensocs.com>
Date: Sun, 16 May 2021 13:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8471d630-72c1-aef0-a0cf-9f0417334c08@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.junger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 May 2021 09:58:34 -0400
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
X-List-Received-Date: Sun, 16 May 2021 11:13:18 -0000

On 5/11/21 2:26 PM, Philippe Mathieu-Daudé wrote:
> Hi Lukas,
>
> On 5/4/21 5:34 PM, Lukas Jünger wrote:
>> Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
>> ---
>>   include/hw/char/sifive_uart.h |  6 +--
>>   hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
>>   2 files changed, 65 insertions(+), 13 deletions(-)
>> +static void sifive_uart_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SiFiveUARTState *s = SIFIVE_UART(dev);
>> +
>> +    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
>> +                             uart_be_change, s, NULL, true);
>> +
>> +}
>> +
>> +static void sifive_uart_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = sifive_uart_realize;
>> +    device_class_set_props(dc, sifive_uart_properties);
>> +}
> You forgot to add the migration fields (VMState) of the SiFiveUARTState
> structure. You might want to convert to the Fifo8 API (like the
> SiFiveSPIState does) previous to this patch.
>
> Regards,
>
> Phil.

Thank you for your feedback. If I understand correctly, sifive_spi does 
not support migration currently. Would it be possible to merge this 
QOMification without the migration feature for now, as not all devices 
in sifive_u support it at the moment anyways? It seems it would be 
difficult to test on my end.

Best regards,

Lukas


