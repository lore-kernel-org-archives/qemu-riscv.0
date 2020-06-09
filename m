Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jic9v-0005i2-OP
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic9u-0005fa-HX
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:11:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53869
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic9t-00022j-Kl
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC6WEmr69REgLn2lsRvv9NiGoR/bD5T6HVmJ4ITPF7o=;
 b=MKUqEEYxr+tXS/WnVImsNVkESZCN52rzgnGVVqCOo47TU9mBwPU7xgPtfJqSU2yicTt/c0
 kqm3UXwsk6R1nlldv+2Yuc8xZHoR2WQvCO8yBXP2Xfa60juhVkINNCJTJM+V+9qUIcS1bM
 ejboYQ2UZdp6GUZ9WV8DPfS1HSPgFR8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-Y5Bm6fg8PfeKfgzT-hNcMA-1; Tue, 09 Jun 2020 07:11:07 -0400
X-MC-Unique: Y5Bm6fg8PfeKfgzT-hNcMA-1
Received: by mail-wr1-f71.google.com with SMTP id m14so8463037wrj.12
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gC6WEmr69REgLn2lsRvv9NiGoR/bD5T6HVmJ4ITPF7o=;
 b=MOnz/QtuzF96aHMSVH/gLAIRrob6v/Q3uxvmw8Ub/VGdNhqUxdrtfeEAgZ7Pu6g1cJ
 aNbeLlHyNVU74z+EaPZiu8pCe4lr+S3UvHscvL+XON620OWXuTG02L3Mz0/EqdvZrcT0
 TWIvfZtmdCrPAVJqVxAY6KTXdVN9pKSyTpFM9muYZaFOrIeZd2jnFPuK11D3TLRCf2pT
 9728fQmVRlzKfOiF+wv11eX39qIgthDKfzd2AuhmySyO9RfAc47mq2fplBo34kJfuo3N
 qRh1s3/u8sdJVN39Dz0MmD7zkvNlVkGJBQdfp+k1NgliIHD/ddXHezYK7gneU/YsGGJY
 mpiA==
X-Gm-Message-State: AOAM531eouisW36j7F17/393HVswtQefQ2eSWlFE2HfcOCkNeLSm5gxa
 BgUNsMCZ1czAgpS8rMwI9chkOYq339TRIRlXhzVIz9PGAPgGMCf+4Ogl4E3fcOCF6BFlvqtIICJ
 2i9Y5wtTeSMZn9X8=
X-Received: by 2002:a5d:628c:: with SMTP id k12mr3812466wru.211.1591701066332; 
 Tue, 09 Jun 2020 04:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY3Up1ym4TzRU1NS9l49R/XWUODvDMW5M2cEwgU3BofYT4BEs0ckiayOWBTvyLMfPr7vv94w==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr3812427wru.211.1591701066086; 
 Tue, 09 Jun 2020 04:11:06 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id r12sm3176227wrc.22.2020.06.09.04.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:11:05 -0700 (PDT)
Subject: Re: [RFC PATCH 21/35] hw/lm32/lm32_hwsetup: Emit warning when old
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
 <20200608160044.15531-22-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e036ca7-753b-55fb-3a19-7d50f5b6fd19@redhat.com>
Date: Tue, 9 Jun 2020 13:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-22-philmd@redhat.com>
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
X-List-Received-Date: Tue, 09 Jun 2020 11:11:10 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/lm32/lm32_hwsetup.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
> index de94de177a..f4a4d8fe4b 100644
> --- a/hw/lm32/lm32_hwsetup.h
> +++ b/hw/lm32/lm32_hwsetup.h
> @@ -27,6 +27,7 @@
>  
>  #include "qemu/cutils.h"
>  #include "hw/loader.h"
> +#include "hw/qdev-deprecated.h"
>  
>  typedef struct {
>      void *data;
> @@ -57,6 +58,8 @@ static inline HWSetup *hwsetup_init(void)
>  {
>      HWSetup *hw;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      hw = g_malloc(sizeof(HWSetup));
>      hw->data = g_malloc0(TARGET_PAGE_SIZE);
>      hw->ptr = hw->data;
> 

This one is okay.

Paolo


