Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAqcB-0004yM-4r
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 05:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAqc9-0004xn-Im
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 05:58:21 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAqc7-0005RH-KX
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 05:58:21 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-14fb7fdb977so14692354fac.12
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 02:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1mM8I1fdpLNXx+WXNI0FIERqWo4jgyBYr8e0WfZxeg=;
 b=I8Jax1BMhQ0R4IOhsez7JEM+QFnb6ZPNlGbXaWQ5+QhMdq0xo5rBbLjR6HU/zb0zb7
 m3mWHhmajVG1uG2tx3e3TsDID7xoxAPZ/g52syajhvVu4+JZAzvLgyBFdfcMJPcLrEwR
 UeieKTOrFFprRitkmNYtv52GDmI1JhHLf/BkV9QZEPtQX4w3IlBKFvRE/Fb5iwdqF/Di
 hU/UjgtTovB1BsBvolxlSQVRa21bQfcdX8tojQ3nn9tNwajC0HOyJPnyHaY4WkXFNcbP
 HXoMyyv0q974oWoOihrMMNQ9SY+tnL8HLNittidufm6qSFc+WtfBL/6wGI6XkvfjbJD/
 KyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1mM8I1fdpLNXx+WXNI0FIERqWo4jgyBYr8e0WfZxeg=;
 b=4zgJ98iZAWubRbcU6PYS41dFxF69w2lm+J8t72nagC5PM2HY68zSIh61fz/l8aYo++
 P3uP5NYsUWSQ+LAs64fNZyxZDgBuBcRc80A64mvN0+AKfjOTyZfBgKdb9IQy7EBqiWr+
 luayP/x9O+OL9bwDSjE3S3QsRjQ52NDND+GK6GjFP4poCUBrWaafBS7ORGsg5kj6/Das
 25iVczDVJFhZdK0U5vfi9Pg0HmSyA+1e0D1Z1kDhelLyfVfKIBh1tgCT/Hjw4esw1Ddm
 9ooZPDBqvagZHQEhjaN146yZPuoK83DWr48Wm3mcsvZ8fCUiwO/+1q1wWKFxB9pDlZNR
 38gw==
X-Gm-Message-State: AFqh2krii+A/2ISdTufXVG9cVvFjKmICqazt9wwluC3hyjkxPtJGAV2N
 fUctkBvuXh9wQLd5vYRx4c3BQg==
X-Google-Smtp-Source: AMrXdXuX7tfS5su7zr60H287fJLlL10gDg+kVMdHc7wJrufq+OjE0S4CLS939FzMIGKhZ8qSXRFuMg==
X-Received: by 2002:a05:6870:814:b0:143:9967:7e8f with SMTP id
 fw20-20020a056870081400b0014399677e8fmr14309180oab.53.1672311497913; 
 Thu, 29 Dec 2022 02:58:17 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a056870b01900b00144a3c526d9sm8490667oae.52.2022.12.29.02.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 02:58:17 -0800 (PST)
Message-ID: <d2a42da7-429b-2d82-2030-0b4b112ca614@ventanamicro.com>
Date: Thu, 29 Dec 2022 07:58:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221229091828.1945072-1-bmeng@tinylab.org>
 <ca5bb1de-652c-8074-5b49-867e40d0a818@ventanamicro.com>
 <CAEUhbmVs4-WCByerzqDK2G1FTaQVJ5RuzB_qaJ4yCeMeDqrKUA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmVs4-WCByerzqDK2G1FTaQVJ5RuzB_qaJ4yCeMeDqrKUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Thu, 29 Dec 2022 10:58:21 -0000



On 12/29/22 07:38, Bin Meng wrote:
> Hi Daniel,
>
> On Thu, Dec 29, 2022 at 6:25 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> Bin,
>>
>> Not sure if it's a problem on my side but I can't find patch 12/12. I didn't
>> received in my mailbox. I tried patchwork but didn't find in there:
>>
>> https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352
>>
>>
>> And it's not in the ML archives as well:
>>
>> https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04581.html
>>
> Thanks for reporting this!
>
> I just examined the "git send-email" log, and indeed the "git
> send-email" aborted at the last patch for some unknown reason.
>
> I just resent the 12th patch using "git send-email" using the correct
> Message-Id, and hopefully it will be correctly chained into the v2
> patch thread.

That worked for me!

Good to know that there's a workaround to send missing patches in a
series - historically I would just resend the series all over again when
that happens,


Daniel

>
> Regards,
> Bin


