Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liVWh-0007SJ-JK
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 01:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liVWf-0007Rr-TG; Mon, 17 May 2021 01:10:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liVWe-0008LG-BY; Mon, 17 May 2021 01:10:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id y14so2840877wrm.13;
 Sun, 16 May 2021 22:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zw0LnE4UqMYfNm6bzlDqq5EFktTcl0kBPD/yLs7uAnk=;
 b=VrsOsB4KiAlU8LCyGx8TouyNLqM1gsgwi9RjKtk2ZLXmbSytJSYsHlLvxOLNRpFWN0
 hnCJh3MzMGAaEzZIjJmHefmZuiMVX8/l93/lIbxJj59Mt2BUDaVaNUuG8rcsi6I5TO9u
 92OJl6Yym5shuAy1CKfghhZmebTzZvzCFbdIKOcCcLwBNIvDpmJhA58X0E1ke4zQd3Ok
 FzIc3YyrlQGvSfTI6Fz9g8Jerb4IFN7KZEbsCbakFDz5SjYL3+zmmwGby17Ilv8HAYrH
 4SOEZK9klT1wD6QDgLhjzAJ7CPJrmaKoJgXbGxaEy4VGNTd5vsWj7xVsFva/kccJ3+ds
 Bxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zw0LnE4UqMYfNm6bzlDqq5EFktTcl0kBPD/yLs7uAnk=;
 b=nGeVVzX2JCpzY2FqDbERi8u2Bn4bJWwwcCZNz1/A8DIu7BHAuo+V6zyQAjsYzAmXOZ
 QiyFqlaqFlrqC83uW/LP3zWG3CJ4xublSf3CMwc6F7aH6pXm3Kd3teP2kqhvI4SpZ+hb
 8nJscUT+YXPkBEsr2Ss/+LGUANhuN/7a0Dhz49QfoVdSAlpFWpZnCLjXLS4LaHR3F3Mb
 k2LpPBugYiZ0qfzc9eUZqhz/vxLIGvbPKg1eRuJgOB4c4imVwSKBA0BHq6hbF3ZX4U6j
 BuYLur/zQryewYqY38zTj1QxV2qS/cIkayGAasYQ2zbD63C/aqs/P/8avs/K8XU9QouG
 DfXg==
X-Gm-Message-State: AOAM533pkwaJBc90eJqFZ3cvSOImOQdEMVAeaH3Pzzliv+29yGxcdP9G
 t2p9SOmOJFSCmGeIhjFUSeM=
X-Google-Smtp-Source: ABdhPJxdE8N1oFB5Tuz+c5A9PXqiN/V7T2syxnNj5swVzWw0DPJjjtWsTxDDp+3HoemkAMvjjyTAUA==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr68380478wrn.337.1621228241633; 
 Sun, 16 May 2021 22:10:41 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m6sm4852204wml.3.2021.05.16.22.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 22:10:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency
 MV64361 -> I8259
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-10-philmd@redhat.com>
 <CAEUhbmV3XiE1P-+K7Aa10n8udZrh+WRG4tCipRXbYUyd_1PVAA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e5358f8-f0b3-6edb-f110-f34b414afe9c@amsat.org>
Date: Mon, 17 May 2021 07:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmV3XiE1P-+K7Aa10n8udZrh+WRG4tCipRXbYUyd_1PVAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Mon, 17 May 2021 05:10:46 -0000

On 5/17/21 4:49 AM, Bin Meng wrote:
> On Sun, May 16, 2021 at 1:52 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Looking at the MV64340 model source, there is a dependency on the
>> 8259 interrupt controller:
>>
>>   523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
>>   524         /* FIXME: Should this be sent via the PCI bus somehow? */
>>   525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
>>   526             ret = pic_read_irq(isa_pic);
>>   527         }
>>   528         break;
>>
>> Add it to Kconfig to avoid the following build failure:
>>
>>   /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
>>   hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
>>   /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'
>>
>> Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/pci-host/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thank you :)

> There are some more codes that contain isa_pic. Maybe worth an additional check.
> 
> ./hw/i386/x86.c:573:    intno = pic_read_irq(isa_pic);
> ./hw/intc/i8259.c:58:DeviceState *isa_pic;
> ./hw/intc/i8259.c:429:    isa_pic = dev;
> ./hw/intc/apic.c:387:    } else if (!apic_accept_pic_intr(dev) ||
> !pic_get_output(isa_pic)) {
> ./hw/intc/apic.c:562:    if (!apic_accept_pic_intr(dev) ||
> !pic_get_output(isa_pic)) {
> ./hw/intc/apic.c:615:        return isa_pic != NULL;
> ./hw/intc/ioapic.c:78:        info->vector = pic_read_irq(isa_pic);
> ./hw/hppa/pci.c:67:    return pic_read_irq(isa_pic);
> ./hw/mips/gt64xxx_pci.c:777:        val = pic_read_irq(isa_pic);
> ./hw/alpha/pci.c:70:    return pic_read_irq(isa_pic);
> ./hw/pci-host/mv64361.c:526:            ret = pic_read_irq(isa_pic);
> ./hw/pci-host/prep.c:121:    return pic_read_irq(isa_pic);
> ./include/hw/intc/i8259.h:6:extern DeviceState *isa_pic;

I'll have a look, by my secret plan is to remove the global isa_pic :)

