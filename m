Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jicBB-0007Wy-A1
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicB6-0007Uj-U8
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:12:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20366
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicB6-00029d-1g
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
 b=ae0TnIQG62Gq7LjIYeArcLFlWzm75OBJp88b7BHEWevKk7EGRO1LbTnWnl+SH8hPSJVX8H
 YkEeMhYn9NEdSJHZdXFatlIRERQOwPUqApONZXJLR+2oiA/f4Vs5iHPxYCwOsvJ2Jf1jMs
 n3JloEgmlmeCiwf6MER7AXTQUjehbOs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-9zVJz7jWM5aKqzw6tnBbFQ-1; Tue, 09 Jun 2020 07:12:19 -0400
X-MC-Unique: 9zVJz7jWM5aKqzw6tnBbFQ-1
Received: by mail-wm1-f69.google.com with SMTP id h25so789197wmb.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
 b=qfDFfVxIGkLauPFkXsrn/E7sogNe1d7RJtBOoWZcSEq2z2COFnITqaLN9k9U+SAtaj
 FYq1NiFTeclgpWdTh9w8tOH/qzelFg83DWfefWSDGdNk2ErnOSARDCBtzvk63SiY4lTc
 wMYMoOUhDh8mx6Q3lE8xS5ByP+ETooPp0liO+icvmdENZjGJPX7H/91S4tiVwB6em2Oq
 wIlGt12Vg8hJjHciVeNfqxxGnR1O7KM4D0Csg6W8fTUfSec/HNKtyQJ/SRvpbXQ1MYXt
 2UARimpnnjWmNyipnUhR3x+6cuLmd9ED/9beae6/R4m2SeZvBfWHI0+5Ud2H+ioBBkqc
 JBMA==
X-Gm-Message-State: AOAM5301Vy3WE4LsniGN3XmpCF3nvK7Jlcbz75RIwYU/hQqVqz7tUAgM
 bVFA8p+Mq7ppmLOCpXMIu2HSusLzdzSt83eHIpygSI4r2U6atYvO4jnjrOMFaXAMf/z/ns7s4Hn
 HqoNQytxRotmNGTs=
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr3433694wmi.48.1591701138456; 
 Tue, 09 Jun 2020 04:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0awk5HkX0L04n6QbPdprXKsckBJOO0WwKyuM0S0l/M/wQqyP9e9ViVkr5nd7Ja+7n12153w==
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr3433671wmi.48.1591701138230; 
 Tue, 09 Jun 2020 04:12:18 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id o18sm2614689wme.19.2020.06.09.04.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:17 -0700 (PDT)
Subject: Re: [RFC PATCH 30/35] hw/ppc/virtex_ml507: Emit warning when old code
 is used
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
 <20200608160044.15531-31-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <85d75dcd-f08c-0506-46ee-97e2b5869e0b@redhat.com>
Date: Tue, 9 Jun 2020 13:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-31-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:44:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 09 Jun 2020 11:12:26 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/virtex_ml507.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 0dacfcd236..17b8036c38 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -40,7 +40,7 @@
>  #include "qemu/log.h"
>  #include "qemu/option.h"
>  #include "exec/address-spaces.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
>  #include "hw/qdev-properties.h"
> @@ -95,6 +95,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>      CPUPPCState *env;
>      qemu_irq *irqs;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      cpu = POWERPC_CPU(cpu_create(cpu_type));
>      env = &cpu->env;
>  
> 

This one is okay.

Paolo


