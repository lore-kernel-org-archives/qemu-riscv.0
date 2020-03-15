Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDbpN-0007lc-KP
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 18:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDbpK-0007jK-85
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDbpI-0006YJ-Vl
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:33:46 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43260)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDbpI-0006Q2-6C
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:33:44 -0400
Received: by mail-pg1-x544.google.com with SMTP id u12so8561156pgb.10
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C8xrtjZPdhkGh9RyuMEXja32sZxVcrJKH8SOoPBFV+I=;
 b=S7p11nb7RkRO3B2CKas/xZBbykefVMuGQavF9k2EpUSryb4hk0D7aR0ykRSR/ya3Vc
 g3Jkp0sQuy3AlvNbiZ4DkN7PWuuQBoQAjKFHxJ9yEwzGUKqy2wLs/UPcoguqYEbHOUaD
 +YIYh00mfewuYg5l+YaNFqbisx9f4IXkLx52Yarnoiy9wLpnCpXyEHXuIc+winQlkk3g
 WcVXW6hSSm2XswORQWkwFn/5o7DvNSmncCExThyvk0iJo8q90FABr2I4K6oL2Rrl1PGk
 7e+B57NEQLXRmvq0O8ifOWBaXPmvVJctdB8Q5nv3S2XdrmRiMUjOipbwzfLC0HgM7lSE
 uGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C8xrtjZPdhkGh9RyuMEXja32sZxVcrJKH8SOoPBFV+I=;
 b=dLkZOpzqfluxkmC423iM//DIzLZqxbtoKSVLu4RUMt0Mk5I/nNLZdYAKIlfOQk4Wxa
 O8Equ1w7kco9F92z1bzVxUVP7KRb/UuqQdm3A7TPy4a/jcuLtvFLSb3AviivVJVxHTof
 3/XUAv8lRDWYk5f84NZBiTOahEQWTMksO1dsWx5BjAEn1DyVX0mzlFjGcN7p027B9GiM
 g1cu9FvPyaj+BWTOWfn7SS4AJTHH6jJj2mpHSC8mo4Zq37bXdARIxpThRcVw+LnaQpKZ
 sgDk8tVS4EHPfF7Reelz4WpKdq4WBZehXuWw93DpdOlRfSfrnOzJifXuaAEnrsvR0d5o
 2dIg==
X-Gm-Message-State: ANhLgQ1dZOzT+WethTbTX+qv8DxCKkUJ3yUULnwA4R4AJWIRD1fdDujp
 8dmHMQZ6SfOEf2Z3HtJQ5aHzzA==
X-Google-Smtp-Source: ADFU+vv4ID1TV72I/f91ubBzIpArlK8S71wQ1JT6Z3mqMXjq0lOpmdWDq1J+3g+wmfbKprdmTM4tqQ==
X-Received: by 2002:a62:e20a:: with SMTP id a10mr23092322pfi.270.1584311623231; 
 Sun, 15 Mar 2020 15:33:43 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 11sm13757742pfv.43.2020.03.15.15.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 15:33:42 -0700 (PDT)
Subject: Re: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-2-philmd@redhat.com>
 <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
 <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
 <29d183c5-6dc5-39a0-e8be-fa2e7f37d331@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9c4a379-4710-b2c4-54ae-e33b02de5c64@linaro.org>
Date: Sun, 15 Mar 2020 15:33:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <29d183c5-6dc5-39a0-e8be-fa2e7f37d331@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Sun, 15 Mar 2020 22:33:47 -0000

On 3/15/20 3:16 PM, Philippe Mathieu-Daudé wrote:
> On 3/15/20 8:40 PM, Richard Henderson wrote:
>> On 3/13/20 3:28 PM, Laurent Vivier wrote:
>>>>   ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
>>>> -HELPERS-y += virtiofsd$(EXESUF)
>>>> -vhost-user-json-y += tools/virtiofsd/50-qemu-virtiofsd.json
>>>> +HELPERS-$(CONFIG_SOFTMMU) += virtiofsd$(EXESUF)
>>>> +vhost-user-json-$(CONFIG_SOFTMMU) += tools/virtiofsd/50-qemu-virtiofsd.json
>> ...
>>>
>>> Why don't you do that instead?
>>>
>>>    ifeq
>>> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)
> 
> This was my first option but checkpatch complained because it is 80 chars long...
> 
> I also tried:
> 
> ifeq \
> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)
> 
> which is uglier and still too long.
> 
> Following qemu-bridge-helper syntax I also tried:
> 
> ifeq ($(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yy)
> HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) += virtiofsd$(EXESUF)
> 
> which is also too long ¯\_(ツ)_/¯
> 
> If you accept checkpatch complain I can use the form you prefer :)

Hmph.  Of the choices, I prefer the 80+ char line.


r~

