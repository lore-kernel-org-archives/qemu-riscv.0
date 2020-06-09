Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic3t-0006Kt-9a
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic3r-0006K8-S6
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:04:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42170
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic3r-0000c1-4g
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
 b=hEjwbb2YOQOWaMHpJZgCRA1Zh1bkdkTpVgMFBS/q95ym48i0G2lOrt1emqouh4up3714dx
 F/lqTks4o3NgeUfxDEpsQdLrAYZPQADal7Z4su5lYWWnakdpriZ1jM5vkk4wfJ/fWk+EL9
 NctG00EqnsOMyuEFKbkZVMt4weuXiwU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-N3yWcvzyPWWnL7I-tDdiHg-1; Tue, 09 Jun 2020 07:04:52 -0400
X-MC-Unique: N3yWcvzyPWWnL7I-tDdiHg-1
Received: by mail-wm1-f72.google.com with SMTP id x6so595642wmj.9
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ki/NH7KwE2iZfzrfj27y3fd4qwWI07EUloemfjIHR0Y=;
 b=S5pxSwRQjPEqyReoVoAiJ1sN+UH102gHbZyiBZ5BCR+X33JxVBNVhGbp5K2mqNDU5P
 tIL5FlKO6QiQau9GtOmiq3zO1fRENWfaja2hgWf1zGFRWgQ4kinc1FdLCQPz9bvCc6nD
 RroPt8hfL2xpsjIloWq18gg6U591exF5AqeuvtaAYAdVlwRK4lV3EQZ/KSusKpSqaVt2
 i7VI7TCYWUc9rzn/m3tnJ4F28fccaoCzV2um2HDAlJEJsfgq+jg8CpmfKHaGSfchHLuO
 6vki70+DnimYAXO4TqMIBZf9jWjpfuSuroNT6/meaVuQWkgNk3U7cv4aD2HiBVvxgMCM
 MGxA==
X-Gm-Message-State: AOAM530hJt4pQ9kMWbdcElcYavVe1TvQRhprniRk0ZvfK0x6xQrmTqjX
 AwYww1G+vNBPHZ0vZQiCRFbbiXr+E1oQllUtR3FpFXwnX8xrnOGYLFBlHv4lIKCMXGOcfMZgCSb
 Mkc5YPMrvgZr/g6k=
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3608977wru.427.1591700691533; 
 Tue, 09 Jun 2020 04:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw61DF3zQg2Ykdl+eVskia6XAOI0NHB76zgWVAci3VuUK5xBuVU12NxurjEhvkEdodKHniwzg==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3608951wru.427.1591700691283; 
 Tue, 09 Jun 2020 04:04:51 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id e5sm3132662wrw.19.2020.06.09.04.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:04:50 -0700 (PDT)
Subject: Re: [RFC PATCH 32/35] hw/riscv: Emit warning when old code is used
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
 <20200608160044.15531-33-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78a05ce1-ce9a-431a-69df-77b0a8fcfce9@redhat.com>
Date: Tue, 9 Jun 2020 13:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-33-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:04:56 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/riscv/riscv_htif.c  | 4 ++++
>  hw/riscv/sifive_uart.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
> index ca87a5cf9f..bd080dbefb 100644
> --- a/hw/riscv/riscv_htif.c
> +++ b/hw/riscv/riscv_htif.c
> @@ -30,6 +30,7 @@
>  #include "hw/riscv/riscv_htif.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define RISCV_DEBUG_HTIF 0
>  #define HTIF_DEBUG(fmt, ...)                                                   \
> @@ -238,6 +239,9 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
>      uint64_t fromhost_offset = fromhost_addr - base;
>  
>      HTIFState *s = g_malloc0(sizeof(HTIFState));
> +
> +    qdev_warn_deprecated_function_used();
> +
>      s->address_space = address_space;
>      s->main_mem = main_mem;
>      s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
> diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
> index 9350482662..1a5890d5f7 100644
> --- a/hw/riscv/sifive_uart.c
> +++ b/hw/riscv/sifive_uart.c
> @@ -25,6 +25,7 @@
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/riscv/sifive_uart.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /*
>   * Not yet implemented:
> @@ -183,6 +184,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>      Chardev *chr, qemu_irq irq)
>  {
>      SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
> +
> +    qdev_warn_deprecated_function_used();
> +
>      s->irq = irq;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Not sure why this code was accepted, furthermore it should have been in
hw/char.

Paolo


