Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT6Bz-0006NA-6P
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 13:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Bv-0006KT-BZ
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 13:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Br-00052w-Q1
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 13:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632332269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1l0AiXwDhCyCu/u0vTki8Ygujm+OCz4LudDX2/nmkU=;
 b=O3ocui0qCFzw/Q8mEsUfC9BGpUhdsun9gDBL8u9hgwcjKNWX2tjdxEIpNbHE6gWTMaLU+I
 pwRit7KWC6mhJrQf7pl+wPde8Km5Xh3q/pnD50zq103BuMoawBM19flDfe4i7ce7weitsR
 P5J9euhmmCcBMe9fa3vxcjsNxLBuk3Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-GXiyntTdNvq9ODN2BcJs9g-1; Wed, 22 Sep 2021 13:37:47 -0400
X-MC-Unique: GXiyntTdNvq9ODN2BcJs9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so2832927wru.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Sep 2021 10:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w1l0AiXwDhCyCu/u0vTki8Ygujm+OCz4LudDX2/nmkU=;
 b=bSzKVSs0OvYMHyAtBl0vg2NEtM3qNqcmTK70I5x/LM1MFBTHVr1+8Abc/WHNDuwuQz
 klgv+wepM4KYFvgbxAmSzGN6+mL3AlkSw23bpjhyh76D3FhKyoKc67n6EDwamhy6ylGL
 ZBnMnwspYgu+M0NyPk0/SwPaX7VVRqmY3g1TMH82ppQxG4VHO7occ9Ug0axfhpcIjXmi
 I+1BN/2x7nZs4acNzRbS8p+shUk7lEr5akPEof1oQzcGHA4tH4favvmcYsbqBs+nop/D
 gLCTscvUPGDXHLIg/VoJMjv9rA/GHZBfjVsb9hgywZk5Iu99K9ieuXdonmPofATGPa9n
 CGEg==
X-Gm-Message-State: AOAM533c4QH17Xzf6BWYSRWiFrP8WlGDQ1zT3fFpFfHgUjUGWNzifbR9
 bf1ubyQqA51l0jcMycz6hzFJpxotxiXA8+aT2Gk94+GrrmlxrSKnjo53Tu8uDsmfUuq05qU+8HX
 WMJ6mzmuEKX7iElc=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr12223514wmg.88.1632332266706; 
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg6vmpdLqfWALQ+aYScr0ufGB6YbggOHa9PzO72FTcIBc1TC/o6Tu07FmCA0vADFzchZXYUQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr12223500wmg.88.1632332266506; 
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v10sm3041925wri.29.2021.09.22.10.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:37:46 -0700 (PDT)
Message-ID: <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
Date: Wed, 22 Sep 2021 19:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-3-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 22 Sep 2021 17:37:56 -0000

On 9/22/21 18:13, Damien Hedde wrote:
> From: Mirela Grujic <mirela.grujic@greensocs.com>
> 
> The command returns current machine initialization phase.
>  From now on, the MachineInitPhase enum is generated from the
> QAPI schema.
> 
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Missing your S-o-b, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>   include/hw/qdev-core.h     | 30 ++------------------
>   hw/core/machine-qmp-cmds.c |  9 ++++++
>   hw/core/qdev.c             |  5 ++++
>   4 files changed, 72 insertions(+), 28 deletions(-)


