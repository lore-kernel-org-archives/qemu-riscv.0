Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jicBM-0007l3-O5
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBK-0007ex-Bz
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:12:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26781
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBJ-0002BB-NP
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
 b=S9vVCiqCX/gTdDpkyp3ywYIjT5rzt7tPsLyG0/B95yBQuCPdIytCHIhvWBhifSATDkg3q3
 NgeTnKjT3n+D7XoNLLqZmubfSMuaE0Pl7FMKfa8pgjwNoau2sUQWAKEnaH220Dze97synb
 MvRsUCNA1ZvgpsgiQBmQEFowdgpR5iY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-MeM1Jxx1Nte2NfRhr9hPaw-1; Tue, 09 Jun 2020 07:12:34 -0400
X-MC-Unique: MeM1Jxx1Nte2NfRhr9hPaw-1
Received: by mail-wr1-f70.google.com with SMTP id e7so8521132wrp.14
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6lAgcTDN/dV/f7SK/NrjUs5/i9Qjg44Eo04qPw3cNtk=;
 b=Sv6joZZpLAYEk+M5TyvFOYsPPpirMgIl00GWRXoVTefrSgvrrTO47lZTlJX8wLkCT8
 mLyanEYyAb+Bq0Ja5RRTrjQ97Haob4BQgiTEkAsY3zPJ+imKJNomTAtbFi2FPf4mAgh2
 Ssc0TytF0V3HpygVfE+SGLSsxJAMLeZrk48dUM1QY0iauxM3K1whO8ILEjDfc9aRgSPQ
 LYUdPpfOQCauJL0JVtXUxkSnAGVVPfs4wv7wBuCv8/+xZkcMW1veVXpe9SrcgWI5HYt8
 J9i6uYWl71xR/Ko1PMraMw6rSCaehkzlcrsb7qCPkXSiltubxtgFTpCODJKanN6QNXj9
 9Nsg==
X-Gm-Message-State: AOAM533fcwZx6vejmt22b3F6mZs/u9AeaUOhXmNZDmlk3XFIJGBz+N0e
 bUkMthZMpELdP3CBfrw1s4PI0iX+Q3b7bM/1BmGNc6WBeb4vCHM9jzlAg+LRlaI7lufdGSPU9hJ
 5mZINxm7QtADnB6U=
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr3257035wme.141.1591701150721; 
 Tue, 09 Jun 2020 04:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwew58hVelVmOrF+efwHZuIRFPhx2tAfnSXNsxzJkV6M1Bdv9a4oEF967FsVILY6ztkPcXqaQ==
X-Received: by 2002:a1c:a7c3:: with SMTP id q186mr3256994wme.141.1591701150493; 
 Tue, 09 Jun 2020 04:12:30 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm2587221wmg.32.2020.06.09.04.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:29 -0700 (PDT)
Subject: Re: [RFC PATCH 29/35] hw/ppc/ppc_booke: Emit warning when old code is
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
 <20200608160044.15531-30-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c932d51a-1b7d-bec3-5dfa-222c9ba5090e@redhat.com>
Date: Tue, 9 Jun 2020 13:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-30-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:12:38 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/ppc_booke.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
> index 652a21b806..a9e5e68578 100644
> --- a/hw/ppc/ppc_booke.c
> +++ b/hw/ppc/ppc_booke.c
> @@ -31,7 +31,7 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_ppc.h"
> -
> +#include "hw/qdev-deprecated.h"
>  
>  /* Timer Control Register */
>  
> @@ -338,6 +338,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
>      booke_timer_t *booke_timer;
>      int ret = 0;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      tb_env      = g_malloc0(sizeof(ppc_tb_t));
>      booke_timer = g_malloc0(sizeof(booke_timer_t));
>  
> 

This one is okay.

Paolo


