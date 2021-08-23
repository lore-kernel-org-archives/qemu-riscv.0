Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mICEF-0000iW-4n
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 11:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mICEC-0000h5-QG
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 11:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mICE9-0006bJ-N9
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 11:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629733867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9k1+eWH0kEJTfXrHrl8p0s7qDWtHOQN5iFONKEi66tE=;
 b=XnRgtv75Mu4pQpDxJFyFufs6h1UJLVyqBa5CWZ0TpKDHdvUWXZOV5DwhV+EpmHZ8p4+5ok
 bMgeuwYDlRsQsRK3HLJI5NYoGB5lamIsIncHTLhUuYz5/G2WhqFSHFVCp7xM0pkjlfFAFy
 aIBYcUysGbavLlPH9ApbRcb8ntlE3wo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-OebLyKyaNvKWZ_CagkS_iQ-1; Mon, 23 Aug 2021 11:51:06 -0400
X-MC-Unique: OebLyKyaNvKWZ_CagkS_iQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y23-20020a7bcd97000000b002e6e4a2a332so3140439wmj.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 08:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9k1+eWH0kEJTfXrHrl8p0s7qDWtHOQN5iFONKEi66tE=;
 b=J8eHVQ4EV9gRuWfzzT62qeG3lIcdAZNYYA5P2eYzD3KRx0f87icNhTTLktEt6JlFa8
 hWd5buVc6QCKxuHqPLaphz2bYroF2refW7KpUoyrBDxLItF8od4okD/hrh6aD6/NLqRp
 avJTedA2lkZqtFNcowOhHv6CSUc6YK6HeasW2lsen4skXirHVOOMoPXns6dIs0zSCTrC
 E3dRV/pE4SzBTLlHzooI9xnmP5CRZ2g/fYhDKK3MBWIPJg7Hdv8Ia1lpIgCInJZ3V3gH
 J/57tqfYnMUXWTqAbkl7Za4Wcpbn29S/uUMyEy969tZZVyBHtUo0Egw9zO6YuF8M+SGh
 u7tA==
X-Gm-Message-State: AOAM533jrkmCd0l+uKBjy3FjsNJry7QhfCa61kM0pIrHQRum3jJS0zHv
 ziCa77uKdPWg3ODcUiuOSS1kbx6TWj2Qo0g2/PD0dgtIFnVtwwwAYONw9ZEtK/NBh3ITAkcZlE4
 MI1kViAwXi0bpZL1Vsvri7hnQ3Hp2TWbZlyxGUe/l/bkHNhai0LE7GqRTyRzInsC7
X-Received: by 2002:a05:600c:a41:: with SMTP id
 c1mr16698428wmq.109.1629733864918; 
 Mon, 23 Aug 2021 08:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE0EEzEO971L/ZnRulC4pBBzmlb3FE/w+LFYi5ykwru+BhRZQeMeudNzH3/kP4/oAiVi1X4g==
X-Received: by 2002:a05:600c:a41:: with SMTP id
 c1mr16698398wmq.109.1629733864705; 
 Mon, 23 Aug 2021 08:51:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c25sm13628323wmr.15.2021.08.23.08.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 08:51:04 -0700 (PDT)
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Changbin Du <changbin.du@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <565f9ab6-7571-3c26-5e57-8b2a49a9e7b1@redhat.com>
Date: Mon, 23 Aug 2021 17:51:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 Aug 2021 15:51:13 -0000

On 8/23/21 5:30 PM, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 16:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 8/23/21 4:20 PM, Changbin Du wrote:
>>> To resolve the issue to debug switchable targets, this serias introduces
>>> basic infrastructure for gdbstub and enable support for ARM and RISC-V
>>> targets.
>>>
>>> For example, now there is no problem to debug an big-enadian aarch64 target
>>> on x86 host.
>>>
>>>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...
>>
>> I don't understand why you need all that.
>> Maybe you aren't using gdb-multiarch?
>>
>> You can install it or start it via QEMU Debian Docker image:
>>
>> $ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
>>   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
>>   gdb-multiarch -q \
>>     --ex 'set architecture aarch64' \
>>     --ex 'set endian big'
>> The target architecture is assumed to be aarch64
>> The target is assumed to be big endian
>> (gdb) target remote 172.17.0.1:1234
> 
> I don't think that will help, because an AArch64 CPU (at least
> in the boards we model) will always start up in little-endian,
> and our gdbstub will always transfer register data etc in
> little-endian order, because gdb cannot cope with a target that
> isn't always the same endianness. Fixing this requires gdb
> changes to be more capable of handling dynamic target changes
> (this would also help with eg debugging across 32<->64 bit switches);
> as I understand it that gdb work would be pretty significant,
> and at least for aarch64 pretty much nobody cares about
> big-endian, so nobody's got round to doing it yet.
> 
> Our target/ppc/gdbstub.c code takes a different tack: it
> always sends register data in the same order the CPU is
> currently in, which has a different set of cases when it
> goes wrong.

I remember having tested the 'setend be' instruction (from
https://github.com/pcrost/arm-be-test) 3 years ago using
it. Connected as little endian, set breakpoint, on BP hit
disconnect, set big-endian, reconnect, keep single-stepping
(in the same gdb session).

I doubt anything changed since.


