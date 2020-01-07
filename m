Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iomWA-0006jE-AQ
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 05:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iomW5-0006Rs-H7
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 05:55:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iomW4-0007a1-7J
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 05:55:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48450
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iomW4-0007ZY-3n
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 05:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578394515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhXZK6waXiBnmr0odxU7NgxYYfDC6HfydIaPIS8FwCc=;
 b=J+HfmfNkEqjAd/sxeT08o4NW783maOwxGygoikmq/0uQTlCMo9HZ3cvPy7Yv27yiIUsKp0
 xhX1RmYmJ+ePhvYe+y3fVaIGfqi6aCZUUU0kOpP61Xli5URlegvZKDoSCyto8nx6VQgPBR
 GBTMkMc23HY0T5OYjKoCqV842KttWqk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-upc-xrmbPTWdda5cpwVGrQ-1; Tue, 07 Jan 2020 05:55:14 -0500
Received: by mail-wm1-f71.google.com with SMTP id 7so1828115wmf.9
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 02:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Os9CxIhXNJ0oXSGR+KwiDvplTNsja19E/C5m6OPss7M=;
 b=V1osNizWkj0kOlRSRk9pz+CjH537n9BiDhtdKTd1Wm7jCqDfmLz6r8vOJ3gMEH/ZTP
 ZM4yr+GuIK4jGQsEWjaoZp/LQSLosPn0D2kRgKoUl0uRnEudYX22TZ+80CebgL3H1FKn
 IEdQgL96GjzdbfVeqr2LGcswP3Rj5wSen6DqxckQyg3erGdg7/h6CcWbPa1iv+e7Wn42
 FsnRsK38FmjoF3NXzEitq6GemiTHDfzoHLYi1vO2eZxd6orwL2by25TyhR0RJZrsMdFO
 XMN3y9yKiyG/UZqvUWHAh83V/pLk02XBBpwvflUxROiluipNJR3pB+9L9UHxe7qT/3Y2
 5qdw==
X-Gm-Message-State: APjAAAUCMUuizkf7Tzr54b+dXDVTux75BKh4g6UpLLs4Pk7u1+kAkBbA
 ouVt0jpSe84G5rUt1xd2R/nTR6Lj+a3tre5TAdU07B4OE/6+FSsVRYe1XZoib84CdvmRWPkC+uO
 36QaLGXjsK2SfUis=
X-Received: by 2002:adf:eb51:: with SMTP id u17mr108866033wrn.29.1578394513128; 
 Tue, 07 Jan 2020 02:55:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZn0VYd/V/zNYe59k7LQ+zqsc3ubQbxlc7tCrvQ7YFApgV27+KayJZSkJZ6YzamX7G1QzoAA==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr108866018wrn.29.1578394512923; 
 Tue, 07 Jan 2020 02:55:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id t1sm26610479wma.43.2020.01.07.02.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 02:55:12 -0800 (PST)
Subject: Re: [PATCH v2 0/4] tcg: Include tcg files using tcg/ dirname, reduce
 cpp search path list
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Anthony Green <green@moxielogic.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, Chris Wulff
 <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Richard Henderson <rth@twiddle.net>, Riku Voipio <riku.voipio@iki.fi>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marek Vasut <marex@denx.de>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20200101112303.20724-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddded8a0-0df1-7408-b8c3-6a8ae1a5f438@redhat.com>
Date: Tue, 7 Jan 2020 11:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: upc-xrmbPTWdda5cpwVGrQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 07 Jan 2020 10:55:21 -0000

On 01/01/20 12:22, Philippe Mathieu-Daud=C3=A9 wrote:
> Noticed we could clean this while reviewing Richard patch last night:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg667606.html
>=20
> Since v1:
> - moved headers to include/tcg/ (Paolo)
> - include in .inc.c relative to parent (Stefan)
>=20
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg05356.html


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

but I'll let Richad pick it up.

Paolo


