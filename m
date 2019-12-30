Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilrq3-0001Wu-5E
	for mharc-qemu-riscv@gnu.org; Mon, 30 Dec 2019 04:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilrq0-0001VW-V8
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 04:59:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilrpz-0006QA-VU
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 04:59:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22426
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilrpz-0006Ph-S2
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 04:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577699987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqFk+x0X9D60pam+u0Foq5BjemwZC+N+k+hZLjLiTVE=;
 b=EqAo2gOoF/1w9a+AzrWDzuSWGz08rlzmYwEHibvcZuaKxHeJCMxePyxgYfLXwpzEkDlwdy
 WC9FW/Vl1xseaSB3smLGo7r9yLCw/0Y/5YAnecV5i6No3OiFAMtKT3jfHVjZfSvUzaB3gq
 UBtQ9cCxxb93UO9NzV0e6MsSCQzFzSE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-M9rUdIUbN3-MNkEvU7j-lA-1; Mon, 30 Dec 2019 04:59:45 -0500
Received: by mail-wr1-f69.google.com with SMTP id f17so3401962wrt.19
 for <qemu-riscv@nongnu.org>; Mon, 30 Dec 2019 01:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nHtO6Vsw0hLQyKeVXTvkdGim74QMEL7005MktoQeb/g=;
 b=CTPagTdf01gmR8FvhRY+alY0cmtR99KtWWoOkIshG2W2biCFyrt8NL7wc9d1+1Hi5R
 eRtJ3+lH7O3fE9lZ8j/B8Zqii6IhiTiMWovxJSes9c7Tj6+i4DiYpV42cGmDOHcYQ5qQ
 xroRE0JfBf6s9Nhtsvp0ruA6t1UcRXcl9NgXXPr7qocQsMbSRCxeE7A5mI+/D2f6dUl3
 a8ZRz0xJs7xaszbp79tEz9MjX2EshRzKkPsI8BywT6S7+PHE3c5QOqKibv1Ql90RiwVO
 vKhaYkUaNwMv7zvsUg7DOq4jeCOKcuRG2oOwBSm8hH2WEyZV2edzyIWI99Qjbz5N6vxe
 MmeA==
X-Gm-Message-State: APjAAAVEAdw3BahNj6wR9I+zhKyQtSkuIHwITvP77H4SQyUCQqu40Loh
 mGgTa5MrdebKoWhPxZyHX2j70qv6Re5wH/qsTuVwtqWVkFcm9MeWXroD3xv2Bu9r32M7N5udovy
 t4s/8NDXchK6FQxI=
X-Received: by 2002:a1c:4454:: with SMTP id r81mr33061274wma.117.1577699983545; 
 Mon, 30 Dec 2019 01:59:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQJMPuSs+59lxAJOKH6KCCABboI19InCFscJ7xeEBu6XQWYAjfD10FKvWAF/jvDgOikM0V3Q==
X-Received: by 2002:a1c:4454:: with SMTP id r81mr33061234wma.117.1577699983295; 
 Mon, 30 Dec 2019 01:59:43 -0800 (PST)
Received: from ?IPv6:2a01:cb18:8372:6b00:691b:aac5:8837:d4da?
 ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id i16sm20447753wmb.36.2019.12.30.01.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 01:59:42 -0800 (PST)
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-s390x@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Chris Wulff <crwulff@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Michael Walle <michael@walle.cc>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
Date: Mon, 30 Dec 2019 10:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
Content-Language: en-US
X-MC-Unique: M9rUdIUbN3-MNkEvU7j-lA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Mon, 30 Dec 2019 09:59:50 -0000

Hi Stefan,

On 12/30/19 10:53 AM, Stefan Weil wrote:
> Am 30.12.19 um 10:08 schrieb Philippe Mathieu-Daud=C3=A9:
>=20
> [...]
>=20
>>   tcg/tcg-op.h                  | 2 +-
>>   tcg/tcg.h                     | 4 ++--
>>   tcg/tcg-common.c              | 2 +-
>>   tcg/tcg-op-gvec.c             | 8 ++++----
>>   tcg/tcg-op-vec.c              | 6 +++---
>>   tcg/tcg-op.c                  | 6 +++---
>>   tcg/tcg.c                     | 2 +-
>>   tcg/tci.c                     | 2 +-
>=20
>=20
> Source files in the tcg directory should not need any change because
> they find include files in the same directory without searching.
>=20
> If we add a tcg/ include file prefix for them as well, that has the
> advantage that it might look prettier and more uniform, but it has the
> disadvantage of requiring a search by the preprocessor.

Yeah, I was not sure about these specific files. My first attempt was=20
without modifying them, but then I thought it would be better to keep=20
the codebase uniform, as you said.

>=20
> I'd prefer not changing those files.

OK, I'll wait to see what Richard/Markus prefer.

> Regards and best wished for 2020

Thanks ;)


