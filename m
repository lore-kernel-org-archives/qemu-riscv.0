Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j194E-00045j-5Z
	for mharc-qemu-riscv@gnu.org; Mon, 10 Feb 2020 08:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j194C-00044i-26
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 08:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j194A-00037D-Qx
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 08:25:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37420
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j194A-00036z-Mj
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 08:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581341134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9oR63gc5Kxstekn/LqUpEIbad1MHfmrO3d4e+XqSqI=;
 b=Z+Vr3vfbTt3ejFIWrrrv1T3e4UcIKznpiwUpOEWAMoNy2vNsmIRcUK5PUba2dLFigUVxDM
 8oAO20dqnH3Whlt/+c4QrRW/5mgRAvlRP+gDDcPp74sdbNHTxmvykQEPevFnavlo7i+72/
 OSh/QLIe7GljxkgHehz1RwWILf5IbEc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-bUW8zFScNJGK0ayS-il97w-1; Mon, 10 Feb 2020 08:25:32 -0500
Received: by mail-wr1-f70.google.com with SMTP id w6so4989226wrm.16
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2020 05:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XKV51D38Ol/2AB+0heBxOtcu0TQX+UzZDuODAQfBuhg=;
 b=gtFRUZFaw6aBNLzoo+1wOO8JbrHFSP/RMLQflLViufj+HcySSuTNJlSlWEHYUE1YeY
 Ijru/hEKb6IPTkkFZ+Q4UgzQ7kEZu5m/bYA5BPB9a2S4VdDsnvSK6vv9pdMm1O8IwOQY
 Uin+RGLEM/FPo6OpjItt1mCiNPr/Pq4jXUce3qZhNgp4ZGsXNh2QXeZuNDwcI2xCA9Ir
 CTnOhPq4ViyJUMDx9qiP41xJ3xmPt3Q3KvMMa4OArUFpvzXLPztFpfODJA7PR4eutae3
 InCGqRGlw3VlWrY3YzVin0nRjHSqFRJ73mQGyvttIKBoQlD9BcsCIJWtjnrL+kTfIqq0
 PTzw==
X-Gm-Message-State: APjAAAXyk9GEoXlOP0Jk+nvVnFeR4wrAhtB4dU/yUnystgiPASkFPhX9
 WzPrbcr36CqAR5UIu/+sZ8/nRgeXT/0tYl8JIAbanSn04UJ+cSw0556FBMj0W4iObDh8TycUtHT
 pn4+vuoQhkNpct2E=
X-Received: by 2002:adf:f886:: with SMTP id u6mr1993880wrp.409.1581341131023; 
 Mon, 10 Feb 2020 05:25:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8Wfn6CHQ6EVXlvZ3QlBX7f+VvahWCpP7bHBG4zcYGigNgUNxKMtGWnU6aHFVeG7tHkJCdBQ==
X-Received: by 2002:adf:f886:: with SMTP id u6mr1993850wrp.409.1581341130822; 
 Mon, 10 Feb 2020 05:25:30 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id d22sm581270wmd.39.2020.02.10.05.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 05:25:30 -0800 (PST)
Subject: Re: Tricore default machine
To: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Chris Wulff <crwulff@gmail.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Thomas Huth
 <huth@tuxfamily.org>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic
 <amarkovic@wavecomp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-2-philmd@redhat.com>
 <9590e020-226d-bc85-e496-95b4f0116f69@redhat.com>
 <e4157357-7697-a2d5-8662-f5bd12d74619@redhat.com>
 <f7b72c47-4202-d220-7b29-bd5ad6283700@redhat.com>
 <c775db8c-63ec-e88a-f643-63f31de26f2b@mail.uni-paderborn.de>
 <CAFEAcA_evEqBg160MWASS1izoMkEF7-7nnRn9xhpBJVPb5ehOQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3c83ea64-179a-db30-1bd0-9d7a495af8d4@redhat.com>
Date: Mon, 10 Feb 2020 14:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_evEqBg160MWASS1izoMkEF7-7nnRn9xhpBJVPb5ehOQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: bUW8zFScNJGK0ayS-il97w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Feb 2020 13:25:37 -0000

On 2/10/20 2:22 PM, Peter Maydell wrote:
> On Mon, 10 Feb 2020 at 12:33, Bastian Koppelmann
> <kbastian@mail.uni-paderborn.de> wrote:
>>
>>
>> On 2/10/20 11:26 AM, Thomas Huth wrote:
>>> On 10/02/2020 11.08, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 2/10/20 10:35 AM, Thomas Huth wrote:
>>>>> On 07/02/2020 17.19, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> I wonder whether we should simply make that machine the default for
>>>>> qemu-system-tricore? There is only one machine here, and not having a
>>>>> default machine always causes some headaches in the tests...
>>>>> (see e.g. tests/qemu-iotests/check for example)
>>>> Or make it generic? If a architecture has a single machine, use it by
>>>> default?
>>> Sounds like a good idea, too ... we've got a couple of targets that hav=
e
>>> only one machine.
>=20
>> As far as I remember, I did not make it the default machine, since Peter
>> Maydell advised against it. His argument was that defaults are really
>> hard to get rid off since external tools (like libvirt) might rely on
>> the defaults and we don't want to break those. Anyways, no objections
>> from my side.
>=20
> Yes; we have default machines partly for historical reasons
> and partly because x86 does, but unless there's a good
> reason for some architecture why this specific machine
> should be the default, I don't think we should have a default:
> making the user specify what they actually want helps to nudge
> them into thinking about what they do want, rather than
> assuming that QEMU will somehow magically be able to run
> guest images built for any random machine for the architecture.

OK now it makes sense.

> Anything in tests or whatever that breaks if there's no default
> machine for the architecture should be improved to handle that
> (it already needs to handle that case, though: arm does not
> have a defined default machine).

I tend to agree here.


