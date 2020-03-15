Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDaA6-0007PU-FP
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 16:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDaA2-0007Mb-DW
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDaA0-0002U4-Kc
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:47:01 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDaA0-0002Nf-5L
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 16:47:00 -0400
Received: by mail-pj1-x1044.google.com with SMTP id q16so613061pje.1
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 13:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
 b=F8LLSDYokjrvKwG2NQoQYGcetH+fik9pnmkrqUH61GX0Ecp+Gb5MuTDhYkZ161ebLp
 BPuoefzHvR+F0GAnsWcTsEjXYI9SHQ7bbjqKzOWWvsh+m0jDCjXFAqNdg/6sRvxbc9I7
 IEK8ArLybbuVCbeqwIf1e999QdNRDKkzlXKTxhxMmWJjw3jI15NgFZInTA2mDJl2w2vi
 V24ulgs1pjsnUeB6yvfFuczE4ynR5tufpqj1g3NIi2Mi7/PEhW131Oc8O2s/uOwY2bO1
 roi17YX0kEfLTW3hBWopcWI8Vz5kqfQWEXq/nsD12VXWfzqt8ILK6Rh4OX2rvMGFbLfw
 NP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
 b=TApNO6nH1EGIiphGiP5mOlJbMP0wF1Zdv8ZBHNVpohI5SNCoxALh7D3cI/ZYfs+p2S
 wGNA3oOpB3j2QCERM5YY5r2lLqMLXfDynVaajJoASWWiLOF1vVTXrOBpjBZj2EL6Ep3A
 cGjnrfrv6PgPl4nS33xMaLqTXLjh+6L5PIDRT3KppF4sBdNpsrLPeCHNP1Vx7tjivFE1
 xJW9+E5EHjBpgUJpTxY984axacpakDQWafwqqZEsLO49dT9FxIjARVySuqD33gpvddjo
 ShCeHbkl0dSrKystKNbloh6/fE+BnVIYjpqaICLnERWUdAlSDDvidylNHgCZmozVuf7g
 hdMg==
X-Gm-Message-State: ANhLgQ1Z2DxFZ/A5otVLXfimw63BA4kIkAhcgbYuQz5i3L2E2Ww1WgGl
 7NcBQ7Gtk70jeoUSnRwDClI57g==
X-Google-Smtp-Source: ADFU+vuJfz8Bo0sTahw3ewMurLHkMeVZW8PiA9ut4lbIj02rxUkZbRcyZ1v29XaQvf4kU30AvZePRQ==
X-Received: by 2002:a17:90b:288:: with SMTP id
 az8mr19863626pjb.25.1584305217951; 
 Sun, 15 Mar 2020 13:46:57 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b189sm8661705pfa.209.2020.03.15.13.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:46:57 -0700 (PDT)
Subject: Re: [PATCH 13/14] target/s390x: Restrict CpuClass::get_crash_info()
 to system-mode
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
 <20200313183652.10258-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71ef67f7-3b14-8769-868c-ae339b84e364@linaro.org>
Date: Sun, 15 Mar 2020 13:46:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Sun, 15 Mar 2020 20:47:05 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/s390x/cpu.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


