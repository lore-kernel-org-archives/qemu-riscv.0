Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jicDV-0002j2-CL
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicDT-0002hH-Me
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:14:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58642
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicDT-0002MV-0e
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
 b=gZGojfQDnkzkPZPNZWCJYdaPXxEoyqMbARvMAuKRAuJwTXTIAHD4n1fi9c1OG5f3WbfL48
 6IZbJ3dkmoyIx7ai8tro/UKPYOi1BmNgkaAKJTSDGqY9X18h4GvsLsS/E38Xg5berloShz
 sAmlg4Mub6eRWCKCCYIwB6/iGkHVXqw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-yVIFEDg7NwWOtcFMRPTRUA-1; Tue, 09 Jun 2020 07:14:47 -0400
X-MC-Unique: yVIFEDg7NwWOtcFMRPTRUA-1
Received: by mail-wr1-f69.google.com with SMTP id l18so8533721wrm.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
 b=gdFZUD+J6nJn5kyFLYT8j8KoWw/vi5pDHI534aL3T/M2Ach3OO94IS7QXCy+N3YPQV
 oob9e/kNz4yq/C79pcVzdoF2Y6y09kfZjmdq9p9CV9r1OoASgocU74GBuui3ot2Yb9Xs
 09FrfgdyrLtyq9dpwJ2Nn1ew7cEQM2HK+6YyFqnic71mptgn+ZfnLoRea+uzKRjqFq96
 liKF4E91EB+G9JoVlzNLeL/MyxBgmOnjNWUindZU9k88qQHAQyZiOFqHRO9004MlQa3q
 cjC1BeYwF/7PmiDWSop3WqeG3cAwUlXtxXMmBjgChb9DWcdU2f3rV9OoEVltkzYeuoKL
 E/2g==
X-Gm-Message-State: AOAM531LU4QggT2KyQQe91EDj1dmzOl8ZP8fF0MyRxnVkm82RPt71+r6
 5bKQfkTEIkUqNHq0kNhALoF1QhaVa/J4SSCR4voDeVddc+GIOxp3EIqsRPF8PTh83ZcZbe8UVPw
 1akxfy84E7P2u0jA=
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3651918wru.427.1591701286134; 
 Tue, 09 Jun 2020 04:14:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuPbVlBDSLtlTXx3ZWJ2E6euzR9/JzXQUGOR/hYo9mA/3HQUZQnicNKOucsXO2NrypVrU/9w==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3651896wru.427.1591701285907; 
 Tue, 09 Jun 2020 04:14:45 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id f9sm3121051wrf.74.2020.06.09.04.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:14:45 -0700 (PDT)
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200608160044.15531-1-philmd@redhat.com>
 <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
 <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea1a0932-aecf-3e88-1444-2f5ca369cc67@redhat.com>
Date: Tue, 9 Jun 2020 13:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
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
X-List-Received-Date: Tue, 09 Jun 2020 11:14:52 -0000

On 08/06/20 18:17, Philippe Mathieu-Daudé wrote:
> On 6/8/20 6:14 PM, Peter Maydell wrote:
>> On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> Based on today's IRC chat, this is a trivial RFC series
>>> to anotate pre-qdev/QOM devices so developers using them
>>> without knowing they are not QOM'ified yet can realize
>>> it and convert them if they have time.
>>
>> What mechanism did you use for identifying non-QOM devices?
> 
> I don't think this is the complete list, this is only all the one I
> could find with:
> 
>   $ git grep "g_new|g_malloc" hw/
> 
> Then on each match I manually reviewed (so I might have incorrectly
> flagged code too).

Yes, you did, but I guess for an RFC it was a good bang for the buck.  I
went through the patch and noticed both a few false positives and a
couple blatant violations in recent code.

Paolo


