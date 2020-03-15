Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDZi5-0006MI-G0
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZhz-0006La-Rb
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZhw-0000Kq-3K
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:18:03 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZhq-0000Bv-PN
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:17:56 -0400
Received: by mail-pl1-x644.google.com with SMTP id f8so6940505plt.10
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AhOq4VxYKsC1Jgb2Uc4npHOr2Sarvt2ZXKSUnRDtBtY=;
 b=Qsbw76KHjfoL6NG8zpM2gYqVJf7m5qJiaKIS2u8TTbT634TvTmTkGB0lhgLLbtc1F4
 1YftFaFHxss8PStF3Ovuq0s9RGsk3uifG3PhSTwDeI9onSZEQsXGfgk0U0pIWUP3wU5b
 9qDBDvRAN+Vs6g81T4CBKyLDnc5f91lnqB1N8WSNcA2jlEvgPLvu8dOE5IjSMZVo4Pf2
 9Csm6fx/qZ6pOcDV8lOhF7D2oGBNve6HNPz28GbOY0UzfScQAqijGRz5fQ6IWohQy+nE
 UgDcrIm5DSkbk5giYTDu2cHecWLyN7HW/bK9CAQD38YSmscVwetwrkaihbvbK+zWYlVu
 fhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AhOq4VxYKsC1Jgb2Uc4npHOr2Sarvt2ZXKSUnRDtBtY=;
 b=DnHekPxwqkGVp6zlxomUzUVtof7N/2uOIQqwv3rV/lPbix/CQtpRoouepd2r6Ktn/L
 Aykh2tOB0pLvR/b2UaETIVdCm9f/rLAczF6V1C5yNxBZJa/bpT3wx2gv7AEojnWbEVut
 fpx4uJyzEBY15oeQ/XcffO3h/4wrMCcuevqH3vjoNG9dmyIL3WXSpvyi6ekomEBacA/I
 zspJBJZZIaNHZ3t6UgCmnAPMiK+nEyBrRJIGeEF0qWT6274mJ35Tx80JYyt9cuzH3jvp
 xN0VQCWyruk0dLMo1JX1gWo5vR62gs6CJ2amyswDR3TagWxvhM4G5jAM3pNgsRGoMXGb
 tRpw==
X-Gm-Message-State: ANhLgQ2bpcC/gGX5RKkCSZYMVFlJsUgn46WXPbwpiBOYEhPZzZuImzMP
 CcMgTbkzWxo8dXQ4Bl49quOWiA==
X-Google-Smtp-Source: ADFU+vsRBAdAFKUNCyqTXhNmdMR8ILJNAGjnDYK+VeeFZ60mSUdnTys3f42VhTgSoUm5VL4pIzgDIw==
X-Received: by 2002:a17:902:be03:: with SMTP id
 r3mr23402910pls.137.1584303472735; 
 Sun, 15 Mar 2020 13:17:52 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 j21sm17288919pji.13.2020.03.15.13.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:17:52 -0700 (PDT)
Subject: Re: [PATCH 05/14] stubs/Makefile: Reduce the user-mode object list
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
 <20200313183652.10258-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24e2d723-cd4d-aebb-65f8-e4fedaab8926@linaro.org>
Date: Sun, 15 Mar 2020 13:17:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-6-philmd@redhat.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 20:18:05 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> These stubs are not required when configured with --disable-system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  stubs/Makefile.objs | 52 ++++++++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

