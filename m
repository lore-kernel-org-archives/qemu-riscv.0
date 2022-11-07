Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os0Em-00058e-8M
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 06:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os0Eb-00057c-8i
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 06:24:13 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1os0EU-0001YO-G7
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 06:24:07 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso14243737pjg.5
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=In7EM83NQpw5FRQfyQChh1DJYtJcwIhOwu3buUisba0=;
 b=i9htem0j9rpPBVFI3RGz3ePVC+6QW3DgpOsleM+gGndF4wpKT0M07Ii38LvkGQzgW+
 aTZtULwgGECFLRAnpTC0yYj1a2XcMreM9guJS1Xs8k/33Q67qWKtuuEA6i/Q2EC2CHUa
 tUBySY49t38GhshNc/MuYv0rQtPsarFGXeopgUGEe8TYDV1gAvY3saW6yjcklQpl6Kr2
 Gu3Xw8m1KBWDWL6r1lE6tWkZaeBkBhzH0HlHoXQOWMqtJi7LCq1fDWMFLS7cdSFUzFr7
 pUwEtXf0ha0McCN60JX9yomyfuiI7YlSnGaeIzR9Rj9x2smt4Q429sBfd3CjcraiySMX
 TiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=In7EM83NQpw5FRQfyQChh1DJYtJcwIhOwu3buUisba0=;
 b=aDIpoSP4QXnTPFxOhl4aysvX+buP1B5GzFG7XLZ+fMvUbBetRyTV/jgV9JFa4VETPD
 v/G5iJIYj7Fe9G0QUiEbq1WstvAPChnVWil/pwfzqONzzi94wz1sgyt/1WaMWVxAjpVS
 kv0eiLN+ktP91GdjB2CZNk1Z0awZ1RnCdjLRncBio13k3c5oW1yeF3JbLH14OdvM6VFh
 HqS1wS1gKX7oC9Hxk/bcgwZoLDZtV3pjWrLX556IfwmMegrG4o8JkjlcTsO1gSVsaTu+
 4UMY2J34TeUZxDhkhKJzjSVkMWq4b2BwWC3R7iB6mXbOB76Wm/6I/4H1kYFhhswo/uEi
 nM5w==
X-Gm-Message-State: ACrzQf2tQngROkEz48FHiyiABXfRfXFTyfw3jdpRtQz2vRyXY3UraVNW
 2OBOx9zrWBLy9Tda4j/ZlbkN8g==
X-Google-Smtp-Source: AMsMyM6pPTmvT8O9NiCp5VWcK4eBDUJNhOhco/jMSnLOE5adwu1HcixUiUH1zgtS4rj+2ykNM4Vg0g==
X-Received: by 2002:a17:902:cecf:b0:187:fd2:79c3 with SMTP id
 d15-20020a170902cecf00b001870fd279c3mr33374706plg.34.1667820241118; 
 Mon, 07 Nov 2022 03:24:01 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170902da8c00b00186b04776b0sm4783848plx.118.2022.11.07.03.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 03:24:00 -0800 (PST)
Date: Mon, 7 Nov 2022 16:53:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: maobibo <maobibo@loongson.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2jqyYsiZPh1+TzE@sunil-laptop>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <80ccc060-32a7-bc38-bf2b-2ef5959a7e0c@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80ccc060-32a7-bc38-bf2b-2ef5959a7e0c@loongson.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 07 Nov 2022 11:24:14 -0000

On Mon, Nov 07, 2022 at 05:57:45PM +0800, maobibo wrote:
> 
> 
> 在 2022/11/6 22:39, Sunil V L 写道:
> > The pflash implementation currently assumes fixed size of the
> > backend storage. Due to this, the backend storage file needs to be
> > exactly of size 32M. Otherwise, there will be an error like below.
> > 
> > "device requires 33554432 bytes, block backend provides 3145728 bytes"
> > 
> > Fix this issue by using the actual size of the backing store.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/riscv/virt.c | 33 +++++++++++++++++++++++++--------
> >  1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a5bc7353b4..aad175fa31 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -49,6 +49,7 @@
> >  #include "hw/pci/pci.h"
> >  #include "hw/pci-host/gpex.h"
> >  #include "hw/display/ramfb.h"
> > +#include "sysemu/block-backend.h"
> >  
> >  /*
> >   * The virt machine physical address space used by some of the devices
> > @@ -144,10 +145,17 @@ static void virt_flash_map1(PFlashCFI01 *flash,
> >                              MemoryRegion *sysmem)
> >  {
> >      DeviceState *dev = DEVICE(flash);
> > +    BlockBackend *blk;
> > +    hwaddr real_size;
> >  
> > -    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
> > -    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> > -    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
> > +    blk = pflash_cfi01_get_blk(flash);
> > +
> > +    real_size = blk ? blk_getlength(blk): size;
> > +
> > +    assert(real_size);
> > +    assert(QEMU_IS_ALIGNED(real_size, VIRT_FLASH_SECTOR_SIZE));
> > +    assert(real_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> How about add one sentence?
>        assert(real_size <= size);   
> 
> As defined VIRT_FLASH memory space, the total memory space size 64M,
> Pflash0/Pflash1 cannot be more than 32M. Supposing real size of pflash0
> is 33M, there will be conflict with address space of pflash1.
> 
> regards
> bibo, mao
> 

Good catch!. Thank you. Will add it in V2.

Thanks
Sunil

