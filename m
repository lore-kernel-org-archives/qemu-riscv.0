Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5nCI-0000sL-9D
	for mharc-qemu-riscv@gnu.org; Sun, 23 Feb 2020 04:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j5nCF-0000rn-Vr
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2020 04:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j5nCF-0000TL-30
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2020 04:05:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j5nCE-0000Sc-Vj
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2020 04:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582448705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+qfRDJ631+3BrpIbQmZINXk2gQQnyP0CW4SShz+z8s=;
 b=QBuTCP5Y9dynw5qtXOWBMyNMf/6J2V5cpUJR1heGJ204Jze4o3TBPGHBZnuJRjii0jZU1C
 6VQNPp+toTwtPicvp3lznMAwfiC3I7r6mFtpupzrt/3WW6Otwt4q1ANnwHJ4NW/I16ZEln
 TkSm0T7cemk68ccKyDAHmFm0BWVqiU0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-ilrfIu2JOtO3mpvQzJoWGw-1; Sun, 23 Feb 2020 04:05:04 -0500
X-MC-Unique: ilrfIu2JOtO3mpvQzJoWGw-1
Received: by mail-wr1-f71.google.com with SMTP id s13so3692914wru.7
 for <qemu-riscv@nongnu.org>; Sun, 23 Feb 2020 01:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+qfRDJ631+3BrpIbQmZINXk2gQQnyP0CW4SShz+z8s=;
 b=IX5Rp9p/1PVKAwLc7DH3oUQJIU5/K6F4KAVw6U4qK8XHNIrcLSlK90faZu8jL8XW8V
 frSYe/6S/sQUiac2ClI/clB2lPns2ruRvKYPBV1KvYA3CzZGl8uq4hokKriqsQVpRXJI
 FvPC7MTpNduoirSiGXzEILD+nO2o+eLdyfuE1wLdq+95agdPkR9p9KXqx33qPYbziDvW
 U/ekcKsXeyyaaVhkoqsSBDbTDEIVsItKjriN4TAnrixZURwvjyPmWOMZNAcN0KcoE7pP
 F0Cq9NrBdN0il0mbhROChDvik8RP3wYsjOxGNpSb86+JjpR6FTLg3a2GXZ9CT09e4vve
 c9Hw==
X-Gm-Message-State: APjAAAW68v15zd4/fyB/X9IeDIsnZLGL8fqf93PAA81Fs6CxObaInOUZ
 xEP88yA6FzlcRwRxbW9JwE36YN7bNQpkFYP3LLreDhI87O6ZbQBF9U2fj52C0WVhHxoPtpyDrEK
 HSC//a5LiinG4V84=
X-Received: by 2002:a7b:c416:: with SMTP id k22mr15868213wmi.10.1582448703175; 
 Sun, 23 Feb 2020 01:05:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyITY7Qxt5lA0/QWLVp60oNQOPXzXfoCcVMOHbTs40SM+MbNUVweR2hRsFcxTU3r5XAUUkhWg==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr15868151wmi.10.1582448702893; 
 Sun, 23 Feb 2020 01:05:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ec41:5e57:ff4d:8e51?
 ([2001:b07:6468:f312:ec41:5e57:ff4d:8e51])
 by smtp.gmail.com with ESMTPSA id o2sm12051784wmh.46.2020.02.23.01.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Feb 2020 01:05:02 -0800 (PST)
Subject: Re: [PATCH v3 2/3] hw: Make MachineClass::is_default a boolean type
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Huth <huth@tuxfamily.org>, Magnus Damm <magnus.damm@gmail.com>
References: <20200207130453.16666-1-philmd@redhat.com>
 <20200207130453.16666-3-philmd@redhat.com>
 <20200207091138-mutt-send-email-mst@kernel.org>
 <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
 <20200207092450-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9dfd96b4-e924-5803-2d8b-182458fc936b@redhat.com>
Date: Sun, 23 Feb 2020 10:04:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200207092450-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Sun, 23 Feb 2020 09:05:09 -0000

On 07/02/20 15:25, Michael S. Tsirkin wrote:
>>>> @@ -841,7 +841,7 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
>>>>      mc->desc = "Sun4v platform";
>>>>      mc->init = sun4v_init;
>>>>      mc->block_default_type = IF_IDE;
>>>> -    mc->max_cpus = 1; /* XXX for now */
>>>> +    mc->max_cpus = true; /* XXX for now */
>>
>> and here ^^
>>
>> Thanks,
>> Laurent
> 
> Ooh good catch. Which probably means we don't have a unit test for these

"= true" just becomes "= 1".

Paolo


