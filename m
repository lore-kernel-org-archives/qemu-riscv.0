Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic6a-00017G-9R
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic6Y-00015e-Rs
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:07:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21007
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic6Y-0001A2-55
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
 b=e2IEnfdQWdBVF7fOMhNkMAlRPH0V0QEiJwDvKGK0XZ65PSzFmyXu9PflCNfWzDjKBdV6la
 2eDx44hKrVweuos45AntfT5qWKrQBV5v7TEQzRuaoeM8ajPjFFPaGB0EHGNtpYFZ320tMd
 71o5WvUFMdfJBxKt9tNaqwsVTEffMjI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-jKTgm6CuOi6DzE27zlZFXA-1; Tue, 09 Jun 2020 07:07:39 -0400
X-MC-Unique: jKTgm6CuOi6DzE27zlZFXA-1
Received: by mail-wm1-f69.google.com with SMTP id s15so598415wmc.8
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
 b=lTqwLtDqmZn2e0kTcgqEH+AlTK1F4uP2OYsCUbBJlO9aqvKbK+n0bUIuWXpDsBWH/K
 UptKeXiW2nmhOzW+sM2H//romByEEoCfniIbrKoACtkpdl6mN3mdwTMbaSjaMvVFabtU
 GADIt3snAVBooja25nCZrGtyFj95Z1QjppwTaDId6ZGWGqcNMwBDQUHOnnOl3TM7k1M0
 jqz94Fd48ZMCAS6dtb3cJBWv0aWcwfnqpg9IRU4iDsrG0ha9wpemQDafwppYH3zrNpx9
 FzJxT3vlvP/yx03LT9sxtdztHk2+Q0rXZIY3lhsTGi2ScpiCEv6RToKWjmyKeHozGRci
 FD6Q==
X-Gm-Message-State: AOAM531w1Yx9M2rq8Efrq6W2UT4Nu06pzMJ/bHKvVHD0Kqznj0zn2Cvh
 VLmdUvnm7Cqe/MTOKFUv5uGNwgV4vsXMluQGY0fAPnx7mmMu8RlYK8h/5pKYQ6rR0b/jyTWyRjY
 HYgi80vmnNPkyuSk=
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr3381159wmf.11.1591700858745; 
 Tue, 09 Jun 2020 04:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmmnUl8eLPhmEPFuKu6sJiacZuSMv+9NuEpBWzXhQnd/T9N7bfObZmAohH0mdSOoMNNOmGLw==
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr3381101wmf.11.1591700858431; 
 Tue, 09 Jun 2020 04:07:38 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id s8sm3061694wrm.96.2020.06.09.04.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:07:37 -0700 (PDT)
Subject: Re: [RFC PATCH 17/35] hw/input/pckbd: Emit warning when old code is
 used
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
 <20200608160044.15531-18-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eaa0d68f-bad7-506e-d95f-5a3da2baa180@redhat.com>
Date: Tue, 9 Jun 2020 13:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-18-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:07:43 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/pckbd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 60a4130320..c7f42be63b 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -31,7 +31,7 @@
>  #include "hw/input/i8042.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "trace.h"
>  
>  /*	Keyboard Controller Commands */
> @@ -467,6 +467,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>  {
>      KBDState *s = g_malloc0(sizeof(KBDState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s->irq_kbd = kbd_irq;
>      s->irq_mouse = mouse_irq;
>      s->mask = mask;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

The ISA variant is QOM-ified, but you placed the warning in the right place.

Paolo


