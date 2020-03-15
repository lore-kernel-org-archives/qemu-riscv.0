Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDYRg-0002eJ-OX
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 14:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDYRe-0002ch-Rp
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 14:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDYRd-0000U5-Ri
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 14:57:06 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDYRd-0000Qj-LM
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 14:57:05 -0400
Received: by mail-pg1-x544.google.com with SMTP id h8so8330621pgs.9
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 11:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PDtmTCwcPEgm4OuieYeOqkSBuA6jPU6r2b5Kj3wu1oM=;
 b=pUth1/9ncBfCYN6YqlK+vmtXviBb6Ab5lbPEN4ngphVZyRlUZZcPSf4IG33YFUV95O
 0Zn+nMcNcwIW7R5qlREXKG6biuBjhrdQa2CVdfj6sbcbAmradtXSLj0tz7c3XscM/vMP
 wsfgMJ+zHeeuEYkTzLVU1fpFCvBGEURJ6RJ6DiU5zW9iQR4rAHgd1tmxCz5mNUaruyNt
 gaEhXafLE53+gGWR0l4xxK8n6dqMAuBcZCTlW19I+gJBP5my039QrNbgAk8+RdshCXVJ
 o/HLtFUPGVM74xjlxBCDMU37+XzruIZspKxkcUKFxk0346bfi4eZhhwuFBDaRgeeDD+d
 Y+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PDtmTCwcPEgm4OuieYeOqkSBuA6jPU6r2b5Kj3wu1oM=;
 b=mDgffEa2OCu76e6G0iNEcvMyBYSwLpx7dFw6snpakZSpxinOGBWo1MCFJrTvOCheAG
 kHyoPoiZpLxqDghuCwGpucR//+enmDfudvw+AKol3v5zf27QpLz6kWGNXrSPQXKiawA9
 dv7vk5H0IFqszi0w4I0CCsnAgYmm4IMYSCRTX30oXUYhicMokSvBJujx68UfO/e89kTL
 PEDVRlrrRGLFL9nvjOKCAQPlmPnwEi+IEFBDIsbe6MvNo2W66TD5SjXi4rex92k9VN22
 Dz9ucoIqoEP5MWrRPaM6NR35QX6SXGDBMwxKv4vMJ6wq3RBK8/e8AobtcpNqGbATF7ru
 Rsrw==
X-Gm-Message-State: ANhLgQ1zel9HZS06USrkncgLSpbaSb5CQGIs89bu5gHkPjef4j35vtqz
 BCl4ftkAMzSKMZLWfMugxA5wEg==
X-Google-Smtp-Source: ADFU+vsTr5M+ef7X/zSRhKhoSQ/0bU2ZQ8EIWwuFuxsb7Qgf6/xLgdzo/Fxd5aM033NPbk69mtkWXw==
X-Received: by 2002:a63:161e:: with SMTP id w30mr23216111pgl.110.1584298624662; 
 Sun, 15 Mar 2020 11:57:04 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 x11sm63955419pfn.53.2020.03.15.11.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 11:57:04 -0700 (PDT)
Subject: Re: [PATCH 03/14] tests/Makefile: Only display TCG-related tests when
 TCG is available
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
 <20200313183652.10258-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b3eb94cb-7cf4-2cfb-8eb5-ca1204c2be61@linaro.org>
Date: Sun, 15 Mar 2020 11:57:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-4-philmd@redhat.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 18:57:08 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/Makefile.include | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


