Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDaQ1-0004JZ-E4
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 17:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDaPy-0004Hv-Pz
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 17:03:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDaPx-0003VU-Mm
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 17:03:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDaPx-0003SA-GG
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 17:03:29 -0400
Received: by mail-pl1-x644.google.com with SMTP id t14so6974363plr.8
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tf2d/Pl21azP6oW+6DBWLXnY3oSLQe0tdutvXKmprPs=;
 b=dNFPTvgljfFOiJ2YAsaIlCtKqscBDJvAI8JT6p8y6vGZdv4Kdn4jqyC0lXIw9QHlXd
 21T2NyX1+7TOBoNjxtYVFf7MSleW5NO2ntxLDzQywJcfK8+/C+ISJdkK0ztYLe4Q5i2F
 qPZNYEmu4h4KIlDvc518jQy1KMx7bSKhhWSWp4Gybj2cjcPQY4pU+/Hb+ec2a56E7EO1
 A21W7zYYcGr/60BGPqWBzs8FzY+k7Ef1R9hrT6pyhKCahiM/IICoLpyv5QCntxFkwbeo
 HsYqxnpWiGDLJ9eJGfiH1hu2Q9SIBxSXn/Mfv6l/dYdhmEmugo1ngCkYkzT4GjutJRR6
 Iqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tf2d/Pl21azP6oW+6DBWLXnY3oSLQe0tdutvXKmprPs=;
 b=b0ifkh9vM74ZSaDqfszPVbLGGFCA+JcObIboJ0ILgFFm9DKvqcIkUffAkGZ5L8i3I7
 W02l8zya/gH+p6nPC8szw9cbFrYyeKndPWc3Luxnw3R0OadT+SZPHvFq8PZwW7JlCGHm
 aVeYuvliM7hAF/5Ago/1ZaEwd8QZiwNBdWCfpxZbOP7DpWEXCjWPsZ8jO7xP+C/5fZ76
 4Tw++MACSgsHJuzttbf+OvjIgnayyTnsx22pjcxlh6Lh6ONicjYppjfqlRfrIxAsb3QK
 vdpGYwrM5f6Bh37qAybcF4EN95bUNP57agDgjj9zuu5BEHeFmlSsJJ3+REoJbbMuvWD4
 3xCg==
X-Gm-Message-State: ANhLgQ1Cuo547dc4JeWWy3vIv7d1icQ7gJ2uSDjrJP2VDnenGgbWSWQN
 jJ7CG58g+nLLaSXxo3u3gopwRg==
X-Google-Smtp-Source: ADFU+vvY8QDsdzkr3n15NQNan1u7ji2ivB7a+dbOciaTSo03WB6wWvQWtqSei9LxDxPKFJZf1CI8eQ==
X-Received: by 2002:a17:90a:d081:: with SMTP id
 k1mr23020343pju.57.1584306207058; 
 Sun, 15 Mar 2020 14:03:27 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e6sm14756519pgu.44.2020.03.15.14.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 14:03:26 -0700 (PDT)
Subject: Re: [PATCH 14/14] hw/core: Restrict CpuClass::get_crash_info() to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-15-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad894cd9-7916-0a24-8466-adb41c3ad854@linaro.org>
Date: Sun, 15 Mar 2020 14:03:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Sun, 15 Mar 2020 21:03:32 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/core/cpu.h | 7 ++++++-
>  hw/core/cpu.c         | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


