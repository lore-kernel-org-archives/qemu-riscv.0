Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDbYy-00024Q-TO
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 18:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDbYv-00022e-EC
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDbYt-00008l-9N
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:16:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46957
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDbYt-0008Uv-54
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584310606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVq0jzVMd22wrFGV6AGs0YUGbFRod6Ol4uSuY4S5wO0=;
 b=CZDlpgR55GpxLtddvIv8+nUSLN86rf7jMUg784BPcUqenrW9zzkdFu1zf2caM6KtmXzUJL
 hJkumYwbOVGOLlHNAKysnjtNOTwyMdjlSLj+OlzGsJcmTnlhba9Zl1KMEdMw9g1R8DgVjb
 dElib+mVzQ1yKDe7wH/06TgSxSUhMOE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-JjcNjbsBPOy7wMqgbDq29g-1; Sun, 15 Mar 2020 18:16:43 -0400
X-MC-Unique: JjcNjbsBPOy7wMqgbDq29g-1
Received: by mail-wr1-f70.google.com with SMTP id q18so8008194wrw.5
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 15:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRHW7+jG/l3gvTxinmkE5xtvg/1Q8eGX49Sjbci+aqU=;
 b=p/gmfBl9kCohVBBYNuyTsW/FksOoBlfIU96IkPMJ/y8lQdjumh8gsq3pn50KbWMdtL
 Jm2Ymrjg+mdILQtOPgT/+FtBJSyEsEcR+HoZKGYVbo0DPGe+bfWelkmrKGm6pYRvdCpQ
 FdYnv75AhtkCcT+4wWbIc8XtDioMB01x5Kf+SrzOGgobuGaiwSqBj0hSYfC1uO3IVrFa
 JOKjMfgvw+QeBi6vcd1++eQaooNLjL0Skbk8gJu0Co270BepLOK0Vz9+5mH6wetN+9Kp
 Ty+/0M47Nus0nwoZ5FJG+DdXa2gMSLHIl3PA6ibPpYFB32lVISwIU7U+RknXD+b2tpFH
 ZXdQ==
X-Gm-Message-State: ANhLgQ0NxqpEng0YJs4EWyrV309OVs25VAuBVbBNdVOotUkCmfiF3eWA
 CYzA1Uo4eQxKR1yA/stWICYvMddC6YFF21yxvRaFbCyrxR+7HDVkavDHATJgnVrggMZj2ulu/Jh
 Y6tBhZZD67bVE6bY=
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr23419070wmj.176.1584310602044; 
 Sun, 15 Mar 2020 15:16:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv6iaxjkr3W2PE6VXHais/j4NhYURo+zr0W427LdzZXnh8ZgZ8giUhQG/4lD5VEPVdDGxcR2Q==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr23419039wmj.176.1584310601749; 
 Sun, 15 Mar 2020 15:16:41 -0700 (PDT)
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id d15sm89324337wrp.37.2020.03.15.15.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 15:16:40 -0700 (PDT)
Subject: Re: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is
 enabled
To: Richard Henderson <richard.henderson@linaro.org>,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <29d183c5-6dc5-39a0-e8be-fa2e7f37d331@redhat.com>
Date: Sun, 15 Mar 2020 23:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Sun, 15 Mar 2020 22:16:50 -0000

On 3/15/20 8:40 PM, Richard Henderson wrote:
> On 3/13/20 3:28 PM, Laurent Vivier wrote:
>>>   ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
>>> -HELPERS-y +=3D virtiofsd$(EXESUF)
>>> -vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
>>> +HELPERS-$(CONFIG_SOFTMMU) +=3D virtiofsd$(EXESUF)
>>> +vhost-user-json-$(CONFIG_SOFTMMU) +=3D tools/virtiofsd/50-qemu-virtiof=
sd.json
> ...
>>
>> Why don't you do that instead?
>>
>>    ifeq
>> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yy=
yy)

This was my first option but checkpatch complained because it is 80=20
chars long...

I also tried:

ifeq \
($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)

which is uglier and still too long.

Following qemu-bridge-helper syntax I also tried:

ifeq ($(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yy)
HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) +=3D virtiofsd$(EXES=
UF)

which is also too long =C2=AF\_(=E3=83=84)_/=C2=AF

If you accept checkpatch complain I can use the form you prefer :)

>=20
> Seconded.
>=20
> r~
>=20


