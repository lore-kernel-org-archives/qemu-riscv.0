Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osPLY-0003hg-RZ
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 09:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osPLQ-0003ec-V5
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 09:12:55 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osPLK-0000id-LA
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 09:12:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 187-20020a1c02c4000000b003cf9c3f3b80so4283272wmc.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Nov 2022 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2RoXLqJmvirSqYb4hwx1T6W2fFgVpgGPtrxxdoqOFk=;
 b=AlivHb5QcQgGzu4Rb+VHbsHZ0lk2GAPlcpO7HOhkdACszyEs8TiHXlXhHjxW224nvo
 JzqIITs0OWrFfqsIf7kUFtfXJRbR1g5SMMe7HSTMFN34xv5+cumiE4c/obEuf3auZpFl
 fUBgJrGvcOA6NZDOGVZN/buCESK+WluPC8dT32JF3X89BOvxAXe16ic9q3UU1ucBBN01
 szI957l7jnGdoONSH8xxXbe7lHWRc7PnTn/lxrnaK4fpJ5uP48TbRRp0GQVjXl0GS9oq
 eGjxCSb50Bmawi0FLBPz1Xf7fIbXvyBEQnAnCxhnoFNVq7GF2TgYN6XCH6L4INlr78Av
 mABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2RoXLqJmvirSqYb4hwx1T6W2fFgVpgGPtrxxdoqOFk=;
 b=hOicx0WDB/LV0AbAYN3cxXi6z75pQof7tqR6E4XRMT0+ImPuOcnd0B1eGualUFRtNb
 fFgZzi+GwyJDJXZ1RhiiloNuA4H4zFPi3rv4HrGjBmHRb628lxndBYPpRsv6nIyXpgm+
 Aq/GOw9t34qeLMmFY7sxqzc8703zSQ2H1Ti4bjBedQWx5kXpF8dMNShpS3hHNLJt/com
 XVkvDg5p0vV5G2GyR1UWWGdwiuQRCn1R4/oU5mqKpXGT7voaUOfe0tW1sKMiFZFjZvf0
 ILzfz8xYx3PNLsK89C0a78nKEAjtxtMD7r2jjTNuxmbzJoEIebM8GKDIZxI/kR+QQE9x
 mbBQ==
X-Gm-Message-State: ACrzQf0bg8ddMUugha+uqxawCo4sHw+1DNLcsaz9bc11T3n+/C97um+/
 XapL1QCGmVoMetieNRNITnJOlA==
X-Google-Smtp-Source: AMsMyM7RVKQT2dFEeKCv7XdmDRHABegTAzElOujDLZMI7nFAKmRBNoLBSw3xjDH23y0sAOwLxkADUg==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr47015140wmb.174.1667916764723; 
 Tue, 08 Nov 2022 06:12:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bk28-20020a0560001d9c00b002365b759b65sm10598028wrb.86.2022.11.08.06.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 06:12:44 -0800 (PST)
Message-ID: <934d7560-daee-9f7e-2abb-640575768b2f@linaro.org>
Date: Tue, 8 Nov 2022 15:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
 <Y2kv/k5oKGOd+90w@redhat.com> <20221107173201.343hkqqugkzdzqcf@kamzik>
 <Y2lBnPuUA4bgKCLL@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y2lBnPuUA4bgKCLL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 08 Nov 2022 14:12:58 -0000

On 7/11/22 18:34, Daniel P. Berrangé wrote:
> On Mon, Nov 07, 2022 at 06:32:01PM +0100, Andrew Jones wrote:
>> On Mon, Nov 07, 2022 at 04:19:10PM +0000, Daniel P. Berrangé wrote:
>>> On Mon, Nov 07, 2022 at 03:50:44PM +0000, Alex Bennée wrote:
>>>>
>>>> Sunil V L <sunilvl@ventanamicro.com> writes:
>>>>
>>>>> On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
>>>>>> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>>>>>>
>>>>>>> The pflash implementation currently assumes fixed size of the
>>>>>>> backend storage. Due to this, the backend storage file needs to be
>>>>>>> exactly of size 32M. Otherwise, there will be an error like below.
>>>>>>>
>>>>>>> "device requires 33554432 bytes, block backend provides 4194304 bytes"
>>>>>>>
>>>>>>> Fix this issue by using the actual size of the backing store.
>>>>>>>
>>>>>>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>>>>>>> ---
>>>>>>
>>>>>> Do you really want the flash device size presented to the guest
>>>>>> to be variable depending on what the user passed as a block backend?
>>>>>> I don't think this is how we handle flash devices on other boards...
>>>>>>
>>>>>
>>>>> Hi Peter,
>>>>>
>>>>> x86 appears to support variable flash but arm doesn't. What is
>>>>> the reason for not supporting variable size flash in arm?
>>>>
>>>> If I recall from the last time we went around this is was the question
>>>> of what you should pad it with.
>>>
>>> Padding is a very good thing from the POV of upgrades. Firmware has shown
>>> a tendancy to change (grow) over time, and the size has an impact of the
>>> guest ABI/live migration state.
>>>
>>> To be able to live migrate, or save/restore to/from files, then the machine
>>> firmware size needs to be sufficient to cope with future size changes of
>>> the firmware. The best way to deal with this is to not use the firmware
>>> binaries' minimum compiled size, but instead to pad it upto a higher
>>> boundary.
>>>
>>> Enforcing such padding is a decent way to prevent users from inadvertantly
>>> painting themselves into a corner with a very specific firmware binary
>>> size at initial boot.
>>
>> Padding is a good idea, but too much causes other problems. When building
>> lightweight VMs which may pull the firmware image from a network,
>> AArch64 VMs require 64MB of mostly zeros to be transferred first, which
>> can become a substantial amount of the overall boot time[*]. Being able to
>> create images smaller than the total flash device size, but still add some
>> pad for later growth, seems like the happy-medium to shoot for.
> 
> QEMU configures the firmware using -blockdev, so can use any file
> format that QEMU supports at the block layer.  IOW, you can store
> the firmware in a qcow2 file and thus you will never fetch any
> of the padding zeros to be transferred.  That said I'm not sure
> that libvirt supports anything other than a raw file today.

Drew might be referring to:

https://lore.kernel.org/qemu-devel/20210810134050.396747-1-david.edmondson@oracle.com/

  > Currently ARM UEFI images are typically built as 2MB/768kB flash
  > images for code and variables respectively. These images are both
  > then padded out to 64MB before being loaded by QEMU.
  >
  > Because the images are 64MB each, QEMU allocates 128MB of memory to
  > read them, and then proceeds to read all 128MB from disk (dirtying
  > the memory). Of this 128MB less than 3MB is useful - the rest is
  > zero padding.
  >
  > On a machine with 100 VMs this wastes over 12GB of memory.

See previous attempts:
- Huawei
https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
- Tencent
https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
- Oracle
https://www.mail-archive.com/qemu-devel@nongnu.org/msg760065.html
- Red Hat
https://www.mail-archive.com/qemu-block@nongnu.org/msg81714.html


