Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E2CCCF9FE
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 14:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEpwz-00054f-V7; Fri, 31 Oct 2025 10:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1vEpwt-00054M-8B
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 10:17:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1vEpwk-000662-1d
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 10:17:50 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7a4c202a30aso2606647b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 31 Oct 2025 07:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761920255; x=1762525055; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=KpZROoHkNa+vml0ILeubGCbsUJ8lYDUKHX26lD5bSdM=;
 b=M9A2vdZ+pSk+n9FnBV5vvg+t7izaHqHGWXAY6oXt4UPbketYkjQ0t4S9W+CWob+Ux5
 e/Ps0JKhNg4+Jz8x7JLgfWjoUzZr0Mz82Y7wudgt4POwTKD8k+nP+p0DfS66VKcqjMyn
 WjriiJuftyDQYb4QRF27q9luxRSILE8AjOHkj8NXKu7HjX79PHiHUoVjg9rjJ+3tFR4J
 j9HKfgMgRcQZlBMZeYa1EwrV4CiQ3pqEYuz0a2Se1v+ynkBoPtNgBZEW8v0enDSDW5B9
 3kRUf6CXH019s8O92PNxJVe5Vk8J5x79djdEaJz1Kzx2WHTrrJ3pQy5E2dzduhr92yMf
 VOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920255; x=1762525055;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpZROoHkNa+vml0ILeubGCbsUJ8lYDUKHX26lD5bSdM=;
 b=t11sJkDIdS4o5xXkiA7SOzEkAhXQUzaHj/eSt6XJHsk8UzoprhoSDLm8hFeOe5lcNy
 mRTiDAGY/KA5E8aFHWcesYF6rd7yqf2y5oM84MKItEz4E/VmZ34C9GFoz5M3uoSJGd20
 i1Ii1MRKVjZVe6DxZ2GlqCLU6H6ZsoAf30U4FOaCsq51JlW3E7gi0YR5tLfdloCz/ijt
 zGIxLtmVLmysiJPp6XXKAhgTMzcbxidYPxP4Gwnh5FHyGyGuQVMcC5LPcp6S/yTtTm/u
 agnH+u2BameyjQ0XF6yNMYyiKBt7YEexOCH67IUTjW2qyf0pq98zrrFnY51ZVP0JInb5
 APJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRXdAUiSzRzszLThGDx2YqMh+loY0D78dW01uISfsDcVHiXz1pm+l9SlW84AkUzKrUl7AhfD2pgt4Y@nongnu.org
X-Gm-Message-State: AOJu0YxJw7dczdBh6q9ukz5FQJq43jIYFVQmOEDC/NHJZVtf0Q2QrgLd
 9dGiQb/plEhqdCa5pYkGIP6Vj/WOkdXAWsk/EcZPuxPDSXKT3CpofSrA
X-Gm-Gg: ASbGncuQj+S7Ng0ez6BdfNe/7VwvMNwiiJgOsnCx8EI37ULTH3OoRkCkWEB45dS0LX5
 zMfFOwNMnIYsgCVENwEyxrDBqje8qfd9vGxatwrnC63VoeUM4ZEGiNeHovcnUYaZKbkKbXUedRb
 uzlzKpPe5kn8IfHlXOr6d7XXsCZ53yvW512W5Ht3Cm+Q+kw/X019L6n6JxazP7x9LtCeG6cAOIh
 higAyCB/0NsJnQ5v7LGTiYwHlUd1i2AkarGiKI78BKk+HbFe9UNQtD3xhp54hHE0fpla9C7tKth
 KHtP5lq/I6Xw9tohXxlbGDzvBDDgNISFG23x6Vdb7hMqW+Rxiyw7uCfwhNqvBx/2l+jM9RfagAC
 rt/Dgm0/MZsqK0la/tiPK8HBZ4SA/EunsFvbmx4/gMftKEsc5k6m8wQ2VxKPjqv9TRytlWQfaQB
 yx/JCPOQdyA4OBd4mLiRJYomiRSTZiLgsx4l8opt9v0egwA8udN3ANnKcy4pQ=
X-Google-Smtp-Source: AGHT+IEfHqCGqcTrQaF551MhC0BWQtSlfWi6ZXJEbIC59gm5jCqVStrft45PAN4rXbjb4NCleldpcA==
X-Received: by 2002:a17:902:b48e:b0:27e:ef27:1e52 with SMTP id
 d9443c01a7336-2951a45459emr35744325ad.35.1761920255277; 
 Fri, 31 Oct 2025 07:17:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295268cc48fsm25681545ad.49.2025.10.31.07.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 07:17:34 -0700 (PDT)
Message-ID: <da5fa743-1379-4676-8d41-9ea613c3269e@roeck-us.net>
Date: Fri, 31 Oct 2025 07:17:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] hw/riscv: Make FDT optional for MPFS
To: Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250319061342.26435-1-sebastian.huber@embedded-brains.de>
 <20250319061342.26435-4-sebastian.huber@embedded-brains.de>
 <38528707-3d28-4be8-8b58-60269cb1db1b@roeck-us.net>
 <788527663.312.1759727663914.JavaMail.zimbra@embedded-brains.de>
 <67097d9c-ec3c-420c-b5b3-e2f3595a0612@roeck-us.net>
 <CAKmqyKNkJiK_8UkJ6AqvmCbtkj=amzJvrV1CUx2EXCdUvD_jCw@mail.gmail.com>
 <387693146.35079.1761897526299.JavaMail.zimbra@embedded-brains.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <387693146.35079.1761897526299.JavaMail.zimbra@embedded-brains.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/31/25 00:58, Sebastian Huber wrote:
> ----- Am 31. Okt 2025 um 3:56 schrieb Alistair Francis alistair23@gmail.com:
> 
>> On Tue, Oct 7, 2025 at 6:34 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 10/5/25 22:14, Sebastian Huber wrote:
>>>> Hello Guenter,
>>>>
>>>> thanks for the report. Do you have a Linux image and a Qemu command line so that
>>>> I can test this?
>>>>
>>> See http://server.roeck-us.net/qemu/riscv64/
>>>
>>> run.sh executed with qemu 10.1 or later should trigger the problem
>>> (the command line is not passed to the kernel).
>>
>> Any updates here?
> 
> Sorry, I didn't forget it, but I have a huge backlog of work.
> 

Has anyone else reported the problem ? If not, maybe everyone else is happy
with the current behavior. If so, maybe documenting it is sufficient.

No need to change for me, I can just carry the revert locally.

Thanks,
Guenter


