Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuySP-00011p-9Z
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 07:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuySN-00011V-9O
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuySM-0003iW-2G
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:53:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56385
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuySL-0003e1-V1
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 07:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579870381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bVOjj7Ju6IxK95jp5dAIPZ3xLwwMi6xKkMechx+Ako=;
 b=Qe+8SXyIBqzW3ALgJgRGinNAOVojdUOZBfJu5u3xy7x/0coVw3Crv2hnzCSYYPG64SyoM2
 I99waOG+DWlf5jwHtDk7PJ8IjDytef2ET5jY1NJVSg1YXHUDXuqARDKMB+xjUpTSHU5o/b
 AwErGntsfZmUSPIA4efjGYOHoBQrUws=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-eU_MVRajM2a-Q7ztsl7EAA-1; Fri, 24 Jan 2020 07:52:59 -0500
Received: by mail-wr1-f69.google.com with SMTP id h30so1115646wrh.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2020 04:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=duKxw9CDUcDeIO1l0oFi5IfctU/inKkCNIKDVjZASbw=;
 b=jGS/wWfc87EKmz1EDB1HFqck/NvH1kMJvAvidhlcb5NSo7+kdUGnkB79lNOGDd1XwF
 2UpgRq/CH3gF7eyFcWbCcJbm4zEng5h5lDjaX8zHEE3C/grFeLHnkgqQX9zFq0AA4Drb
 Am2iIxUE4sPchxygCQnMvXU5mKWRXr034JVPIHYI9PK3raJILOrJrVAdqpAKD/RD8ZOm
 zfFlVDhGx5l6+/CK1tPjDA8nyS+/KUF10XQVuwMCs/CH2ixCDCVFL7EFNBDMwtvHE0HP
 ozk3V2HU8UzBhSVDoCP1LRVu1jg+zRDj3UUSHhQbf0htFdPnYtdW6sSLc32wtGW2Sk5f
 pzyQ==
X-Gm-Message-State: APjAAAUjU/uaqWWjgFmR/4CrlkLbh0c4ICtYkJO9Raq9MHtkjm5jxHzJ
 Ru4TB2XYSuyUj0C8aJP5HX+GmhEMFKF8IGEdmI7XF/YnDe6cPS18NXcro4Ba/Au84Mk2YCm5I4C
 pQzuWowc1vgCeNKw=
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr4085123wrp.167.1579870378353; 
 Fri, 24 Jan 2020 04:52:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNmAlR7orhHdhQ5Vi8dkVrF7gYRPWG3v+DfDcOu8KVlldqst7WIKjWGKCtSV5xf7nVo073Pg==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr4085089wrp.167.1579870378089; 
 Fri, 24 Jan 2020 04:52:58 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id h17sm7859267wrs.18.2020.01.24.04.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 04:52:57 -0800 (PST)
Subject: Re: [PATCH rc2 12/25] hw/timer: Add limited support for Atmel 16 bit
 timer peripheral
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, S.E.Harris@kent.ac.uk,
 thuth@redhat.com, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, imammedo@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fam Zheng <fam@euphon.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 aleksandar.m.mail@gmail.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, dovgaluk@ispras.ru,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-13-f4bug@amsat.org> <875zh1yw38.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <28386847-9b49-2be7-a6df-f6ce030855ec@redhat.com>
Date: Fri, 24 Jan 2020 13:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <875zh1yw38.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: eU_MVRajM2a-Q7ztsl7EAA-1
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
X-List-Received-Date: Fri, 24 Jan 2020 12:53:04 -0000

On 1/24/20 11:42 AM, Alex Benn=C3=A9e wrote:
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
<snip>
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

To avoid respining, I'll do in a new a patch on top of this series,
and Richard can choose to squash it directly.

> <snip>
>=20
> Otherwise:
>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20


