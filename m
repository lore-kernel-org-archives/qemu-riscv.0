Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lj64i-000152-PU
	for mharc-qemu-riscv@gnu.org; Tue, 18 May 2021 16:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj64e-0000l7-0b
 for qemu-riscv@nongnu.org; Tue, 18 May 2021 16:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj64R-0006Gs-BM
 for qemu-riscv@nongnu.org; Tue, 18 May 2021 16:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621368722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtLwxEnsEfN6cj4xHan6As3MuvE7If+R0pjppMZsGg0=;
 b=Wmf2VsWQ4NH/48gQ/ltxdQuNiJaLY3iHh7SDMSm3lSN5xGpIpDMm2EP1qSja9v0eryrZSS
 c7r66QUl6NhbQCSxUFexPq3ZL1J/gdEc+qtKFY0Xr8Iuzcm0f5HP8VSPaIzQpQTIqgOmwk
 ZuLke1OBVcia+6qsfbR68ltsq6Xaquk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-b2xTliqnMfKh4ynYZSvUCg-1; Tue, 18 May 2021 16:11:57 -0400
X-MC-Unique: b2xTliqnMfKh4ynYZSvUCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so6421359edv.12
 for <qemu-riscv@nongnu.org>; Tue, 18 May 2021 13:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EtLwxEnsEfN6cj4xHan6As3MuvE7If+R0pjppMZsGg0=;
 b=fmCYEqeQ85a2IEZiQMQrkSq/3xVjwncEMV25emmgAq1mA4oKFSezZQdqf6LqP0zkkz
 s2y8STu6rzGlyI56HTSrWiI1rHQcnBm3GtrERXdOznEpHTxut4QCaLvaFK18BFKYlrxI
 cFPd3qBjla26i4QePOdQ2kaHMSic66k8Cy7E5b+nlb4dP1VKe4OKZCB13c8f6S5yhy8M
 oYNuiwJ00DbT29vWvxZLJ6DXNYWfMFhWOypeIVpSICGB4RrgNzuToKaxkpOS3Usx6Rkv
 5/0PPB7XZ+d24fVHi88RVgD6FOo2MgcyI1t2lqw6ABJhKpWG581alUjhuqdIvC16SIEm
 JAvg==
X-Gm-Message-State: AOAM531EO15T+OfH84563somKCCiXg5BXHxghTKj0CR6CrhgKEAUhM+t
 k2IBMY5m53rkQw8Y6XLdJnJul9QSaRpdQMf6cwWHByEcGsDyU4+OqsagxA3zS1cq6A7+XJ+R3IE
 BKmuTj2d7qobv84w=
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr7697747ejm.527.1621368715804; 
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOvoLewqk7B22jcfp7eaqS/xLOgx1W3a4vSsHE8OXTrbHXyRAdYGK6W02CDmbGbH3LyAngOQ==
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr7697730ejm.527.1621368715659; 
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n17sm13378101eds.72.2021.05.18.13.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
 <20210517200416.pt4xghxiuzuwknvn@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <610577a6-0aea-e6af-7f93-0caa9eb75e27@redhat.com>
Date: Tue, 18 May 2021 22:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517200416.pt4xghxiuzuwknvn@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 18 May 2021 20:12:16 -0000

On 5/17/21 10:04 PM, Eduardo Habkost wrote:
> On Mon, May 17, 2021 at 03:18:56PM -0400, Eduardo Habkost wrote:
>> CCing Build system architecture maintainer (Daniel).
> 
> Oops, I was misled by the subsection title.  Daniel is
> responsible only for the build system documentation.
> 
> Do we have any volunteers willing to be listed as reviewers for
> build system changes in MAINTAINERS?  meson.build has a
> non-trivial amount of code and no maintainers or reviewers at
> all.

Hmmm OK I can add an entry. Ideally with Paolo/Thomas but I don't
think they want to be listed in any new section ;)

>> On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daudé wrote:
>>> Various Kconfig fixes when building stand-alone machine binaries.
>>
>> Who should merge this once it's ready?

Paolo said in v1 that I can send the pull request myself :))

I will do it in the next 48h~.

Thanks,

Phil.


