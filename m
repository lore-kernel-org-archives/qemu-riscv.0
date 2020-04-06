Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jLVqL-00018I-Nv
	for mharc-qemu-riscv@gnu.org; Mon, 06 Apr 2020 13:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLVqD-00015I-KZ
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLVq4-0000aV-OW
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:47:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47401
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLVq4-0000Yw-JN
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 13:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586195231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BH2VYTUXcsfl/0dH3y012NaqwkbVBg2RcLAh0syExwQ=;
 b=U/EifyN5xUgZtW3pu9AHEWZqdi5Xv9yq4iKCiaC/W9powd7XiruDGSRhGsMgp3sTJdv41Q
 OufbWToPVS8UEHy9iQc+K3+P2YALK/uPZGFgYP8hFMXO6TXwiaJvBJ6kuo9hPTGbAElew8
 ksqq92WB2ESa97rfi1PQWh6G8FTUgns=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-qfnbVCn_NXixCWu9hDgiVw-1; Mon, 06 Apr 2020 13:47:07 -0400
X-MC-Unique: qfnbVCn_NXixCWu9hDgiVw-1
Received: by mail-wr1-f69.google.com with SMTP id c8so169882wru.20
 for <qemu-riscv@nongnu.org>; Mon, 06 Apr 2020 10:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKe0BgM0CmuS/l7Co2UJ4kTaHPz04qaQEvypXhdFiFE=;
 b=D99jCqsAqsoIKCTg7buPNNrUU5md94lbVmAHQuLtvEXmexbHz5iHYw80b3xMnDFwNr
 R0aUszc6HHnhvqKVznYKJRF5rTe7IEG3QlpbgAickZv0nmki3rc185xxmpfeTTp0l/By
 73Fh0FezuiQvMp0YW5KQbvDYIDpzXJoGhjjt6VZhvk1297U8HQSikFhABu9xvi3y73jw
 FTMVeaMVOiAQYJ+yDVrcbJwBeuUBGwhWjRKcbDX3jGRHvmnfbiRuIbYi8lyySleX/Oed
 Qk/DTx4l3ak0sW7C0SDgSkVDN0arunNdwtJW0atXpns388Qfm79NLJ/YB4YnyaxCSiXo
 4UeA==
X-Gm-Message-State: AGi0PubrP2P1ySmCoHudXQ5LYsdHNIb9HHmJYyrhMiUsoTmnoeCIVX97
 bGQwV5u73zMCAXfZ2irDgVyQ9c86vR82mERbJKPHN3NmiZlLCHFobUQ+WY+V9uAP7GhaCxujXcm
 +yi9EEV32DHCOTZE=
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr454863wmg.113.1586195226066; 
 Mon, 06 Apr 2020 10:47:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypIoO8o8nhDhFD/G0RUux58XzODZJNSsd8jGyeulTOJnh1Vom+R4utwU+q6AFWuIcbCRnJ++eg==
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr454814wmg.113.1586195225719; 
 Mon, 06 Apr 2020 10:47:05 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o67sm398413wmo.5.2020.04.06.10.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 10:47:04 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Burton
 <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-riscv@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <CAAdtpL7rC1u=B-xW+ZbrRbpSMKvGx0kq_hug1J9-cxx6NgJR1Q@mail.gmail.com>
 <20200330092127.GE73285@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22fd27d1-6d22-c91d-716f-6518a062dd21@redhat.com>
Date: Mon, 6 Apr 2020 19:47:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330092127.GE73285@stefanha-x1.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
X-List-Received-Date: Mon, 06 Apr 2020 17:47:28 -0000

On 3/30/20 11:21 AM, Stefan Hajnoczi wrote:
> On Wed, Mar 25, 2020 at 08:20:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
>> On Wed, Mar 25, 2020 at 8:18 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.or=
g> wrote:
>>>
>>> This series is inspired of Peter fix:
>>> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>>>
>>> Add a cocci script to fix the other places.
>>>
>>> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>
>>>
>>> Philippe Mathieu-Daud=3DC3=3DA9 (12):
>>
>> Hmm is that a git-publish bug?
>=20
> Please run git-publish once more on the same branch and inspect the
> $TMPDIR/0000-cover-letter.patch email in an editor when git-publish
> prints "Stopping so you can inspect the patch emails:".
>=20
> It would be interesting to see how your name is formatted, as well as
> the MIME Content-Type and Content-Transfer-Encoding headers.

Content-Type: text/plain; charset=3D"utf-8"

Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=3DC3=3DA9 (12):


>=20
> This information can be compared to the final email sent to the list
> and/or received by the mailing list.
>=20
> Stefan
>=20


