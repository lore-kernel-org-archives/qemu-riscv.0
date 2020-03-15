Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDbcr-000335-DJ
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 18:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDbcm-00032P-N1
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDbcl-0001eW-H5
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:20:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56303
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDbcl-0001ZO-9w
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 18:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584310846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2D7bkdwvbndMrUyNh6sDviBz4171BxInLQo0HF5lyY=;
 b=hP5LgxDDtKidkMd0wxZbcDsg+nF+IRCq5TeuUxiMNC/YlycBLP5tVNUacaupkiR3/dkNkg
 qfeySuK45E3Ajx7vV1ptf/9hWfS2B8h95ZkEGNPIchGL2kPDssX3OItO4evjWx3zda3yLD
 tQ5agTWT3HOr93Z2LsUTvcMyIzfX9Zg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-JIaEPWZrNj-yVB16c-5apw-1; Sun, 15 Mar 2020 18:20:45 -0400
X-MC-Unique: JIaEPWZrNj-yVB16c-5apw-1
Received: by mail-wm1-f71.google.com with SMTP id i24so2972359wml.1
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 15:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jli2nez5UekOBc427wJHMKwGcjgVsf+7alJp/mq+nCI=;
 b=iR97m9seu6UTke/7lXILuCztCKBvIALTZlH1LUdpaIfhJJ4qfO7H2pRIoIF7/Jt/ym
 SCzysgvaSNyXYlDrKiB+Dk8I364sTiEtENANIZZjmDB9RWHe8gHxKQODLnhmIjhH2roA
 lMPnq1ywFKMd3mlpE3GDB2S55mUG/zJyoCZFdHy8R8qPJIp1F0K/NKRcZwci8iMmG/3s
 uQkn+1W0LdcNiFxtp2Y22wb6tBix3Z1bfpo7s8dlm20GEbJQdciN6L2A0ozlTjh8ePh/
 U1RodD3yTxuS3oAB3QZ1lfXORHcX4jaRE3csy3IMIK9ep/+J68ibwWFLgbIKqO9ckrBx
 9WAg==
X-Gm-Message-State: ANhLgQ1Zjwbv0NEWWAxKhqiWqVpCcSisWPWlYlW7DzLZJyNf1NAbYWlS
 vtXciFE27XO2SdDpZiXmICeRVjXmZbuYN3d5zD+XLKKaaB2SBbYeEmK2FfAwEHjhHzTWKFfLkqv
 3M0llo3IKbZOefjY=
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr8106425wrx.130.1584310844210; 
 Sun, 15 Mar 2020 15:20:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs6KxVepLGqG+3FvdCYOFEixDOrgXfo9SUxpugF5dxHBxknKmVnV7QCaGv3YG5nhvVlnzHbwA==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr8106393wrx.130.1584310843984; 
 Sun, 15 Mar 2020 15:20:43 -0700 (PDT)
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id c2sm27522294wma.39.2020.03.15.15.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 15:20:43 -0700 (PDT)
Subject: Re: [PATCH 09/14] exec: Drop redundant #ifdeffery
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
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
 <20200313183652.10258-10-philmd@redhat.com>
 <fdbcdfba-9467-2270-7309-abe8e509edc2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee7ce742-7750-eee7-67a4-804f65f114a1@redhat.com>
Date: Sun, 15 Mar 2020 23:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fdbcdfba-9467-2270-7309-abe8e509edc2@linaro.org>
Content-Language: en-US
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
X-List-Received-Date: Sun, 15 Mar 2020 22:20:51 -0000

On 3/15/20 9:39 PM, Richard Henderson wrote:
> On 3/13/20 11:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   exec.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/exec.c b/exec.c
>> index 7bc9828c5b..f258502966 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
>>       unsigned long dirty[];
>>   };
>>  =20
>> -#endif
>> -
>> -#if !defined(CONFIG_USER_ONLY)
>> -
>>   static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>>   {
>>       static unsigned alloc_hint =3D 16;
>>
>=20
> There's even more than that.  Looking further down,
>=20
>>      745 #endif
>>      746
>>      747 #if !defined(CONFIG_USER_ONLY)
>=20
> This is the #endif that paired with the one at 190.
>=20
> Later,
>=20
>>      988 #if defined(CONFIG_USER_ONLY)
> ...
>>     1000 #else
> ...
>>     1031 #endif
>>     1032
>>     1033 #ifndef CONFIG_USER_ONLY
>=20
> So those three lines are redundant.
>=20
> Later,
>=20
>>     1252 #if !defined(CONFIG_USER_ONLY)
> ...
>>     1438 #endif /* defined(CONFIG_USER_ONLY) */
>>     1439
>>     1440 #if !defined(CONFIG_USER_ONLY)
>=20
> Clearly these ifdefs are very hard to follow.  I would thus welcome a spl=
it of
> this file.
>=20
> Possibly into exec-common.c (with functions present in both softmmu and
> user-only, with ifdefs *inside* functions only), and exec-system.c (with =
no
> /#if.*CONFIG_USER_ONLY/).
>=20
> But exec.c is over 4000 lines, so if there's another logical split into e=
ven
> more files, that would be even better.

OK, I am taking notes for the 5.0 cycle.

We can drop this patch for this series objective, as it is mostly cosmetic.

>=20
>=20
> r~
>=20


