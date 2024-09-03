Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1294ECD342C
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 05:55:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slMVS-00037r-Ca; Tue, 03 Sep 2024 01:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slMVQ-000323-Tx
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 01:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slMVO-0000m2-Se
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 01:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725342906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pmWcOq76t83G2a5B7WGFnkGE2Kgikiv5y9ne8G87ktE=;
 b=a258ObtAhpkmugGC4iYLATLnXfPe7DwaCwaybuH1Uu7+tM5I2xbFmSO9n+9qs/2pUV95/n
 qMZwCvMyiLF7k1vEdD7UuEy/gtQMAxwLMyBWODvioflPXk3RSlD7MwDPSY2FBRlc5GNss7
 GFeJ5ocCY8mJYqJQw8DaXVJ4r9vgz5Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-U9MB1H2BNpmTYndsgOsfYw-1; Tue, 03 Sep 2024 01:55:05 -0400
X-MC-Unique: U9MB1H2BNpmTYndsgOsfYw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-428040f49f9so45820735e9.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Sep 2024 22:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725342904; x=1725947704;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmWcOq76t83G2a5B7WGFnkGE2Kgikiv5y9ne8G87ktE=;
 b=aPbRJ+pUremdJidFnqxZjiqJqA/0DWpgHWIw+99KGZyLYodclRX3KW/2VO8xUBanyP
 3R4yuhItUg5VYLiBLiZibK2iQXlI/5DhWvAThesZpA6AT/ybaEyIkpTl0Hrxwnlgu7jx
 AvmKlnCCm41OUFXXkAASEABAPwuA+Gjf4AL/OF6SnqM31RKPJo4hsYDB8QCF3fa8N5oN
 pwFMjao0RWLrFXPLhqPdQRdPrnoKVM38hPzpCUo3OQnQdQzBDnqTr5Bpu3wJpyM+Wvg1
 BcIN9BFhbyFL85yvCky+vHrRfF1sDnQmh2Hu13ScyBjuym8D2wdHjDJ3n15OiRCvBu29
 Rimg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCA1FhboIdOYhutgXrFRSkAf38WhkJoC6W0u5x1MylNcCQIntQo+TpAGQqyWNYxvygc+IZgiFsJgUX@nongnu.org
X-Gm-Message-State: AOJu0Yw/WV2dY36xuKazPk+4CieGy68oxwEPtAWatU8Ny29yQGySw1K4
 L0euH5zhCSRosDgNAgvU1F9/2t3Qy3aU2K8CLksG4JC1E7Xy2QhVnlNSCmkEovKv8fZnbZrly+9
 0AWKpEcRojGJsAh5Wnu1dv8ELU+i4GZMYBzo6kR0pB5szTycKDR1P
X-Received: by 2002:a05:600c:699b:b0:426:5269:9824 with SMTP id
 5b1f17b1804b1-42bb0229f05mr130033125e9.0.1725342903938; 
 Mon, 02 Sep 2024 22:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1E8ZTm6P3HsBZxJ5u9MvjeU3dq8GWJDLy2IEF5ePJ0e8vWJsxXxVvAvs9WaSXzn4uyN+WeA==
X-Received: by 2002:a05:600c:699b:b0:426:5269:9824 with SMTP id
 5b1f17b1804b1-42bb0229f05mr130033005e9.0.1725342903362; 
 Mon, 02 Sep 2024 22:55:03 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bba3f2875sm138277225e9.41.2024.09.02.22.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 22:55:03 -0700 (PDT)
Message-ID: <367c2564-4920-4eb4-88e2-7ffa68f1c7ac@redhat.com>
Date: Tue, 3 Sep 2024 07:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tests/avocado/riscv_opensbi.py does not work reliable
To: Alistair Francis <alistair23@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
References: <747e3626-e4f4-47e2-bdfa-ca047f9f8443@redhat.com>
 <CAKmqyKNk2u0ApN2PV40EX_tsY8cFD56XcSKhyepQbqzEdP4_zQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAKmqyKNk2u0ApN2PV40EX_tsY8cFD56XcSKhyepQbqzEdP4_zQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 03/09/2024 01.54, Alistair Francis wrote:
> On Sat, Aug 31, 2024 at 1:35 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>>
>>    Hi!
>>
>> While running a lot of tests (i.e. with a very loaded machine), I noticed
>> that tests/avocado/riscv_opensbi.py is very flaky when the host machine is
>> slow. I can easily reproduce the problem when running a big compilation job
>> on all CPUs in the background and then run the riscv_opensbi.py avocado
>> test. One of test_riscv32_spike, test_riscv64_spike, test_riscv32_sifive_u
>> or test_riscv64_sifive_u is failing most of the time (but not the virt
>> machine tests).
>>
>> Looking at the logs, it seems like the output sometimes stops somewhere at a
>> random place before the boot process reaches the spot that the test is
>> looking for. Looking at riscv_htif.c, there does not seem to be any flow
> 
> I suspect this is: https://gitlab.com/qemu-project/qemu/-/issues/2114

Indeed, that looks like the same issue - I should have had a look at the bug 
tracker first!

>> control implemented here, so I guess at least the spike test is currently
>> doomed to fail occasionally. Is there anything that can be done about this
>> (e.g. is flow control somehow possible here or does the interface not allow
>> this?)? Otherwise, I think it might be best to mark the spike and sifive_u
> 
> Patches have been sent to the list to hopefully fix this:
> 
> https://mail.gnu.org/archive/html/qemu-devel/2024-08/msg02743.html
> 
> Just waiting on reviews and then the merge window to open up again

Thanks a lot, these patches are fixing the issues for me!

  Thomas


