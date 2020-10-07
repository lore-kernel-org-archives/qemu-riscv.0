Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQAq2-0005u5-KF
	for mharc-qemu-riscv@gnu.org; Wed, 07 Oct 2020 10:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQAq1-0005s9-Cl
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 10:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQApz-0006r4-Km
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 10:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602082479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PtmRaao0G4zF+ZvjheASD8UzYZJ4ViJNIA5/O4iUuo=;
 b=hZDibMWZ1dZ7YHNrNOw9wPg/30Vqe2DpCqe4IB8FEigK6+/ETy7YrdIpaukzYi61t5NVHH
 PHaIsTw3CdJTIyWbfRgVNBoCZDJ+nibKPX5Ubo/VF1S4j4A5PfLrCLonBbMyfGJNEe9N75
 14Td1CJbi+f+MaeZUcq45BnRF/bMtvQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-r2HaVlWMPiWN1KC2MBNeCA-1; Wed, 07 Oct 2020 10:54:35 -0400
X-MC-Unique: r2HaVlWMPiWN1KC2MBNeCA-1
Received: by mail-wm1-f72.google.com with SMTP id r19so778259wmh.9
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2020 07:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2PtmRaao0G4zF+ZvjheASD8UzYZJ4ViJNIA5/O4iUuo=;
 b=KGazkswCTHk51U0r4J4ER6zsBXaX/JIKt2piGrFtf9j9w9xFC+ewwjl+CoEk2J0k83
 +mkSwUflHaf5wV5oAxILrxNkfVgT6F32lMuAvmaWxRbRQHXSlfOxr06wpzivkwG1YDGN
 aCRHaHWRhBTKUQqvFkd0gPjWpUrs/vq8uKABq+DzG9CXjrTJTnuPfQdTa0q9eL5LygDR
 nWKCHBYRxApwN8Kp8OrwiVucqBoKhxepsCUmkilja9pb02437psLY/Y9NH6nqyGPscNK
 vZ7cXUeGB+yAcFTIcDm3Uf3m4fix3Gpiz1Fq7jlfNge/2DRcAOM5VXDG2ex7S7qBjlvb
 W0eg==
X-Gm-Message-State: AOAM530ED5NXp3wbTvQQEnDphFXkJBNKRUSqNbu4ZWmjkNT7zpn2iqb5
 vyQKyBDacs2hxC7VXA+a+6NaE8RjYsAdiJ8HmPGgPk41YsjoF+QecqRP2N4iLUMzqqOTUw3a68E
 fubCytv7Y40xACGw=
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4106207wrq.106.1602082474104; 
 Wed, 07 Oct 2020 07:54:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8rDpBq7thsfKhBiNy6rw4DcRc0NqEtIryjtoWh1uwPXl6eHV6alaX0W4ArMCCJ+Q3sGsLJQ==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4106184wrq.106.1602082473866; 
 Wed, 07 Oct 2020 07:54:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id c68sm2999307wmd.34.2020.10.07.07.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 07:54:32 -0700 (PDT)
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
 <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
 <20201007142742.GV7303@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <117cb090-d9ce-6394-42a2-2ac99fd965b9@redhat.com>
Date: Wed, 7 Oct 2020 16:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007142742.GV7303@habkost.net>
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
X-List-Received-Date: Wed, 07 Oct 2020 14:54:41 -0000

On 07/10/20 16:27, Eduardo Habkost wrote:
>> It is always wrapped, but (as far as I recall, because I have never
>> worked with GPIOs) they are intentionally QOM properties and not just as
>> an implementation detail.  It's meant to be accessible to the user if
>> only through qom-get/qom-set.
>
> Being accessible for debugging would be OK.  I'm just worried
> about dynamic QOM properties being part of a stable and supported
> API.

Certainly accessing the properties is only for debugging.

However, I am not sure if the _existence_ of GPIOs as dynamic QOM
properties is part of the API; that is, whether the user has to specify
the names of these properties to create some devices.  I don't think
that wouldn't be a problem anyway, what do you think?

Paolo


