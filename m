Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic7A-0001sP-3g
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic78-0001nm-G1
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:08:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58339
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic76-0001Cx-9u
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
 b=Arz7o03iaOA+++FSl3xM5f2P+H/WEk+r14FZIxPOcLe4WgutCRq3OPD0PPw0ohO1D0PXpP
 W2UZYB4LAmdN22UvwJEi/aVYk17vfpZnAkTYJTbt+ZTJRBUxyT1c+4dEVCOvuVo4c1Xmc/
 MhyzEnWz18ET5gzi1bUT4hgUPIXd/QY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-4FZttgKWOO65m0XaU-vXSw-1; Tue, 09 Jun 2020 07:08:14 -0400
X-MC-Unique: 4FZttgKWOO65m0XaU-vXSw-1
Received: by mail-wr1-f69.google.com with SMTP id c14so8418534wrw.11
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
 b=tpuEOTloIjtxMi51+2ah8ILBOfVHrlFSNNGEN27sjlc5+UixdVpdFF3/uIBksnXO8B
 SFw91UxjvbBShoPNetTSsTODI2N1Odg26aDEy6L78WmhrCxG+iktpdt0Gb4JFnokrPbr
 frup4HioZyxSD4KQ6gHx7eN5TEZ4TQxW72+TWHzNeopbVk1f4i5+gnpEnfTtQjSje5am
 CrYDUlmZgSePsXZHLQWou40iI2MvqAEh1prFzgrDjxnkmTFdCxGdYglDW+aoPHKjIYH7
 XwrWkJqvzENPIqIZRqJDEza2PcG95hUDe/PZQhy42JAKSPLlTG8bTp2lkE0R1Hf+xaCK
 DW3A==
X-Gm-Message-State: AOAM531Vgs8/VXa46cC3wBJi3Qwzc/qcN/7px3k2LdOjAOT2IJC3HAYX
 Pot017yuLW8NkwmUShZrBTYoQ0offPqunK6t4Zd8vrRo8fWllQdpckvD9ZX8EGq43FOK1Yd8Rbz
 Fa8Ipo+z3tw9AFcg=
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3428434wmc.10.1591700893213; 
 Tue, 09 Jun 2020 04:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdC3784/XM7YgW9UJ09UlWBbxHKdjVmbxcRKY6OuIHXNLH2XpKSYf455WgqT5IWKVna7+8aw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3428413wmc.10.1591700892989; 
 Tue, 09 Jun 2020 04:08:12 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id r11sm3060354wre.25.2020.06.09.04.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:08:12 -0700 (PDT)
Subject: Re: [RFC PATCH 14/35] hw/i386/pc: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-15-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <99a85bad-3197-6a74-5218-86f2326cd381@redhat.com>
Date: Tue, 9 Jun 2020 13:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-15-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 11:08:18 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/i386/pc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2128f3d6fe..c71809fd28 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,7 @@
>  #include "vmport.h"
>  #include "fw_cfg.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  GlobalProperty pc_compat_5_0[] = {};
>  const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
> @@ -348,6 +349,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
>  {
>      GSIState *s;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s = g_new0(GSIState, 1);
>      if (kvm_ioapic_in_kernel()) {
>          kvm_pc_setup_irq_routing(pci_enabled);
> 

This one is okay, GSIState is just an array of qemu_irqs.

Paolo


