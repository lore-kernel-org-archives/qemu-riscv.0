Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuwa0-0007E0-De
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 05:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuwZS-0006M8-J8
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 05:52:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuwYb-0000mk-RH
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 05:52:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49816
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuwYb-0000m3-Mm
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 05:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579863081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjbvZqpoczPDoeV6seNWyauouAIOFLYf616kaRIHjPg=;
 b=JeOfWSndijw/dyciuml2XU3ndqnTymbtgQnVfe0crfwZZWsFo/NTCxiX50r/zg7UEHDz6u
 gSYQYpSJpZGNwg7CC/fRcU937ZYtiLMMAaU32Dxzksepw21KnKs+3rtqK+s6PUkPUFyT6A
 VX7qEw0UL/ibd/DRL+ey8fbMThDdJn8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-9dHGhc2OOMm2wSXrCdU8qw-1; Fri, 24 Jan 2020 05:51:17 -0500
Received: by mail-wm1-f72.google.com with SMTP id u203so326188wme.9
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 02:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TZ9DbU1BrQfEqK+U3ZmiXY/yNPpAPPefKnaomrQsUuY=;
 b=j6A6FizPzIOHHc9V3qKErD1Glg/j/R1cygddI4ijctWVX/dUHtbliTkBpeP+v2t0c6
 pPh2XO9era3z9W1fgRdP2Pn1hLY05l/8qBgtawK//pK4zwrlyxYnh6SMyinBiy7d9aH6
 J8J3ZQcskONDzp1yfFNIbJI1SRyaGYaM5yEd0IMhunjTcPvj3ORl7y9BKgUxpOfald92
 ut7Td7CqM1rU8h7VJZlaeUhNPOodgxkKD910YjYtSYaW3C8C3P/MP9YalyDrLnTEKis7
 ZhPPPU8cPpYe2ZkucYoRlm8OdNUM2q6HCKBw+gBLngz6aFSwcP+Jfqkd6yXDLqnXB409
 tJiw==
X-Gm-Message-State: APjAAAVqqgh3ltDu8KVLV2UUZthEKEUllA2JBJfQqlodudAX992jtGdc
 pJ5qsq7LE/q1DMMEO84CsETYUn6bFDnGuGRMEd2PD/AwjjdudV3kqLokZ3Ld2VC4s3SvyC5TQdB
 f4P3WTiLUBp45q+A=
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr2771446wml.107.1579863076253; 
 Fri, 24 Jan 2020 02:51:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqx75dX20BJNh1VUBEnwpTJD5hjXVPNuli4AY+JLCb1Gls9ZXY2uSN01ovf0bXw7q4E1zPqn2w==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr2771399wml.107.1579863075934; 
 Fri, 24 Jan 2020 02:51:15 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id g9sm6952640wro.67.2020.01.24.02.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 02:51:15 -0800 (PST)
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 S.E.Harris@kent.ac.uk, Edward Robbins <E.J.C.Robbins@kent.ac.uk>
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, thuth@redhat.com,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 imammedo@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake
 <eblake@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 aleksandar.m.mail@gmail.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, dovgaluk@ispras.ru,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org> <875zh1yw38.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <790c5181-c4b0-ea7b-f4e4-07bacae220b2@redhat.com>
Date: Fri, 24 Jan 2020 11:51:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <875zh1yw38.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: 9dHGhc2OOMm2wSXrCdU8qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 24 Jan 2020 10:52:46 -0000

Hello Sarah,

On 1/24/20 11:42 AM, Alex Benn=C3=A9e wrote:
>=20
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>=20
>> From: Michael Rolnik <mrolnik@gmail.com>
>>
>> These were designed to facilitate testing but should provide enough
>> function to be useful in other contexts.  Only a subset of the functions
>> of each peripheral is implemented, mainly due to the lack of a standard
>> way to handle electrical connections (like GPIO pins).
>>
>> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
>> Message-Id: <20200118191416.19934-13-mrolnik@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> [rth: Squash info mtree fixes and a file rename from f4bug, which was:]
>> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> [PMD: Use qemu_log_mask(LOG_UNIMP), replace goto by return]
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
> <snip>
>> --- /dev/null
>> +++ b/include/hw/timer/atmel_timer16.h
>> @@ -0,0 +1,94 @@
>> +/*
>> + * Atmel AVR 16 bit timer
>> + *
>> + * Copyright (c) 2018 University of Kent
>> + * Author: Ed Robbins
>=20
> No sign off from the author here?

Hmmm I Sarah Harris's one, who is from the University of Kent, isn't it=20
enough? (I remember patched from Xilinx with Edgar S-o-b but from other=20
authors, Edgar vouched for Xilinx).

Sarah, can you get Ed Signed-off-by?

>> --- /dev/null
>> +++ b/hw/timer/atmel_timer16.c
>> @@ -0,0 +1,605 @@
> <snip>
>> +
>> +/* Helper macros */
>> +#define VAL16(l, h) ((h << 8) | l)
>> +#define DB_PRINT(fmt, args...) /* Nothing */
>> +/*#define DB_PRINT(fmt, args...) printf("%s: " fmt "\n", __func__, ##
>> args)*/
>=20
> Format strings are likely to bitrot. Either use a if (GATE) or
> tracepoints.

Yes...

> <snip>
>=20
> Otherwise:
>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks!


