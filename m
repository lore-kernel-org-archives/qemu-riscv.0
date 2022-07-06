Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o90XH-0007SN-9p
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jul 2022 04:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o90XE-0007Or-EC
 for qemu-riscv@nongnu.org; Wed, 06 Jul 2022 04:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o90XB-0001Bb-RL
 for qemu-riscv@nongnu.org; Wed, 06 Jul 2022 04:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657096641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
 b=ZocWAx0ejlGAzlP1l6e1FvZZn3d3ZpE/fJrWDWtWlsKGjMS+XUMKREQYiWsP5ZDL+FXaYw
 s12Mh7+pk5BgclKE2uwgNdnZ6ryFFP0x4wOG2IuYRlCRCpNqK564qPkqPwsxauKtwoKjea
 VlqeGhqj4vNG8lc3tGi+mRJKN6EBIek=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-5FSRdrlcNxmbAbPTMgqdkQ-1; Wed, 06 Jul 2022 04:37:19 -0400
X-MC-Unique: 5FSRdrlcNxmbAbPTMgqdkQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 go10-20020a1709070d8a00b00722e8ee15b4so3573300ejc.22
 for <qemu-riscv@nongnu.org>; Wed, 06 Jul 2022 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZCrblR5e75Sx5FizphwHPCHa4vRuYb/Ub/Stwr788FY=;
 b=MhMP68kzR1mn1FuRIpfNmRSSJqS6sW+rLpJ6dtrkTwjIyxiOWbou8XToQ9n1UOMz74
 W6YXPauCkYRQnrtIh8aXbQg2wa2PE02gRLEF9jObKX0s4o8RQK0TrAEp+u/MZlzEOyw/
 M5wJFVBqguAv1JgxlHNyoLFv2MI68O+mWM9eD76t9XnFuqBqWGq+XdmkNg0CzO6HWkWa
 b7LtWnfklw3+qLJKOgsrT3gvIX4UtdlhiLDY8n0XVawGwsT0dN8qAnq1dwDJVjwIS/gd
 Rmg3KP6CXtz/zZPq6wpYTsCV+iYigKJB56qdHpkoBShTk3/Pez97r1hdPbKdQckS/qkE
 /kNg==
X-Gm-Message-State: AJIora92kEbh/jDHVqXoEeAoGU6huKTBO8iLJ4Or2lhraVfd3/YLN+aS
 oqTuypGz4rHFJYc2Mq5KfQQ5wQasPkDOtYsNGsU/hBpfYliczp0UDp/cVq/Nt0Py4nhQk1LyXc1
 mr5ZzUo2EUDwnB0U=
X-Received: by 2002:a17:907:78ce:b0:726:a66e:eba1 with SMTP id
 kv14-20020a17090778ce00b00726a66eeba1mr36833112ejc.415.1657096638873; 
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tpoAx3JeURa60gKtgyp2NQ8Sq9WLvyQDxukCX0S2QItgGPcvBO9mCfqoztOn4N0+JjK5Rz1g==
X-Received: by 2002:a17:907:78ce:b0:726:a66e:eba1 with SMTP id
 kv14-20020a17090778ce00b00726a66eeba1mr36833068ejc.415.1657096638595; 
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b00726b03f83a0sm12717489ejd.33.2022.07.06.01.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:37:18 -0700 (PDT)
Message-ID: <a0c487f3-c111-44cc-0f4a-c1ecbe85d769@redhat.com>
Date: Wed, 6 Jul 2022 10:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/18] block: Make blk_{pread,pwrite}() return 0 on
 success
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
 "Denis V. Lunev" <den@openvz.org>, qemu-arm@nongnu.org
References: <20220705161527.1054072-1-afaria@redhat.com>
 <20220705161527.1054072-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-2-afaria@redhat.com>
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
X-List-Received-Date: Wed, 06 Jul 2022 08:37:24 -0000

On 05.07.22 18:15, Alberto Faria wrote:
> They currently return the value of their 'bytes' parameter on success.
>
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                          |  8 +++++---
>   block/block-backend.c            |  7 ++-----
>   block/qcow.c                     |  6 +++---
>   hw/block/m25p80.c                |  2 +-
>   hw/misc/mac_via.c                |  4 ++--
>   hw/misc/sifive_u_otp.c           |  2 +-
>   hw/nvram/eeprom_at24c.c          |  8 ++++----
>   hw/nvram/spapr_nvram.c           | 14 +++++++-------
>   hw/ppc/pnv_pnor.c                |  2 +-
>   qemu-img.c                       | 25 +++++++++----------------
>   qemu-io-cmds.c                   | 18 ++++++++++++------
>   tests/unit/test-block-iothread.c |  4 ++--
>   12 files changed, 49 insertions(+), 51 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


