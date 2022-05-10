Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noKqP-0005xd-Bf
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 04:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noKqM-0005vV-VI
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 04:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noKqK-000449-C5
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 04:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652169819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c8YCsPCGQinA30dkcvvUIq84j+lPg7YQpqaqkzjFq4=;
 b=YQn5K5mKBDKviDbDVurh+baspth+iLYUOjKf1ER9a31nsfbulHiONpb/2y76w5DK6yXju6
 RqwEdGVDezwf8J9jGgQfbxNhpQsxRcp6+m58H/mPSRI4tqN1wGAB5Ot51vkjGlHKTBaMv+
 SOQy9TbIfz38vP7DhZDLEOcsolo+q50=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-MYK-IM3JOzecd6SuWRQL3Q-1; Tue, 10 May 2022 04:03:38 -0400
X-MC-Unique: MYK-IM3JOzecd6SuWRQL3Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so6705455wrh.8
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 01:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=9c8YCsPCGQinA30dkcvvUIq84j+lPg7YQpqaqkzjFq4=;
 b=n5L1EwC5Puhfpdh5BnemJHSpS6Lr4Mux+93hAIQK+oruVPEhM3IN2KDCF6dPxu7GoH
 3lREHyZ8rI2uJnmLkKCg5lcJQ3avVlGttway/fXeiP4UfNlNdrG3XgMfaJtZ+bZnsd8L
 znxQu8h9w1JNL7rWsgun38Y2yxrP2c3gXWcf0vCcNeYNSuE+a1pT5/xQKm7ElaCq4T6I
 EejzPHPYjRvBx0Q/INNRkBJO+O1iSwZaqlcSyNgT6Y87XhS9FlTmQ/vLYFjNXdVs/j3r
 Lyzmwt+UW9TmPih62Zi9LxMBjFaO3NMmKtxtVjfpZE3WgGwhSOm1MjW9neke+5Yelte8
 L1mA==
X-Gm-Message-State: AOAM530XLLOLXdQUmVZu6CMym1ORHmTJG8/A7gD6HbT+tlxbH1AJRuMu
 1bE2/QdLVtjWza1g/piov/woahFTZq6pyKtH3ywtT6Mhx0wqxzHoxQ2il6/QS6rWOaul0WvHIa7
 twVsv8xX6M02t/+8=
X-Received: by 2002:a05:6000:1f8c:b0:20c:b1cf:2a1c with SMTP id
 bw12-20020a0560001f8c00b0020cb1cf2a1cmr13759057wrb.368.1652169816876; 
 Tue, 10 May 2022 01:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSVEUGuZYc4bBrbU8ohk1SrFi9e5dtCzivgtmG0UzGLDaWFPvcrdEEQvi2hE1Ubaez5pyDfA==
X-Received: by 2002:a05:6000:1f8c:b0:20c:b1cf:2a1c with SMTP id
 bw12-20020a0560001f8c00b0020cb1cf2a1cmr13759021wrb.368.1652169816453; 
 Tue, 10 May 2022 01:03:36 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b003942a244f3dsm1652346wmj.22.2022.05.10.01.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 01:03:36 -0700 (PDT)
Message-ID: <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
Date: Tue, 10 May 2022 10:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-RISC-V <qemu-riscv@nongnu.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU 32-bit vs. 64-bit binaries (was: [PATCH] mos6522: fix linking
 error when CONFIG_MOS6522 is not set)
In-Reply-To: <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2022 08:03:43 -0000

On 04/05/2022 16.48, Mark Cave-Ayland wrote:
> On 04/05/2022 15:26, Fabiano Rosas wrote:
> 
>> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>>
>>> On 03/05/2022 15:06, Fabiano Rosas wrote:
>>>
>>>> Murilo Opsfelder Araújo <muriloo@linux.ibm.com> writes:
[...]
>>>> So ppc64-softmmu doesn't quite do what it says on the tin. I think in
>>>> the long run we need to revisit the conversation about whether to keep
>>>> the 32 & 64 bit builds separate. It is misleading that you're explicitly
>>>> excluding ppc-softmmu from the `--target-list`, but a some 32 bit stuff
>>>> still comes along implicitly.
>>>
>>> Unfortunately for historical reasons it isn't quite that simple: the 
>>> mac99 machine in
>>> hw/ppc/mac_newworld.c is both a 32-bit and a 64-bit machine, but with a 
>>> different PCI
>>> host bridge and a 970 CPU if run from qemu-system-ppc64. Unfortunately it 
>>> pre-dates
>>> my time working on QEMU's PPC Mac machines but I believe it was (is?) 
>>> capable of
>>> booting Linux, even though I doubt it accurately represents a real machine.
>>
>> Well, what you describe is fine in my view, the 64-bit machine uses
>> qemu-system-ppc64. If there is shared code with 32-bit, that is ok.
>>
>> What I would like to understand is what is the community's direction
>> with this, do we want:
>>
>> 1) the 64-bit build to include all of the code and have it run all
>>     machines, or;
>>
>> 2) the 64-bit build to run only 64-bit machines and the 32-bit build to
>>     run only 32-bit machines.
>>
>> There are things such as 'target_ulong' that go against #1, and this
>> thread shows that we're not doing #2 as well.
>>
>> I know there have been discussions about this in the past but I couldn't
>> find them in the archives.
> 
> Certainly if a 64-bit Mac machine were to be added today, I'd be inclined to 
> copy mac_newworld.c into a separate file and give it a separate machine name 
> for ppc64 to make a clear distinction between the two machines (and allow 
> them to evolve separately). Unfortunately I have no idea as to what the 
> reference machine for the PPC64 Mac machine was supposed to be which makes 
> it harder to decide what to do :(
> 
> In my mind it feels like qemu-system-ppc is for 32-bit guests and 
> qemu-system-ppc64 is for 64-bit guests which I believe is consistent with 
> how it currently works with MIPS and ARM (someone feel free to correct me 
> here).

For CPUs that have both, 32-bit and 64-bit variants, we have mixed approaches:

1) For x86_64/i386, aarch64/arm, mips64/mips and ppc64/ppc, the 64-bit 
variants are a superset of the 32-bit variants, i.e. if you build the 64-bit 
version, you normally don't need the 32-bit version anymore (see below for 
the KVM-case where you still might need it).

2) For sparc64/sparc and riscv64/riscv32, the set of machines is distinct 
between the 64-bit and 32-bit versions (well, riscv has some machines 
shared, and some machines are different).

I once suggested in the past already that we should maybe get rid of the 
32-bit variants in case the 64-bit variant is a full superset, so we can 
save compile- and test times (which is quite a bit for QEMU), but I've been 
told that the 32-bit variants are mostly still required for supporting KVM 
on 32-bit host machines.

But in the long run, I think we rather want to converge everything into one 
binary (to decrease testing and compilation time) instead of separating 
stuff into multiple binaries, so IMHO we should not start separating the 
32-bit machines into qemu-system-ppc and the 64-bit-only machines into 
qemu-system-ppc64 now.

  Thomas


