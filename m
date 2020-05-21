Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbmpX-0003my-7W
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 11:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbmpV-0003jl-Nm
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 11:09:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26008
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbmpU-0007nk-1W
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 11:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590073791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4C2rlTA9x8STJ/ou3J/Z32EJLvR3kTYr7pxFIXxvcMY=;
 b=htu9XKOBUukXuQihSxC8H7QzjqMTXnwEQv0K+f5Vhm6UuhtT3EJkBvHYYnTdS2ba17xjCU
 dqFPqX7P+9pB82BOePsNMHx/u70h3C411Ld8vfQkeoD/dk4zryBus3+usI8xkfu8neCDYo
 3HR/l09Jqh7z3ZbaUNtqX4LO+9o4xFE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-49VdBmI-MEOsSfRSrN415A-1; Thu, 21 May 2020 11:09:49 -0400
X-MC-Unique: 49VdBmI-MEOsSfRSrN415A-1
Received: by mail-wr1-f72.google.com with SMTP id r14so3037351wrw.8
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 08:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4C2rlTA9x8STJ/ou3J/Z32EJLvR3kTYr7pxFIXxvcMY=;
 b=IsjMBWq1aH4Mxn7tfUABN9uJMhFU6kSkR4hq7CjbDoMU1IJ7xQ+6AGaEhsaR0Ild/P
 PUQkpvS2G+6cgper3sNaCScdbpRCBbcdoJBpO+tmPpEPANEfJsoTbixgbFi3mIDE1MJG
 Uf7hT2iuQ74jBzS9aH3sxFYPXp2E/tRCecb5tuu4AfDl9hKcs1OG4OfooCiqsYkZBZrP
 U+XgGmYFejXMbH3hPJKUHFPzmSmP7x8EdpAKl62kbbTWPHwU/CZhiZ2wY0fX03ljR05C
 YNBsJ5/DZTnj9JxBQnnWngqymZc4PTX+ga7LKb3evSMyRvaGhxPvkbg+NkBYOoKX2Xro
 CCRg==
X-Gm-Message-State: AOAM531YkdkzJCuYeKEkJ/2PEp+GypqOcZ+bEjFojiEFUOn5l0JFIf+5
 SvCJFNxCPg7OyjLP0+aaPwfxF/1+ieoXkRHTROgCPg8i5uUmpJ7Wnk4doULnXcKQawsCMhZnhbl
 4ICaCU498z1yZcAw=
X-Received: by 2002:adf:b354:: with SMTP id k20mr879802wrd.412.1590073788229; 
 Thu, 21 May 2020 08:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrfDLXn+6XrRCUoPeU6I2fY7mEd8+5G0g5arflPv0KSsLCGkHzbz8ggPrzuH/ZdsKzxBLO8g==
X-Received: by 2002:adf:b354:: with SMTP id k20mr879775wrd.412.1590073787981; 
 Thu, 21 May 2020 08:09:47 -0700 (PDT)
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b65sm7154112wmc.30.2020.05.21.08.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 08:09:47 -0700 (PDT)
Subject: Re: [PATCH v2 02/10] MAINTAINERS: Add an 'overall' entry for
 accelerators
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-3-philmd@redhat.com>
 <528c5bbd-7bf4-4dc8-c69e-5d5b6fa30493@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8853e7ba-aceb-fbe0-2eb4-b9e18111d81d@redhat.com>
Date: Thu, 21 May 2020 17:09:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <528c5bbd-7bf4-4dc8-c69e-5d5b6fa30493@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 15:09:54 -0000

On 5/17/20 7:26 PM, Thomas Huth wrote:
> On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   MAINTAINERS | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fd88a3de49..659092eb43 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -415,6 +415,15 @@ S: Supported
>>   F: target/i386/kvm.c
>>   F: scripts/kvm/vmxcap
>>   
>> +Guest CPU Cores (other accelerators)
> 
> Maybe s/other accelerators/accelerators generic code/ ?

But then we have HVF and WHPX listed there...

> 
>> +------------------------------------
>> +Overall
>> +M: Richard Henderson <rth@twiddle.net>
>> +R: Paolo Bonzini <pbonzini@redhat.com>
>> +S: Maintained
>> +F: include/sysemu/accel.h
>> +F: accel/stubs/Makefile.objs
> 
> What about accel/accel.c and accel/Makefile.objs ? Should they also be
> in the list here?

OK.

> 
>   Thomas
> 


