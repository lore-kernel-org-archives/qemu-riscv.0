Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jafDM-0008Bg-W0
	for mharc-qemu-riscv@gnu.org; Mon, 18 May 2020 08:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jafDM-0008BP-El
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 08:49:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35265
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jafDL-0006kB-7v
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 08:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589806190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtV5b4Z/XtezT8P8ZBmElN4tH8V6CxN5eoS0EIqEjTE=;
 b=g8HmA0m+M8GIKpk3hbmeD0cA8/jKN8jqWMe0TR08IecQGyl11YBBU9Ppc7Hi/UXvm52y74
 DxzE8sVizkxXrA7P6Um4QfoHJQ/aFC1h5my/6ki9IbYQJpOThfiB8Ja2e/g5hwIi5z5mBE
 G4yQXCFuDxQoixn8U90s85ItdQNDbvg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-jmcsH8b-Oxizxc53m5ocaA-1; Mon, 18 May 2020 08:49:49 -0400
X-MC-Unique: jmcsH8b-Oxizxc53m5ocaA-1
Received: by mail-wr1-f69.google.com with SMTP id l12so5630620wrw.9
 for <qemu-riscv@nongnu.org>; Mon, 18 May 2020 05:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtV5b4Z/XtezT8P8ZBmElN4tH8V6CxN5eoS0EIqEjTE=;
 b=XyjX2sahdxAl0bGQvOe+pCo2alWUd/eallRLtZT+5E5GAsPcfJBmos7U+m9Vn182FV
 mF3QpU4UoXfANFXh26ru9FaE27msXarhQCTwuwRwL6as5jywLbr9EOGI42G5FCZDhZKf
 eLZsLjeNkWnHI8/p7RJ5ESYEjSJqOUze5qwxIN2q3QAveqLdDITYcOTsK3kdiAeLQ7Vh
 uuQxP4E1f8bCPiY+E3OmfWHPaJZBlG+QlhVD2DX2BAcVr9/1BE3B6vA5p2LBXpq/puKY
 Nr59kIAmuLJhIvnBALVAJI9ECWSJ83G8WvJgWYDAmRt77myqLojhUb65jp6LdUbaftfW
 FAuw==
X-Gm-Message-State: AOAM530/A1CVYtESBgci7/nO2hZoyJ7QO5jjkPfGfMqyUmCMruQsy7Ny
 8d3f1a/OBR/YP/nntl4pJI7snf38hrHayHjy3pCU1vc+CrIO+DoIqedInT3Et1DDTm3Vyv6hWTk
 wVRTXr2kdjaitiNQ=
X-Received: by 2002:a1c:2943:: with SMTP id p64mr3612186wmp.42.1589806187898; 
 Mon, 18 May 2020 05:49:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT7XuFpYriz4sbAWsGHNC0Yg+i8COo+5P/Ky2+Hf/GqKYTA6lqdkDQbsQ/014q6EPI2U86+A==
X-Received: by 2002:a1c:2943:: with SMTP id p64mr3612153wmp.42.1589806187646; 
 Mon, 18 May 2020 05:49:47 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.90.67])
 by smtp.gmail.com with ESMTPSA id e22sm16814111wrc.41.2020.05.18.05.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 05:49:47 -0700 (PDT)
Subject: Re: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Leif Lindholm <leif@nuviainc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200511205246.24621-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <60f129c2-499d-01e1-e0ee-9fd6ac759736@redhat.com>
Date: Mon, 18 May 2020 14:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200511205246.24621-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 18 May 2020 12:49:52 -0000

On 11/05/20 22:52, Philippe Mathieu-Daudé wrote:
> Use the QEMU_IS_ALIGNED() macro to verify the flash block size
> is properly aligned. It is quicker to process when reviewing.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/sbsa-ref.c       | 2 +-
>  hw/arm/virt.c           | 2 +-
>  hw/block/pflash_cfi01.c | 2 +-
>  hw/block/pflash_cfi02.c | 2 +-
>  hw/i386/pc_sysfw.c      | 2 +-
>  hw/riscv/virt.c         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 8409ba853d..b379e4a76a 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -241,7 +241,7 @@ static void sbsa_flash_map1(PFlashCFI01 *flash,
>  {
>      DeviceState *dev = DEVICE(flash);
>  
> -    assert(size % SBSA_FLASH_SECTOR_SIZE == 0);
> +    assert(QEMU_IS_ALIGNED(size, SBSA_FLASH_SECTOR_SIZE));
>      assert(size / SBSA_FLASH_SECTOR_SIZE <= UINT32_MAX);
>      qdev_prop_set_uint32(dev, "num-blocks", size / SBSA_FLASH_SECTOR_SIZE);
>      qdev_init_nofail(dev);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 634db0cfe9..0a99fddb3d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -978,7 +978,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>  {
>      DeviceState *dev = DEVICE(flash);
>  
> -    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
> +    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
>      assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
>      qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
>      qdev_init_nofail(dev);
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index f586bac269..11922c0f96 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -964,7 +964,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
>      if (blk) {
>          qdev_prop_set_drive(dev, "drive", blk, &error_abort);
>      }
> -    assert(size % sector_len == 0);
> +    assert(QEMU_IS_ALIGNED(size, sector_len));
>      qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>      qdev_prop_set_uint64(dev, "sector-length", sector_len);
>      qdev_prop_set_uint8(dev, "width", bank_width);
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index c6b6f2d082..895f7daee3 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -1003,7 +1003,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>      if (blk) {
>          qdev_prop_set_drive(dev, "drive", blk, &error_abort);
>      }
> -    assert(size % sector_len == 0);
> +    assert(QEMU_IS_ALIGNED(size, sector_len));
>      qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>      qdev_prop_set_uint32(dev, "sector-length", sector_len);
>      qdev_prop_set_uint8(dev, "width", width);
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index f5f3f466b0..fad41f0e73 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -168,7 +168,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
>                           blk_name(blk), strerror(-size));
>              exit(1);
>          }
> -        if (size == 0 || size % FLASH_SECTOR_SIZE != 0) {
> +        if (size == 0 || !QEMU_IS_ALIGNED(size, FLASH_SECTOR_SIZE)) {
>              error_report("system firmware block device %s has invalid size "
>                           "%" PRId64,
>                           blk_name(blk), size);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index daae3ebdbb..71481d59c2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -112,7 +112,7 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>  {
>      DeviceState *dev = DEVICE(flash);
>  
> -    assert(size % VIRT_FLASH_SECTOR_SIZE == 0);
> +    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
>      assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
>      qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
>      qdev_init_nofail(dev);
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


