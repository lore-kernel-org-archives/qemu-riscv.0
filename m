Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jicCf-0001N3-N6
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicCe-0001LU-5Q
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:14:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44707
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicCd-0002IJ-Hr
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3lzSLGxJ8WgRzoyp9NolnrgEUC6tjBqCyG0KDbIHi0=;
 b=Rg2sDSqNz6mSUZRA+rtHXrL0X8hkZG8/Yib8T5MElWpJrvDYFLsgJmBy9lW2UeYM51StFY
 UkcWSQS/PloyuYYy/Xpjjf5hprG+cxGSoyrT/2VOiHzaJ/R70EN8uIjbVsKR845DSwfMV9
 5lYphO8PLBcT7vqcyC+3RT0K3+anc6o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-Pmj3GXeZMvGn5qwbtNI7oA-1; Tue, 09 Jun 2020 07:13:57 -0400
X-MC-Unique: Pmj3GXeZMvGn5qwbtNI7oA-1
Received: by mail-wr1-f70.google.com with SMTP id f4so8481647wrp.21
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O3lzSLGxJ8WgRzoyp9NolnrgEUC6tjBqCyG0KDbIHi0=;
 b=PYTqm37B9MrjiUi7ZyeRIylSeMgQlTjjxRAlJPJCbKHlkcxrh8HtsBdL+AdmHpATZd
 ldjLA+33QjnnDapKUOnxaB7YR1DMzS9gxjhqo1rId+cdYSxp4SiP5jJOZcfrZUiXEevg
 Dw2ZZYJi2Idz/qLsSqdNkjrflwxNaX7BSv6xWwps4CY8EKOPv/MrfQvI7sBp0MQIuyQh
 d3saSN0BG8burmgtbmt+k/7RMnTa8pnHpCC4kh3DCYxT9yTqqM/od1xeDjqXwRZmzZzH
 B2G8o5aI1uAjFlfPVLxNl5tfkd1jIPS5fob6st/iAF3E6iaG6QygIyh3FIwK8vvuQc5p
 F59g==
X-Gm-Message-State: AOAM530mFf90tJFvouuePsSCeQdOwIpecZ2/LcYBNdzO9l6D5TYoWBnI
 QLjSFrRTBUJb5fRSc2ZeNRc5zbjAlbZ3B9AKcCGaVNxHI6h4NxephK9G5JlvEdWs3vblPJ8c8De
 Pl669YWB3cOBweY0=
X-Received: by 2002:adf:f582:: with SMTP id f2mr4186322wro.204.1591701235064; 
 Tue, 09 Jun 2020 04:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7CEeV1+7lXiLRFYok5rBbukk8N3FMNoofh40xzDiHh3/3TzmlrCYg3pn55HLPW4csjHJ2JQ==
X-Received: by 2002:adf:f582:: with SMTP id f2mr4186295wro.204.1591701234805; 
 Tue, 09 Jun 2020 04:13:54 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id 50sm3179768wra.1.2020.06.09.04.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:13:54 -0700 (PDT)
Subject: Re: [RFC PATCH 26/35] hw/openrisc/cputimer: Emit warning when old
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
 <20200608160044.15531-27-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4cdb0948-56b8-6d72-2030-ea00186c47bc@redhat.com>
Date: Tue, 9 Jun 2020 13:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-27-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:14:00 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/openrisc/cputimer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
> index 93268815d8..60f2c9667f 100644
> --- a/hw/openrisc/cputimer.c
> +++ b/hw/openrisc/cputimer.c
> @@ -22,6 +22,7 @@
>  #include "cpu.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-deprecated.h"
>  
>  #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
>  
> @@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
>  
>  void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
>  {
> +    qdev_warn_deprecated_function_used();
> +
>      cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
>      cpu->env.ttmr = 0x00000000;
>  
> 


I was about to give this a pass, but if we did so it should be the CPU
itself that calls cpu_openrisc_clock_init (not openrisc_sim_init).

Paolo


