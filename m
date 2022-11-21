Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox9rE-0004pC-O5
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 11:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox9r5-0004ky-U1
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 11:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ox9r0-0001cP-77
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 11:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669048863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfORB0I6pG5/SoMVyZ5TnVgQi92VJac/YnibD6vAbx8=;
 b=J85sSWHozKwIVBhgSWAvQ+xSKzWMQo5cgXGcmto8ARr8PkTnogGu02eIIxQ6xhEJO531jt
 mw3En9tsM6GH22eQVwzn3cGOvGsc/SwTsyBkvzuI5CGWcW1+BEAew0k1LjvMEj/5AYhUjF
 TfmOOlDKvTMYT+CVp/L/mEjUjqjsuDQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-KMlaszkpNYC4hjqTTwHnKg-1; Mon, 21 Nov 2022 11:34:21 -0500
X-MC-Unique: KMlaszkpNYC4hjqTTwHnKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h4-20020a1c2104000000b003d01b66fe65so2511089wmh.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Nov 2022 08:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XfORB0I6pG5/SoMVyZ5TnVgQi92VJac/YnibD6vAbx8=;
 b=nUYTmtbIK0h2tD3YUmPoE88eka5xRR0c0xlrtQGvLjwttqBd0SXizzmM9mFvXXcpD+
 BUKRtYnyEmn/wXmp1SqSPc8+inNxsp8J+KED35vVlaudjce4jRmWuSRXTg24h/C4IgE6
 t2NVa3V2ffWCNPrIWopzCfqIsIcKZ7n90lk1d2T0yJliPx2A59iOdy3zlUo9fm5KnfhN
 QLzF4SiZ2AWv/WHWcIGhoHWYXQdLzNVPDtDtB89QjmpzqDCbshps6vlOmxR3mLo7polf
 6Ic5DGwlJT6hVZyzqWwblTSGt73Ykn8XNE27pdKBB30Q+FxxNDsPK0c7OYQZ0LEGBRod
 8oIw==
X-Gm-Message-State: ANoB5pn/nGh9ZT2kGluKHCIhwtohFNfKYfuM8NGaXvVbwKgpT/lYxpvk
 9z/FhNytL18pqlsoUa0UJMlsZGWTURdHFocPWeFIdKLWK8AssSQvuFgqtp8kTqgzvTT98R2ZyAy
 bX14LhLC1oEt0p+w=
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id
 m21-20020a05600c4f5500b003cf729bd4b4mr7112332wmq.48.1669048460416; 
 Mon, 21 Nov 2022 08:34:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62CR+eS8hfyzGHaQQCbo5nl9ASk/kXBf4VLJBzD9tUgVwGxRFN3OEI/Sq6ebXmY3pjmbPJJw==
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id
 m21-20020a05600c4f5500b003cf729bd4b4mr7112278wmq.48.1669048460146; 
 Mon, 21 Nov 2022 08:34:20 -0800 (PST)
Received: from [192.168.8.105] (tmo-116-109.customers.d1-online.com.
 [80.187.116.109]) by smtp.gmail.com with ESMTPSA id
 w19-20020adfbad3000000b00241c6729c2bsm8556551wrg.26.2022.11.21.08.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:34:19 -0800 (PST)
Message-ID: <47e0d3d8-607d-5e29-6780-c0a4364993a9@redhat.com>
Date: Mon, 21 Nov 2022 17:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, groug@kaod.org,
 qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 palmer@dabbelt.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pavel.dovgaluk@ispras.ru,
 alex.bennee@linaro.org, peterx@redhat.com, david@redhat.com,
 mrolnik@gmail.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 jcmvbkbc@gmail.com, berrange@redhat.com, lvivier@redhat.com,
 suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, lizhijian@fujitsu.com,
 stefanha@redhat.com, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, virtio-fs@redhat.com
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
 <87a64ki7zn.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87a64ki7zn.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 16:41:13 -0000

On 21/11/2022 17.32, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 21/11/22 15:36, Peter Maydell wrote:
>>> On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>>>>
>>>> Tweak the semantic patch to drop redundant parenthesis around the
>>>> return expression.
>>>>
>>>> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
>>>> manually.
>>>>
>>>> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
>>>> manually.
>>>>
>>>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>>>> manually.
>>>>
>>>> Whitespace in fuse_reply_iov() tidied up manually.
>>>>
>>>> checkpatch.pl complains "return of an errno should typically be -ve"
>>>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>>>> it visible to checkpatch.pl.
>>>>
>>>> checkpatch.pl complains "return is not a function, parentheses are not
>>>> required" three times for target/mips/tcg/dsp_helper.c.  False
>>>> positives.
>>>>
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>
>>>>    .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>>>>    .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
>>> [snip long list of other mips test files]
>>>
>>>>    328 files changed, 989 insertions(+), 2099 deletions(-)
>>> This patch seems to almost entirely be huge because of these
>>> mips test case files. Are they specific to QEMU or are they
>>> effectively a 3rd-party import that it doesn't make sense
>>> to make local changes to?
>>
>> They are imported and will unlikely be modified.
> 
> Not obvious to me from git-log.
> 
> Should I drop the changes to tests/tcg/mips/?

I'd say yes. At least move them to a separate patch. Otherwise reviewing 
this patch here is no fun at all.

  Thomas


