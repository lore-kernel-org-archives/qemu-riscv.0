Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic5t-0000MO-Di
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic5s-0000Lz-FR
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:07:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46375
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic5r-00011A-Mj
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLtEn6u9uzHwCvd1JnB+QPNLdle/XjOro9YfrFmD+kg=;
 b=JtxmvSONAsm6XhHv31D6eIqHUVVF/KPH3pV0JakH8lAi3REA4U6NlrDxsYz59Y5f+zRRTv
 Qrg2mehFAk5eLmR6koKhkSmbpwFkKm+Q7rzBzTtnwWKzZlFGLlqiZNCM9IgRP22c4MnyS8
 c4XHCKSWTokWVBtBjMPj4lQm/tBGsS4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-087xBScYPxCHkiDw34GOsw-1; Tue, 09 Jun 2020 07:06:57 -0400
X-MC-Unique: 087xBScYPxCHkiDw34GOsw-1
Received: by mail-wr1-f69.google.com with SMTP id e7so8515205wrp.14
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HLtEn6u9uzHwCvd1JnB+QPNLdle/XjOro9YfrFmD+kg=;
 b=f1X75eYbEEL0KpipRed8a/UGvfIFDKdx6ADabXrsHB34z0XrU7e2Z36PTGgE/NiCwA
 YdC5jCRLRF0+EoxGR5GsArtee3+IEo0wTU3kUk4N4o50XdUGptWLCGv23f5dWyL2JwRf
 7mDeyT8qkXW6ytEkOVOkCEj3tB6XFwcffUs9F5vrvPgoU9w3sVEqn8kFkmAf/ze9nm7l
 nPwLjbXN8T2q42i8w10LE23p5b27f08WKW1xSDEvVQy7ctvLjFWitXLO6xNDyWkiaRNR
 K+aj+lOWGapn6vJxZKEQJKJnDU0BYC3ofiIhIe4qoRlcpbKBWUizpFijRyWE0E3MNcRQ
 QmWg==
X-Gm-Message-State: AOAM530R9J7bgB/IOevp42024MnZG9ZsRAIq7MqZ3hIshstVGaO7+q/O
 IkG96J8NmDJVC36JFfQ/8z9haJCRPzulRvd2tf3yYAqJngSDziMhdR8pWNYwJtOEMbv/KcTISH5
 3MgqwIgpk/2rTY54=
X-Received: by 2002:adf:e648:: with SMTP id b8mr3979247wrn.386.1591700816418; 
 Tue, 09 Jun 2020 04:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwoEAqomO/pDUWsIe68Vfly9NVZSlhu3lj0ZH+nYvBwJM+baKNFuGqYNGT83VHTTt9pGx/hA==
X-Received: by 2002:adf:e648:: with SMTP id b8mr3979198wrn.386.1591700816219; 
 Tue, 09 Jun 2020 04:06:56 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id q5sm2976228wrm.62.2020.06.09.04.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:06:55 -0700 (PDT)
Subject: Re: [RFC PATCH 18/35] hw/input/ps2: Emit warning when old code is used
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
 <20200608160044.15531-19-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f5e33299-a8b0-8530-c8d2-4d130291722c@redhat.com>
Date: Tue, 9 Jun 2020 13:06:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-19-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:07:00 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/ps2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index f8746d2f52..0d84061cae 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -30,7 +30,7 @@
>  #include "ui/input.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "trace.h"
>  
>  /* debug PC keyboard */
> @@ -1136,6 +1136,8 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
>  {
>      PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      trace_ps2_kbd_init(s);
>      s->common.update_irq = update_irq;
>      s->common.update_arg = update_arg;
> @@ -1158,6 +1160,8 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
>  {
>      PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      trace_ps2_mouse_init(s);
>      s->common.update_irq = update_irq;
>      s->common.update_arg = update_arg;
> 

While the keyboard and mouse are not QOM-ified, of the controllers
(i8042, lasips2, pl050) only lasips2 is not.  I would warn there.

Paolo


