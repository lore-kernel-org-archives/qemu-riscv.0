Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o7drJ-0006Bm-8O
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jul 2022 10:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7drH-00067O-AC; Sat, 02 Jul 2022 10:12:27 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7drD-0004aM-9H; Sat, 02 Jul 2022 10:12:27 -0400
Received: by mail-ej1-x635.google.com with SMTP id fw3so8767224ejc.10;
 Sat, 02 Jul 2022 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qt1IyH0suB1QexFyLE5vkIhkCj/u0kDbUbELicgxvFQ=;
 b=GYF5Ik89L0oevbFHdmu0jyBKZtyihkh8sUOIKMClyHORHVj5q+KDNkJr3FJhhGaq3f
 k+hIgsqTOJLZ9tZz/DeOSgSBFmoXE7V8nRv67sNEBelc0yQbwbvmT244L0O9CsDocNjk
 Gcn1SySDI6Kl2kqa7mpo4hqdg/dWQWOOSv3dfdGyHq0J2epN2cE2YoKq9IjFVEbXcGuC
 MGuBNUQEOYrM17UHKN/9wDwS5qM0pYf8qdblUNGfp0SUNzqOhquLu7Om6NVu9V37vZSr
 BdhKMBqjINlxS/YCWREUZTGlrT3YOA8zRB/JRcco5w5LmtQVlA7gZMpO1Nb90Ekz2uKh
 kIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qt1IyH0suB1QexFyLE5vkIhkCj/u0kDbUbELicgxvFQ=;
 b=F7IBUBLKH1xaFCMkGIXbG42j4CJ3VI45m4W/Ww6GEE77dXSpdN3a44yfrH5rLXNXY4
 T4But4zrN/HTRRjAQDbBhYIpYTRLf0a+Tm2XRl2wUlplUt0ggM/JbWejp8LA/0MPU9G3
 zxbOuLxRr/7o+MRQCeGX3Bl4XVLUci9axM7x7G31/3nAwrCQJn8NWZEoVTd+m+m0fIqc
 v2A+bp9w48XL4DBqqNogyCVktXXaeLVAk9IEi63LiLi3DZxlVafjU2kK0rsXnYCWZ68t
 DW+U25ZJXtBA6eBhOYl11ZBnnAJNjE1ecMbKUbPcJcjLPVrshXpDBdeGlDTgDD9ZeKy6
 Of3w==
X-Gm-Message-State: AJIora862I/ZQGBNHDky9+x0RQpAtmp7tPCuoidzG+BhgtuiP4vMtpV3
 kAbqHGiKlibu6AWT3xszfTg=
X-Google-Smtp-Source: AGRyM1up6Iy1UfBZYgG1bQ1V7g1WMdYElPI3ZeKJ+ReLWEG0W5PVPev7EWd7L9LYn5kTM10XTBRC/A==
X-Received: by 2002:a17:906:9b94:b0:722:f2a1:efb9 with SMTP id
 dd20-20020a1709069b9400b00722f2a1efb9mr19430901ejc.42.1656771140495; 
 Sat, 02 Jul 2022 07:12:20 -0700 (PDT)
Received: from [192.168.242.248] (93-43-142-212.ip92.fastwebnet.it.
 [93.43.142.212]) by smtp.googlemail.com with ESMTPSA id
 u6-20020aa7d0c6000000b0043572ffafe0sm16733520edo.92.2022.07.02.07.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:12:20 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
Date: Sat, 2 Jul 2022 16:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/18] Make block-backend-io.h API more consistent
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 02 Jul 2022 14:12:28 -0000

On 5/17/22 13:35, Alberto Faria wrote:
> Adjust existing pairs of non-coroutine and coroutine functions to share
> the same calling convention, and add non-coroutine/coroutine
> counterparts where they don't exist.
> 
> Also make the non-coroutine versions generated_co_wrappers.
> 
> This series sits on top of "[PATCH v2 00/10] Implement bdrv_{pread,
> pwrite, pwrite_sync, pwrite_zeroes}() using generated_co_wrapper":
> 
>      https://lore.kernel.org/qemu-devel/20220513155418.2486450-1-afaria@redhat.com/

Alberto, does this need a rebase?

Paolo

> Based-on: <20220513155418.2486450-1-afaria@redhat.com>
> 
> Alberto Faria (18):
>    block: Make blk_{pread,pwrite}() return 0 on success
>    block: Add a 'flags' param to blk_pread()
>    block: Change blk_{pread,pwrite}() param order
>    block: Make 'bytes' param of blk_{pread,pwrite}() an int64_t
>    block: Make blk_co_pwrite() take a const buffer
>    block: Implement blk_{pread,pwrite}() using generated_co_wrapper
>    block: Add blk_{preadv,pwritev}()
>    block: Add blk_[co_]preadv_part()
>    block: Export blk_pwritev_part() in block-backend-io.h
>    block: Change blk_pwrite_compressed() param order
>    block: Add blk_co_pwrite_compressed()
>    block: Implement blk_pwrite_zeroes() using generated_co_wrapper
>    block: Implement blk_pdiscard() using generated_co_wrapper
>    block: Implement blk_flush() using generated_co_wrapper
>    block: Add blk_co_ioctl()
>    block: Add blk_co_truncate()
>    block: Reorganize some declarations in block-backend-io.h
>    block: Remove remaining unused symbols in coroutines.h
> 
>   block.c                           |  10 +-
>   block/block-backend.c             | 150 ++++++++++++------------------
>   block/commit.c                    |   4 +-
>   block/coroutines.h                |  44 ---------
>   block/crypto.c                    |   2 +-
>   block/export/fuse.c               |   4 +-
>   block/meson.build                 |   1 +
>   block/parallels.c                 |   2 +-
>   block/qcow.c                      |  14 +--
>   block/qcow2.c                     |   4 +-
>   block/qed.c                       |   8 +-
>   block/vdi.c                       |   4 +-
>   block/vhdx.c                      |  20 ++--
>   block/vmdk.c                      |  10 +-
>   block/vpc.c                       |  12 +--
>   hw/arm/allwinner-h3.c             |   2 +-
>   hw/arm/aspeed.c                   |   2 +-
>   hw/block/block.c                  |   2 +-
>   hw/block/fdc.c                    |  20 ++--
>   hw/block/hd-geometry.c            |   2 +-
>   hw/block/m25p80.c                 |   2 +-
>   hw/block/nand.c                   |  47 +++++-----
>   hw/block/onenand.c                |  32 +++----
>   hw/block/pflash_cfi01.c           |   4 +-
>   hw/block/pflash_cfi02.c           |   4 +-
>   hw/ide/atapi.c                    |   4 +-
>   hw/misc/mac_via.c                 |   6 +-
>   hw/misc/sifive_u_otp.c            |  14 +--
>   hw/nvram/eeprom_at24c.c           |   8 +-
>   hw/nvram/spapr_nvram.c            |  16 ++--
>   hw/nvram/xlnx-bbram.c             |   4 +-
>   hw/nvram/xlnx-efuse.c             |   4 +-
>   hw/ppc/pnv_pnor.c                 |   6 +-
>   hw/sd/sd.c                        |   4 +-
>   include/sysemu/block-backend-io.h | 105 ++++++++++++---------
>   migration/block.c                 |   8 +-
>   nbd/server.c                      |   8 +-
>   qemu-img.c                        |  33 +++----
>   qemu-io-cmds.c                    |  20 ++--
>   tests/unit/test-block-iothread.c  | 141 ++++++++++++++++++++++++++--
>   40 files changed, 433 insertions(+), 354 deletions(-)
> 


