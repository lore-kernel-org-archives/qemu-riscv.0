Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic2O-00053d-PW
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic2N-000530-Ub
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:03:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48877
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic2N-0000Sq-8q
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
 b=Hjw0DGqkKb/riXWMqn+f9iplwRDu8qEiXr7tpDYWrz02YwUD/zijRZCAqP1N92rrJUB+kl
 jn8Wtq6GG7URPz7yUT6gXDc8W5qSrIgBM2cSnJ0GY1dkng60ODEfUZ004HlPKCnOQFhyDy
 ZNG8Ih1pRxY1PZVTRR/xYk7/HNB6jyU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-UbU2WgXQMRqInTe6tV9ExA-1; Tue, 09 Jun 2020 07:03:19 -0400
X-MC-Unique: UbU2WgXQMRqInTe6tV9ExA-1
Received: by mail-wr1-f69.google.com with SMTP id s17so8416693wrt.7
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
 b=XzoK+Q/Fug5lAk0f79J+yD9YLGx25XJCvv2m6G1cH3r2G7WwSs1pZrMQJhehygO0fi
 aVLqx6vsOeuwcpHDKxX0xP5GKchBhs/AONBimqJ6dQsw+MLeeNCXOBosjCuSvhqc2pU7
 ZOamHVo7HB+96DajwhhKFkpyOGsCcVyPPlxoVEdLpaSHY/sU4ZQH/WdhI3WqB2DiGcjd
 L2Xbx5guMj8YkiCXojjU4NC6VObO4gc6Eav/S+7rUjhaLIQh22Gu31xueziLaiV9WHY7
 NCeastp7n8Ct9M+gob/eYFiszHBxJ41GBRp1O4f/YwjzjBZ38JTsaLmy3Xi6GR+7Y4d8
 dzcQ==
X-Gm-Message-State: AOAM533S5slHpXxa/aUNx/j9ta0pSqNNWpyV4p6X5EkNOHJeaRirf+dR
 oniTIwT5vlxPn7rSjqoJCp1ol/no0I7mPeHNNjVu/gXTjLT9frMTsOJj1OPFkheEvRsfuH7O/J5
 IbTC1SSx4rpP66a4=
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr3615824wrs.190.1591700597660; 
 Tue, 09 Jun 2020 04:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDvLBQJgRiWZcWe2u7EwQcm+tdrRwDV7JS7cSYFfquo5pnCwJjyQFwLMFNNTExDMlkFTA1qg==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr3615759wrs.190.1591700597265; 
 Tue, 09 Jun 2020 04:03:17 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u3sm2969549wrw.89.2020.06.09.04.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:03:16 -0700 (PDT)
Subject: Re: [RFC PATCH 33/35] hw/timer/slavio_timer: Emit warning when old
 code is used
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
 <20200608160044.15531-34-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0bc0385a-9738-a9ea-d3c9-115955d5e8e6@redhat.com>
Date: Tue, 9 Jun 2020 13:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-34-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
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
X-List-Received-Date: Tue, 09 Jun 2020 11:03:24 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/timer/slavio_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 4c5d65e391..16f21669bf 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -31,6 +31,7 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/module.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /*
>   * Registers of hardware timer in sun4m.
> @@ -392,6 +393,8 @@ static void slavio_timer_init(Object *obj)
>      unsigned int i;
>      TimerContext *tc;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      for (i = 0; i <= MAX_CPUS; i++) {
>          uint64_t size;
>          char timer_name[20];
> 

This one is okay.

Paolo


