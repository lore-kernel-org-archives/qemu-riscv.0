Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQ9vP-0005CD-7t
	for mharc-qemu-riscv@gnu.org; Wed, 07 Oct 2020 09:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ9vN-0005A9-AR
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 09:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ9vI-0008Na-Cm
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 09:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602078963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9rNT+iiAfWSu6aL5L3R1Fn2fnsuD64gg7o9yydA8y0=;
 b=i+htwH6SPBO8+XGYv3godjd0otQaNVYTHZ3JvJ7nqhZqtX8M1xQ8CTG8+TI1vZwuzUUbeg
 Dh1l5m4y2fIo2ZDw8tFBPNT0AfuXZvn74M25r1/7vw144H1GxJYFwfLDA3fWjLa6aSHWFJ
 VKoFRGIfKiJgiXkXyT2jEssJne2aLoQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-EZP6Ap9dP3C_YqSOwRKlcA-1; Wed, 07 Oct 2020 09:56:01 -0400
X-MC-Unique: EZP6Ap9dP3C_YqSOwRKlcA-1
Received: by mail-wr1-f70.google.com with SMTP id f11so1037126wro.15
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2020 06:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9rNT+iiAfWSu6aL5L3R1Fn2fnsuD64gg7o9yydA8y0=;
 b=tCKecLrGXeDgpZKYr2bzIbWjLrUch2Az84EUJB4Gk+TNF+YFtDb/whRCtHmpOET/VM
 GYqyL3ly+ozDNTvIdcsvbKmPyV5ok/5CNjdx7wL3StVlFjuwTKV4p2T1+RbkH75MJ2Sr
 PguCMZNl72zvRan/LPHGYmgPrcizyRlpWhtPYrdUb+34JyDRHolWCw266qkkwmixF1L7
 3j8qJfgEoWSJxGb/KGg8IvmQcSZUVPD8DHdkKfhE5SpxNEbBiJBjTTVhsWqoVebx/tdG
 aDMEXncBzfMg5Gxf2BIx7Vc2Z7Yz8UAD+gNg2I6utXRD+8mYJuBLYKz4nN6DZNu2FqBY
 lPAg==
X-Gm-Message-State: AOAM530w9y5DnWNE8+jk8IClalRlYPzjqHwu2qYv129LH+NM3iY01HlY
 /4j6CxOJZ/m/DUXGUQiJG44jeooCkhDtDSWuo6j2Qjt/oGWPTYxRcrjg6sIqPti+8l1hY8sbviT
 +myV0G1U4L+JSvBk=
X-Received: by 2002:adf:d08e:: with SMTP id y14mr820847wrh.424.1602078960652; 
 Wed, 07 Oct 2020 06:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcSN/Bzv8TInnBsMd01PlIlm59ndwFFwtdRnreC4Tx4IelfI1T0f6sD97A/KJClvDPwPR8tQ==
X-Received: by 2002:adf:d08e:: with SMTP id y14mr820823wrh.424.1602078960382; 
 Wed, 07 Oct 2020 06:56:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id w11sm2897366wrs.26.2020.10.07.06.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 06:55:59 -0700 (PDT)
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
Date: Wed, 7 Oct 2020 15:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007130240.GU7303@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Oct 2020 13:56:09 -0000

On 07/10/20 15:02, Eduardo Habkost wrote:
> On Wed, Oct 07, 2020 at 02:04:23PM +0200, Paolo Bonzini wrote:
>> On 07/10/20 00:06, Eduardo Habkost wrote:
>>> Hi,
>>>
>>> While trying to understand how QOM properties are used in QEMU, I
>>> stumbled upon multiple cases where alias properties are added at
>>> realize time.
>>>
>>> Now, I don't understand why those properties exist.  As the
>>> properties are added at realize time, I assume they aren't
>>> supposed to be touched by the user at all.  If they are not
>>> supposed to be touched by the user, what exactly is the purpose
>>> of those QOM properties?
>>
>> In the case of GPIOs, I think they will be used by other devices that
>> are added afterwards.
> 
> Do you know how exactly are they used?  Is this always wrapped
> behind a specific API for GPIOs, or the devices can look for the
> properties directly?

It is always wrapped, but (as far as I recall, because I have never
worked with GPIOs) they are intentionally QOM properties and not just as
an implementation detail.  It's meant to be accessible to the user if
only through qom-get/qom-set.

Paolo

> I'm concerned by the possibility of having QOM properties as an
> undocumented part of an internal API.


