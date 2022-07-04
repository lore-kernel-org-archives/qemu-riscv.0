Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8Mgu-00083z-PD
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 10:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Mgt-0007uv-2I
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 10:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Mgp-0001ap-FZ
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 10:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656943478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YJBIQ3KZS2kosDWmEX4LYFVVC9WYJNZL4/cJiH+J70=;
 b=OwdfbKzy6qal4eYOfSoqVooYFvluX4j9N8N7ahOkDA4myopgQni/DSX60bQumph7AMA1Ah
 8wzJnbwSWPcJVuAUbc6ZBIDRBLWpUOORQR9/V7KQgeUDVCWIjyKSPugqxBvg6abVeZzdIV
 0uxd0T8fnV/3hI8Y9F+8NOFQ9Z7Nfyg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-Mfy4CoQ0OX6x93gHCWFqOg-1; Mon, 04 Jul 2022 10:04:37 -0400
X-MC-Unique: Mfy4CoQ0OX6x93gHCWFqOg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x21-20020a05640226d500b00435bd7f9367so7242044edd.8
 for <qemu-riscv@nongnu.org>; Mon, 04 Jul 2022 07:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3YJBIQ3KZS2kosDWmEX4LYFVVC9WYJNZL4/cJiH+J70=;
 b=eR/tzFNM20XrJo/hjVSiEYFmJRrv9YrkQWkAdCwzYZXCYAK0sJtSafOlds8y4MlCsr
 CuhBQ3zfIo+aHf0qjSFVnEopHmiYh6mz2YllPGj4TFO34H8lF6sQhhlf720RqDCfAQKM
 oUXmATBG9ZE9Lkqv13aVGNAUV5ZwgP0iIjSE171QMVlnewxluDLwVFASD8YaQnuNMOde
 21XlgZxZnCUSYqbaByoWQrs2Gy3zXpVQAun4Q5eQcWQ79S7cbGZuttFScUtUJBr34z62
 7/etlWRNvy9W5mA0iDq4R1EA9lUgmxaWN67FdWV1OqhryehaaYLFuJT5wdsfyiQBsN81
 35Sg==
X-Gm-Message-State: AJIora9zsIHGLWlu+pPgYGOlpK3C7mt5sLvpzMenczAepoKWreeX35M+
 9y91Q2Z0ti1cltl9xPy1n3Ac7GpG32Oqo8+ecRb8+OhaaTRv1BIWf8/8Ngs5r8+UbG/DqoeUzBq
 q3hN5FBO9XJL4+Wk=
X-Received: by 2002:a17:906:938a:b0:726:942a:54ef with SMTP id
 l10-20020a170906938a00b00726942a54efmr29203701ejx.728.1656943476251; 
 Mon, 04 Jul 2022 07:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/GicAGvTpiV3kjhcv7yJDeUvdhmBy9WtOyWECzw09/mIgOpvVkDxMpJOuV5cIGetTnBeqgA==
X-Received: by 2002:a17:906:938a:b0:726:942a:54ef with SMTP id
 l10-20020a170906938a00b00726942a54efmr29203661ejx.728.1656943475852; 
 Mon, 04 Jul 2022 07:04:35 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a056402051200b0043a61f6c389sm1726951edv.4.2022.07.04.07.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:04:35 -0700 (PDT)
Message-ID: <0b04e477-75ec-cf8d-04b0-e6c6653504ea@redhat.com>
Date: Mon, 4 Jul 2022 16:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/18] block: Add a 'flags' param to blk_pread()
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-3-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113524.197910-3-afaria@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 04 Jul 2022 14:04:43 -0000

On 17.05.22 13:35, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement it using generated_co_wrapper.
>
> Callers were updated using this Coccinelle script:
>
>      @@ expression blk, offset, buf, bytes; @@
>      - blk_pread(blk, offset, buf, bytes)
>      + blk_pread(blk, offset, buf, bytes, 0)
>
> It had no effect on hw/block/nand.c, presumably due to the #if, so that
> file was updated manually.
>
> Overly-long lines were then fixed by hand.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                           |  2 +-
>   block/block-backend.c             |  5 +++--
>   block/commit.c                    |  2 +-
>   block/export/fuse.c               |  2 +-
>   hw/arm/allwinner-h3.c             |  2 +-
>   hw/arm/aspeed.c                   |  2 +-
>   hw/block/block.c                  |  2 +-
>   hw/block/fdc.c                    |  6 +++---
>   hw/block/hd-geometry.c            |  2 +-
>   hw/block/m25p80.c                 |  2 +-
>   hw/block/nand.c                   | 12 ++++++------
>   hw/block/onenand.c                | 12 ++++++------
>   hw/ide/atapi.c                    |  4 ++--
>   hw/misc/mac_via.c                 |  2 +-
>   hw/misc/sifive_u_otp.c            |  4 ++--
>   hw/nvram/eeprom_at24c.c           |  2 +-
>   hw/nvram/spapr_nvram.c            |  2 +-
>   hw/nvram/xlnx-bbram.c             |  2 +-
>   hw/nvram/xlnx-efuse.c             |  2 +-
>   hw/ppc/pnv_pnor.c                 |  2 +-
>   hw/sd/sd.c                        |  2 +-
>   include/sysemu/block-backend-io.h |  3 ++-
>   migration/block.c                 |  4 ++--
>   nbd/server.c                      |  4 ++--
>   qemu-img.c                        | 12 ++++++------
>   qemu-io-cmds.c                    |  2 +-
>   tests/unit/test-block-iothread.c  |  4 ++--
>   27 files changed, 52 insertions(+), 50 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


