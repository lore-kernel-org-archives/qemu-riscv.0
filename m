Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDa9Q-0007DH-6n
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa9M-0007BR-T6
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:46:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDa9L-0001Um-TF
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:46:20 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDa9L-0001T9-MJ
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:46:19 -0400
Received: by mail-pl1-x643.google.com with SMTP id t3so6959678plz.9
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iFXp4zNmSDqQKJwjNyZbD2cn17LZUGny+MQasX8s9wk=;
 b=XCJmfP0i1fvapM5nqotmFRwsScJCqgbVxhwrUww3l/xWsprL8DCsdbn41PFjOkeuCz
 FvdGWZqiNaC/dMIJOuRoaHuAIgPGO+sKeTVeQCjD0iBD1vVTT7PTfQdcbBYsiOOuiQDM
 Wd69FvdRlO2H234TD2sVWj6pfhsx89AAsaEJ6iysIsNaiJfY4VN8vkBEX4Jusd3bqQjF
 WsUgOVwjrrfyHE0+qsAi+mHbdolKsp/Yaa4uHDj/5G7YcCIlUCym8ofMrolmHltbFWKM
 dfTwxXqP4/j8E7p4VeGRUQvsT1cMBQyK5yAUtGF6rfo70zL+CCCAKZDQx8bMTGFsuTUt
 W/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iFXp4zNmSDqQKJwjNyZbD2cn17LZUGny+MQasX8s9wk=;
 b=QI7DUyWFa1uZZDp67GQVf5J7aQ9FT8KOJxWnl4VIDCIxeXbVQUF8/QKEaCvKKaWFmU
 /ttkrHuPh2SBf6QJjjfL8m3r2auECP2IRHr5FoyUuWezsCvM7Y77AYWvtC6QhmBkpztW
 gMVYxk2je2yBi0bXaYi0bgKnOO8afAa2hGvF4srfFCxCqFdo41mjDIK9prlRJAf+Bjja
 KweBhECL3tRNibp2MgfjIgwUogY2DYi77qN2qazwXWCAv2i1RQlPKCTjtMDpfLtJqeyz
 PTdjpDFb7Ngyevm4/DOYZOKj59sE6luirTAot3MOaTQ+QcWx11q5Dtv3+blhXqPVNVt6
 L0pw==
X-Gm-Message-State: ANhLgQ3r4O6HlfqDO2MUDUsh392S6mlfBI9ejfySR3xX5ozZTIbe6yVA
 2fLCtp9UzjVjAoFGWRF1cVa3pw==
X-Google-Smtp-Source: ADFU+vsPw+Ai2GQY8mcs8tJcvUx7H9FxQhMgeeUGIQwJfp1TKTa7gtiZGs139/XFZWCwXXpzH8yRNg==
X-Received: by 2002:a17:90a:d34b:: with SMTP id
 i11mr20522008pjx.180.1584305178521; 
 Sun, 15 Mar 2020 13:46:18 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 o66sm51279474pfb.93.2020.03.15.13.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:46:17 -0700 (PDT)
Subject: Re: [PATCH 12/14] target/i386: Restrict CpuClass::get_crash_info() to
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
 <20200313183652.10258-13-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75c44540-a833-4c35-d698-9e919c68c47c@linaro.org>
Date: Sun, 15 Mar 2020 13:46:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Sun, 15 Mar 2020 20:46:22 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/cpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


