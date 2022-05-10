Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noLkc-0003mN-67
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noLkH-0003kM-Rt
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 05:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noLk9-0004eP-Cb
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 05:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652173266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncKBzl0qNkLIuFukWr9xnif+Z8mL0MAWOnWtgNK39Z0=;
 b=KcUsSUIrZ4dCpG2+xaOIYI1CFskjOlWQ4K59iZ02fQEew53Z6yQcSGQrkv3MN1vHEQbR4L
 S2cFwwIw3cJBcI7InisPk3QFMahXsjwiU3aNwp/ZEO4OP1++HwDYABQHsVZKIretis4Ogn
 EcK5LbLYNu9nrcNHG+RCvDadkDGn5C0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-Hzdm2IiqPnmyxPx4lPj5_A-1; Tue, 10 May 2022 05:01:04 -0400
X-MC-Unique: Hzdm2IiqPnmyxPx4lPj5_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so6832945wrg.22
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 02:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ncKBzl0qNkLIuFukWr9xnif+Z8mL0MAWOnWtgNK39Z0=;
 b=rozEKbHmS7WSRhBaa97lf1WQgfdRqnFh5QXOOLXj4PTb//fxciknns44xEMn0cPr88
 ItoEHky9QBS0f90fML2VSbkVAnPDnW0VD1CDRvCfiUytCcsJUWsYYWkOOq3KwgfueaWZ
 olOJ0pWy4tBMiyWQm9Y/AFHmYXWfkk7eE2fHZw+Ow5wEHwVjlIsjF40WD9ek6MHs+Ksg
 BM6sbzfhbRm5cav9jZorN2M5VYNY3P3MPJEETgfbbQJp0ULfC9cb59pMeV65VxBQkWu3
 ymdcTs/+AcsoMK6TfIm2KB1jgRBB791E+bV5g8JjbnCcW5UGw3+2PdJ6PWKYaCBlpr7U
 OI/A==
X-Gm-Message-State: AOAM530QP8aX3v/l32qugzvyGJNuFAF473Zz04T3Kj9OdECQmMFAAusz
 KOykUUtRasUK01FIMgKuaUlZRybZg6KQVq+47i3u6XPsRSy6cU7nF0usYlIkn9eZ7YqfC67kZsc
 +n1HtfM8D5S4dVRo=
X-Received: by 2002:a7b:cc17:0:b0:38d:af7:3848 with SMTP id
 f23-20020a7bcc17000000b0038d0af73848mr20632577wmh.41.1652173263735; 
 Tue, 10 May 2022 02:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPHpu74fy+PJw2T+Vrab74KsxPhYmBBC2YCrKl/e0FGweWSPF62i04VyikDA6zig7j+0PWqQ==
X-Received: by 2002:a7b:cc17:0:b0:38d:af7:3848 with SMTP id
 f23-20020a7bcc17000000b0038d0af73848mr20632539wmh.41.1652173263412; 
 Tue, 10 May 2022 02:01:03 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n34-20020a05600c502200b003942a244f35sm2076306wmr.14.2022.05.10.02.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 02:01:02 -0700 (PDT)
Message-ID: <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
Date: Tue, 10 May 2022 11:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-RISC-V <qemu-riscv@nongnu.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
In-Reply-To: <877d6tzs2e.fsf@pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 09:01:34 -0000

On 10/05/2022 10.54, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
> [...]
> 
>> I once suggested in the past already that we should maybe get rid of
>> the 32-bit variants in case the 64-bit variant is a full superset, so
>> we can save compile- and test times (which is quite a bit for QEMU),
>> but I've been told that the 32-bit variants are mostly still required
>> for supporting KVM on 32-bit host machines.
> 
> Do we still care for 32-bit host machines?

As long as the Linux kernel still supports 32-bit KVM virtualization, I 
think we have to keep the userspace around for that, too.

But I wonder why we're keeping qemu-system-arm around? 32-bit KVM support 
for ARM has been removed with Linux kernel 5.7 as far as I know, so I think 
we could likely drop the qemu-system-arm nowadays, too? Peter, Richard, 
what's your opinion on this?

  Thomas


