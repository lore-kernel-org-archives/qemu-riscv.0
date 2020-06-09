Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic96-0004a6-2k
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic93-0004VQ-Tp
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:10:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48488
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic92-0001cO-ON
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
 b=IUtEUX9PAhCSJcmahcJ/4w1sbdQF3nspbEwgHY6JNdpfGYTp+0PrfvKPeqQUZp+BH+WHBw
 K1GOhzHJf13KFyEpFrAKHOEppm1PTmSX1U1lTTzBu3XTDfuCOPVjyqjm5kqgU90P964IRF
 lgfWWsyLs0N9INuMec9fvPHPlA5bEds=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-vJXuLm65OcaTngAGSD62IQ-1; Tue, 09 Jun 2020 07:10:14 -0400
X-MC-Unique: vJXuLm65OcaTngAGSD62IQ-1
Received: by mail-wm1-f71.google.com with SMTP id a7so530772wmf.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
 b=LbB7Sj7hgkxMwKbSR/QtwqvHpLINswFzuU0mf4ybMmDTXyvxo99ZQMkzU4EGj5jtJy
 xdQkxGrB4cX2Tj+0qcmGe9ELaMzSAINIebnEU1bfpwWx4dXJ17c5rOfG/YmFucyXJYN2
 fcFU3ypOtCpFxj/iCpu4N+x60HepwZiHDYXlwBrtGoxGd7YQ9uwQGYt3/0xSiV4gqEu4
 kVkLR3Gu6+MxSqpXH7GvEGdmsBXFIDAL2HeRRrYRrWpcrkDzKchclr4kUvNo+SIWp2ht
 lPpcK8xD8NTZhqmA2M9k+Oqz44gWqJe7p/c2DPKAuNXa/3Y6h0iCVXG11FxzuqyHyy67
 gXng==
X-Gm-Message-State: AOAM532PKq//Zc+FKD47tjJjpgheQEVAbJREl3XKRf1XbJqx7NO5RkTH
 CfTSuUdyhLkshU7tK0wQdygt2QvsO3Gtf1DS+ufOuLHsQJcTAzDaunRFa/GH0qrJm20YDDAK6eB
 5nS8w94NHmgEdvDs=
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3355949wmh.38.1591701013447; 
 Tue, 09 Jun 2020 04:10:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJZned0l+0SRbEeJRfGrfGSK0dv05DsTiejFW4ozxbhJOZqse/JM2i7IzQrf8+3BqinX/VGQ==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3355899wmh.38.1591701013164; 
 Tue, 09 Jun 2020 04:10:13 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id b8sm2981236wrm.35.2020.06.09.04.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:10:12 -0700 (PDT)
Subject: Re: [RFC PATCH 06/35] hw/timer/arm_timer: Emit warning when old code
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
 <20200608160044.15531-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57ccbbbb-2462-7ae3-52f4-c209a21795cd@redhat.com>
Date: Tue, 9 Jun 2020 13:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-7-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:10:18 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/timer/arm_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 9607366d78..e23e6b4b31 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -16,6 +16,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qemu/module.h"
>  #include "qemu/log.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* Common timer implementation.  */
>  
> @@ -175,6 +176,8 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
>  {
>      arm_timer_state *s;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
>      s->freq = freq;
>      s->control = TIMER_CTRL_IE;
> 

This one is okay, the devices that use arm_timer_init are all QOM.

Paolo


