Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pB4mw-0000W4-WC
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 21:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elta.era@gmail.com>)
 id 1pB4ms-0000VB-Fh; Thu, 29 Dec 2022 21:06:22 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <elta.era@gmail.com>)
 id 1pB4mp-0002Wr-K2; Thu, 29 Dec 2022 21:06:20 -0500
Received: by mail-pl1-x634.google.com with SMTP id u7so20553124plq.11;
 Thu, 29 Dec 2022 18:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cjKepwl3QThtZs4EN3/pLXxkcvwvBqH8l6vuIg2rZbA=;
 b=eQDgSxLzqrPijBvEgEAQxGrfwrDavRSvHdLQQf3rpJz91+qdS+Y7Glrxb6qKF6BKNU
 lfS1EZYQ6tYHJQKsy3pWBIBH2j/Zi/L70wpt1bWEyn+iXv9xh4M84ksf78s+YiE73QAC
 4ZD5w1Ym3p830qw0j7XheZgMUfCAjKWbYXLYDf20FBagTqSWVfi8YoQAr3gtY8/1zgyq
 0XYfAX39HUoxro1tUplxYTesBNqevSdDzve+LXLur8sMRT/7BOCY2q/opt5MQAgii5Pa
 PPEJ2wFzUq/hxJXHfgoWdzC+HHQ2ZyP+eT8DLduFdjqvzZLhm318crQ275wpEugCplzN
 9UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cjKepwl3QThtZs4EN3/pLXxkcvwvBqH8l6vuIg2rZbA=;
 b=juFWyQBarSvVjHT5E0X7qMDGK3avc3XlH1wLBiZIizftdvzOZB1WuZ2NtkeFa/Lx3J
 zR6hf74iFYCCJjeMUYVWYGAEv2+vV+mBcjlC5wMUN54FdgCQJSg03fKH2PESMBuLBctB
 7So20bCSqgvprW9FnfhmTZH2RKLMWvKfsGXXvJDUZ9dJhW1ZaH6TsHKwdFB0f0J4DSYc
 cMJup0ZzKOnuuICo9DgmF69bBt0+C6K4qw/3nDC7BXjsOkVVGj3/xzNWpQtLvNokP0dO
 GCUw+UwYlUsRlpfpgVhGyW3TEED7MmKguagF7ulQFVrrEVr3q9BwszoMBPsHJdwsfwxD
 arKw==
X-Gm-Message-State: AFqh2kpZPEH6f75GpNfgMdwQda72lUQ5Cb/RM6X/38x5szr7g9H4R2b5
 wQEz4w3Hyrg2pyoJxqr+ijO2eRTJ5fZj43Js0h8=
X-Google-Smtp-Source: AMrXdXsy4UvqqimvYEimVLqjfVXeVYsu94rTroQwg0LsvDMdPdvTB5RAybbZJVlwynRBIHQJpxtcKHIo/VSjTKeT+Og=
X-Received: by 2002:a17:90a:9dc2:b0:21d:96fb:59a8 with SMTP id
 x2-20020a17090a9dc200b0021d96fb59a8mr2649614pjv.67.1672365975620; Thu, 29 Dec
 2022 18:06:15 -0800 (PST)
MIME-Version: 1.0
From: Dongxue Zhang <elta.era@gmail.com>
Date: Fri, 30 Dec 2022 10:06:05 +0800
Message-ID: <CAEomy4RRd_QOLtR1wP9t0imC=7tirtvG16iq1crHR2n3c=7nwg@mail.gmail.com>
Subject: Re: Re: [PATCH qemu] target/riscv/cpu.c: Fix elen check
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=elta.era@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 30 Dec 2022 02:06:23 -0000

>On Thu, Dec 29, 2022 at 12:34 AM ~elta <elta@git.sr.ht> wrote:
>>
>> From: Dongxue Zhang <elta.era@gmail.com>
>>
>> Should be cpu->cfg.elen in range [8, 64].
>>
>> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
>
>When sending a new version can you please add any previous reviewed tags.
>
>Alistair
>

Ok, i will try again, and add users as reviewed-by and signed-off-by.

>> ---
>>  target/riscv/cpu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 6fe176e483..5dc51f7912 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -872,7 +872,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>                          "Vector extension ELEN must be power of 2");
>>                  return;
>>              }
>> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
>> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>>                  error_setg(errp,
>>                          "Vector extension implementation only supports ELEN "
>>                          "in the range [8, 64]");
>> --
>> 2.34.5
>>

