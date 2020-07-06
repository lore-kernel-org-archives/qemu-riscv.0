Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsRxB-0002mU-OH
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jul 2020 10:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsRxA-0002lZ-HV
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2020 10:18:40 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59468
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsRx8-0001Ry-EI
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2020 10:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594045117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQomRb+cWYo5dyTQJUvYcLhNnsxOicNuq2m44BQznQY=;
 b=PKTrvACcZdDNlmo+HRRsM4O84jeHVVnm2KtJRr1fv/RmDkEMUeNumhDjotUkrzdQaGbEG8
 h8zApx1aP5ocq8nuPQJ+O5+NPiAedegNaxkrny+4tYg6hTXicnFYjDF84RI7Pi7qk7lAEf
 U7qAMhLJDRLzkNZFLgYWd3ZCwTDk6T8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-rIIWdSScOR2a4-fIRRG5hw-1; Mon, 06 Jul 2020 10:18:36 -0400
X-MC-Unique: rIIWdSScOR2a4-fIRRG5hw-1
Received: by mail-wm1-f69.google.com with SMTP id t18so47094925wmj.5
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2020 07:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JQomRb+cWYo5dyTQJUvYcLhNnsxOicNuq2m44BQznQY=;
 b=cwoI+tx9JcWEOCRgJ+0rFFAnUMIUyfeQ9g11od6fiBirMSB7n4mksKgFr6vv25nokt
 3RRXSp/Zb0pUYNZf//mIzE2lpCNzsVzxXCMFPWMk0gPutEAVuocWiOCmQlGiRdTOiAid
 Bs/hhJoVTpQhXSpMX9iRH4fmCgaMAg+yR5Sz4DuWvaGYcalLFyAC4dEhcU9I6scResrM
 lZBe90hrc07zevLQo10/1GtHSRj+JX1kns2YZxgweGhq0uxaX0X7lXFA9Lmv0M5b+01Z
 NarZV5Bb6RPgWlMhfHx8sU9VUyTNLGDcYcNnJ8cTEy4kt24TZiaLn4AGUx7LCLhe6Mlx
 0d1A==
X-Gm-Message-State: AOAM533ocM2mkDu2tG1GmAE7l/7PlUoW/QlyW0mKirKtp5Og/ltFrvse
 WBPXB6F0cTDRByPVs/nR8vW5TrvGz4eo15q1TCs+UsSMrx0tPRcpwThtPiWnDVzdhyYAamn2w0O
 1DK8PgIulY0m6B2I=
X-Received: by 2002:a5d:4ec7:: with SMTP id s7mr48604724wrv.400.1594045114810; 
 Mon, 06 Jul 2020 07:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVuHe34dn3E88/MDo2QkmDZwmdIYLNQVNEla+CttKNwBdaWQHaFQm9kESLcuukeGYVwaRqPQ==
X-Received: by 2002:a5d:4ec7:: with SMTP id s7mr48604688wrv.400.1594045114529; 
 Mon, 06 Jul 2020 07:18:34 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w12sm25711545wrm.79.2020.07.06.07.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 07:18:33 -0700 (PDT)
Subject: Re: [RFC PATCH v2 08/23] hw/display/ramfb: Emit warning when old code
 is used
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Stafford Horne
 <shorne@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Thomas Huth
 <huth@tuxfamily.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
 <20200704153908.12118-9-philmd@redhat.com>
 <20200706141502.wnvizwp66hsrpg4p@sirius.home.kraxel.org>
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
Message-ID: <158a6386-f8dd-ac20-4a9d-23b70ab6a499@redhat.com>
Date: Mon, 6 Jul 2020 16:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200706141502.wnvizwp66hsrpg4p@sirius.home.kraxel.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:59:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 06 Jul 2020 14:18:40 -0000

On 7/6/20 4:15 PM, Gerd Hoffmann wrote:
> On Sat, Jul 04, 2020 at 05:38:53PM +0200, Philippe Mathieu-DaudÃ© wrote:
>> This code hasn't been QOM'ified yet. Warn the user.
> 
> False positive IMHO.  This is designed to be integrated into other
> devices for boot display.  vfio/display.c uses it that way.  There
> also is a standalone version (initially meant to be used for testing
> only, but turned out to be useful on arm) in ramfb-standalone.c which
> is a proper QOM object too.

OK, good to know.

I guess I should take the time to comment the false positives too in the
code (Paolo made various other comments too). So next developer won't
have to ask again.


