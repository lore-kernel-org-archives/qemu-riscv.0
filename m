Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jc9Og-00043Y-CD
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 11:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jc9Of-000425-HK
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 11:15:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60199
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jc9Oe-0002Iw-UU
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 11:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590160540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bgwxBnm8VD+Y/kxKW7/OF/c/OhXh/FcLyD2iTqVqTJ8=;
 b=FbzUF1G7XiUZ80oFGh6q0u9EB6yUZIu8mDo1CPkAjpk5VajSQ0K2rDDEwIFC6iZqj7lKhy
 u2TpaTDIbrnf1Xkm8DMmYN8pKyd6sARE6r8uhbBanppxA+qpj2S9k15yGSj9v93r+XqVk1
 IDIRRGr8+GUnqrbsiYxSxbnx5OmL0Hw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-0zu0WZ9lNA-GXrPs8VBTSQ-1; Fri, 22 May 2020 11:15:36 -0400
X-MC-Unique: 0zu0WZ9lNA-GXrPs8VBTSQ-1
Received: by mail-wr1-f72.google.com with SMTP id n9so4494232wru.20
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 08:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bgwxBnm8VD+Y/kxKW7/OF/c/OhXh/FcLyD2iTqVqTJ8=;
 b=jt2pHwnMpmzvjYK8cIhigMZ/WrcG/XmFwYpQjinWFw0p2IeBjb65om19SEv3w2lJlq
 aR/IxfsuDtk7zGOl3S9B8v0deW63Kb/eWDIvsg1tReSJRT0gs0k2T5GZDtAUKNSi4kZW
 y9HAhivTAe4kWpq/F4Au7CRU4okVG/NfJRFSZUNS5lNt7L3nHLHqAcFCQVL4bylqSdsA
 3ZjJufgQQ42pNBdZEJFsAGgSPLb0ca0hTEgHPAzIkLj9N3Lh9iLuTNPX7LL0+ZrDWdmV
 /JCa6vAT0hR1KXxPyCJkyrGQ30aHzQCoexL4aFreL8ur/NrCpR0z2lpFjDAR75YbC0Xv
 gaXw==
X-Gm-Message-State: AOAM533clm3c9SSd8/lCqUwjBvTgV4fXZxs6kC3Grdm+2+A6qbD6Q0lj
 LZYrGTjVnoZk9nORgIup8Ri1r8yiXul4i1Rg72aUVcwA1IqlXf9aDUCkAVoSjwkaA3SE0tFH4Fz
 qWrWDVnba9be8TsE=
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr1546085wrq.131.1590160535591; 
 Fri, 22 May 2020 08:15:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWRWgt4hKN9BR9l5oRJE0HSIwZzKGuRBNwKc9iewD/J/v1TtHDYT+PIxoYnE10EOY0ydbgyw==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr1546051wrq.131.1590160535216; 
 Fri, 22 May 2020 08:15:35 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r9sm9719735wmg.47.2020.05.22.08.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:15:34 -0700 (PDT)
Subject: Re: [PATCH v3 09/11] rules.mak: Add base-arch() rule
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-10-philmd@redhat.com>
 <ccd78343-795e-8874-e4f3-bb6861ea64f0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <c96d1032-d702-c957-f85b-82ac4663c859@redhat.com>
Date: Fri, 22 May 2020 17:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ccd78343-795e-8874-e4f3-bb6861ea64f0@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:11:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 15:15:41 -0000

On 5/22/20 6:24 AM, Richard Henderson wrote:
> On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
>> +		$(if $(findstring risc,$1),risc,\
> 
> Eh?  riscv{32,64} vs openrisc.

Nice catch, because with this patch openrisc builds with a riscv
config-devices.h =)

> 
>> +		$(if $(findstring x86,$1),i386,\
> 
> Do we really not need an exact match for x86_64?

OK.

> 
>> +		$(if $(findstring aarch64,$1),arm,$1)))))))
> 
> Exact match?

OK.

> 
> 
> r~
> 


