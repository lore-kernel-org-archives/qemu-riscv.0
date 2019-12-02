Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ibbOR-0005Nk-D4
	for mharc-qemu-riscv@gnu.org; Sun, 01 Dec 2019 21:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibbOP-0005Ky-0g
 for qemu-riscv@nongnu.org; Sun, 01 Dec 2019 21:24:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibbON-0007Oh-Q7
 for qemu-riscv@nongnu.org; Sun, 01 Dec 2019 21:24:52 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38314)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibbON-0007O5-II
 for qemu-riscv@nongnu.org; Sun, 01 Dec 2019 21:24:51 -0500
Received: by mail-pj1-x1042.google.com with SMTP id l4so4843864pjt.5
 for <qemu-riscv@nongnu.org>; Sun, 01 Dec 2019 18:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9uZMeOcjp69CcLk4kJoh51jLK8rzeIE59U8CnyNM9uw=;
 b=NdKXEZFPqImyiun752tSnpnNEyZG0dTjM0NwfMw7m/reaycfYDF5JhWaLkXPkOm+hW
 YtJqnFRYK+0i68KbHUGbwDX7xf2L5eRwOn0Z4XexdP5slDmA5M9LquKLrv4macGSEYB+
 s5lvW11sgcZfqb3Fz8f+XJD2vb21K0F+tofwnUu1/gRNzCoMkcxH2ttbHaiiykR0sR80
 zKnYQhYym+rUBSKupGJLIAaTPKdO44FmyaKa+ejylbqwcUx+cNLcEDR3D+he+esdPIw/
 sVYX/yIT9nXJNPQnA151wsnHZN1GMcCzCZX7udc5Evd2SyE0OrSvQbR5JwmWTD5ld3sc
 sV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9uZMeOcjp69CcLk4kJoh51jLK8rzeIE59U8CnyNM9uw=;
 b=tsUgtNoTJ7ttydHwlCBbhxJZQabv/Fh2ThE0JDpqX5OmhRB0nLVHNd+m8NUNqR2XQU
 6xNb5w42gTeRra16NEg6ecgyR7VzcYjI41cNvz6tHid+LvfTZfGQ9GFRjiDHEx5tB6f0
 +FUNBAZhwVgJ50GoIIQr4LeWutekaFeKf8ebrW5c7y+pWOlW9YrHUgBuSelI9tp1wgSQ
 Fe5J661aLxfvVjgXBDkMHIRlyD5rQZroQWUqOto/fDPslgaFBmWbCF6GEo749uo4e+mq
 lDCifA3X7GcG9cLw9FFY/SWnyHsXaiZmIsAyRnWyPxAGsooWqHUyoEYrZauHOn+1Mz0e
 78kw==
X-Gm-Message-State: APjAAAVlj3udrdSy4SfDIaqYct8vQOH4mInICDEOJ802pea8jKgTYsYa
 btkgHBXiAtwyfJaEO7o3Wbwv/g==
X-Google-Smtp-Source: APXvYqwNCsLHCmgtq4yEB82YTo8Go2tM/yn6Jyk+zdoQ0lb8zpr6smFP27PzPme3sWBdki3UBROaiw==
X-Received: by 2002:a17:90a:30a4:: with SMTP id
 h33mr32078066pjb.50.1575253490309; 
 Sun, 01 Dec 2019 18:24:50 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h3sm20818336pji.16.2019.12.01.18.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 18:24:49 -0800 (PST)
Subject: Re: [PATCH v2 08/14] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e052df9d-d2bc-b257-adf1-33299bf7b6a5@linaro.org>
Date: Sun, 1 Dec 2019 18:24:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Mon, 02 Dec 2019 02:24:54 -0000

On 11/30/19 8:45 AM, Alex Bennée wrote:
> -static int cpu_read_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
>  {
>      switch (n) {
>      case S390_VIRT_CKC_REGNUM:
> @@ -296,9 +296,9 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
>  /* total number of registers in s390-gs.xml */
>  #define S390_NUM_GS_REGS 4
>  
> -static int cpu_read_gs_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_read_gs_reg(CPUS390XState *env, GByteArray *buf, int n)

Sometimes you're changing the name from mem_buf and sometimes not.  Perhaps
better not to change it anywhere, or change it everywhere first, without
changing the type.


r~

