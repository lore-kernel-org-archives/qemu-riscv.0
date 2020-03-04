Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9HcJ-0003hy-C3
	for mharc-qemu-riscv@gnu.org; Tue, 03 Mar 2020 19:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9HcH-0003g2-BN
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 19:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9HcG-0005nC-5H
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 19:10:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44342
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9HcG-0005mJ-2D
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 19:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583280623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVniUVYRygY3SLjMTMIrb4u7u3AekyD10DlRdZpXe5M=;
 b=CUAIMSqOzhnSwvTwSNgySdBhKSCvRJqOKupiVMq2Ysn/j0O2AuadDndzv4NUmJMgPgkNiK
 B+kwDPzQNrrYsgCd39IzRAUMv2yBBX9OxlGKk9sXFOfDmCsgRsOKREP4aBtmzXzZV34Rnq
 9jsqO9zhDkN7+SwuwWUXfUdd7bbtHb4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-_fE25_xwOzC0Knztmymhrw-1; Tue, 03 Mar 2020 19:10:21 -0500
X-MC-Unique: _fE25_xwOzC0Knztmymhrw-1
Received: by mail-wr1-f72.google.com with SMTP id w11so91700wrp.20
 for <qemu-riscv@nongnu.org>; Tue, 03 Mar 2020 16:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yqmqjAjqlW9ia9aj9VahL5KNuPi9NrDLAY10DHXBTnw=;
 b=cy/yLB6meT9kKKZTZNwBIHE21JgLmz6//pExBWQfh3sMYCPFAOZeI3ZJ9Y7omV+kmj
 OPFasJTCa6d5ngokM6RDoexI7kVGrivpC1pKTE9rr71r3E8vwxVDMXmG0EtgMqmKuA0F
 YS8RTDHeNMiwfxIa4eYIRNNb/DryHknVWJK1pogBRCf8tI0fLCiapCkUKKXvIC3NNdZW
 o6Vqs07emPAC95kf2sCULo3vZFytyx/lb4EamvVCwYe/eqHMHlPAb1DVSHSDYU/C6Lv0
 z4fcndxMb0K0NXlyt4boyuwDcRV3mEM1CjSHJ1n92OIiGkfLUfTbXN7wEqnSG89RlSmO
 ssVQ==
X-Gm-Message-State: ANhLgQ0txEW/O4vbsuEk3m+APKnXsmoCpjO6u4z12VNYK2sEoEqLlVus
 UkETmWTELNOkGx3Ol8fY9XZ1CdUb6CsclcRO7H1bGqSgq7NvKolUPUVi+gTUNDkJa9IgXiADL19
 Ri29OQDjlyX7mV04=
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr123350wmb.186.1583280620649; 
 Tue, 03 Mar 2020 16:10:20 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv4QLtfWGtbW4JOUCFN3djlPzgYgEKxkO6SYhTcV2v8+7T2FycKyYtvVJc7uNYB5nyiNqED2Q==
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr123294wmb.186.1583280620277; 
 Tue, 03 Mar 2020 16:10:20 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id f17sm26091800wrj.28.2020.03.03.16.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 16:10:19 -0800 (PST)
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Chris Wulff <crwulff@gmail.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <226c0d6b-feb5-d202-2fdf-ba4ae910e463@redhat.com>
 <4f960fe0-e5f5-1f8c-76a1-b1df2bef4bd9@redhat.com>
 <CAFEAcA-H9nOzSon9eqiL5w1Rq9qVWu=B1q29D4pLTd=u2cWSwQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87269add-a5f1-4dca-9ae8-de392d7dbfd7@redhat.com>
Date: Wed, 4 Mar 2020 01:10:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-H9nOzSon9eqiL5w1Rq9qVWu=B1q29D4pLTd=u2cWSwQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 04 Mar 2020 00:10:26 -0000

On 3/3/20 7:36 PM, Peter Maydell wrote:
> On Tue, 3 Mar 2020 at 18:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>> Nitpick: you don't need to include the bracket symbol in the diff:
>>
>>     @@
>>     -resetfn(CPUState *cpu)
>>     +resetfn(DeviceState *dev)
>>      {
>>
>> (simply indent it with a space).
>=20
> I think this was probably leftover from trying to get Coccinelle
> to not rewrap the '{' onto the previous line, before I found
> --smpl-spacing.
>=20
> In general I don't find it terribly useful to spend a great
> deal of time streamlining Coccinelle scripts -- I think they
> are basically one-shot uses almost all of the time, so once
> they're producing the right changes I prefer to move on.

I agree in this case it is not useful to add the script to the=20
repository as a file, because the cleanup is done (as you said,=20
'one-shot script'). The script is however valuable as in the commit=20
description.

Cleaning it up is not for performance, but as the script is buried into=20
the git repository, it can (and will) be used as reference/example by=20
other developers.

Anyway this patch is queued now, so let's move on :)


