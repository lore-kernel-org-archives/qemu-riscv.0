Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o91IR-0005Gv-Da
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jul 2022 05:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91IL-00057z-Lh
 for qemu-riscv@nongnu.org; Wed, 06 Jul 2022 05:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91IF-0000kU-T0
 for qemu-riscv@nongnu.org; Wed, 06 Jul 2022 05:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657099558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3KVOETwHBpgBlP/XTrW1zbDvukK5C5SpzilgdqqDrw=;
 b=MowxF38MOjrOQ+TuIZY/A3pyT9XxNMWj1H6kJpe8fvfE9d/G5VOGOzoTRooktku/B++lFD
 jOLoenBqUvQVxpFDSlFAWTS1i9wSW27rEDzenwIqwWGbf0sUR26GA9rUMkWXsSfn7vDV77
 pLQMmvu2ZqXS5ImQEVOQUDomJXzyglE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-yvQ6er0TMhi4IDTM8387Zw-1; Wed, 06 Jul 2022 05:25:57 -0400
X-MC-Unique: yvQ6er0TMhi4IDTM8387Zw-1
Received: by mail-ed1-f69.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso11113886edx.19
 for <qemu-riscv@nongnu.org>; Wed, 06 Jul 2022 02:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z3KVOETwHBpgBlP/XTrW1zbDvukK5C5SpzilgdqqDrw=;
 b=4qe2yDLI/EtIFrkr7P6ySyGA399tycmSRF00KANANABXCdzFd0ft4cgTHl4SuGHMMP
 FOQkoRW3XztF0dE2ifcPGZc8ISrhn6xmcVeWNsnqwF9n1NGlr2GT1+2W5HCf38heLuiM
 5XxG2Fjfly12Lip8/7FTVJEBdPSAvJx9OpgB20eDb7K5FN0UIjt22EPgw4lWGfn9kF5F
 c93w5TYvyogxu2FNpmFGMdhoE//VATG1wuN6xe9xaqfFG5pB3TBaUBFzXTqdm9RQmoAA
 4IJTYGhmv4QOb0M2wUjJZGxnw5LwTGA7vIOCIHJSFYf78gPuXZr2HHvFOkkhDaUehp05
 tfdg==
X-Gm-Message-State: AJIora9ake8Aiutdkr0irouFDwUjppSClyFXCguF0g/EgQ3q8374ZEj2
 ngwMnHt64Qm79PDekNtvW5FCFEv96kz0guj/ueLnkLVOwuPwV6MoqqpfVyzEYxjNEwYWoQQYj//
 zCSxjnEbm4M7rhrA=
X-Received: by 2002:a05:6402:40cb:b0:43a:8a99:225f with SMTP id
 z11-20020a05640240cb00b0043a8a99225fmr2712415edb.414.1657099556729; 
 Wed, 06 Jul 2022 02:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1us0GJlitB3X2tAD80PUBMzFeEaNAIYz6zQ7JX7QS8uxbilC2RZ3V7rjNLxjxwQsX2I4IIO7Q==
X-Received: by 2002:a05:6402:40cb:b0:43a:8a99:225f with SMTP id
 z11-20020a05640240cb00b0043a8a99225fmr2712360edb.414.1657099556446; 
 Wed, 06 Jul 2022 02:25:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b0072afb23fb9esm532601ejh.16.2022.07.06.02.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:25:56 -0700 (PDT)
Message-ID: <4f6c4f22-d446-5fc9-d7e3-9fbd2bf32da4@redhat.com>
Date: Wed, 6 Jul 2022 11:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 17/18] block: Reorganize some declarations in
 block-backend-io.h
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley
 <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
 <20220705161527.1054072-18-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-18-afaria@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Jul 2022 09:26:06 -0000

On 05.07.22 18:15, Alberto Faria wrote:
> Keep generated_co_wrapper and coroutine_fn pairs together. This should
> make it clear that each I/O function has these two versions.
>
> Also move blk_co_{pread,pwrite}()'s implementations out of the header
> file for consistency.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-backend.c             | 22 +++++++++
>   include/sysemu/block-backend-io.h | 77 +++++++++++++------------------
>   2 files changed, 54 insertions(+), 45 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


