Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdBF0-0007Vc-QX
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 09:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBEx-0007Q1-Nm
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 09:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBEv-0003en-EO
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 09:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634734956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vF0TDl//PE/wE5o24UNInITXBkDbjdY8Jy1efbbDS8s=;
 b=CkK1HY6aH40CxRdpIWf3Z7ao5AV3E75y4XKf+mRo0o68rhvNRcSe4iKwbUHTzfq+3K6UK6
 NSaFcUu2pKE05bvOlM5ev1/XCxMTOPNSBpL/nvRm6x6qRP2PCKMTyA6NR5xVfn+v8OE/JB
 zXDOPsrTEc5+u4cPnyfowIC/DQYvt8E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-IQrT-Nn2MuaoRVaniOznCw-1; Wed, 20 Oct 2021 09:02:35 -0400
X-MC-Unique: IQrT-Nn2MuaoRVaniOznCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 o137-20020a1ca58f000000b0030d89b84726so2157109wme.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 06:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vF0TDl//PE/wE5o24UNInITXBkDbjdY8Jy1efbbDS8s=;
 b=PL9eDNI1rRB3f0RAeNkv7SoYe6K29RCipU4HInICf/wv6Tez9nvDyMB9Rpzr4uVuIV
 6tygYqKLHY6LqhGvu111V41z/oJBhC1qJPNtA+5riCnCc5Uu3BEqmbqwokuaY0prA7W0
 gqnzkzGvCcsgjkZFtRpprEn5q76VXsnX6/RXU8dllIBpppflbKu9EKbYJBF/calNgFvZ
 gzIx6JkXnbLsYQZhEyOnbltZvWnVWtyWhrXPVGiIafqSGvqdQX3e8/PUqS3DiTQecuER
 RLXyXD4d/v58p3P2Mprn+2tgyXGSy2N+T9m1yRAZi+lrAA8Ib1CT2li04I9LnCsaJBRI
 fG6Q==
X-Gm-Message-State: AOAM532icS//BLpwLHcFcicZ7uIU9YIgZwiIJSMvcVCmg27+4vmj9joS
 Yt0XcQtEhAZwHxPLfF+unAst3DN3qhwVXvSs1uPPhNXo5lim3lnwhJStJY6VXlFcG4qAHz0qbLy
 Ol7FfJ9Y+11mtswM=
X-Received: by 2002:a5d:508b:: with SMTP id a11mr53580952wrt.417.1634734952796; 
 Wed, 20 Oct 2021 06:02:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwERc5ivYzJiVSUUQDCtlOJZ+uqL5xZzJkyNc9VQzTER4Qja6uejPRv5U1NED4zNdyH5rCXtQ==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr53580282wrt.417.1634734947688; 
 Wed, 20 Oct 2021 06:02:27 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id g70sm2003337wme.29.2021.10.20.06.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:02:27 -0700 (PDT)
Message-ID: <a786c24d-0efc-e2ed-acdd-cd5d1ad9f640@redhat.com>
Date: Wed, 20 Oct 2021 15:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020014112.7336-5-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 20 Oct 2021 13:02:45 -0000

On 10/20/21 03:41, Bin Meng wrote:
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
> 
>  hw/riscv/sifive_e.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


