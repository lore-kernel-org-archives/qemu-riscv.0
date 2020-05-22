Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jc9L5-0007ic-AC
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 11:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jc9L1-0007gi-9l
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 11:11:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55350
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jc9Kz-0001Lp-7V
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 11:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590160311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DLKf/Nb8XQKXuRpwhy1Ic949V2/xhEZGsSVSdMGGkZo=;
 b=QCKx81ie0tsIDC1UJt7DvK4y0CO2rXb5SB8Arfy3xUD6USK6DK6zH7qmy8fYhaALQZwfXg
 bFcxzKFIL1ABqpi4bPrHXQPVvg66YuSo+iRlkL6ERQR2RatuXIlL/IpE6Si+wBH3KOWgeg
 reGmWs11ej6v1uYUMPGvXEq/axY5n98=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-mtijtDgWPwWdRNZzBr7vpA-1; Fri, 22 May 2020 11:11:41 -0400
X-MC-Unique: mtijtDgWPwWdRNZzBr7vpA-1
Received: by mail-wm1-f69.google.com with SMTP id f62so4246599wme.3
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 08:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DLKf/Nb8XQKXuRpwhy1Ic949V2/xhEZGsSVSdMGGkZo=;
 b=KRjjR4CG8V0E6M3MZGWpAVN1AbgyvUqq7wkA5wsqrHIITlK7XSFfZ7bwTQTsj4oGeo
 7jmRbMBf7hqMxBuSYU0gpWSnpnhh/Z/vi7oXTGSV3lxRDCP7ox/zttkVa/vrwqmhXt8p
 ShgcjYDkRN3vrXFnow4RIm7hEM9N/GkF2kWtDPfxEilHFhk1izBiiWxJ03TY/+AWFp81
 dw2cj5DCaMvuLJA7XhUNZlzVpB1jnmNbrTDkxFKqQWpm/QEbK0g+wHfZbSWX6N2cy/5N
 H3JtLmLzdvRfDIMZUpwnr/N9RCHOrl+e6MguOYJDVQGdkyW18iackoGyntbnFDHugUpl
 IY7w==
X-Gm-Message-State: AOAM531iCR64IYG8nNoBq0kXTDI73311sU7EQRZbO75eT6QxWGYE0E31
 z0vGu28HASRaX2AF+n6/JTsrw++7dWBe9e/VN3hGWDvwpkfyXlPFK07NhHXyeX8JdFjusfpBHOQ
 REyekYI03P7XBn2I=
X-Received: by 2002:a05:6000:1244:: with SMTP id
 j4mr3924154wrx.189.1590160300254; 
 Fri, 22 May 2020 08:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG/+d4+DE2m94dLkPBnJ8imYmfCgj/5Y0RX9tFdihAuvwLfHw6ddoYoAxZo5Q6JLvA7ucZJw==
X-Received: by 2002:a05:6000:1244:: with SMTP id
 j4mr3924113wrx.189.1590160299902; 
 Fri, 22 May 2020 08:11:39 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r3sm9455854wmh.48.2020.05.22.08.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 08:11:39 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG, 
 and allow to disable it
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-12-philmd@redhat.com>
 <36db7554-dcc0-6b8c-e7b7-628c105d8fc7@linaro.org>
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
Message-ID: <d7635637-2b34-fd4b-ee90-945c4c9fc9f3@redhat.com>
Date: Fri, 22 May 2020 17:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <36db7554-dcc0-6b8c-e7b7-628c105d8fc7@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:11:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 15:11:55 -0000

On 5/22/20 6:26 AM, Richard Henderson wrote:
> On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
>> +++ b/hw/semihosting/Kconfig
>> @@ -1,3 +1,5 @@
>>  
>> +# default is 'n'
>>  config SEMIHOSTING
>> -       bool
>> +    bool
>> +    depends on TCG
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 0000000000..035592dd86
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,2 @@
>> +config SEMIHOSTING
>> +    default y if TCG
> 
> Did you answer my question about replicating the TCG test?  If you did, I
> missed it...

Shortly before posting this series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg705992.html

There is indeed something wrong with this patch, but I'm not seeing it.

- semihosting only makes sense with TCG accelerator

This is the "depends on TCG"

- some targets (if built with TCG enabled) require semihosting

This would be a per-target "select SEMIHOSTING if TCG"

Another problem is some targets only require semihosting in system-mode;
and this approach select it for both system/user modes.

Paolo... help!


