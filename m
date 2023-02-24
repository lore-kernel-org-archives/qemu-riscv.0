Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVS0m-00036c-Mm
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 01:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS0k-00036C-Hp
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 01:56:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS0f-0007kS-6r
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 01:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677221808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9UsjbPYfVVpHq3t2lTckJQJPUeneLWw/b3Hs4fn9f0=;
 b=Y5FiSxbwsFRJzmhrA2xqW/OAoHrY4psJM/p6L7Dm4O9Ni9+XTxNpn8BmRr3G1Ww5aTlZw+
 q47bLSWb/+yR8EhWK9qf1XQYdsuh2rb+3Yy0/SGPFbEeA8v2CG7EZyIhVgcZOnK0DsLcj1
 hWiPK9DfM9vNLVQU0ZKxGJcPsPi26/g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-cYOFTc4oNKGzhVyhkYoi1w-1; Fri, 24 Feb 2023 01:56:44 -0500
X-MC-Unique: cYOFTc4oNKGzhVyhkYoi1w-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so817289wma.7
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 22:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n9UsjbPYfVVpHq3t2lTckJQJPUeneLWw/b3Hs4fn9f0=;
 b=wPhiWO1LxglMYkZaVQKE5MQ0HMs3Pt+KmiWGaX/4eyvUaSbpFNNZV+QRvAVWGFlkGB
 R+ePd3kwKMdaDUnOr+jsvx9Oa8jzGm1OhbbtKce0N9p1OSrwD+ezM2T9A7vkj+6LKYLB
 ShiuuRHvgk34H0zyJH5vZfCEHj0R/zpDUmaCMYXFHDJWxDkA+TEEukBBKj1GL6zjQUj5
 wrpYopYrCF+coYD1H4QX2pO/wU0qnCm7WHaYvOdkxf+Ii30P3DxRxJyV5i2SX86IEIdD
 8Aj51+mqpxqEc1W1tScenBClY2TSFAFBfWB4Fe7W0FgNjAl7/8EGOsajy22JhwBWDacA
 9uOg==
X-Gm-Message-State: AO0yUKUxzByEMAMp3h3pTWEQNWhF7pfa7D4eF27fj8mEYpgBHGboLnPy
 IOzjb7+O1Juk1QXH+ptclBHCmADaHN+uEPXETTM4eQ4GmAfhifHzo2PW3zbj5OM/UPmQaR8AqTT
 HHgtuUqU34dn7QT8=
X-Received: by 2002:a05:600c:2e87:b0:3ea:f91c:38b6 with SMTP id
 p7-20020a05600c2e8700b003eaf91c38b6mr1433790wmn.33.1677221803683; 
 Thu, 23 Feb 2023 22:56:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9tu4OEPuDbkIpz/K5jDU6l/hSR392+NKWdOD0AYTjXTKEVrmM7qPJe6mCSPSPkhojWEsZ11w==
X-Received: by 2002:a05:600c:2e87:b0:3ea:f91c:38b6 with SMTP id
 p7-20020a05600c2e8700b003eaf91c38b6mr1433781wmn.33.1677221803345; 
 Thu, 23 Feb 2023 22:56:43 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c205400b003daf6e3bc2fsm5205982wmg.1.2023.02.23.22.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 22:56:42 -0800 (PST)
Message-ID: <ffe100bb-b2b9-1c74-5b66-4f7ebee6d5ee@redhat.com>
Date: Fri, 24 Feb 2023 07:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 bmeng@tinylab.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <mhng-61abd1f7-4d76-42de-85b2-42466ec0673f@palmer-ri-x1c9a>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
In-Reply-To: <mhng-61abd1f7-4d76-42de-85b2-42466ec0673f@palmer-ri-x1c9a>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 06:56:54 -0000

  Hi!

On 23/02/2023 23.49, Palmer Dabbelt wrote:
> On Wed, 22 Feb 2023 07:56:10 PST (-0800), Palmer Dabbelt wrote:
>> On Tue, 21 Feb 2023 08:43:47 PST (-0800), Peter Maydell wrote:
...
>>> This seems to have caused CI to decide it needs to rerun the
>>> 'docker-opensbi' job, which doesn't work:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3808319659
>>>
>>> I don't understand what exactly is going on here -- Alex,
>>> Bin, any ideas?
>>>
>>> Why do we build the firmware in CI if we have checked in
>>> binaries in pc-bios?
>>>
>>> Should .gitlab-ci.d/opensbi/Dockerfile really still be
>>> starting with Ubuntu 18.04 ? That is already older than our
>>> set of supported platforms, and falls out of support from
>>> Ubuntu in a couple of months.
>>
>> I just sent along a patch
>> <https://lore.kernel.org/r/20230222154938.9201-1-palmer@rivosinc.com/>.
>> I have no idea how to test it in the CI, though...

1) Fork the qemu repository in gitlab to your account
2) Add a remote to your repo on your PC to point to the
    forked gitlab repo (git remote add ...)
3) Read docs/devel/ci-jobs.rst.inc - you basically want
    these two things:

   git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
   git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"

4) If you now do a "git push-ci ..." to your forked repo,
    you should be able to see the CI pipelines there

> Nobody's replied, so I'm inclined to just drop the OpenSBI bump and re-send 
> the PR.  At least that way we can avoid getting blocked on the CI issues.  
> There's some more in flight so there'll probably be a 5th round before the 
> freeze either way, at least this way the stuff that works can avoid getting 
> blocked.

Please note that pull requests are currently not processed
anyway ('til March 1st), see:

  https://lore.kernel.org/qemu-devel/CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com/

  Thomas


