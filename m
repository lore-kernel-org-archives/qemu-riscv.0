Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic4I-0006mm-4l
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic4E-0006hA-OZ
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:05:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55467
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic4D-0000he-NC
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4OQhSEiQViO6+Bf5ntoxU/3fnBLGSIOBfTZnNbLbrw=;
 b=Uij1c86O2ixWxUVUr1uXRE8jDdgna621SI02X5kCtFw/0gM61mFNm3Wq+iJH+eWVy7SlFu
 7xJtOICbDljCGkodyfgD4vAduqPE+gjdbdfwhdYt7sczKmYTRPjpCs4vNPSI+U9AFp96gT
 rHZMMBE1Spvf0iKGiCTPgf9xANqxswQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-4S4aukoSO4mXCMjGlRj6mw-1; Tue, 09 Jun 2020 07:05:15 -0400
X-MC-Unique: 4S4aukoSO4mXCMjGlRj6mw-1
Received: by mail-wm1-f70.google.com with SMTP id a7so525928wmf.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S4OQhSEiQViO6+Bf5ntoxU/3fnBLGSIOBfTZnNbLbrw=;
 b=sn2JFWACvb1x125vm5awajX9K3tdOJ+tazTxuQvddOIU+zmwfMI7QZExuTE8Ce8aLF
 rJW3fq+EuPCmYkgQVyFoO3ECgyyENQEvAnAlVXzA1PqtnPEz67dFDf4I2XQsOkU1CLUe
 cmukN91szqIEduYL/Ha1aJoXtnKkQ1OZKEXghz+clFh/EcrUOEtgqzdLFppb83Qrze9t
 RiUI67EUFgMJACYVoRvC/xJ2ZE0L7E/VnFciI1HAyODdqwMu/HtOZ0VNxvNo/l3H6owr
 Hl3vy4W8XifbTym2Q9hfyPGquP73pK4b8mEt7oklIQIZixHWSiJ/Ze3ssfQmj2LrE838
 wVhw==
X-Gm-Message-State: AOAM533/sjfnyyANb8PRCmxNJzxYsFVR0BiQpNaOMac6H9gAMCi9n0tM
 d9wbAFGK4pOAeegzIXw2pQA2SRdnXBlkoPBX4bWqHrHzGagbwzap+jlrn9ZInBv+FYQB79hm5T6
 1sYBO05QMWelAvA8=
X-Received: by 2002:adf:ef83:: with SMTP id d3mr3590955wro.145.1591700713616; 
 Tue, 09 Jun 2020 04:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypMcVAQwaW/I6vICjH3pnYoVeg7kiHWBRxB9LtVfTU1+Z7wL7jJgUZk4SDqi6hRzq7g/7iig==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr3590931wro.145.1591700713378; 
 Tue, 09 Jun 2020 04:05:13 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u7sm2957241wrm.23.2020.06.09.04.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:05:12 -0700 (PDT)
Subject: Re: [RFC PATCH 23/35] hw/misc/applesmc: Emit warning when old code is
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
 <20200608160044.15531-24-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac20d382-3ac3-5c29-8e1e-e3ba1d424138@redhat.com>
Date: Tue, 9 Jun 2020 13:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-24-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:05:19 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/misc/applesmc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1c4addb201..d63f19038d 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -36,6 +36,7 @@
>  #include "ui/console.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* #define DEBUG_SMC */
>  
> @@ -253,6 +254,8 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
>  {
>      struct AppleSMCData *def;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      def = g_malloc0(sizeof(struct AppleSMCData));
>      def->key = key;
>      def->len = len;
> 

This one is okay.

Paolo


