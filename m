Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmjK0-0006Fd-Kn
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 16:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmjJw-0006CE-77; Mon, 15 Nov 2021 16:15:22 -0500
Received: from [2a00:1450:4864:20::333] (port=37657
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmjJu-0000xS-BZ; Mon, 15 Nov 2021 16:15:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso299144wms.2; 
 Mon, 15 Nov 2021 13:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gLBB7GvS8taID4QM2gxUg/JMlAdr4wytikovWMtKvYw=;
 b=dZiVR8qR5cOST21bBhpa97EXFRAY13N6VVIo7Gece4f1XIyEiFQ/BZzJpjmZSsPAtP
 8o4nQGIiLG1TgSwn+WFVUDdAYr3Qvi2tSygk0s2g2jgw/t5fKCwoZBrw+NGxLXVYW2J9
 FHYjztsTiLZ5pTcm+jE+oFVMNOSv3UPEw7fwFZPuygeqBP8Pnqm6ToAwFOFNRpdHcK8W
 LlNQT/1vKJqdP/xt8lTs2Y7CN2vCK0oM1eKgbDrkLPgtDB9BKFKpuFp83BX53CTS3WQF
 9EjjfOxhrhyhav9mPk9pVOHUdYVnkwA61pYxoacxc1iB8s3DzOPstP+ci1ckAbArTLyZ
 83HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gLBB7GvS8taID4QM2gxUg/JMlAdr4wytikovWMtKvYw=;
 b=ry6A4OBPvpv8wmNz9+72AIGg6l/EOZ8xM5mOhMC5BTvpyNG6DROeCifSghF/dIUfbQ
 J46XD5rRGcXN2A4hnaCaS3pxSBHxaChyiUO59Lbek1lbcmO3sebwOzEJYd/IFQsRPYX3
 e8bSltUxGwXXFCeXz7Q5QykfFVNI7jhWdqbtDptQqwjKBxkqqMzXvCaNgeaI9MrdWo1y
 vkBPM1s2XyJzoQKC6bIJqEauuAFgnKLXxmZeyoFWsb7KLvojbz2rL+vt2JPQzmugMkU2
 L638rbtgDPLkdKo1DY5kq+VnfrRKrsZQUTNX6KvgwjPuAiZn8iwIip78ZhF5HC4WIJMz
 2ggQ==
X-Gm-Message-State: AOAM532Pgbwlpzn1YrX7cBj0GMsJ7Fw5ynh+874c+rXNxdSiUQD5R2IK
 bIxpD9OhQDRyrPji+sk97Fg=
X-Google-Smtp-Source: ABdhPJzTc1s7attfuMYNbHc3hTvn29T23PY0kWp6EvxkRgoKMdP843ZaMacIDm1rCrRScK35n2L0qA==
X-Received: by 2002:a1c:a301:: with SMTP id m1mr5903433wme.118.1637010915563; 
 Mon, 15 Nov 2021 13:15:15 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n4sm18195894wri.41.2021.11.15.13.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 13:15:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <b18519f7-7198-0965-a528-2d1a45c7c93c@amsat.org>
Date: Mon, 15 Nov 2021 22:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: peter.maydell@linaro.org, bin.meng@windriver.com,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, jcd@tribudubois.net,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
 <87lf1pfm2z.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <87lf1pfm2z.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 21:15:23 -0000

On 11/15/21 16:57, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> On 11/15/21 13:55, Markus Armbruster wrote:
>>> drive_get_next() is basically a bad idea.  It returns the "next" block
>>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>>> subsequent calls count N up from zero, per interface type.
>>>
>>> This lets you define unit numbers implicitly by execution order.  If the
>>> order changes, or new calls appear "in the middle", unit numbers change.
>>> ABI break.  Hard to spot in review.
>>>
>>> Explicit is better than implicit: use drive_get() directly.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---

>>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
>>>      }
>>>  
>>>      for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
>>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
>>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>>> +                           drive_get(IF_SD, 0, i));
>>
>> If we put SD on bus #0, ...
>>
>>>      }
>>>  
>>>      if (bmc->soc.emmc.num_slots) {
>>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
>>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
>>
>> ... we'd want to put eMMC on bus #1
> 
> Using separate buses for different kinds of devices would be neater, but
> it also would be an incompatible change.  This patch keeps existing
> bus/unit numbers working.  drive_get_next() can only use bus 0.
> 
>>                                      but I see having eMMC cards on a
>> IF_SD bus as a bug, since these cards are soldered on the board.
> 
> IF_SD is not a bus, it's an "block interface type", which is really just
> a user interface thing.

Why are we discriminating by "block interface type" then?

What is the difference between "block interfaces"? I see a block drive
as a generic unit, usable on multiple hardware devices.

I never really understood how this "block interface type" helps
developers and users. I thought BlockInterfaceType and DriveInfo
were legacy / deprecated APIs we want to get rid of; and we would
come up with a replacement API using BlockDeviceInfo or providing
a BlockFrontend state of the art object.
Anyway, I suppose the explanation is buried in the git history
before the last 8 years. I need to keep reading.

