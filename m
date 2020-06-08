Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKT8-0003cf-90
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKT6-0003Zm-Kh
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:17:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36054
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKT5-0002fO-V4
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591633067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
 b=ao6N5pNUQ+gm4lxo1MPRivY9crHW+QxjD7x4UHYobmm6+cduQy98omHR1eEDJm/+YssWe9
 0GrkUBYfaH6tF/3JObxv1qu9hNOT6QH/JAQkVdLd33JxbIBtSnx177EPz15gYRu4XmRTH3
 PNnEdjxROSoInaMRuGbHI9ViOoXaPTg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-jhsTywSqPDGtCwc1VDtzLg-1; Mon, 08 Jun 2020 12:17:43 -0400
X-MC-Unique: jhsTywSqPDGtCwc1VDtzLg-1
Received: by mail-wr1-f69.google.com with SMTP id r5so7380376wrt.9
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
 b=o6kqBLiTcMO5UgDzHHNPWP95tuq/PTbMqH1wU/E3ZEmHYcO5i3ePcE3Nxdy0xF9r8g
 Tmm8VMSFDHOfKsmzXIijxkREy7HC5FCwLFiTioj0V/tu3b9nQlOfj7qryMh5jCXK3SBs
 NUkHxdzi3cfpK3kETA+p3eRDgt+W2SM28YRhf4rccPmhe4B1XO3jUk1odsbwHKT1N1FI
 8irOKGSF2pKKt6T0P85FpqyJMD7pA0msS/nkNRHyf8NhbUejIuhQ2AM6hwOxVG2Nelor
 R8+cH/nSsQTIJut3qoB8a2EGzeOTQW7I1W5WAciReBB3Bt6FdV7sO+0u76w2E9FZRFDg
 gCFQ==
X-Gm-Message-State: AOAM532d8ULxfOpZ+5YAVdOXjsv5uwijWIDBt6awKncoiCaIuZa9APVV
 +h4TbyTQ8YiirqOePZ4mq5kE1xqn4IRM2YazfKqxRLGOxWhLihH5IrQDkqpRrREvqypQ6AXJUzt
 ViW9iKbEni3MfHpc=
X-Received: by 2002:a1c:1f48:: with SMTP id f69mr104664wmf.67.1591633062279;
 Mon, 08 Jun 2020 09:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3YBh9EGdDObAb79iv4SsIf8IFp5HSV9+Z1Ovy3h5MqXgC2dmwC/+3rmg10l/GT0TlOYJvaw==
X-Received: by 2002:a1c:1f48:: with SMTP id f69mr104619wmf.67.1591633062031;
 Mon, 08 Jun 2020 09:17:42 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id k21sm247677wrd.24.2020.06.08.09.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 09:17:41 -0700 (PDT)
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200608160044.15531-1-philmd@redhat.com>
 <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
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
Message-ID: <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
Date: Mon, 8 Jun 2020 18:17:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 16:17:49 -0000

On 6/8/20 6:14 PM, Peter Maydell wrote:
> On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Based on today's IRC chat, this is a trivial RFC series
>> to anotate pre-qdev/QOM devices so developers using them
>> without knowing they are not QOM'ified yet can realize
>> it and convert them if they have time.
> 
> What mechanism did you use for identifying non-QOM devices?

I don't think this is the complete list, this is only all the one I
could find with:

  $ git grep "g_new|g_malloc" hw/

Then on each match I manually reviewed (so I might have incorrectly
flagged code too).


