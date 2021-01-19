Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1ytW-0004i6-A0
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 16:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1ytS-0004gW-S4
 for qemu-riscv@nongnu.org; Tue, 19 Jan 2021 16:50:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1ytP-0002V7-18
 for qemu-riscv@nongnu.org; Tue, 19 Jan 2021 16:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611093024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wu/LakUlQP6voavSnC/tnbw5fHcM0WTHBa4ctfEVKc=;
 b=AjUnbnOASbVIvHh1wKPeL+e/+Qp0m5xwz0CEfb9sm4RsXGe/HcvI3yXrDC7obJxssgVsEa
 75+yqYJz3v3exqf8o7qYqFAYkRhQtGtsZZ8RdCYhcKOz1jO9+jasgPOlvQNbAjjJ6Ux8vO
 QSfM6CA0prQYIDNF2+ZoRYQgpvwziOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-fjGiuKhJMr2yjDEpE8X3jw-1; Tue, 19 Jan 2021 16:50:20 -0500
X-MC-Unique: fjGiuKhJMr2yjDEpE8X3jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C02CA10054FF;
 Tue, 19 Jan 2021 21:50:18 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A39D27C50;
 Tue, 19 Jan 2021 21:50:17 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
 <a566580a-ef30-0d2f-116e-1e3666f1187d@amsat.org>
 <CAKmqyKNvtuY2eaQHiM4YMKyy_bWAiHFrMan_R+7M_fw7=ioW=A@mail.gmail.com>
 <31a5b411-66d8-87ef-865a-6b3d33d0a874@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
Message-ID: <f57d1ae2-eb00-3fa0-b1ca-c0fdc6f339e1@redhat.com>
Date: Tue, 19 Jan 2021 15:50:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <31a5b411-66d8-87ef-865a-6b3d33d0a874@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Jan 2021 21:50:31 -0000

On 1/17/21 10:52 AM, Philippe Mathieu-Daudé wrote:
> On 1/16/21 11:38 PM, Alistair Francis wrote:
>> On Sat, Jan 16, 2021 at 2:32 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> On 1/16/21 12:00 AM, Alistair Francis wrote:
>>>> We were accidently passing RISCVHartArrayState by value instead of

accidentally

>>>> pointer. The type is 824 bytes long so let's correct that and pass it by
>>>> pointer instead.

>>>> -bool riscv_is_32bit(RISCVHartArrayState harts)
>>>> +bool riscv_is_32bit(RISCVHartArrayState *harts)

Definitely better,

>>>>  {
>>>> -    RISCVCPU hart = harts.harts[0];
>>>> +    RISCVCPU hart = harts->harts[0];

but yeah, this still results in a copy (unless the compiler optimizes it).

>>>
>>> This doesn't look improved. Maybe you want:
>>>
>>>        return riscv_cpu_is_32bit(&harts->harts[0].env);

Whereas this is obviously a pointer into the original without relying on
the compiler to elide a copy.

>>
>> I suspect this ends up generating the same code.
> 
> If the compiler is smart enough, but I'm not sure it can figure out
> only 1 element from the structure is accessed...
> My understanding is "first copy the content pointed at '*harts' in
> 'hart' on the stack", then only use "env".
> 
> Cc'ing Eric/Richard to double check.

I agree that relying on the compiler optimization is not as
straightforward as writing the code to directly access the correct
pointer from the get-go.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


