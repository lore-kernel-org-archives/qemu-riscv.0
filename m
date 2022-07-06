Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o91bm-0004YR-A6
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jul 2022 05:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91bh-0004Sm-0d
 for qemu-riscv@nongnu.org; Wed, 06 Jul 2022 05:46:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o91bd-0001Cd-F8
 for qemu-riscv@nongnu.org; Wed, 06 Jul 2022 05:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657100759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuX1/epkpkLVCiKU3+ESovk0lEjQi0VoeklsV1F0w9I=;
 b=RYIhjoLxSbu3uNaQ/nKLdG6spBgnzshou3TzWZqehq8zG944q2xAqqovZIcfIYsjj6VPz1
 MJ9w/hxA5RDPvBZZacrf1DZX+9Ema98+bFPgPYGXZUbVicjLA34M5d72ypX58740yJssGL
 weuTqZba+ascA+OgGGZ0iaUegNBrhLA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-SBdwfVtVN2ahi2IyYJy8Fg-1; Wed, 06 Jul 2022 05:45:58 -0400
X-MC-Unique: SBdwfVtVN2ahi2IyYJy8Fg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w5-20020a056402268500b0043980311a5fso10789619edd.3
 for <qemu-riscv@nongnu.org>; Wed, 06 Jul 2022 02:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tuX1/epkpkLVCiKU3+ESovk0lEjQi0VoeklsV1F0w9I=;
 b=rP2HwwmqY9wwzOVVqOjgSMRniiXOwXkl8SWD19oreDZYV62hAhAKmL1Xh1XZnsgdYK
 b4TI9Vk1423EM5chM2E/fNJvwKlajVCOuy0znnlU73WIzqkh20WX0CCzJLO+83EtCrAk
 oZkzIMWNWw44JR1QIEYzC8ko6JHW8am6HIj5/l+CKUfVIUDyG64Q3aGkyUZV6yAtlB9z
 SsSqvCde8z29x3m5BJqFG3nhnO/kHpSmYdrFZmTUVNzFSiGYf/BJLuJF3HW7ChRtd6Ym
 SLIHdZlo8dtf1lkRK6/HXhmn9dld9hNfzGE96rBzurFqO/oqOJPeOJ2sJW+1kkP9ugoP
 CfhA==
X-Gm-Message-State: AJIora+Rl3RE9YQ6QcEe221VpdZTwVm3w3ITBiwsSNCRHkZC4c85g/vG
 Co9Gq8FWVolo5emaUn3olSexaiZt2h8fHwNV2V8frIEZ7ZUZqo9OAEMj8djYvK/pxjcOL+u725I
 N35HcDvalUDptVv4=
X-Received: by 2002:a05:6402:241e:b0:437:d732:20d2 with SMTP id
 t30-20020a056402241e00b00437d73220d2mr52416373eda.39.1657100757605; 
 Wed, 06 Jul 2022 02:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQh3AWJZzMOG9NJh9TAqxSXVnPLNadZLeJyEtxDH7Rl9QnXQJlhLkCQBVwLQDrbY9FIcnP3Q==
X-Received: by 2002:a05:6402:241e:b0:437:d732:20d2 with SMTP id
 t30-20020a056402241e00b00437d73220d2mr52416328eda.39.1657100757432; 
 Wed, 06 Jul 2022 02:45:57 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a170906b29800b0072629374590sm17167914ejz.120.2022.07.06.02.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:45:57 -0700 (PDT)
Message-ID: <dcbb1e98-51a3-3a14-616d-45c404d6ca31@redhat.com>
Date: Wed, 6 Jul 2022 11:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/18] Make block-backend-io.h API more consistent
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
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 06 Jul 2022 09:46:06 -0000

On 05.07.22 18:15, Alberto Faria wrote:
> Adjust existing pairs of non-coroutine and coroutine functions to share
> the same calling convention, and add non-coroutine/coroutine
> counterparts where they don't exist.
>
> Also make the non-coroutine versions generated_co_wrappers.
>
> This series sits on top of "[PATCH v5 00/10] Implement
> bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using
> generated_co_wrapper":
>
>      https://lore.kernel.org/qemu-devel/20220609152744.3891847-1-afaria@redhat.com/
>
> Based-on: <20220609152744.3891847-1-afaria@redhat.com>
>
> v2:
>    - Avoid using variables named 'len' or similar to hold return values
>      from blk_{pread,pwrite}(), as they don't return a length anymore.
>    - Drop variables in_ret and out_ret in qemu-img.c:img_dd().
>    - Initialize buf in test_sync_op_blk_pwritev_part().
>    - Keep blk_co_copy_range() in the "I/O API functions" section of
>      include/sysemu/block-backend-io.h.

Thanks!  Applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


