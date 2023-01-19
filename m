Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIVy7-0004na-S0
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pIVxk-0004YJ-QS; Thu, 19 Jan 2023 09:32:22 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pIVxh-0005rH-Jn; Thu, 19 Jan 2023 09:32:19 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 h3-20020a4ac443000000b004fb2954e7c3so527366ooq.10; 
 Thu, 19 Jan 2023 06:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OzgsiHNFafg9OuoZBVQAxwkGBmRTSBugx3N+qaA0rBI=;
 b=ca9PfG3z/EllduhdK6CDNGJ7qAylteR3X1AjKID79cJKs9dNOQtZfCq0WpbYeCFRpn
 AZGBzK1xTiXHeBtUlmTEAJx4GopUssIpHcTttmqZk21lCLTyIsbOuA01LAJU6QUnnPv4
 zppFSpWUaZFPwyxNI9OYcYU6qre5wiqE3X6UKVq3ok01tGCiv7lJwyCoD8OB8Ky3T+v5
 +AuPj/fJtr1a2FmaNIFC3FYxkqSgA4SJ8Ya/RC7ogm3WRLtz47eUePUyBb0Z+IuzIgdI
 yphrOLgWfpM8OLDvA4TNbkRqsxhVurzVZ219FETwgKhDAqH5WQZZceT75HU4nuZIvBUE
 6mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OzgsiHNFafg9OuoZBVQAxwkGBmRTSBugx3N+qaA0rBI=;
 b=L9kw5cqnzVffxwJycS5fXPxp4bUYLpUQbaRvAMAPViebP25pznTl/08LvPKeNI6tll
 K5RDB1IT+EoqfzWn+axiWRQSbpPmIcEfnU/e9I5w8tlbWSMKAbrZwGKp6Lpp2cKwqzkV
 ibYy/wU2qUeGOtjt2KsUzR1G2/8CbiV6BeEMxDiuvU6IP+krTvEFRfQuepipoanPfvRf
 wS+l2zCodEg75+zhGo9TBLK67ZnjvbtebnHERysUId4sTAcTJcLvQR/dJeTBw7wAXBJ3
 LkoTXAffc+T8Aiz0xXBSjoZRlxXm2YfuXoOvAU6AK5oPC7StJaPW/qWfDNIdCeLJi1gs
 sQNQ==
X-Gm-Message-State: AFqh2krpEbDhgYKPebCzsRY7Aa8DI3G6fiW++ArZvKOa4arxfpvx0upz
 J+S7dI8cFNpMkgpnhkijfDI=
X-Google-Smtp-Source: AMrXdXuzZK0/qeneeoKtkR5uanVU13P0DyIhyVKzXEDf9UVDbzHQsxVUQcff/azGPvHSfERmd5gibA==
X-Received: by 2002:a05:6820:413:b0:49f:dba7:5e65 with SMTP id
 o19-20020a056820041300b0049fdba75e65mr4855150oou.3.1674138734167; 
 Thu, 19 Jan 2023 06:32:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a4aa706000000b004f9cd1e42d3sm3702525oom.26.2023.01.19.06.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 06:32:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01c6a8f8-881b-66b2-781b-c334e3a9fecc@roeck-us.net>
Date: Thu, 19 Jan 2023 06:32:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
 <Y8iulgdgOdVCjuKE@kbusch-mbp>
 <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
 <Y8jBG/j8w2R43kYd@kbusch-mbp> <Y8jxHuVYoTo6KcH4@cormorant.local>
 <Y8j5B+c3mM01d+Gk@cormorant.local>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y8j5B+c3mM01d+Gk@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 14:32:43 -0000

On 1/19/23 00:02, Klaus Jensen wrote:
> On Jan 19 08:28, Klaus Jensen wrote:
>> On Jan 18 21:03, Keith Busch wrote:
>>> On Thu, Jan 19, 2023 at 01:10:57PM +1000, Alistair Francis wrote:
>>>> On Thu, Jan 19, 2023 at 12:44 PM Keith Busch <kbusch@kernel.org> wrote:
>>>>>
>>>>> Further up, it says the "interrupt gateway" is responsible for
>>>>> forwarding new interrupt requests while the level remains asserted, but
>>>>> it doesn't look like anything is handling that, which essentially turns
>>>>> this into an edge interrupt. Am I missing something, or is this really
>>>>> not being handled?
>>>>
>>>> Yeah, that wouldn't be handled. In QEMU the PLIC relies on QEMUs
>>>> internal GPIO lines to trigger an interrupt. So with the current setup
>>>> we only support edge triggered interrupts.
>>>
>>> Thanks for confirming!
>>>
>>> Klaus,
>>> I think we can justify introducing a work-around in the emulated device
>>> now. My previous proposal with pci_irq_pulse() is no good since it does
>>> assert+deassert, but it needs to be the other way around, so please
>>> don't considert that one.
>>>
>>> Also, we ought to revisit the intms/intmc usage in the linux driver for
>>> threaded interrupts.
>>
>> +CC: qemu-riscv
>>
>> Keith,
>>
>> Thanks for digging into this!
>>
>> Yeah, you are probably right that we should only use the intms/intmc
>> changes in the use_threaded_interrupts case, not in general. While my
>> RFC patch does seem to "fix" this, it is just a workaround as your
>> analysis indicate. >
> +CC: Philippe,
> 
> I am observing these timeouts/aborts on mips as well, so I guess that
> emulation could suffer from the same issue?

I suspect it does. In my case, I have an Ethernet controller on the same
interrupt line as the NVME controller, and it looks like one of the
interrupts gets lost if both controllers raise an interrupt at the same
time. The suggested workarounds "fix" the problem, but that doesn't seem
to be the correct solution.

Guenter


